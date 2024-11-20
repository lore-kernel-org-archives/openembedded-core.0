Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF8ED6E2A3
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 03:09:11 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4761.1732072141109044221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 19:09:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UKJx/Gvf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1732072141; x=1763608141;
  h=from:to:cc:subject:date:message-id;
  bh=Cqf0Fkht1EhYhKMEWdPWojjlDgt5xQ9uM6ItOgb5IQs=;
  b=UKJx/GvfyR2805Z9EORwyjos2sBQgRcuNDFen7nFlr51yJhJeG/clD/Z
   TSqhlzYDHQO3nbnGC2VOKdyVrHuC4VOaVsePuk1nOYEtUBcBnIZQ7CFqH
   IgN0hOvby04cpzmH/jegaHa2OyBX0w4knLQyJFbN1L7Dk/0n9DHabSE2/
   RJKnNk603EhdjKLAnYDXXJOhiqgH50FpalYAQGOMncqdrKdf+XATUGz3k
   QU9fjii9EWmGGBoJMQnpRD+iYrYzEdjMI/ie6So88bju/KI8qw2MRNNK3
   TM8t7mLvkq/74yC6RbT5tW95/2upXr0yqklKcoPpsXe4fq0qFZhWuRIdP
   w==;
X-CSE-ConnectionGUID: A1IF/0RFQDmbMyCAoIPuUA==
X-CSE-MsgGUID: Dpk7qWX+SRefiO0/d3fZJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="169345946"
X-IronPort-AV: E=Sophos;i="6.12,168,1728918000"; 
   d="scan'208";a="169345946"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 12:08:58 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 83AF8D4C70
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:08:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 17314BC836
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:08:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DECD6BC50
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 12:08:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 270CB1A006C;
	Wed, 20 Nov 2024 11:08:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] python3-flit-core: upgrade 3.9.0 -> 3.10.1
Date: Wed, 20 Nov 2024 11:08:49 +0800
Message-Id: <1732072129-19886-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28808.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28808.004
X-TMASE-Result: 10--14.577900-10.000000
X-TMASE-MatchedRID: PXzrFdFmygGjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvMwAYdq1VTXo2Sl
	82u3/XbpzXCukHGwyn2GOrQETBnJLVUasdkyfBDvOGTV4fFD6yDb4QM/D7zGtwvrbFcH4G2rhN0
	Kb2jI1UnJDvFr4liuHN7J5X5VmQ0MWrN4/58ppmK5x7uAXGEprWIw13TP8dlT/gMNehoKqTvom0
	18IDU8WU6ESzBNvR5hdskSexkA2tvNot95wtWvJt9JA2lmQRNUVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOn6y0mNkW0aTzndiJkHFMhEiOBKRPRuNqo8WM
	kQWv6iXBcIE78YqRWo6HM5rqDwqtL2BetUvd+uCOIApvsPDc34CsR6ImQe4+czwKbN0Qwwz9xdy
	QSPn5kA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 03:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207408

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The sdist of "flit_core" now includes the corresponding tests
- flit publish can now use PyPI tokens stored in keyring
- The --python option can now take the path of a virtualenv folder, as an
  alternative to a Python executable
- Flit will work with current development versions of Pythona again
- The flit command line package now requires Python 3.8 or above
- The metadata in packages now has the names of optional dependency groups
  ("extras") normalised, complying with version 2.3 of the metadata standard
- The flit command line package now depends on pip
- Fix potential substitution of environment variables into passwords read
  from .pypirc files
- A warning is now shown when building packages which specify the old
  flit.buildapi backend, which should be replaced by flit_core.buildapi
- Avoid using the deprecated datetime.utcfromtimestamp()
- Flit now has a SECURITY.md file in the Github repository
- The tests for flit_core are no longer part of the installed package,
  reducing the size of the wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...on3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
index b0bef4b6b6..55f200a3ad 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
+SRC_URI[sha256sum] = "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb2a1daa13857a8f1a"
 
 inherit pypi python_flit_core
 
@@ -28,10 +28,4 @@ do_install:class-native () {
     python_pep517_do_bootstrap_install
 }
 
-PACKAGES =+ "${PN}-tests"
-
-FILES:${PN}-tests += "\
-    ${PYTHON_SITEPACKAGES_DIR}/flit_core/tests/* \
-"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


