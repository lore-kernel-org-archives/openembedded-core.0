Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083CBC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 15:19:05 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1720.1641395941760702382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 07:19:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=ZUZ+WcWc;
 spf=pass (domain: intel.com, ip: 192.55.52.88,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641395944; x=1672931944;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iQCEWkwKMuV59Gq0erBp6B9QgXkDGgOAl7YTeCnvinU=;
  b=ZUZ+WcWciru7nXsf7yNxz6601J1CtqeaVRh3MX2kHnZPy9DsZE1pEU3/
   2E1MjpLt4b9uwOUg9zxx3vYNvluiS9wOIalABngVX/l0M945Cuh91qT+I
   IYQgd519YlMcOCJnRnB/VIGxi3R5rbtv8BoInhqCWBF40X5u7q0JT/MLJ
   hagIjUPm/K4w0yq/sWS17E5giXKq7mEJojzSnkSO5a9BNcRmb8krjEYE0
   hkM0IhQvY3rFsl+ww99M9imw8NbB77tkqYhwACExnXwCu4MWPmGja1j1g
   nbkKQl5XmhGXeARWbK4EdELx+GlQ6w9S3R4GE3zuuYohJQ3uRvhhLBXex
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266742746"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="266742746"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:04 -0800
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600";
   d="scan'208";a="668128567"
Received: from hanwenlx-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.129.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2022 07:19:03 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/24] python3-pyelftools: Depend on debugger,
 pprint
Date: Wed,  5 Jan 2022 23:18:23 +0800
Message-Id: 
 <66211faf4724b2c88eb4595e41fe98f5da96c3ee.1641395036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1641395036.git.anuj.mittal@intel.com>
References: <cover.1641395036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 15:19:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160188

From: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>

python3-pyelftools uses python3-debugger, python3-pprint.
So add dependencies on these packages.

Signed-off-by: Chaitanya Vadrevu <chaitanya.vadrevu@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 22e84cdd05870f1a19c6389b66c4dfd5e9b418f7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.27.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
index 0cfd99504b..e2d0e18277 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.27.bb
@@ -11,3 +11,5 @@ PYPI_PACKAGE = "pyelftools"
 inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS:${PN} += "${PYTHON_PN}-debugger ${PYTHON_PN}-pprint"
-- 
2.33.1


