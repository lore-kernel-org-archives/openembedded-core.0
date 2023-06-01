Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EB3C7EE32
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.26247.1685610245060064069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118987827"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118987827"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:03 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 39395CA1E6
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:00 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 60970D9A7B
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:59 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5B5388864;
	Thu,  1 Jun 2023 18:03:58 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 23.0.1 -> 23.1.2
Date: Thu,  1 Jun 2023 17:03:22 +0800
Message-Id: <1685610221-29015-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--8.199900-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/ybPx3rO+jk2QU10v8Z/tuKv9wRnyxuPjhC1z
	lIt4pgOir2AKsL23/l6MkrRACx129kqkgzox/CQabFnnYKyTEP6OVBD4weLV08H0F6hf9KOrvzw
	O+NG8XgB3jugY9H2JvOvFlxA2vcJWdWlhnkctMWMyByMiwk6+3sRifqlXFLN+M6eIOeX50Fi1jg
	3WdTw5hO7sooBb9tva9fa51lwdCgnKIgSQbVDf+jllFsU0CXSPjkDrBOJwwnT7s8CQBJM67iYTW
	WrcXNI0w6jXr/PvLFupXR7NA6GzIu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg6
	1kSK4DiBkESMI05d4s7z4hZQ3bEbDytg73Zv02ZvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1DLghvnwMqtp8l5DHggTLzj7T5vS+t40prRnpI2WbK9RoBrUFtyMfKQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182071

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  -Copyright changed from "(C) 2016 Jason R Coombs <jaraco@jaraco.com>"
   to "Jason R. Coombs"
  -The wrapping position has been adjusted

Changelog:
===========
- Upgrade setuptools to 67.7.2
- Revert #11487, as it causes issues with virtualenvs created by the Windows
  Store distribution of Python. (#11987)
- Fix grammar by changing "A new release of pip available:" to "A new release
  of pip is available:" in the notice used for indicating that. (#11529)
- Normalize paths before checking if installed scripts are on PATH. (#11719)
- Correct the way to decide if keyring is available. (#11774)
- More consistent resolution backtracking by removing legacy hack related to
  setuptools resolution (#11837)
- Include AUTHORS.txt in pip's wheels. (#11882)
- The uninstall and install --force-reinstall commands no longer call
  normalize_path() repeatedly on the same paths. Instead, these results are
  cached for the duration of an uninstall operation, resulting in improved
  performance, particularly on Windows. (#11889)
- Fix and improve the parsing of hashes embedded in URL fragments. (#11936)
- When package A depends on package B provided as a direct URL dependency
  including a hash embedded in the link, the --require-hashes option did not
  warn when user supplied hashes were missing for package B. (#11938)
- Correctly report requested_extras in the installation report when extras
  are specified for a local directory installation. (#11946)
- When installing an archive from a direct URL or local file, populate
  download_info.info.hashes in the installation report, in addition to the
  legacy download_info.info.hash key. (#11948)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_23.0.1.bb => python3-pip_23.1.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_23.0.1.bb => python3-pip_23.1.2.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip_23.0.1.bb b/meta/recipes-devtools/python/python3-pip_23.1.2.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_23.0.1.bb
rename to meta/recipes-devtools/python/python3-pip_23.1.2.bb
index d9b9906ff9..a0ebd765bf 100644
--- a/meta/recipes-devtools/python/python3-pip_23.0.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.1.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
-                    file://src/pip/_vendor/pkg_resources/LICENSE;md5=9a33897f1bca1160d7aad3835152e158 \
+                    file://src/pip/_vendor/pkg_resources/LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6 \
                     file://src/pip/_vendor/platformdirs/LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a \
                     file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
                     file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "cd015ea1bfb0fcef59d8a286c1f8bebcb983f6317719d415dc5351efb7cd7024"
+SRC_URI[sha256sum] = "0e7c86f486935893c708287b30bd050a36ac827ec7fe5e43fe7cb198dd835fba"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


