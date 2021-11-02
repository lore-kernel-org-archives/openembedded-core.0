Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF66C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:24 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.515.1635871643329618021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509767"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509767"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575224"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:44 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 17/24] tzdata: upgrade 2021a -> 2021d
Date: Wed,  3 Nov 2021 00:44:05 +0800
Message-Id: 
 <38da21f954899bb1a0dd05be87c8794d12b96b5a.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157803

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f171f4f528090fc108624de6049274aa4d4880eb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/timezone/timezone.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index c7d4965cb8..6221ff9c60 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021a"
+PV = "2021d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "eb46bfa124b5b6bd13d61a609bfde8351bd192894708d33aa06e5c1e255802d0"
-SRC_URI[tzdata.sha256sum] = "39e7d2ba08c68cbaefc8de3227aab0dec2521be8042cf56855f7dc3a9fb14e08"
+SRC_URI[tzcode.sha256sum] = "ed0d02be79b54f4449ba1f239aeaf9315da490bf32f401d302dcbba4921f591d"
+SRC_URI[tzdata.sha256sum] = "d7c188a2b33d4a3c25ee4a9fdc68c1ff462bfdb302cf41343d84ca5942dbddf6"
+
-- 
2.31.1


