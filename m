Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAF96E849
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 00:47:15 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id y10so2599469pdj.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 17:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=OgImDitKuzit/UNcpcB779mdp+Jh9kDii9uU/KbRSWw=;
	b=nV16DltIvU06iLCloBYe8dMO4xWahCU3Sp0E6wRMPaQATFcSXZqR2JnNx1c164XZsS
	L1YSKltUBAPuVllf7em8HOaJ1TE4+4s96o+EphrwwBKAw/kPDOjhZGfrL2l6+dV9eLc8
	lzPkLjuEVh7I1SkDS+IIDUTRVN4gx+5tHOViwNK9BdtXNccI/XENyeiCuxlqeAHjjuhc
	52qoAhUtiuY5/dBf2E4a3DVnpr8CMg8YuWKESuub6dJrcWB0vETetFNyn2ngtIET5l+I
	IOBD0emM2k4C3QQzWS+khvtsJ+wTh5/GGpECc0SSD0SeGsz/vxPBwZP/b2OtWgZJMFCZ
	jemg==
X-Received: by 10.68.212.10 with SMTP id ng10mr91133643pbc.95.1395881236271;
	Wed, 26 Mar 2014 17:47:16 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id my6sm894762pbc.36.2014.03.26.17.47.14
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Mar 2014 17:47:15 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 11:53:06 +1100
Message-Id: <1395881586-18248-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] systemd-serialgetty: update to match systemd 211
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2014 00:47:16 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 46c15ed..865de34 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -31,3 +31,6 @@ TTYVHangup=yes
 KillMode=process
 IgnoreSIGPIPE=no
 SendSIGHUP=yes
+
+[Install]
+WantedBy=getty.target
-- 
1.9.0


