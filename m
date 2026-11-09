Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3660.1794222230676796473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 03:03:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=h8pPC5TW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48fd2e38825so486837f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 03:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222229; x=1794827029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=neoPwIpFswRe5xc0oefgH4WgxXqC6GkxebytjuAKe28=;
        b=h8pPC5TWyG4ZDEXkSuRn07E4loxvcu9Iqwi4Rka/x20H++qkeMezp5GnqCGmD8Xg7Y
         9zVWMUHxHdxdryqHMOczMyP36S+V05rhNugSSWgY3F5SJclJZOgH6XGHSDWDiWW2AKcr
         qsO3D4NAjexw6jWAvOEE0wxnm4yZnDDNfsjv3P0zxd9fb3tOMEMY2/meRdwZ8CqhN6xh
         qqT0fFpJkKOKZyL/RV4vZMJZIcpfhkbsOg3POUBXVneK5wEIsU8l9NjQZ+m85SQbI91U
         S1MIyQjtjc1pTcl02ClLUahp43AqW7+RkIyinNJHk3rS7upomekfc26PMiV4iMnIPVfF
         /a4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222229; x=1794827029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=neoPwIpFswRe5xc0oefgH4WgxXqC6GkxebytjuAKe28=;
        b=UK8tcrMw60/cYTCxguHlWIO/riroj4Kck/bpp1dl4j47t6nyYPkJvBF+cjjehjbll2
         TK/w/WfSle5ynuAOthCJ1CqeN8wZpkkjHreBG9Mk5tvY0/WHugmbWwGrjYngsiUdmzp5
         WA+ryRd0aQpNoCU2P3eEKuh2aXIZvPHyvC2nGqwsh+cVVbVNUQzfx//hsDqJKLUUJTzL
         rsCG2nWbRmQxoKByFssJEWu4PhyArUfCtw9Nl0t7UgtcT+lh0VphVSxyio05zZcM3Ql/
         PeJPYAHEOAtLbbF7odKjVJDZUQT+RQasho87JYWQT9S5pEB1wT366qCKC8iPX/UkvPV6
         YJxQ==
X-Gm-Message-State: APuU4Z+gQoN8sf7Oe6ovH/7k6Dxg+LlcSsyNrTGhGvSLftpaf+1kjanQ
	7bqQS0wVC+R+X+jmF2f0nM3jFn5S31YLowQKKgbnir9rYBrLxN9TrAopLYp8Gw==
X-Gm-Gg: AYBFou1bpWSRbZ1nzXLJWsiYcO55eaJ/e3XYzuk+jKuM2eYc0IMZTFaTr5kHohrkpz2
	vfdMZjMAOkfQk1SebUN/gQ6tVc+/eAPvjGp2rBvK4gD7Oxi6G6bYYKcxsLFLoBcGPax8VPN/hGl
	UKTO49N8oCaiDu9qVXsbVf56RyByhEJ4svV+vVmoLdsNQlm9i9yM0TjGOV8oqcKChd24jqzO/P+
	JMHj0z5RFMF5wZubvmOZUa7mIllaC3w3PTmg6J+E6IGSPFHIGbkw5RdhRok5EtUO6Qd06VtJ7je
	WfIHIziDakPo8IQwWYBxxUPLyKTfAGuRunz4nK9Yd44n70vvtjnPHoDxaQ9wIYofaSKm0GLXw2Y
	nrd6xY0RJviTwNWkX0hj4GwLtvRzNqXygVYeuLM0JnuVl3A6csz9WQ/dBGnf/9u4i4fVW4ZCmPd
	7Rgchc6vSMKRLpaNSuApq8z3VrTN/iIl63f8rfLV5G+fKF6LjFfc/qJu2N7kOAdtQQQQ1vi3DnB
	rDcQTrEtfGEvrzxl2QkrvgXT8kEKhreWh9tyZHsXzfV+OakK048M+yMkiIMy83K7wcXaYg1s9BT
	0eNShj9b9fUiT0vSXVZLlzZGq0Sg6W72N/Eykg3bRTd+SEubx7/3Vq/5zmPhUJZ8vvHv3bNgPvo
	JSvGWskf1+F7P
X-Received: by 2002:a05:6000:4010:b0:48c:571a:a1aa with SMTP id ffacd0b85a97d-4958a4e3b4dmr8832717f8f.19.1794222228381;
        Mon, 09 Nov 2026 03:03:48 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959765218asm9661679f8f.42.2026.11.09.03.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:03:47 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH v2] eudev: upgrade 3.2.15 -> 3.3.0
Date: Mon,  9 Nov 2026 11:02:33 +0000
Message-ID: <20261109110230.2642187-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 11:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249803
Content-Type: text/plain; charset="utf-8"

Release notes:

  https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md

Drop 0001-udevd-keep-a-copy-of-the-event-devnode.patch, fixed
differently upstream.

3.3.0 moves the shipped hwdb files from ${sysconfdir}/udev/hwdb.d to
${nonarch_base_libdir}/udev/hwdb.d, as systemd does, leaving the
${sysconfdir} directory to the administrator.

Set the new nobody user/group and system UID/GID limit options as the
systemd recipe does: the nobody group defaults to "nobody", which
base-passwd does not have, and the limits otherwise come from the build
host's /etc/login.defs. Disable the new systemd-hwdb tool, which nothing
uses with eudev.

Without pni-names, use the new --with-net-ifnames-default=no instead of
masking 80-net-name-slot.rules with an empty file in ${sysconfdir}: that
also covers the new 80-net-altnames.rules, which would otherwise add
alternative names to every interface, and net.ifnames=1 still turns
both on. With pni-names, 3.3.0 names interfaces using systemd's v261
scheme by default, so e.g. virtio NICs become enp0s<N> rather than
enx<MAC>; net_naming_scheme=eudev in udev.conf keeps the old names.

AI-Generated: Claude Opus 5.5 (Claude Code)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...evd-keep-a-copy-of-the-event-devnode.patch | 101 ------------------
 .../udev/{eudev_3.2.15.bb => eudev_3.3.0.bb}  |  22 ++--
 2 files changed, 12 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
 rename meta/recipes-core/udev/{eudev_3.2.15.bb => eudev_3.3.0.bb} (80%)

diff --git a/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch b/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
deleted file mode 100644
index 498bdda2bb50..000000000000
--- a/meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Alex Kiernan <alex.kiernan@gmail.com>
-Date: Sat, 17 Oct 2026 14:23:21 +0100
-Subject: [PATCH] udevd: keep a copy of the event devnode
-
-Commit 4b83740d95be added a devnode check to is_devpath_busy(), caching
-the pointer returned by udev_device_get_devnode() in struct event. That
-string belongs to the udev_device and can be freed while the event is
-still queued: dispatching an event to an idle worker calls
-udev_monitor_send_device(), whose udev_device_get_devtype() re-reads the
-uevent file for devices without DEVTYPE, and the DEVNAME line replaces
-(frees) the devnode string via udev_device_set_devnode().
-
-The next is_devpath_busy() then strcmp()s freed memory. Under musl,
-whose mallocng returns freed memory to the kernel, this segfaults the
-main daemon; elsewhere it silently compares stale data. valgrind
-(qemuarm64, musl) reports it on the first coldplug:
-
-  Invalid read of size 1
-     at strcmp
-     by streq_ptr (util.c:97)
-     by is_devpath_busy (udevd.c:578)
-     by event_queue_start (udevd.c:602)
-   Address 0x54eeaf0 is 0 bytes inside a block of size 10 free'd
-     at free
-     by udev_device_set_devnode (libudev-device.c:1750)
-     by udev_device_read_uevent_file (libudev-device.c:706)
-     by udev_device_get_devtype (libudev-device.c:248)
-     by udev_monitor_send_device (libudev-monitor.c:822)
-     by event_run (udevd.c:462)
-   Block was alloc'd at
-     at malloc
-     by asprintf
-     by udev_device_set_devnode (libudev-device.c:1752)
-     by udev_device_new_from_nulstr (libudev-device.c:2151)
-     by udev_monitor_receive_device (libudev-monitor.c:762)
-
-The systemd code this was ported from is not affected: sd_device seals
-devices received from netlink, so device_read_uevent_file() never
-re-reads them and the cached devname stays the DEVNAME the event arrived
-with for as long as the event is queued.
-
-Store a copy of the devnode in struct event, which keeps those
-semantics. Looking the devnode up from the device at comparison time
-would avoid the allocation, but would compare whatever a later uevent
-re-read left there rather than the event's own DEVNAME, which is what
-the check relies on for a remove and add queued for the same node.
-Stopping udev_device_get_devtype() re-reading the uevent file would
-remove the trigger instead, but changes public libudev behaviour.
-
-Fixes: 4b83740d95be ("udevd: make newer event also blocked by DEVPATH_OLD and by events for the same device node")
-Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
-AI-Generated: Claude Opus 5.5 (Claude Code)
-Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-
-Upstream-Status: Submitted [https://github.com/eudev-project/eudev/pull/304]
----
- src/udev/udevd.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
-
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index 93d9466e0d2d..6ba3efa52555 100644
---- a/src/udev/udevd.c
-+++ b/src/udev/udevd.c
-@@ -97,7 +97,7 @@ struct event {
-         unsigned long long int seqnum;
-         const char *devpath;
-         const char *devpath_old;
--        const char *devnode;
-+        char *devnode;
-         dev_t devnum;
-         int ifindex;
-         bool is_block;
-@@ -140,6 +140,7 @@ static void event_free(struct event *event) {
-         udev_list_node_remove(&event->node);
-         udev_device_unref(event->dev);
-         udev_device_unref(event->dev_kernel);
-+        free(event->devnode);
- 
-         if (event->worker)
-                 event->worker->event = NULL;
-@@ -495,7 +496,18 @@ static int event_queue_insert(struct udev_device *dev) {
-         event->seqnum = udev_device_get_seqnum(dev);
-         event->devpath = udev_device_get_devpath(dev);
-         event->devpath_old = udev_device_get_devpath_old(dev);
--        event->devnode = udev_device_get_devnode(dev);
-+        /* Keep our own copy of the DEVNAME the event arrived with: unlike
-+         * systemd's sealed sd_device, libudev may re-read the uevent file
-+         * later (udev_monitor_send_device() -> udev_device_get_devtype()),
-+         * which frees and replaces the device's devnode string. */
-+        if (udev_device_get_devnode(dev) != NULL) {
-+                event->devnode = strdup(udev_device_get_devnode(dev));
-+                if (event->devnode == NULL) {
-+                        udev_device_unref(event->dev_kernel);
-+                        free(event);
-+                        return -1;
-+                }
-+        }
-         event->devnum = udev_device_get_devnum(dev);
-         event->is_block = streq("block", udev_device_get_subsystem(dev));
-         event->ifindex = udev_device_get_ifindex(dev);
diff --git a/meta/recipes-core/udev/eudev_3.2.15.bb b/meta/recipes-core/udev/eudev_3.3.0.bb
similarity index 80%
rename from meta/recipes-core/udev/eudev_3.2.15.bb
rename to meta/recipes-core/udev/eudev_3.3.0.bb
index 956ab3f6c2dc..ecab7b275358 100644
--- a/meta/recipes-core/udev/eudev_3.2.15.bb
+++ b/meta/recipes-core/udev/eudev_3.3.0.bb
@@ -12,14 +12,13 @@ PROVIDES = "udev"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://init \
            file://local.rules \
-           file://0001-udevd-keep-a-copy-of-the-event-devnode.patch \
            "
 
-SRC_URI[sha256sum] = "eb69809fc0d1187f2463ab2149c53aa9f42a78e59f14ebea68eae6cb6b4fc1c3"
+SRC_URI[sha256sum] = "8fba6e4f49ea4b1938828a3c2e7cc48874816c68621386e527076b6477f5d6ef"
 
 GITHUB_BASE_URI = "https://github.com/eudev-project/eudev/releases"
 
-inherit autotools update-rc.d pkgconfig features_check manpages github-releases
+inherit autotools bash-completion update-rc.d pkgconfig features_check manpages github-releases
 
 CONFLICT_DISTRO_FEATURES = "systemd"
 
@@ -28,6 +27,12 @@ EXTRA_OECONF = " \
     --with-rootlibdir=${base_libdir} \
     --with-rootlibexecdir=${nonarch_base_libdir}/udev \
     --with-rootprefix= \
+    --with-nobody-user=nobody \
+    --with-nobody-group=nogroup \
+    --with-system-uid-max=999 \
+    --with-system-gid-max=999 \
+    --disable-systemd-hwdb \
+    --with-net-ifnames-default=${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'yes', 'no', d)} \
 "
 
 PACKAGECONFIG ?= "blkid hwdb kmod \
@@ -48,11 +53,6 @@ do_install:append() {
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${UNPACKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
-
-	# Use classic network interface naming scheme if no 'pni-names' distro feature
-	if ${@bb.utils.contains('DISTRO_FEATURES', 'pni-names', 'false', 'true', d)}; then
-		touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-	fi
 }
 
 do_install:prepend:class-target () {
@@ -64,11 +64,13 @@ do_install:prepend:class-target () {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGE_BEFORE_PN = "libudev ${PN}-hwdb"
+PACKAGE_BEFORE_PN += "libudev ${PN}-hwdb ${PN}-zsh-completion"
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
-FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d"
+FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d ${nonarch_base_libdir}/udev/hwdb.d"
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
+
 
 RDEPENDS:${PN}-hwdb += "eudev"
 RDEPENDS:${PN} += "kmod"
