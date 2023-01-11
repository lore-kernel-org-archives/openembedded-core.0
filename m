Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623DCC46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 16:21:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.28304.1673454108093519621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 08:21:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I8INJrc5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id cp9-20020a17090afb8900b00226a934e0e5so3944868pjb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DuJem7wFQEp5IvvKeOTOXkSupruUKIA0uGCHRmOZjC8=;
        b=I8INJrc5LHBVVWzpI4rRG//pbmzpi2d0K7aDFoA+oja1LXNdvb5fI15LWiqSBa6FEU
         qIQxMgsF1rKGzvb9XS28lurZCYv9/Rop7xNDBH41tCOfi579PgPg07MCudd3fCLiX1db
         3TKsu8yOOZaBfvALLNK6eKgvCra0wStTCSEGZoTojqIpp0wroUQ0Ad04y8Rdp/Hc98j6
         t5OMhTsOBCVPCTZisamFmNEwcsXdm5wL6lgVFduMy7U9kKlH6FGXeOKKM49DBBlbIx3Z
         8BcbfWwnQJYnW6+syA7lRMITcnJU/GmBHUAaWMGlOm/UCM29STzRdN2euhXVW7Rb7cRQ
         7wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuJem7wFQEp5IvvKeOTOXkSupruUKIA0uGCHRmOZjC8=;
        b=MpTCLRgB/AEygKWltReukLPcFXQziQvuwE/zaDZ7JLEmRCe6wNYO6JyODpIIsEZpeF
         S9dwyMk6dfGJKOZWp1fjgvo66/6oN4KSmFBG50dPFHW5DRG6sYhh7dVf7poTkTd3JwuL
         kUFW+UENEspVYKJ08R+uy7Z6MBtBdM7c2zvxYbUjGNJNbojemzr8Zf6ZnapIsWFRnsrG
         B6VEGuHhUSU72iVmEv1EX3M8rsERFCN/Tht1Puy2mdla1fTZ6yRP4g9e76RXZxJAlq7C
         uSe6WoHC4SQHCdWo6YLgFJFlJV0F41so5QUKVInpcYejNO9eagbI/nqsqyaiZT/p5t7g
         SAuw==
X-Gm-Message-State: AFqh2krzE5jeSlKbNaq9LxTyw3xVA+jhX8KIbJeBaGJUevjmluWug/MK
	mfiAwZC1ASjmvDp7vx9q31pJhL5MBwD8bObK3Us=
X-Google-Smtp-Source: AMrXdXus2mxoIeCuBf+e6XzUpr2MICtXdhkd3HIqIMynv5PL0aS1XKFkucAgUs1BicX8UkIVQ4S2/g==
X-Received: by 2002:a05:6a20:a888:b0:af:758e:5923 with SMTP id ca8-20020a056a20a88800b000af758e5923mr81583790pzb.21.1673454106926;
        Wed, 11 Jan 2023 08:21:46 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id u14-20020a63ef0e000000b0046feca0883fsm8685384pgh.64.2023.01.11.08.21.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 08:21:46 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 02/11] dbus: upgrade 1.14.0 -> 1.14.4
Date: Wed, 11 Jan 2023 06:21:28 -1000
Message-Id: <fbf8ea03aeb04e1efdc9693a66d618275bddc172.1673453368.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673453368.git.steve@sakoman.com>
References: <cover.1673453368.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 16:21:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175758

From: wangmy <wangmy@fujitsu.com>

dbus 1.14.4 (2022-10-05)
========================

This is a security update for the dbus 1.14.x stable branch, fixing
denial-of-service issues (CVE-2022-42010, -42011, -42012) and applying
security hardening (dbus#416).

Behaviour changes:

• On Linux, dbus-daemon and other uses of DBusServer now create a
  path-based Unix socket, unix:path=..., when asked to listen on a
  unix:tmpdir=... address. This makes unix:tmpdir=... equivalent to
  unix:dir=... on all platforms.
  Previous versions would have created an abstract socket, unix:abstract=...,
  in this situation.
  This change primarily affects the well-known session bus when run via
  dbus-launch(1) or dbus-run-session(1). The user bus, enabled by configuring
  dbus with --enable-user-session and running it on a systemd system,
  already used path-based Unix sockets and is unaffected by this change.
  This behaviour change prevents a sandbox escape via the session bus socket
  in sandboxing frameworks that can share the network namespace with the host
  system, such as Flatpak.
  This change might cause a regression in situations where the abstract socket
  is intentionally shared between the host system and a chroot or container,
  such as some use-cases of schroot(1). That regression can be resolved by
  using a bind-mount to share either the D-Bus socket, or the whole /tmp
  directory, with the chroot or container.
  (dbus#416, Simon McVittie)

Denial of service fixes:

Evgeny Vereshchagin discovered several ways in which an authenticated
local attacker could cause a crash (denial of service) in
dbus-daemon --system or a custom DBusServer. In uncommon configurations
these could potentially be carried out by an authenticated remote attacker.

• An invalid array of fixed-length elements where the length of the array
  is not a multiple of the length of the element would cause an assertion
  failure in debug builds or an out-of-bounds read in production builds.
  This was a regression in version 1.3.0.
  (dbus#413, CVE-2022-42011; Simon McVittie)

• A syntactically invalid type signature with incorrectly nested parentheses
  and curly brackets would cause an assertion failure in debug builds.
  Similar messages could potentially result in a crash or incorrect message
  processing in a production build, although we are not aware of a practical
  example. (dbus#418, CVE-2022-42010; Simon McVittie)

• A message in non-native endianness with out-of-band Unix file descriptors
  would cause a use-after-free and possible memory corruption in production
  builds, or an assertion failure in debug builds. This was a regression in
  version 1.3.0. (dbus#417, CVE-2022-42012; Simon McVittie)

dbus 1.14.2 (2022-09-26)
========================

Fixes:

• Fix build failure on FreeBSD (dbus!277, Alex Richardson)

• Fix build failure on macOS with launchd enabled
  (dbus!287, Dawid Wróbel)

• Preserve errno on failure to open /proc/self/oom_score_adj
  (dbus!285, Gentoo#834725; Mike Gilbert)

• On Linux, don't log warnings if oom_score_adj is read-only but does not
  need to be changed (dbus!291, Simon McVittie)

• Slightly improve error-handling for inotify
  (dbus!235, Simon McVittie)

• Don't crash if dbus-daemon is asked to watch more than 128 directories
  for changes (dbus!302, Jan Tojnar)

• Autotools build system fixes:
  · Don't treat --with-x or --with-x=yes as a request to disable X11,
    fixing a regression in 1.13.20. Instead, require X11 libraries and
    fail if they cannot be detected. (dbus!263, Lars Wendler)
  · When a CMake project uses an Autotools-built libdbus in a
    non-standard prefix, find dbus-arch-deps.h successfully
    (dbus#314, Simon McVittie)
  · Don't include generated XML catalog in source releases
    (dbus!317, Jan Tojnar)
  · Improve robustness of detecting gcc __sync atomic builtins
    (dbus!320, Alex Richardson)

• CMake build system fixes:
  · Detect endianness correctly, fixing interoperability with other D-Bus
    implementations on big-endian systems (dbus#375, Ralf Habacker)
  · When building for Unix, install session and system bus setup
    in the intended locations
    (dbus!267, dbus!297; Ralf Habacker, Alex Richardson)
  · Detect setresuid() and getresuid() (dbus!319, Alex Richardson)
  · Detect backtrace() on FreeBSD (dbus!281, Alex Richardson)
  · Don't include headers from parent directory (dbus!282, Alex Richardson)
  · Distinguish between host and target TMPDIR when cross-compiling
    (dbus!279, Alex Richardson)
  · Fix detection of atomic operations (dbus!306, Alex Richardson)

Tests and CI enhancements:

• On Unix, skip tests that switch uid if run in a container that is
  unable to do so, instead of failing (dbus#407, Simon McVittie)

• Use the latest MSYS2 packages for CI
  (Ralf Habacker, Simon McVittie)

License-Update: D-Bus changed to dbus.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8c2ab4c014807e2d8ad0fded4188578aa05e8c55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-core/dbus/{dbus_1.14.0.bb => dbus_1.14.4.bb} (96%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.4.bb
similarity index 96%
rename from meta/recipes-core/dbus/dbus_1.14.0.bb
rename to meta/recipes-core/dbus/dbus_1.14.4.bb
index 863e35faf7..5f91ec2dc1 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.4.bb
@@ -6,8 +6,9 @@ SECTION = "base"
 inherit autotools pkgconfig gettext upstream-version-is-even ptest-gnome
 
 LICENSE = "AFL-2.1 | GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
-                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6423dcd74d7be9715b0db247fd889da3 \
+                    file://dbus/dbus.h;beginline=6;endline=20;md5=866739837ccd835350af94dccd6457d8 \
+                    "
 
 SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://run-ptest \
@@ -15,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
 "
 
-SRC_URI[sha256sum] = "ccd7cce37596e0a19558fd6648d1272ab43f011d80c8635aea8fd0bad58aebd4"
+SRC_URI[sha256sum] = "7c0f9b8e5ec0ff2479383e62c0084a3a29af99edf1514e9f659b81b30d4e353e"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.25.1


