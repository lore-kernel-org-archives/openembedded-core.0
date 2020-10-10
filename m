Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.5037.1602330434789064873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 04:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iE3aTPsr;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id i1so6821398wro.1
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 04:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=r6eYXayMobD4u4+aVGTu8tGVVJOG4Igyo2nDRrRYLLk=;
        b=iE3aTPsrd/mv7MaASOw2C13XHW46dcZt6JnVgCBbDo2STvFG/Uppaptpy8xkbV8LiQ
         p5dQ59lQGbEa1h/2BZv+Nfo1Pv8BoA2k2S+49Nz5GJ0CMVpDKoeYubJ3apgx/QYZlL3r
         f0YfbUfJ4f9Z7YmtPa2v73fN3n72ikpyXrEECRXLMVf2BPcT/jN5cZ/7VyYumvgYZMrO
         bM2CGqXFKynfWb7bFnG8dDWjPP64kL0eu5P7D3XjDnCybHmT/gXirkTAjVyL92OEUuvd
         0+sFJRc2O1Z9trFkXv036JXj+8Fj46w5+7pyKTu1oxKjdRD2Zt+PxwvJoHKdkY/vZ/99
         uzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=r6eYXayMobD4u4+aVGTu8tGVVJOG4Igyo2nDRrRYLLk=;
        b=XxffZgwKQPfhv3UHm4Y5728LCLHS/KdjcQo+cPsjjJChqcKXt2QtodB80xLDjWtHSS
         pO4KvdAZX90ifwlhZFP1bKI76lK9WewY5jAlxo6a3Gt3kVMuUt43NxXlHND6pVhtVU/d
         8Sa6Io13gpAU93RqLBYA0it31JEFvriEu+A6j9ad5VJtMoAx0vAXJ1Ber5uv24XcE+g4
         pHIzavhCJvG+37yBmCKGWF4308gvXyWUhHCnrct3fv+HcqePmZhrPUxrC93Ek0/Wi65G
         s13ixTxy45GlM8d4JJWhq13UU17hRt9rZyEFYy2/x07gCJKnCnHkioKhXFMkrSgMvA4n
         uR9A==
X-Gm-Message-State: AOAM531zPKUjukHtbbefvpHI/PbGeFdnIXSi1+iEFubLziLzDipFQIhq
	g8Ere5CbedsRbMGmiHMHzwcTQIZonHl59Ize
X-Google-Smtp-Source: ABdhPJw6NmkVYAtlNWOJLwkSXd4pp+WxXPOyFlcwO+LTGEmxQj9FK7xT3eZMzYR/7f00sXhFTtJ01w==
X-Received: by 2002:adf:9f4c:: with SMTP id f12mr7806991wrg.108.1602330432930;
        Sat, 10 Oct 2020 04:47:12 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.129])
        by smtp.gmail.com with ESMTPSA id j101sm17070326wrj.9.2020.10.10.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 04:47:12 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH v2] Update license file to match current SPDX names
Date: Sat, 10 Oct 2020 12:46:57 +0100
Message-Id: <20201010114657.8685-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---

Changes in V2:
 * Corrected the email subject line.

 meta/conf/licenses.conf | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb385..9b4d0e7c7b 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,27 +10,27 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
 
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
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
 
 #MPL variations
 SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
-- 
2.17.1

