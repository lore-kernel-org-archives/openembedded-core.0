Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1635DC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:15 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=NUN9eAkg;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444874; x=1670980874;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=K22uNhrbh3RChqdiAXNznQ5o4YgHhqpJhu8U1qTwBVc=;
  b=NUN9eAkgvbP8Xp3zoHz7XwhsJcg++IFNlMdPMud4ZALnQnR36c8B7049
   Y4uybz8FtLvmU0Vz4BPJtGTwJMXa8ImEsy1oRF1XOd/kwFcsQW9E+KJbp
   G3xH/tbL+TyOjBLQIdRsG0om9vjBjDHIlQC+58w6EXPSYt3p8sptWcssZ
   8M/oWqRU8iYx0avr5+SlN1aOzM+gi+OnHMbUenY6cu9lVRmiVrb2xOxib
   EVk4fRY8E9hVZzS39EqTXjHXyD9x5Am/qpbs+3FAp2+2H7xq9DPeLoG4v
   LFZxuCFdayQY2JClZxV2ButL5Q+m2RO89PzDjNMyKAUTtASPycW0gqP2+
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682521"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682521"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869203"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:12 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 08/17] gcc: Add CVE-2021-37322 to the list of CVEs
 to ignore
Date: Tue, 14 Dec 2021 09:20:43 +0800
Message-Id: 
 <c85a595b23df19c0e51977dae65266888e2706c4.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159670

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fea2726663a3db03170c49fceaffc632c509aeea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 9fd30f52a8..cd1b022ff2 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -117,3 +117,6 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.33.1


