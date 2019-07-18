Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 395157EED0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 20:04:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id v15so26762494wml.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2019 13:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MRY8twQbB4kLOeIAk60Sx+YuDxGOWCMZT8O+ttNJhus=;
	b=lwsl9/7jVpVq8ICiAqN+BigheBOiPYes9YVepv6Ac7eJgqUxAZuX2GBhN8gIXcau9k
	8DvdJA+T3MGmWMA7mnliBKlnnCR6LY0QzgHDHXr7gQu2+3ZoU8cc5yC8jQYpdlr2aaMU
	q6O9Ll/sbpbrGr5YDGz1wgv9qDJXuzK+RI6H3JGt2r/252CNM0ybhu8CVfGBD8Z8r++t
	akqrY3zL/ZSQKG4HfaT3fbhcbwZ25V5dJbi3dccDbexvQhvNqPXAEWtUwPThGgeE/Rno
	e1HwpD/QNboPkpAduwwKUd63lWJZs0ng0EaiWISG3j5rKxWQr66zmbp8KeUSI0MLGcub
	1KFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MRY8twQbB4kLOeIAk60Sx+YuDxGOWCMZT8O+ttNJhus=;
	b=HKY5qyBNZWl1XkDZLuqTe3TRFYrza39e8WVTApMVs6Und8mob+EBimXgCnbIxrZFyP
	mRJP9Ug36knXLD0arpcN6btLenKR4UAO79Ody+RXkwbHGZbGBqhfUpRwMZkrmSvisqWJ
	e/2CldlFfnvHjkpl9W0TjjWz/3LTFMBuHsH6ygKY8z3APZ8tS1KAeqc7QtsURQVEApC5
	8H7ZEFYvOe4DdkAnagl8R9aqx9jekLmReF36rVD61RRTsepkapeMJA4kK6ECKfRHh6BT
	WNGD3QRFk5XSd9+QiMuKhtjuVnDVOZeyzsXRpaW7KKFaSa8BnFccIM6PYHT2jSTcbxmj
	q41Q==
X-Gm-Message-State: APjAAAUSCgnR60Y1D35/khb027AIIW2yh7KIEsBNkE9Nofh2sMGILS2l
	BDki+gQT4kwWY1G+HzjklJw8RAGdCO4=
X-Google-Smtp-Source: APXvYqww42Sp+uH7i5oe8qbFzdvMmGl5HDYlomSE7YqnwyPO+w7zN8saDE64SGyq0EnFvb7gL4Z3IA==
X-Received: by 2002:a1c:f409:: with SMTP id z9mr36638356wma.176.1563480243625; 
	Thu, 18 Jul 2019 13:04:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r12sm35331858wrt.95.2019.07.18.13.04.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 18 Jul 2019 13:04:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2019 21:03:58 +0100
Message-Id: <20190718200400.19750-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] cve-update-db-native: use os.path.join instead of +
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
X-List-Received-Date: Thu, 18 Jul 2019 20:04:03 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 3519beae5fb..9047513dbdf 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -29,11 +29,11 @@ python do_populate_cve_db() {
     BASE_URL = "https://nvd.nist.gov/feeds/json/cve/1.0/nvdcve-1.0-"
     YEAR_START = 2002
 
-    db_dir = d.getVar("DL_DIR") + '/CVE_CHECK'
-    db_file = db_dir + '/nvdcve_1.0.db'
-    json_tmpfile = db_dir + '/nvd.json.gz'
+    db_dir = os.path.join(d.getVar("DL_DIR"), 'CVE_CHECK')
+    db_file = os.path.join(db_dir, 'nvdcve_1.0.db')
+    json_tmpfile = os.path.join(db_dir, 'nvd.json.gz')
     proxy = d.getVar("https_proxy")
-    cve_f = open(d.getVar("TMPDIR") + '/cve_check', 'a')
+    cve_f = open(os.path.join(d.getVar("TMPDIR"), 'cve_check'), 'a')
 
     if not os.path.isdir(db_dir):
         os.mkdir(db_dir)
-- 
2.20.1


