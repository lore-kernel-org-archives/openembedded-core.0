Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D410C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.11799.1713948205946764549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=txfjj6uv;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948205; x=1745484205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3rPvs+lbDUo9C0ziGjNTlJoAxO03b4z9rHew13VRc0s=;
  b=txfjj6uvkyL+o7z4Q6i7mm/g8GhMFZ6ozL4n+DbDB/34509pgfLnqXdw
   JRg9Tohp9YwT+mrnlYx+vxpZA2OH9tUD1T/P0AoEAyfXUidfMPZviWjxr
   bgEPIw3baU9xfgfpGN5M4518ukqvP6tTgVDvoW0hk90YeVtJzYL+pTgZ5
   JxCs6RHdRRxzlus71K6dtN8VR6RZ7K7Vmgpvp0IjDlXASDHuCbAelUd2h
   io0oYjfYjC/FEYoilCqsJCRMz3bDixg3esvGqOaL+abAPCK+yWWq5dTFr
   1dSPdGJ/Y7pHgX7h4wJ9dJrIB60Dsxq4zZplJpJCspnG//yPHQXmkBAL6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="144528069"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="144528069"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BAE0ED4C32
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F025AD52E9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8F7D7223FC9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3BB741A000A;
	Wed, 24 Apr 2024 16:43:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/38] vala: upgrade 0.56.16 -> 0.56.17
Date: Wed, 24 Apr 2024 16:42:30 +0800
Message-Id: <1713948152-13501-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.423000-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yYL5ja7E+OhyF4r8H5YrEqy7N2IdiDgmM4FI
	YM/Aaml3qd0gws6lMNXuDoHhYktM5aKnrGEaKkhZL7p//vLv4bNMYVBYK2XpyvZqmYjn42vPYwE
	0TQTA60pBkUkkJkv+l3nbv4FbkMngWkIi5GvRHEo/QdUh6LEl0ME5XPQnBzGXq8KsbROd9VTZ3y
	a1EhGxQ4GQRIwjTl3iuFf+VRAZx7CU+min2erZ/W9OepgphdNGVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7fCZxiDQ9OQwLbigRnpKlKZx+7GyJjhAUcVPUjxHhqOo9t4NoXC4qjmMiSMxZelDVMcWi
	7wx46RhMSITSjOvKHZKyZfgPj9dDq1DehoiytW557dVZYdqH5a1GuZ0VP1d87H2fVekOqwmYL1K
	ImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198681

From: Wang Mingyu <wangmy@fujitsu.com>

* Various improvements and bug fixes:
 - codegen:
   + Add missing initializers for private fields of GSourceFuncs
   + Update array length variable passed to null-terminated ref parameter
   + Properly pass through a null-terminated out argument
   + Refactor and cache parameter in loop
   + Only handle null-terminated array as such if there is no length given
 - vala:
   + Allow declaration of static nested methods (local functions)
   + Correctly use Path.build_path()
   + Point to the invalid initializer on error
   + Report invalid type in property assignment attempt
   + Inherit important attributes for Property backing field

* Bindings:
 - glib-2.0: Avoid unnecessary copying operations in FileStream.read_line()
 - glib-2.0: Add SPACING_MARK, deprecate COMBINING_MARK
 - glib-2.0: Add dev_t/gid_t/pid_t/uid_t/socklen_t types for compatibility
 - gnu: add binding for flock(2) and its constants

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/{vala_0.56.16.bb => vala_0.56.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.16.bb => vala_0.56.17.bb} (97%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.16.bb b/meta/recipes-devtools/vala/vala_0.56.17.bb
similarity index 97%
rename from meta/recipes-devtools/vala/vala_0.56.16.bb
rename to meta/recipes-devtools/vala/vala_0.56.17.bb
index 1c8e4fc673..acd6c43096 100644
--- a/meta/recipes-devtools/vala/vala_0.56.16.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.17.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "05487b5600f5d2f09e66a753cccd8f39c1bff9f148aea1b7774d505b9c8bca9b"
+SRC_URI[sha256sum] = "26100c4e4ef0049c619275f140d97cf565883d00c7543c82bcce5a426934ed6a"
 
 inherit autotools pkgconfig upstream-version-is-even
 
-- 
2.34.1


