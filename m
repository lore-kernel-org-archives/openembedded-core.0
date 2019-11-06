Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 501E37FA52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/PNvWMNIMaxKymA/joVlWxO0+RA3+35lQmejCF/097Y=;
	b=FE8dHwA0TLWI2o6IHORm0RCANJ
	fVnFZNB40w0OOJUcSl3b5hPUmfyV2RJFWAJTtl//o3hnbEuXj+U/xjE8k+t8oijNO6g9f31qBr5nk
	Obk/SpMjzxRidc3XGceAuKt0k82sBidDpAED/7VJddHcdpOC+ngcK4UnoxxrcFb2en3gGGVNBYyHp
	tCJwIFxOk627RfRO4ua9qm5Wi7fHfhKhLLHNTS128icNGjQi4TcgG3zFvffjPmTPyeWZ8Q1s8Qm6E
	dhPtoeBxxFWTASy2lWVYSk9ye0pDR08895ZafJg6OYGBkIj5AHTfgJidyB55neQ4DftVTrjye8QWY
	DW9wp8dA==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOc-0008VU-Qk; Wed, 06 Nov 2019 17:38:59 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007WR-Hd; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:36 +0200
Message-Id: <bf5d8fa02c58fe8488e9f2a3bbc2fd0439bfad73.1573047194.git.mikko.rapeli@bmw.de>
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
	bf5d8fa02c58fe8488e9f2a3bbc2fd0439bfad73.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 21/47] cve-update-db-native: Remove hash column from database.
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:58 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

djb2 hash algorithm was found to do collisions, so the database was
sometime missing data. Remove this hash mechanism, clear and populate
elements from scratch in PRODUCTS table if the current year needs an
update.

(From OE-Core rev: 78de2cb39d74b030cd4ec811bf6f9a6daa003d19)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/cve-check.bbclass                 | 12 ++++++------
 meta/recipes-core/meta/cve-update-db-native.bb | 21 +++++++--------------
 2 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 512d4c7..c00d291 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvdcve_1.0.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -200,11 +200,11 @@ def check_cves(d, patched_cves):
             c.execute("SELECT * FROM PRODUCTS WHERE PRODUCT IS ?", (product,))
 
         for row in c:
-            cve = row[1]
-            version_start = row[4]
-            operator_start = row[5]
-            version_end = row[6]
-            operator_end = row[7]
+            cve = row[0]
+            version_start = row[3]
+            operator_start = row[4]
+            version_end = row[5]
+            operator_end = row[6]
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index cd27044..af2946b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -25,7 +25,7 @@ python do_populate_cve_db() {
     YEAR_START = 2002
 
     db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
-    db_file = db_dir + '/nvdcve.db'
+    db_file = db_dir + '/nvdcve_1.0.db'
     json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
     cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
@@ -60,6 +60,10 @@ python do_populate_cve_db() {
         c.execute("select DATE from META where YEAR = ?", (year,))
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
+            # Clear products table entries corresponding to current year
+            cve_year = 'CVE-' + str(year) + '%'
+            c.execute("delete from PRODUCTS where ID like ?", (cve_year,))
+
             # Update db with current year json file
             req = urllib.request.Request(json_url)
             if proxy:
@@ -86,27 +90,16 @@ python do_populate_cve_db() {
     conn.close()
 }
 
-# DJB2 hash algorithm
-def hash_djb2(s):
-    hash = 5381
-    for x in s:
-        hash = (( hash << 5) + hash) + ord(x)
-
-    return hash & 0xFFFFFFFF
-
 def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
     c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
         SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
-    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
+    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (ID TEXT, \
         VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
         VERSION_END TEXT, OPERATOR_END TEXT)")
 
 def insert_elt(c, db_values):
-    product_str = db_values[0] + db_values[1] + db_values[2] + db_values[3]
-    hashstr = hash_djb2(product_str)
-    db_values.insert(0, hashstr)
-    query = "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)"
+    query = "insert into PRODUCTS values (?, ?, ?, ?, ?, ?, ?)"
     c.execute(query, db_values)
 
 def parse_node_and_insert(c, node, cveId):
-- 
1.9.1


