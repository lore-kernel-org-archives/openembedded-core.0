Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD4EC43217
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 23:19:11 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.3215.1636586350025145281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 15:19:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fkM59FE0;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636586350;
  x=1668122350;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fe0kxr2L+GKFzCzEgljFvio+UBeL1D551vUt702S6gI=;
  b=fkM59FE0mihYZDiWkmTJhcei5TRKc+Y1jBWuEACnfldsrU50rbr2thws
   u1UoG9hhNWJ2xbvl9BT0Jz/MKXGJc1f18gkxX+Lz25l2Xg2DGDECmJUMo
   EIbx78PFmxB8eB/dUsUYlWyoT5d+k0u4aNVKZdFyn5FTOsGtl8GsmkuV/
   RApiwuq1i0qzYtnUy526SvVPXFG3xyRfgoNINNh7PyeTvcOCMHutlxDJt
   dYIGyINfJ3XX/a9J+Ge6jxLoGdS5JtN5oDFCGbJSxYYJbUMOJJDZ/7wBG
   GRXMUicAjOSYKek08zUliUKW58e/EkGosvliDRmbO5kqk232B7k2jHotG
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/5] gcc-common.inc: Clean up the additions to MIRRORS
Date: Thu, 11 Nov 2021 00:18:54 +0100
Message-ID: <20211110231856.5799-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20211110231856.5799-1-pkj@axis.com>
References: <20211110231856.5799-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 23:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158118

Since commit 044fb04d in bitbake (fetch2: Allow whitespace only mirror
entries) there is no need to separate the entries in MIRRORS with "\n".

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 74190644e6..0d950e780d 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -86,11 +86,11 @@ get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEA
 DEBIANNAME:${MLPREFIX}libgcc = "libgcc1"
 
 MIRRORS =+ "\
-${GNU_MIRROR}/gcc    ftp://gcc.gnu.org/pub/gcc/releases/ \n \
-${GNU_MIRROR}/gcc	ftp://gd.tuwien.ac.at/gnu/gcc/ \n \
-${GNU_MIRROR}/gcc	http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \n \
-${GNU_MIRROR}/gcc   http://gcc.get-software.com/releases/ \n \
-${GNU_MIRROR}/gcc	http://gcc.get-software.com/releases/ \n \
+    ${GNU_MIRROR}/gcc ftp://gcc.gnu.org/pub/gcc/releases/ \
+    ${GNU_MIRROR}/gcc ftp://gd.tuwien.ac.at/gnu/gcc/ \
+    ${GNU_MIRROR}/gcc http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \
+    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
+    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
 "
 #
 # Set some default values

