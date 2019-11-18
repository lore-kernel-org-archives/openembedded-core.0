Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id F23A97F8A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:46:52 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t26so19742254wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 08:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rWeYatW3qrAK2McH4FAaYl6YFFDJukQ8lNRElosSY2s=;
	b=jCwvK+xf8eYy//5qQyKFctpY9oMTIIFId5+yAHRsmFp0/j8Smgi3F742ep7MQ1obLm
	qkB6fRhFSm9wjPkpFVKjM96QFew9L8kLku1tWwSqdHAAiHfhBhJBHrJQjA4UaGmsgmWe
	9eZE/C6ESToE1ELy8vvfWv1xw7EEiAU9dVHwNaw2AS1h9Maj4zqRl+jlxgzID2SRjqOY
	wGwKqhMmW3JFPNbmiy+UeaocxR2/p+nibLUZozsD24ijFhCEv78sI0YAUOO6KTwjJCJg
	dbVrx23P7hhZviI5JyrQrsOKUVpAeMzd8MQgp5Gmr2b/3UgVDVM4vjSnhf4nfsCEzUIk
	tkag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rWeYatW3qrAK2McH4FAaYl6YFFDJukQ8lNRElosSY2s=;
	b=oSO2TCR8iyZhiUJWNvYUbsBHc/g74oVOypFvp1NhHuf2KkdeJC8/NRtMPL7IiK5Th4
	hOaZ3Rsa5Rtyoig5g6J33EjceVrE3rAstu3qk+GBtTpw6rfILkvvSxlvorzEgrIhuj84
	g9SZIIpcyQ/0RT3RFLRx7tsQji7GIOhLlkHQq4vXLUr8iBiQYPhgsMoSiLORliYQaqD5
	2Owpl1csrNchGGhhvI0qfVIAF6U7amMKkvdnr9xgU4oAAwopp6MNQSRoQMo9b+Xrsj21
	8FVY9YauRoYzrSk7oQIPxdY1FSvrmMiHlimAW4dVS0XKjSxvaSuoPCBzkLDjp+AfY7fK
	11lA==
X-Gm-Message-State: APjAAAWqWyI034AkjC4pXZ7Uy5vZkSOpg/bndy7228t3IzoQnbBt/FGA
	TF0hJRbpp0PvTswJ65DDb+ieDYi1nB8=
X-Google-Smtp-Source: APXvYqwHI4rXoh5KY56jJJRGQm8d4t09we8GY2UoO3A6hkPhQPrvCZevXkerOWayLoV1/zpMLU1Xdw==
X-Received: by 2002:a05:600c:210b:: with SMTP id
	u11mr31263547wml.170.1574095613398; 
	Mon, 18 Nov 2019 08:46:53 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y189sm20936208wmb.13.2019.11.18.08.46.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 08:46:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 16:46:42 +0000
Message-Id: <20191118164647.29409-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/6] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Mon, 18 Nov 2019 16:46:53 -0000
Content-Transfer-Encoding: 8bit

Don't hardcode the database filename, there's a variable for this in
cve-check.bbclass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 19875a49b1c..c15534de08b 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -28,8 +28,8 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
 
-    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
-    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    db_dir = os.path.dirname(db_file)
     json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
 
     # Don't refresh the database more than once an hour
-- 
2.20.1


