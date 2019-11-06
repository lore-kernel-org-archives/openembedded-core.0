Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 734837F872
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9kpKL/XoWdI0n3fPVK30qJRdRpeLJ/6Wi2iPwwGgUDY=;
	b=y/fyMKMMyVSb2d7hoVIoPUhnOd
	aIK6LF2jQLV6ABnhJHPPHbPCSCS1MpzmuyEti53OvDCcEKem58RLNvVM6tBxTTxKcsfDeICrfRaUm
	AcLwKDeDpCaXLNdd2vc4JSINOeJY7KVzA4F9oGp/vvoqwiCwTpe2X8VJBLrA6XqRXsxa5j1MZJZqp
	verapgr1hx8usj8yveZl4jIjTrQXMb1/yhZnbVcFzz6OB53n9FuOw5quecfJaeO7E64dUgtrePmMJ
	RfumjFOppZlFoXoVVjLavYSr3eKUF8H9XCHwCzxQdCcpCA/icsqfxfCM/Q57V9knUlbJXMuAP8Qdv
	BJuDBPOw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009d-8e; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007TM-3G; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:17 +0200
Message-Id: <a6b1307b342923fb026d5df0e21cb08fb41db408.1573047194.git.mikko.rapeli@bmw.de>
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
	a6b1307b342923fb026d5df0e21cb08fb41db408.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 02/47] cve-check: Remove dependency to cve-check-tool-native
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

Use the new update-cve-db recipe to update database.

(From OE-Core rev: bc144b028f6f51252f4359248f6921028bcb6780)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass | 71 ++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 743bc08..28619c7 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd-json.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -62,7 +62,7 @@ python do_cve_check () {
 }
 
 addtask cve_check after do_unpack before do_build
-do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot cve-check-tool-native:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
@@ -163,61 +163,40 @@ def get_patches_cves(d):
 
 def check_cves(d, patched_cves):
     """
-    Run cve-check-tool looking for patched and unpatched CVEs.
+    Connect to the NVD database and find unpatched cves.
     """
-
     import ast, csv, tempfile, subprocess, io
 
-    cves_patched = []
     cves_unpatched = []
     bpn = d.getVar("CVE_PRODUCT")
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not bpn:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
-    cves = " ".join(patched_cves)
-    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
-    cve_cmd = "cve-check-tool"
-    cmd = [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
-    try:
-        # Write the faux CSV file to be used with cve-check-tool
-        fd, faux = tempfile.mkstemp(prefix="cve-faux-")
-        with os.fdopen(fd, "w") as f:
-            for pn in bpn.split():
-                f.write("%s,%s,%s,\n" % (pn, pv, cves))
-        cmd.append(faux)
-
-        output = subprocess.check_output(cmd).decode("utf-8")
-        bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd), output))
-    except subprocess.CalledProcessError as e:
-        bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))
-    finally:
-        os.remove(faux)
-
-    for row in csv.reader(io.StringIO(output)):
-        # Third row has the unpatched CVEs
-        if row[2]:
-            for cve in row[2].split():
-                # Skip if the CVE has been whitlisted for the current version
-                if pv in cve_whitelist.get(cve,[]):
-                    bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
-                else:
-                    cves_unpatched.append(cve)
-                    bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
-        # Fourth row has patched CVEs
-        if row[3]:
-            for cve in row[3].split():
-                cves_patched.append(cve)
-                bb.debug(2, "%s-%s is patched for %s" % (bpn, pv, cve))
-
-    return (cves_patched, cves_unpatched)
+    import sqlite3
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    conn = sqlite3.connect(db_file)
+    c = conn.cursor()
+    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
+    for row in c.execute(query % (bpn,pv)):
+        cve = row[1]
+        if pv in cve_whitelist.get(cve,[]):
+            bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
+        elif cve in patched_cves:
+            bb.note("%s has been patched" % (cve))
+        else:
+            cves_unpatched.append(cve)
+            bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
+    conn.close()
+
+    return (list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -241,9 +220,10 @@ def get_cve_info(d, cves):
     for row in cur.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
-        cve_data[row[0]]["score"] = row[2]
-        cve_data[row[0]]["modified"] = row[3]
-        cve_data[row[0]]["vector"] = row[4]
+        cve_data[row[0]]["scorev2"] = row[2]
+        cve_data[row[0]]["scorev3"] = row[3]
+        cve_data[row[0]]["modified"] = row[4]
+        cve_data[row[0]]["vector"] = row[5]
     conn.close()
 
     return cve_data
@@ -270,7 +250,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
             unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
+        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
+        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
-- 
1.9.1


