Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0F9C5DF89
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:29 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3256.1787216847811848715
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VoMVw5ry;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1399; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7vvo4eggJoERj3rsEKj5JTrRnh6t2OnVjga+R3IqLRg=;
  b=VoMVw5ryn5Bnpr5XNbWNdR9xoyh4y+WYt7qBIJsjqFmTY5PK4dO7TVII
   GdsvrLMER6cy0RJF5J3OFCI5rVlj8Y9oGsZQFDLprxUvYvTyKVoOb03fB
   ZrLOk8XW8YiyMMwvvHgBWA/bktJuq3aweaqzLr0meHt4DDVQMXShCfn9Y
   3qJy4gzS3vHralEjl3J9SpXSUDvEkqbDvLoeq+tOwazU/4kzULzp8XbuE
   iEqfqUhFNMnqvXsYsAEu1fONxRtvuhUUKLinogaagcc+McoN0uUE5HAyL
   oJzDQw8mwPtU7GJfDTDpqi8Xvb+soFMfO3XZlyCiWdkR3a3z/7CiQ4wCy
   A==;
X-CSE-ConnectionGUID: Je0F78DERg28LNubM+DoLg==
X-CSE-MsgGUID: 7ulL8j5IQhSPDHuL1GjXEQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/4sQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDEcIygiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6EF3mFeASCIoEMk0pIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBSUUOC?=
 =?us-ascii?q?RcLGA1IESw3FBkEPm4HjlEggks9UYFEVaY1oQ8KKIN2jCGVOhozqmwumFqkW?=
 =?us-ascii?q?oRpgWg8gVlwFYMiCUoZD95cJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:E9mg965IxmXz2MNHZxX+ygxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mAeUD+DPf2DMTShLtt/aIuxo0xS6J6BnNcxSwVt+H1hZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eH4BA1LknLUx0+
 qZIDBYQZDXAq+WSz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZOEwn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOMI4DbGZoO9qqej
 j3b+0CpAEw7Ddyk8Ral71b1qe3/sBquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjJCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:1zRz/KsMkqEgZq2mGcdqj8n67skDWtV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIMheOktK1rZ
 0QEJRWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:BDq90m0YFctOYUlaGqj1irxfOM19XCKN4FrqLBXoLUB0QpjWZVi09/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AvNVQMAxpZAzbw73iePv/AULm36aaqPuzDGRdk8g?=
 =?us-ascii?q?ngsm/DQBQJhPEozaHb7Zyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="811149473"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:27 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id DEF7018000199;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 7D75FCC12A8; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-pycryptodome: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:26 -0700
Message-Id: <20260820090726.61115-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243832

From: Tim Orling <tim.orling@konsulko.com>

The current pypi default "python:pycryptodome" is deprecated and does
not match current NVD configuration criteria. Use
"pycryptodome:pycryptodome", the active NVD dictionary CPE and
configuration identity for the packaged source, so two patched CVE
records are reported.

Note: The original commit targeted python3-pycryptodome_3.23.0.bb. This
is adjusted for Scarthgap, where the recipe version is 3.20.0.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f8a88010edc6edbb168cbc31aa5df847a328661c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
index 6c93c205ac..69bb6da44e 100644
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.20.0.bb
@@ -3,3 +3,4 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "09609209ed7de61c2b560cc5c8c4fbf892f8b15b1faf7e4cbffac97db1fffda7"
 
+CVE_PRODUCT = "pycryptodome:pycryptodome"
-- 
2.35.6

