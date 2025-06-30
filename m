Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D96C8302E
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:37 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.35290.1751274807414773619
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OqeIu0qF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274808; x=1782810808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dshBbtlHpzq+UcskuWSRLwfOgkg5Bq9VTYkL/tuxIU0=;
  b=OqeIu0qFpiXHBURbtfGWw6zQHHyVtx3QSKVzL0wvoSRR31r61uRkzxWZ
   93G3Cgek9qjs2CxDzDrvAfZjaW6M3cOZEtrrDHElbJtVqRnNARMtnGw/E
   mg2w3fJHDNRzIgakMJNIFjV9krKCNYMhV+gorCOs+Ogy7161KHobxE2jT
   h7iSAF5r4L/bFccQoocqiQdTrsG2qKPbVwae3d0ErDHv6JEo4eUKlQSNx
   7Gj6VdDbPq0rY0KwFDhF1Xu0ctK1R6jR8I0kYGr0S10HcW9SZ6egg+sPM
   KT48uvWpY7eSLGIZ37Fu8uJ9WvyvLGlnUJ3cjNeslZxLiPMMrrGnmvGFA
   Q==;
X-CSE-ConnectionGUID: BzB/w40tTn+esAZ6dgHOzA==
X-CSE-MsgGUID: Kpofa7qaT/qB9USFi2zgSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204507054"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204507054"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:26 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CB36C1002B86
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:25 +0000 (UTC)
Received: from yto-m2.gw.nic.fujitsu.com (yto-m2.gw.nic.fujitsu.com [10.128.47.163])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 5124E180027F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:25 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B7FE2D5068
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:24 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 36D201A0073;
	Mon, 30 Jun 2025 17:13:24 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/37] gstreamer1.0-plugins-good: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:48 +0800
Message-ID: <20250630091315.1897-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219469

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-good_1.26.2.bb => gstreamer1.0-plugins-good_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.26.2.bb => gstreamer1.0-plugins-good_1.26.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
index 7a81a29d95..601a7961c7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.26.3.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "d864b9aec28c3a80895468c909dd303e5f22f92d6e2b1137f80e2a1454584339"
+SRC_URI[sha256sum] = "fe4ec9670edfe6bb1e5f27169ae145b5ac2dd218ac98bd8251c8fba41ad33c53"
 
 S = "${UNPACKDIR}/gst-plugins-good-${PV}"
 
-- 
2.43.0


