Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1451.1793986358425291136
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=idILJxW8;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so212077241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986357; x=1794591157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OrMvgBHmNXzGRfMdV77qbRwTGVSzJihBUTRb6o3D+bY=;
        b=idILJxW8LFWUI5GbP2DyFhgCb7TMOoHU6OAG6UzqSTqlDhLH0fwmm79QeSAET9MiAt
         3xusSnlAj9MgJaX21BBzkwrXAW8UbWwLb4k+z8wmoKTkQj1m7mBQlY0GNEOXHPHIrvki
         5HzfS5khuMOfY4MSMTwieUhgvViURzdlGPJGIDJh6qbN/BFoHv/Hn78UrbP9onmyUbqP
         K55HCfjS3U6Au83PbwG/p0BvIsEJ3V7ZDFAghSNCgsiS9hYmAiZoQycMVJpXd4qJu9Ol
         +y5JFFCXx5xv2Y5scn1vM7g6DFC0wHrHBepeSWiiPKPmhEB/reEcFKm5gJQXBgfraA77
         pGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986357; x=1794591157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrMvgBHmNXzGRfMdV77qbRwTGVSzJihBUTRb6o3D+bY=;
        b=jR29yEluZ6hQU1LR5K7g6G7zUac+++9c9lrSyiiOst05dc4gfXrAdhEfNWaCXvhxFs
         mpyE1OMUhTL3tNmTJ63pQ9r2vRBz/cFXUe/VtWhVgiSkBBaZ6yMgxbm1SEzxs2uadD9n
         179IC5yZxPiVzqCC0kgKlgyRJuv9wg62TCxuG4qiiJ4/atu7HYxFp6rrkHvp8jMGRYi9
         iLr3w/V7Z75vo8b/Qqv58FePUJCGjOXq9FwI3fSi1eWWdnSuGCyt2uvp0iz68AeNKDD0
         ADKJyTaH9NBHxkXyXkFPNKINXoQIkULPV4ATYdD6K+ZVBm14h6YKH6/4j+1w7pItAR0n
         CZcw==
X-Gm-Message-State: APuU4Z+bdI0P6bgESV87iryaUs4LiPoeNgIRcfIMglEeg1sDX4Jj+/Wk
	ZjrNxhrjULxkc+oBMF43s1nDZR0QWfRXPAKLKWN6ouUbiPzN8Tf/H8qAKAu8yg3o
X-Gm-Gg: AYBFou0YMIfncbifV8siHtpUfGV/Jq4Wzb2MFresQE2cWRrKyZBy7RzwKs93kKUifFJ
	MgtZ7Ssgdh4W/L0OP7Tfje2RewbDrt+brks9WW0X7oJ8YVp9RzDtSzjyMCa3BIrAAjiMNcxaVC2
	YAwrFSr4cOxV576Iocmo2YMJ4QW5/JvQuXGWkvx0IBOmWnB4mcn6yJjxHjYld01dCStn+I7ja1Y
	AiR4MVgEZyINfspzP9ky+nQ/esPrd/Gy4hvmxS1NAOf7zv6dQ9jYk0AdNXeuZB2S8YVBfAuDEC8
	EtwUryjWct+eb63QV8kyg+gqD8PpiRF3COFfMtvwiRitFE7XeO1ClDhalbxB9KE5SIlp2WSRKJ+
	JrRsM2OqK+DJyo+0cYmKop8x3R1Obo6MI64ajmUrW0INqTY7XdH7FekJ/7tTIV9jkI7XQwEziPK
	CBm5qwnHHYl02eSSqR3EaMX+qqKvwSZV68bJiW1rtIvQkakec/SLijUe2sjc3blfCBxk3KoxS1/
	ZpgiYbWnGpL+CcWE9f3goYAupNvb3E2G3Dnv857GIgydC8IuSCztZltpEpUG/VzAfqSUKTQPWIx
	xEsc5wHE85i4hu57x02JVy9D8yes8LREdTjNroXRyNdkRdhRTG9Er8mExFlGb/B1JGQkLs4JClD
	ky1S5JBdoiWZW+EaUUnle3ILjjnlwytgZD/YSgy4XiIboD6f+oeOzLVV8kwIQWs+qtbt0i0UjZ4
	h8vMuYzX5X6jGO06IsDTvdCAsQVfW4ZMHScSCk6wcFsu19SQ==
X-Received: by 2002:a05:6123:6e:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5ecc441bed1mr1594932e0c.15.1793986356816;
        Fri, 06 Nov 2026 09:32:36 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:36 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 0/8] enhance kernel -devsrc output options
Date: Fri,  6 Nov 2026 12:32:27 -0500
Message-ID: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249700
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

This RFC follows on from the "Fix kernel complementary package
installation" thread with Adrian, and covers the use cases listed there:
debugging a kernel built for a specific MACHINE, from a debug rootfs on
the host (TRACE32 and similar), or on the target.

kernel-devsrc today is what is needed to build out of tree modules on
the target ('make scripts prepare'): headers, Kconfig/Makefiles and
scripts. It has almost no .c files, and installing it pulls in the build
tools (bc, bison, flex, gcc-plugins, openssl-dev, ...), which aren't
wanted in a rootfs-dbg.

Adding another source package just means more maintenance and
complexity.  We can keep the tightly curated kernel-devsrc as the
deafult, and add to it via packageconfigs. kernel-devsrc stays one
package and one tree at /usr/src/kernel, where the debug info points,
and PACKAGECONFIG chooses what goes in it:

  build:   what kernel-devsrc is today, with its RDEPENDS. The default,
           so nothing changes for existing users.
  source:  a curated spine (core directories plus the machine's arch),
           and the rest of the files the kernel build read, from a
           manifest of kbuild's .cmd files that kernel.bbclass now
           stages. No RDEPENDS.
  full:    the whole tree.
  tarball: the whole tree as a tarball, to unpack elsewhere.

They can be combined: "source build" gives both the source and what is
needed to build modules on target. With 'build' and the whole tree, the
tools to build the kernel itself are added to the RDEPENDS.

The package can optionally be versioned (kernel-devsrc-<release>, with
kernel-devsrc holding just the /usr/src/kernel link), so the source of
more than one kernel can be installed side by side.

The patches:

  1:   maps the kernel's build directory to KERNEL_SRC_PATH, so all of
       the kernel's debug source paths are under /usr/src/kernel.
  2:   stages the manifest of the source files the build read.
  3-6: the kernel-devsrc levels, versioning, and a check that at least
       one level is set.
  7-8: two general oe-core fixes, for issues I noticed in the debug
       rootfs while working on this support. They aren't kernel
       specific and don't depend on the rest of the series:
       postinsts of debug only packages being registered against the
       image, and IMAGE_INSTALL_DEBUGFS packages with broken
       dependencies being silently skipped.

With:

  PACKAGECONFIG:pn-kernel-devsrc = "source"
  IMAGE_INSTALL_DEBUGFS = "kernel-dbg kernel-vmlinux kernel-devsrc"

on qemux86-64 (7.2.13), rootfs-dbg gets the symbols and 254MB of source
at /usr/src/kernel, and no build tools. All 9016 source files named in
the kernel's debug info are there. The only ones missing are the 592
generated files from the build directory. The full tree is 1.5GB.

One thing to know: if the image itself already installs kernel-devsrc,
IMAGE_INSTALL_DEBUGFS won't put it in rootfs-dbg. rootfs-dbg starts from
the image's package database, so it is seen as already installed, and
only the debug files are copied over. That's how the debug rootfs works
in general, but it will need documenting.

Tested on qemux86-64 (7.2.13), core-image-minimal:

  build (default): same content and RDEPENDS as before.
  source build:    the build content plus the source.
  build full:      the image builds, and on target both
                   'make scripts prepare' and a full kernel build work
                   from /usr/src/kernel.
  build tarball:   the tarball unpacks on target, 94915 files.
  source:          in rootfs-dbg via IMAGE_INSTALL_DEBUGFS, as above,
                   with no build tools in either rootfs.
  versioned:       kernel-devsrc-<release> holds the tree, and
                   kernel-devsrc only the /usr/src/kernel link.
  no level set:    the recipe is skipped with an error.

kernel-devsrc package sizes, same build (installed size, and the rpm):

  level             files  installed     rpm  RDEPENDS
  build (default)   13623      79 MB   20 MB  module build tools
  source            17590     254 MB   61 MB  none
  source build      24022     283 MB   69 MB  module build tools
  full              94915    1618 MB  251 MB  none
  build full        94935    1630 MB  253 MB  + kernel build tools
  build tarball     13623     278 MB  217 MB  + kernel build tools,
                  + tarball  (199 MB)           bzip2
  versioned source  17590     254 MB   61 MB  none
                  (kernel-devsrc itself is just the 43 byte link)

'build' has the same files and size (79302094 bytes) as kernel-devsrc
before the series.

Bruce

openembedded-core (8):
  kernel.bbclass: map the kernel build directory to KERNEL_SRC_PATH
  kernel.bbclass: stage a manifest of the source files the build read
  kernel-devsrc: add build and source PACKAGECONFIG levels
  kernel-devsrc: add full and tarball PACKAGECONFIG levels
  kernel-devsrc: optionally version the package
  kernel-devsrc: skip the recipe if no PACKAGECONFIG level is set
  rootfs: don't carry debug rootfs postinst registrations into the image
  rootfs: fail if an IMAGE_INSTALL_DEBUGFS package can't be installed

 openembedded-core:
 meta/classes-recipe/kernel.bbclass         |  47 +++++++
 meta/lib/oe/rootfs.py                      |  19 ++-
 meta/recipes-kernel/linux/kernel-devsrc.bb | 195 ++++++++++++++++++++++++-----
 3 files changed, 231 insertions(+), 30 deletions(-)

-- 
2.43.0
