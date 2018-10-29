Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AAD4979BCA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:42:00 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r10-v6so9451103wrv.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=M7Mi+KGzWEmPkh0M5k69cCc69ToL30fbXzE7MAoRCjs=;
	b=QGUNDguU1wDYehy1YF6WetIiWn9bggOwLl5Jgu+AL0IIZO86PntxtvxSs3r4wnuhtN
	iDuvrHZ5yfYsXffFuckszTBbnflB/kfHyVoQIESalCQSXw+jC/RgQv9JTRKQZMCXvulg
	xl8oLC8AgIyrGulSQzKajrmzdXYjhGAfsPYaW2nkWdhQkv5FicmMC+B7B4EiG1Rf1lFj
	bvYNrv1G4uEQJsfCz10V8CqWwMtSsXSTjR1z3cWa6Qe7yl0/MXkV+fpoyHFn8J5RnAsO
	YbjQOwvvasQf2Oa0X7H9TqfXl3rdEdCJdFAxT7O7wPMzKuEhMz+2FwKVuEimkh7y1QWU
	7z0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=M7Mi+KGzWEmPkh0M5k69cCc69ToL30fbXzE7MAoRCjs=;
	b=Gh/3KE+NvFitsBMSQ7Qw1KotjC/O85q55eVJrEEKh4Ye2tBt7f4Ch4e/tZV6aJvq/S
	afg3Nn+wSRNoDF9IM/19V7rm9+XuS16ksIAMvWYd2cWbx4AGHeGo7nI3+mygnll0jguS
	V/iU9leRzleJZXV3UEf3EpxjTNgNK7ZqbpfW7BQzkt4V/eWNCPynChgDAIPqMfZPSe9F
	8O4QKQ7im8Qfb/p+eApG/vEDIuRAla/m8j81PaORtMEDeEVk+a/Fe+Ew9bGHG00aSl9s
	/o+KKlqsrqEu2w3Uem5/IzeCWyOwt8cGrNhlqLt+vMW8EgipZHdBDmUg2XqrFj7Mlsn3
	I8ag==
X-Gm-Message-State: AGRZ1gIWd6p2UTt/G7uo/seJhT+yVuE8AAtdyaYgKACnvGZF5FrO9ebm
	qkbU6E/HwvxKOlHL6cQ1zYKbHFsa078=
X-Google-Smtp-Source: AJdET5eCIqwcx1r1gBb9pfN/rBH2xbRMtvHjSESHXWd2SAQFeA7C53FtSJBdbBrn38tJNBYL/J+4Fw==
X-Received: by 2002:adf:fa04:: with SMTP id
	m4-v6mr15263166wrr.155.1540831320672; 
	Mon, 29 Oct 2018 09:42:00 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j16-v6sm15361144wrq.89.2018.10.29.09.41.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:42:00 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Oct 2018 16:41:57 +0000
Message-Id: <20181029164157.13253-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] python: add missing CVE tag to patches
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
X-List-Received-Date: Mon, 29 Oct 2018 16:42:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch   | 4 +---
 .../0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch   | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
index 42c64caaee4..3c0d6622966 100644
--- a/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-34623-Use-XML_SetHashSalt-in-_elementtree-GH.patch
@@ -19,9 +19,7 @@ Co-authored-by: Christian Heimes <christian@python.org>
 https://bugs.python.org/issue34623
 
 Upstream-Status: Backport
-
-Fix CVE-2018-14647
-
+CVE: CVE-2018-14647
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  Include/pyexpat.h                                                  | 4 +++-
diff --git a/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch b/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
index e6fe5f2cc46..125db8512a9 100644
--- a/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
+++ b/meta/recipes-devtools/python/python/0001-closes-bpo-34540-Convert-shutil._call_external_zip-t.patch
@@ -5,9 +5,7 @@ Subject: [PATCH] closes bpo-34540: Convert shutil._call_external_zip to use
  subprocess rather than distutils.spawn. (GH-8985)
 
 Upstream-Status: Backport
-
-Fix CVE-2018-1000802
-
+CVE: CVE-2018-1000802
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
  Lib/shutil.py                                            | 16 ++++++++++------
-- 
2.11.0


