Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F12D1C79F85
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 12:42:15 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12950.1788525725729000211
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 05:42:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SJ1g1Z7p;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1070; q=dns/txt;
  s=iport01; t=1788525725; x=1789735325;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bEEMsgGsl0q5MXIQEL1uu079V7DNIza/572/4tMHC/I=;
  b=SJ1g1Z7pIYrbtFfDI3WYcmX2SUXAZ3QBVEVmG+1tSE44eXcSQpT6tB1+
   hOyUEsWoALr8AI/hZl2GL91iBtUvLqGHXwZEkzqiqlNwFPyj55jZXVVK6
   QwheOQI9bwN3kjdF1lIp7abj9H+aMHJ7a+eTx49rRvEcPGS/ZgQtgpxsz
   rMi0mc5XrqlrGcRHsV/Bj0vYUEzFwScQxLQwqUD+DSoysy6aclLZ5pRCW
   vZBnlNWth8kx06mg0ibSqeG9lNwS8wm08pnCVGtPKbt/e8IkvQCfLFzWX
   4K4obVWjVLCOp1LM9kufsQNnRx3D49G2XFe8T8MToKktvi0MvtE59pwBX
   w==;
X-CSE-ConnectionGUID: 8OrcP0KbSiOSWcKJbCvewg==
X-CSE-MsgGUID: Wl5RdtKDQaufv9cpOMtS8w==
X-IPAS-Result: =?us-ascii?q?A0BAAgBAu5pq/4wQJK1aglmCV3RgQ0m0aIF+DwEBAQ9ED?=
 =?us-ascii?q?QQBAYUFjgQCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2QHzYBRjBcRIMCAYJ0AxHDIoIsgQGDaAJDUNsxAQsUAQWBM4U/iCJ1AYR8J?=
 =?us-ascii?q?xsbgXKEfoEFgVwBAYIthXgEgiKBDJNnSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BJ4M/Ixk2eoEJXoErKWABEheBCYIIAoJUggMCAUlDD?=
 =?us-ascii?q?gdHUwknQQQLGA1IESw3FRkEPm4Hjl8fglCBDiwEgX+mH6EPCiiDdowilToaM?=
 =?us-ascii?q?6ptC5h9jgqWUIRpgWg8gUcLB3AVgyIJShkPjjmDa4F/yjonMj0BAQcCBw4DC?=
 =?us-ascii?q?4FokX4BAQ?=
IronPort-Data: A9a23:xIXXNq4zM08Hj6qM2mSYwQxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 jNLWG7XM/3ZMGT2KN5yb9/lpBkP65fcnYRjT1c4qCE1Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajNMt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ebaoC8d4vImt19
 NsjFzsuTBqome+pz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcuFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Un1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aoWKJozQGJQ9ckCwm
 WabxWjlIT0jPcGR12uO6lWJmtSfgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:h6iaqqmKhcUTXN95ODzCYFL4yW/pDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:yZ81eWOSL7xHU+5DCA59/3ZMOcoec1rm83zzAUWTF2t2R+jA
X-Talos-MUID: 9a23:1H7nzAnbx0PLWpr0nwNzdnpdMJpS77iNJHkEjJsY6sKcEglsAGeC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,262,1779148800"; 
   d="scan'208";a="827748259"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 12:42:04 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id C4E16180001F9;
	Fri,  4 Sep 2026 12:42:04 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 318BFCCD9B2; Fri,  4 Sep 2026 05:42:04 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][wrynose][PATCH 1/4] u-boot-tools: Ignore CVE-2026-29007
Date: Fri,  4 Sep 2026 05:41:54 -0700
Message-Id: <20260904124157.1723755-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 12:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245098

From: Hetvi Thakar <hthakar@cisco.com>

Analysis:
- NVD identifies the vulnerable code as net/tcp.c when
  CONFIG_PROT_TCP is enabled [1].
- tools-only_defconfig disables networking, so this code is not built
  into u-boot-tools [2].
- Hence ignoring the CVE for this recipe.

Reference:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-29007
[2] https://github.com/u-boot/u-boot/blob/v2026.01/configs/tools-only_defconfig

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
index 7eaf721ca83..0e57bb88849 100644
--- a/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
@@ -1,2 +1,4 @@
 require u-boot-common.inc
 require u-boot-tools.inc
+
+CVE_STATUS[CVE-2026-29007] = "not-applicable-config: tools-only_defconfig disables networking; net/tcp.c is not compiled into u-boot-tools."
-- 
2.35.6


