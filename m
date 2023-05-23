Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CD9C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:21:46 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.9585.1684804898936491221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 18:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=i11GptXf;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684804899;
  x=1716340899;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=v3sl9UoZRJzYkD+6wXrTgFeYsdxfDNEwL3Q5VvtC6e8=;
  b=i11GptXfUgEfwCiREi9FvJc6zMuJ+1TID7yOf3j8UQ3a43UY82S7ARpa
   5WdTKsW7pECWMPqD17x6dZX15xUBgW1Rm9fsPomV0GCAOBhDLzNjnLVkK
   tK0DUSyf9qdFZGwOkfKVFMIjW7o5ShQpUtXcqmrAZhsbX8ij1Hs3G9Qyc
   dMc2dZfHteQRiKAwEEqY/S05/0n+nJDDMHxMKkBI5b5lY5QZp1CcpztFV
   wWQzVdEIYL10ku3Ggs4yt7CgWLuTBCWtigwJSGRrMuhvq+ygkRvZ9BOlp
   nvVoIa4cEtjao3W0IaPBJL7/0ycE/hT3/zAdcvXOye8o6UoUSZ2VL0GGH
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/2] xf86-video-intel: Use the HTTPS protocol to fetch the Git repositories
Date: Tue, 23 May 2023 03:21:31 +0200
Message-ID: <20230523012131.50450-2-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523012131.50450-1-pkj@axis.com>
References: <20230523012131.50450-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 01:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181622

This matches the change in commit 139102a73d (recipes: Default to https
git protocol where possible), which did this for most recipes.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 74ec57aa66..21b499e666 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,8 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
-"
+SRC_URI = "git://anongit.freedesktop.org/git/xorg/driver/xf86-video-intel;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 

