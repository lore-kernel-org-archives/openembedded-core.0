Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEEDD0C837
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56087.1768299930680492856
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WC/owpvn;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299930; x=1799835930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qk02KUl4B8ULK3bR4piA4Y4yn+Ll5WpM3YumlmbYzAs=;
  b=WC/owpvnee52kFCdT698wsBF878eeojs7Y6uDuKF3wXYu3v2I3GHUQjA
   4u58a7WWeNZADcIm2EbNbcmDjMdr3EzFC9+P0zmYkcj24gipNMdYnWPAs
   jP1oenXnSGDdtOq17f387UUSgvO3cXySeUcrWIISLaRfa8h9vWGeMm1Qg
   3LZGl4ha3vMljGMrGlt4A3ukbfg06Q5hGDu4AX+gYQoUYQ9vDIv4joxEe
   nWl+9mX4+XRsk//Adnnq+g65kQrQwglTt/uU1zNpUPv8XGAxFiQCPCi+O
   9pxVUJlT2KRmNq/upHjzEPECSri5PNxK6+Bv6/IBs3TKStarvYLHfjb35
   Q==;
X-CSE-ConnectionGUID: 0kjIq7rfRmS9WQabC+w/9A==
X-CSE-MsgGUID: h8UxEOjhSlaSsFxIefiKDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204607215"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204607215"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 31807732B
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:29 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E0E611C00107
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 39026826FFC;
	Tue, 13 Jan 2026 10:25:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/18] ifupdown: upgrade 0.8.44 -> 0.8.45
Date: Tue, 13 Jan 2026 18:24:56 +0800
Message-ID: <20260113102509.728-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229245

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Fix 'old-fsf-address-in-copyright-file' lintian warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ifupdown/{ifupdown_0.8.44.bb => ifupdown_0.8.45.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.44.bb => ifupdown_0.8.45.bb} (92%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
similarity index 92%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
index 8a8f477361..c78fb73398 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.44.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.45.bb
@@ -5,9 +5,9 @@ This package provides the tools ifup and ifdown which may be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
 the file /etc/network/interfaces."
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
-SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master \
+SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=master;tag=${PV} \
            file://99_network \
            file://run-ptest \
            file://0001-Define-FNM_EXTMATCH-for-musl.patch \
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://defn2-c-man-don-t-rely-on-dpkg-architecture-to-set-a.patch \
            file://tweak-ptest-script.patch \
            "
-SRCREV = "7d44f9ce6717a4a496fd46f28c52e12dbf5bafdd"
+SRCREV = "9ec193ec5a36f94ac8c647cdb6fe9b49c1a26fed"
 
 inherit ptest update-alternatives
 
-- 
2.43.0


