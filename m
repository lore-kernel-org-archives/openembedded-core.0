Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D830AE78D58
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43618.1770627838515560502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AMLOuwYM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627839; x=1802163839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=owUOF85o2bKZYzW0ZJJXVP5aY40PodXql1CiGmpsZH0=;
  b=AMLOuwYM2QCvRALV+24y5Ize4vCX5gDKmpGYk9LVEdOeRW+cl4It7P9m
   SOQtX9BtchOFJ4yJ8ygmn0TWWaqO0mGkBTfcJHCNtMv2pipiYbPoBRHvH
   cofULzrv9MWMMXq94XqGd+I/H5E+9twUUzS0ssxOqBGK1ARQTHaV2pcfG
   882shulLo0flQlvvav0YhvgqyeQmPwEGaEMEExUaP4oTY8NbHgdjLzlY9
   4GWk3CCtu06CvTcW51xBPTj7dZt9AlBN28GRBCjsN4Mtgd1rR6blhY+gm
   wzWU0cwJBpMaDZS0hfJpWaE5TBFH0A8pslHSJKhsCsYzvWGnsXxXqgcJu
   g==;
X-CSE-ConnectionGUID: 5SSP3K7hQZixv+OpYCpZYw==
X-CSE-MsgGUID: pH1PL2enTbal+OtlFkkd2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229013533"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229013533"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:57 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id EF7C01C000F8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:56 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9586F8D29C7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E956D101A403;
	Mon,  9 Feb 2026 09:03:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/39] mesa: upgrade 25.3.3 -> 25.3.4
Date: Mon,  9 Feb 2026 17:02:56 +0800
Message-ID: <20260209090317.1468-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230729

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1607fddd4b..d075210015 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0002-rocket-drop-file-names-from-the-generated-file.patch \
 "
 
-SRC_URI[sha256sum] = "05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b"
-PV = "25.3.3"
+SRC_URI[sha256sum] = "3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb"
+PV = "25.3.4"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


