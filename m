Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBA8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13723.1645542509609922511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RQHBY+1A;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542517; x=1677078517;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qO55rcTfQlbeMGLuwg9zSBaQuZy+3E+2bdYiQ6gnVgg=;
  b=RQHBY+1AU+LBSb5f6Dul3wdpAKtQ2Dv36QCXqXxZE6hQfZWIXHoMFe3b
   9aWjKFOfjBo47T/xhJ8XJTB0EE7SzZE6K82JL6hQrK++TIzQSq8KjUp/s
   OADcZDdN+nyTVGSZDCJMEGQNrNIO/BV2vKq/9hKn5wCqRbjxMP2bOIvqr
   3rNJCc5+BBDnPKkY5wjSjsdeMPoHJiBMApicR2OeWqAtaujiQRcrCZCA+
   kJBB71DMu22t2X8q3E7JnkF4ueZyDgQHmrsKUT/Rx4gG2YY6zsxgdawao
   EHwn4AzsBLPwDAvQaThOy2yaM6N1OGmG0oFpHMrifv48s/Agj/PxihJ60
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305136"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305136"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258670"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 19/38] vim: Upgrade 4269 -> 4134
Date: Tue, 22 Feb 2022 23:07:20 +0800
Message-Id: 
 <d5207a762648a3b12d16b6f79a751dec90180354.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162155

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
index 6c70bb7529..8044500d6b 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -10,7 +10,8 @@ DEPENDS = "ncurses gettext-native"
 RSUGGESTS:${PN} = "diffutils"
 
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


