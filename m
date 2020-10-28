Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
 by mx.groups.io with SMTP id smtpd.web12.3924.1603919186293140550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=re6T0FCF;
 spf=pass (domain: gmail.com, ip: 209.85.208.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f65.google.com with SMTP id o18so969602edq.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pg2wVQ2CjoQe4xQupuQursLHcfEyIQSKSdujIvGULXg=;
        b=re6T0FCF1nOqGZE4M8B4fGrcFRKixAr/vBnwvGe120TFRaHPCAQaB0Y0pvlgwYZv0z
         rCUbxJYdmhrk40RIsUNJnfvb+jGlF98j+ehQ2f6hL87PPQevBBnuJVv1gLmsyUORpn3m
         6ez6GTpS+P2nPXm+Uzftx6C0G507zOzv0EZnTxATK4w3y5IgJzUDH/38ksXDVrvhX+ar
         OGuXKzhO7kpfJZmHsiqBcOvSfjtQoeCv1BfU5ztJKZSGpcRJ9wZ29/OBqGPujWKKrNro
         RGbxzTr5dbd6r0TgszzsIRONsLNNVjR2437lES1iQXFrVLh8/K1ifs0JHOWqB76e7QrW
         zAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pg2wVQ2CjoQe4xQupuQursLHcfEyIQSKSdujIvGULXg=;
        b=VJ7H/nFqmw6BiHKw7U16bvkPDNEKX0Jn87T7VeeWYhQU0vxnIMbYey7akpGCsTcZvV
         c/cR0OBzisAT+YiJdx2/camUebgmIAof4mAzIBddnBOgRUgnUmQBae27e56z0np1DjSu
         ToAtBAi92iOdzySSMnBBsK9uD6tlAgF3GoFEtpvfM+GnsjaBTR1d0jKkNkteu1jEmGzm
         ipJ4BhWWzPR57M6RXdseN14L9rEvnEevYV7itqfJwKvLF+o49cyXacmBvMm6yBFxGNLm
         uHWsyhpDfo7v8QSgB7tRdwFOOVjubjh1Nl+YaoQEbGZdwCPa7GUE8Dp1TBPGzMzknOlf
         V8VQ==
X-Gm-Message-State: AOAM531oVMID9bvhIK8nXJjY5V+NUaJkF/02utzkghX3ynMeeeE6/dOv
	3qjQxyOpk/VAkmDWhrz2de5NStBAW5T1fQ==
X-Google-Smtp-Source: ABdhPJxdLGpd5fPojUvCkFEfjcxVG7m5DhR1SPxBjg3UzO6sWBaLDO9t6E8hINVq9xp102jc8C/7Lg==
X-Received: by 2002:a05:6402:1d2c:: with SMTP id dh12mr822421edb.256.1603919184581;
        Wed, 28 Oct 2020 14:06:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:24 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 21/33] dos2unix: update 7.4.1 -> 7.4.2
Date: Wed, 28 Oct 2020 22:05:46 +0100
Message-Id: <20201028210558.21070-21-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../dos2unix/{dos2unix_7.4.1.bb => dos2unix_7.4.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.1.bb => dos2unix_7.4.2.bb} (88%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
similarity index 88%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
index 1623285fd0..9005bdea59 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.1.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.4.2.bb
@@ -6,12 +6,12 @@ HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
 SECTION = "support"
 
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=0c977b18f0a384d03597a517d7d03e32"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=8a7c3499a1142df819e727253cd53a12"
 
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "0490f0723b1a0851b17343f6164915f3474b5197"
+SRCREV = "72596f0ae21faa25a07a872d4843bc885475115d"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.29.0

