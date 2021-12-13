Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F21BC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 04:18:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web12.7345.1639369051545710943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 20:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=nNefTZ1W;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639369080; x=1670905080;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=htnGNKxYeVwzX96V7xawIR6dGiVEXPCW6woUfbl9shE=;
  b=nNefTZ1W2OO8fJIYpDqNU22X5HdGj/094Ie1LCnVFTDj6XmjUi9oq8Xf
   vytYBc8WC/fHGsUhg1CYBK8q4FlF3RQAHg0yWLN9g4sV3dTqKwj9HLJB3
   tLELHOc7Qor2m6UIL5a3kiSMH3GcbYxPLVU/CqMMfsmBPNs5/Se4G/zns
   3dqDnCniTHjRgN+VdJuEys5TLFJlpvs2A+qjj67NOO8+vJcg+6zI2NsI7
   VwPCsaF5TFjQwr71uMjTyeeyHzd79vltJtU9BnHiVVlEbdEuY4Ilp3cmH
   GXT0UAZufExNrYfHa6ImUrg541u2DsMbT36GxW6tloosg6Mt42bcp4cVI
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="238602275"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="238602275"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:18:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600";
   d="scan'208";a="517589346"
Received: from echan1-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.132.97])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 20:17:59 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/20] libpcre/libpcre2: correct SRC_URI
Date: Mon, 13 Dec 2021 12:17:19 +0800
Message-Id: 
 <f6791df317e66b2d3fa88d3a038d888d4512305a.1639365111.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639365111.git.anuj.mittal@intel.com>
References: <cover.1639365111.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 04:18:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159610

From: Alexander Kanavin <alex.kanavin@gmail.com>

http://ftp.pcre.org is down, take sources according to links on
http://www.pcre.org

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81ba0ba3e8d9c08b8dc69c24fb1d91446739229b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libpcre/libpcre2_10.36.bb | 4 +++-
 meta/recipes-support/libpcre/libpcre_8.44.bb   | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.36.bb b/meta/recipes-support/libpcre/libpcre2_10.36.bb
index d8077a1224..d64822be30 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.36.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.36.bb
@@ -10,7 +10,9 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=60c08fab1357bfe9084b333bc33362d6"
 
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2"
+SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
+
+UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
 SRC_URI[sha256sum] = "a9ef39278113542968c7c73a31cfcb81aca1faa64690f400b907e8ab6b4a665c"
 
diff --git a/meta/recipes-support/libpcre/libpcre_8.44.bb b/meta/recipes-support/libpcre/libpcre_8.44.bb
index cd80dc7345..3267c5ad72 100644
--- a/meta/recipes-support/libpcre/libpcre_8.44.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.44.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=3bb381a66a5385b246d4877922e7511e"
-SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
            file://run-ptest \
            file://Makefile \
            "
-- 
2.33.1


