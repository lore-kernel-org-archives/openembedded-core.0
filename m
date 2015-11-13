Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id D99B27730F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:04:21 +0000 (UTC)
Received: by lfdo63 with SMTP id o63so51918862lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 05:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FQhjhgzbjkFj4vL4qTkwgmjK8uXCLP/C/EcCZtd5CMs=;
	b=mThl7giejnPVN1JxYHcpeMeLgkfNesymT9RxtWf9/UHpLX36ZKh9+AAKyXSJ8Lyj2q
	way41BBn4HKcVpSk97daNaLLhaHoqRavLFPPk72Y58Vlx7MsOa0V+qTk8Xcj4tmHVW68
	k0FDc01RXAUZVNpm8Tee9KtY1pz6P+RuEJEzRowPMYl8KpjR5QDsh8XofNISUqDArPT+
	m4461viCJ5GBUxJUHe+vs5cog6c5JAN1kgaTWjGD45wUfCRrE9wFz/lHsOjnAXxIlc1D
	8wkSX+gR9kq7e30gIFuakljHd0szbMGX7pk3xdA2WLnrtOBgRcV/5Vw2a2v8iOG/FW2C
	jZvQ==
X-Received: by 10.25.157.85 with SMTP id g82mr10351493lfe.104.1447419861394;
	Fri, 13 Nov 2015 05:04:21 -0800 (PST)
Received: from localhost.localdomain (m83-185-243-97.cust.tele2.se.
	[83.185.243.97]) by smtp.gmail.com with ESMTPSA id
	tm7sm3077380lbb.38.2015.11.13.05.04.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 05:04:20 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 14:04:12 +0100
Message-Id: <1447419852-16281-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] image-live.bbclass: uses IMAGE_LINK_NAME
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
X-List-Received-Date: Fri, 13 Nov 2015 13:04:22 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Uses ${IMAGE_LINK_NAME} instead of ${IMAGE_BASENAME}-${MACHINE}.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 23e4a5c..4a7e2b7 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -7,7 +7,7 @@ SYSLINUX_TIMEOUT ?= "50"
 SYSLINUX_LABELS ?= "boot install"
 LABELS_append = " ${SYSLINUX_LABELS} "
 
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
 do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_bootimg[depends] += "${PN}:do_rootfs"
-- 
1.9.1


