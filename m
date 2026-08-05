Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE658C56201
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:09:58 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37139.1785924594865876424
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=M+MA2gFI;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1136; q=dns/txt;
  s=iport01; t=1785924594; x=1787134194;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KfMWnBe7C/TqkgjtS+Coh/Jfwk+JsdauEagwhMO1Q1c=;
  b=M+MA2gFINu/ZJymRG7wYzibBiq1MtoqZW+xiuXK90QUVqjUf93rkLA0S
   qOX8Czh7Z+Ing/eVlglAKcXbUSaBcil86e8vnpIdsb4Hepmtb0eHtVbod
   h3VFl2WAcQRjGXGjVbyA8DspwyGKL/kAEMCwA6dkpKonzPRXwn/tpsHnw
   ywclLvTK4Qn1jO4K5L2hOltSIHL4gRrRGeNybX61ylQZVL+2xLa8ylDTs
   DGLkpBdW/a1gLoM/veYZJ43ZH2XO0/QzsOZ1PPQv8Kknw0HhCgtEZOIkX
   8eJ3Qhf+MgocmwFEdOQx41Mk0IOcrx+b4bs+jLBYV3HAvpAHwIHn2yqyV
   A==;
X-CSE-ConnectionGUID: wpZfgi63To6JgqfrH0netA==
X-CSE-MsgGUID: 6KZ8j95LRG+omZGo7AoV3g==
X-IPAS-Result: =?us-ascii?q?A0A/AgBzCnNq/4oQJK1aglmCV4FSQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q9RBAEBhQWNaAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4Zchl02AUYwXESDAoJ1A71zgiyBAYR92y4BCxQBBYEzhT+IIYVyJxsbgXKEf?=
 =?us-ascii?q?oUQhXgEgiKBDIMBj1BIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bB?=
 =?us-ascii?q?wWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvCxgNSBEsNxQZBD5uB41oI?=
 =?us-ascii?q?IFNc4EOllSReqEPCiiDdaFbGjOqbC6YWqRahGmBaDxGgRNwFYMiUxkP3lwnM?=
 =?us-ascii?q?j0CBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:uH39RK41gSDx1hVuQHK5rQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mcYC2jQb6zfZDHwf4wlPYu2/EgPuMTWyoM2TlRpqC4zZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJMtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eIpUq9Ol2Xzpy8
 qI6JykDdDDbge+q6efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOE0n1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3Fb4uKIoDbHJQI9qqej
 jzlzTT7U0w+DvPczj+33XXzr+jxxiyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:4y/gfKr6LOqjJ9IZsf05lu0aV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A5lPmeGrYoNyotjbq38KBJCrmUd89QHPSzSmLH0j?=
 =?us-ascii?q?mK2lwRqe1EVmd5Ioxxg=3D=3D?=
X-Talos-MUID: 9a23:3jpbwQmJli8DAwsR+qNfdno8F/U44fXzLHoi0pIDieaDagV3BWyS2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="797049195"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 10:09:54 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id E5BAC180001AD;
	Wed,  5 Aug 2026 10:09:53 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 7ACD5CC12A6; Wed,  5 Aug 2026 03:09:52 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] u-boot: Set CVE_PRODUCT
Date: Wed,  5 Aug 2026 03:09:52 -0700
Message-Id: <20260805100952.2617027-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242851

From: Maik Otto <m.otto@phytec.de>

The CPE vendor is "denx" and the CPE product is "u-boot".
Set CVE_PRODUCT for properly matching in the NVD database.

Signed-off-by: Maik Otto <m.otto@phytec.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2e5d427de13b33694a1d802f5ac833b2c04ced6)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 7935f2b4aa..00dda93b4a 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -19,6 +19,8 @@ PACKAGECONFIG ??= "openssl"
 # a host build dependency.
 PACKAGECONFIG[openssl] = ",,openssl-native"
 
+CVE_PRODUCT = "denx:u-boot"
+
 # Allow setting an additional version string that will be picked up by the
 # u-boot build system and appended to the u-boot version.  If the .scmversion
 # file already exists it will not be overwritten.
-- 
2.35.6


