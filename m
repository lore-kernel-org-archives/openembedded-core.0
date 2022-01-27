Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D71FC4332F
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:25 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DFGBA8V/;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260223; x=1674796223;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dpF8mxKr3mMo1SQXGNWazqtRg7LJzXB0BJYq3d8UWVM=;
  b=DFGBA8V/3ve97Ot1JMm1llYyBs9gWdie8yvPmsGoRBCJuV4mX7G3s1o1
   p1DAn/r0kZA9huMPzoxRbMpN/mkluVjldrAeVeEuehmHXsW0wZz5wTPEl
   Ie15gEI4QXUBHFJI7sB61ZLfIx6Jczgc4IyeYz88VBibqs2QxrT8WumwR
   y8kSBy2ssOAYNo1lyAp0octhDOxxHlOdoN1fb27UjW8IFd3NadPce1HlW
   O/2lHV3hohLLNL2UbOcNFJgyodidkrfJ/SmXsNBENkeUA6anUb6PUEqCA
   ZBMwlO/DhCCy/o5PUGmOtXs/zvh6qckf4zHzeqL6GJOo+us2Q2FNdj3Rx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590311"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209003"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:22 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 04/17] socat: update SRC_URI
Date: Thu, 27 Jan 2022 13:09:57 +0800
Message-Id: 
 <88edb7031149992e12f668201f0a22af6d666867.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161007

From: Mingli Yu <mingli.yu@windriver.com>

The orginal one is unaccessible now.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
index 5a13af91bc..0a1b65a8ca 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
+SRC_URI = "http://www.dest-unreach.org/socat/download/Archive/socat-${PV}.tar.bz2 \
 "
 
 SRC_URI[md5sum] = "36cad050ecf4981ab044c3fbd75c643f"
-- 
2.34.1


