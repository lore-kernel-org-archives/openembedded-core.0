Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id C4B167F891
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+uAmsNdOiqgt8OSTu85uxcS/M7j50AUq8Ya4hh81uR0=;
	b=JuMM1G3q1cLqW59NYni11zxoAf
	1SZVGJydyn0XER3ntIluDivSgBoiYuUFsa8JwJHazlZ2kl5pki6OZYSqtBZtKvdEKTh/b0zSenRd3
	CmmT9Nr40/Aiytz9FSdYSwgrYIGqxUT5XEn3ybRkrw3C94aRU2WPUVWetJf8azAa6HcMsT0yDpKXC
	Jfx3gv0PJA9xcQ6D/ArFqV0YiUMOUvtUr/iqeEF56GxwiR5DAL+ghFCWl0QGnCRjyuj7rkZgNK4EW
	i9+hK+73HB6FYpB2mJl5Gt0DWlSWgH7b+aCEHI1SsS47fVrY2O/4OOUL6F2FwoupvaRKDr+t8UU8a
	WULI8frA==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009b-5r; Wed, 06 Nov 2019 17:38:47 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007TD-0l; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:16 +0200
Message-Id: <976042c33ad489db6526a1675420739fddb5b3de.1573047194.git.mikko.rapeli@bmw.de>
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
	976042c33ad489db6526a1675420739fddb5b3de.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 01/47] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:47 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

cve-check-tool-native do_populate_cve_db task was using deprecated NVD
xml data feeds, cve-update-db uses NVD json data feeds.

Sqlite database schema was updated to take into account CVSSv3 CVE
scores and operator in affected product versions.
A new META table was added to store the last modification date of the
NVD json data feeds.

(From OE-Core rev: 546d14135c50c6a571dfbf3baf6e9b22ce3d58e0)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Conflicts:
	meta/conf/distro/include/maintainers.inc
---
 meta/conf/distro/include/maintainers.inc |   2 +-
 meta/recipes-core/meta/cve-update-db.bb  | 121 +++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/meta/cve-update-db.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 48aff95..a299177 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -122,7 +122,7 @@ RECIPE_MAINTAINER_pn-cryptodev-module = "Robert Yang <liezhi.yang@windriver.com>
 RECIPE_MAINTAINER_pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-cve-check-tool = "Ross Burton <ross.burton@intel.com>"
+RECIPE_MAINTAINER_pn-cve-update-db = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-cwautomacros = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-damageproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
new file mode 100644
index 0000000..522fd23
--- /dev/null
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -0,0 +1,121 @@
+SUMMARY = "Updates the NVD CVE database"
+LICENSE = "MIT"
+
+INHIBIT_DEFAULT_DEPS = "1"
+PACKAGES = ""
+
+inherit nopackages
+
+deltask do_fetch
+deltask do_unpack
+deltask do_patch
+deltask do_configure
+deltask do_compile
+deltask do_install
+deltask do_populate_sysroot
+
+python do_populate_cve_db() {
+    """
+    Update NVD database with json data feed
+    """
+
+    import sqlite3, urllib3, shutil, gzip, re
+    from datetime import date
+
+    BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
+    YEAR_START = 2002
+    JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+
+    # Connect to database
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    conn = sqlite3.connect(db_file)
+    c = conn.cursor()
+
+    initialize_db(c)
+
+    http = urllib3.PoolManager()
+
+    for year in range(YEAR_START, date.today().year + 1):
+        year_url = BASE_URL + str(year)
+        meta_url = year_url + ".meta"
+        json_url = year_url + ".json.gz"
+
+        # Retrieve meta last modified date
+        with http.request('GET', meta_url, preload_content=False) as r:
+            date_line = str(r.data.splitlines()[0])
+            last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
+
+        # Compare with current db last modified date
+        c.execute("select DATE from META where YEAR = '%d'" % year)
+        meta = c.fetchone()
+        if not meta or meta[0] != last_modified:
+            # Update db with current year json file
+            with http.request('GET', json_url, preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+                shutil.copyfileobj(r, tmpfile)
+            with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
+                update_db(c, jsonfile)
+            c.execute("insert or replace into META values (?, ?)",
+                    [year, last_modified])
+
+    conn.commit()
+    conn.close()
+
+    with open(d.getVar("CVE_CHECK_TMP_FILE"), 'a'):
+        os.utime(d.getVar("CVE_CHECK_TMP_FILE"), None)
+}
+
+# DJB2 hash algorithm
+def hash_djb2(s):
+    hash = 5381
+    for x in s:
+        hash = (( hash << 5) + hash) + ord(x)
+
+    return hash & 0xFFFFFFFF
+
+def initialize_db(c):
+    c.execute("CREATE TABLE IF NOT EXISTS META (YEAR INTEGER UNIQUE, DATE TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS NVD (ID TEXT UNIQUE, SUMMARY TEXT, \
+        SCOREV2 TEXT, SCOREV3 TEXT, MODIFIED INTEGER, VECTOR TEXT)")
+    c.execute("CREATE TABLE IF NOT EXISTS PRODUCTS (HASH INTEGER UNIQUE, ID TEXT, \
+        VENDOR TEXT, PRODUCT TEXT, VERSION TEXT, OPERATOR TEXT)")
+    c.execute("CREATE INDEX IF NOT EXISTS PRODUCT_IDX ON PRODUCTS \
+        (PRODUCT, VERSION)")
+
+def update_db(c, json_filename):
+    import json
+    root = json.load(json_filename)
+
+    for elt in root['CVE_Items']:
+        if not elt['impact']:
+            continue
+
+        cveId = elt['cve']['CVE_data_meta']['ID']
+        cveDesc = elt['cve']['description']['description_data'][0]['value']
+        date = elt['lastModifiedDate']
+        accessVector = elt['impact']['baseMetricV2']['cvssV2']['accessVector']
+        cvssv2 = elt['impact']['baseMetricV2']['cvssV2']['baseScore']
+
+        try:
+            cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+        except:
+            cvssv3 = 0.0
+
+        c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
+                [cveId, cveDesc, cvssv2, cvssv3, date, accessVector])
+
+        for vendor in elt['cve']['affects']['vendor']['vendor_data']:
+            for product in vendor['product']['product_data']:
+                for version in product['version']['version_data']:
+                    product_str = cveId+vendor['vendor_name']+product['product_name']+version['version_value']
+                    hashstr = hash_djb2(product_str)
+                    c.execute("insert or replace into PRODUCTS values (?, ?, ?, ?, ?, ?)",
+                            [ hashstr, cveId, vendor['vendor_name'],
+                                product['product_name'], version['version_value'],
+                                version['version_affected']])
+
+
+
+addtask do_populate_cve_db before do_cve_check
+do_populate_cve_db[nostamp] = "1"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
1.9.1


