Return-Path: <lemagoup@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 841B77EBD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 15:19:55 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v19so6522603wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2019 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y+XjftZ9yL9ywuPeQ8jGMx6i/BErsNikD/9/N6XPJrI=;
	b=YuiL1y6Lw/q2JHB320JT0FIvaRAnfXt5RG7zfJIPQnew5f3dVAmZtjUUG2Q72lNoz6
	wSS1cX5k/9caaxAm/M8vUfj/+Wy5iNXOre1iuP++1FLOiK8yC9L4FFCvbpRcQ7fjCZUv
	uSdgAz78HzmEy54XMRzEBrx+aSRxfJxZAL+whokR4J4VbyAjbJRJGVR0z2f8/2PiPCfs
	YpZl06/Z3RYD+1K5smrnEon3Jz2KNLiBb42N/RTe6ub9ZKlhyxbP1n8FwZyUuy81HEr7
	1MwsMQU1V7zOVlcYw5jApjPAosNaYNvvW5Kht7apzDbPnUEGqJrhZluoeiYiluSS5eXt
	9r0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y+XjftZ9yL9ywuPeQ8jGMx6i/BErsNikD/9/N6XPJrI=;
	b=PPkAOyIBhRnZ/Cv5cgM2bmE5L2pQ+Tn13oWrtfQ9pk8mQGJvriXU1rsNAkI2LOAa5P
	J1a5UgnRXMcc61wyUlPScj2f3ZvfPxO08I3Jonneec70rSYwxwzZJzsnKtETbgvkkVj3
	1FJwz8KD0rQSW3M9Ux0kiks/iPXS9EocXl7ilAF2djG78x2HpJy/J8E+ZRAOAogft9Lz
	WOtd0nbRb8d64APkWauj1m8ufB4QZoVEqIsyEIWrIbCE0ph5RscN/WxCYdlhzHXZQG3n
	lX+fXABZLezYTWSMFoDcIU6j56GJ/KIsh6u/Kv+BMRwbHdTDnA4BUDt+lhm9U/BLYcUe
	Q2Pw==
X-Gm-Message-State: APjAAAWp5tQikRIuGYLB5LDp9P5A89RQHCfcKt/yWBXuAV52xXy1Vm0V
	DJghOxf3ljXaN0I8QmiKeC9jAgsd
X-Google-Smtp-Source: APXvYqx2HYdZM3sW9+5pWN7C9tZWo2/IEmBsMdmGufWj5cM9M3sqx3toVqyHbFlTzEXVCknWtm52SA==
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr100388wmc.62.1562253595863;
	Thu, 04 Jul 2019 08:19:55 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	j189sm5430264wmb.48.2019.07.04.08.19.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2019 08:19:55 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2019 17:19:08 +0200
Message-Id: <20190704151908.5094-3-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190704151908.5094-1-lemagoup@gmail.com>
References: <20190704151908.5094-1-lemagoup@gmail.com>
Subject: [meta-oe][PATCH 3/3] cve-check: Update unpatched CVE matching
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
X-List-Received-Date: Thu, 04 Jul 2019 15:19:55 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Now that cve-update-db added CPE information to NVD database. We can
check for unpatched versions with operators '<', '<=', '>', and '>='.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass | 54 +++++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6ffa0c4688..ffd624333f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd-json.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -189,27 +189,53 @@ def check_cves(d, patched_cves):
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
 
-    query = """SELECT * FROM PRODUCTS WHERE
-               (PRODUCT IS '{0}' AND VERSION = '{1}' AND OPERATOR IS '=') OR
-               (PRODUCT IS '{0}' AND OPERATOR IS '<=');"""
+    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '{0}';"
+
     for product in products:
         for row in c.execute(query.format(product, pv)):
             cve = row[1]
-            version = row[4]
-
-            try:
-                discardVersion = LooseVersion(version) < LooseVersion(pv)
-            except:
-                discardVersion = True
+            version_start = row[4]
+            operator_start = row[5]
+            version_end = row[6]
+            operator_end = row[7]
 
             if pv in cve_whitelist.get(cve, []):
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
-            elif discardVersion:
-                bb.debug(2, "Do not consider version %s " % (version))
             else:
-                cves_unpatched.append(cve)
+                if (operator_start == '=' and pv == version_start):
+                    cves_unpatched.append(cve)
+                else:
+                    if operator_start:
+                        try:
+                            to_append_start =  (operator_start == '>=' and LooseVersion(pv) >= LooseVersion(version_start))
+                            to_append_start |= (operator_start == '>' and LooseVersion(pv) > LooseVersion(version_start))
+                        except:
+                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                                    (product, pv, operator_start, version_start, cve))
+                            to_append_start = False
+                    else:
+                        to_append_start = False
+
+                    if operator_end:
+                        try:
+                            to_append_end  = (operator_end == '<=' and LooseVersion(pv) <= LooseVersion(version_end))
+                            to_append_end |= (operator_end == '<' and LooseVersion(pv) < LooseVersion(version_end))
+                        except:
+                            bb.note("%s: Failed to compare %s %s %s for %s" %
+                                    (product, pv, operator_end, version_end, cve))
+                            to_append_end = False
+                    else:
+                        to_append_end = False
+
+                    if operator_start and operator_end:
+                        to_append = to_append_start and to_append_end
+                    else:
+                        to_append = to_append_start or to_append_end
+
+                if to_append:
+                    cves_unpatched.append(cve)
                 bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
     conn.close()
 
@@ -217,7 +243,7 @@ def check_cves(d, patched_cves):
 
 def get_cve_info(d, cves):
     """
-    Get CVE information from the database used by cve-check-tool.
+    Get CVE information from the database.
 
     Unfortunately the only way to get CVE info is set the output to
     html (hard to parse) or query directly the database.
-- 
2.11.0


