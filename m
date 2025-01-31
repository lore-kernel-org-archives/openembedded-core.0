Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69493C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.27489.1738351536031164209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=mmetxDod;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NiIKb2csB96OJUPmIqJDiuyH6u5vS/Ib4pOkr2nMMq0=; b=mmetxDodfJZbCGNG2VnSCZvBhW
	0L+u5mmWd1Z6ZoMzJpk7XbIx2QHQcGjlKv0L173kLxoeqmtmzevGZcEEunAMKMCk5vgTX0wKxOfJi
	PSLHDM45hP3bRaky6UcgRV35AZ9PJ7Umr9VG325P5UG9S1RmqfYkusRfN260T1KVrb+Z4tPNN45QI
	3fDdyIhbPYEStFMC8pO7FuXDSVklcPA9hgzy19kvYC3+gHbXW+270hXT99lRa1s7y74YfBh/UwOCL
	NBdf63WwboZ/Kbs3wT90oaFeu7pKNlwOXrKKbHw7xDe1lvIGJzYbJguLQpe42BcXgCFah859Z/A55
	wcFDd/PQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tdwdy-00FVbH-7l; Fri, 31 Jan 2025 19:25:34 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] unfs3: Use SPDX identifier
Date: Fri, 31 Jan 2025 20:25:22 +0100
Message-ID: <20250131192527.7449-5-bage@debian.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250131192527.7449-1-bage@debian.org>
References: <20250131192527.7449-1-bage@debian.org>
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 23:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210501

The unfs3 license matches the SPDX template for BSD-3-Clause.
There is no reason why this should be referenced as unfs3,
which is not a registered SPDX identifier.

License-Update: use SPDX identifier

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-devtools/unfs3/unfs3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index c5b7898b3c..0a274d6ffd 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -4,7 +4,7 @@ specification. It provides a daemon for the MOUNT and NFS protocols, which \
 are used by NFS clients for accessing files on the server."
 HOMEPAGE = "https://github.com/unfs3/unfs3"
 SECTION = "console/network"
-LICENSE = "unfs3"
+LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=9475885294e17c0cc0067820d042792e"
 
 DEPENDS = "flex-native bison-native flex"

