Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8EFEC0499
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14974.1772532605965475829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DzIuPRQJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532606; x=1804068606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1uVsgIAw7lqI4GVQ44MdR1jm1t0hReM3f0mVKXRGGWk=;
  b=DzIuPRQJG3YJX2Jf3+/Tx2Ln17cTFe84/tAWW8Wj1qSoMwTqbfwwLRk9
   UZPkfK7syczSjmsHYuIliZ9qu6UmfennMLeNYmwTFqQ8D3BdVl/+a4OGR
   khoaBsk73yPjwpbHt5b5mCOb1PlZ5aakVMnmurlBjMjCsjm737RnRB3hS
   hK28PwUXzi/OAyHpBZ6H2wcvn9hRZWYLYc8e/Gi/f31aZj8+bYfiPEq26
   bQjuX0acMu/W0dySWiRhDmbhISveCBjbFMAF3W8trjb8QmEhBaIb3C8oG
   jKmrWCmfp4sncVZ4frLzlMAaWyd4IItU0DZLVKsE6RiC9ORjyBBwDjx4c
   Q==;
X-CSE-ConnectionGUID: 3RDlFYseTLuiionNkMmaPg==
X-CSE-MsgGUID: 2tEefVwDQKaicB5Cl6Zmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231721999"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231721999"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1895440757E
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BB3961003BDA
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 08C611001CE3;
	Tue,  3 Mar 2026 10:10:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/23] libtraceevent: upgrade 1.8.6 -> 1.9.0
Date: Tue,  3 Mar 2026 18:09:17 +0800
Message-ID: <20260303100929.1624-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232288

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libtraceevent_1.8.6.bb => libtraceevent_1.9.0.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.6.bb => libtraceevent_1.9.0.bb} (86%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
similarity index 86%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
index deddb60f63..0dee0ebcc2 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
-SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
+SRCREV = "13701b5532e0c3295bf5670361692b0d0044228d"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https;tag=${BPN}-${PV} \
           "
 
 inherit meson pkgconfig
-- 
2.43.0


