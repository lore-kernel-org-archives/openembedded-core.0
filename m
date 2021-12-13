Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D553C433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:17:57 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:17:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=W9e5QK3a;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369076; x=1670905076;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=aKQRc4e7+EpGU6PDg6Ulsme1GsU9wOyTPb+o4CNvk8I=;
  b=W9e5QK3aLBIgqUdkk6kG64KQ+0Wn08uNbRNv1g+P4h9ZvGJah1IxjSTX
   lub9uiO/MiX17yLGefJM/BIi9DWlPqnTdKlUxlFmgPwduIdphm6HVDMym
   FoivDb1/W5sPg7E38ePda0evIdh2jHwwf/ZFOtEJ7cPrF4W66dO86vo8A
   IlZF8Z80HkAxrOfhgOqs6sqYAdRtxMcSk3DH0NGCwGad/MW7k2agrZgOv
   Cf2p9/SdwOVtMOB0DsRau8VgYT41vBxZ868vIP+XojDuc7S55sq9SKsSZ
   hxHy58+B2dCVSFCsa2aR9Dsnc4PKukTu4Yjtq408cUCU2n+wMrNdfvcbL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602263"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602263"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589337"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:55 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/20] gcc: Add CVE-2021-37322 to the list of CVEs
 to ignore
Date: Mon, 13 Dec 2021 12:17:16 +0800
Message-Id: 
 <86e9e812f4ec61a4430658b7c06852a32ca8abb1.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:17:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159607

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to binutils 2.26 and not to gcc so ignore there.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fea2726663a3db03170c49fceaffc632c509aeea)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-10.2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-devtools/gcc/gcc-10.2.inc
index 248e002106..5626bf20f0 100644
--- a/meta/recipes-devtools/gcc/gcc-10.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
@@ -122,3 +122,6 @@ EXTRA_OECONF_PATHS = "\
     --with-sysroot=/not/exist \
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
+
+# Is a binutils 2.26 issue, not gcc
+CVE_CHECK_WHITELIST += "CVE-2021-37322"
-- 
2.33.1


