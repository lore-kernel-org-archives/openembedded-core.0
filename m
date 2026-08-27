Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA41AC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 06:27:16 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30170.1787812033016716957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 23:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Y271D0nA;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1642; q=dns/txt;
  s=iport01; t=1787812033; x=1789021633;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2IbIkGBPOJn9K1kAAn3fx2TfZ/s28Nj4BMHoY9BD3rE=;
  b=Y271D0nA6baMC42sAHAY7eVrsY7gPx8aQ2HzGmVMvyxd0SwtNh8qBs2X
   7Htv7wwq6c+CoISH8+GjoZZcXcc/MSoPrBG6DSLgK6+VMwrDOT8j041rI
   ZR1pFzVjKtZzVPHF0Ym2y9ooD/bYOuaQe38x9H9NVLZ94gKeUcGIWqnFG
   E02iDbJXfeJxOx755w7ekms/e4LUnFGfNp/j1KzkgW1jBc3DO1Uk9SS2h
   ARl3AWuOjDojYJu2h5dXIdiTLxGftpTOU3+jydzm1W8KlePMbRv8PpPXW
   kIqKz9n1PSlZUl4YYSYz9vG2o8lKZyQXMrj6Se1yFmympu3CPyRW4U+/F
   w==;
X-CSE-ConnectionGUID: jcyXHvY8TeC6JmsNhDrQmQ==
X-CSE-MsgGUID: MTUXApflTi+Z0+r4lNZP2g==
X-IPAS-Result: =?us-ascii?q?A0BDAgA22I9q/5P/Ja1aHgEBCxIMggULgleBU0JJlCmCJ?=
 =?us-ascii?q?IETnQiBfg8BAQEPUQQBAYUFAo1uAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4ThlyGWwIBAzIBQRUgMSsrEQiDAoJ1A757giyBAYR92zABC?=
 =?us-ascii?q?xQBgTiFP4gihXInGxuBcoEVgnN2hRCFeASCIoEMgXiCZY8KSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBZgM1EioVbjIdgSM+F4ENGwYFgR2BKIQQIxk2fIEJXoErKWESF4EJg?=
 =?us-ascii?q?gcCglqCBQIBSUMOB0dDCxgNSBEsNxUZBD5uB45vH4JOWSITMYFPpkuhEgoog?=
 =?us-ascii?q?3ahXBozqmyPLYlbo3JohGmBaDyBWXAVgyJTGQ/eRDw1PQIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:e+5Dqq0Q4fyBVkB8PPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bpzIEz
 zccWTuPa/qCYmr2L94iPY228U1Q7JaHyN9jSlA+3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g24ubTpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGDkonDa0Gy7ZLDEoQ1
 /kDDjAhdCmGvrfjqF67YrEEasULNsLnOsYb/3pn1zycVK5gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUifC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW3aIaMJIbQHa25mG69m
 l/21nz3Bi0bd+7HiiDZ9lSevrXAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:WZMBDqG14iaboBlVpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:45uzsm3wU5BEd9NgPf4OOrxfGMs0Ql3D/SfsLmTmK2Nybr25U2aVwfYx
X-Talos-MUID: 9a23:jkHSHAXSbtLLQWHq/BrQuQFLLMls36XtOhhOi8kCnfu8byMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,246,1779148800"; 
   d="scan'208";a="520416220"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 27 Aug 2026 06:26:56 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 12C7218000241
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:26:56 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 41101CC037D; Thu, 27 Aug 2026 11:56:54 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] grub: disable grub-protect for native builds
Date: Thu, 27 Aug 2026 11:56:38 +0530
Message-Id: <20260827062638.2141533-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260827062638.2141533-1-deeratho@cisco.com>
References: <20260827062638.2141533-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:27:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244455

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9290ca0517e5a8888ee8a695a87c0d7e7b5ea377)
Signed-off-by: Deepak Rathore <deeratho@cisco.com>
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
2.53.0


