Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E8FCAC594
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13151.1757495822205357857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZFy4Ciwg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495822; x=1789031822;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hwduoMi1xfXNcqWB9YzEHjLnoWfrrOPXyonE+kDawFk=;
  b=ZFy4CiwgsUtwCv3sMPp8M7kjEVblK5Xd/n+L2ezfLG3Se1qRQBid+l+N
   RiGWyUwZm2aXsQWDxHB00EsdnvLvr9JPevH9OXkTLOqOUjsApxxgzCDDK
   ihYnZM2SC7Wuy4Ofm5o5Tt/r9IHbSJI1Fui3F4m4IMR4oBzH2zqWS+ygl
   0L128KIbOKEdQ6qY8mf3oQ+zTp093gvZF+RjvEVg+wEd43w+/CUQhH8uv
   hdb5SFG3qSXLwfHxAnpNr+0pj2nh32QwinT4jSDHy1tJaZaz+SWYtmgBo
   7m51rqYyI1B+TwDYQzicccSvbyXMEnTHftqrkCgxDzToDzjKgaVrU4Zac
   A==;
X-CSE-ConnectionGUID: eguko7kXTUCdxdaUxyu69w==
X-CSE-MsgGUID: VS24u4YpQaqQI66p6bqhHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212404326"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212404326"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:00 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 43A8482073D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:00 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F2194140039D
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:59 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 54CBE20034AB
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:16:58 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 59A3F1A0069;
	Wed, 10 Sep 2025 17:16:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/40] appstream: upgrade 1.0.5 -> 1.0.6
Date: Wed, 10 Sep 2025 17:16:08 +0800
Message-ID: <20250910091646.998-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223154

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.0.5.bb => appstream_1.0.6.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream_1.0.5.bb b/meta/recipes-support/appstream/appstream_1.0.6.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.5.bb
rename to meta/recipes-support/appstream/appstream_1.0.6.bb
index bb293f76e2..62761380f5 100644
--- a/meta/recipes-support/appstream/appstream_1.0.5.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.6.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "ce0ed29e89abd5f0cf790ea87d792f1967c3413060beb30e63a979578d975121"
+SRC_URI[sha256sum] = "db4439db6a33de3ca1041473501610844ddf1b72ae23016c05242c681c380b4d"
 
 S = "${UNPACKDIR}/AppStream-${PV}"
 
-- 
2.43.0


