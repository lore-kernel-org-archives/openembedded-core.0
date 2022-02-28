Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3266C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:54 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=BsIJBBkO;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056913; x=1677592913;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Wko3S6tygNbbfz39Hgs7HR7iHOvdyst9eR7gwwIxPY0=;
  b=BsIJBBkO0haT5cHVBp4P7AD7bVmoxPfMuHepKTBJFUR44UvI6KHRDOA5
   0YKBJqLGqzf86ITFN4063UH3WKXogHFpd1MoKrMpvOK47QebQNoI+w48w
   45JN2mVN5KeDY5qiA3oB/KVPQajoO5MJVTqEfA3mSztdUOUzsJUADyxp4
   X3UsqkjdBaPakkdXJreaiBHxecuNHwdArOJELveTlWBHtQfbA/ucLNiJ8
   LSy/VSWcvsiD9R+i2Yh9BXntF3Z4v2LWmYA2Li9+Kw5jcrvb18P0o7Oac
   Yb1yd1CePHGbkvJHa6LA7lUIdl3VwXXQmrIWXpedZtH3enN2MBlnDKHKH
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857510"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857510"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:35 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092855"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:34 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 38/39] ccache: upgrade 4.2 -> 4.2.1
Date: Mon, 28 Feb 2022 22:00:28 +0800
Message-Id: 
 <f153f42c910c06dd8e812fa9c803964c60e6cfcc.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162494

From: wangmy <wangmy@fujitsu.com>

License-Update: add license information of src/third_party/win32/winerror_to_errno.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 12f0aa9533edc7ac5a65b1c165797b049349b19e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ccache/{ccache_4.2.bb => ccache_4.2.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_4.2.bb => ccache_4.2.1.bb} (82%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.2.bb b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
similarity index 82%
rename from meta/recipes-devtools/ccache/ccache_4.2.bb
rename to meta/recipes-devtools/ccache/ccache_4.2.1.bb
index b76bf043f0..99bbe0eca2 100644
--- a/meta/recipes-devtools/ccache/ccache_4.2.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.2.1.bb
@@ -7,14 +7,14 @@ HOMEPAGE = "http://ccache.samba.org"
 SECTION = "devel"
 
 LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=28afb89f649f309e7ac1aab554564637"
+LIC_FILES_CHKSUM = "file://LICENSE.adoc;md5=698a26b57e513d678e1e7727bf56395b"
 
 DEPENDS = "zstd"
 
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz"
 SRC_URI += "file://0001-CMake-make-build-of-documentation-optional-842.patch"
 
-SRC_URI[sha256sum] = "dbf139ff32031b54cb47f2d7983269f328df14b5a427882f89f7721e5c411b7e"
+SRC_URI[sha256sum] = "320d2b17d2f76393e5d4bb28c8dee5ca783248e9cd23dff0654694d60f8a4b62"
 
 UPSTREAM_CHECK_URI = "https://github.com/ccache/ccache/releases/"
 
-- 
2.35.1


