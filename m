Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1CDC7EE31
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.26251.1750065416796232873
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aUl/cfFn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065417; x=1781601417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y+pquO9g95b8bjHDaWpt+uXwpNzgPhc3TjKzpM8+Wkc=;
  b=aUl/cfFnvve24Pr5aDix+HDoZGl03VFPkqjq+c5TPQbU78EtGbfwRfUE
   cvW86e1YD8vkbOoRnQ46zpkzyFc3gV/Mda1ChPXfVEIZu7xQ+duJAygmJ
   dzyph2eXABZUjlxRxUNfz65DWedDSMra2aoGJ4P1aU9meHxleHFjKAEia
   p5+ifG1WFhsSog3cvM2ZiCRV4uaYuoWvRXf/BTQYJ1hOiK06b4L69WOAn
   5JCki3pATfwcGad6x83bvmS36bHVbZjLAiGG4rIDHkmyxEaCNAOhoJ1e5
   oI2dKH4PSepfrXLxeyoitS9XQE18pq6zpUGbR/5wtqQ8YW0FTrKTOdJUE
   w==;
X-CSE-ConnectionGUID: Pk7UltGvRjCJ3DdkpOvDGA==
X-CSE-MsgGUID: kujJMidFSbaPlQCgxO0JnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="205964495"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="205964495"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4374CD8E65
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E7908D50B0
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:51 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35EC71A0078;
	Mon, 16 Jun 2025 17:16:51 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/24] lttng-modules: upgrade 2.13.18 -> 2.13.19
Date: Mon, 16 Jun 2025 17:16:28 +0800
Message-ID: <20250616091643.918-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218784

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix missing override when CONFIG_COMPAT_OLD_SIGACTION is not defined
* fix: writeback: 'balance_dirty_pages' Respect 'CONFIG_CGROUP_WRITEBACK'
* Fix: scsi: RESERVE and RELEASE renamed in Linux v6.15-rc1
* Fix: del_timer[_sync] deleted in linux v6.15-rc1
* Fix: Use 'nonseekable_open' for proc files
* Fix: trace_balance_dirty_pages in Linux v6.14.2
* fix: version constraint for building lttng-probe-9p

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{lttng-modules_2.13.18.bb => lttng-modules_2.13.19.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.18.bb => lttng-modules_2.13.19.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
index 1b2327f609..63ba488515 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.18.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.19.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
 
-SRC_URI[sha256sum] = "a2f38e289817dbd1d2f12cfc1f20390230e16d56323cb58cc1db9874ced400ed"
+SRC_URI[sha256sum] = "06d704633749039f8fa72a954bec6486058386e2a0c3557b22c484698f9b34d5"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.43.0


