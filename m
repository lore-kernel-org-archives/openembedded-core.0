Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 0428A7F859
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=t7mqpSH0w+7hf8L+mYTTuLgoz7hUOksc4x9MLiM8LUg=;
	b=auR5FsDRB2b31/g8giGIHHyA8y
	pVqTKhag76LAqlIveIOhDlGCvfgBsBMZ09fszHtqsOQ6PG/Wipa6isyCP1hignXtiyU0Eb3Wz/bFi
	uMf2mjipFZN8eL2Ovf5e6jLIMvPV6vXCG19/5drxK4zWFx9ZbtbOhfvaG7J/UJxdlwJTe5D5aILde
	ynEfuGPxNnJjbTvbXs/khLxBdNZNx4NyXMpbDb0Uc3DIKfrd8XFoqWtmDM+sH+qmVvtWgcAOufpbJ
	iQuaoKuTSiJfKFUK15U8HdshF2ZcV8hax9e4LamCU8DlbXmF6jZnFYPvLYmCsv71D4RnHSgdakEFu
	Hm8F6/SA==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009n-Lp; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007UT-GU; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:22 +0200
Message-Id: <362131f7b0967da825c47df6a6a136408054bce9.1573047194.git.mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
In-Reply-To: <cover.1573047194.git.mikko.rapeli@bmw.de>
References: <cover.1573047194.git.mikko.rapeli@bmw.de>
X-Rspam-Score: 8.3 (++++++++)
X-Rspam-Report: Action: add header Symbol: ARC_NA(0.00)
	Symbol: DMARC_POLICY_SOFTFAIL(0.10) Symbol: FROM_HAS_DN(0.00)
	Symbol: RCPT_COUNT_THREE(0.00) Symbol: R_SPF_ALLOW(-0.20)
	Symbol: MULTIPLE_UNIQUE_HEADERS(4.89) Symbol: MIME_GOOD(-0.10)
	Symbol: TO_MATCH_ENVRCPT_ALL(0.00) Symbol: NEURAL_SPAM(0.00)
	Symbol: TO_DN_SOME(0.00) Symbol: RCVD_TLS_LAST(0.00)
	Symbol: MID_CONTAINS_FROM(1.00) Symbol: IP_SCORE(-0.19)
	Symbol: FORGED_SENDER(0.30) Symbol: R_DKIM_NA(0.00)
	Symbol: MIME_TRACE(0.00) Symbol: ASN(0.00)
	Symbol: FROM_NEQ_ENVFROM(0.00)
	Symbol: HFILTER_HOSTNAME_UNKNOWN(2.50)
	Symbol: RCVD_COUNT_TWO(0.00) Message: (SPF): spf allow
	Message-ID:
	362131f7b0967da825c47df6a6a136408054bce9.1573047194.git.mikko.rapeli@bmw.de
X-Rspam-Status: Yes
X-Rspam-Bar: ++++++++
X-SA-Exim-Connect-IP: 2001:67c:1be8::12
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RDNS_NONE,SPF_HELO_NONE,SPF_NEUTRAL,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.2
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on mail.kapsi.fi)
Subject: [PATCH RFC CFH][sumo 07/47] cve-check: be idiomatic
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:45 -0000

From: Ross Burton <ross.burton@intel.com>

Instead of generating a series of indexes via range(len(list)), just iterate the
list.

(From OE-Core rev: 27eb839ee651c2d584db42d23bcf5dd764eb33f1)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 379f712..1e7e8dd 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -170,18 +170,19 @@ def check_cves(d, patched_cves):
 
     cves_unpatched = []
     # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
-    bpn = d.getVar("CVE_PRODUCT").split()
+    products = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
-    if len(bpn) == 0:
+    if not products:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
-    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
+    cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
+
     import sqlite3
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
@@ -190,8 +191,8 @@ def check_cves(d, patched_cves):
     query = """SELECT * FROM PRODUCTS WHERE
                (PRODUCT IS '{0}' AND VERSION = '{1}' AND OPERATOR IS '=') OR
                (PRODUCT IS '{0}' AND OPERATOR IS '<=');"""
-    for idx in range(len(bpn)):
-        for row in c.execute(query.format(bpn[idx],pv)):
+    for product in products:
+        for row in c.execute(query.format(product, pv)):
             cve = row[1]
             version = row[4]
 
@@ -200,15 +201,15 @@ def check_cves(d, patched_cves):
             except:
                 discardVersion = True
 
-            if pv in cve_whitelist.get(cve,[]):
-                bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
+            if pv in cve_whitelist.get(cve, []):
+                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             elif discardVersion:
                 bb.debug(2, "Do not consider version %s " % (version))
             else:
                 cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
+                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
1.9.1


