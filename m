Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D3AC48BF7
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bllmrZY8;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083644; x=1739619644;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=3bv+5Q6ismC49+8nBeGizcvtMiQBqf1fn6G30BWKVDk=;
  b=bllmrZY8EbQwWyX/4OFBxaKBxeuYFOqIwE1JftZ3xVXIdNc9ske+QWOb
   PgL8OvAN5ukIoWr1+Iyl8fibVH3MwhhcGjh5YgjbIEvksv3bbivGKczeO
   IVOBI/gwKTDIXao+mRliSw1Ze/u4UmzbIIjJWrJUZ5Q8cR44GG5PjfEvv
   NIU+M/qXw0/nr9pTgpWC/3yIUKzGSmKKhXKLXzxGIP88vXPbRvY6uFSiZ
   81IdLpPpytl7vm/kVE58E2OjmqKk5TQQcD9ZfuuPMdzVVBjAi79zP8K5D
   NIII1v26Mm4yfXUrsxFeaDJAXoHiRFNQbA8z+GjQEZ6aFSLTCD+7fhteA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612858"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612858"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349725"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349725"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] libproxy: upgrade 0.5.3 -> 0.5.4
Date: Fri, 16 Feb 2024 19:40:28 +0800
Message-ID: <20240216114034.109257-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195750

This includes a fix to include complete library version. Release notes:

https://github.com/libproxy/libproxy/releases/tag/0.5.4

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libproxy/{libproxy_0.5.3.bb => libproxy_0.5.4.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.3.bb => libproxy_0.5.4.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.3.bb b/meta/recipes-support/libproxy/libproxy_0.5.4.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.3.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.4.bb
index db88af093ee..b4f4c6d2549 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.3.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "29d51a611f28af0bdbd51a5779cc8df264c8dcff"
+SRCREV = "dff9a603d823dcc740ec966cd27960daa6b891b1"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.43.2


