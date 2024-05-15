Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B15C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 06:00:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by mx.groups.io with SMTP id smtpd.web11.7758.1715752795600241773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 22:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=BCIp9E3Z;
 spf=pass (domain: intel.com, ip: 192.198.163.19, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715752796; x=1747288796;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nC5PrJ5yRI8jHBSUqa9ssldk9JEZMAgYvi2X9qfzacw=;
  b=BCIp9E3ZCH9ixVIiBhOcdbMGfpLVB4nF2fW/NQUf6KxXUKFjfrfyH0OJ
   QMCLA3nMUMBkgCR23OasdDsimCN4m3gruTwvEvR8AMuLPEhVBCsM4Q5ea
   EcRhK9MjCElzNtxsmyoYy30mH7xtsO3ycLZZAWTWMU2Jo9b+/T+H720Ic
   ssLsDi6Oeb1XlWPCpIlTUk0ZIV4hGtBNdWdwHSYtfBToq2qyXQgOevOFl
   XXkrhHtPF7OAi6xGIaXjTso2ID6sxT/9xxlXskzwmVyTagfDLIxUFup+v
   XnmluDJkjcd29uCFW/D3vpWa8FrRzvy4Jx5cp0D+stzVYh84iD95NO1r4
   Q==;
X-CSE-ConnectionGUID: kxxOQUy6QGiTbUqv84kzYQ==
X-CSE-MsgGUID: z1aZ67c4Tf2XWkgF8VryVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="11636041"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="11636041"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 22:59:56 -0700
X-CSE-ConnectionGUID: yP1N2pPFQcyYZ5N0Id5oew==
X-CSE-MsgGUID: bXcjwooPSG6R+v08drgWDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="62111544"
Received: from andromeda02.png.intel.com (HELO andromeda02..) ([10.107.234.73])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2024 22:59:54 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gstreamer1.0-plugins-bad: rename onevpl-intel-gpu -> vpl-gpu-rt
Date: Wed, 15 May 2024 13:22:58 +0800
Message-Id: <20240515052258.2237250-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 06:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199271

Upstream has been renamed to vpl-gpu-rt.

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
index 523ee7a5ae..49a3a79b2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.11.bb
@@ -60,7 +60,7 @@ PACKAGECONFIG[libde265]        = "-Dlibde265=enabled,-Dlibde265=disabled,libde26
 PACKAGECONFIG[libssh2]         = "-Dcurl-ssh2=enabled,-Dcurl-ssh2=disabled,libssh2"
 PACKAGECONFIG[lcms2]           = "-Dcolormanagement=enabled,-Dcolormanagement=disabled,lcms"
 PACKAGECONFIG[modplug]         = "-Dmodplug=enabled,-Dmodplug=disabled,libmodplug"
-PACKAGECONFIG[msdk]            = "-Dmsdk=enabled -Dmfx_api=oneVPL,-Dmsdk=disabled,onevpl-intel-gpu"
+PACKAGECONFIG[msdk]            = "-Dmsdk=enabled -Dmfx_api=oneVPL,-Dmsdk=disabled,vpl-gpu-rt"
 PACKAGECONFIG[neon]            = "-Dneon=enabled,-Dneon=disabled,neon"
 PACKAGECONFIG[openal]          = "-Dopenal=enabled,-Dopenal=disabled,openal-soft"
 PACKAGECONFIG[opencv]          = "-Dopencv=enabled,-Dopencv=disabled,opencv"
-- 
2.37.3


