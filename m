Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2DCC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:29 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1787216847044408415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=KVf17yKF;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1480; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yJzehevj9Jk9g88ydLS2mE9Ad4MnbAvN7ljtqNx5h6o=;
  b=KVf17yKFH1gh4BzBUWh0pfzYMlkZcmoFlaY53dLYiHWbmwBLsdn8Puj7
   MIWeB1EyXqIAZsGECl/7VxAlX3av9tEJjOR00FoCQoQGs27I+FF81nVQ+
   hnmtXwk35/q56NPiFMHO2GSLY1jOtQFJgh+ASKXH71Vkfc0NyMeGSIUGJ
   YHEoPVhVqbcY3NydAcIQ29u+jmhUJSU/eP7g9/MMVtFuXoRcYyU3VmpTZ
   TEl94/bIzPhXobwJRWS/0bB5eMtvIz6LXDSPq6ivwuqP9BAGGGXTjz4f7
   s1pKA5j4h0AcMNF7b9GxJXtv2HbkuVShz6wgTDzKTofefzMt/w8NVFvYo
   A==;
X-CSE-ConnectionGUID: pJuym3TCRQK6Frfc2NfWiQ==
X-CSE-MsgGUID: Omtn6CWzSpmoOO9SdgXgPg==
X-IPAS-Result: =?us-ascii?q?A0BCAgBrwoZq/5IQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXTYBGAEtMFxEgwIBgnQDEcIxgiyBAYMoAYFU2zABCxQBBYEzh?=
 =?us-ascii?q?T+IInaEfCcbG4FyhH6CYQKBNHmFeASCIoEMgXiRUkiBHgNZLAFVEw0KCwcFg?=
 =?us-ascii?q?WYDNRIqFW4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCc?=
 =?us-ascii?q?IIGAgFJRQ4JFwsYDUgRLDcUGQQ+bgeOUSCCSz1RLHMlVaY1oQ8KKIN2jCGVO?=
 =?us-ascii?q?hozqmwumFqOCpZQhGmBaDyBWXAVgyIJShkPkiPMOScyAjsCBwIHDgMLk2YBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:2lv02q6H5CF+3Oy0Nc3ABAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jRMWGvTOPbYYDf2edhybI+0pEgP6JDVztM2SAA5pSlkZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eJa8F6+MsPUp0z
 N9GBioDZUqlid23+efuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcGFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0Mn1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOPKo3UH5QN9qqej
 kXD42KnKS4ID8Sazh2io0mgid/ApSyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:fLCbRaEY3ZNapzmLpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:f+JhXWyrB8OeLWLxiVYrBgUMON00dybh503pABGWE2hiEpubdl6prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AALMKyw9tq+oG219Uuuu1HMuQf+Bt/6LwI38fqo0?=
 =?us-ascii?q?DvO6jZBd8NAeStDviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812896290"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:27 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id C228118000164;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 66832CC12A7; Thu, 20 Aug 2026 02:07:26 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-numpy: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:26 -0700
Message-Id: <20260820090726.61043-1-devanshp@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243831

From: Tim Orling <tim.orling@konsulko.com>

The current "python3-numpy" mapping has no matching NVD CPE or
configuration identity, so eight source-aligned CVE records are missed.
Use "numpy:numpy", the active NVD dictionary CPE and configuration
identity for the packaged NumPy source.

Note: The original commit targeted python3-numpy_2.5.2.bb. This is
adjusted for Scarthgap, where the recipe version is 1.26.4.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ad623e71fadeddcb0b70bba8fbf28c75a976e596)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
index ccd08147af..9164874445 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -18,6 +18,8 @@ SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
+CVE_PRODUCT = "numpy:numpy"
+
 DEPENDS += "python3-cython-native"
 
 inherit ptest setuptools3 github-releases
-- 
2.35.6

