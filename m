Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A3FC43219
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 02:57:48 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web08.6418.1652237867611179149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 19:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=fA2fwIL9;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652237867; x=1683773867;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=mszcZLpWfqgFnK9tm+KHyx4HKutlQAotEu+bnu/jC4g=;
  b=fA2fwIL98FYOmcsXv1AK+ud1kBCwExAOzUIdtzowfHsHfgMjfKeZrZOw
   mv3UgctWK5m/0JwQya81g3BxhMttOpVv0XXf6UJosYEggJZnAnPmCnwVV
   i9cx0Ig4GjUNCCGLCGJ0KtiRQaTTL/mStT/UIZMCqA1odsODZEFIxSNE1
   Merwo+u675UNDQ786Ua/OWo6BLUMjhgO7yhjVRQquN5NSUfIqIhA8GvEB
   hD3zqRLuTVKrOKeXpfMvqcwF6v1zMnFTqbWc2WBrRMnoV5cph7EpZ08mj
   IL6i7QfhtmkI6YAWR87Mb9XlmKqpR5509AtUHuskrKEsfypQxTepupX9E
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="257106007"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="257106007"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600";
   d="scan'208";a="602754719"
Received: from ukandhax-mobl3.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.163.3])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 19:57:45 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 05/17] volatile-binds: Change DefaultDependencies
 from false to no
Date: Wed, 11 May 2022 10:57:20 +0800
Message-Id: 
 <a45c20b9ebdffc962411e7db2ffd353330b98da8.1652231471.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1652231471.git.anuj.mittal@intel.com>
References: <cover.1652231471.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 02:57:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165472

From: Portia <stephensportia@gmail.com>

The systemd-unit parameter DefaultDependencies changed from true/false
to yes/no. This changed in systemd in v242.

Signed-off-by: Portia Stephens <stephensportia@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit add4dcb03dc7b034253db05f0023cb97cab8b26d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-core/volatile-binds/files/volatile-binds.service.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
index e2ad39f258..0c1c79d0c4 100644
--- a/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
+++ b/meta/recipes-core/volatile-binds/files/volatile-binds.service.in
@@ -1,6 +1,6 @@
 [Unit]
 Description=Bind mount volatile @where@
-DefaultDependencies=false
+DefaultDependencies=no
 Before=local-fs.target
 RequiresMountsFor=@whatparent@ @whereparent@
 ConditionPathIsReadWrite=@whatparent@
-- 
2.35.3


