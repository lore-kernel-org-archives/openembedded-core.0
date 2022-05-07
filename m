Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2E4C433F5
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 07:34:04 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.7687.1651908838138561734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 00:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQHzr13b;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id q130so11580352ljb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 07 May 2022 00:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/GvwJi+zxHswj0VN3B+npzm5P6E2cido1I2BE5tLMw=;
        b=aQHzr13baWsNPeSjuMtaPhLtgb9uiZbP2cX6FvdAud+thpwfUpqYzfir7zeaZoavAA
         7R3PjDZIYwVwk29jsu+amGSaGFmnPbzXLHeSqoPGFhKlgozgpUh2B5HPFf+yyYAxImNG
         suVuYsT6bW7e4xvD5VBnsnVvVvlo6eo74OCxjkI6bCn4eEH5ii0et1+QDB622OoO2SAj
         vL67o/dChsoMsw7oBwGDeTmmSD1wpUyaaDAFJgQ8OrWpLEIwJnRAMl/6uPHqQBTOVzQF
         rekBr21w4L/FVq6D57U/1QEDkaR+GA/Pr/SlXQupCVSYNQvCq4m4chB52jX50oEqximE
         AylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/GvwJi+zxHswj0VN3B+npzm5P6E2cido1I2BE5tLMw=;
        b=FI1pOV2z6Z9xcTge5dfrqeowE1qV7t6PrI/pq+6PjYDAvguckryqOv9+Muh5vcobic
         NcPzJFVTJx8NfNNYH6QmgiusdZUWzZfyPaOm1JT3n3VTjAnN2OZrJJ4ulHYc5aMvotIR
         iRFEqyxFuiyZff06cIJhLBRZugd5RF7dOWglyhpaUdoABAY/TuJ6IVc1k0s0iZIeZ5ce
         iwon7mtRpNQxS3vsFNnndVALHszQ3N9uop34Dszr9i/B2uEBs9926UDFqpfFwMpRdlQq
         uYgkNHFXY3aLOH8t4vVPIkYjhzBoSrRq3JX439NSVcoZ9p0q+fKNk/LEMr9J/ZbMNuar
         oiOA==
X-Gm-Message-State: AOAM5336Vw7D4LwV/V7xWlFb2Tb+SvT2tgGQ41Y53pgpVMnHd6UD5oOA
	NYrHOAJjhBtpdwvRg1LYkfFtEx7hfixMejzukZw=
X-Google-Smtp-Source: 
 ABdhPJwYBvzQPxgwuSBsZo2d78KotGU09Bl/HLxaBixLh9DoyG5SLBv46PoX8V+2ioLiyN76cUvf6gznVeqI0xlaLdw=
X-Received: by 2002:a2e:8887:0:b0:24f:10d8:4603 with SMTP id
 k7-20020a2e8887000000b0024f10d84603mr4355036lji.191.1651908835961; Sat, 07
 May 2022 00:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220507064449.25809-1-alex.kiernan@gmail.com>
In-Reply-To: <20220507064449.25809-1-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 7 May 2022 09:33:44 +0200
Message-ID: 
 <CANNYZj8Vh=TBt4ZxthhqrgxFgBf94L3AWC6cFi+izJPPUeHZkw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH 1/4] eudev: Upgrade 3.2.10 -> 3.2.11
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Alex Kiernan <alexk@zuma.ai>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 07:34:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165357

Thanks, can you check that 'devtool latest-version eudev' works
please? And fix UPSTREAM_CHECK_URI accordingly.

Alex

On Sat, 7 May 2022 at 08:45, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> The upstream has moved from Gentoo to GitHub and is now maintained by a
> new collection of cross-distribution contributors.
>
> Drop the revert of the userspace firmware loading removal patch as these
> are only required to support kernels older than 3.7, do not apply
> cleanly and will never be merged upstream.
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> ---
>  ...-rules-remove-firmware-loading-rules.patch |  28 --
>  ...ve-userspace-firmware-loading-suppor.patch | 364 ------------------
>  .../udev/{eudev_3.2.10.bb => eudev_3.2.11.bb} |   9 +-
>  3 files changed, 3 insertions(+), 398 deletions(-)
>  delete mode 100644 meta/recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch
>  delete mode 100644 meta/recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch
>  rename meta/recipes-core/udev/{eudev_3.2.10.bb => eudev_3.2.11.bb} (86%)
>
> diff --git a/meta/recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch b/meta/recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch
> deleted file mode 100644
> index fe2ba5328dc6..000000000000
> --- a/meta/recipes-core/udev/eudev/0014-Revert-rules-remove-firmware-loading-rules.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From 4f0a722489154da99e7f6b3051afde984eed2f74 Mon Sep 17 00:00:00 2001
> -From: Jonathan Liu <net147@gmail.com>
> -Date: Thu, 19 Mar 2015 15:01:29 +1100
> -Subject: [PATCH] Revert "rules: remove firmware loading rules"
> -
> -This reverts commit 70e7d754ddb356fb1a2942b262f8cee9650e2a19.
> -Userspace firmware loading support is needed for Linux < 3.7.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Jonathan Liu <net147@gmail.com>
> ----
> - rules/50-firmware.rules | 3 +++
> - 1 file changed, 3 insertions(+)
> - create mode 100644 rules/50-firmware.rules
> -
> -diff --git a/rules/50-firmware.rules b/rules/50-firmware.rules
> -new file mode 100644
> -index 0000000..f0ae684
> ---- /dev/null
> -+++ b/rules/50-firmware.rules
> -@@ -0,0 +1,3 @@
> -+# do not edit this file, it will be overwritten on update
> -+
> -+SUBSYSTEM=="firmware", ACTION=="add", RUN{builtin}="firmware"
> ---
> -2.3.3
> -
> diff --git a/meta/recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch b/meta/recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch
> deleted file mode 100644
> index db333e9376f9..000000000000
> --- a/meta/recipes-core/udev/eudev/Revert-udev-remove-userspace-firmware-loading-suppor.patch
> +++ /dev/null
> @@ -1,364 +0,0 @@
> -From e415372cc7a2f52e70e1cfa8c6c1f633b411355d Mon Sep 17 00:00:00 2001
> -From: Lauren Post <lauren.post@nxp.com>
> -Date: Wed, 8 Jun 2016 06:51:56 -0500
> -Subject: [PATCH] Revert "udev: remove userspace firmware loading support"
> -
> -This reverts commit 3b717594600fa717cdf9bcfd0c7c1b703b245482.
> -
> -Conflicts:
> -       configure.ac
> -       src/udev/udevd.c
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Lauren Post <lauren.post@nxp.com>
> ----
> - configure.ac                     |  39 +++++++++-
> - rules/Makefile.am                |   5 ++
> - src/udev/Makefile.am             |  10 +++
> - src/udev/udev-builtin-firmware.c | 154 +++++++++++++++++++++++++++++++++++++++
> - src/udev/udev-builtin.c          |   3 +
> - src/udev/udev.h                  |   6 ++
> - src/udev/udevd.c                 |  13 ++++
> - 7 files changed, 227 insertions(+), 3 deletions(-)
> - create mode 100644 src/udev/udev-builtin-firmware.c
> -
> -diff --git a/configure.ac b/configure.ac
> -index 8691891..65028c2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -238,9 +238,42 @@ AC_CHECK_DECL([unshare],
> -         [#include <sched.h>])
> -
> - # ------------------------------------------------------------------------------
> --AC_PATH_TOOL(GPERF, gperf)
> --if test -z "$GPERF" ; then
> --        AC_MSG_ERROR([*** gperf not found])
> -+AC_ARG_WITH(firmware-path,
> -+       AS_HELP_STRING([--with-firmware-path=DIR[[[:DIR[...]]]]],
> -+          [Firmware search path (default=ROOTPREFIX/lib/firmware/updates:ROOTPREFIX/lib/firmware)]),
> -+       [], [with_firmware_path="$rootprefix/lib/firmware/updates:$rootprefix/lib/firmware"])
> -+OLD_IFS=$IFS
> -+IFS=:
> -+for i in $with_firmware_path; do
> -+       if test "x${FIRMWARE_PATH}" = "x"; then
> -+              FIRMWARE_PATH="\\\"${i}/\\\""
> -+       else
> -+              FIRMWARE_PATH="${FIRMWARE_PATH}, \\\"${i}/\\\""
> -+       fi
> -+done
> -+IFS=$OLD_IFS
> -+AC_SUBST(FIRMWARE_PATH)
> -+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
> -+AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
> -+
> -+# ------------------------------------------------------------------------------
> -+AC_ARG_ENABLE([gudev],
> -+       AS_HELP_STRING([--disable-gudev], [disable Gobject libudev support @<:@default=enabled@:>@]),
> -+       [], [enable_gudev=yes])
> -+AS_IF([test "x$enable_gudev" = "xyes"], [ PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0]) ])
> -+AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" = "xyes"])
> -+
> -+# ------------------------------------------------------------------------------
> -+AC_ARG_ENABLE([keymap],
> -+        AS_HELP_STRING([--disable-keymap], [disable keymap fixup support @<:@default=enabled@:>@]),
> -+        [], [enable_keymap=yes])
> -+
> -+if test "x$enable_keymap" = "xyes"; then
> -+        AC_PATH_TOOL(GPERF, gperf)
> -+        if test -z "$GPERF" ; then
> -+                AC_MSG_ERROR([*** gperf not found])
> -+        fi
> -+        AC_DEFINE([ENABLE_KEYMAP], [1], [Define if we are enabling rule generator])
> - fi
> -
> - # ------------------------------------------------------------------------------
> -diff --git a/rules/Makefile.am b/rules/Makefile.am
> -index 24c099c..d714ae3 100644
> ---- a/rules/Makefile.am
> -+++ b/rules/Makefile.am
> -@@ -22,6 +22,11 @@ dist_udevrules_DATA += \
> -       80-net-name-slot.rules
> - endif
> -
> -+if ENABLE_FIRMWARE
> -+dist_udevrules_DATA += \
> -+      50-firmware.rules
> -+endif
> -+
> - if HAVE_BLKID
> - dist_udevrules_DATA += \
> -       60-persistent-storage.rules
> -diff --git a/src/udev/Makefile.am b/src/udev/Makefile.am
> -index 401af01..742fbc8 100644
> ---- a/src/udev/Makefile.am
> -+++ b/src/udev/Makefile.am
> -@@ -53,12 +53,18 @@ libudev_core_la_SOURCES = \
> -       udev-ctrl.c \
> -       udev-builtin.c \
> -       udev-builtin-btrfs.c \
> -+      udev-builtin-firmware.c \
> -       udev-builtin-hwdb.c \
> -       udev-builtin-input_id.c \
> -       udev-builtin-net_id.c \
> -       udev-builtin-path_id.c \
> -       udev-builtin-usb_id.c
> -
> -+if ENABLE_FIRMWARE
> -+libudev_core_la_SOURCES += \
> -+      udev-builtin-firmware.c
> -+endif
> -+
> - include_HEADERS = \
> -       udev.h
> -
> -@@ -86,6 +92,10 @@ libudev_core_la_LIBADD += \
> -       $(KMOD_LIBS)
> - endif
> -
> -+libudev_core_la_CPPFLAGS = \
> -+      $(AM_CPPFLAGS) \
> -+      -DFIRMWARE_PATH="$(FIRMWARE_PATH)"
> -+
> - #
> - # Extras
> - #
> -diff --git a/src/udev/udev-builtin-firmware.c b/src/udev/udev-builtin-firmware.c
> -new file mode 100644
> -index 0000000..bd8c2fb
> ---- /dev/null
> -+++ b/src/udev/udev-builtin-firmware.c
> -@@ -0,0 +1,154 @@
> -+/*
> -+ * firmware - Kernel firmware loader
> -+ *
> -+ * Copyright (C) 2009 Piter Punk <piterpunk@slackware.com>
> -+ * Copyright (C) 2009-2011 Kay Sievers <kay@vrfy.org>
> -+ *
> -+ * This program is free software; you can redistribute it and/or
> -+ * modify it under the terms of the GNU General Public License as
> -+ * published by the Free Software Foundation; either version 2 of the
> -+ * License, or (at your option) any later version.
> -+ *
> -+ * This program is distributed in the hope that it will be useful, but
> -+ * WITHOUT ANY WARRANTY; without even the implied warranty of
> -+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> -+ * General Public License for more details:*
> -+ */
> -+
> -+#include <unistd.h>
> -+#include <stdlib.h>
> -+#include <string.h>
> -+#include <stdio.h>
> -+#include <getopt.h>
> -+#include <errno.h>
> -+#include <stdbool.h>
> -+#include <sys/utsname.h>
> -+#include <sys/stat.h>
> -+
> -+#include "udev.h"
> -+
> -+static bool set_loading(struct udev *udev, char *loadpath, const char *state) {
> -+        FILE *ldfile;
> -+
> -+        ldfile = fopen(loadpath, "we");
> -+        if (ldfile == NULL) {
> -+                log_error("error: can not open '%s'", loadpath);
> -+                return false;
> -+        };
> -+        fprintf(ldfile, "%s\n", state);
> -+        fclose(ldfile);
> -+        return true;
> -+}
> -+
> -+static bool copy_firmware(struct udev *udev, const char *source, const char *target, size_t size) {
> -+        char *buf;
> -+        FILE *fsource = NULL, *ftarget = NULL;
> -+        bool ret = false;
> -+
> -+        buf = malloc(size);
> -+        if (buf == NULL) {
> -+                log_error("No memory available to load firmware file");
> -+                return false;
> -+        }
> -+
> -+        log_debug("writing '%s' (%zi) to '%s'", source, size, target);
> -+
> -+        fsource = fopen(source, "re");
> -+        if (fsource == NULL)
> -+                goto exit;
> -+        ftarget = fopen(target, "we");
> -+        if (ftarget == NULL)
> -+                goto exit;
> -+        if (fread(buf, size, 1, fsource) != 1)
> -+                goto exit;
> -+        if (fwrite(buf, size, 1, ftarget) == 1)
> -+                ret = true;
> -+exit:
> -+        if (ftarget != NULL)
> -+                fclose(ftarget);
> -+        if (fsource != NULL)
> -+                fclose(fsource);
> -+        free(buf);
> -+        return ret;
> -+}
> -+
> -+static int builtin_firmware(struct udev_device *dev, int argc, char *argv[], bool test) {
> -+        struct udev *udev = udev_device_get_udev(dev);
> -+        static const char *searchpath[] = { FIRMWARE_PATH };
> -+        char loadpath[UTIL_PATH_SIZE];
> -+        char datapath[UTIL_PATH_SIZE];
> -+        char fwpath[UTIL_PATH_SIZE];
> -+        const char *firmware;
> -+        FILE *fwfile = NULL;
> -+        struct utsname kernel;
> -+        struct stat statbuf;
> -+        unsigned int i;
> -+        int rc = EXIT_SUCCESS;
> -+
> -+        firmware = udev_device_get_property_value(dev, "FIRMWARE");
> -+        if (firmware == NULL) {
> -+                log_error("firmware parameter missing");
> -+                rc = EXIT_FAILURE;
> -+                goto exit;
> -+        }
> -+
> -+        /* lookup firmware file */
> -+        uname(&kernel);
> -+        for (i = 0; i < ELEMENTSOF(searchpath); i++) {
> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], kernel.release, "/", firmware, NULL);
> -+                fwfile = fopen(fwpath, "re");
> -+                if (fwfile != NULL)
> -+                        break;
> -+
> -+                strscpyl(fwpath, sizeof(fwpath), searchpath[i], firmware, NULL);
> -+                fwfile = fopen(fwpath, "re");
> -+                if (fwfile != NULL)
> -+                        break;
> -+        }
> -+
> -+        strscpyl(loadpath, sizeof(loadpath), udev_device_get_syspath(dev), "/loading", NULL);
> -+
> -+        if (fwfile == NULL) {
> -+                log_debug("did not find firmware file '%s'", firmware);
> -+                rc = EXIT_FAILURE;
> -+                /*
> -+                 * Do not cancel the request in the initrd, the real root might have
> -+                 * the firmware file and the 'coldplug' run in the real root will find
> -+                 * this pending request and fulfill or cancel it.
> -+                 * */
> -+                if (!in_initrd())
> -+                        set_loading(udev, loadpath, "-1");
> -+                goto exit;
> -+        }
> -+
> -+        if (stat(fwpath, &statbuf) < 0 || statbuf.st_size == 0) {
> -+                if (!in_initrd())
> -+                        set_loading(udev, loadpath, "-1");
> -+                rc = EXIT_FAILURE;
> -+                goto exit;
> -+        }
> -+
> -+        if (!set_loading(udev, loadpath, "1"))
> -+                goto exit;
> -+
> -+        strscpyl(datapath, sizeof(datapath), udev_device_get_syspath(dev), "/data", NULL);
> -+        if (!copy_firmware(udev, fwpath, datapath, statbuf.st_size)) {
> -+                log_error("error sending firmware '%s' to device", firmware);
> -+                set_loading(udev, loadpath, "-1");
> -+                rc = EXIT_FAILURE;
> -+                goto exit;
> -+        };
> -+
> -+        set_loading(udev, loadpath, "0");
> -+exit:
> -+        if (fwfile)
> -+                fclose(fwfile);
> -+        return rc;
> -+}
> -+
> -+const struct udev_builtin udev_builtin_firmware = {
> -+        .name = "firmware",
> -+        .cmd = builtin_firmware,
> -+        .help = "kernel firmware loader",
> -+        .run_once = true,
> -+};
> -diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
> -index 74b3bdc..3657106 100644
> ---- a/src/udev/udev-builtin.c
> -+++ b/src/udev/udev-builtin.c
> -@@ -34,6 +34,9 @@ static const struct udev_builtin *builtins[] = {
> -         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
> - #endif
> -         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
> -+#ifdef HAVE_FIRMWARE
> -+        [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
> -+#endif
> -         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
> -         [UDEV_BUILTIN_INPUT_ID] = &udev_builtin_input_id,
> -         [UDEV_BUILTIN_KEYBOARD] = &udev_builtin_keyboard,
> -diff --git a/src/udev/udev.h b/src/udev/udev.h
> -index 198cb2c..01a1e9c 100644
> ---- a/src/udev/udev.h
> -+++ b/src/udev/udev.h
> -@@ -149,6 +149,9 @@ enum udev_builtin_cmd {
> -         UDEV_BUILTIN_BLKID,
> - #endif
> -         UDEV_BUILTIN_BTRFS,
> -+#ifdef HAVE_FIRMWARE
> -+        UDEV_BUILTIN_FIRMWARE,
> -+#endif
> -         UDEV_BUILTIN_HWDB,
> -         UDEV_BUILTIN_INPUT_ID,
> -         UDEV_BUILTIN_KEYBOARD,
> -@@ -173,6 +176,9 @@ struct udev_builtin {
> - extern const struct udev_builtin udev_builtin_blkid;
> - #endif
> - extern const struct udev_builtin udev_builtin_btrfs;
> -+#ifdef HAVE_FIRMWARE
> -+extern const struct udev_builtin udev_builtin_firmware;
> -+#endif
> - extern const struct udev_builtin udev_builtin_hwdb;
> - extern const struct udev_builtin udev_builtin_input_id;
> - extern const struct udev_builtin udev_builtin_keyboard;
> -diff --git a/src/udev/udevd.c b/src/udev/udevd.c
> -index b1de97a..35655d8 100644
> ---- a/src/udev/udevd.c
> -+++ b/src/udev/udevd.c
> -@@ -101,6 +101,9 @@ struct event {
> -         bool is_block;
> -         usec_t start_usec;
> -         bool warned;
> -+#ifdef HAVE_FIRMWARE
> -+        bool nodelay;
> -+#endif
> - };
> -
> - static inline struct event *node_to_event(struct udev_list_node *node) {
> -@@ -491,6 +494,10 @@ static int event_queue_insert(struct udev_device *dev) {
> -         event->devnum = udev_device_get_devnum(dev);
> -         event->is_block = streq("block", udev_device_get_subsystem(dev));
> -         event->ifindex = udev_device_get_ifindex(dev);
> -+#ifdef HAVE_FIRMWARE
> -+        if (streq(udev_device_get_subsystem(dev), "firmware"))
> -+                event->nodelay = true;
> -+#endif
> -
> -         log_debug("seq %llu queued, '%s' '%s'", udev_device_get_seqnum(dev),
> -              udev_device_get_action(dev), udev_device_get_subsystem(dev));
> -@@ -566,6 +573,12 @@ static bool is_devpath_busy(struct event *event) {
> -                         return true;
> -                 }
> -
> -+#ifdef HAVE_FIRMWARE
> -+                /* allow to bypass the dependency tracking */
> -+                if (event->nodelay)
> -+                        continue;
> -+#endif
> -+
> -                 /* parent device event found */
> -                 if (event->devpath[common] == '/') {
> -                         event->delaying_seqnum = loop_event->seqnum;
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
> similarity index 86%
> rename from meta/recipes-core/udev/eudev_3.2.10.bb
> rename to meta/recipes-core/udev/eudev_3.2.11.bb
> index b0536124920a..49fa9a74c3da 100644
> --- a/meta/recipes-core/udev/eudev_3.2.10.bb
> +++ b/meta/recipes-core/udev/eudev_3.2.11.bb
> @@ -1,5 +1,5 @@
>  SUMMARY = "eudev is a fork of systemd's udev"
> -HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
> +HOMEPAGE = "https://github.com/eudev-project/eudev"
>  DESCRIPTION = "eudev is Gentoo's fork of udev, systemd's device file manager for the Linux kernel. It manages device nodes in /dev and handles all user space actions when adding or removing devices."
>  LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later"
>  LICENSE:libudev = "LGPL-2.1-or-later"
> @@ -9,15 +9,12 @@ DEPENDS = "glib-2.0 glib-2.0-native gperf-native kmod libxslt-native util-linux"
>
>  PROVIDES = "udev"
>
> -SRC_URI = "https://dev.gentoo.org/~blueness/${BPN}/${BP}.tar.gz \
> -           file://0014-Revert-rules-remove-firmware-loading-rules.patch \
> -           file://Revert-udev-remove-userspace-firmware-loading-suppor.patch \
> +SRC_URI = "https://github.com/eudev-project/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
>             file://init \
>             file://local.rules \
>  "
>
> -SRC_URI[md5sum] = "60b135a189523f333cea5f71a3345c8d"
> -SRC_URI[sha256sum] = "87bb028d470fd1b85169349b44c55d5b733733dc2d50ddf1196e026725ead034"
> +SRC_URI[sha256sum] = "19847cafec67897da855fde56f9dc7d92e21c50e450aa79068a7e704ed44558b"
>
>  inherit autotools update-rc.d qemu pkgconfig features_check
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165353): https://lists.openembedded.org/g/openembedded-core/message/165353
> Mute This Topic: https://lists.openembedded.org/mt/90949255/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

