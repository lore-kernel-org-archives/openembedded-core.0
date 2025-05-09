Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042FFC3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:51 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.6514.1746763007422795381
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j0QZWmCA;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763008; x=1778299008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/CShu+kPGDLVvM6Ue/X0755OFMSPLnzyyNBDnfjcr4M=;
  b=j0QZWmCATkMuehNYEY3kUK1s4wR5lzXAVm8Ct9ydv3VQZ0NYWiYb/q1X
   hzzH8e3NvNQW8iDBCwSwBLDKSJgUZaSryG56kKBsuLPu7iDIjqUtBk3rq
   8WZfkcBvIdPNXTtLMtwZaGTYDOA+/9/X3/he1Lrl6I/7mDeCcNHtgdX4r
   pGyKQFN8UvrybbYC9r5Pjte7+AljzkRHG4+G1/FkqmeI8O1cNlX19kq+e
   P+prv16DW3YlmCrc5JU1WLAXVfJ0oJsVKS7bgiWntM7Oa8+rACLEgQp2m
   6CoqFBLGr2NthN0oIZq/8STz58mRHOAMORT5GLsSR7bfb/IBTTRi6P7OS
   w==;
X-CSE-ConnectionGUID: KCEp8hDCRRWXfpXh5tYHQQ==
X-CSE-MsgGUID: U+a8t/IpR9KWf5o2mzFUdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198854328"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198854328"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5CAC1E8521
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19642D50BD
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:43 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9DFBB1A009A;
	Fri,  9 May 2025 11:56:42 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/19] gstreamer1.0-plugins-ugly: upgrade 1.26.0 -> 1.26.1
Date: Fri,  9 May 2025 11:56:08 +0800
Message-Id: <1746762980-12783-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ugins-ugly_1.26.0.bb => gstreamer1.0-plugins-ugly_1.26.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.26.0.bb => gstreamer1.0-plugins-ugly_1.26.1.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
index f0e42ad8fb..0d35abf2c6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.26.1.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "a86b51c8454a813120848c803421f327d8c07aabcae461e0597cc49398c0fcde"
+SRC_URI[sha256sum] = "34d9bcec8e88b008839d8de33fb043ae75eb04e466df74066fd66ee487a8ec4f"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.43.0


