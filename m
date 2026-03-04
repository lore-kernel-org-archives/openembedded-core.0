Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7F1EB7EC0
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:32:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14904.1772620354493320731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sVlYzEo7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772620354; x=1804156354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2g8zccnKBIzZINa1NuoJ387XuArsw2nxKSD00XG4kvs=;
  b=sVlYzEo7ljg3aev+4k8izVdRGp8ET2Gm7RZJzM2hwip4T3aJjyVl4fnA
   c0tSmdsY2yfwFLTTk5fdfD7W22SEuiAzCxgV3drcO2vxmST4DcA9Z7yqO
   TrtMjfftFenlzT4iHIVPYhFbomC1V0rVlaasN4wx3Z9zVnit4/VDtNLpG
   V99gYNpXVp5Bf3UHZsWNtJLXXmT5DxlRZIDR4RQ4dH1YN5ln97T2dJBhf
   CFL7r95qNu3u+ps5c/Eu7Q3ik5oxCwmAzHldjew5inwwAFYbqZtlGjXqx
   VlOmwSmLS7jjr/GrXoXohd3fk6Q/01taEIRNrjUQitR8InO3cQQfS7QoF
   A==;
X-CSE-ConnectionGUID: 3+0wB8KUR76wNTcg2kC1jw==
X-CSE-MsgGUID: lwZCoGzGT6CtAn2coLt7ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="232587657"
X-IronPort-AV: E=Sophos;i="6.21,323,1763391600"; 
   d="scan'208";a="232587657"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 067611000355
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:33 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A82D51C00CCE
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Mar 2026 10:32:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E518E100718C;
	Wed,  4 Mar 2026 10:32:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/10] gstreamer1.0-plugins-good: upgrade 1.26.9 -> 1.28.0
Date: Wed,  4 Mar 2026 18:31:59 +0800
Message-ID: <20260304103203.1649-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260304103203.1649-1-wangmy@fujitsu.com>
References: <20260304103203.1649-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232365

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.9.bb => gstreamer1.0-plugins-good_1.28.0.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
index d77e52d74e..c06d67f0a9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.28.0.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "f38566fb53ae56b7019a039475311756a28eb978a781154d67813dcb551ff5fe"
+SRC_URI[sha256sum] = "d97700f346fdf9ef5461c035e23ed1ce916ca7a31d6ddad987f774774361db77"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


