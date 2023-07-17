Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7948C04FE1
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.4235.1689585045628021946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="112851583"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="112851583"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:43 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DC25D4240
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:41 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B4E34D5D44
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:40 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id CFE202FC8579;
	Mon, 17 Jul 2023 18:10:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 23.1.2 -> 23.2
Date: Mon, 17 Jul 2023 17:10:13 +0800
Message-Id: <1689585025-23731-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-0.774200-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yfCnSDfauCxfpxAd6mi1Ga14YeSlHZYFopYv
	gWqjMEza6LmRq4bR/xfkJdh0Vw0TY5cLewwAa76fOyPKih4RysihmhSedX3bwo9osn8JrdJP3q6
	udcqmT9yhxWAM2J2vYDh1PSIhA7cS5FkPPdpxU8y4u3nS+3EEDlkN0eJOT05wLX3qyf3ewG9jmh
	3z/HLyr8wh7Cf3VwzGomJ6lqgT9hodj9vNGYhpkT9B1SHosSXQN5dqZcIK7Vgg9R3V8qg5xOd8v
	hGAIlbvnJK6Zrm8ovsPiHNlPMXmBzsE6PWVyEks3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO2I3adjBtsMrAG+0n25aSlXlbOxU4rdRfVbpCHFtR6y8pJaXbw6zQhctDS5hgxlQp82864
	YOiaA8B5KzjA67zToEJqhoQN41JaaejQT4/rGf/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184443

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
  Upgrade setuptools to 68.0.0
  Upgrade typing_extensions to 4.7.1

Changelog:
==========
-Fix pip completion --zsh. (#11417)
-Prevent downloading files twice when PEP 658 metadata is present (#11847)
-Add permission check before configuration (#11920)
-Fix deprecation warnings in Python 3.12 for usage of shutil.rmtree (#11957)
-Ignore invalid or unreadable origin.json files in the cache of locally
 built wheels. (#11985)
-Fix installation of packages with PEP658 metadata using non-canonicalized
 names (#12038)
-Correctly parse dist-info-metadata values from JSON-format index data. (#12042)
-Fail with an error if the --python option is specified after the subcommand
 name. (#12067)
-Fix slowness when using importlib.metadata (the default way for pip to read
 metadata in Python 3.11+) and there is a large overlap between already
 installed and to-be-installed packages. (#12079)
-Pass the -r flag to mercurial to be explicit that a revision is passed and
 protect against hg options injection as part of VCS URLs. Users that do not
 have control on VCS URLs passed to pip are advised to upgrade. (#12119)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_23.1.2.bb => python3-pip_23.2.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_23.1.2.bb => python3-pip_23.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-pip_23.1.2.bb b/meta/recipes-devtools/python/python3-pip_23.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-pip_23.1.2.bb
rename to meta/recipes-devtools/python/python3-pip_23.2.bb
index a0ebd765bf..1ddec7d654 100644
--- a/meta/recipes-devtools/python/python3-pip_23.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_23.2.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/msgpack/COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751 \
                     file://src/pip/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
                     file://src/pip/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
-                    file://src/pip/_vendor/pkg_resources/LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6 \
+                    file://src/pip/_vendor/pkg_resources/LICENSE;md5=141643e11c48898150daa83802dbc65f \
                     file://src/pip/_vendor/platformdirs/LICENSE;md5=ea4f5a41454746a9ed111e3d8723d17a \
                     file://src/pip/_vendor/pygments/LICENSE;md5=36a13c90514e2899f1eba7f41c3ee592 \
                     file://src/pip/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=63ec52baf95163b597008bb46db68030 \
                     file://src/pip/_vendor/six.LICENSE;md5=43cfc9e4ac0e377acfb9b76f56b8415d \
                     file://src/pip/_vendor/tenacity/LICENSE;md5=175792518e4ac015ab6696d16c4f607e \
                     file://src/pip/_vendor/tomli/LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5 \
-                    file://src/pip/_vendor/typing_extensions.LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2 \
+                    file://src/pip/_vendor/typing_extensions.LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2 \
                     file://src/pip/_vendor/urllib3/LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c \
                     file://src/pip/_vendor/webencodings/LICENSE;md5=81fb24cd7823cce23b69f721993dce4d \
                     "
@@ -33,7 +33,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "0e7c86f486935893c708287b30bd050a36ac827ec7fe5e43fe7cb198dd835fba"
+SRC_URI[sha256sum] = "a160a170f3331d9ca1a0247eb1cd79c758879f1f81158f9cd05bbb5df80bea5c"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.34.1


