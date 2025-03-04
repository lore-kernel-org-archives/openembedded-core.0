Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9769AC28B2E
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 09:09:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.18198.1741079368097326385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 01:09:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eOkSL61/;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741079368; x=1772615368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kZa2kRzBH59/nvThQFovKL71PKD061sg48pObmyuxAs=;
  b=eOkSL61/szbxNAODoTOUcWsiUppIN95cODNHBNUJWPNskhbFuiIAq8qB
   EKXB9UKPqgEDKHRU/mjhJEtra4vcYbB1hACvydcEbA4Uso7NM7PuXzSnv
   +qOIQjULkC5cV1MtcV2sqcgRFUWyIZQ2sxokzrUhDhK87qXKCwwa8JFOb
   bOzaPZWpqC9fSTq7EF2WRFnhPP7GqWFV84PA1Y6JS9+jYxEKd7UPnn4tp
   kSOue2vQFo8C3gPOiJoD+j1frj9FnsScS8eqh/v3g2HRkvKMfomfoTmOH
   yDAKUat1jTrnfKZL1ejo+8XZTKRe3WYnvFD/XRA+WNxUduaB2K+aeaCRH
   A==;
X-CSE-ConnectionGUID: dr/n8yjQQ36kxiW3yGCpdw==
X-CSE-MsgGUID: 8TMOAjfSRQKnF6TEc8v0+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="170800538"
X-IronPort-AV: E=Sophos;i="6.13,331,1732546800"; 
   d="scan'208";a="170800538"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 18:09:25 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 790E5D6EA5
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D86CCFADC
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Mar 2025 18:09:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF9A81A0071;
	Tue,  4 Mar 2025 17:09:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/31] dbus: upgrade 1.16.0 -> 1.16.2
Date: Tue,  4 Mar 2025 17:08:47 +0800
Message-Id: <1741079356-13445-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
References: <1741079356-13445-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 09:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212229

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The branch used for development releases has been renamed to 'main'.
- On Linux, fix build regression with libselinux >= 3.8 and verbose mode
  enabled
- Documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/dbus/{dbus_1.16.0.bb => dbus_1.16.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.16.0.bb => dbus_1.16.2.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.16.0.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.16.0.bb
rename to meta/recipes-core/dbus/dbus_1.16.2.bb
index 80e766f959..9475e55b57 100644
--- a/meta/recipes-core/dbus/dbus_1.16.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "9f8ca5eb51cbe09951aec8624b86c292990ae2428b41b856e2bed17ec65c8849"
+SRC_URI[sha256sum] = "0ba2a1a4b16afe7bceb2c07e9ce99a8c2c3508e5dec290dbb643384bd6beb7e2"
 
 EXTRA_OEMESON = "-Dxml_docs=disabled \
                  -Ddoxygen_docs=disabled \
-- 
2.43.0


