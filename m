Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFF6C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:40:37 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.30466.1647870036256317774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=g8dydB4i;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647870036; x=1679406036;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W6OYDBK1vBfFPJ+NTJrn6k9AqloZAQ6ZU8jEzBiAxcw=;
  b=g8dydB4i0qdRXm0m1f/QPzvUUgZjSF6uyuGAQeNNZ7yt2jtbimWBr+K2
   pb3DEvJPUsR8SXRv8EADZv+DNpDokO53O3gVpQbuTZqlFxTodMXDKwFXL
   O89sn0LTA1qTJHlRAJIZ4slRgrI6zz7Z6a4vHiAUPklWWKJ7qjIEnqyn4
   2Sp7P7L54DVsVFrr6+kOmyePSePeKGBSImWPg5EfEQ+aDX5+/Il7Wy87w
   2QLDb2kiygdowHLbx9sd53Idu2b+S8H+2g3Ixb7iXQ+aaigt9ocbxhTUy
   43xYWj/V3sOPkPyPWvA6mL0h4Cdx9+B7s6ZhOCnfT2E86cjLygzDpLSxm
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="239711173"
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="239711173"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,198,1643702400";
   d="scan'208";a="648567804"
Received: from ttan5-mobl2.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.237.38])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2022 06:40:33 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 0/3] Patch review
Date: Mon, 21 Mar 2022 21:40:23 +0800
Message-Id: <cover.1647869680.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:40:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163503

Final set of changes before 3.4.3. Please review.

No problems seen while testing on the autobuilder.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3396

Thanks,

Anuj 

The following changes since commit 427f4ef11beb8ceee007b5c7e152f2383a114aca:

  patch.py: Prevent git repo reinitialization (2022-03-11 10:55:24 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/honister

Chee Yang Lee (2):
  ghostscript: fix CVE-2021-3781
  go: update to 1.16.15

Sakib Sajal (1):
  go: upgrade 1.16.13 -> 1.16.14

 .../go/{go-1.16.13.inc => go-1.16.15.inc}     |   4 +-
 ...1.16.13.bb => go-binary-native_1.16.15.bb} |   4 +-
 ....16.13.bb => go-cross-canadian_1.16.15.bb} |   0
 ...o-cross_1.16.13.bb => go-cross_1.16.15.bb} |   0
 ...ssdk_1.16.13.bb => go-crosssdk_1.16.15.bb} |   0
 ...native_1.16.13.bb => go-native_1.16.15.bb} |   0
 ...ntime_1.16.13.bb => go-runtime_1.16.15.bb} |   0
 .../go/{go_1.16.13.bb => go_1.16.15.bb}       |   0
 .../ghostscript/CVE-2021-3781.patch           | 236 ++++++++++++++++++
 .../ghostscript/ghostscript_9.54.0.bb         |   1 +
 10 files changed, 241 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/go/{go-1.16.13.inc => go-1.16.15.inc} (90%)
 rename meta/recipes-devtools/go/{go-binary-native_1.16.13.bb => go-binary-native_1.16.15.bb} (83%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.16.13.bb => go-cross-canadian_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.16.13.bb => go-cross_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.16.13.bb => go-crosssdk_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.16.13.bb => go-native_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.16.13.bb => go-runtime_1.16.15.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.16.13.bb => go_1.16.15.bb} (100%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781.patch

-- 
2.35.1


