Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860ADC36000
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 06:22:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.5382.1742278929962763098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 23:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eFDNZlJn;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742278930; x=1773814930;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kzHGWtHqOSFHIxmPYNLvUTu/KM+7vpebrJnFWjuscN0=;
  b=eFDNZlJn+96cn/jT54fxJZ0lZSXfePz1caocJqAEW+Igm+a6H5YxO3MQ
   RoAGSRJ8YwqMvABP89cbABzsU1WMww9fehaRZGCanCGiZcHKRtBy4FNHE
   JZKuj9z55vMLGI4mYu1KAyxcnq+dhoiRc1qQ3XaZwbuEKwKHI0b8WQur+
   A2NCzD4oFtXdLSMEBL9v68kgEA3ihWrUFr1bOo6+C/BmydTQvhQE9dUus
   zuSfPE8YB5SXoEJBQ/zMz1II1whZD2gYgUnDfDFErEAxvHZ5wTLOzjBqz
   uj2TSno9FxWDhq50Lv4P0Yh+pIHU+kLGIwNFO3AY7pMszFJddqxzKkD5h
   w==;
X-CSE-ConnectionGUID: zoShP6hQTSq7ZI96z0hzWw==
X-CSE-MsgGUID: gkHx3Ib8S6yL/df3TVG9ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="180801795"
X-IronPort-AV: E=Sophos;i="6.14,256,1736780400"; 
   d="scan'208";a="180801795"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:22:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A0591DBB80
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 68D76D72AF
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 15:22:05 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2EECB1A00AE;
	Tue, 18 Mar 2025 14:22:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/12] python3-dbus: upgrade 1.3.2 -> 1.4.0
Date: Tue, 18 Mar 2025 14:21:48 +0800
Message-Id: <1742278912-2989-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
References: <1742278912-2989-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 06:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213172

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-dbus_1.3.2.bb => python3-dbus_1.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.3.2.bb => python3-dbus_1.4.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.3.2.bb b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-dbus_1.3.2.bb
rename to meta/recipes-devtools/python/python3-dbus_1.4.0.bb
index e0cf64c70e..057c97f656 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.3.2.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.4.0.bb
@@ -5,9 +5,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=97f58951300aa52a9f9e3a62bd5c846c"
 DEPENDS = "expat dbus glib-2.0 virtual/libintl"
 
-SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz"
+SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ad67819308618b5069537be237f8e68ca1c7fcc95ee4a121fe6845b1418248f8"
+SRC_URI[sha256sum] = "c36b28f10ffcc8f1f798aca973bcc132f91f33eb9b6b8904381b4077766043d5"
 
 S = "${WORKDIR}/dbus-python-${PV}"
 
-- 
2.43.0


