Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 498A67F859
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LM+28FxPIdBmff9XPVBGJjy7ZwOTtlvs2KJaflUKqgY=;
	b=cvn/vLXvXQQCiGxQDWOt2RqB8k
	AeUgLhlfS18jN7+AKCa5HIwmLw4DR1b6SB28HrpCx3No0Avl39F7sot5dXHlrRVEO2WibMcTYKp+x
	HmblbjjyCooZI4FP/owytV6aieiO/hFdj58dqwZtxkf+REX0YZXO97hpWNI2Dp0G4pFd1v+V51jmM
	4ZR6f83N/kUZjMl83T+gG3rQ4/dBKR6Uf/nYfutTQEDLI64B0bVewLQ1FIlbeb6l72m8+nfmUogBf
	Tjv2b4pEMCV7qk6p3B8EV8iYj2t9g3qJF/DNbTtdyXhtr+UyMvJVYUf1l1vPgNvh/zSdW5KbylqoA
	lP0Y3WHA==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009e-BD; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007TV-5n; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:18 +0200
Message-Id: <efbf245129af00e8c4def71bf956246e3fc71e7d.1573047194.git.mikko.rapeli@bmw.de>
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
	efbf245129af00e8c4def71bf956246e3fc71e7d.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 03/47] cve-check: Manage CVE_PRODUCT with more than one name
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:44 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

In some rare cases (eg. curl recipe) the CVE_PRODUCT contains more than
one name.

(From OE-Core rev: 7f62a20b32a3d42f04ec58786a7d0db68ef1bb05)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 28619c7..e7540b8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -168,9 +168,10 @@ def check_cves(d, patched_cves):
     import ast, csv, tempfile, subprocess, io
 
     cves_unpatched = []
-    bpn = d.getVar("CVE_PRODUCT")
+    # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
+    bpn = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
-    if not bpn:
+    if len(bpn) == 0:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
@@ -184,16 +185,18 @@ def check_cves(d, patched_cves):
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
+
     query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
-    for row in c.execute(query % (bpn,pv)):
-        cve = row[1]
-        if pv in cve_whitelist.get(cve,[]):
-            bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
-        elif cve in patched_cves:
-            bb.note("%s has been patched" % (cve))
-        else:
-            cves_unpatched.append(cve)
-            bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
+    for idx in range(len(bpn)):
+        for row in c.execute(query % (bpn[idx],pv)):
+            cve = row[1]
+            if pv in cve_whitelist.get(cve,[]):
+                bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
+            elif cve in patched_cves:
+                bb.note("%s has been patched" % (cve))
+            else:
+                cves_unpatched.append(cve)
+                bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
1.9.1


