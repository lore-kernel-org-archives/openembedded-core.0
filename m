Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CEBC4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:39 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web09.13272.1635347858842345655
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456871"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456871"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:37 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617248"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 29/36] uninative: Upgrade to 3.3,
 support glibc 2.34
Date: Wed, 27 Oct 2021 23:16:37 +0800
Message-Id: 
 <8759cc146661bd8d06ab0e8b4168b1d9e6bd16c2.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157544

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4aa4dcd5f31657073f2207a9a4a43247322c7eb1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 740cca0ecf..76f4cff565 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,9 +6,9 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.33"
+UNINATIVE_MAXGLIBCVERSION = "2.34"
 
-UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.2/"
-UNINATIVE_CHECKSUM[aarch64] ?= "4f0872cdca2775b637a8a99815ca5c8dd42146abe903a24a50ee0448358c764b"
-UNINATIVE_CHECKSUM[i686] ?= "e2eeab92e67263db37d9bb6d4c58579abd1f47ff4cded3171bde572fece124b2"
-UNINATIVE_CHECKSUM[x86_64] ?= "3ee8c7d55e2d4c7ae3887cddb97219f97b94efddfeee2e24923c0cb0e8ce84c6"
+UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/3.3/"
+UNINATIVE_CHECKSUM[aarch64] ?= "372d31264ea7ab8e08e0a9662f003b53e99b3813cc2d9f9a4cc5c2949a1de00b"
+UNINATIVE_CHECKSUM[i686] ?= "36436167eba8a5957a0bf9a32402dd1be8b69528c1ff25e711e6895b583b2b42"
+UNINATIVE_CHECKSUM[x86_64] ?= "92b5e465f74d7e195e0b60fe4146f0f1475fff87ab2649bf2d57a1526ef58aec"
-- 
2.31.1


