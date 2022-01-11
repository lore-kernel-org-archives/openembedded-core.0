Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9943EC43219
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 14:33:20 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.7912.1641911599396811250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 06:33:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RcGXj/4a;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641911599; x=1673447599;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/IDBcixvwByMo+WF71vm8gxRRDL+U9XFjkVo4+waiBY=;
  b=RcGXj/4aaMbWw1bhkon4kHui6rocuEbjWKrIPUMzxooavz//D+C+2BRg
   vgEKKKZ+255VbIFpTGtnh1BruMxmj+3susugNtPUs3kjqfI3CH2IKnFdL
   OVn73NseLOD07FgWx3AQ6hRkJdU6Ii3iYvMifM9dgmsqHr+D/6aMCoPQw
   2gajp6EmMtqXx3i7HP3AwwQIfdkSZEAgFAfzpVfLspb5sy1y1dtl+IeSI
   uniQ+5ih8sQB/5pvFgFDicaAZtErJLIbathDQh/sUxH4JNjszSuoWB8OI
   MGtdAbmnbZtoZjoQjp7UcLG02yP9+YhMFNr6A0yaK1jVhXRUWUjO4XQ6g
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="329839041"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="329839041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600";
   d="scan'208";a="623086472"
Received: from wongkye-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.187])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 06:33:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 9/9] python3-pyelftools: fix the override syntax
Date: Tue, 11 Jan 2022 22:32:53 +0800
Message-Id: 
 <7e569186820163d731cbb14f8c25ce6a2cc45dc9.1641911316.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641911316.git.anuj.mittal@intel.com>
References: <cover.1641911316.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 14:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160413

An earlier patch cherry-picked from master used : for override. Change
it to use _ for hardknott.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
index e2d0e18277..f8b9d420a5 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
+RDEPENDS_${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
-- 
2.34.1


