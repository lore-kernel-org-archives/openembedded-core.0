Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E31C61D92
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:35:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=A7FdOl2l;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530497; x=1732066497;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lgS3u6SXlCUKXJsoIK+xSLvTmnBdU7/QrwGhArvq+bs=;
  b=A7FdOl2luMVAfRC9mX4U8AiD+lr10OCmtBt8Onu5j7EnMOEkyWM/nQAC
   GLSFHnXuxVxNbb+lfeAKT9vrPQZPs76nD5yM0UajO1mLzqUr+EvO5paTo
   ZYxFimHvo+kbfL+Ex/eo7jqWJaTrwAPdqn3KumgOPx0Fnq8cWOQ6tlKE/
   ZfzEm2Io0RQg4+esIGKwGnDRBaCJWQ0BAYcToIMg25+bIIhpznQn7V50j
   KgvhyX+pt3pSxHqdOv4ZOMzWcJdELoUfxHCBqYMBpWNWOlPe2wYEV0Cpu
   tM5e2EYFATBbboC3Mp/cFzkkMjp3Gu5kRaH35he+xZW4F+CydRhZCxfXI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584378"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584378"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952139"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952139"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] libnotify: upgrade 0.8.2 -> 0.8.3
Date: Tue, 21 Nov 2023 09:34:41 +0800
Message-ID: <20231121013448.8478-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:35:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190943

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libnotify/{libnotify_0.8.2.bb => libnotify_0.8.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.8.2.bb => libnotify_0.8.3.bb} (93%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb b/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
similarity index 93%
rename from meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
index 1ca7ef8714e..1e606b84b28 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.8.2.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.8.3.bb
@@ -20,7 +20,7 @@ inherit gnomebase gi-docgen features_check gobject-introspection
 # depends on gtk+3 if tests are enabled
 ANY_OF_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'tests', '${GTK3DISTROFEATURES}', '', d)}"
 
-SRC_URI[archive.sha256sum] = "c5f4ed3d1f86e5b118c76415aacb861873ed3e6f0c6b3181b828cf584fc5c616"
+SRC_URI[archive.sha256sum] = "ee8f3ef946156ad3406fdf45feedbdcd932dbd211ab4f16f75eba4f36fb2f6c0"
 
 EXTRA_OEMESON = "-Dman=false"
 
-- 
2.42.0


