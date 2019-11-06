Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 4E68E7F9B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tKDxtQSYd53Nc6NAO/qBfsjgWF9nlQUkD9GHkaYKoQo=;
	b=MO5lL9p8aCmoldA7fn9D+YZQmY
	uY8zoBLo+WWMCMzS1NDbziAyZFIFrx48gd4rwvFNa/ypKxVLae2RrSuV/0n2W86mHn1fnjTy9N+Pn
	CTVC5sf7T9wJhTJZpLEMJqp/+BNVcj/Vld0R/8YmYO0PD/JB0MjZQbAT5kxZlU6ztvFZ7lV3uiPSu
	BB2lwI2+b4JatkR9De8kfHU0eAA678PV//U5TPqw4G7YrHUgInZB/WeJvRjrzsd3rlJnkyn1TQ4my
	UNIlhRW9Npz8xnHr73Jkxc8al43MNo0kBk9ok6Kc9kNMVyei2nG0A+qT9iuw3gGDfz6SFkbpqOfPo
	+vwqCRdw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOc-0008Vv-Qw; Wed, 06 Nov 2019 17:38:59 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO5-0007WI-FT; Wed, 06 Nov 2019 17:38:25 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:35 +0200
Message-Id: <c86499e648ba2946576126cd10a72bb212da1230.1573047194.git.mikko.rapeli@bmw.de>
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
	c86499e648ba2946576126cd10a72bb212da1230.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 20/47] cve-update-db: Use NVD CPE data to populate PRODUCTS table
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

Instead of using expanded list of affected versions that is not
reliable, use the 'cpe_match' node in the 'configurations' json node.

For cve-check to correctly match affected CVE, the sqlite database need to
contain operator_start, operator_end and the corresponding versions fields.

(From OE-Core rev: f7676e9a38d595564922e5f59acbc69c2109a78f)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 88 ++++++++++++++++++++++----
 1 file changed, 74 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index d60159b..cd27044 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -25,7 +25,7 @@ python do_populate_cve_db() {
     YEAR_START = 2002
 
     db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
-    db_file = db_dir + '/nvd-json.db'
+    db_file = db_dir + '/nvdcve.db'
     json_tmpfile = db_dir + '/nvd.json.gz'
     proxy = d.getVar("https_proxy")
     cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
@@ -99,9 +99,76 @@ def initialize_db(c):
     c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
         SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
     c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
-        VENDOR TEXT, PRODUCT TEXT, VERSION TEXT, OPERATOR TEXT)")
-    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_IDX ON PRODUCTS \
-        (PRODUCT, VERSION)")
+        VENDOR TEXT, PRODUCT TEXT, VERSION_START TEXT, OPERATOR_START TEXT, \
+        VERSION_END TEXT, OPERATOR_END TEXT)")
+
+def insert_elt(c, db_values):
+    product_str = db_values[0] + db_values[1] + db_values[2] + db_values[3]
+    hashstr = hash_djb2(product_str)
+    db_values.insert(0, hashstr)
+    query = "insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?, ?, ?)"
+    c.execute(query, db_values)
+
+def parse_node_and_insert(c, node, cveId):
+    # Parse children node if needed
+    try:
+        for child in node['children']:
+            parse_node_and_insert(c, child, cveId)
+    except:
+        pass
+
+    # Exit if the cpe_match node does not exists
+    try:
+        cpe_match = node['cpe_match']
+    except:
+        return
+
+    for cpe in cpe_match:
+        if not cpe['vulnerable']:
+            return
+        cpe23 = cpe['cpe23Uri'].split(':')
+        vendor = cpe23[3]
+        product = cpe23[4]
+        version = cpe23[5]
+
+        if version != '*':
+            # Version is defined, this is a '=' match
+            db_values = [cveId, vendor, product, version, '=', '', '']
+            insert_elt(c, db_values)
+        else:
+            # Parse start version, end version and operators
+            op_start = ''
+            op_end = ''
+            v_start = ''
+            v_end = ''
+
+            try:
+                if cpe['versionStartIncluding']:
+                    op_start = '>='
+                    v_start = cpe['versionStartIncluding']
+            except:
+                pass
+            try:
+                if cpe['versionStartExcluding']:
+                    op_start = '>'
+                    v_start = cpe['versionStartExcluding']
+            except:
+                pass
+            try:
+                if cpe['versionEndIncluding']:
+                    op_end = '<='
+                    v_end = cpe['versionEndIncluding']
+            except:
+                pass
+            try:
+                if cpe['versionEndExcluding']:
+                    op_end = '<'
+                    v_end = cpe['versionEndExcluding']
+            except:
+                pass
+
+            db_values = [cveId, vendor, product, v_start, op_start, v_end, op_end]
+            insert_elt(c, db_values)
 
 def update_db(c, json_filename):
     import json
@@ -125,16 +192,9 @@ def update_db(c, json_filename):
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
                 [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
 
-        for vendor in elt['cve']['affects']['vendor']['vendor_data']:
-            for product in vendor['product']['product_data']:
-                for version in product['version']['version_data']:
-                    product_str = cveId+vendor['vendor_name']+product['product_name']+version['version_value']
-                    hashstr = hash_djb2(product_str)
-                    c.execute("insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?)",
-                            [ hashstr, cveId, vendor['vendor_name'],
-                                product['product_name'], version['version_value'],
-                                version['version_affected']])
-
+        configurations = elt['configurations']['nodes']
+        for config in configurations:
+            parse_node_and_insert(c, config, cveId)
 
 
 addtask do_populate_cve_db before do_fetch
-- 
1.9.1


