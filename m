Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9D6F77198
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:12:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2016 04:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,489,1464678000"; d="scan'208";a="745739141"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Aug 2016 04:12:12 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D187C6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 04:11:57 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 14:13:07 +0300
Message-Id: <1470654788-8717-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
References: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] hdparm: update LICENSE info
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Aug 2016 11:12:12 -0000

Update hdparm recipe so that LICENSE_wiper is specified in the LICENSE.

[YOCTO #10074]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/hdparm/hdparm_9.48.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.48.bb b/meta/recipes-extended/hdparm/hdparm_9.48.bb
index ec3d26f..86faf6a 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.48.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.48.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
-LICENSE = "BSD"
+LICENSE = "BSD & GPLv2"
 LICENSE_wiper = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://debian/copyright;md5=a82d7ba3ade9e8ec902749db98c592f3 \
-- 
2.4.0


