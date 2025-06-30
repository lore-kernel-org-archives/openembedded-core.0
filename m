Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0914C83F05
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:13:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.35175.1751274807907310760
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ha2vlnrX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751274809; x=1782810809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OvDzYpt+k06N9LZAw264Rs0XvWE/iiOMy+wTk7JdHnY=;
  b=ha2vlnrX9wE8/ZTjeGgjO5QdxrYUleG6w5f9NM0g4UOWjAAy1cJ7sl8P
   GfI6kTU8hStNMVu7iEt3Zv+x2G1T+5zZbdZFw/sLKMjTWJzm8Rmiy0i1Q
   JS1M9QIupiRQ+/RTinKAsFQ7j6VhmnTmDP3fIkOu3JwDIP4u1Z1BXfC9a
   GYHUf/dfinV5xQYEoHm9pmIJvEGeBNUI1pOqPYqpWYvKlLVzNu1eRkYRP
   wn+lCrOZHoIww18baJ9K+1ZrCQI0hSjvf2mYrmc1oNTEi3ixWVXLND8e4
   9Nr5vcS+RdB0zPRYg8VkLl+3DR1JtvCuQ8oo0k1OJ3uEorClpHRH18e9P
   A==;
X-CSE-ConnectionGUID: FCvQxfEWRGGlmtBntNralw==
X-CSE-MsgGUID: Asc4NG+FRvOakRqgeVucUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="204573484"
X-IronPort-AV: E=Sophos;i="6.16,277,1744038000"; 
   d="scan'208";a="204573484"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 18:13:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 41C2642A319
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:27 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id B1EE018009C3
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:26 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 20B22B4E2F
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:13:26 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C40841A0073;
	Mon, 30 Jun 2025 17:13:25 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/37] gstreamer1.0-vaapi: upgrade 1.26.2 -> 1.26.3
Date: Mon, 30 Jun 2025 17:12:53 +0800
Message-ID: <20250630091315.1897-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250630091315.1897-1-wangmy@fujitsu.com>
References: <20250630091315.1897-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 09:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219474

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.2.bb => gstreamer1.0-vaapi_1.26.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.2.bb => gstreamer1.0-vaapi_1.26.3.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
index 9b8aaf09df..98eba8bcdb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "0e24194236ed3b7f06f90e90efdf17f3f5ee39132e20081189a6c7690601051a"
+SRC_URI[sha256sum] = "2d643fbd1420297da5a4d6945d11f0a5b4f82feea54ea6aec9368d42995d8b03"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


