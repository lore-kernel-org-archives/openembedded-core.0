Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4617E619
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:31 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id c85so6714775pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JvevulqLWBPgeWVBKQ/JS0NGdFFKO4tga43GvJXkqyw=;
	b=h7Pzb2j4O1k1CaAJYbBRUx0+uzMP0Iqj8UqORPX4l/qbkQOwVKZg+Nw4ehBLrUNs0d
	8UIkT4pUWy98A0hAj1v/fjjPcEhQS0ooku5tGrT+9rMytIeL2IEEyyJEYmTO+e2tZhpU
	qy19prFqIbUPNqFs/5CCL4cdE1nTXUMuA5rw1bIYqJWYVGZb0+xZd8ZoxI/CGYyW5Go8
	gxM7O7YUAOURtydj2LAgWfc+Kr65fR/Y5iSmyazrs3HhwDFn9uouI4h6V6N2OaUrOpkn
	f22BSAvW3jI2jsN740/O7EMTq0EAqP6G0LVaciF+a7fSrP5KxE6JBUWR9h6/jgHb+NgU
	vFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JvevulqLWBPgeWVBKQ/JS0NGdFFKO4tga43GvJXkqyw=;
	b=hBT9NwF3KdCmWATbomw2oeYNBlqiNq7LkdmadSE8ebpZplHEmYGnrN8PMB3y17Vpz/
	v7uGlPJcdzaxlgPWENAGmxicKlAabZkyhKX9io3o/dc1IcDqZ0t4IAcDo4+Nca9YJ2L0
	htCqI7stEfRlMe2EZvbtB7Udtj+h5Iyn1E19s0stniprfgw3Qig7Oh0WK6ftnZARe20D
	Jnu4hgAKNM8gRT3gTC3O1mJytlmyEtsKy5BaL13ySLXuVWgJ1b0c/wPA/ft0YuEJ571P
	V7NaqrMIgbu+QMDl3fbWTdAOTUq4Gz2mFEpJFRouLqCidRdj3/8LCIikpHPwA6Q9HVTj
	Sw2A==
X-Gm-Message-State: APjAAAXIKPCe/OOzLJ0J0OD251/ChO9xneodfEBRDQS5LqE5EXO48t9p
	y4eXrBHcfPgaoWrDymVBpi4bQtPCiHk=
X-Google-Smtp-Source: APXvYqxE7CaQiBs+eSjOWiuw72VrxR7epe6gX9215MNsx8a9beRDqxDg/twCgPSSyjt7o12Ex/peDQ==
X-Received: by 2002:a63:8b44:: with SMTP id j65mr19471480pge.241.1561348473064;
	Sun, 23 Jun 2019 20:54:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:32 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:10 -0700
Message-Id: <3942fa41ac32afd9741b2602c4d1213c6d7d2093.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
Subject: [Warrior][ 11/19] rootfs: Fix dependency for every dpkg run
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:32 -0000

From: Ricardo Ribalda Delgado <ricardo@ribalda.com>

Avoid getting a warning on do_rootfs.

Fixes:

NOTE: Installing the following packages: libgdk-pixbuf-2.0-locale-en-gb glibc-locale-en-gb libatspi-locale-en-gb gstreamer1.0-locale-en-gb gtk+3-locale-en libatk-1.0-locale-en-gb gtk+3-locale-en-gb gstreamer1.0-plugins-good-locale-en-gb gstreamer1.0-plugins-base-locale-en-gb gstreamer1.0-plugins-bad-locale-en-gb libglib-2.0-locale-en-gb avahi-locale-en-gb vte-locale-en-gb xkeyboard-config-locale-en-gb
WARNING: Unable to install packages. Command '/workdir/build/tmp/work/qt5122-poky-linux/bottlecam-image/1.0-r0/recipe-sysroot-native/usr/bin/apt-get  install --force-yes --allow-unauthenticated libgdk-pixbuf-2.0-locale-en-gb glibc-locale-en-gb libatspi-locale-en-gb gstreamer1.0-locale-en-gb gtk+3-locale-en libatk-1.0-locale-en-gb gtk+3-locale-en-gb gstreamer1.0-plugins-good-locale-en-gb gstreamer1.0-plugins-base-locale-en-gb gstreamer1.0-plugins-bad-locale-en-gb libglib-2.0-locale-en-gb avahi-locale-en-gb vte-locale-en-gb xkeyboard-config-locale-en-gb' returned 100:
Reading package lists...
Building dependency tree...
Reading state information...

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oe/rootfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9358f56..c62fa5f 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -647,6 +647,7 @@ class DpkgRootfs(DpkgOpkgRootfs):
             if pkg_type in pkgs_to_install:
                 self.pm.install(pkgs_to_install[pkg_type],
                                 [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+                self.pm.fix_broken_dependencies()
 
         if self.progress_reporter:
             # Don't support attemptonly, so skip that
-- 
2.7.4


