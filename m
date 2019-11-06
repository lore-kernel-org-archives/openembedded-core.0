Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id AE5EC7F83A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ulX8bYXzLN5GKNP4tmbGBFGmYwI6rGLytmJ1CXMnQpo=;
	b=ftP0iJgAvgIkhXGch4hA9xHB68
	Ux0qB0s5fDuMZsz/0IobdMV/03b0FyOa2gmK9JgxvzYWa1V2k8NPRjMShGMFYB7jnkN4Ne/b9xxX2
	BDXUpAbsfDeheBq1n7jsgv9E8NvbdTqg95ZP7B6gG+ApdpPBdsyUgzfA3USosDP6FJrZf/b7mskGS
	+CMGxHm5THetgsrch89mjg3ijdN923wBWsas4M//ijW7ODYNBRGHSdfY43yjMG+YokfOnkB4W/hgn
	yUoNjLLCPW3o5VBow26SC60+HnNcvv639HbC9ZwvXyFPTBXxOXrzNQvsdWkj8WMmqRyCAdwox4CE6
	+qxbLyLw==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOF-0000A5-1r; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007V5-T0; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:27 +0200
Message-Id: <d63b92a36168c053f2ea8ab27ae260374db5feae.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 6.0 (++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: R_SPF_NEUTRAL(0.00)
	Symbol: FROM_HAS_DN(0.00) Symbol: TO_DN_SOME(0.00)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: NEURAL_HAM(-0.00)
	Symbol: IP_SCORE(-0.15) Symbol: FORGED_SENDER(0.30)
	Symbol: R_DKIM_NA(0.00) Symbol: MIME_TRACE(0.00)
	Symbol: ASN(0.00) Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf neutral
	Message-ID:
	d63b92a36168c053f2ea8ab27ae260374db5feae.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 12/47] cve-check: Update unpatched CVE matching
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:36 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Now that cve-update-db added CPE information to NVD database. We can
check for unpatched versions with operators '<', '<=', '>', and '>='.

(From OE-Core rev: bc0195be1b15bcffe60127bc5e8b7011a853c2ed)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 54 +++++++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 6ffa0c4..ffd6243 100644
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
1.9.1


