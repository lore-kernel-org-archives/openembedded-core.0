Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00204C369A2
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 09:08:09 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.3865.1743584884471929132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 02:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BhKdkOlW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743584884; x=1775120884;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JVo7B2yOi0RBrEYzBioS0vpEn8OAkrWcoTAtlCTfnN8=;
  b=BhKdkOlWQPDnfS+2s7H4/Oc9JeV29hoGusl2C9ZX4RNk9det1r3FT2WT
   NUcylbFWJCXxIpxsOhDpnlmv/Eal0JX7kufLpGmj5HWHWNZczT4Xc6x4y
   250YnJuW/5M1y52TOX/tZKJwx07NKYyvm7kW4xbCFc1IMf1Mjciozeeyw
   RVKNctPIBBuEfFnFN05F3We7hN4VO544STuVXanz7PMwDoKOiV2PNgNM7
   YRU9mSoikgkpaJBrdvTMe+ttIyv3Zx/JjRc6J440K51f9ZPCiU/zGE505
   nuaOAZuCw/EI0QQnK8ntsGdJLp5Goa021N52uux+A7UYczk14rCP7KG8Y
   Q==;
X-CSE-ConnectionGUID: OnnbRrG2Q+iFsBhmPpk19g==
X-CSE-MsgGUID: yKPtPxosSY+2SjL14HWL/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="195532891"
X-IronPort-AV: E=Sophos;i="6.14,295,1736780400"; 
   d="scan'208";a="195532891"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 18:08:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 31130C2260
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:08:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EB52CD52BA
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 18:07:59 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 58E0D1A009A;
	Wed,  2 Apr 2025 17:07:59 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
Date: Wed,  2 Apr 2025 17:07:40 +0800
Message-Id: <20250402090749.2119-2-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402090749.2119-1-leimaohui@fujitsu.com>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 09:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214234

Fix the issue that:
 | Traceback (most recent call last):
 |   File "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-webcolors/24.11.1/recipe-sysroot-native/usr/lib/pyth on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in _call_hook
 |     raise BackendUnavailable(
 |     ...<4 lines>...
 |     )
 | pyproject_hooks._impl.BackendUnavailable: Cannot import 'pdm.backend'

python3-webcolors has migrated to pdm-backend
 | diff --git a/pyproject.toml b/pyproject.toml
 | index 6fcec77..9f2dfa9 100644
 | --- a/pyproject.toml
 | +++ b/pyproject.toml
 | @@ -1,65 +1,110 @@
 |  [build-system]
 | -requires = ["setuptools>=61.0"]
 | -build-backend = "setuptools.build_meta"
 | +requires = [
 | +    "pdm-backend",
 | +]
 | +build-backend = "pdm.backend"

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...n3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} (70%)

diff --git a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
rename to meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
index c5ed4bd7d3..cda63d2a35 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -3,10 +3,15 @@ HOMEPAGE = "https://pypi.org/project/webcolors/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
 
-SRC_URI[sha256sum] = "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d"
+SRC_URI[sha256sum] = "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f6"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
+DEPENDS += " \
+    python3-pdm-native \
+    python3-pdm-backend-native \
+"
+
 RDEPENDS:${PN}:class-target = "\
     python3-stringold \
 "
-- 
2.43.0


