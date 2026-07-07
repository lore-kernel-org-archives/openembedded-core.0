Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE82C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 12:24:45 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.172118.1783427075120770006
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 05:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=VIDPOlGT;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6d8OVVA5KfJq63bDPDwkDjQFnw8ZkKf9uPuW03T+uFs=; b=VIDPOlGTuij1Zm+JIZXRRqCnsQ
	L9W/DyTvgo5dA6KL+lPtGUCg+LkkAevScw66y5kwwiPBoNJ2ddIYjQbaOTSfrj2aZRPhN+ihuHqi0
	36LFnNjotkz0G477aTOkTBST0uHpwNjvKK4fE0z1KdXdgHds6FLVZKQ3IOcRMxaXAELDl9cIlxcXn
	TFLx3ADju7K5I3xp/LQwbGMfqeBHbcPJ37Sd8d9E16FP+0KKHNciKJZ3WXsynpQ8YnP/AkohIo+RB
	xep/mCDfSV0Yu5ScNFDA0FsfOJLOlkoyyiI2jeeBZjYHR6fL76tTZHS9qsAONXqeYxTRIqXxUirj1
	+Q8WbKQQ==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:46082 helo=sheena)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wh4ql-00000000Vy0-3SWq
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jul 2026 08:24:33 -0400
Date: Tue, 7 Jul 2026 08:24:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] kernel.bbclass: fix typo in comment, "INTIRAMFS_TASK"
Message-ID: <7f445410-759f-93db-8044-2628c4007fd4@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 12:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240384


Correct "INTIRAMFS_TASK" to "INITRAMFS_TASK" in comment.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index 50cef17f69..48e394b650 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -384,7 +384,7 @@ kernel_do_compile() {
 	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
 	if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
 		# The old style way of copying an prebuilt image and building it
-		# is turned on via INTIRAMFS_TASK != ""
+		# is turned on via INITRAMFS_TASK != ""
 		copy_initramfs
 		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio
 	fi

