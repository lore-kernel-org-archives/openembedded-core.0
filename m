Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 520C0C3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 12:57:30 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.25986.1722776244870045236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 05:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UsjxwxWP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202408041257216c2bef507db239ba8d-obkzik@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202408041257216c2bef507db239ba8d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 04 Aug 2024 14:57:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=zJLHrS2nn1rOCV3r6rQRA395DyKMXp6pSoS4o6diKSA=;
 b=UsjxwxWPniECOhOayAufePPPZ68Zz+Sz3ZULYWLhJEeQ6wcDwkvjELbO7ZdRpyaXjTqKGn
 ++wd1NU+Fd11UH8wS54Ex4Prlp+L8u6zEvL77IsKoKaLqAiGAQFQcI27/W7TtaCMHHAUfOMl
 w+GMrHjbXIQF17J2bWtmRguyq4qSihIf51SIDCTytVQJascku8FWrOF+DLarY3o3PtClzWYd
 9+tBCOd75+1GdVMx4TxZ9zE9hh5lX723rcRjJ92d9+97AP2Jkt9TjFUp9+NMq3H/ogBeXkQZ
 +keweKWDFQiJ6Pziuz/GFkYwvGv3+3deW8Zb+mnDniyZy3Yw/M/sAUgw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][scarthgap][PATCH] glibc: cleanup old cve status
Date: Sun,  4 Aug 2024 14:56:33 +0200
Message-Id: <20240804125633.4153809-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 12:57:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202945

From: Peter Marko <peter.marko@siemens.com>

This CVE status should have been removed on version update.
CPE says >=2.34 and <2.39 while our version is already 2.40.

(From OE-Core rev: b568a8f428e76f75bb8c374983f62822325ebe8a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ad58bebcf1..955b22bc38 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -6,5 +6,3 @@ SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
-CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-- 
2.30.2


