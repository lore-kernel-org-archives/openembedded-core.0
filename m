Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBD1D74E98
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 10:29:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o13-v6so2063035wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=DPttuOTvTWgAfrqbiUQFUdmW5y6euZ6megM6eQR0Juw=;
	b=rKWgHzpnS+Lod1t3Z9YzN7LybQq1LgI6uzJ0NE4aU4J7E+hrDalX9JBbopudPIjTIb
	Oeey350RphF9oS/J+nxs/vw9BRBuWqG2UHpUNV+MpbtAW4NJCvBiWBJPpKMEP6XDcsLw
	90eYfnkrDqTBhQwRC/QisNPlPMHX7UqpSR1pPXvQUIVdMy6VaW8EQ/XE1bBCoZtyKX62
	q4+snR0/+SGiggPt4zHnI6qQ3T08Xjk0OSmz/05r90p4rYiwXlb7TlUkBQPQgDbJectF
	SuijfmAJO1HaOYpuGLXf53y9h75fEiNX2cEwRbSl5dRljigcPQ41jODWtbz7WgkR4eUy
	BWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=DPttuOTvTWgAfrqbiUQFUdmW5y6euZ6megM6eQR0Juw=;
	b=L/WoTl6vzIh7UBNDtbJP23q4Hjr5LMrNjrCYobaWfzroyKG5GhYul4pi3y/Is8bxEX
	FrIwIfvoKsszTQ/bcwJsXsJzP80asEqB7goE2vTqskQwa2UXz0dUdTXiJXeUrcBPgRNo
	JpIQGx3aU6yddvEWgLQ0wxkYsBDJYyHg84CtFTezng59ggPiGQk0qxGu4CABT6JEfDQ7
	N3FO6/7iaj4QBgxgbGBnb1dSn7GcSNnVvSpd6luyrPE+wY+E6tKt9HKZWkr+KR/XoP48
	+bMmY17wuS0/YPSSgQtRa1uMo9EujCipUQvLeIIblucksQklUSkRRi9I2neOp3BfoKct
	/wkg==
X-Gm-Message-State: APt69E0UdSMrQTfuZ+uDGpCRt45ksj3ZJGcosracP7uDz1cvkTSXA8Dn
	tJ7/4xRDD5/+f0+MLcaf+hbRpg==
X-Google-Smtp-Source: ADUXVKI7ZyIYowcKaE3G4vsJ3CBeN1+Ii/7NtXgx3ZhjewogfV8kMlh0z0JcuxP0tdLNYq/gxiZITA==
X-Received: by 2002:a1c:4189:: with SMTP id
	o131-v6mr2117739wma.7.1527848984034; 
	Fri, 01 Jun 2018 03:29:44 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o16-v6sm21736523wri.67.2018.06.01.03.29.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Jun 2018 03:29:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 10:29:37 +0000
Message-Id: <cover.1527848868.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [master][PATCH 0/4] QEmu upgrade to 2.12.0 and switch to libsdl2
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
X-List-Received-Date: Fri, 01 Jun 2018 10:29:44 -0000

The following changes since commit 760103cdaed3e820888d8984ec0b76cfc831d534:

  nativesdk-rpm: Add wrappers for nativesdk support (2018-05-29 21:06:03 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/thud
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/thud

Martin Jansa (4):
  qemu: refresh patches with devtool and make them applicable with git
  qemu: upgrade to 2.12.0
  qemu: add PACKAGECONFIG for virglrenderer, usb-redir and spice
  qemu: use sdl2 instead of sdl1

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  14 +-
 ...4-treat-DISAS_UPDATE-as-variant-of-D.patch |  67 ---------
 ...allow-user-to-disable-pointer-grabs.patch} |  42 +++---
 ...mu-Add-missing-wacom-HID-descriptor.patch} |  24 ++-
 ...est-which-runs-all-unit-test-cases-.patch} |  12 +-
 ...-environment-space-to-boot-loader-q.patch} |  17 ++-
 ...patch => 0005-qemu-disable-Valgrind.patch} |  18 ++-
 ...searched-during-user-mode-emulation.patch} |  34 +++--
 ...d.bfd-fix-cflags-and-set-some-envir.patch} |  14 +-
 ...connect-socket-to-a-spawned-command.patch} |  51 +++----
 ... 0009-apic-fixup-fallthrough-to-PIC.patch} |  14 +-
 ...ebkitgtk-hangs-on-32-bit-x86-target.patch} |   9 +-
 ...r-fix-mmap-munmap-mprotect-mremap-sh.patch | 141 ++++++++++++++++++
 ...-libcap-header-issue-on-some-distro.patch} |  15 +-
 ...messages-when-qemi_cpu_kick_thread-.patch} |  13 +-
 ...2Queue-pointers-in-post_load-routine.patch |  63 --------
 meta/recipes-devtools/qemu/qemu/memfd.patch   |  57 -------
 .../qemu/{qemu_2.11.1.bb => qemu_2.12.0.bb}   |  33 ++--
 19 files changed, 317 insertions(+), 323 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
 rename meta/recipes-devtools/qemu/qemu/{disable-grabs.patch => 0001-sdl.c-allow-user-to-disable-pointer-grabs.patch} (74%)
 rename meta/recipes-devtools/qemu/qemu/{wacom.patch => 0002-qemu-Add-missing-wacom-HID-descriptor.patch} (87%)
 rename meta/recipes-devtools/qemu/qemu/{add-ptest-in-makefile-v10.patch => 0003-Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch} (65%)
 rename meta/recipes-devtools/qemu/qemu/{qemu-enlarge-env-entry-size.patch => 0004-qemu-Add-addition-environment-space-to-boot-loader-q.patch} (66%)
 rename meta/recipes-devtools/qemu/qemu/{no-valgrind.patch => 0005-qemu-disable-Valgrind.patch} (47%)
 rename meta/recipes-devtools/qemu/qemu/{pathlimit.patch => 0006-qemu-Limit-paths-searched-during-user-mode-emulation.patch} (78%)
 rename meta/recipes-devtools/qemu/qemu/{qemu-2.5.0-cflags.patch => 0007-qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch} (45%)
 rename meta/recipes-devtools/qemu/qemu/{chardev-connect-socket-to-a-spawned-command.patch => 0008-chardev-connect-socket-to-a-spawned-command.patch} (87%)
 rename meta/recipes-devtools/qemu/qemu/{apic-fixup-fallthrough-to-PIC.patch => 0009-apic-fixup-fallthrough-to-PIC.patch} (80%)
 rename meta/recipes-devtools/qemu/qemu/{linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch => 0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch} (87%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch
 rename meta/recipes-devtools/qemu/qemu/{fix-libcap-header-issue-on-some-distro.patch => 0012-fix-libcap-header-issue-on-some-distro.patch} (88%)
 rename meta/recipes-devtools/qemu/qemu/{cpus.c-qemu_cpu_kick_thread_debugging.patch => 0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch} (87%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/check-PS2Queue-pointers-in-post_load-routine.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
 rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb => qemu_2.12.0.bb} (51%)

-- 
2.17.0


