Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A63FED7B9F
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:38:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15833.1776163116486009190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lhb2SV+z;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776163115; x=1807699115;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/MqMsslKZ5PCwA7+ReZDejf8zy2xm9lQypJRaOh75JA=;
  b=Lhb2SV+z+GY4aC0CpO1tCROt+C9YIFdiRIKo8MZUaueAPkrllwb7ZKs0
   fQbV7Q9TvTOTgaLC5WFBvESIUK6nM0qVYv6Y618wlhBaHvK7P/A3GiKqF
   SgaADKWGTTZGQkBuDa8kP4bd0j235UB+fm50l13ExtKsjmVpxK/SiCO+r
   kUviOBfjwupZ7wrAUnmKb718/uOogl1nBM+fSpspcp6ND8aYFbUqbCsTw
   3psGYzQGWQnpdwPeGzYeUchG0UfRx6hWmqASUHojw9BdrPwVf0FFqzeQG
   hvsl960w17pAjkCpR8vOzjBFoQ9vP0LhESBUBAKVU1aNmfCxtNBYFL2Mx
   w==;
X-CSE-ConnectionGUID: QMebDkSkSh+w1kBOhBkQWA==
X-CSE-MsgGUID: nrLUR35rRq6y8SODpkExRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="215712145"
X-IronPort-AV: E=Sophos;i="6.23,179,1770562800"; 
   d="scan'208";a="215712145"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 19:38:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A8BC01C00086
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:34 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4B8CDC0040D
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A5ABF18001E9;
	Tue, 14 Apr 2026 10:38:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] lttng-ust: upgrade 2.14.0 -> 2.15.0
Date: Tue, 14 Apr 2026 18:38:28 +0800
Message-ID: <20260414103828.1714-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235153

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb}   | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb} (87%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
similarity index 87%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
index 1a15c5b420..ca2beacad4 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
@@ -27,13 +27,14 @@ RREPLACES:${PN} = "lttng2-ust"
 RCONFLICTS:${PN} = "lttng2-ust"
 
 PE = "2"
+PR = "r1"
 
 SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
+SRC_URI[sha256sum] = "6bc9723c7a50dd00c7da83d40b3bbb4b0746819f4d6e377c9bd897c898993e28"
 
 CVE_PRODUCT = "ust"
 
@@ -50,3 +51,9 @@ do_install:append() {
         # still refer to Python 2 in the shebang
         sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${bindir}/lttng-gen-tp
 }
+
+INHIBIT_PACKAGE_STRIP_FILES = "\
+    ${PKGD}${libdir}/liblttng-ust.so.1.0.0 \
+    ${PKGD}${libdir}/liblttng-ust-common.so.1.0.0 \
+    ${PKGD}${libdir}/liblttng-ust-tracepoint.so.1.0.0 \
+    "
-- 
2.43.0


