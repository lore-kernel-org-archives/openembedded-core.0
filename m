Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7CDE99079
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 10:27:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153346.1775816860387701607
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 03:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ew8Dmbkx;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775816860; x=1807352860;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qCB9vNB8KGtQu5CyHARfhkiHbzUgn0hkI6axRtdPfPk=;
  b=ew8DmbkxKkVmDPBZK4KEyU7RkgvhWQNXBOvklhqOWghQdJTqVa8h09od
   bY2hP6XRxj252M6xT2sX05irTqmJ2nSgkXuYDfp+BBFjS9YzMkwfuAJmc
   Gb/04Szpb50q/gQUIuDNdVkncVZlNjNjEI5fYhiWMkc652zZpBwE+Ko7u
   rWCg1VfwxrIXiWAlGWq++xrIFuS46v8jhnkJSVhjkYXFXntSp1ovKyk6G
   Ct6CfCUPhYd8xKzhAlod1pmKOT4FJ6HZYlYZqHPznsDQN37gehIl5fGiQ
   +KmAqZ08ERYcbFf/tG+Q05DH+bQK7a0eXtpTgg5n7/sKfZvkI8fBsuAS9
   Q==;
X-CSE-ConnectionGUID: Oc//kWCfQqWcV0rBDY4+NA==
X-CSE-MsgGUID: Cbh14PVLSR+7H2b2phvqfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="215529077"
X-IronPort-AV: E=Sophos;i="6.23,171,1770562800"; 
   d="scan'208";a="215529077"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 19:27:39 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D44E2407565
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 8291D1804158
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E72E11006148;
	Fri, 10 Apr 2026 10:27:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH v2] lttng-ust: upgrade 2.14.0 -> 2.15.0
Date: Fri, 10 Apr 2026 18:27:33 +0800
Message-ID: <20260410102733.1644-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 10:27:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235013

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb}    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb => lttng-ust_2.15.0.bb} (87%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
similarity index 87%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
index 1a15c5b420..8b6ba1c171 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.15.0.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch \
            "
 
-SRC_URI[sha256sum] = "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db448a0d5ca51b763"
+SRC_URI[sha256sum] = "6bc9723c7a50dd00c7da83d40b3bbb4b0746819f4d6e377c9bd897c898993e28"
 
 CVE_PRODUCT = "ust"
 
@@ -50,3 +50,9 @@ do_install:append() {
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


