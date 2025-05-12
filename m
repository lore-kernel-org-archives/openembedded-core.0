Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0BFC3ABCC
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.45913.1747040637212932732
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O4+k9iAX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040638; x=1778576638;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WGhwMAjmOvnyffX0G9s0C9CE+ENgI81kARCTkU4c6BA=;
  b=O4+k9iAXP26xYRe6BiyjsO0KV+RFySc5sNwOfiA/DkT8KJR1ZYq82QtN
   oYwJgWBjGclF5vK0TRwRYjoTvwMPj0vJpEUC9KrjBLAGhkfqKBuI9U5kb
   tywrSsQF5S4BJV6nt8F9gkIDR9AjmzmBKYiKnm4yPkB104v77NoO9gBXB
   pk/rk0JPETsw68yVgeYAsnf3fUD0pGzo5RqZ7SWd2JyIJOw5ihT/D7D2f
   68DwAehmYJi4vVPgyluhdNRY0gc8c3e+XdFVGAHC3uu3kzRDuGtWPlEjW
   mBe6bHSGupljf+3sul3OkdI6Gw/HWiwZzVbOB8ai9L0zEBC9Q8BTtDmey
   A==;
X-CSE-ConnectionGUID: brJ/MeyqQYCjmvv4p1qKkQ==
X-CSE-MsgGUID: 5VtcY68qTVe7m+knuA5B3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="199193682"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="199193682"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E3A80D5010
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 99174D505A
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2F8BD1A00A0;
	Mon, 12 May 2025 17:03:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/56] at-spi2-core: upgrade 2.56.1 -> 2.56.2
Date: Mon, 12 May 2025 17:02:45 +0800
Message-Id: <1747040619-7566-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216300

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix the build with glib < 2.76.
* a11y-manager-device: Fix unmap_keysym_modifier.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../atk/{at-spi2-core_2.56.1.bb => at-spi2-core_2.56.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.56.1.bb => at-spi2-core_2.56.2.bb} (95%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.56.1.bb b/meta/recipes-support/atk/at-spi2-core_2.56.2.bb
similarity index 95%
rename from meta/recipes-support/atk/at-spi2-core_2.56.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.56.2.bb
index c806779ca8..59eed4b5ab 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.56.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.56.2.bb
@@ -13,7 +13,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "fd177fecd8c95006ff0a355eafd7066fe110a2e17eb5eb5fe17ff70e49a4eace"
+SRC_URI[sha256sum] = "e1b1c9836a8947852f7440c32e23179234c76bd98cd9cc4001f376405f8b783b"
 
 DEPENDS = " \
 	dbus \
-- 
2.43.0


