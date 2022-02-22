Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD86C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:59 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.13741.1645542537762329827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fUFFwU73;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542538; x=1677078538;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JX2uJu4Ltp2hH2tkvGWLLSRBD9B3V7kR8RgNE5Zzo3Q=;
  b=fUFFwU733FGrOIQANq1+0D8mJBnm/MSLekekJP2ChuM2V9+Ck/Dh2P0+
   Y+rLN9cskP/DDOIDc3vqenaQfcL/ihP3hdhKoL37NAWbaNdRrgUdco742
   nQlJ7xb7Y8AKqHRywNYwZlD5y5cwlhvM8W/q69NxX9e6Gs6Si8y8SyeFJ
   EzEqba9sogv0dqnifYNQlJ74zHOlRl3cvQVGlGTHoD0YbKFau1o4aAcEJ
   0OUJFTWS0qZJMVTbxQw6PsahQ4I2rA/gWHY5p+qdwIz4J0CZkEn+DRM66
   7EeWfz/BTsS0k7GXQIbNi2AUPB9QHS9ZVLvLyeoVkJfCSoG/iDJ2cUUCR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305375"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305375"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:44 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258894"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:43 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 38/38] uninative: Upgrade to 3.5
Date: Tue, 22 Feb 2022 23:07:39 +0800
Message-Id: 
 <eeae63c343c8ebd418679915ee20aa8c02fa0fdc.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162174

From: Michael Halstead <mhalstead@linuxfoundation.org>

Add support for glibc 2.35.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 347b8c87fb4e2c398644f900728cf6e22ba4516d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 6833072cd3..bfe05ce1eb 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.34"
-UNINATIVE_VERSION = "3.4"
+UNINATIVE_MAXGLIBCVERSION = "2.35"
+UNINATIVE_VERSION = "3.5"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3013cdda8f0dc6639ce1c80f33eabce66f06b890bd5b58739a6d7a92a0bb7100"
-UNINATIVE_CHECKSUM[i686] ?= "abed500de584aad63ec237546db20cdd0c69d8870a6f8e94ac31721ace64b376"
-UNINATIVE_CHECKSUM[x86_64] ?= "126f4f7f6f21084ee140dac3eb4c536b963837826b7c38599db0b512c3377ba2"
+UNINATIVE_CHECKSUM[aarch64] ?= "6de0771bd21e0fcb5e80388e5b561a8023b24083bcbf46e056a089982aff75d7"
+UNINATIVE_CHECKSUM[i686] ?= "8c8745becbfa1c341bae839c7eab56ddf17ce36c303bcd73d3b2f2f788b631c2"
+UNINATIVE_CHECKSUM[x86_64] ?= "e8047a5748e6f266165da141eb6d08b23674f30e477b0e5505b6403d50fbc4b2"
-- 
2.35.1


