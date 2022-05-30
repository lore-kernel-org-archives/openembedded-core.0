Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A8DC43217
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 02:36:17 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.31651.1653878168927618706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 19:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=FHlFHNkG;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653878170; x=1685414170;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=r2Hdwlmhl03gl4OKiT5cx2zAfqyhfdQsy0miBGpcVvQ=;
  b=FHlFHNkGLmFRvK51IFdIy+Q9sY1kr69JbYr1R2winBNDBuXdZ4tG7zR6
   9ta5zsyHk2K9YiJbwSD+onbtmG+ykLUvPBsqtJ+bCR+8ZwRH3iqZzXfx0
   1ajBXRAT7u0lY6PXTp9HzoFpXllZ6Ii8mx8CeZZPopHvH+S2QQYcv37KP
   6TPhWNf8GUE+eWivbxmmDvE0hZGHH3VnejMFXi6/NEzKb5SlNPhPDIwkS
   1cw4rCWvX92CQSfE8c3Ka8n6MZJD6B12h+xCR72rUe1sq84kOXqCwjYvd
   FsvR1i/fxKx5ie5z6OjGaEmXuTWoOC0/aLfzgUU9ETdUEb3an+PwxTTQZ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10362"; a="274876411"
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="274876411"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:10 -0700
X-IronPort-AV: E=Sophos;i="5.91,261,1647327600";
   d="scan'208";a="666313497"
Received: from jngkeatx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.254.254])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2022 19:36:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/12] vim: Upgrade 8.2.4681 -> 8.2.4912
Date: Mon, 30 May 2022 10:35:52 +0800
Message-Id: 
 <4757b4381f56a0d6da373e3fc75a28ab7958d26f.1653877872.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <cover.1653877872.git.anuj.mittal@intel.com>
References: <cover.1653877872.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 02:36:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166246

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes fixes for CVE-2022-1381, CVE-2022-1420.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 77d745bd49c979de987c75fd7a3af116e99db82b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 933ecfd9af..087153c1d6 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://racefix.patch \
            "
 
-PV .= ".4681"
-SRCREV = "15f74fab653a784548d5d966644926b47ba2cfa7"
+PV .= ".4912"
+SRCREV = "a7583c42cd6b64fd276a5d7bb0db5ce7bfafa730"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
-- 
2.35.3


