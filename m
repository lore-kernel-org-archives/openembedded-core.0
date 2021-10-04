Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA35C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 18:25:53 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.13948.1633371950707198621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 11:25:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="311744792"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="311744792"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200";
   d="scan'208";a="483208833"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.128.172])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 09:51:04 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/11] bind: Exclude CVE-2019-6470 from cve-check
Date: Tue,  5 Oct 2021 00:50:47 +0800
Message-Id: 
 <09898a99b42e048e7085a3df4504e887811b2349.1633366030.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 18:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156624

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
so the issue doesn't affect us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30106ae676124ba3c0e496a4f19c919c8418b59b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/bind/bind_9.16.16.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/bind/bind_9.16.16.bb b/meta/recipes-connectivity/bind/bind_9.16.16.bb
index 27aa6221ba..b152598402 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.16.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.16.bb
@@ -26,6 +26,10 @@ UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
 UPSTREAM_CHECK_REGEX = "(?P<pver>9.(16|20|24|28)(\.\d+)+(-P\d+)*)/"
 
+# Issue only affects dhcpd with recent bind versions. We don't ship dhcpd anymore
+# so the issue doesn't affect us.
+CVE_CHECK_WHITELIST += "CVE-2019-6470"
+
 inherit autotools update-rc.d systemd useradd pkgconfig multilib_header update-alternatives
 
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
-- 
2.31.1


