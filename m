Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71F1CC04A6A
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7537.1687850372228599749
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110616497"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110616497"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:29 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9FCFE852D
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:27 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BC72CFBDF
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 907E140B61;
	Tue, 27 Jun 2023 16:19:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: upgrade 1.53.0 -> 1.54.0
Date: Tue, 27 Jun 2023 15:17:10 +0800
Message-Id: <1687850250-20040-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--7.049600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrDOe68vi/OSQ0vjssgE25FmXV
	AUjtonegKemCnYqy3u158LS2VrPxf8RBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZHzoX6MtOvdESbMo2JpgK/Q6N/cDgNNi4SBr3Ab7SNDagW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7FTum0p19lLr2nxDLeVJh00NVEglPemtv18kl
	9zvF+SzRWs9qd4vDCg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183454

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  nghttpx: Consistent error handling and use of high-level API
  h2load: Fix http3 upload stall
  h2load: Use std::chrono::steady_clock for quic timestamp
  Avoid ev_now by @tatsuhiro-t in #1907
  Remove unused macro bswap64
  Bump ngtcp2 and nghttp3
  Bump libbpf to v1.2.0
  Avoid copies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nghttp2/{nghttp2_1.53.0.bb => nghttp2_1.54.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.53.0.bb => nghttp2_1.54.0.bb} (91%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.53.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.54.0.bb
similarity index 91%
rename from meta/recipes-support/nghttp2/nghttp2_1.53.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.54.0.bb
index 88d5f31083..4e15f0839f 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.53.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.54.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "\
     ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
     file://0001-fetch-ocsp-response-use-python3.patch \
 "
-SRC_URI[sha256sum] = "b867184254e5a29b0ba68413aa14f8b0ce1142a371761374598dec092dabb809"
+SRC_URI[sha256sum] = "20533c9354fbb6aa689b6aa0ddb77f91da1d242587444502832e1864308152df"
 
 inherit cmake manpages python3native github-releases
 PACKAGECONFIG[manpages] = ""
-- 
2.34.1


