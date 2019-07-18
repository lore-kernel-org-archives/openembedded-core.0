Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DE0297ECAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 12:41:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so28580134wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 05:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=w+0ncD2woaN9C1eK3MSemzf71AQj4UOt+bdjeKnGAM0=;
	b=ZY3e4gufsCTPr5kHKJIDc1zpp8PnluBmizBp4N+pB6JeNSLJUmXaA6fbTYMePge6nW
	vwEroT5N4wTWSd9nOg1Y8nyuhxu7Onu6Lix1/wKw2Wv5lA/kgN14aZeuuStXLXAgncUR
	iPCB/jAm2Ysjq5wPW+7eRRz4GrDjtmqtCzV55rmj3M10OS50Md/EXM7FmvwTrSymCh4l
	Amc4UvID3hgQPGkAQjsMF9LXyF5XkA1sIEVfE5CVEGPruOToQOB2n/Jjlf1rg9nH0Awz
	glwF6xNOJi5Qup4QvqFPPSoLBsh4c9utFp4eVkpyYENWDo9a6YOWAbjJM7rahm8gVwXK
	d2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w+0ncD2woaN9C1eK3MSemzf71AQj4UOt+bdjeKnGAM0=;
	b=omxT8Hyc92WCX0xw7Tp4tJV4kRH3PBPnWJLr8vHg77SKVwmOdRiHxSJ0GOU/w1a3r9
	MHFLXH1bPqpIvY9AQpqebo28sDh+k0pOWbnjkAve2h13IQvqPdjavk62z7dIjFum7cGz
	GoQSvloja89TUL5r5FTZRbQEnff73nT9YHmOUq2X63CYxlMgNx4rgfjWR7lN11XbSi+G
	iI69d/UcewJtkLPZWJARWPC0DFghIiLcCfl4H97N023MFhwI+/gxFFok3xN/SeFLE/IK
	k4fNe7eJlMTIDbZW5Ok49WW/OWtIGCQIzL7FvlwYRi18BPyRgXBv0s/a7VyA9SExR5tD
	oTBA==
X-Gm-Message-State: APjAAAX7eq2MiA9thT0jxcZHrxJ8vuIX9uIiXd8WozVGdcU4jPgxZkGI
	rEHVL0awLZzcX+kwNNpvI1jbQJGJ
X-Google-Smtp-Source: APXvYqwnsO4CyWx5rTkQYPCnmwZLAC7CrAFY5BFeXlgDfKthwyNieoSuKplJANz1zfBxWy5JKTWPiw==
X-Received: by 2002:adf:cf02:: with SMTP id o2mr30577200wrj.352.1563453697424; 
	Thu, 18 Jul 2019 05:41:37 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194])
	by smtp.gmail.com with ESMTPSA id c1sm52715645wrh.1.2019.07.18.05.41.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jul 2019 05:41:36 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 14:41:18 +0200
Message-Id: <20190718124119.991-1-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELIST
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2019 12:41:37 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

CVE_CHECK_WHITELIST does not contain version anymore, as it was not
used. This variable should be set per recipe.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e8668b2566..512d4c7302 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -39,15 +39,12 @@ CVE_CHECK_CREATE_MANIFEST ??= "1"
 # Whitelist for packages (PN)
 CVE_CHECK_PN_WHITELIST ?= ""
 
-# Whitelist for CVE and version of package. If a CVE is found then the PV is
-# compared with the version list, and if found the CVE is considered
-# patched.
-#
-# The value should be valid Python in this format:
-# {
-#   'CVE-2014-2524': ('6.3','5.2')
-# }
-CVE_CHECK_CVE_WHITELIST ?= "{}"
+# Whitelist for CVE. If a CVE is found, then it is considered patched.
+# The value is a string containing space separated CVE values:
+# 
+# CVE_CHECK_WHITELIST = 'CVE-2014-2524 CVE-2018-1234'
+# 
+CVE_CHECK_WHITELIST ?= ""
 
 python do_cve_check () {
     """
@@ -185,7 +182,10 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
-    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
+    old_cve_whitelist =  d.getVar("CVE_CHECK_CVE_WHITELIST")
+    if old_cve_whitelist:
+        bb.warn("CVE_CHECK_CVE_WHITELIST is deprecated, please use CVE_CHECK_WHITELIST.")
+    cve_whitelist = d.getVar("CVE_CHECK_WHITELIST").split()
 
     import sqlite3
     db_file = d.getVar("CVE_CHECK_DB_FILE")
@@ -206,7 +206,7 @@ def check_cves(d, patched_cves):
             version_end = row[6]
             operator_end = row[7]
 
-            if pv in cve_whitelist.get(cve, []):
+            if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
-- 
2.11.0


