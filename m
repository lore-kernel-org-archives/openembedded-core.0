Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5623CC87FCD
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 09:17:14 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.15148.1753435030013313776
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 02:17:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=HLKGmwtn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ZLbqFPMlg2X2xd/nfn1skym7gGTZ02hw0hEGRGFjfJI=; b=HLKGmwtnzEnMTpVpjdhAtTpLUu
	C3ivM7gdX9qVdRWEDGA4+n9NNr70LDfHowFCn2vKSsSoi/QOUeZCBuJM8THwRKUsji7T9gefCIU+g
	GnfvRV/GvND6fIhOavbE0xVOj3yPeNk0XXF0YYxFBmFMjTr0YtaQCohY4TxHpBNPOJj8eQNF9GeSw
	8wBKcT6rLZ7XAX8wbY3ijx0Kp3aKBrQa1A9nCa7Wdv5OJdbilcJS1+8QqFoX5kGRgwZQonCQ7xuE7
	yUrgIQm1hN3CWw6g0ekLkfW3H1eV3CJW0jtOd2cOm4TAKv2qRMDgNRwqDpa7t4IWcLW5W0p7bV0pR
	FBcLllMA==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:35722 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1ufEY5-00000000ITz-17He
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jul 2025 05:17:08 -0400
Date: Fri, 25 Jul 2025 05:16:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] documentation.conf: drop reference to tar IMAGE_PKGTYPE
Message-ID: <62680970-3d53-04e5-8614-c5f05975cf57@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 09:17:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220903


tar packaging was removed some time ago.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 2710485227..741130a392 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -212,7 +212,7 @@ IMAGE_INSTALL[doc] = "Specifies the packages to install into an image. Image rec
 IMAGE_LINGUAS[doc] = "Specifies the list of locales to install into the image during the root filesystem construction process."
 IMAGE_NAME[doc] = "The name of the output image files minus the extension."
 IMAGE_OVERHEAD_FACTOR[doc] = "Defines a multiplier that the build system applies to the initial image size for cases when the multiplier times the returned disk usage value for the image is greater than the sum of IMAGE_ROOTFS_SIZE and IMAGE_ROOTFS_EXTRA_SPACE."
-IMAGE_PKGTYPE[doc] = "Defines the package type (DEB, RPM, IPK, or TAR) used by the OpenEmbedded build system."
+IMAGE_PKGTYPE[doc] = "Defines the package type (DEB, RPM or IPK) used by the OpenEmbedded build system."
 IMAGE_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the image."
 IMAGE_ROOTFS[doc] = "The location of the root filesystem while it is under construction (i.e. during do_rootfs)."
 IMAGE_ROOTFS_EXTRA_SPACE[doc] = "Defines additional free disk space created in the image in Kbytes. By default, this variable is set to '0'."

