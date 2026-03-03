Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC7EEC049B
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14942.1772532599734808045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=miqpEEoM;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532600; x=1804068600;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dioCtO3jbVQQr0KB9rs/z3LQWflSYD3HXIYtoxgdSY4=;
  b=miqpEEoM6EdOyxxxt2eMJfV/p6NS2k39Ago3A6LrEse0poKoSG04eSn/
   GP+PYv9jmwbpS1YCBAN2YCKsaH8IKvjGOlm/3shDalH8tsJUZKc6Fd24U
   PJYwSIvNi7EC4VCssK8u+Q75r+cusWXLZSRg0mu6LtOcjsI9IT4FxjNkr
   IyhJ/DOsmclW8GwF+rfEqb/GIabUO+JvYQLCuq3ttRlvTefDXPcOPO887
   PmlI7vC6rjLDG8rQZcxekKlP/It482KLDZkRxlnjiv1+fh87Wcy2nRrqa
   7CQpkkIJe1Ni6O2sIz1WZhgWDXoYN7UzzBzq2sC5wzgry2SUGeB7rBTDd
   w==;
X-CSE-ConnectionGUID: O+KXeRjKRYSd6LsXANdqcQ==
X-CSE-MsgGUID: 0o7i3iKKT3WS1v6bCRkqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="210717806"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="210717806"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4ABE1407577
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:58 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E50FD1800324
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 260161001CE5;
	Tue,  3 Mar 2026 10:09:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/23] libfontenc: upgrade 1.1.8 -> 1.1.9
Date: Tue,  3 Mar 2026 18:09:14 +0800
Message-ID: <20260303100929.1624-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232285

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- gitlab CI: drop the ci-fairy check-mr job
- meson: Add option to build with meson
- configure: Use pkg-config to handle zlib dependency if possible

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libfontenc_1.1.8.bb => libfontenc_1.1.9.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libfontenc_1.1.8.bb => libfontenc_1.1.9.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
rename to meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
index 0fc117fc58..0727825112 100644
--- a/meta/recipes-graphics/xorg-lib/libfontenc_1.1.8.bb
+++ b/meta/recipes-graphics/xorg-lib/libfontenc_1.1.9.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96254c20ab81c63e65b26f0dbcd4a1c1"
 DEPENDS += "zlib xorgproto font-util"
 PE = "1"
 
-SRC_URI[sha256sum] = "7b02c3d405236e0d86806b1de9d6868fe60c313628b38350b032914aa4fd14c6"
+SRC_URI[sha256sum] = "9d8392705cb10803d5fe1d27d236cbab3f664e26841ce01916bbbe430cf273e2"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


