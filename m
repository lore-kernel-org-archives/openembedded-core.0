Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10845.1794066212891945065
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2026 07:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=dbIyeNzc;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso659616f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 07:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794066211; x=1794671011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5EEfPg5ydVtVoloiWxeKMYxKjZcU7zhtOoph5XN7Z/8=;
        b=dbIyeNzciwxrCxnqLIM5lsoUsudYutHwO/w7ZApXEmnMeq42yQWNo5LyHftJUIu9Bl
         36pGfNiJWB3B5kT8P7j/THpM3kwPL2s6WRLMNoeO+EHVc4lx8rXxy/KXuqIKae/LrjsD
         SyhIW4JZrOROamfqx1lQ6Jk3mq7LyGbmPX+Obt4v2s08B2N15VpK29PRHOB4DuibvSbZ
         O77/8OhxKWA9XdU8PWB1qldAAGY299vLq7ojt1d82g1cI9cw/mpLvdzZlX7K+oPMPtpn
         EsmY/MS+hKBILA8cgbM14Yd0vUAJM5jnNCpl6C6vD/Z+isx9YJGsfzha+uLYlRNXbsoy
         zlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066211; x=1794671011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5EEfPg5ydVtVoloiWxeKMYxKjZcU7zhtOoph5XN7Z/8=;
        b=a9sJJayi58XLtW0Iu6rJtmDhy80IpqINfkXqEyJO8fauJatkp8N6AF3rzgDnhDa0ZP
         Mz5phRd35uoUhgHAjcmxB/LmHaNaM5MVBCyMh8Rh4b/+HryhKDFWm3R9Jucubc7KZgtf
         1DqNfBP0AjEypqjBsWFyXHMXcH3aFCM895B6YG55wWZwBDgAntGYuSgdsODIJUyYfC1G
         3CWvxQMmq2GmouvuMJX+v8zIHopZskgBvXMdZGJP5JQVZhatXl1U06VfitANKaz9xwFI
         QIaLXEOtnVWqfjSdMdCg5VikxdVk76cCHowt8HC1ccPpFSCN7YZqu60SWAZ6sWlEVVn4
         /NvA==
X-Gm-Message-State: APuU4Z/ItzlRPU6B4E/8mJ1A0hmm6orHr20iHzFIOydZw2xQdvZqH4xj
	JePHkcUNP0mvDqIIsNdWwjmsDFSSdu9JFJ5Q7GL/aEHVhMYGL3dGwkm52Qk/fA==
X-Gm-Gg: AYBFou1oplHnqn/j0cjKTZR7LBkVd4RaMty/ihVR9Mk9d9pjlkz3s35wUjDZ3mi6aNY
	C9A8LlbMBp0K425qGPjMAXrQwh8MCWE75OE6kNzdABfWcXR8noBYJnfDa2TkkqHqOjurk+B2jvc
	yBCf23gleaEXE6AeRGrDPEbBTGButi78U2KcV4DATlYQ+386WN5fKuaDbYuZB80PC7YSPpCobuB
	kWruVnHr6cro6PbfhQ1IA3PSK0APF87hYGu/e4/N8odCCYSpNotLlihzRmHFE5zxVcyaqhrfbng
	/PEbfXPisLf845ErL9bah3vNaR+jWc4ZdbR7d0VdXSWf16sBCyS9pMHypOpvFSLmhgMGrMTtgx8
	iS+DtJTy+FCjqN3L02lC7+Q3VY0gnoMos/0H2H4kN5Hl4O30uHf+JiJaEO4trUzgKKdWv4HpKqc
	DNeGQMpFTFvY4cbvkx/cT27oXj4V9NWSlpgphkA2PJ6LbyGrYzDvHEz8QVub6XGGhtL6nykF69P
	u3mvGb8la67/h+K+2hTVdnLliNDlHlSLzx4sZBKuayk+vLG06LyHAl0K9diSiEhZxbUnef5QjEt
	EL6Md5W0nyRA9YJdEuVms7EMM82b3z3+7ckD2bThGZ1otw4ME3j9HhON98hJLHkOFfEIE0dVO31
	gcK8kaa8tsNRr
X-Received: by 2002:a05:6000:186f:b0:486:f907:ebec with SMTP id ffacd0b85a97d-492776e6a45mr12037950f8f.31.1794066210747;
        Sat, 07 Nov 2026 07:43:30 -0800 (PST)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7700224sm10308472f8f.33.2026.11.07.07.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 07:43:28 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [PATCH] eudev: upgrade 3.2.15 -> 3.3.0
Date: Sat,  7 Nov 2026 15:43:09 +0000
Message-ID: <20261107154308.1110237-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2026 15:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249744
Content-Type: text/plain; charset="utf-8"

Release notes:

  https://github.com/eudev-project/eudev/blob/v3.3.0/NEWS.md

Drop 0001-udevd-keep-a-copy-of-the-event-devnode.patch, fixed
differently upstream.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...evd-keep-a-copy-of-the-event-devnode.patch | 101 ------------------
 .../udev/{eudev_3.2.15.bb => eudev_3.3.0.bb}  |   9 +-
 2 files changed, 5 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-core/udev/eudev/0001-udevd-keep-a-copy-of-the-event-devnode.patch
 rename meta/recipes-core/udev/{eudev_3.2.15.bb => eudev_3.3.0.bb} (90%)

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
similarity index 90%
rename from meta/recipes-core/udev/eudev_3.2.15.bb
rename to meta/recipes-core/udev/eudev_3.3.0.bb
index 956ab3f6c2dc..acbe61e4fb55 100644
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
 
@@ -64,11 +63,13 @@ do_install:prepend:class-target () {
 INITSCRIPT_NAME = "udev"
 INITSCRIPT_PARAMS = "start 04 S ."
 
-PACKAGE_BEFORE_PN = "libudev ${PN}-hwdb"
+PACKAGE_BEFORE_PN += "libudev ${PN}-hwdb ${PN}-zsh-completion"
 
 FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
 FILES:${PN}-hwdb = "${sysconfdir}/udev/hwdb.d"
+FILES:${PN}-zsh-completion = "${datadir}/zsh"
+
 
 RDEPENDS:${PN}-hwdb += "eudev"
 RDEPENDS:${PN} += "kmod"
