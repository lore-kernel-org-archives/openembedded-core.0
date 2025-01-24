Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7933DC0218B
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 21:04:30 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.2151.1737749251416834149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jan 2025 12:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=M8ugeIal;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fm5wdc++RAnFSKmPHD/irl3esDQAMxJ6EDT8yd0Scsk=; b=M8ugeIalIc215Wo6kwGZU5XLBO
	D+LnHouR63XkR0BGnxZa2GW4h6ANO8xysT1fGgDzjpOolVD/Xc5CQzyqVohxsIV6mGr/kiZY2hfIp
	g5+vfZ6ADFQgSuTJAhLH84DuMtfcaf6jBIcmUDFJs1vw5Z8Qvc5cuDfvGeDVTaT6KymwkqrbdlvKy
	dISU8JkzmkQDkOV5ttd9eK/FPU2TJ8JmBnkDH5g/W0/dQc/byFxfFvnKknJYaMgO70V3zOQLecdDT
	Ii0ZbZyI6QPfHCkv3hDPySTZSlEphOu5gKzUvUbicbchRyexPBUgXR8SE0YrTqdH1TGU3gBJq+qQG
	lGk82b9w==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tbPxg-009cFn-Om; Fri, 24 Jan 2025 20:07:28 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] busybox: Correct SPDX license reference
Date: Fri, 24 Jan 2025 21:07:23 +0100
Message-ID: <20250124200723.14829-1-bage@debian.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Debian-User: bage
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jan 2025 21:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210251

Commit 6238ee3ecd (recipes-core/busybox: fixup licensing information)
claims that there is no applicable license identifier in SPDX, so a
bzip2-1.0.4 is made up.

There is no bzip2-1.0.4 license defined in SPDX. However, bzip2-1.0.6 is
the same license.

License-Update: wrong SPDX identifier

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-core/busybox/busybox.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index f778cff0f4..cebfd3c48c 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -7,7 +7,7 @@ DEPENDS += "kern-tools-native virtual/crypt"
 
 # bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPL-2.0-only & bzip2-1.0.4"
+LICENSE = "GPL-2.0-only & bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
                     file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 

