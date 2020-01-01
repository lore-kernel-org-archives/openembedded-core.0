Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id AFC3B7F7DD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 18:51:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47p0cN5WqGzQr
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jan 2020 19:51:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577904661;
	bh=QiriymHGXXFviekXn8j6+0jOvFM59vQWR+sy+7KaH/8=;
	h=From:To:Subject:Date:From;
	b=o6TM05FgVwldHc0Xj2fitSwppotHZUnfOjN0Hb+7OL+oHdvSiO5SD/pX7e9Ng+bLa
	YyYAuYdJ/mnlOVZxNfhHAL/qx2E7zpSbYerPW+fiMR+Xot5GWR2+pcNBMZNvz5WCJb
	FctlARKaVdomW00t5k0bG4IDcxh5FwrzWFteFd8ICKr5TXPvXdELpvDGFGhEbg1N3Q
	UP2BjM87OXztIL7fC4hUTHAMPZsNn2yxL165arvszwBg08eR7c6ZPevIUbvjZAazda
	9pseerXpEu0tYhogG5mgzjQZlN+zy/HAydu5cUfBpZRpbtmoEBrQGUIbZBjHLrUsJp
	FeeR/yYQoc0ilIeLYRUKGLx2j2TpD3HU681k2s51aYlXD8+M32mUUKILRxxGVykc1w
	tiX4byMzfhaU0JX8oAKxdP27Z8shCkNQDwkZnRCtwFWCLYdtRkkpK9XNRnMNL/SVKo
	2/648C/OWeXlYAf3YIfvLryCcJG1L11WBY2CwayZYXtfgjJIFqFvupAZH0ZK/mhpeV
	ZASmVylsZVlgLFqE2CQqlOqMaxNY0JAqYUynaIYVs5CxMggtA1whh6odbTzO1Gr5LZ
	3wHXLJ4LVcFMdAvH9WDFNsUXntYW2/LoNsVpwRs9HZMWypVytIRwsM7wuEgfNaBB0C
	JhSD0nJ2zjMUrvb9LnndDwTQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jan 2020 20:50:59 +0200
Message-Id: <20200101185059.8139-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v4] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Wed, 01 Jan 2020 18:51:02 -0000

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.7.6.bb | 3 +++
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
diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index e3d14fe45f..4849cd59ba 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -47,6 +47,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.7"
 PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
-- 
2.17.1


