Return-Path: <djszapi@archlinux.us>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1BABB618BC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 22:31:33 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id k13so4250925wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2013 15:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=TOhxEnFUO1DfybNUYhJ9EGd7T+SfPY9U3U4IkQj5VF8=;
	b=Xy/uA4dkSGn2+P64isi6fab6PJW7kfdSANfj2/t5WzWjukWM7Qcjtpr/yXqYWomoC/
	ZsMQGQeWf0ABhcKpWb88ybp/3FPmF+3JB2Q1nBq0YsoXE+kyfPKxV9xaQNYqbrhuEaYi
	SSkqZvxTmvtHfqMTIbupXTrQF4kbOGYPE6yODobX9aeJ8J408Pf+5rm1hBL0Zchvj4Xb
	TGiJtaW0/hIYMe3uXxcFY8+7uRSOsgUMbz7TXMQ9f1R/wiwO14pSjjEpcIxiBRyQ1+0K
	/tQpdjD67neSz6bml50JTuD12Vy5EX4AvOLkZeW3ghe0Q/Gi0prFC13vyZUXX7B4EKrr
	IdrA==
X-Received: by 10.180.210.231 with SMTP id mx7mr5327929wic.5.1375050693778;
	Sun, 28 Jul 2013 15:31:33 -0700 (PDT)
Received: from archlinux.us (cpc11-cmbg15-2-0-cust30.5-4.cable.virginmedia.com.
	[86.30.245.31])
	by mx.google.com with ESMTPSA id fs8sm18916970wib.0.2013.07.28.15.31.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 28 Jul 2013 15:31:32 -0700 (PDT)
Sender: Laszlo Papp <djszapi@archlinux.us>
Received: by archlinux.us (sSMTP sendmail emulation);
	Sun, 28 Jul 2013 23:31:46 +0100
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jul 2013 23:31:36 +0100
Message-Id: <1375050696-1477-1-git-send-email-lpapp@kde.org>
X-Mailer: git-send-email 1.8.3.4
X-Gm-Message-State: ALoCoQnUgrdBG4fNq9QMGn61p7/rIxe6oafoxhmtWTuQmlXfISZ9fy60N1qbnNlBKbZEzXC1B1nX
Subject: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Sun, 28 Jul 2013 22:31:34 -0000

This is necessary to get the build going, for instance with older Code Sourcery
compilers.

It is also disabled in upstream due to this very reason. The details can be
found on the following links:

http://comments.gmane.org/gmane.linux.busybox/30999
http://git.busybox.net/busybox/commit/?h=1_21_stable&id=1cd769a154b04f4b058beed482a5dd7192437cdc

[YOCTO #4932]

Signed-off-by: Laszlo Papp <lpapp@kde.org>
---
 meta/recipes-core/busybox/busybox-1.21.1/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox-1.21.1/defconfig b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
index bdfdadf..e77a817 100644
--- a/meta/recipes-core/busybox/busybox-1.21.1/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.21.1/defconfig
@@ -705,7 +705,7 @@ CONFIG_MICROCOM=y
 # CONFIG_MT is not set
 # CONFIG_RAIDAUTORUN is not set
 # CONFIG_READAHEAD is not set
-CONFIG_RFKILL=y
+# CONFIG_RFKILL is not set
 # CONFIG_RUNLEVEL is not set
 # CONFIG_RX is not set
 # CONFIG_SETSID is not set
-- 
1.8.3.4


