Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA9DC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:59:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.10087.1632927554721798137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:59:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="224613787"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="224613787"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200";
   d="scan'208";a="520858436"
Received: from zkeh-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.213.143.173])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 07:59:19 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/10] bzip2: Update soname for libbz2 1.0.8
Date: Wed, 29 Sep 2021 22:59:03 +0800
Message-Id: 
 <5a6e647335df4a46d88a263977577948f370e072.1632903759.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1632903759.git.anuj.mittal@intel.com>
References: <cover.1632903759.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 14:59:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156462

From: Tom Pollard <tom.pollard@codethink.co.uk>

Set shared library name as libbz2.so.1.0.8, version in configure.ac
already synced via do_configure PV substitution.

Signed-off-by: Tom Pollard <tom.pollard@codethink.co.uk>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 07e3abc9d282a54add69a6905ec4248f3104219f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/bzip2/bzip2/Makefile.am | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bzip2/bzip2/Makefile.am b/meta/recipes-extended/bzip2/bzip2/Makefile.am
index 7338df03eb..d12d3a45e4 100644
--- a/meta/recipes-extended/bzip2/bzip2/Makefile.am
+++ b/meta/recipes-extended/bzip2/bzip2/Makefile.am
@@ -1,6 +1,6 @@
 
 lib_LTLIBRARIES = libbz2.la
-libbz2_la_LDFLAGS = -version-info 1:6:0
+libbz2_la_LDFLAGS = -version-info 1:8:0
 
 libbz2_la_SOURCES = blocksort.c  \
                     huffman.c    \
-- 
2.31.1


