Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B7AC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 08:43:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.13699.1704271392549395249
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 00:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="145103757"
X-IronPort-AV: E=Sophos;i="6.04,327,1695654000"; 
   d="scan'208";a="145103757"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 17:43:10 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C81D6186
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:43:07 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1982EF273C
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:43:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 87872200982CF
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:43:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0F0861A0070;
	Wed,  3 Jan 2024 16:43:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-attrs: upgrade 22.1.0 -> 23.2.0
Date: Wed,  3 Jan 2024 16:42:57 +0800
Message-Id: <1704271378-18012-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28096.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28096.006
X-TMASE-Result: 10--1.318000-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrZxosZkVy3FlR6SMusLeVMBRc
	qLOELivDVGYobNhHtFISdsyRTAMwe2sRSTeBCml4aDCzqDR7DPajXDvUao7quSBQRBOQhaJiu0m
	nSBAOWhs8x0Dsmb7Z071qVJYa44rGOHeH3mRMA2cD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiAH/xyJs7whjnijZjTXdvV7nHu4BcYSmtAUDqlLFoMeYCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbY1+l7XRPciwxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDmiOSGcBpdzvEgIg
	7+692x7/plEWYA4dv5wJ3EVVoQRXdPkCd1w0UqO3+Vmua0iqprXavbnWQDgYmK39kOBibObXkPF
	cmnhNE4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 08:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193275

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The type annotation for 'attrs.resolve_types()' is now correct.
- Type stubs now use 'typing.dataclass_transform' to decorate dataclass-like
  decorators, instead of the non-standard '__dataclass_transform__' special
  form, which is only supported by Pyright.
- Fixed serialization of namedtuple fields using 'attrs.asdict/astuple()'
  with 'retain_collection_types=True'.
- 'attrs.AttrsInstance' is now a 'typing.Protocol' in both type hints and code.
  This allows you to subclass it along with another 'Protocol'.
- If *attrs* detects that '__attrs_pre_init__' accepts more than just 'self',
  it will call it with the same arguments as '__init__' was called.
  This allows you to, for example, pass arguments to 'super().__init__()'.
- Slotted classes now transform 'functools.cached_property' decorated methods
  to support equivalent semantics.
- Added *class_body* argument to 'attrs.make_class()' to provide additional
  attributes for newly created classes.
  It is, for example, now possible to attach methods.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-attrs_23.1.0.bb => python3-attrs_23.2.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-attrs_23.1.0.bb
rename to meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index 314053de08..e00e152015 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "6279836d581513a26f1bf235f9acd333bc9115683f14f7e8fae46c98fc50e015"
+SRC_URI[sha256sum] = "935dc3b529c262f6cf76e50877d35a4bd3c1de194fd41f47a2b7ae8f19971f30"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


