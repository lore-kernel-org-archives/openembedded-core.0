Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32425CAC593
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13163.1757495860796499951
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gdc3vyut;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495861; x=1789031861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dwtAruSuGbHMXz4w6r0LOIWiF0CoafZw1fzSuGz+qjE=;
  b=Gdc3vyut/DhbYjBSXO9BXD4vi86a5Lj9uJC2z7cTYf6UYg96K3FlczEz
   3g9qaL1J3dJicImnZloyTN9AQUIyuciEaUxZ1jkELW20Peh1ifRmyZX4N
   hvBkyyO1u6uQAM59VpWpNKbK+JcRAL6iR4xKlmcDW64SU9bxQb3tp2hWQ
   rHPTmHSBkYnA02JCl4mA//R+qg2KKeuoMSYVgXHosRIGSY2Ju5gQjFgns
   rCgwaFS+6HuH0o450J4OQnkcfA6lH8kT61COswFuOOM58eFuq3vdCDKN5
   1ZlRF+VcNnusnmeW9b/87N9Tu3BjhVaAz1z0FtR4xIVUbVNkS2M6XjFoz
   w==;
X-CSE-ConnectionGUID: lCLPOWpmS3mXbL2H1orIPg==
X-CSE-MsgGUID: qHoy9ajtTdqlt77UtBMudw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212404398"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212404398"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:39 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 259DA820C03
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D78638D65D0
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:38 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 62E054076BF
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DA1D1A008A;
	Wed, 10 Sep 2025 17:17:34 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 25/40] ofono: upgrade 2.17 -> 2.18
Date: Wed, 10 Sep 2025 17:16:31 +0800
Message-ID: <20250910091646.998-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ofono/{ofono_2.17.bb => ofono_2.18.bb} (95%)

diff --git a/meta/recipes-connectivity/ofono/ofono_2.17.bb b/meta/recipes-connectivity/ofono/ofono_2.18.bb
similarity index 95%
rename from meta/recipes-connectivity/ofono/ofono_2.17.bb
rename to meta/recipes-connectivity/ofono/ofono_2.18.bb
index 36bbe9439a..e2666b3e7e 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.17.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.18.bb
@@ -10,7 +10,7 @@ DEPENDS = "dbus glib-2.0 udev mobile-broadband-provider-info ell"
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://ofono \
            "
-SRC_URI[sha256sum] = "70bb50997d3a7657edf133355677f8e04b2158bcb031118a67b296107f6ea73e"
+SRC_URI[sha256sum] = "f74c3bba7ebac488fed7bcfa6113b0e39e723d2e1a24b53f79c9f18a1c85dd00"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.43.0


