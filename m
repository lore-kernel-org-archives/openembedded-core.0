Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47221C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8398.1709105620778007770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MpSpW4eX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105621; x=1740641621;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i2aiiyUYzVBnh+8rTELLHJ/2XzQzwaURhZD1k5hP5T0=;
  b=MpSpW4eX1LUquJfVhZn6C4s1Yjuknby5qJ8//IWyIxLgjtMbRxsRqA3D
   dpY/W0DP8EKXB78YWXAL+9C5WrbyqSqsQFhATrVqFT0UNDcj9Uy73KXbD
   CwhvY1vc12i4GCdQP5DKZChQhttobw1zRktfOW27/owHDGAwrPc5C1mUg
   vtzX/awpSIMZKFmyqJStlhTzycfZILnHmBwTagwHhyC0sxdkoGZX+T/FX
   4Jq+kcfw3v0Ef+Bi5ySU3UHbJSbnohYhhtBSXGVfqoX32iid+lo9tHQay
   GEa7sD3SlDRssCrGpsVEbK38pglhl5A3jN85F6AWYFvvTSel0xBQi/+8y
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="150677537"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="150677537"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:38 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47E11E8CD9
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:36 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 78FEAE62A5
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16A952008FF8D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:35 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7D1E1A006A;
	Wed, 28 Feb 2024 15:33:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/48] python3-pytest: upgrade 8.0.0 -> 8.0.2
Date: Wed, 28 Feb 2024 15:32:43 +0800
Message-Id: <1709105575-24259-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.741900-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv0ih2sLR7W02Ma
	pnFC68XmLkSb5ZcAwtEnLmQ5uRWv6HZu8+U+rgzSnrsEDDAvkjr5UnqVnIHSzx/IyQ3t7z0DIPR
	+fBGVJy0UrrCEMqs27kzXnGEpKr0pPXdZx1sZHpA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365brwwTP2r1yKG0S+10ZS8XXaRmYpU4vHLUjsKXyzHgcEbrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8Krf9nyHGwfUL2xxj6K3Vuw8ARJj6Coq3m13C0V6Jy/ydZhP4A
	Rcxqv43cLnN1T8D5/A+h0Rx77+hdLGhr2nwIazUqi4DHCoi/Lx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196362

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fix collection on Windows where initial paths contain the short version
 of a path (for example c:\PROGRA~1\tests).
-Fix an IndexError crash raising from getstatementrange_ast.
-Reverted a fix to --maxfail handling in pytest 8.0.0 because it caused a
 regression in pytest-xdist whereby session fixture teardowns may get executed
 multiple times when the max-fails is reached.
-Correctly handle errors from getpass.getuser() in Python 3.13.
-Fix an edge case where ExceptionInfo._stringify_exception could crash
 pytest.raises().
-Fix regression with pytest.warns() using custom warning subclasses which
 have more than one parameter in their __init__.
-Fix a regression in pytest 8.0.0 whereby calling pytest.skip() and similar
 control-flow exceptions within a pytest.warns() block would get suppressed
 instead of propagating.
-Fix a regression in pytest 8.0.0 whereby autouse fixtures defined in a module
 get ignored by the doctests in the module.
-Fix a regression in pytest 8.0.0 whereby items would be collected in reverse
 order in some circumstances.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.0.0.bb => python3-pytest_8.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.0.0.bb => python3-pytest_8.0.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.0.0.bb b/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.0.0.bb
rename to meta/recipes-devtools/python/python3-pytest_8.0.2.bb
index f43796710a..57e979e909 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "249b1b0864530ba251b7438274c4d251c58d868edaaec8762893ad4a0d71c36c"
+SRC_URI[sha256sum] = "d4051d623a2e0b7e51960ba963193b09ce6daeb9759a451844a21e4ddedfc1bd"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


