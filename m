Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A78ED7FA88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 22:13:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b11so951849wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rWeYatW3qrAK2McH4FAaYl6YFFDJukQ8lNRElosSY2s=;
	b=YMTFPrutYrRq7OGhmP4i6iuA8hXSVtPaVMhjQLshi9MlHf+tSjOx6nIrjRcfG6oV+Z
	JYwo3FkqzcF2Bea6fLg/ME3HHDBExICg2xS/qFN1uyZbKrgxldjzrNsgvB/xVqOK4r9+
	9wqbC0dr4Z0hfWplaUXjoSQxaDZQa8ORPxi8dwY+6GT70xnJH1QCXlTof/MILwkCF7cn
	995CSltR1xKkqr5MJ/XhDEs6J+QoIKmqqONAYxrCqAx/tGzRjM4nSUlVBBSipIXB4buh
	xvRnkvylrb5M8I6tsdEL+diQ/e7o69aNezhSO4skQTqENxmzKyO+aPlPQV7cw2YrCatl
	ehMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rWeYatW3qrAK2McH4FAaYl6YFFDJukQ8lNRElosSY2s=;
	b=nkxHd6oFjSroPsWx7EOJRhsXK7/uqNUUzR3v7Z5YbsgjsA6iqV6mjDVviLZAUMfa/u
	+UfHHNWBHxfcNjE6yq/Hk9wFRXjAwB7a6VNO4eBydSYBIsJd1lRtxJs4DNlNk7Fclfir
	wAZDlUQmzBqwmkrezX6aFkaU5iSqFjpFJ+T68IBTxF3npdBvargErmoO+0SPnZ18BotX
	GptaM1WMAEQrpJyqGjgEznl2+e9kikh2/b8xdS22Q+YniZlr9SGvYciaIN574PonGcrS
	NLJjA3AJKsdCKABwOGiTgsNRKmBNzNcw61bVCCPAOdPBfDKrtJl26IMvylvgDgN647bj
	tCig==
X-Gm-Message-State: APjAAAVWkUOLBGzxJN6bQwBjFe654pUdkI9lc9Da2mEZpLNxCT2m/fD3
	5jtzSPBHoUL/uqN2vRV2ErDMJB6Snio=
X-Google-Smtp-Source: APXvYqxJks7QbA6h16jHKbvY70Q4Ic2irBAftnBG41lGmrQ6wWlAx0aCgzhU2hvDEXaZo6VLTlph+A==
X-Received: by 2002:a1c:152:: with SMTP id 79mr988658wmb.70.1573510421037;
	Mon, 11 Nov 2019 14:13:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	d11sm24900083wrf.80.2019.11.11.14.13.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 14:13:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 22:13:34 +0000
Message-Id: <20191111221337.20332-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/4] cve-update-db-native: don't hardcode the database name
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
X-List-Received-Date: Mon, 11 Nov 2019 22:13:41 -0000
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


