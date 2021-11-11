Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8768C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:16:16 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.8643.1636625775397317789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:16:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=or4Rc3av;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636625775;
  x=1668161775;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=miNbK9+oHHgkXWrxRGwHx1EbGPqDXKutjd3lK4i9ONQ=;
  b=or4Rc3avy+mS/PfCYuu7RFAjcIPygrOSFAxKtyfL3hOAui4IKZuCDNbj
   kqC6c505YmEMQAK7xVKIrTKqGAVBpC4evVyAUphl5c4YsCHccytuiu6/M
   kDngt2PAT25dIZereyXHIj2Mw6rVQmgucS9Q6Oh4t8tp1fg0NkWOmddGo
   8E56re4yzbkge/bjaut7tyvAz+oBM9DylB3o28ouZl0v9c6cJGjnID1qV
   VqxjWza1pb5FlVSfXANVx0mOAFcFPG+0EIa/uYUzSDzWJgY6BMHh8kT8l
   KJQJ+++Kg5WJ1+QahuBHGZR+7lPysseJbAfg0WN9L6E0dQ1oUwLqbSYlz
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] gcc-common.inc: Remove mirrors that are no longer available
Date: Thu, 11 Nov 2021 11:16:09 +0100
Message-ID: <20211111101609.14090-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:16:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158155

Also switch to https for https://gcc.gnu.org/pub/gcc/releases/

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This patch is based on top of the other patches I sent related to
MIRRORS.

 meta/recipes-devtools/gcc/gcc-common.inc | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 0d950e780d..0f70be7dd4 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -86,11 +86,7 @@ get_tune_parameters[vardepsexclude] = "AVAILTUNES TUNE_CCARGS OVERRIDES TUNE_FEA
 DEBIANNAME:${MLPREFIX}libgcc = "libgcc1"
 
 MIRRORS =+ "\
-    ${GNU_MIRROR}/gcc ftp://gcc.gnu.org/pub/gcc/releases/ \
-    ${GNU_MIRROR}/gcc ftp://gd.tuwien.ac.at/gnu/gcc/ \
-    ${GNU_MIRROR}/gcc http://mirrors.rcn.net/pub/sourceware/gcc/releases/ \
-    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
-    ${GNU_MIRROR}/gcc http://gcc.get-software.com/releases/ \
+    ${GNU_MIRROR}/gcc https://gcc.gnu.org/pub/gcc/releases/ \
 "
 #
 # Set some default values

