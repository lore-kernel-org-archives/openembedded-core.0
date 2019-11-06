Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 685887F896
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kKd7mxp3KJOA8MCwxynCP+jo8y6gK1KAeNAfCA9Z0tU=;
	b=W0jBCnB0RkNdbNbsqNducfImDs
	piZkZciIeHjRYbJ/pbmPKnNBWOVhv+chS2phwVWki/Tp7aXIOvMa6vki9m8tSqT1JLZUn9L4W+J39
	y0Ld1EtjC/6sC6+tCmvqk9yP7wlv10LqHXE7j3XJs715vx7VhXQ3n70Lqj/2raNjM9ds/+LBNqpSM
	BKYVkzjnMRtRuW/F+hAlOIKfYQmiuCBgdPRFkP+gZYRTh+9I2M8zk+CWWf9aZKWQdnv8euv9aoivW
	xxE+xzHN8YEdOFy5YqFyn3ztTVUGa3vkSXvxkkekuB4q0eASlE+ZR5T2fTT4pwh74wBm+i+6ywqzk
	cAemoqbw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009s-NC; Wed, 06 Nov 2019 17:38:46 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007Ub-J3; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:23 +0200
Message-Id: <10ab6862187d573582e9c77417336838d325b69e.1573047194.git.mikko.rapeli@bmw.de>
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
	10ab6862187d573582e9c77417336838d325b69e.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 08/47] cve-update-db: Manage proxy if needed.
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
X-List-Received-Date: Wed, 06 Nov 2019 15:38:46 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

If https_proxy environment variable is defined, manage proxy to be able
to download meta and json data feeds from https://nvd.nist.gov

(From OE-Core rev: 09be21f4d1793b1e26e78391f51bfc0a27b76deb)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 1f48820..4c896dc 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -25,6 +25,7 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
     JSON_TMPFILE = d.getVar("CVE_CHECK_DB_DIR") + '/nvd.json.gz'
+    proxy = d.getVar("https_proxy")
 
     # Connect to database
     db_file = d.getVar("CVE_CHECK_DB_FILE")
@@ -39,7 +40,10 @@ python do_populate_cve_db() {
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        with urllib.request.urlopen(meta_url) as r:
+        req = urllib.request.Request(meta_url)
+        if proxy:
+            req.set_proxy(proxy, 'https')
+        with urllib.request.urlopen(req) as r:
             date_line = str(r.read().splitlines()[0])
             last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
 
@@ -48,7 +52,10 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-            with urllib.request.urlopen(json_url) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            req = urllib.request.Request(json_url)
+            if proxy:
+                req.set_proxy(proxy, 'https')
+            with urllib.request.urlopen(req) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
             with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
                 update_db(c, jsonfile)
-- 
1.9.1


