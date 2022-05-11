Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A04C43217
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.6472.1652237865005143057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ipotj4J7;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237865; x=1683773865;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=k3VmbTa1fkHUznUSmSsmgD1Nkunb0PPsS7wFNqkDfYA=;
  b=ipotj4J7rZWprIaEX62e+AmqOYchhEmRM4cemlfZPVrENkID3hlA3LQG
   CIlkpZj7N9oWwZoLee6SUiW2S0Xs7aSfUChwfrPAgg/lH/Mzp10yk0o55
   1ItJErQHJVDqGBbmJupkKgGrZXvtl/OUtJXybTWDgStFdW0lDOOJubwd2
   eD8tN6inJjTOUIALsHLAYktfm+hIZEBqLXs6bNXd7TbRP7L9shhs3wfdp
   ZD6llzQOvWwJaS5Qz9kl+PxwY5a98h7C9Rj4RbPIV6kjXQQtMSn9v3ewq
   6XgoMIVLzwleDKHfA0dRrQgJY2CfKxCLDXq93jLV1RaZPaVR1T144yI+3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257105993"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257105993"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:43 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754697"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:41 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/17] neard: Switch SRC_URI to git repo
Date: Wed, 11 May 2022 10:57:18 +0800
Message-Id: 
 <1095841ef77bce46bcd7c6db28a376372cb12c50.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165471

From: Rahul Kumar <rahul.kumar_3@philips.com>

The tarball (neard-0.16.tar.xz) fetched by the recipe is incomplete.
Few plugins (e.g. tizen) and tests scripts (e.g. Test-channel, test-see,
neard-ui.py, ndef-agent etc) are missing.

Since neard did not release latest tarballs, so as per community
recommendation switching the recipe SRC_URI to git repo.

Community Discussion:
https://lists.openembedded.org/g/openembedded-core/topic/90058043#163681

Signed-off-by: Rahul Kumar <rahul.kumar_3@philips.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b563f40ebf4461d9c35df72bd7599ea11e97da9c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/neard/neard_0.16.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-connectivity/neard/neard_0.16.bb b/meta/recipes-connectivity/neard/neard_0.16.bb
index b6cc1d6ced..936b3c5754 100644
--- a/meta/recipes-connectivity/neard/neard_0.16.bb
+++ b/meta/recipes-connectivity/neard/neard_0.16.bb
@@ -2,21 +2,22 @@ SUMMARY = "Linux NFC daemon"
 DESCRIPTION = "A daemon for the Linux Near Field Communication stack"
 HOMEPAGE = "http://01.org/linux-nfc"
 LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
+                    file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
+                   "
 
 DEPENDS = "dbus glib-2.0 libnl"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
+SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=git;branch=master \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
            file://Makefile.am-do-not-ship-version.h.patch \
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
-SRC_URI[md5sum] = "5c691fb7872856dc0d909c298bc8cb41"
-SRC_URI[sha256sum] = "eae3b11c541a988ec11ca94b7deab01080cd5b58cfef3ced6ceac9b6e6e65b36"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
- file://src/near.h;beginline=1;endline=20;md5=358e4deefef251a4761e1ffacc965d13 \
- "
+SRCREV = "949795024f7625420e93e288c56e194cb9a3e74a"
+
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.35.3


