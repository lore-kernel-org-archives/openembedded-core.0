Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA651CF65F2
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:35:36 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19056.1769430934248089145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:35:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PSuFCwAc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769430934; x=1800966934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmOf44xAHGGJyXAzKVYX7qOgSaldSGrmVmpn8pqq6Iw=;
  b=PSuFCwAcANZlomV+6i+Ag4afB9qs38XBT5iRqd6QhwYpFYy7g6cBc+hX
   R9xaRvpKc6Togmi1tB3eddNpm5JZHVME6gpCwKpslTGcaBGpdoqmg2X0W
   K7HJKOJ6iu+8RD01JGnyCiBUKgWd+/p7po6nHNODNQxxc5cpMNakZ4gx1
   aL+agSD4S94SMlwFCgT+JP3sxkCy7jfVI/rOozEyiLDb/qhUU1yNDIT65
   YajWLNX/8oEOM9BGpoxCynuzCArYIL+jtRPg7GHPDt8EecbhY/P8e+eYO
   btjxkYN4iFkhsGUyhl1z511qVb4mnIY59C+f++yRrzioggR3LauG2k25p
   g==;
X-CSE-ConnectionGUID: gRApeDWAQhiU42KDCY/kqA==
X-CSE-MsgGUID: TsNS8s3QRSK42ZGN3Qp/Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="227138716"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="227138716"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:35:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5B0C6BA
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:32 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 1085C18026E2
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 64C5140599A;
	Mon, 26 Jan 2026 12:35:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/17] p11-kit: upgrade 0.25.10 -> 0.26.1
Date: Mon, 26 Jan 2026 20:35:03 +0800
Message-ID: <20260126123517.1020-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123517.1020-1-wangmy@fujitsu.com>
References: <20260126123517.1020-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:35:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229987

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../p11-kit/{p11-kit_0.25.10.bb => p11-kit_0.26.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.25.10.bb => p11-kit_0.26.1.bb} (97%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb b/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
similarity index 97%
rename from meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
index 656ca1cf26..44ad776d59 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.25.10.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.26.1.bb
@@ -12,7 +12,7 @@ DEPENDS:append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''
 
 SRC_URI = "gitsm://github.com/p11-glue/p11-kit;branch=master;protocol=https;tag=${PV} \
            "
-SRCREV = "90dba4ded391c6232a78ee14db0da76efda7b1c3"
+SRCREV = "49ccc27a1e433d6128d40a43c7ecc4624b0dbfde"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
-- 
2.43.0


