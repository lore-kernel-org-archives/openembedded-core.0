Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A0C3C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 01:21:16 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.20093.1639444861529217620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 17:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=intel header.b=kbgW+VnT;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639444875; x=1670980875;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=NZ+ZSl/Y7Arzji4B4hISFazK/uV2f7NpYb/4oVEO6ok=;
  b=kbgW+VnTbF4qvq36RksRqOMP5KQ/EMiRqxBWYgD/rgp0Tp/EM/tfnsHg
   QkN+8J+1f7uLEtpTDkpTiiPfDhPCngBNCTwvNe3qjXRg258AOzs09PDky
   57+iaLvKcXSon1mRtg9oCMBxTlG1/5PgQnRK3mnODBdUPjn5QAXEjX0sP
   4ruJVKjZzhj7QCnw8p0KUnMLmtfLqrBGNBbfSNccgF9TJkNeWbfvqVS18
   is+K/TFQqVkH7ro2TD7k9Z2rzyLjX6oJopp1jbeYvQ4w/xG97Lf+oEUkA
   RJO2PiKJRTIT1Q625yKrMUFnZgxRutIWgjL6Jvhucfe/ZkGfgKFjS3PSP
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="238682523"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="238682523"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600";
   d="scan'208";a="464869207"
Received: from zyteoh-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.215.239.31])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:21:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 09/17] kern-tools: bug fixes and kgit-gconfig
Date: Tue, 14 Dec 2021 09:20:44 +0800
Message-Id: 
 <ee1d3b4cd0c7a615cbd5ddf46433c470dc43c669.1639444641.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1639444641.git.anuj.mittal@intel.com>
References: <cover.1639444641.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Dec 2021 01:21:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159671

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping yocto-kernel-tools to version v0.3, which comprises the following commits:

    90598a5 tools: Makefile: add missing install file
    330f9fa kgit-config: fix file mode
    22b55cd kgit-config: cleanup error message
    1e2a233 kgit-config: fix the "not found" message
    e7fcb9a kgit-config: trim trailing whitespace
    3cd14ce kgit-config: BSP template and auto meta-data creation
    e56620c tools: introduce kgit-config
    969b888 buckets: update to v5.14+
    d220b06 Kconfiglib: add support for bare 'modules' keyword

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 88439875530bf36e301dbba12de5cf0dc664ba51)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index ef035aed23..95983fe69b 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
 
 DEPENDS = "git-native"
 
-SRCREV = "d220b063852245fdd16b9731a395ace525f932d6"
-PR = "r12"
-PV = "0.2+git${SRCPV}"
+SRCREV = "90598a5fae1172e3f7782a1b02f7b7518efd32c8"
+PV = "0.3+git${SRCPV}"
 
 inherit native
 
-- 
2.33.1


