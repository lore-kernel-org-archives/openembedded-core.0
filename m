Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.426.1602793849431399569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 13:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFfNlktF;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id b8so142943wrn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=DBBPyxrA+JKs/lnl7fwaqct7UsQ6lJ6pI3aaYaKD9Us=;
        b=MFfNlktFJ6Y46uUfR0iYyC7SHPvVv3LjBlqzwelYZc4gHN06Igbh/+Rw5Qra2f7eYL
         owaQidOodq5IfndluOfN5oyzm35A9KOFWtOZMXr9NsJtMiX1tMnLJ4ZBpEhZS/FkM0mw
         1w1s0S1WmzTpr6AbRQo99hAE71VlmpZRX+Dxu7MtXe9BWdmeNo07+XIToescF+SD49UP
         4mlaoOM4Jqsj0hfUpCEl5tGQ5F9j98y4kPVcWzZ0L+93jLr4oSE+HWHC6kZJ9V0tHnic
         pljekBNzXx+COFG0hOjfA10MlmXvkyUWLCWpxBJidY7wPR4R//PW63BCnSYQE0xicGcp
         yPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=DBBPyxrA+JKs/lnl7fwaqct7UsQ6lJ6pI3aaYaKD9Us=;
        b=TcrFHs8ilD7e6AuGmwtx6fLxu5HbRvPrjrHLCLsn1LJWRAgHwWM6vP4xTeLmYmJZVr
         X2/3K132IR6xCQfs3PkBDBmXnc7vKVgcVDAQHo7OLnvEJQbJDqOgUScUMFxiRiS8tOmX
         JFQC/KcVzWLMLU65dPCkDnNpQiNHsDjVEGZnAbFF2/T5nIHrBY3cNoQ0JGMHiqCRf8zj
         CtjMvDA1rKJh4X0KMNZ/C1B32z83YuviYFGduGfY+p/AO82ZojPsIefgN1XFyfK/JHuV
         oCRd/jNeMpjfoNuAtHCLWEdG+r/xm7WdaNMXqD90MQXY6DykIiERGMko6wQC62DqVZrF
         MKoA==
X-Gm-Message-State: AOAM5304yUYNl9XGjS2tq5udYV/RYz99idvbeaX+5ioeoM6mX+VO1NER
	kGSFGdSJnCiSgiHK8eWfykkqV8t2h35I5g==
X-Google-Smtp-Source: ABdhPJyAIWi1kkVRal8FP1nLwekBq2mUto5+mYCAgV1jMFMcCeBfzSw/PIbAOMKEFUYRTHFTPdtJEA==
X-Received: by 2002:adf:f3c7:: with SMTP id g7mr81667wrp.394.1602793847572;
        Thu, 15 Oct 2020 13:30:47 -0700 (PDT)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.150.210])
        by smtp.gmail.com with ESMTPSA id b15sm619051wrm.65.2020.10.15.13.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 13:30:46 -0700 (PDT)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org,
	Meh Mbeh Ida Delphine <idadelm@gmail.com>
Subject: [poky][PATCH v5] Update license file to match current SPDX names
Date: Thu, 15 Oct 2020 21:30:25 +0100
Message-Id: <20201015203025.21816-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.17.1

Updated mappings of license fields of meta/conf/licenses.conf to match latest SPDX naming.
Added missing mappings.
Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only.
Added "or later" versions of license mappings

Fixes: [YOCTO #13320]

Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
---

Changes in V5:
 * Added "or later" versions of license mappings in meta/conf/licenses.conf

Changes in V4:
 * Renamed license files that were added in license mappings eg from GPL-2.0 to GPL-2.0-only

Changes in V3:
 * Added missing mappings to meta/conf/licenses.conf

Changes in V2:
 * Corrected the email subject line.

 meta/conf/licenses.conf                       | 62 ++++++++++++++-----
 .../{AGPL-3.0 => AGPL-3.0-only}               |  0
 .../common-licenses/{GPL-1.0 => GPL-1.0-only} |  0
 .../common-licenses/{GPL-2.0 => GPL-2.0-only} |  0
 .../common-licenses/{GPL-3.0 => GPL-3.0-only} |  0
 .../{LGPL-2.0 => LGPL-2.0-only}               |  0
 .../{LGPL-2.1 => LGPL-2.1-only}               |  0
 .../{LGPL-3.0 => LGPL-3.0-only}               |  0
 8 files changed, 45 insertions(+), 17 deletions(-)
 rename meta/files/common-licenses/{AGPL-3.0 => AGPL-3.0-only} (100%)
 rename meta/files/common-licenses/{GPL-1.0 => GPL-1.0-only} (100%)
 rename meta/files/common-licenses/{GPL-2.0 => GPL-2.0-only} (100%)
 rename meta/files/common-licenses/{GPL-3.0 => GPL-3.0-only} (100%)
 rename meta/files/common-licenses/{LGPL-2.0 => LGPL-2.0-only} (100%)
 rename meta/files/common-licenses/{LGPL-2.1 => LGPL-2.1-only} (100%)
 rename meta/files/common-licenses/{LGPL-3.0 => LGPL-3.0-only} (100%)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb385..84ec88ca4d 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -10,33 +10,51 @@
 # Any mapping to MPL/LGPL/GPL should be fixed
 
 # AGPL variations
-SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0"
-SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPLv3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0] = "AGPL-3.0-only"
+SPDXLICENSEMAP[AGPL-3.0+] = "AGPL-3.0-or-later"
 
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
+SPDXLICENSEMAP[GPL-1.0+] = "GPL-1.0-or-later"
+SPDXLICENSEMAP[GPL-1.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0] = "GPL-2.0-only"
+SPDXLICENSEMAP[GPL-2.0+] = "GPL-2.0-or-later"
+SPDXLICENSEMAP[GPL-3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0] = "GPL-3.0-only"
+SPDXLICENSEMAP[GPL-3.0+] = "GPL-3.0-or-later"
 
 #LGPL variations
-SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
-SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
-SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0] = "LGPL-2.0-only"
+SPDXLICENSEMAP[LGPL-2.0+] = "LGPL-2.0-or-later"
+SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1] = "LGPL-2.1-only"
+SPDXLICENSEMAP[LGPL-2.1+] = "LGPL-2.1-or-later"
+SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0] = "LGPL-3.0-only"
+SPDXLICENSEMAP[LGPL-3.0+] = "LGPL-3.0-or-later"
 
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
@@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
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

