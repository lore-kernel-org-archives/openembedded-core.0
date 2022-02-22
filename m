Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFF8C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:56 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.13729.1645542530232186642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=O+nrhc+3;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542535; x=1677078535;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=k5KrVuHl7lmW5uiO7Jtjs7DYhF94KzewQItK5e9TNjI=;
  b=O+nrhc+3v1LGGjF2E2xevIWwOBFY+5XI0u5EaiC0xrnHequWOo3MnyR5
   g5eti8l3NPxDueKKPLLd/Sy8Q4OEqwlhEswJayyinzo7ZxBjf0YUSf3IB
   kFfE4LzkBCekEUtVgKaEqsDJvTZSuJOqyAJpax+DoyxcBDeeT/kVtyZ9I
   69/rGOfit9exLluxT5b3NPi0pnHo1DoATCoJ4BMWtE0NmT4OYm65m8kD9
   0Ozq8YSRe598EBfSqHptpKTCQ1gzw9NtaDhhlpLDZTd+XvwZwqRnD7Hgx
   9QT8C9q1TuqEizBYKg1CRAl4WsUsg+9vCZ/djyKTcTBM4JthEOO0KwTUq
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305346"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305346"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258854"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 35/38] vim: Upgrade 8.2.4314 -> 8.2.4424
Date: Tue, 22 Feb 2022 23:07:36 +0800
Message-Id: 
 <66fa8e1716a1b66ee6f5a905f41ac20c6ae9a040.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162171

From: Richard Purdie <richard.purdie@linuxfoundation.org>

License file had some grammar fixes.

Includes CVE-2022-0554.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a8d0a4026359c2c8a445dba9456f8a05470293c1)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 8044500d6b..59e0b4ed7a 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
 
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
-                    file://runtime/doc/uganda.txt;md5=600a38dc53e8931fdfb1238276ee09b0"
+                    file://runtime/doc/uganda.txt;md5=a3f193c20c6faff93c69185d5d070535"
 
 SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://disable_acl_header_check.patch \
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4314"
-SRCREV = "8cbf2499179db39a46e700ab04d0b36e22bcc1bb"
+PV .= ".4424"
+SRCREV = "cdf717283ca70b18f20b8a2cefe7957083280c6f"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.1


