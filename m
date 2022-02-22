Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D2CC433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:29 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13721.1645542507811489137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=aszw/gAM;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542508; x=1677078508;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=8bHhKp7/PQVTwyJYfFOlTTSrbhh6+Lcw3ytj9bb5um4=;
  b=aszw/gAM0GJvQhcihJuMUwe8D7VfBbpyBj3bouzfMwaU/4D8bpJORU7W
   CeRQzIcafLGVe/Mg/VxCKxdDwuq0H3SmDwRawhFwqsegJe5Gx6Gd4jGGh
   NmAiLQV2sfKC0t9qrhqD+Wwg1ollQ1dSeULTzhMWLZXc+3FiLKFjRp41g
   GEbwlpnXh2vk9kkFxmz9DSqHHaDjiJ3B0DWR1QpZeX/di23eS03PNHZ2R
   eEmP0Bjz/sF1H+OtqeMHyVTnCwhtmhOu3PABWrnX0eJK7k9kfCHa13UeH
   oAWK423w3U9xRFWztb7br1HJsNOfrVAQ76nM7U9aZ3PhZLbH1TFWTtirt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305054"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305054"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:06 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258561"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:05 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/38] gstreamer1.0-python: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:11 +0800
Message-Id: 
 <76ebf1013e8352f3b0bd716cd6a0852c9628f8e4.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162145

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...reamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.18.5.bb => gstreamer1.0-python_1.18.6.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
index 74dd15b3eb..c80c3928eb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.18.6.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "533685871305959d6db89507f3b3aa6c765c2f2b0dacdc32c5a6543e72e5bc52"
+SRC_URI[sha256sum] = "bdc0ea22fbd7335ad9decc151561aacc53c51206a9735b81eac700ce5b0bbd4a"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.35.1


