Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50169CAC58E
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13218.1757495822868181795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LdlvyjSW;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495827; x=1789031827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q6CP2ORAk5aMPDGvrbv4q+mAV9/zAKpod57Ye03+lys=;
  b=LdlvyjSWZtHBkWuGXBOzX5QgrU1M7dZ3bjrVr8RkeOas66Fwo3cuD1mW
   9QR47RJ0Ht4c7tL0bZ8JhxgcmhxLBJh9e1FScP8pttwbTgkk/6R20Q0gb
   TYGA3MQD1RvMPj3ln0Nvww2tivZuZGEz39sptBgDNHcsf1+LWBdNkz3mp
   MjQzrK7/9QJzA1r4ckd3olSuDULOq3qpPTz7nnO9xXZd7mmAFm/+PtKGc
   bMsyX6l6QSfFMpFNJn9zyDekbepSmao2k+elOjbl9Ov6rSRsUMXQeVEc9
   MCbHf1zc83DaDTVIxlJuUXm/00G2ZMFc5rlWYXbTk/VAO5fgh7XUuPN8n
   w==;
X-CSE-ConnectionGUID: cId9P8oSRhC2Mo5iZXohHA==
X-CSE-MsgGUID: YbFbOoiBRVmHH/haAvaXOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211786955"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211786955"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:07 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 1FEB81C1C71E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CEB7A180024E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:05 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 30C8E8299CB
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 27F021A007E;
	Wed, 10 Sep 2025 17:17:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/40] libinput: upgrade 1.29.0 -> 1.29.1
Date: Wed, 10 Sep 2025 17:16:19 +0800
Message-ID: <20250910091646.998-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wayland/{libinput_1.29.0.bb => libinput_1.29.1.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/wayland/{libinput_1.29.0.bb => libinput_1.29.1.bb} (94%)

diff --git a/meta/recipes-graphics/wayland/libinput_1.29.0.bb b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
similarity index 94%
rename from meta/recipes-graphics/wayland/libinput_1.29.0.bb
rename to meta/recipes-graphics/wayland/libinput_1.29.1.bb
index f38532a0c2..79df97ac06 100644
--- a/meta/recipes-graphics/wayland/libinput_1.29.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.29.1.bb
@@ -12,10 +12,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bab4ac7dc1c10bc0fb037dc76c46ef8a"
 
 DEPENDS = "libevdev udev mtdev"
 
-SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main;tag=${PV} \
+SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=1.29-branch;tag=${PV} \
            file://run-ptest \
            "
-SRCREV = "936cee224267a7d21c87c06203cd866c1572df20"
+SRCREV = "dc2c1ad181be88e1487468f7ca6f9d320981f133"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
-- 
2.43.0


