Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD90C4332F
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:20:04 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.5707.1640910003444994118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:20:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FCazsS1l;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640910004; x=1672446004;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iQCEWkwKMuV59Gq0erBp6B9QgXkDGgOAl7YTeCnvinU=;
  b=FCazsS1lkRb7omEr3zosHdunTP7c2xkbdfMBYm3GM901RZB9ZBFykStD
   cXcmPS3I0W2KzGZ5YZcdb/jhvToVvhnj6qZcvbUyNJ0IapUI7kuVCaqY1
   qkzwKeO0yuE5cadjurz/iWeqaPjjRp/sdBThhVB401Fv+GS6fmvZ4JObf
   UJfvY5ubL/LL4F2ULDp60gzUjfIkp0FY+E9hFtWAqKPVLqBTZWDng6L+K
   qhzbG3cTYRwufyULcWA4KqaNS/LB9Q3gYvvJKAlSH94u/cOzOWDIpEgR/
   eCGflZzYHzp8295SIrRYALULOAi1HOlX4OLNYZDwM47Mph40OMLS6WOjz
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573134"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573134"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:47 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502358"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:46 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 10/11] python3-pyelftools: Depend on debugger,
 pprint
Date: Fri, 31 Dec 2021 08:19:23 +0800
Message-Id: 
 <505f5d895da825453739126fedc9976644d77c7b.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:20:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160077

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


