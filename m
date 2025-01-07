Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8BFE77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.16403.1736240493843127112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E/zfajlf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240493; x=1767776493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eGafpQBS3G/di/7IWvbDN/xsru7JQ2HSFJo1v/kYrDk=;
  b=E/zfajlf5rz+P/5weSfDqOmuCJRAbaJ1+tUI8lNX4wdbN6kZgwBTQB7e
   iL9Y8B5nrSTUxQfU5Y3axL/Q4MweFuB8ITXCkTza3Cp+PAspbd3LpZ9Rv
   UtXvDdW4P48hnqvraT85q3kIPnbMzSivIC00lbUqyr9KcSkeeQwfHdHv7
   STh6X1rmzmh3YJcwVXj33XZxNca49rm4q8LQXQyd7cnmCFC73lez9iAoC
   xkr8CT0djMn2351o5wzQw4OmO6YpNcSdxa8E5NangdROXxmXNY34YaykF
   EQOIqEk2qb8Apcsd5uq0qmT64lnNvEXTxmVxy+r+6MfbnSRz/G1LrK9gg
   A==;
X-CSE-ConnectionGUID: 278EHkSNTWWdUBTxrgwxAQ==
X-CSE-MsgGUID: xqPbt3EjSQaXJnFZjZm6pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="186036785"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="186036785"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:31 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E0B9D4C3C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 162F5D729C
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47E83E293A
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0257E1A0003;
	Tue,  7 Jan 2025 17:01:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/13] gtk4: upgrade 4.16.7 -> 4.16.12
Date: Tue,  7 Jan 2025 17:01:11 +0800
Message-Id: <1736240482-5243-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.762600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv1xrH5kKK/rgC7
	AZSleJMNgivRl3nzvEq+IvTA2rrfZorU8GWDEDNh8t4fUUGeErSd2Wz0X3OaLQfxTM57BPHDvwU
	evDt+uW5/XjpbSJS7awxWLqpNcz/LHsYi+P4ETTVIcJTn2HkqseOaAxDXuHnraqyaaDwtKHyjxY
	yRBa/qJXcsDK2xBHh7BLPx9cDMrKatIWznhjjBtfoLR4+zsDTtlu/VKvCjKPW5FBoRO5q5dGmge
	90bagaKaHRKj4vJtQS4eBieWlc0Ri8EBNLJfaLevgGPuNUn/UfQ0ox6sgxGiLJ2gz6/465cdDqC
	nJfr5tLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209435

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* GtkFileChooser:
 - Fix a focus problem with the server entry

* GtkEmojiChooser:
 - Update to CLDR 46 / Unicode 16

* GtkAboutDialog:
 - Small improvements

* Wayland:
 - Fix some Vulkan sizing corner cases
 - Fix problems with rotated, offloaded images
 - Fix a few crashes

* Demos:
 - Don't create extra windows for D-Bus activation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-gnome/gtk+/{gtk4_4.16.7.bb => gtk4_4.16.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.16.7.bb => gtk4_4.16.12.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.16.7.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
index 2631c148e6..d8d37a526d 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.16.7.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.12.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5303c7624e15a48880591b9ddd43389afba3de4fb92a219719519bb1642ce3dc"
+SRC_URI[sha256sum] = "ef31bdbd6f082c4401634a20c850b0050c9bf252ef1e079764ee95a2a0c4c95a"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.43.0


