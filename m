Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F15CD11DC
	for <webhook@archiver.kernel.org>; Tue, 26 Mar 2024 00:35:23 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7887.1711413316904058813
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 17:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X+fQbjvW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711413318; x=1742949318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wETfVhmEoiuSRuN6wEPww16P/Zqd4LpSg51o5aZ7pxU=;
  b=X+fQbjvW7qRQd6Jxog50u+bYF/J2nuv08PIeWEIlPq65y02Gs6xGvkNk
   5xVgVzW1zejH+EG5oMs1dsigYN0XrMFvOOLU3I66povVBso8OI6qRN4H6
   OQ9H+Z2JhslMfPJfHzbluBICuEs5KDROYQIK1yF5lbXB9Kd7fVIl8p1s3
   TP9GmoxTVrvNsXD0bWD22bN/FXAyyNVATZ+DxwCIGPCoi/FJ3ozQedTFZ
   4D2/v7an5mg59co5uIvYd3aark5AFzVQ4paBkogL/YwO6wYK2X9Mo5JPT
   AVIUznRu9f7/b0FCKm65rIYzMiahFHILUdMCqX+mqus8b3Vi7LCYINYpG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="140943724"
X-IronPort-AV: E=Sophos;i="6.07,154,1708354800"; 
   d="scan'208";a="140943724"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 09:35:14 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AEFA4C681C
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:12 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E19A9D5A14
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7CC691EBBED
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 09:35:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 292361A006A;
	Tue, 26 Mar 2024 08:35:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-Core] [PATCH 02/34] at-spi2-core: upgrade 2.50.1 -> 2.52.0
Date: Tue, 26 Mar 2024 08:34:20 +0800
Message-Id: <1711413292-3025-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28274.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28274.003
X-TMASE-Result: 10--8.214300-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvOZVnrV0ZFsVa/Y
	wNA2MblGXr7NXg/pSgSQKRSc2wAOnlK4l8RZlJB8upDIC9422DpMVCcj56k8hqfDpVD78xj9fFM
	IM6nuWIhSxTaXxnjZ4u3dMgtwJp++8Fqz7YXMxU1g/IrbTV5uG0XmpVQIaHBP31GU/N5W5BDu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaJ13Q4nwaBnKnzmmMD/HXF+VeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7dgkRR8OiM/8gBwKKRHe+rxl6aOhjzOI3s7i+cpTh75jc2wsLKXDwdKVBlrag+8uhPjd6
	rC0SmDo=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 00:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197492

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* tests: Fix missing declaration for getpid().
* Back out code to generate mouse events on mutter. It had a couple of
  unwanted side effects. Also remove dependencies on libei and xkbcommon.
* atk-adaptor: Fix collection role matching.
* Have atspi_text_get_string_at_offset fall back to calling
  GetTextAtOffset if GetStringAtOffset is unimplemented.
* Don't use g_assert in the unit tests.
* Add an attribute-changed signal in atk, and update libatspi attribute cache.
* Add GetTextSelection and SetTextSelection to Document interface.
* Add atspi_device_generate_mouse_event, and implement for mutter.
* Have atspi_device_add_key_grab return 0 if XIGrabKeycode fails.
* xml: Add Embedded to the Socket interface
* Don't return uninitialized values if atspi_component_get_size/position fail.
* atk-adaptor: Fix critical when no table cell array is returned.
* accessible: Do not rename deprecated methods to the new names.
* Add HelpText property and corresponding functions in atk and libatspi.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.50.1.bb => at-spi2-core_2.52.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.50.1.bb => at-spi2-core_2.52.0.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb b/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.50.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.52.0.bb
index 6996ebebcd..cf221e0389 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.50.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.52.0.bb
@@ -11,7 +11,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "5727b5c0687ac57ba8040e79bd6731b714a36b8fcf32190f236b8fb3698789e7"
+SRC_URI[sha256sum] = "0ac3fc8320c8d01fa147c272ba7fa03806389c6b03d3c406d0823e30e35ff5ab"
 
 DEPENDS = " \
 	dbus \
-- 
2.34.1


