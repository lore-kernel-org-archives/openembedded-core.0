Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C60AC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 07:47:03 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146150.1783324018066341892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 00:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=J5b18yUe;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=882; q=dns/txt;
  s=iport01; t=1783324018; x=1784533618;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kg2JmQz0zZowJkMrwh/fgJRleo7twTAdXvjqETq1oAw=;
  b=J5b18yUeYV13OwMacVzH56uAGm017F790V+WpNhvTBz5ut1ROYxSnkV+
   AYbjdXJIeA8XR9xtVoG/GG6oCmBFYgMupOii4onQlooGMBMxh1jNsNd0K
   7OFX/zlGZJnsFDcB/P3h5MVemY8/u23hKIwkpXDpueW2qzbObGmii63tK
   kQIKNiZ5M0u44zEn598pJ8A/B3wlL9rEsdAydt5s40Zp1JIjVsltzADbd
   xF4WZCHtdxeys0+nY5RpnT391jvN+u/UEJvpz7t0jWqUTYLHTu9hCp2L2
   8gFB0kKuTibg6MLyPIHOegYE1HsG/hcc8CWbJDjl+PX0FKK3jIvS563h0
   Q==;
X-CSE-ConnectionGUID: 6iDn6YuuQAugztQvTEARmw==
X-CSE-MsgGUID: JaGIiLzrSnKdxqfHZQtA0A==
X-IPAS-Result: =?us-ascii?q?A0BWAgDrW0tq/5P/Ja1aglmCV3RfQkmiQpIngX4PAQEBD?=
 =?us-ascii?q?zEgBAEBhQaNTQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4Zchl02AUaBDESDAgGCcwIBt0qCLIEBhH3ZRoFmAQsUAYE4jV6FcCcbgUlEh?=
 =?us-ascii?q?H6FEIV4BIINFYEMgXIGh1mHSkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYEdgWuBAoR5Ix8DOX+BMHVKeS2BAgESHgqBUoEmAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeMexcPgj1ZNYFMgRulZ6EPhCeEc4culToaM6prAZkIpFqEaIFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ/gfSQ1PQIHAgcOAwuTZQEB?=
IronPort-Data: A9a23:gi+RzarGYathqig1a8xspayoYE9eBmJJZBIvgKrLsJaIsI4StFCzt
 garIBmAa6nfYzDyLtEkb9nip0kOv5DdndVqGwM6qHxmQiIQ9OPIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9j8kif3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgLNNwJcaDpOtfrc8E035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rh2LWcQx
 OEFERkQYQKfvvyK7ZuBT/Y506zPLOGzVG8ekmtrwTecCbMtRorOBvySo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LV/rSn8/w7pX7WzpfolOJorYsy2PS1wd2lrPqNbI5f/TXHZgPxhvE+
 TquE2LRIBg1Fd272yC+9FGglvbBvRHCRKtKPejtnhJtqBjJroAJMzURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:bQXCjK9Qw46UNtQ47Etuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3AeWVQcGlPURMZk6tG0e9BPO5TP9nXOSPc4HGOElK?=
 =?us-ascii?q?lME90R6+JcEGs1YpeltU7zg=3D=3D?=
X-Talos-MUID: 9a23:VCJY4Ah6gGRtl+tFHgq7YMMpFs5HwqWKGlo2l7YKq9CKFR5JJx7FpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,149,1779148800"; 
   d="scan'208";a="505205470"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Jul 2026 07:46:57 +0000
Received: from sjc-ads-1437.cisco.com (sjc-ads-1437.cisco.com [171.70.59.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id D2D1418000241;
	Mon,  6 Jul 2026 07:46:56 +0000 (GMT)
Received: by sjc-ads-1437.cisco.com (Postfix, from userid 500841)
	id 79B7ACC2EF1; Mon,  6 Jul 2026 00:46:56 -0700 (PDT)
From: Oleksiy Obitotskyy <oobitots@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksiy Obitotskyy <oobitots@cisco.com>
Subject: [PATCH] lzlib: respect CFLAGS from the recipe
Date: Mon,  6 Jul 2026 00:46:54 -0700
Message-Id: <20260706074654.297733-1-oobitots@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-1437.cisco.com [171.70.59.129];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.59.129, sjc-ads-1437.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 07:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240216

lzlib's configure script replaces CFLAGS from the environment with
its own defaults. As a result, the flags supplied by OpenEmbedded do
not make it into the generated Makefile.

Pass CFLAGS on the configure command line so the generated Makefile
uses the flags provided by the recipe.

Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
---
 meta/recipes-extended/lzip/lzlib_1.16.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/lzip/lzlib_1.16.bb b/meta/recipes-extended/lzip/lzlib_1.16.bb
index e076581e05..26f612ca11 100644
--- a/meta/recipes-extended/lzip/lzlib_1.16.bb
+++ b/meta/recipes-extended/lzip/lzlib_1.16.bb
@@ -23,6 +23,7 @@ CONFIGUREOPTS = "\
     '--enable-shared' \
     '--disable-static' \
     'CC=${CC}' \
+    'CFLAGS=${CFLAGS}' \
     'CPPFLAGS=${CPPFLAGS}' \
     'CXXFLAGS=${CXXFLAGS}' \
     'LDFLAGS=${LDFLAGS}' \
-- 
2.35.6


