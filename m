Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web09.20480.1607112477335368079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EcLNhZS7;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id qw4so10409103ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lZgDTTSEJ1Ucy+brcoKFAi14b2sQ840/PV5Nl226fHk=;
        b=EcLNhZS7X/r/VD589XBxjhz++zoz9NE5IjPyaZxx84vE+O+tEOuxQczuZSNOFPbtO8
         PnVgNwgKg4yZqCLnpvrZmoYx6ycAgB9nx23f+vTsMaZxeWQaUvcNDNtUG2PbMjj1iSd1
         eXNU8/4S/Qb+oxK6ajTcONnnVga5TAmeHKEQIvrM3Gbzt8GWC3LF8P4wx5ZVRsCYtxgn
         SbORLaME8N3i8h6GIGdMCh/UaU3+4aDDE9wfE8Klwav8Lh4RwZp8ctP9ZaC0ZcawWWDc
         SxQXthXOEW/1oue/Xf01HAxbs6Fh0DmhJAujBD4phtEWhhGAE3nxY6e/ejLh+KIM+qdL
         A7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lZgDTTSEJ1Ucy+brcoKFAi14b2sQ840/PV5Nl226fHk=;
        b=Hy8OewPILYpWZaiXsWMudzT8KMfi9YFd0Qdncxcw+NsFXOh3gK3FFztCTr73nqugv3
         qUfjhnHln/NjnXNeU/9kqK01tU8TlZcrM4UJ3g7IaUdW3n3UpBtSF2bpLRKRnGfVI6ha
         xxLbtyqWnvGslUcSoxTSJUV/YOK5lop+x4oFfbwUSYPC8Eh2NImKprUmYjjvIT96dLGm
         Y4riZDdRk4ZHtxzhzduHYV9K11BzNnKwvLxyveRas0EIHHUmA9Yk3YEQiIcCDdWuCtR/
         Qhb6J/AO1NcMG0GebwJkJLJgqWiXP1/h1+3AX6kTuOKa2QiRB12m2AHPvC3mvTkn6mtA
         bWqg==
X-Gm-Message-State: AOAM531Sw9QAGziVW4pMeCP3d4klsOEpbVUq8H2r0lN7AXeOElRxXrsJ
	QnRJU+qo47yx20niZU6Kr08wkECDvQK4Nw==
X-Google-Smtp-Source: ABdhPJyXFAlW8ncm+vtbvwLaaOk9/hyvao+DLzy1T+RvjdhB5XA/Vv2lrWC16uyi7smrlZd/tJtCrA==
X-Received: by 2002:a17:906:cec3:: with SMTP id si3mr8598373ejb.277.1607112475723;
        Fri, 04 Dec 2020 12:07:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:55 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 12/23] acpica: upgrade 20200925 -> 20201113
Date: Fri,  4 Dec 2020 21:07:25 +0100
Message-Id: <20201204200737.7072-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../acpica/{acpica_20200925.bb => acpica_20201113.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20200925.bb => acpica_20201113.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20200925.bb b/meta/recipes-extended/acpica/acpica_20201113.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20200925.bb
rename to meta/recipes-extended/acpica/acpica_20201113.bb
index a6d8d67270..f2d17ca54e 100644
--- a/meta/recipes-extended/acpica/acpica_20200925.bb
+++ b/meta/recipes-extended/acpica/acpica_20201113.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d44388e21e3d2e47c6d39e9c897935d3f775f04fec76271dcba072c74f834589"
+SRC_URI[sha256sum] = "48c4e0c07b42581d017487cc9264470e6420605ddd24cbb5d16410d02a771461"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.29.2

