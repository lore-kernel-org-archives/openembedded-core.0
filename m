Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6449EC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 11:32:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.3353.1665142322523436286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Oct 2022 04:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=gmCxlvLX;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 8CD78209ED73; Fri,  7 Oct 2022 04:32:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8CD78209ED73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1665142321;
	bh=lKOyz7DGyBsUuRhvEua6lKF9Syosts3Ta8YqqjFF03M=;
	h=From:To:Subject:Date:From;
	b=gmCxlvLX3KSRgpAtdbr5iZQl+i43Cp17ZuNY5pZhpn2jueVIqHnhVMw4lnCFH3YiI
	 COVHKs15J38g30WcBHPBVUnug/wg875eEOayAjZRz+B+KO885doND01SNWM0RByKHc
	 grc3TMNHqM8jzXK+nEg4cqj34yxmUEz5AzXL1NfM=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] install-buildtools: support buildtools-make-tarball and
 update to 4.1
Date: Fri,  7 Oct 2022 04:31:55 -0700
Message-Id: <cover.1665142126.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Oct 2022 11:32:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171523

Add support to the install-buildtools script for the new make tarball.
I noticed this while adding documentation for new features in 4.1.

NOTE: also includes a bump to version 4.1; the side-effect of this is
that the new defaults won't work until 4.1 is actually released, but I
figured that was a reasonable tradeoff vs. only supporting what is in
4.0 by default.


The following changes since commit 5200799866b92259e855051112520006e1aaaac0:

  build-appliance-image: Update to master head revision (2022-09-30 10:39:16 +0100)

are available in the git repository at:

  https://git.yoctoproject.org/poky-contrib paule/buildtools-installer-make
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/buildtools-installer-make

Paul Eggleton (1):
  install-buildtools: support buildtools-make-tarball and update to 4.1

 scripts/install-buildtools | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

-- 
1.8.3.1


