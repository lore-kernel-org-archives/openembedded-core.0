Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A22C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 17:19:28 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.123.1652462357584561830
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 10:19:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=YyQZTG3U;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mfcaLuUNV11WH2KdfQmESt/O1c7+2Nt5YkTnarOSVeo=; b=YyQZTG3Utw+rH3QS8PGet7WJM5
	T04WHVaPFxTJJUEK8PdxrgdeZ+jvzie9TgySInHxLYjXD0t70Jg8uKX7fxfMWWtneD+7Q5/Qq7NB2
	mIwEC1QruzuIJUjcC0evkLWfiTMbOrTswkf+gG4u7+ciS6sbdI0V/liv6EHu8M+FIri2PbsAmAY2G
	W7ZwHhkP7P/UkBFxW8TrVgQL+1Vt2PhI5Y5AoVzhHrUBvt1ibO8WZCoID4mgO4GYV4Gg361Hk/QxL
	w/Mx/tYCeiSNz1OiyRpOH4ppHQoynOjQXG7KjZYXH3tJiQmbwxf5ThAsyVjluhs7RkZNAldvMKpnU
	d3fEbAeA==;
Received: from lan.nucleusys.com ([92.247.61.126]:60000 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1npYwu-0007rp-LU; Fri, 13 May 2022 20:19:17 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH] Fix a minor typo
Date: Fri, 13 May 2022 20:19:07 +0300
Message-Id: <20220513171907.2883959-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-2.9
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 17:19:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165582

Fix a minor typo and replace "partion" with "partition".

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta/classes/image_types.bbclass | 2 +-
 scripts/runqemu-addptable2image  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 960dab1a60..89a9c92db7 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -81,7 +81,7 @@ oe_mkext234fs () {
 	bbdebug 1 Executing "dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024"
 	dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=$ROOTFS_SIZE count=$COUNT bs=1024
 	bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
-	bbdebug 1 "Actual Partion size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
+	bbdebug 1 "Actual Partition size: `stat -c '%s' ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype`"
 	bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
 	mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
 	# Error codes 0-3 indicate successfull operation of fsck (no errors or errors corrected)
diff --git a/scripts/runqemu-addptable2image b/scripts/runqemu-addptable2image
index ca29427258..87a8da3a63 100755
--- a/scripts/runqemu-addptable2image
+++ b/scripts/runqemu-addptable2image
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# Add a partion table to an ext2 image file
+# Add a partition table to an ext2 image file
 #
 # Copyright (C) 2006-2007 OpenedHand Ltd.
 #
-- 
2.30.2


