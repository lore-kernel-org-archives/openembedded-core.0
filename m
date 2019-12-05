Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E06F77F867
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 19:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TQjr336hz5h
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:28:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575574096;
	bh=ZwltAIsRSeBvcxEXzwdxmGiKubhwl6qg9/+hdtp0md0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ty+ms1nIenQlS7VjCYpXO+mWx9bEGflaZpm+SbmNgr5oF0QgJL7ZQ3BFDlXK//4Vg
	E+TUp9STg9PzSWmsIeVzhfzgRzhsE3qi8T2PQNG7jHuOaB9q1USoG4sC9F28IezckI
	CpmDrg52rsyOzdlnU3FMl/sMV/IPTrzZTw2LHdRgb0zdar8BI1BKJ7Pu1av9jrI4mW
	n7Ck/WGB3m76080MWa90WRUSbSE6d0bnfjIfemAepwkTBTKFDo1sPfEwdH8emShefK
	et4Qo7Ad6VyxNXFa/4fTZatCSXc05SyzMzh51jwSa1RgxrdE+OkTJMTV0Tuo69GCR6
	0Abebqgw85YTILCLy2ApYFjLF0mHaJoU0fbBvoqAWDR5Yck4KkufSVGSz9i7d4f6+e
	IcRWAU9yo3qQPlZNhow/NThqIuMmzQt9ZvL7ATIe2yGDRmDw8sBUlRXy4O8whDnrA3
	Jyj4D70egwLj63orNDCdPlm3Yj/B/UD9MSi16XRemkqMoi2VHD8n4vHvlStfgkwTVa
	zXIZV1Ks5lshjRCcwaDxQK9FE7t//Iw/z1IS9zmG7k9tDs5xLThFqmeEV45294vqIg
	0tFEkjOBQkB08ilqetOfCzSxh4xF+IAkmkJ32nVbVbdj7o1nTgICFWBopySqqlgRtS
	GN2Eq2nq79U9CXpL7mOxXo74=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 21:28:14 +0200
Message-Id: <20191205192814.18201-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205192814.18201-1-bunk@stusta.de>
References: <20191205192814.18201-1-bunk@stusta.de>
Subject: [PATCH] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Thu, 05 Dec 2019 19:28:18 -0000

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.7.5.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 110ec315d9..19a2f3e743 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -29,6 +29,9 @@ CVE_CHECK_WHITELIST += "CVE-2017-18207"
 # of Python that cannot really be altered at this point."
 CVE_CHECK_WHITELIST += "CVE-2015-5652"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 57eaaea5e7..da991f5139 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -47,6 +47,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.7"
 PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
-- 
2.17.1


