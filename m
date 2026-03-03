Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688BFEC0493
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14944.1772532601674678010
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jFK/Vcv5;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532602; x=1804068602;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMWJfCy/0l4TZN4ldy3+VpIdz7F63cRY3jPdS1yExPE=;
  b=jFK/Vcv5BdqjFx8wf3i6G+pwLL2SptLlMnkJ04M8iTQPXerxSMquzrjE
   rNlQR4P1OtP8l+PrzHmduO9Cl+dY2UK8YNnrJtELwq75+ueiIl3krr1m0
   xU4pKnwRztsZEdJMS/+iQtwXAUvwWYiwUmgSIKrVAQ8CYjoNCPoDs2m3X
   dsV6dov8pUxnss/yN7jz/ZPcZ7ZsSGVpXjK2FFGPNcW9QsP57DHS4WhCC
   Ix3r6hDONHvvWs2eY6dxdivvpdjqLS6bJ5CFHafamcZnSdeiflGHx7AR8
   r8qTQEV+tNNsZqmv+Een4K6MVdibfD5532NykbruUClSzTazeVeGyFVPw
   Q==;
X-CSE-ConnectionGUID: QLxsh7iFTZu9QCToV4yDbQ==
X-CSE-MsgGUID: EtwB23pGSPytIN36AUBn6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219169575"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219169575"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 34AC7100034E
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:00 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D445B180199E
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 230571001CEA;
	Tue,  3 Mar 2026 10:09:56 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/23] libgpg-error: upgrade 1.58 -> 1.59
Date: Tue,  3 Mar 2026 18:09:15 +0800
Message-ID: <20260303100929.1624-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232286

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026.

Changelog:
=============
* Take care of POSIX semaphore "shared" semantics.  This fixes a
  problem on NetBSD.
* Fix preparing the environment block on Windows.
* Fix for GPGRT_PROCESS_*_KEEP flags on Windows.
* Update Russian and Swedish translations.
* Introduce autogen.rc variable autogen_use_force.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libgpg-error_1.58.bb => libgpg-error_1.59.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.58.bb => libgpg-error_1.59.bb} (93%)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
similarity index 93%
rename from meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
rename to meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
index d42a9028e8..53280f5770 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.58.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.59.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://bugs.g10code.com/gnupg/index"
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=badc79a9308e1cbd2657b2441c7cf017 \
+                    file://src/gpg-error.h.in;beginline=2;endline=18;md5=f146974b5d59380f15c9f0eaaac4cbec \
                     file://src/init.c;beginline=2;endline=17;md5=f01cdfcf747af5380590cfd9bbfeaaf7 \
                     "
 
@@ -19,7 +19,7 @@ SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27"
+SRC_URI[sha256sum] = "a19bc5087fd97026d93cb4b45d51638d1a25202a5e1fbc3905799f424cfa6134"
 
 BINCONFIG = "${bindir}/gpg-error-config"
 
-- 
2.43.0


