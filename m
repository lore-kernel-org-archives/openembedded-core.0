Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD37CF9C7E
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.9328.1727246991269165170
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sCmFFJ/T;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246991; x=1758782991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gup/668n1wZu4nzXUYMKbdkNibezz4J3zk1/TSObWjo=;
  b=sCmFFJ/TGzFmtiSgX2dxEbEDY01MIdkbyEwXgH+e8BEOJAAwUNETyc44
   /twE7dPRsdsanx9sAhA4onedAfQAtQ5iEsnl6ocNjuQhTwb/OL/p39aQY
   I90RxpCg0+f4yA27nLXv2UZxMK/GJBVPqDtTLlAO1yaI+yxGw3wN8triu
   m+KmNzmXp7k44svl9XAnzEe+Tj3N2XuZWD4SzIHi5O+zOqbMTgs0Tshma
   PmHRtXOK7M3dOJuXGZS/XR517B5KoUWi3qaV5mKqLXTHrSFj6u9Z6YzoY
   8IFJcmn71rhj9//AWk6D4j4932TOYB66yCQouRcPBRuOdKOxvCvNmD4IF
   w==;
X-CSE-ConnectionGUID: 2VpLF0mSTCKsWhCOXVvvEQ==
X-CSE-MsgGUID: 0N/TyDjFToq4p38Coizm+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162724298"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162724298"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:48 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C86BFDB3AF
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 033C7CFBC0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 80629401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2FCF41A01E9;
	Wed, 25 Sep 2024 14:49:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/47] python3-pytest: upgrade 8.3.2 -> 8.3.3
Date: Wed, 25 Sep 2024 14:49:06 +0800
Message-Id: <1727246960-20665-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--3.745400-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgvPRFFhcWhYLWO
	DdZ1PDmE9xqSxL3LrEORloiW1KgftbJF664k1XtcKsurITpSv+Mqnkb4tCjVzvQJJFxg7p4q0Bh
	ZSjgdIiT3LKF/SH70eov9sGOtq3aSPXdZx1sZHpA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365brwwTP2r1yKG0S+10ZS8XXbSxva6dNB2hbnHu4BcYSmtmJAMgmwOylebKItl61J/yZ+in
	TK0bC9eKrauXd3MZDV4pbUbGV6Pt+kwbAj10aAnjOCB5aTn/ouMCooB+ZAOyd+R2y4A3fKFrzIX
	ujMEzub0SymIgEbqNVpBZ8UftZcZnjTtIaKh6JKZbXP29aXx5lPJnXL2yNYdkuo847l05tDEzMy
	Amsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Avoid calling @property (and other instance descriptors) during fixture discovery
- Fixed the issue of not displaying assertion failure differences when using the
  parameter --import-mode=importlib in pytest>=8.1.
- Fixed a regression where type change in [ExceptionInfo.errisinstance]{.title-ref}
  caused [mypy]{.title-ref} to fail.
- Fixed typing compatibility with Python 3.9 or less
  -- replaced [typing.Self]{.title-ref} with [typing_extensions.Self]{.title-ref}
- Fixed an issue with backslashes being incorrectly converted in nodeid paths
  on Windows, ensuring consistent path handling across environments.
- Fixed bug where the verbosity levels where not being respected when printing
  the "msg" part of failed assertion (as in assert condition, msg).
- Fix bug where disabling the terminal plugin via -p no:terminal would cause
  crashes related to missing the verbose option.
- Clarify that the [pytest_deselected]{.title-ref} hook should be called from
  [pytest_collection_modifyitems]{.title-ref} hook implementations when items are deselected.
- Remove erroneous quotes from [tmp_path_retention_policy]{.title-ref} example in docs.
- Fix typos discovered by codespell and add codespell to pre-commit hooks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.3.2.bb => python3-pytest_8.3.3.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_8.3.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.3.3.bb
index 459d91f1be..dbd984208d 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.3.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.3.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "c132345d12ce551242c87269de812483f5bcc87cdbb4722e48487ba194f9fdce"
+SRC_URI[sha256sum] = "70b98107bd648308a7952b06e6ca9a50bc660be218d53c257cc1fc94fda10181"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


