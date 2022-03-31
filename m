Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088E1C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 13:47:55 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web12.7266.1648734472624914593
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 06:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=HE3Yz0X5;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648734474; x=1680270474;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vck/I39kmQ+8Kr2SartKa8Zqnv7vskLDytdn/Ce/gFw=;
  b=HE3Yz0X5g8T/m6t0GGv8lrcO3aytv/dxztf8k+z3297dw2n/rcl8P3H0
   ZsKaoZ4pX6Ntx3EH6bZ5xwCbVtscc2iZPKwGhJZw2iA66d0dOWj96iiEq
   uSGS2uMi+ZGY9dpmkAPYeRNOVkirpEP6ysVfhcBa+S1c1C1BQas0Uevp1
   o34G51wUWMo9w4Joe02NKGk91/uku6IYw1gXgPoBV4m4Oo+GOruLW7io7
   hmNkLLdKT79BgXvcjp/gLLmz2Gc5cFFh3RbD/dBLXQtgYO2he2UqY9L0g
   k+xibI4n4FgX0s+JkVd2/+DbbgAtj8NOjLezyL4SlMmVYV2aAp8yPaZvy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="259551812"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="259551812"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:44 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400";
   d="scan'208";a="520542178"
Received: from scho7-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.39])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 06:47:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/20] mobile-broadband-provider-info: upgrade
 20201225 -> 20210805
Date: Thu, 31 Mar 2022 21:47:14 +0800
Message-Id: 
 <1e7b6049b7f67cbeb36d6f5ec7822cd72a4d4a53.1648734169.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648734169.git.anuj.mittal@intel.com>
References: <cover.1648734169.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 13:47:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163822

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 93a335993ce592a8ee34fc9a490e327f2775e03f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index b4cbc1a76c..4246f4dcbd 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,8 +4,8 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "90f3fe28aa25135b7e4a54a7816388913bfd4a2a"
-PV = "20201225"
+SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
+PV = "20210805"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
-- 
2.35.1


