Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4FDC5DF8C
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3263.1787216871276058923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EzSr5rZ9;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1115; q=dns/txt;
  s=iport01; t=1787216871; x=1788426471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S3kEp/ICZCT/hMoTlp8DeS2ekulji68inYIKWwQaqrg=;
  b=EzSr5rZ9tkhu1HsqD7k6YXPmF40wMpV9Snu8K3T9Vb1kdv4h9Ll5oq2q
   vPedsdRN1bOyEprrMhG/d/B3tnDiTS/xfqwwEijYdPQ7JrSj0zLxbQfKl
   5M5HmgOv0OR6mBF538nT6p+s0BbJtGGPGWN+L+CsM7SkMB5HLokvWr7eK
   0Q2zct/AZRCmaUVV7Uv6ILg0qU+KsXfmuoz3Hvwixe7xr+U5YNKW1bMWf
   gJNodT1rBAx4Ko3b5OUQuvxpzJT6y0s+qVlgu8iRa3DdHoiqlnCN3jpXg
   2MMEuAgou8EPFbwQvvWQ56h8O6snmLU+h56YacdX/4k35LS9XFng1qYh+
   w==;
X-CSE-ConnectionGUID: Vqd4l1RvSxa8jDdKfcG4OQ==
X-CSE-MsgGUID: 0qE6LJ7gR+abFGe3xiFP2g==
X-IPAS-Result: =?us-ascii?q?A0D2AgCfwoZq/5IQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjW0CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdKwsBGAEtMFxEgwIBgnQDwj+BeTOBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6FEIV4BIIiehKBeJFSSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD5uB45RIIJLgQ6oTqEPCiiDdowhlToaM6psLphapFqEa?=
 =?us-ascii?q?YFuATWBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:jgrIo67BESzCJXnBvSlG2wxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jEcCzuAP/iMa2L8KYwgYIq+90wBscWAndVmSVRlr3hjZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eA5QUpuIuO3915
 fVIKhwBTR6IqL6R+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Mn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOIIIbVHp0M9qqej
 jrf0jrdIE4VDp+WwxSq/ym8h8H3xyyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:MU3ARawoBG6B0rmdp6G5KrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3AJrss9mhun/2DBzsiNwlNfka4TTJuTGTRkHOJGVG?=
 =?us-ascii?q?DGW85SpGZalGb1/9Dqp87?=
X-Talos-MUID: 9a23:uuDdqQZ80CRmuuBT7ybB2hVAa8hSoK2kJm8AyoUHlfHeOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="815227301"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:50 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 5FC5A18000453;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id F277FCC12A6; Thu, 20 Aug 2026 02:07:49 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-babel: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:49 -0700
Message-Id: <20260820090749.61746-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243834

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-babel (2.18.0)
Before -> After: python:babel -> pocoo:babel
Newly caught CVEs: CVE-2021-42771 (locale .dat deserialization RCE)
Status: patched (fixed 2.9.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 134175fa92b85e639dc4646d9a88eeaba0fae4d3)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-babel_2.18.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
index b0abb2c62e..26847372bf 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.18.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c575093
 
 inherit pypi setuptools3
 
+CVE_PRODUCT = "pocoo:babel"
+
 S = "${UNPACKDIR}/babel-${PV}"
 
 CLEANBROKEN = "1"
-- 
2.35.6

