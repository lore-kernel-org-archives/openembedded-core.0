Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D479C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:52 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8395.1709105612164643064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t1na2RkE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105622; x=1740641622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PACi0UXnvXYyJ9luHXcOneSh9XICYLduHHLWJGi2F48=;
  b=t1na2RkELxu6kDEphkNdnBfG1rnZtvUMBgqZefkSZvczjR5XhC2+ARKa
   HqXdK4W89ngwdDvEmAmBc66X7h5HFkEwbx28EbpcPMeHhn0C65adtXF4P
   rWJM+gmB8qgLe6wFe9/EqranN8IbK6k7K3+x/dbUXXqBRnRdkBj/NPcGb
   arCGbodGuUS/2hM5G0ySBLXJiF01mWxkQ66aevjQY83f9YsOJsfXmMf36
   GShBlEuipQK6cmPUegvxO6G9nJaM1ob49hWN9/qtn8ODm1d7sxwq8LqM2
   jhjiSBxKkHUC6GTphD0H4CaGeYVs16JQ1boTwTgfYx7vcqsSHrI+N+cfe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138291849"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138291849"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:40 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E223DC9FF4
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29E6ED5600
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF3562008FF8D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E2041A006A;
	Wed, 28 Feb 2024 15:33:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 41/48] python3-typing-extensions: upgrade 4.9.0 -> 4.10.0
Date: Wed, 28 Feb 2024 15:32:48 +0800
Message-Id: <1709105575-24259-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10--1.645000-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxOuRi6fMc6uyB8
	ndLfiHoRWXNqEIKVQ8tVxDBnzGH8/+qkGyCVA3KtKsurITpSv+OC7C2rJeUToU/Jf1N11BSTvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgBCE2NlBjIjcKXqmmYTGpxiem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkrSEaEHPaND1p8qShPj7S+nkWhrAnNsv+5snv
	L1ykovVTOElKglCfxxmnjnCFNflgcNKbIOPfc+y9ZUco6bFivXl7pvlmMjcrEu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196366

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add support for PEP 728, supporting the closed keyword argument and the special
 __extra_items__ key for TypedDict.
-Add support for PEP 742, adding typing_extensions.TypeIs.
-Drop runtime error when a read-only TypedDict item overrides a mutable one.
 Type checkers should still flag this as an error.
-Speedup issubclass() checks against simple runtime-checkable protocols by
 around 6% (backporting python/cpython#112717
-Fix a regression in the implementation of protocols where typing.Protocol
 classes that were not marked as @runtime_checkable would be unnecessarily
 introspected, potentially causing exceptions to be raised if the protocol had
 problematic members.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-extensions_4.9.0.bb => python3-typing-extensions_4.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.9.0.bb => python3-typing-extensions_4.10.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
index 3553c597ac..8698a80cc5 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.9.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.10.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "23478f88c37f27d76ac8aee6c905017a143b0b1b886c3c9f66bc2fd94f9f5783"
+SRC_URI[sha256sum] = "b0abd7c89e8fb96f98db18d86106ff1d90ab692004eb746cf6eda2682f91b3cb"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


