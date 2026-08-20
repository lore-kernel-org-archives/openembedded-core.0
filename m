Return-Path: <hjadon@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22933C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 12:47:32 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6359.1787230042265729965
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 05:47:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K91BHoo7;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: hjadon@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1452; q=dns/txt;
  s=iport01; t=1787230042; x=1788439642;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+kx02umVuraXkDXDJoSQu8TXAPGCYGQ/YzD5KtE18oQ=;
  b=K91BHoo7+Zr5uEZgrAf8U/zbsgnIq4ZHatpET/devjn0oo/crR/cVZm5
   ded5tr5f/IcNDhQu2F/RMnBq08Y7QXtzXVHx+rZK48m5Tr4POaz4kxIdm
   ULB/XU952HfvO6Oipy9KF9wwTkD5DYhcG782Wi7a5gmFJ6YTO5ACc4lB0
   C27uJpYR13JQYt+oFKsnBkviE8WPy2xv5ww9H+tBNmu9OBpQfa2YMK9Kg
   /Vd1gLwbBPK4Ob7ywIf3YQnJM9ESHWZF3zrHqqu1k5ZgAP1umS1oyIHLw
   pjlmIkW+PD2ObdkNznOcRFDpw10X6VxQ6WoVl3WlmoOp7+3SSb2h/dNvI
   Q==;
X-CSE-ConnectionGUID: 8AdvmVVoS/u4JfRsvzYJZg==
X-CSE-MsgGUID: /gyrc5zAQW+9BfIYNJUXGw==
X-IPAS-Result: =?us-ascii?q?A0AuAwDa9YZq/5IQJK1aglmCV4FSQ0mTWQFPgzefBg8BA?=
 =?us-ascii?q?QEPUQQBAZJyAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZchxMBQTVcRIMCgnUDwlKCLIEBhH3bMAELFAGBOIU/iCKFcicbG4FygRWCc?=
 =?us-ascii?q?3aFEIV4BIIigQyBeIJ8jlZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4Xg?=
 =?us-ascii?q?Q0bBgWBHYEohDcjGTZ8gQlegSsqYhIXgQmCCgKCcIIGAgFJRQ4JFwsYDUgRL?=
 =?us-ascii?q?DcUGQQ+bgeOUSCCS1kiEzGBT6ZOoQ8KKIN2oVsaM6psjy2JW6NyaIRpgX4mg?=
 =?us-ascii?q?VlwFYMiUxkP3lwnMj0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:EtRudK2jOMrOMovPxPbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bp2QBz
 mQdUGrSPKyIZWDwKdB+YYq3o01XvpCGmIcwTws43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4EjxYtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24uajpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGXGg6I4gmxOFMRnwS1
 /IiMy4fXzKxiLfjqF67YrEEasULJc3vOsYb/3pn1zycVadgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEqojx5nYj/7DLo+nu6kgX/XeDxDo1XTrq0yi4TW5Fwrgei9b4KOJ7RmQ+0SkVeCr
 T/U1l3GQUAwOv2u7xi4wl2z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:isbqrq6E+Dt0+fppEwPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AJIKqX2sCbrl9uT6KRqzznfNK6It1W3HDyUnuJHT?=
 =?us-ascii?q?/FDpLRoeOV02h2pFrxp8=3D?=
X-Talos-MUID: 9a23:LkrA4gjmYl+s3ke2qXKNLsMpc8h5+a/zGmk0rtZXkcelBApSBgeyk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="829887035"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 12:47:21 +0000
Received: from sjc-ads-21441.cisco.com (sjc-ads-21441.cisco.com [10.128.164.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 3B8CE1800017D
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 12:47:21 +0000 (GMT)
Received: by sjc-ads-21441.cisco.com (Postfix, from userid 1879343)
	id C6616CC1611; Thu, 20 Aug 2026 05:47:20 -0700 (PDT)
From: "Himanshu Jadon -X (hjadon - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hjadon@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][PATCH] grub: disable grub-protect for native builds
Date: Thu, 20 Aug 2026 05:47:14 -0700
Message-Id: <20260820124714.2349655-1-hjadon@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-21441.cisco.com [10.128.164.182];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.128.164.182, sjc-ads-21441.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 12:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243856

From: Himanshu Jadon <hjadon@cisco.com>

grub-native fails on hosts where libtasn1 headers are not available
when configure tries to build grub-protect:

  util/grub-protect.c:25:10: fatal error:
  libtasn1.h: No such file or directory

grub-protect is an optional utility for sealing disk-encryption keys
using the TPM2 key protector. It is not used by the GRUB native tools
staged for Yocto recipe execution.

Disable grub-protect for class-native so grub-native does not depend on
libtasn1. This keeps the native build focused on the tools needed by
Yocto and avoids adding another native library dependency only for an
unused utility.

Target and nativesdk builds keep the upstream default, so image and SDK
behaviour is unchanged.

Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 0656489ead..466c772e5b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -73,6 +73,8 @@ EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-werror \
 "
 
+EXTRA_OECONF:append:class-native = " --disable-grub-protect"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
 PACKAGECONFIG[device-mapper] = "--enable-device-mapper,--disable-device-mapper,libdevmapper"
-- 
2.51.0


