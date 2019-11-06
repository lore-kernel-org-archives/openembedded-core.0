Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id B046C7F83D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V7FlQMstzUaaPseeeGG7gTWM+a+kPXLbi/KF7YiSju8=;
	b=OYJKx+rM4BS9p2uOK83qz+YKHG
	J9TVu7SBYp36TWFytfF+uTCRE9wdE5b67EEToCntbM8RfKgIc054CK74hwaXVH8LxqpDd/7f7a3Es
	h//UeacGvtpJvPT4w6yzUb41dSdZdXyjtnMqcsq4d4UF9ygGDrMTxAce4zKUciI7lsHos+EAF6Pqv
	F1ilAhNW+w//AkxZ9npdgSl4sy2izMFBg1m/OU/rJxBrAV63bnSKuENge2mN0lMNtskVrcBu0f3of
	O73XJacnChmOa9jNcvjvJ7ZBYSz1m7kU/BsnUjqPa3sQecm6bRvAhfn+b7Q98iNB11GB9CnLpMApJ
	vcwMhlVA==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOF-0000AJ-Gr; Wed, 06 Nov 2019 17:38:35 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007W6-BF; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:33 +0200
Message-Id: <3d1470373e6c36e6a6cb1df15d86dc73670b7d63.1573047194.git.mikko.rapeli@bmw.de>
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
	3d1470373e6c36e6a6cb1df15d86dc73670b7d63.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH RFC CFH][sumo 18/47] cve-check: Replace CVE_CHECK_CVE_WHITELIST by CVE_CHECK_WHITELIST
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

CVE_CHECK_WHITELIST does not contain version anymore, as it was not
used. This variable should be set per recipe.

(From OE-Core rev: 7069302a4ccbb5b72e1902f284cf078516fd7294)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index e8668b2..512d4c7 100644
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
1.9.1


