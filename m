Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70360CA0EFB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.5646.1755574542344187087
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C9zo+zbs;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574542; x=1787110542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aKELv2Yh3hWl51HKIfqh51uopAtbxMCZh2kAj8uJOIg=;
  b=C9zo+zbsdPSHAPqar16aoKEdUc7uzLj5g8QfrcLgVpslqaMYbtHBBtdf
   3Y0WbkQZ11uE/AoWAiltwWFf+KTU5p4oqDulykKb/59yDY8WhErSH2nsb
   BhhMGv8vOq/6N/KK8FDreCKkBcNLQDfWE+r6eWvihHLyOxT21OLLj3JDh
   nH5BHA3Jn/2FwXJRE/Hs+2gtRjBisOXZJV50O3pzZKOAytoQ9PwlZxE8G
   NNhy56Bt4b+u+sBnBCCGY2E8iFNJ+ezDs66+bWLW5kDB++V2kS+GvZR7Q
   bdcc6BmmkVOZBUqHMXMgm6AC4DdRC5svq0ns7+UNneEeFH/fqDKu0spVf
   Q==;
X-CSE-ConnectionGUID: 7B1dvT8GTyGLFls+BMWkmQ==
X-CSE-MsgGUID: vDk1SkNETj6MJYlGUaXNGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="198173859"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="198173859"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AC62C1000347
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 681C31C000CD
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 33A921000593
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:38 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9F2B81A0074;
	Tue, 19 Aug 2025 11:35:34 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 03/11] gstreamer1.0-python: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:24 +0800
Message-ID: <20250819033433.390-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222063

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...reamer1.0-python_1.26.3.bb => gstreamer1.0-python_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.3.bb => gstreamer1.0-python_1.26.5.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
index 1f80063a0b..12340245e8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "9343b9a7c45f472498c24ddb6fea9aba5f1a24395ddbc0b79da6e485e42d1b12"
+SRC_URI[sha256sum] = "86e2fe2b1bba7ffc18b1d4abe1035fe1c33b20fe4e077cce2f90dbfa445b2341"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


