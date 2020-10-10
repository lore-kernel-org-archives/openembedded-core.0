Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.5565.1602332635960041068
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 05:23:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QuSGJuQM;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id s9so904077wro.8
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xkbZ+w1u7aDENibqanpilPnysScxD7Kf0U2Xw8QTVyM=;
        b=QuSGJuQMDNwDVHKZeUu6b84kpl1+eyEz2jEICv6xDNRoqZdpP8AKvIJgcDVubA71ew
         lR7ilN8FV4r/dqhEuMOuinbQfCgAqKkO7snBkcv8kZER3PKwGUgUaLwtHVROMKYqzQ18
         TNpflRukjyczLqlWDUNvJCp10WYreobte0ZDFRWaHc5xMkSTF7Pfz1i6+G6ZuJT5meAn
         mIs+FIvJ75borHYFB23ErZLAGDuU/tgsM7ll3NfKrEu3KK7LZN7/SbnJh3qcMXlfbqzL
         unewvU9vNayimBKYwoIrO1kyHrkP5XVBqHA6KcTzUkxNEUFo8obpUbMq08F0lt1Ny2DY
         yAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xkbZ+w1u7aDENibqanpilPnysScxD7Kf0U2Xw8QTVyM=;
        b=M9UomsJVWFNaA355QYuQd//Pa16Llu6g1pOfVmV3nH2dMpJ4JdNqUMDi8YUZAHvts3
         W+W1sQbH7sr/7vLmaSdv6y9B89o8d24drotlDZZPcZCsrmf+/G5L5j68nB1DHL0GDFZL
         c3ZUdtmWk4GwB3YoQ+cnnrEYIj7IihQy9LomB3yAz8rA2waFMbFyL/m2JaxYf1/CNG1z
         4MudKekIZDeKLvMAMsH1Bqx2RgDJsSU32REgzFa+5oMfUMayYPEZydNgKsLsgVhI8i5Z
         F3Qlsz1IH+1WpO6ZSTq4sTMVfNLdad3eitlrHSn6sH4Xp2y6Q3QE9NoQUEfXZNbS/8OW
         7zrw==
X-Gm-Message-State: AOAM533r5NVrvaScBBKFUvGAw9u4btSaeRHi5Q0m4AX9H0c9KN5pvi9O
	qewvqeKX+LVNRhh12QG6cGjO6NdAoSyeTJz6
X-Google-Smtp-Source: ABdhPJx7EjJAH3O9L2NLkmQJJ/g3Byd0S/pWo0sctJe4fCDNk8vMGMsEh3hCiXgedyBCeS8KdcLL7w==
X-Received: by 2002:a05:6000:ce:: with SMTP id q14mr658747wrx.199.1602332633997;
        Sat, 10 Oct 2020 05:23:53 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.129])
        by smtp.gmail.com with ESMTPSA id e15sm15608464wro.13.2020.10.10.05.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 05:23:53 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH v3] Update license file to match current SPDX names
Date: Sat, 10 Oct 2020 13:23:39 +0100
Message-Id: <20201010122339.9594-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
Added missing mappings.

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---

Changes in V3:
 * Added missing mappings to meta/conf/licenses.conf

Changes in V2:
 * Corrected the email subject line.

 meta/conf/licenses.conf | 55 ++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 17 deletions(-)

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
-- 
2.17.1

