Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.21654.1602792562120373230
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 13:09:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dy3Hda2V;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e18so18260wrw.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=YRu2wpHL77n+AeHtqbX1XOvah4hDTohbwIrNiBvIUp4=;
        b=dy3Hda2V7PqPJdqFS4a5aj7w5Att62FNrxA+8k5kjGyoS4vsr9pAeZ/2yfsLfa8tWc
         VsHfhz3kVBlt78OVTDiVDcMMngCxceUCqlk0Lu0AjfcLBuHDOrTBTIKV3DZ93eAzmLAS
         jFy2rwD3qu6/swOZFQU7fEVLEeYFROc9BmKijut92fMcDm6o1JdVJ/qU66BmaxrkveXf
         K80CKUpD6XaePUMqJmsQzP3AQOR0Qi7z6EuU9xJAW/+z5sO8JYfATXTYqm412IZQpIqC
         fmM1aj0ir7K0M47lMTlIqULhW/8P+OA5TI7v14GjNAhezcmq93gKK9EXPeK3eyDz+StK
         tw5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=YRu2wpHL77n+AeHtqbX1XOvah4hDTohbwIrNiBvIUp4=;
        b=Ur5kFzRFl+ErlAcFd8XA7xnsD+NGWrfDIDtcgHPJKTInW+YwOJ2e5QD7Gg7zWSC8nV
         tqLNM85SgI+u9jpOsYXvXRHzBbNOWhq9kG8CD262f/fTHtFIvP1Zq75NeuusDpeCMO8R
         UIU5iU9zYBQik3DRTuNORzZKgFbjRqRSjT65Ms/ZH2heitJr269Xsj/+UzUX29uJTwTf
         8QD1QPIsKnyVXXS6LCN7RkjR8ptVKt0W7e+gccT2/zwchjlZ5p9nsh7vXij7B4SzaUW8
         SofhhF7rPGJJ8LPna594C7h4RhMPO4937dhY9/Ghk5CbRscUSb+LasGxZL6VdMiztS8B
         sFIw==
X-Gm-Message-State: AOAM530eL9EWXxMKUwNhhj0gaJOO01DFvuBuTaL9RuqKN1TLCRcmzr/G
	Z9FGyBlWi3QfZUG67UpmPolLzZvawa64PA==
X-Google-Smtp-Source: ABdhPJzQsBOwCZlr+/6/k6nZwZ/GYPUwQV11ne8wT235kbUKqHbCzu3zg7zdC+Q1DEP0K741zOn9wQ==
X-Received: by 2002:adf:fd09:: with SMTP id e9mr6307902wrr.241.1602792560080;
        Thu, 15 Oct 2020 13:09:20 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.150.210])
        by smtp.gmail.com with ESMTPSA id k5sm170137wmb.19.2020.10.15.13.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 13:09:19 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH v4] Update license file to match current SPDX names
Date: Thu, 15 Oct 2020 21:08:42 +0100
Message-Id: <20201015200842.18834-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
Added missing mappings.
Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only.

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---

Changes in V4:
 * Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only

Changes in V3:
 * Added missing mappings to meta/conf/licenses.conf

Changes in V2:
 * Corrected the email subject line.

 meta/conf/licenses.conf                       | 55 +++++++++++++------
 .../{AGPL-3.0 => AGPL-3.0-only}               |  0
 .../common-licenses/{GPL-1.0 => GPL-1.0-only} |  0
 .../common-licenses/{GPL-2.0 => GPL-2.0-only} |  0
 .../common-licenses/{GPL-3.0 => GPL-3.0-only} |  0
 .../{LGPL-2.0 => LGPL-2.0-only}               |  0
 .../{LGPL-2.1 => LGPL-2.1-only}               |  0
 .../{LGPL-3.0 => LGPL-3.0-only}               |  0
 8 files changed, 38 insertions(+), 17 deletions(-)
 rename meta/files/common-licenses/{AGPL-3.0 => AGPL-3.0-only} (100%)
 rename meta/files/common-licenses/{GPL-1.0 => GPL-1.0-only} (100%)
 rename meta/files/common-licenses/{GPL-2.0 => GPL-2.0-only} (100%)
 rename meta/files/common-licenses/{GPL-3.0 => GPL-3.0-only} (100%)
 rename meta/files/common-licenses/{LGPL-2.0 => LGPL-2.0-only} (100%)
 rename meta/files/common-licenses/{LGPL-2.1 => LGPL-2.1-only} (100%)
 rename meta/files/common-licenses/{LGPL-3.0 => LGPL-3.0-only} (100%)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb385..b45a9d283e 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,33 +10,44 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
 
 # GPL variations
-SPDXLICENSEMAP[GPL-1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1] = "GPL-1.0"
-SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
-SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
-SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
-SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
-SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+SPDXLICENSEMAP[GPL-1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0-only"
+SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
 
 #MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
+SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
 SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
+SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
 SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
+SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
+
 
 #MIT variations
 SPDXLICENSEMAP[MIT-X] = "MIT"
@@ -48,33 +59,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
 #PSF variations
 SPDXLICENSEMAP[PSF] = "PSF-2.0"
 SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
+SPDXLICENSEMAP[PSF-2.0] = "PSF-2.0"
 
 #Python variations
 SPDXLICENSEMAP[Python-2] = "Python-2.0"
+SPDXLICENSEMAP[Python-2.0] = "Python-2.0"
 
 #Apache variations
 SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
 SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
+SPDXLICENSEMAP[Apache-2.0] = "Apache-2.0"
 
 #Artistic variations
 SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
 SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
+SPDXLICENSEMAP[Artistic-1.0] = "Artistic-1.0"
 
 #Academic variations
 SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
 SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
+SPDXLICENSEMAP[AFL-1.2] = "AFL-1.2"
 SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
+SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
 SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 
 #CDDL variations
 SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
 SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
+SPDXLICENSEMAP[CDDL-1.0] = "CDDL-1.0"
 
 #Other variations
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
+SPDXLICENSEMAP[EPL-1.0] = "EPL-1.0"
 
 #Silicon Graphics variations
 SPDXLICENSEMAP[SGIv1] = "SGI-1"
+SPDXLICENSEMAP[SGI-1] = "SGI-1"
 
 # Additional license directories. Add your custom licenses directories this path.
 # LICENSE_PATH += "${COREBASE}/custom-licenses"
diff --git a/meta/files/common-licenses/AGPL-3.0 b/meta/files/common-licenses/AGPL-3.0-only
similarity index 100%
rename from meta/files/common-licenses/AGPL-3.0
rename to meta/files/common-licenses/AGPL-3.0-only
diff --git a/meta/files/common-licenses/GPL-1.0 b/meta/files/common-licenses/GPL-1.0-only
similarity index 100%
rename from meta/files/common-licenses/GPL-1.0
rename to meta/files/common-licenses/GPL-1.0-only
diff --git a/meta/files/common-licenses/GPL-2.0 b/meta/files/common-licenses/GPL-2.0-only
similarity index 100%
rename from meta/files/common-licenses/GPL-2.0
rename to meta/files/common-licenses/GPL-2.0-only
diff --git a/meta/files/common-licenses/GPL-3.0 b/meta/files/common-licenses/GPL-3.0-only
similarity index 100%
rename from meta/files/common-licenses/GPL-3.0
rename to meta/files/common-licenses/GPL-3.0-only
diff --git a/meta/files/common-licenses/LGPL-2.0 b/meta/files/common-licenses/LGPL-2.0-only
similarity index 100%
rename from meta/files/common-licenses/LGPL-2.0
rename to meta/files/common-licenses/LGPL-2.0-only
diff --git a/meta/files/common-licenses/LGPL-2.1 b/meta/files/common-licenses/LGPL-2.1-only
similarity index 100%
rename from meta/files/common-licenses/LGPL-2.1
rename to meta/files/common-licenses/LGPL-2.1-only
diff --git a/meta/files/common-licenses/LGPL-3.0 b/meta/files/common-licenses/LGPL-3.0-only
similarity index 100%
rename from meta/files/common-licenses/LGPL-3.0
rename to meta/files/common-licenses/LGPL-3.0-only
-- 
2.17.1

