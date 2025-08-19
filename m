Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6554FCA0EFE
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.5633.1755574547322989178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P4aiSbbs;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574547; x=1787110547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oQPqmvW+gmrwC3aRDE1PcUZ8OxL8Gl9u7RTdDK8truY=;
  b=P4aiSbbswd3jKncSiZgwDS5bT006W0FiXybNnt/883mTaKqgNEdwbA/5
   FYBzmBSxFiZVUfbzHmUf0ApecWwV11wLdKmy5rlf9QkuNhpVp2bXO5mYR
   ubPM5Qxt82w1VUdz8yNchZUoWeRVJ7AcV+slIyAKSTzDFnD4vGjFKt5Iu
   amceUyLCon2omWErVn7NCClp/ZstiWZRCa4Ln9oz+qTh9AlL7XvKB2Y6B
   cSzpyGFm+HU8XhW6t62lERlq5GLnnBy/zEufQayN7jbN93DG46zmIhsiA
   BodX7Mu44B3GjqkkBgdLwNf6hhyiRNYeD6neiACeLQVxrvogrt8yczl0Y
   g==;
X-CSE-ConnectionGUID: jxNt80RwQPWptJCMCZIFAg==
X-CSE-MsgGUID: C50xoiVnSLWcP7X6fTj29g==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="188555751"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="188555751"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:45 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 79D9742A30C
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:45 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 305A618026F2
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id EC37318001D3
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:42 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 732F81A0071;
	Tue, 19 Aug 2025 11:35:39 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 11/11] gst-examples: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:32 +0800
Message-ID: <20250819033433.390-11-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222071

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{gst-examples_1.26.3.bb => gst-examples_1.26.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gst-examples_1.26.3.bb => gst-examples_1.26.5.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
index df8fd4bd26..2fa4ef11fe 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/gstreamer/gstreamer.git;protocol=https;b
            file://gst-player.desktop \
            "
 
-SRCREV = "87bc0c6e949e3dcc440658f78ef52aa8088cb62f"
+SRCREV = "82cbccedf7946a32d28a5aaec8ebbcb627770c19"
 
 S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
-- 
2.43.0


