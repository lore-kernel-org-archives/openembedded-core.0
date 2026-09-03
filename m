Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1B6C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 05:19:27 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.989.1788412762475338330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 22:19:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DTMO87B7;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1169; q=dns/txt;
  s=iport01; t=1788412762; x=1789622362;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dfT2WMd+SsYH31373IbVtzM8U+WdYaf3nFuiFMR/wf0=;
  b=DTMO87B7iHL2/SdQHzoSl2poKNQkqJb5XVoN1pum66Fa1YKIcQXDMyNt
   LPCAJi6AWRrvF2KAd9yCLF7g8jcwjrjt1VI6Cs5myxb/fVwM9fmUP79hi
   GK4LMthJNnIz9NM8qMEB1LgR2e9q4R/2jsmC5PMM0uBrLHZm+4Zb7Ojo6
   5whkx1K0PjY77Rnxy3CQkGoVUvwY7TEBm6wJVC62txLRF9OdmIOW67fZX
   4L3CTQ+P+iRU6/jOWfq/vkIP3iZKvDksBNXOfRsUusTqX4LrpN9884UEC
   8xviv/MPQyNfEwH5+LdmfdDQ+xBvP4fCCd6IQvWrjR6IS0+C1SYHrhTR+
   Q==;
X-CSE-ConnectionGUID: RiLRsl/qSZCCyIf7Qjio6Q==
X-CSE-MsgGUID: RuLEwEhfRaS5dXxB8D25MA==
X-IPAS-Result: =?us-ascii?q?A0BAAgCyAplq/5AQJK1aglmCV3RhQkkDlkeeHoF+DwEBA?=
 =?us-ascii?q?Q89FAQBAYUFjXkCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QHDYBRjBcRIMCAYJ0AgERv12CLIEBg2gCQ1DbMQELFAEFgTOFP4gid?=
 =?us-ascii?q?QGEfCcbG4FyhAh2gQWBXAGCLoV4BIIigQyBeJFtSIEeA1ksAVUTDQoLBwWBZ?=
 =?us-ascii?q?gM1EioVbjIdgSM+F4ENGwYFgR2BKINBIxk2eoEJXoErKWABEheBCYIIAoJUg?=
 =?us-ascii?q?gUCAUlDDgdHUwknGAsYDUgRLDcVGQQ+bgeOYB+CVYEOLCCBAE0YJ6V2oQ8KK?=
 =?us-ascii?q?IN2jCKVOhozqm0LmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OOYNrgX/KOiQ1D?=
 =?us-ascii?q?i8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:8Y+sc66A33gZTr4bK7oEsgxRtG/GchMFZxGqfqrLsTDasY5as4F+v
 mpLX2DVPPmKZzagfttxOoW+o00HsJHcyN9lQAFrrSo8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajNMsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eB4w8wP1zRnh1x
 9czOREDMSmBhuXo+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGc+FSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0En1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZC9aoqIIoXaGJ49ckCwn
 H/i0nvUAh8gPefCxQqV2CKA3LLqtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:x1vvjawxwRw3UGFKudsVKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AXpIPHGvxSOP0V1NzVzZdBm136Isfc1nn13OXOnS?=
 =?us-ascii?q?KIk14abPKcF2R//1dxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AsjMC7Q+fgueDzs5x9hH86+2Qf/11x4mxJUADq5w?=
 =?us-ascii?q?95sW0JQYgF23AqR3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,258,1779148800"; 
   d="scan'208";a="828501853"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2026 05:19:21 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 6362E1800036D;
	Thu,  3 Sep 2026 05:19:21 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id F3CECCE1C03; Wed,  2 Sep 2026 22:19:20 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH] python3-ply: set status for CVE-2025-56005
Date: Wed,  2 Sep 2026 22:19:03 -0700
Message-Id: <20260903051903.3667481-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 05:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244998

From: Hetvi Thakar <hthakar@cisco.com>

PLY 3.11 contains the picklefile parameter described by
CVE-2025-56005, but exploitation requires an application to
explicitly pass an attacker-controlled pickle file to yacc().

No OE-Core consumer uses this parameter. Ubuntu ignores the issue for
the same reason [1], and NVD records the CVE as disputed [2].

[1] https://ubuntu.com/security/CVE-2025-56005
[2] https://nvd.nist.gov/vuln/detail/CVE-2025-56005

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 meta/recipes-devtools/python/python3-ply_3.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 0855c871cf..5bed977158 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -16,5 +16,6 @@ RDEPENDS:${PN}:class-target += "\
 "
 
 CVE_PRODUCT = "dabeaz:ply"
+CVE_STATUS[CVE-2025-56005] = "disputed: Exploitation requires application-specific use of PLY's picklefile parameter with attacker-controlled pickle data"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.6


