Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.9822.1620227944857971618
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RnySVY2n;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id l4so3425862ejc.10
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhssb55yfZWZL4puyVbnzotNOq05scdxdGNcetKtRVQ=;
        b=RnySVY2ndeOlYtkaSdi8QFmNvgFssN+WUpzWjGl0AoLN6yt7k45X1rtzCPFxfz/Vid
         eZ/3JSEBAcl3JGyLlluUQlL/HPzCvWdg1RTEH4s3BLvBN+mHu49+EjTprf1UEaSl+rzp
         TQSKo4q4ppwaDD5Iqlz+s82GJtJJIJPGoCQpxTxepgQ0VgSQAfO3a0g1r7bpeq7HFH4U
         UhkylHFgA9bUBQBr367G+mTdk6STCRfkZA2bVafLsExvpIg82qZbjOj+kFPDK7CDxWOh
         PEo/+w+7elSj0QFWfpTX/BxuyY6nPWD5qG185uEXbLPwv+cAaNZx6b4yF6jvbb1ww7as
         XS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhssb55yfZWZL4puyVbnzotNOq05scdxdGNcetKtRVQ=;
        b=eHwBP0OvJxlzbhk7UUYkf14yyVa+SIi2GDCDcDUti2fmAC8UMSWPgHDLtKadNMaeOQ
         6nr/9BtSDxnN2P23/hOxzM+/pVE5ibcgqY96fJlReE9dgoUzJTBoDnDavlpyF1tiTTcW
         vY1aG1Nwe9ciwcOv8LS+hCQJK4Dl0Pp/rsUr9p2B6XAUK3zpZp1n6I/jrbyaANlWcufT
         uj9a43l54JvCDvQdGHEaI1IvxL7IvwQiUxCRpuTblPTutUN35jJZ38rsOH66QfcFZBwu
         n4TkzaTJGlNNtMqUXAKa4YyX3lfnhIpykpMa/Qdp0vpGwuI4Xjnj1odMTu/YerkMiWA9
         d9aQ==
X-Gm-Message-State: AOAM530ooaB1xxTj1ieP7ejrn7j7wCnmx30XaH26nrHNW4j8yhlSEDSP
	ooKS6D5NyOFTyg1gjJ7FcPmU33diUi1fTA==
X-Google-Smtp-Source: ABdhPJyVWxDtTH9nSD78Vmt9nMcYtP2+DwnzBCYE7//W+ugZv6IKvAB/MaC2Zz1N1FgTsIrTz1bXrQ==
X-Received: by 2002:a17:906:9141:: with SMTP id y1mr22162235ejw.111.1620227943478;
        Wed, 05 May 2021 08:19:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/61] dpkg: update 1.20.7.1 -> 1.20.9
Date: Wed,  5 May 2021 17:17:58 +0200
Message-Id: <20210505151850.660512-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dpkg/{dpkg_1.20.7.1.bb => dpkg_1.20.9.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.20.7.1.bb => dpkg_1.20.9.bb} (93%)

diff --git a/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
similarity index 93%
rename from meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
index 55ac84f724..60ae3ff736 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.20.7.1.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.20.9.bb
@@ -1,7 +1,7 @@
 require dpkg.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=sid \
+SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=1.20.x \
            file://noman.patch \
            file://remove-tar-no-timestamp.patch \
            file://arch_pm.patch \
@@ -19,6 +19,6 @@ SRC_URI = "git://salsa.debian.org/dpkg-team/dpkg.git;protocol=https;branch=sid \
 
 SRC_URI_append_class-native = " file://0001-build.c-ignore-return-of-1-from-tar-cf.patch"
 
-SRCREV = "667bf0aeb92e0e7bb225ee273569c5e2389083bd"
+SRCREV = "2177b782b16e77e97c9643961a5ae3c639bcc4a3"
 
 S = "${WORKDIR}/git"
-- 
2.31.1

