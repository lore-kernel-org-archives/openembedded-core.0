Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD79C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:31 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=dKjgiGoY;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056891; x=1677592891;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GaMoE5/FJriuX2f9Ea6xUcYOPZY5XLZteakdzAxFJIA=;
  b=dKjgiGoYFMpcXPmasYwA0TsOHJudWWw0XiMxUQtLXH0h97TFP70MNs5O
   XbfgwC6rM4/yq/F4m2fcVqBHdIa2oLEioEKW/YALYrLun6+M5AQ8KgKpw
   QgluEMpKqepAHavKo4TqH4rhiM5xcnzLOseaabYjUxyjcQElzwgqW811N
   hniZIJZXClUasFI65XUjKa7cDJqEhTuI//kxTarDKM15tyDJG8YOkE2qv
   K9XjyJ3n55E81XbxJYBQFJF9+kiqO0XHXx8xi3NuiujXI2jZHjHdrSsUn
   NVH2oa7BAIefCG1LTe8bqHz8lX2PNEzYBenNu0EuQCqWUXrWlnXtWY15X
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857360"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857360"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092733"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 30/39] vim: Upgrade 4269 -> 4134
Date: Mon, 28 Feb 2022 22:00:20 +0800
Message-Id: 
 <140247e499b85ef2d5c48f9723ed2e2ec9108fb1.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162486

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License text underwent changes on how to submit Uganda donations, switch from http
to https urls and an update date change but the license itself is unchanged.

Also, add an entry for the top level license file. This is also the vim license
so LICENSE is unchanged but we should monitor it too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d195005e415b0b2d7c8b0b65c0aef888d4d6fc8e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index e2907c1f43..26310ed591 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,8 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS_${PN} = "diffutils"
 
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=909f1394892b7e0f9c2a95306c0c552b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
+                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -20,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
 "
 
-PV .= ".4269"
-SRCREV = "48a604845e33399893d6bf293e71bcd2a412800d"
+PV .= ".4314"
+SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


