Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665E5C0218F
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web11.27487.1738351534270740559
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:25:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=I+fTXCc0;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qyTmxSBoznfXPeUp1wwzpkJNxWzSfJMh1w4DQnlW+gM=; b=I+fTXCc0zstH75DOxXexC0rZ1X
	C1ur91RV7fY1Ij+rn3+RqlFSJgnGVE1oizGjppUx2aFe3Bg9qhHixeyF0meLzoTcY5nB8cla38f3c
	TCJAl1I13Sz/yCJfO+f0/O47dPpjeigLIO7g8kH3msLooY26sndRNwCbLC6OHgTGJKnhQV/U6Qrru
	6Bamw13KMBWElvJtWd/MVXarfIrHngQU83F6k2beoNLXPB/W/MEeHWdJeCinOoL3nd0/oqgeem0ze
	wYZNr5v9ofZ8uyMjTvWZUV4E5bsuF5ReRXf0qUfqAA7vHcUZLpLU9AW1OFTxECUyrUQFTEESPzI2u
	ISxlAgqQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tdwdv-00FVbH-TB; Fri, 31 Jan 2025 19:25:32 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] hwdata: Use SPDX identifier
Date: Fri, 31 Jan 2025 20:25:19 +0100
Message-ID: <20250131192527.7449-2-bage@debian.org>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210497

The XFree86-1.0 (non-SPDX) license and the X11 (SPDX) license are the
same. Reference the X11 license in hwdata.

License-Update: use SPDX identifier

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/recipes-support/hwdata/hwdata_0.391.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/hwdata/hwdata_0.391.bb b/meta/recipes-support/hwdata/hwdata_0.391.bb
index e4b8c59c59..b2fa87c275 100644
--- a/meta/recipes-support/hwdata/hwdata_0.391.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.391.bb
@@ -4,7 +4,7 @@ configuration data, such as the pci.ids and usb.ids databases."
 HOMEPAGE = "https://github.com/vcrhonek/hwdata"
 SECTION = "System/Base"
 
-LICENSE = "GPL-2.0-or-later | XFree86-1.0"
+LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"

