Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F036C43217
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:48:00 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=EOCxFxnG;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734476; x=1680270476;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=arPoQZVGjjeahsNogalWJQXIebnH8tNy8KDG+0ixTiI=;
  b=EOCxFxnG1bTbikppN97hxcSM5fLAsLT0aamXX9oPcuouV20RGkvrwziG
   Ftb66PPMi4f/yAiqOdW7vucsl+GTyQQi74LBG8zH5MA9EJ/u6FxLs9OT/
   xk9l7f6dCffiIYdDpuswtmcLwaKz6IOYJrk5JjFW2acbYt8vcPC2oh7KT
   muqtfJGFEDkOnJVyjjFMMvF7LPfW8SSZZpKTWaUrrQdZyEA+o+VO6Zg1E
   preqWFfhlSSL3qE8lWPU0C2x1UPoxAuVahQu59zpRH9ITchEahrJB/TqX
   p6N0celgF6cnw+QL11P+9I1cuHTyYvSN6htnPj4jzfSqL1auGoXCMODZD
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551815"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551815"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542188"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:44 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/20] mobile-broadband-provider-info: upgrade
 20210805 -> 20220315
Date: Thu, 31 Mar 2022 21:47:15 +0800
Message-Id: 
 <c6eed3f0d1da93c00ad90319fae6aa5eaa84ebfe.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:48:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163825

From: Changhyeok Bae <changhyeok.bae@gmail.com>

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed02ee8f20094f598448d58875cb7be8a24a019f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mobile-broadband-provider-info_git.bb                  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 4246f4dcbd..781b9216c5 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,11 +4,12 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
-PV = "20210805"
+
+SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
+PV = "20220315"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.35.1


