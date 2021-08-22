Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.9622.1629636704515484645
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UMyhvtS7;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id k29so21770757wrd.7
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eYGaq0/hUGn1X/Dg61zbM6H37/9KGiHohXvWmhmLIuA=;
        b=UMyhvtS7PwxsE7v2P5oAjRIsej4So5Tm41zxaS1BuI3wjd7s3OGBQ1b0bnvYJAWD2q
         j6A4siVDVzZF+GoSj8RJKPhV83WMW+IqagfwkoTvr5ZbyU8TxdvXtpxXHgVZEJBMdPfu
         aDq3A658TENmPuyXRwcc8tkXgEo9RqllQSAlx4INlhlQzyKsh/rw2JliwPcUlUBBXTBv
         dsya95IgrDGkDmfBmp7oq1nySow4SUOuoE2eItvJx3Vb1LcKFFXa73qDLoaEvq08E+xd
         v1eBcZqO5jFTx3j+d1PoFOIDMLFJsatKDjpC/yeeuuWwTvFPMi1hRTQ9TnF8h+cxK/FV
         52FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eYGaq0/hUGn1X/Dg61zbM6H37/9KGiHohXvWmhmLIuA=;
        b=Xfn4LabsQcpTlVAEkyZw65ETXfDdr8hXU3thDYNpPNUsgwCfXX7ocf+RzfoVEkqRFa
         vxwZ/b8CAjoWEvRuo5+pnnax21Rq+DhbHgO3sU/brc/i3TjFujI/dqJynyrBSzCXipOw
         rJmJU8HfATvsc+tMkJ+Yp3eXIr5CKw2zz9DPGokJqYKyyh9iQzdppl1fwQ2uSYOb417+
         A0npnwZutayLs6nvRmh++RP2stJsffsAopIBfSt5Fpr4EtpU7abL1LzqanQUkd2D9kH1
         Pj0g/unZihluwVTAssh+q8frX8eW5t/+dzGRSCihcbrbm5TbgLHZRx4XUn2WP3LMnaGl
         8eEA==
X-Gm-Message-State: AOAM531oHdEbBmoS0K5zUhoKj2RY3Gj1lkuZq9dm0WnaSBseBIkYaK4h
	cP1XM2wkrBvcQaODZuQ726aj8UNlOrrZmg==
X-Google-Smtp-Source: ABdhPJxVELDD3MDs0es3ExBQPcDeejOotLyipGr6+9P+8jT/lqR8SrQ/UVRRbnhv+inavLNH9FdWsA==
X-Received: by 2002:a5d:58ce:: with SMTP id o14mr8337228wrf.319.1629636703197;
        Sun, 22 Aug 2021 05:51:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:42 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 47/55] wireless-regdb: upgrade 2021.04.21 -> 2021.07.14
Date: Sun, 22 Aug 2021 14:50:55 +0200
Message-Id: <20210822125103.310416-47-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.07.14.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
index 7b54d8c059..a396f15c55 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.04.21.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa"
+SRC_URI[sha256sum] = "2e2dd216a5f1a310b849774af63e6309d94c2207c34771a534c47ae18b162742"
 
 inherit bin_package allarch
 
-- 
2.31.1

