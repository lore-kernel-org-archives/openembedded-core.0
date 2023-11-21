Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D656C61D88
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 01:34:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.24989.1700530494336755570
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 17:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=b4aTYwKn;
 spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700530494; x=1732066494;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gEazW6FdVZeaPNpUv7kI8ssOWgo7O2no2uDZ8ZElzFc=;
  b=b4aTYwKnskKiMYjmSBu29uAQCpnVhgsk0hwoXWmpi6PfMIL7Nfsinewv
   MqMnVR+v0Dtb0rFVfYutA4zVaYcVbGAQIE+p6uTmETV6OyKBGuBVqWan1
   WcfZG8k9R8jXmFWWSnLjnL4Hn3CwOBTL5hFcOHjAyehTEWDdDbVd8SZpH
   QG61SCaIgWFww6miInjPn98KKnhFgfATH2qPOTwpXDQksiER4TlQfhdNm
   9SWeQzWUoQAKKpDwXwqWr+swkeAT5zUF2wgRsSwSv1ywk6ZpQB2L38A/W
   n4EE0JZpspFX6025P8BFmwqmQhcFqdvyTXupD+1+oQYV5f7YDoR0ysuNB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="394584374"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="394584374"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939952132"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="939952132"
Received: from unknown (HELO anmitta2-mobl3.png.intel.com) ([10.107.4.247])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 17:34:53 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/11] gsettings-desktop-schemas: upgrade 44.0 -> 45.0
Date: Tue, 21 Nov 2023 09:34:39 +0800
Message-ID: <20231121013448.8478-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121013448.8478-1-anuj.mittal@intel.com>
References: <20231121013448.8478-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 01:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190941

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...esktop-schemas_44.0.bb => gsettings-desktop-schemas_45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_44.0.bb => gsettings-desktop-schemas_45.0.bb} (84%)

diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
similarity index 84%
rename from meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
rename to meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
index 5ccc1a7dd45..657f9d61cec 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_45.0.bb
@@ -12,4 +12,4 @@ DEPENDS = "glib-2.0"
 
 inherit gnomebase gsettings gobject-introspection gettext
 
-SRC_URI[archive.sha256sum] = "eb2de45cad905994849e642a623adeb75d41b21b0626d40d2a07b8ea281fec0e"
+SRC_URI[archive.sha256sum] = "365c8d04daf79b38c8b3dc9626349a024f9e4befdd31fede74b42f7a9fbe0ae2"
-- 
2.42.0


