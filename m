Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BA2C3ABDF
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:02 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.45968.1747040637466043731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Jsh2Cq+5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040637; x=1778576637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VZ7mOLJMAmJY+q4dVWxb+tX/4MEw9qW81QgUxqgb0SE=;
  b=Jsh2Cq+5KtPa58z8pyZt+RNkrLfPTlCfr9sbNgleUZ7uCL5hiWPZduK4
   IOhFXP3ms3i2iPujEit1MrwyGK90q6vpqMVgxOmb41/FTx8J+bJ1sF0Qe
   UIxXGVLwk6jCwzpKcHe50+mwu9BXOSzK8kx1cMWWpfiTas2lSwJTp3Lmi
   iAUCSWMU+D/QcYFrGHYAoEuY9I9CIYGcbXGhb9mA0lYFeOMfmZF2pD3cw
   VtNaz9g1OucAnBtSoWA3ZdhmAzd/N+UmDPD7plW9WbvItA+3sIhToxYHe
   6OjZNaXF4R38qZ+zFM9NtGAxTBna6bzQqJ0rqHszaxvDv7Ed++WjsoYBS
   w==;
X-CSE-ConnectionGUID: GsxtPrhTQlqcLdHxT9XpKQ==
X-CSE-MsgGUID: bzcZx7c0RUKAigxHMp5eow==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187121891"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187121891"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 180F6C68A0
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CEB6DD505B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 664C61A009A;
	Mon, 12 May 2025 17:03:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/56] babeltrace2: upgrade 2.1.0 -> 2.1.1
Date: Mon, 12 May 2025 17:02:46 +0800
Message-Id: <1747040619-7566-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216301

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* src.ctf.lttng-live: remove lttng_live_lazy_msg_init function
* src.ctf.lttng-live: fix comment formatting
* README.adoc: Update working version to 2.1
* fix: export bt_component_class_sink_simple_borrow
* fix: building from the release tarball without flex
* doc/api/libbabeltrace2: use '<code>' i.o. '<span>' in '<dt>'
* Fix: doc/api/libbabeltrace2/Doxyfile.in: set version to 2.1
* babeltrace2-sink.text.pretty(7): add missing default param. value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../lttng/{babeltrace2_2.1.0.bb => babeltrace2_2.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{babeltrace2_2.1.0.bb => babeltrace2_2.1.1.bb} (98%)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
similarity index 98%
rename from meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
rename to meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index a9a3a9961b..fdcb637761 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.0.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -7,14 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f6b015e4f388d6e78adb1b1f9a887d06"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native virtual/libiconv"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https \
+SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=https;tag=v${PV} \
            file://run-ptest \
            file://0001-Make-manpages-multilib-identical.patch \
            file://0001-tests-fix-test-applications-in-cpp-common.patch \
            file://0001-tests-set-the-correct-plugin-directory.patch \
            file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
            "
-SRCREV = "e61d41ff3c3ac6a123930d4e60cf710ff9ea18e0"
+SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


