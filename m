Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A31C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13721.1645542507811489137
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=TTd8weIf;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542507; x=1677078507;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NHg9PnFBQGY6fTq4iZFOsRiVk8A0mO5FE6aKkptJZWo=;
  b=TTd8weIf1OAlG995TI4KGNnGc4XDfGLcN1IoAq7cr60y83SXdb6Hl3R1
   W1BsCQuYu6LfxYdjaVlNkzGj0NSlFTUjZP7iQXnDj26X+u0HRr6C9lvoh
   plkGSQLZMPj213VILZTPdeZ5VbvPBjWpGx3F0ii7EsBz31CAqq57TxXRv
   08MBM8O44mpXz4+w9lOBn7KOJKxe0KeCG1ZWJHJJNGfFVhKffpeamo/ms
   Rz3tb/1pBAJvFyCUwxCgGCYoROzbqOJUfzUBtXX4hKTueaRAmfflFjpYw
   BAJb9gXo5wVbxXEjn4eKnxe6P2UCUHg9XfL1w+0ZhHdApeUWG5p3UTF30
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305048"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305048"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258549"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:04 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/38] gstreamer1.0-rtsp-server: 1.18.5 -> 1.18.6
Date: Tue, 22 Feb 2022 23:07:10 +0800
Message-Id: 
 <af5fd915c9222d82009bc9445cea883f3a112dd8.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162144

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.18.5.bb => gstreamer1.0-rtsp-server_1.18.6.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
index 50426ad46d..f105713f33 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.18.6.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "04d63bf48816c6f41c73f6de0f912a7cef0aab39c44162a7bcece1923dfc9d1f"
+SRC_URI[sha256sum] = "826f32afbcf94b823541efcac4a0dacdb62f6145ef58f363095749f440262be9"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.35.1


