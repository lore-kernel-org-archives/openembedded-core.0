Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56458C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:28 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web11.1369.1637547626744952510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122179"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122179"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:26 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428767"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/16] mirrors: Add uninative mirror on kernel.org
Date: Mon, 22 Nov 2021 10:20:05 +0800
Message-Id: 
 <e716c371992ea567171fb7f7bb8691ec92dfc71b.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158537

From: Richard Purdie <richard.purdie@linuxfoundation.org>

At the last nas outage, we realised that we don't have good mirrors of the
uninative tarball if our main system can't be accessed. kernel.org mirrors
some Yocto Project data so we've ensured uninative is there. Add the appropriate
mirror url to make use of that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1833cb0c5841afafb468b963b74b63366b09a134)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 87bba41472..9d0ae1dce4 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -62,6 +62,7 @@ ftp://.*/.*     http://sources.openembedded.org/ \n \
 npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
+https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.33.1


