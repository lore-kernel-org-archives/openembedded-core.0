Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38DDC48260
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=n9L6N93M;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083646; x=1739619646;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GotB+2gPDgX1w1xaaLGUprawQjJha4Ttu9PcLpR+DSc=;
  b=n9L6N93MfNOm4t4oAjdx0sr/uU4AvckUy8dudAD4uLFJclCFEEwJCr2X
   /d/Ad1nA7sg/9kgWSqbtPZS5rbX05Shv0sButVkwR8/b+QLKVR4C1wZxh
   AU6s/oDgLtHxGd+Esm6HoBhALpHfTcPRbHR5lE5e+6hCj6KsN0ugWjSXM
   /VtKp0QGeEWFn1sfW8gB7zXxQYXQ3LMehJGk5qHDStJ5ba4yqJp8V8BDG
   yYbjOVl8zNTHY9P+TdA0v8h4bRdzuVhmV+j/yY9pjwFHxdeWoJRdbW76L
   hbdSSBtR82ewRORm32SV3W8PMMh185r6srZicjvzt/XlyWetLzkv8wo7z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612863"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612863"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349730"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349730"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:45 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] orc: upgrade 0.4.36 -> 0.4.37
Date: Fri, 16 Feb 2024 19:40:30 +0800
Message-ID: <20240216114034.109257-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195752

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/orc/{orc_0.4.36.bb => orc_0.4.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/orc/{orc_0.4.36.bb => orc_0.4.37.bb} (92%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.36.bb b/meta/recipes-devtools/orc/orc_0.4.37.bb
similarity index 92%
rename from meta/recipes-devtools/orc/orc_0.4.36.bb
rename to meta/recipes-devtools/orc/orc_0.4.37.bb
index b191367eafa..9985204d744 100644
--- a/meta/recipes-devtools/orc/orc_0.4.36.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.37.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
-SRC_URI[sha256sum] = "83b074cb67317d58bef1e8d0cc862f7ae8a77a45bbff056a1f987c6488b2f5fd"
+SRC_URI[sha256sum] = "85638c0d447d989cd0d7e03406adbfbc380e67db2a622a4727a0ce3d440b2974"
 
 inherit meson pkgconfig gtk-doc
 
-- 
2.43.2


