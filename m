Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12A4C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=CjecnqYB;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056909; x=1677592909;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7sLacLO7wrouEj6BuTtMCkIVxUGKoQQw7OFMXssKfqQ=;
  b=CjecnqYBNwQFfkdlqOMuVHM3cG9klL/vbnkD0zvxD6xfnwmoLfZUdErG
   LRTmp9eA3Ls9CaHRBAxATLl8DSFIeZMWG2kkxGyc93+zCGOKepRS3Uxgr
   5GZqEv62PhP2TOEpcapn7ARWOVyepunmgvQKm7iZuNUZWsFgKWuQWYHyn
   vKYuOo85MKMlbPC3QWsT9WDlsZpmKniY4V6g1DCkxlBBRKhtP3u80e/0y
   EkxZdKzii4wplL8CgX41y+BGqc5XTSfv9W02+gxS4MdFh9nhLuM6l8/Gp
   rKmHKok4KArQvQi1a3kLcMX2N4qvFnznsK28TnWTuWw8OFfyI6Lwp5sxp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857484"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857484"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:33 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092819"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 36/39] libarchive : update to 3.5.3
Date: Mon, 28 Feb 2022 22:00:26 +0800
Message-Id: 
 <143db8bc1a0837b4a266cdfbb64a025918398f2c.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162492

From: Lee Chee Yang <chee.yang.lee@intel.com>

Libarchive 3.5.3 is a security release

Security Fixes:

extended fix for following symlinks when processing the fixup list (#1566, #1617, CVE-2021-31566)
fix invalid memory access and out of bounds read in RAR5 reader (#1491, #1492, #1493, CVE-2021-36976)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.5.2.bb => libarchive_3.5.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.5.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.5.3.bb
index 1cd6397f2d..92bb223784 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.5.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.5.3.bb
@@ -34,7 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "5f245bd5176bc5f67428eb0aa497e09979264a153a074d35416521a5b8e86189"
+SRC_URI[sha256sum] = "72788e5f58d16febddfa262a5215e05fc9c79f2670f641ac039e6df44330ef51"
 
 inherit autotools update-alternatives pkgconfig
 
-- 
2.35.1


