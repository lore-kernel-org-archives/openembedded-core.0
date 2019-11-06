Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id F01977F83A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 15:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Subject:References:In-Reply-To:Message-Id:Date:Cc:To:From:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bk6c1Ck5QBG2Fl5gV3Psip0i0thbOc8HgAE//KQulig=;
	b=nxfSZLwQw+7+Cf2xkX3cMj4aWE
	NNaCqcM9MynNkaj6P1upuxTrPUtoG27eIdL+zzbW11fXcTB4acqSDdVevtqXQdtG5tUqeqocNAMBc
	k12Yg0kj3JpoWvRNbTG1QhA46kqjxjmCo5g6Vib9yhzaRTbTaRllzYSxOSx4l1DOqNZT5MXuI/DGm
	ortVBmIA+Cu3tlvGbKYYus01QLX1ZIKfGOs0+8KbaT6XhW4+H3BrY4Ud90KMA0dYhZX81Ot5OkvbX
	KR9Y1Jsi+kDjxxK6zG4jn18N1ovgIPjh5EM3dXvnba+nxQqVnzTw2HChsvzTYyziBQe9eI25iAxdB
	jTu1nodw==;
Received: from [2001:67c:1be8::12] (helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1iSNOO-00009k-Ih; Wed, 06 Nov 2019 17:38:45 +0200
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1iSNO4-0007UO-EB; Wed, 06 Nov 2019 17:38:24 +0200
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2019 17:37:21 +0200
Message-Id: <9e2d0df0bd4ab43c8fbf88f1fe12ca995d3df92f.1573047194.git.mikko.rapeli@bmw.de>
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
	9e2d0df0bd4ab43c8fbf88f1fe12ca995d3df92f.1573047194.git.mikko.rapeli@bmw.de
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
Subject: [PATCH RFC CFH][sumo 06/47] cve-update-db: Use std library instead of urllib3
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

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

urllib3 was used in this recipe but it was not set as a
dependency. As it is not specifically needed, rewrite the recipe with
urllib from the standard library.

(From OE-Core rev: c0eabd30d7b9c2517f4ec9229640be421ecc8a5e)

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/cve-update-db.bb | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db.bb b/meta/recipes-core/meta/cve-update-db.bb
index 522fd23..1f48820 100644
--- a/meta/recipes-core/meta/cve-update-db.bb
+++ b/meta/recipes-core/meta/cve-update-db.bb
@@ -19,7 +19,7 @@ python do_populate_cve_db() {
     Update NVD database with json data feed
     """
 
-    import sqlite3, urllib3, shutil, gzip, re
+    import sqlite3, urllib, shutil, gzip, re
     from datetime import date
 
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
@@ -33,16 +33,14 @@ python do_populate_cve_db() {
 
     initialize_db(c)
 
-    http = urllib3.PoolManager()
-
     for year in range(YEAR_START, date.today().year + 1):
         year_url = BASE_URL + str(year)
         meta_url = year_url + ".meta"
         json_url = year_url + ".json.gz"
 
         # Retrieve meta last modified date
-        with http.request('GET', meta_url, preload_content=False) as r:
-            date_line = str(r.data.splitlines()[0])
+        with urllib.request.urlopen(meta_url) as r:
+            date_line = str(r.read().splitlines()[0])
             last_modified = re.search('lastModifiedDate:(.*)', date_line).group(1)
 
         # Compare with current db last modified date
@@ -50,7 +48,7 @@ python do_populate_cve_db() {
         meta = c.fetchone()
         if not meta or meta[0] != last_modified:
             # Update db with current year json file
-            with http.request('GET', json_url, preload_content=False) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
+            with urllib.request.urlopen(json_url) as r, open(JSON_TMPFILE, 'wb') as tmpfile:
                 shutil.copyfileobj(r, tmpfile)
             with gzip.open(JSON_TMPFILE, 'rt') as jsonfile:
                 update_db(c, jsonfile)
-- 
1.9.1


