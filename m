Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.1203.1604335771410303246
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=n3IijoWt;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id e18so3869890edy.6
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EiYBy9RSh03YAyk0oTC/oOSXRt9j3l1dZAUonuaLyQA=;
        b=n3IijoWt+Y6j9UDGKlbpT4zxIqle/fSY4NxMrADUu4VIQj1AezHWM6a/mcp+0PSmLS
         VD4FtmBP4jmfj8EKBdpQKWnop7Iqf4+iAkaV3aWa4cayGx/lknZGsyzEno5EyLW/ance
         i3UZmaw6YlFeEWBzEs5Pb69HHy+IqMLfK2pbNnzAf31rAAqi9c0n9kREGICMb0+10zzS
         V5J3b3Q/Oz0lp2dQSqO8OIXBzl+/I4CsjdLcsyQC9IGwsaP5viglDw2uD0bF4I0O4bgX
         ZwLgTGLpPsI1onPI31jbp47hshht9xT1AuTYiaWuql23jF0WIlNr4xzJd9TGPQ7AYZWu
         Zwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EiYBy9RSh03YAyk0oTC/oOSXRt9j3l1dZAUonuaLyQA=;
        b=fZ0DWsimj/sVhcBCXkTeNVWPVI3lKskFHnidBPz2kFKcxCVIHTHc20Hpn7VgCh1dJ9
         PrBvemiPjjjmva2KUgICo38hdpiPV3ovHcQLgrB8DQ4SWLGT7KUe+BD3Bb0NDXg/ojOM
         WfjNIFVdXUtBo0OYpnTLuIDpODviFUczvt7iBXwv7oBaSXzAw42qnEs0iHC5EJBUTnje
         m+hLeAOD6e9AkxaxUTYtHD5rHXTpwSoIIvWccCyQw/0mB2LKwVUj2VPh8DDswcBqQbxP
         /W2K36Qla/9FKU2X7LlSiw1WkHZcAh4F2y/YoEzIT6HDoHMqp91GjJe/5kPYtWX/C+rI
         x2tA==
X-Gm-Message-State: AOAM531bMMSVcpC2Sbb34BMof9qEZB9cSyEunvIafWIcoeFa7csJccEg
	7JyXBXrQpu/nufbAv1vxD4osABaCTCkt6Q==
X-Google-Smtp-Source: ABdhPJww0sBybShHag97+FPrK/9lRXHLkz7F82cJ7JMM2WNjWL10x03VO2V+jmPnzGAABLMOWqG6sw==
X-Received: by 2002:aa7:d394:: with SMTP id x20mr17451177edq.14.1604335769786;
        Mon, 02 Nov 2020 08:49:29 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:29 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/80] bison: upgrade 3.7.2 -> 3.7.3
Date: Mon,  2 Nov 2020 17:48:01 +0100
Message-Id: <20201102164907.27572-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/bison/{bison_3.7.2.bb => bison_3.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/bison/{bison_3.7.2.bb => bison_3.7.3.bb} (93%)

diff --git a/meta/recipes-devtools/bison/bison_3.7.2.bb b/meta/recipes-devtools/bison/bison_3.7.3.bb
similarity index 93%
rename from meta/recipes-devtools/bison/bison_3.7.2.bb
rename to meta/recipes-devtools/bison/bison_3.7.3.bb
index ace4ea5c3f..74532caec3 100644
--- a/meta/recipes-devtools/bison/bison_3.7.2.bb
+++ b/meta/recipes-devtools/bison/bison_3.7.3.bb
@@ -12,7 +12,7 @@ DEPENDS = "bison-native flex-native"
 SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://add-with-bisonlocaledir.patch \
            "
-SRC_URI[sha256sum] = "7948d193104d979c0fb0294a1854c73c89d72ae41acfc081826142578a78a91b"
+SRC_URI[sha256sum] = "88d9e36856b004c0887a12ba00ea3c47db388519629483dd8c3fce9694d4da6f"
 
 # No point in hardcoding path to m4, just use PATH
 EXTRA_OECONF += "M4=m4"
-- 
2.29.0

