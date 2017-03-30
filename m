Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D70D77CCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:06:25 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id f84so3680733ioj.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 11:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vddC+4AxX+3HP6IMzSaVFmGpLj5QaC9JoldB9bDnpqk=;
	b=VW6slaFazi96T73qp/XsThQfMjZQhpfluGLEOuz64dvPkt29BEaE4GAUhJn6WQ3fd1
	3DUEfP5OOMRWN+LnU/p7NjYXaOLc2C8+pzQA5LthhssFM68LdC+1G3xaQZjQaxvwsEfR
	qaew2umyCxLdY3b2dAfJEMcs2AfbC/vCTLybgT1j8vkOO8wpeQrKZs+r4Xp72813+12r
	SEaGkkBj9KaHNsjYYFsXhTWQK455P8O4ysBfHpc9056CgFpiilPCQkBXtvWN/we27zZb
	YUeXv7e+69z0lqm5mGm/HHGs9FC56E84w5DKuus3It4HxKpE7jEZCLPnQLSvriEOi+eH
	Rraw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vddC+4AxX+3HP6IMzSaVFmGpLj5QaC9JoldB9bDnpqk=;
	b=pG+A9o5+dABziqqrxz/fsF5IM/4dgbWq9oR1Ys4MXVfdBlAWjXyN9umxMIy+Yv4z/f
	/fVZ+QvSHLlqniAG8PGBJrGwBAJ5CdUirZl24xveS0lf5X2sf1HJoMwIx7hOU3Fd2fix
	iEjhaB1lDFb6U+7vcj6ynGGLIe/ybQllAeQXjeFBtapvs6JI4+kvwULnHEJCa5v2Wn9W
	cCAg65idYSUBMwV6VQLZB8dC/GigKz0xUlQ6o+B2xru6rNrwvy4OsicHxWtzjQwGNtgh
	hLODg6qFilFC6sVVYYH0Q+A4XRvdGI/Hw9LvTXZQ9H3GXzY1FG6NdJPqxIouvx2HExaF
	ynBA==
X-Gm-Message-State: AFeK/H0cI9+beTG4AT/jG551Va+XL5K4xJEmFUjhlwPXuVD0Lx28OjU7CO8lCTKtT5BYFg==
X-Received: by 10.107.135.74 with SMTP id j71mr1949472iod.171.1490897187218;
	Thu, 30 Mar 2017 11:06:27 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i197sm1745921ioi.7.2017.03.30.11.06.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 30 Mar 2017 11:06:25 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 11:06:20 -0700
Message-Id: <1490897180-19715-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] busybox: drop unmaintained _git recipe
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
X-List-Received-Date: Thu, 30 Mar 2017 18:06:26 -0000

The busybox _git recipe is not formally tested or kept up to date.
The gstreamer _git recipes were recently removed from oe-core and the
justifications for that change apply to the busybox _git recipe too.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/busybox/busybox_git.bb | 52 --------------------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox_git.bb

diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
deleted file mode 100644
index c2ee3e6..0000000
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-require busybox.inc
-
-SRCREV = "1b7c17391de66502dd7a97c866e0a33681edbb1f"
-# Lookout for PV bump too when SRCREV is changed
-PV = "1.25.0+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = "git://busybox.net/busybox.git \
-           file://busybox-udhcpc-no_deconfig.patch \
-           file://find-touchscreen.sh \
-           file://busybox-cron \
-           file://busybox-httpd \
-           file://busybox-udhcpd \
-           file://default.script \
-           file://simple.script \
-           file://hwclock.sh \
-           file://mount.busybox \
-           file://syslog \
-           file://syslog-startup.conf \
-           file://syslog.conf \
-           file://busybox-syslog.default \
-           file://mdev \
-           file://mdev.conf \
-           file://mdev-mount.sh \
-           file://umount.busybox \
-           file://defconfig \
-           file://busybox-syslog.service.in \
-           file://busybox-klogd.service.in \
-           file://fail_on_no_media.patch \
-           file://run-ptest \
-           file://inetd.conf \
-           file://inetd \
-           file://login-utilities.cfg \
-           file://recognize_connmand.patch \
-           file://busybox-cross-menuconfig.patch \
-           file://0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch \
-           file://mount-via-label.cfg \
-           file://sha1sum.cfg \
-           file://sha256sum.cfg \
-           file://getopts.cfg \
-           file://resize.cfg \
-           ${@["", "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]} \
-           ${@["", "file://mdev.cfg"][(d.getVar('VIRTUAL-RUNTIME_dev_manager') == 'busybox-mdev')]} \
-           file://inittab \
-           file://rcS \
-           file://rcK \
-           file://runlevel \
-"
-SRC_URI_append_libc-musl = " file://musl.cfg "
-
-DEFAULT_PREFERENCE = "-1"
-- 
1.9.1


