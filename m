Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1788C433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 15:28:16 +0000 (UTC)
Received: from avasout-ptp-004.plus.net (avasout-ptp-004.plus.net
 [84.93.230.250])
 by mx.groups.io with SMTP id smtpd.web10.68653.1638890893448698998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 07:28:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=P2S8ODKX;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.250, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id ucNxm3g6oKDv1ucNymzXrd; Tue, 07 Dec 2021 15:28:10 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=L5N+/8f8 c=1 sm=1 tr=0 ts=61af7d8a
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=IOMw9HtfNCkA:10 a=-An2I_7KAAAA:8 a=D9tCBEehAAAA:8 a=Q4-j1AaZAAAA:8
 a=RcEuB9nQWAxeBguyxTMA:9 a=Sq34B_EcNBM9_nrAYB9S:22 a=Q0Uz2dhPmm7nD8Nyg-vj:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description; bh=v6FrQ7UkZDqVmIoWuMydXHChcPAXcpXfCvmnhBeT7J0=; b=P2S8O
	DKXG7m+kcY9ZrGpEVbZMzXUEqQwy+V50LbJShBhmBqiYvx56rSuwLs0g1yuL1YvsEGaa/B1G7mX7U
	dW/iDKXO8UKP1kdddN3+bVa7me9gZ87G2Nu2RA725oVX4ner4IZbTvps+YN+TybJr95aRKzUKvIDy
	VB+CQhkVZfzJTr7gTGTybPntrKI6a2SOjxdfSCxRvLiVFObc7JKazBFe89Ulg4Jxmy/2ftc5Od08S
	Zkwg6RC2galGWwxV9Ro92jIBIk97bkAfaLik7jvK2+jtgv5c2D6zmGJ9uin7PwENp1+FWfc+6wYoe
	3yKQXqWOpNcnYJgSuFGT88hRX6GVA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1mucNo-00GIaa-65; Tue, 07 Dec 2021 15:27:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>,
	Phil Blundell <pb@pbcl.net>
Subject: [PATCH 2/2] documentation: Document PACKAGE_SNAP_LIB_SYMLINKS
Date: Tue,  7 Dec 2021 15:27:36 +0000
Message-Id: <20211207152736.1294364-2-mac@mcrowe.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211207152736.1294364-1-mac@mcrowe.com>
References: <20211207152736.1294364-1-mac@mcrowe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: 
 MS4xfE7PKEBqVgS5l6o/jHJOkdvy8AANbDeEqwnlJOW8VmetScGU2hiiGreok97vZvIB6HvBgNAgrHIXFwuBLDqksJQLPzMYlXl7rPDzH2l8yny9Fv3TqHy1
 TP7+AAAeOrqExaMC7RdYmTwAgAElye+1Kd06I6rhvBaoL/ebHkJ+6lh2Xp16uPHy/PSr1sxRaS2ZaoHdqjoi8J3kOXKH6bGnAcw=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 15:28:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159307

PACKAGE_SNAP_LIB_SYMLINKS was added[1] originally to OpenEmbedded in
2008 and then to oe-core in 2011[2] but appears to have evaded
documentation throughout that time. Let's add something that at least
gives some clue as to what it does.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
Signed-off-by: Phil Blundell <pb@pbcl.net>

[1] https://git.openembedded.org/openembedded/commit/?id=cf7114179ead8ddff8f66e84d630811920ac9add
[2] https://git.openembedded.org/openembedded-core/commit/?id=600dbb7cb384c2290af38b993a9bea3a4dfc4494
---
 meta/conf/documentation.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 45cd01374a..f63f4b223a 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -315,6 +315,7 @@ PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed p
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
 PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed. If a listed package fails to install, the build system does not generate an error. This variable is generally not user-defined."
+PACKAGE_SNAP_LIB_SYMLINKS[doc] = "Rename library files based on their SONAME to avoid an extra layer of indirection through a symlink. Only suitable for a read-only rootfs where libraries are not upgraded in place."
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
 PACKAGES[doc] = "The list of packages to be created from the recipe."
 PACKAGES_DYNAMIC[doc] = "A promise that your recipe satisfies runtime dependencies for optional modules that are found in other recipes."
-- 
2.30.2


