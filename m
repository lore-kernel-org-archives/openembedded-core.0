Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5204FC35280
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:06 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web09.3165.1650419971168400442
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 18:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=LzjOx4HF;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650419972; x=1681955972;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=71CU0bNQTgEXo2kw1lYzjxPAhUgRyYazJKPE9jLyTKc=;
  b=LzjOx4HFNLCAHpR6ZqQQzIJMdqyyxyBO+8NyfdrNXoQxB//6kiFzaqe1
   gdQ5R4cTgLHZjXpwQpUDEnekPkoRCom02moxu0Reien2nHuD3aSuzCNFX
   a/Hq9pD+hrnFjz6KM6zRRk5ueZzEhNxpcYq050iezgwefV5ldabFHQkaD
   6gJIWFQciwa1QkqCGy9Djw5QKAMQ1QLV5kLYOWBa6g6Rm3jU1WX3d9C+V
   +IdpIupr7Om1+5Rkuzox53XGZcLokwfFJDgQMqNhmMqWFFCMDckq7IkjG
   2AmjyxMQbfsRC5IQOEOh3q8/5XnXZ7T1oT2SSWa+rtdzmPtYs38cj95YD
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10322"; a="350364636"
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="350364636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,274,1643702400";
   d="scan'208";a="531071443"
Received: from kchew4-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.150.151])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2022 18:59:30 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 03/11] vim: Upgrade 8.2.4524 -> 8.2.4681
Date: Wed, 20 Apr 2022 09:59:08 +0800
Message-Id: 
 <4fdc8884c4ce387d51578d5da0624c630d7791dc.1650378286.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1650378286.git.anuj.mittal@intel.com>
References: <cover.1650378286.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164642

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License change is a date in the license file only.

This includes a fix for CVE-2022-0943.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 69bc2f37d6ca7fa4823237b45dd698b8debca0a9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index a05e91fe20..933ecfd9af 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
+                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4524"
-SRCREV = "d8f8629b1bf566e1dada7515e9b146c69e5d9757"
+PV .= ".4681"
+SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


