Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA8BC433FE
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 16:32:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.383.1637080346426941201
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 08:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10169"; a="319941147"
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="319941147"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:30 -0800
X-IronPort-AV: E=Sophos;i="5.87,239,1631602800";
   d="scan'208";a="535956813"
Received: from mmohdso1-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.237.91])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2021 08:32:28 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/17] mirrors: Add kernel.org sources mirror for
 downloads.yoctoproject.org
Date: Wed, 17 Nov 2021 00:31:57 +0800
Message-Id: 
 <d7fe71c0fa0f368037b20d423c4c45d91c108a8c.1637080067.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637080067.git.anuj.mittal@intel.com>
References: <cover.1637080067.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 16:32:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158359

From: Richard Purdie <richard.purdie@linuxfoundation.org>

kernel.org now has a mirror of the downloads.yoctoproject.org sources
archive so include this in our mirrors list.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f602b6c2046bbc52a95dcc68a754f1cbb2db6761)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/mirrors.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 75eb86a724..49685d2f69 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -63,6 +63,7 @@ npm://.*/?.*    http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 https?$://downloads.yoctoproject.org/releases/uninative/ https://mirrors.kernel.org/yocto/uninative/ \n \
+https?://downloads.yoctoproject.org/mirror/sources/ https://mirrors.kernel.org/yocto-sources/ \
 "
 
 # Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
-- 
2.33.1


