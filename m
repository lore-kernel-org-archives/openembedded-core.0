Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2DE116093D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 01:43:37 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id i195so3254170pgd.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Oct 2017 18:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=oaSk6IJG1sjmrWnR0rjlBsetYswIf3humik6dXw5UGw=;
	b=DLmK8GRGQDunbaCpc2ozzBl17bpHVU62Wlfecad92OZhN+ZDz+6IiLGiyoqHGM8jxw
	bnKUqcs4BLt5ihLfKffvZ0MpVfQL2+HNvqTNC5eMVRlw4LgyRQOyOEswTuikA99IRvCk
	hrmnJU9szd4YZ0N+wg8zpaD4TiSYhgSmuhRGCw90O8BPY3DZaKZMZBg6vW+UXyJHJJYd
	3rZQpzEKRlQ6yJgF3cQMBLlM8YCu1TqMbNkZx3htizcxo8NNNptAWcoDiNMcoIxq6nfm
	EkXBEYHlZJ9eFv0sO7G/UI5XW8TV9/UYZTMM1k7K0Qf/E/e66Re6dEy4fACxjgBj5RPL
	gjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oaSk6IJG1sjmrWnR0rjlBsetYswIf3humik6dXw5UGw=;
	b=HGXaxKOjglvQk6z4/jAvopPbD07lnAugdIofNJjS5AVE+E21j551HGcNJ6NoTU/Ldz
	F2C8LV34uBkrkrusydkmoaNMVWZMYhOQrvHW2yaTpn+ZsW9e4T/aAnisMtYjLlLHgU2Q
	NheHPG+dBFrnqfott8m7/hzg22CK5/rUI3vbHYoX2M/ztavHczA0FOBEENnggruj+o2g
	/3kca5Evjto2GOXoKyw6p0fGLwmBmeAndBLxmcT5AYC0oBoYOFiSGCDAMtP8kKHt9c72
	4JNJpe/e8u48WAmKKSSCHHq1UABQO3H16H7EA6f6/Giit1E5c9sbJgEUqE0Eas82GG9u
	Px4A==
X-Gm-Message-State: AMCzsaXVLrYFV40hJHfXa6EHm+CaX7h3yAXGAGuIDsBsEcRqZJbKOx48
	B0UwpV7tkmOMK301akhSBbpOyA==
X-Google-Smtp-Source: AOwi7QCAUPIkswW8V7vOm+H5MqpXbaLXKQLFlu7rVBEwAsjrpblxGdXQttZJfxTdmATRMKACvlyirw==
X-Received: by 10.99.101.135 with SMTP id z129mr11397142pgb.75.1507081418884; 
	Tue, 03 Oct 2017 18:43:38 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v10sm24568822pgf.8.2017.10.03.18.43.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Oct 2017 18:43:37 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Oct 2017 18:43:32 -0700
Message-Id: <1507081412-1114-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: drop unreferenced uclibc specific agetty -> getty patch
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
X-List-Received-Date: Wed, 04 Oct 2017 01:43:38 -0000

The patch is uclibc specific and reference to it was removed from the
systemd recipe in:

  http://git.openembedded.org/openembedded-core/commit/?id=653704e9cf325cb494eb23facca19e9f05132ffd

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...r-getty-to-agetty-in-console-setup-system.patch | 44 ----------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch

diff --git a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch b/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
deleted file mode 100644
index 951a28d..0000000
--- a/meta/recipes-core/systemd/systemd/0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 8736d9b9bb492f60e8f3a1a7fb5a05ba3201d86b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 20 Feb 2015 05:29:15 +0000
-Subject: [PATCH 02/19] units: Prefer getty to agetty in console setup systemd
- units
-
-Upstream-Status: Inappropriate [configuration specific]
-
-Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- units/getty@.service.m4        | 2 +-
- units/serial-getty@.service.m4 | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/units/getty@.service.m4 b/units/getty@.service.m4
-index 5b82c13..e729469 100644
---- a/units/getty@.service.m4
-+++ b/units/getty@.service.m4
-@@ -33,7 +33,7 @@ ConditionPathExists=/dev/tty0
- 
- [Service]
- # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I $TERM
-+ExecStart=-/sbin/getty -L %I $TERM
- Type=idle
- Restart=always
- RestartSec=0
-diff --git a/units/serial-getty@.service.m4 b/units/serial-getty@.service.m4
-index 4522d0d..e6d499d 100644
---- a/units/serial-getty@.service.m4
-+++ b/units/serial-getty@.service.m4
-@@ -22,7 +22,7 @@ Before=getty.target
- IgnoreOnIsolate=yes
- 
- [Service]
--ExecStart=-/sbin/agetty --keep-baud 115200,38400,9600 %I $TERM
-+ExecStart=-/sbin/getty -L 115200 %I $TERM
- Type=idle
- Restart=always
- UtmpIdentifier=%I
--- 
-2.10.2
-
-- 
1.9.1


