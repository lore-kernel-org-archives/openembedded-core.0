Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391DAC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:22 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web08.13718.1645542500521443056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=cwIme8As;
 spf=pass (domain: intel.com, ip: 134.134.136.100,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542500; x=1677078500;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mwMyiYtx25eDAWMf94ZhWppDa2VktfmNg0EAGKU6t3U=;
  b=cwIme8As6D771wZDSC5iRRTq2dWV3PYrAJ+kfl340Vt6G3n9Xsff7b0a
   EfQ+KrDcRSWk8pU/VbD7r52s5qj402S5Od7yIMZ8b0UHosXlFuF7Zo3K2
   F8XlUY+Ax8OoMzT11ZzZDSo0RNa83LhIhriTmrrS5eNxsOXGPuT9WzQbG
   4b+oPJpoFq4Al9+WKuCxbgRFYZBoAc3O40RC2YXg6hhxeDlaOFX8OPfUF
   J9Ce0fzlAX/M77Cxg6IZqo6FPKvI2OpEzm7PxpnJTO1WpnJRBP3T8xbL8
   ayha7knJBApPz66I/RNaF3TEiPnRKf9SLdcGPTtJ6rwn/VoVAjfD61V/8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="314960811"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="314960811"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258494"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:07:58 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 04/38] gstreamer1.0-plugins-bad: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:05 +0800
Message-Id: 
 <808e0c7f81293414127b95d5cab2093353a03526.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162140

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.5.bb => gstreamer1.0-plugins-bad_1.18.6.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
index 6209a62712..df148c0aff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.6.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a1086870e9ca45ad678e"
+SRC_URI[sha256sum] = "0b1b50ac6311f0c510248b6cd64d6d3c94369344828baa602db85ded5bc70ec9"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.35.1


