Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3716.1795810328667845730
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KtmA4Al+;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so5420356f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810326; x=1796415126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vtdb9Xzw+jhige7qqVbE2xGdbymEdtLtmPnc4HUut5Q=;
        b=KtmA4Al+pDr0Ka8iFg1mmygylWCycDhakyN7MkRFErjDIEXLSsGi/6kO8DISmVFyGC
         s8hL4Xxdm39GwQQ+hHQwdpZdfBGjnRufk5P6wyFJSsKOz7UnC3HnvfB0DhZXp63skfJc
         MuFQPlAa4T5aaIkKGd9PRkhcUWtUdqBMSrJF/MdhOMBytOI9O2MmgzGKIz3fgLZT8zeB
         dmkKhaSI5zVZ9uL48KQSKroyvg/0h+Aa4pOatbChpoJBt4SYeZMoOd+NCqboOxXLZXO9
         GQJkO9LxR+0RN6ztM1rRDMNW+51BCoTqAiUa3B0Wti5zcELpwCfBjQijn9/NU5bRHmPC
         oY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810326; x=1796415126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vtdb9Xzw+jhige7qqVbE2xGdbymEdtLtmPnc4HUut5Q=;
        b=m4rcunoJpsWDKrxK1Njun4BKS4TETBy7ARLtr+N7aZ1LqhOjDggHUaUz5AfWPQ5yof
         JIFMN0WfUzIvpCNxlRid4xxznKMkWiElx4eRsU/EudVuVpIv3hrWyCwETjpqUUJseV8g
         5nsoCYXcNSoMMeZzlAZ7ezMB285V0Bd3ID7euzejVcPcp7K/LMAGPxE8dqIqHzgWXJSK
         XjXrsKEtgvkMZlBMiAizn6v5gdLoWParY+/Wyyt56yeMX4LzJgF3d7bPmAacU4QWU7sQ
         dPE+xuX6xgHsuq3TQFI5cq9sUMm8+BaqrcterUGFKwVDZ7H9MoTdadIM7oQHqK4Ds3M7
         3Q3A==
X-Gm-Message-State: APuU4Z+V8dFCbfmytUEbYm8OqYoUslBQFOAgz4ctPP3lUGi4jMtY6eTk
	ko/UFKuctN0i4Yb1U7s8mlI8Snl1citHeJ5I1mQv03DviK7RdV8f95qo/+wBhw==
X-Gm-Gg: AZFdTZfd4c9m3p0r6h25zozISSVeq1IFx9DdLAkInxpFM4vRHbQJkjlv8xDG1HjXlYe
	WXcRi+vaYwodaCKW/q24ywvTwm0e/HrhTN+Fh7XIJ4paO413EtGMDkglL1ZyMNTkN4c8EQALjrb
	7Fkrc1vXXYZqiT3FKLDaWGMPV2//9wOIma7bfuF/SPVDzHsp+0JlOaM/Rai19vuJOyaxr/o7jbp
	h/aBW87hDIzbTEIa37aQzNX5AiqAb0kHs/48LLmGJoDQKXSJDRsDgg96pGAUWgqWURSOzZ65LAD
	4EEaiOFjMGmSMeAawTCtWAb3cxMkI13ce7A7QEJ4viwrFUUpscZQ/ac/lxsRMaIeIeYHVA7GXnZ
	VftLy791m1eT8LCSWJaOYXmPFY5WbiYen6N22hf287Yuyx5TBka5VPzSRB0/SVkFzXigVXYdfdc
	qJ1ivZQ9He7NJuaNU5Ekm/CaMn8ed4kJ++IZaoXN9IaM8oioaSPMMblINMWhP35V40/e+n7DjAM
	pdqhDpVwRAoeYRVR3Kx9xWSArm/CfeMqCHZ2NbDNXtiWfO7W8lKCqGymGUkmUROpE3TerdZsm0M
	D3kcswYtX2Z0j0vUG+CvsIXMNrOMHxHyLxGB6O33zRNLjOO6tFiPglV8+sJiUzIz8Q==
X-Received: by 2002:a05:600c:e553:b0:4bb:9457:3c93 with SMTP id 5b1f17b1804b1-4bb94573c9amr321376775e9.2.1795810325795;
        Fri, 27 Nov 2026 12:12:05 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/6] pipewire/wireplumber: move from meta-oe
Date: Fri, 27 Nov 2026 21:11:55 +0100
Message-ID: <20261127201159.914833-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201159.914833-1-alex.kanavin@gmail.com>
References: <20261127201159.914833-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251450
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

They are added together as they have a mutual dependency in
default recipe configuration, so that git bisectability is preserved.

There are a few changes to the recipes:

pipewire:
- add INSANE_SKIP:append = " 32bit-time" to avoid
32 bit time API warnings (upstream has a pull request which
the recipe references)
- a few options are disabled as they require carrying over
more recipes from meta-oe:

bluetooth codecs: libopus, libfreeaptx, fdk-aac
jack
libusb
webrtc-echo-cancelling
libcamera

These could be re-enabled on a case by case basis later.

wireplumber:
- adjust RDEPENDS for ptest to include ${MLPREFIX} for needed pipewire modules

Add pipewire user/group to selftest static user/group files as otherwise
reproducibility test won't run.

Add wireplumber to ptest lists (it's fast and takes about 10 seconds).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-selftest/files/static-group              |    1 +
 meta-selftest/files/static-passwd             |    1 +
 meta/conf/distro/include/maintainers.inc      |    2 +
 .../distro/include/ptest-packagelists.inc     |    1 +
 .../0001-pipewire-compress-offload.patch      | 1343 +++++++++++++++++
 ...-acp-compat.h-p-is-already-const-do-.patch |   25 +
 ...a-libcamera-device-0.8-compatibility.patch |   50 +
 .../pipewire/pipewire_1.6.11.bb               |  426 ++++++
 ...isable-session-dbus-dependent-features.lua |    5 +
 .../wireplumber/files/run-ptest               |   55 +
 .../wireplumber/wireplumber_0.5.19.bb         |  183 +++
 11 files changed, 2092 insertions(+)
 create mode 100644 meta/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
 create mode 100644 meta/recipes-multimedia/pipewire/pipewire/0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch
 create mode 100644 meta/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch
 create mode 100644 meta/recipes-multimedia/pipewire/pipewire_1.6.11.bb
 create mode 100644 meta/recipes-multimedia/wireplumber/files/90-OE-disable-session-dbus-dependent-features.lua
 create mode 100644 meta/recipes-multimedia/wireplumber/files/run-ptest
 create mode 100644 meta/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 6a9ece20a89..ceced0cd03f 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -31,4 +31,5 @@ audio:x:532:
 empower:x:533:
 cmake-example:x:534:
 meson-example:x:535:
+pipewire:x:536:
 nogroup:x:65534:
diff --git a/meta-selftest/files/static-passwd b/meta-selftest/files/static-passwd
index 98017c81532..8f47794547b 100644
--- a/meta-selftest/files/static-passwd
+++ b/meta-selftest/files/static-passwd
@@ -21,3 +21,4 @@ ptest:x:529:529::/:/bin/nologin
 xuser:x:530:530::/:/bin/nologin
 cmake-example:x:534:534::/var/lib/cmake-example:/bin/false
 meson-example:x:535:535::/var/lib/meson-example:/bin/false
+pipewire:x:536:536::/:/bin/nologin
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6e92380c592..4f1d4da0a89 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -605,6 +605,7 @@ RECIPE_MAINTAINER:pn-picolibc-helloworld = "Alejandro Hernandez <alejandro@enedi
 RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pigz = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-pipewire = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pixman = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
@@ -900,6 +901,7 @@ RECIPE_MAINTAINER:pn-which = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wic = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wic-tools = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wireless-regdb = "Jaipaul Cheernam <jaipaul.cheernam@est.tech>"
+RECIPE_MAINTAINER:pn-wireplumber = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-x11-volatiles = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 6c8ff85fd05..8c5de5e9772 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -116,6 +116,7 @@ PTESTS_FAST = "\
     utfcpp \
     wayland \
     wget \
+    wireplumber \
     xz \
     zlib \
 "
diff --git a/meta/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch b/meta/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
new file mode 100644
index 00000000000..8a884d64cdd
--- /dev/null
+++ b/meta/recipes-multimedia/pipewire/pipewire/0001-pipewire-compress-offload.patch
@@ -0,0 +1,1343 @@
+From 345e4b033c2ff69ab7aa02a123f6041b878f7fb9 Mon Sep 17 00:00:00 2001
+From: Harsh Rai <harsh.rai@oss.qualcomm.com>
+Date: Tue, 16 Jun 2026 19:21:37 +0530
+Subject: [PATCH] pulse: enable MP3 compressed offload via Pulse
+
+Add PipeWire Pulse virtual sink and forwarder for offload.
+Route compressed Pulse streams to PAL compressed sink.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/2878]
+
+Signed-off-by: Harsh Rai <harsh.rai@oss.qualcomm.com>
+---
+ src/modules/meson.build                       |   2 +
+ .../module-compress-offload-forwarder.c       | 649 ++++++++++++++++++
+ .../modules/module-compress-offload-sink.c    | 293 ++++++++
+ .../module-protocol-pulse/pulse-server.c      | 254 ++++++-
+ 4 files changed, 1187 insertions(+), 11 deletions(-)
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+ create mode 100644 src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+
+diff --git a/src/modules/meson.build b/src/modules/meson.build
+index 59f46ae..900871d 100644
+--- a/src/modules/meson.build
++++ b/src/modules/meson.build
+@@ -324,6 +324,8 @@ pipewire_module_protocol_pulse_sources = [
+   'module-protocol-pulse/modules/module-alsa-source.c',
+   'module-protocol-pulse/modules/module-always-sink.c',
+   'module-protocol-pulse/modules/module-combine-sink.c',
++  'module-protocol-pulse/modules/module-compress-offload-sink.c',
++  'module-protocol-pulse/modules/module-compress-offload-forwarder.c',
+   'module-protocol-pulse/modules/module-device-manager.c',
+   'module-protocol-pulse/modules/module-device-restore.c',
+   'module-protocol-pulse/modules/module-echo-cancel.c',
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+new file mode 100644
+index 0000000..33054e4
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-forwarder.c
+@@ -0,0 +1,649 @@
++/* PipeWire */
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
++
++#include <errno.h>
++#include <limits.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++
++#include <spa/param/audio/compressed.h>
++#include <spa/param/audio/format-utils.h>
++#include <spa/param/audio/raw.h>
++#include <spa/utils/result.h>
++#include <spa/utils/string.h>
++#include <pipewire/pipewire.h>
++
++#include "../module.h"
++
++#define NAME "compress-offload-forwarder"
++
++#define DEFAULT_CODEC "mp3"
++#define DEFAULT_RATE 48000u
++#define DEFAULT_CHANNELS 2u
++#define DEFAULT_BITRATE 128000u
++#define DEFAULT_BLOCK_SIZE (16u * 1024u)
++
++static const char *const forwarder_options =
++	"source_sink=<Pulse-visible compress sink node.name> "
++	"target_sink=<PAL compress sink node.name> "
++	"codec=<codec name, default mp3> "
++	"rate=<sample rate, default 48000> "
++	"channels=<number of channels, default 2> "
++	"bitrate=<bit rate, default 128000> "
++	"block_size=<buffer size in bytes, default 16384>";
++
++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
++#define PW_LOG_TOPIC_DEFAULT mod_topic
++
++struct forwarder_data {
++	struct pw_core *core;
++	struct pw_loop *loop;
++	struct spa_source *activate_event;
++	struct spa_hook core_listener;
++	struct pw_registry *registry;
++	struct spa_hook registry_listener;
++
++	struct pw_stream *capture;
++	struct spa_hook capture_listener;
++	struct pw_stream *playback;
++	struct spa_hook playback_listener;
++
++	char source_name[256];
++	char monitor_name[280];
++	char target_name[256];
++	char codec[32];
++	uint32_t rate;
++	uint32_t channels;
++	uint32_t bitrate;
++	uint32_t block_size;
++	uint32_t target_id;
++	uint8_t *pending_data;
++	uint32_t pending_size;
++	uint32_t pending_offset;
++	uint8_t capture_streaming:1;
++	uint8_t logged_first_buffer:1;
++	uint8_t logged_first_output_buffer:1;
++	uint8_t logged_silence_buffer:1;
++	uint8_t activate_pending:1;
++	uint8_t playback_active:1;
++	uint8_t playback_failed:1;
++};
++
++static int create_playback_stream(struct forwarder_data *d);
++static void set_playback_active(struct forwarder_data *d, bool active);
++static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason);
++
++static void request_playback_activation(struct forwarder_data *d)
++{
++	if (d->activate_event == NULL || d->activate_pending)
++		return;
++	d->activate_pending = true;
++	pw_loop_signal_event(d->loop, d->activate_event);
++}
++
++static void playback_activate_event(void *data, uint64_t count)
++{
++	struct forwarder_data *d = data;
++
++	d->activate_pending = false;
++	maybe_create_playback_stream(d, "first-audio-buffer");
++}
++
++static bool buffer_is_zeroed(const void *data, uint32_t size)
++{
++	const uint8_t *bytes = data;
++	uint32_t index;
++
++	for (index = 0; index < size; index++) {
++		if (bytes[index] != 0)
++			return false;
++	}
++	return true;
++}
++
++static void clear_pending_data(struct forwarder_data *d)
++{
++	free(d->pending_data);
++	d->pending_data = NULL;
++	d->pending_size = 0;
++	d->pending_offset = 0;
++}
++
++static void compact_pending_data(struct forwarder_data *d)
++{
++	uint32_t remaining;
++
++	if (d->pending_offset == 0)
++		return;
++	if (d->pending_offset >= d->pending_size) {
++		clear_pending_data(d);
++		return;
++	}
++	remaining = d->pending_size - d->pending_offset;
++	memmove(d->pending_data, d->pending_data + d->pending_offset, remaining);
++	d->pending_size = remaining;
++	d->pending_offset = 0;
++}
++
++static int append_pending_data(struct forwarder_data *d, const void *data, uint32_t size)
++{
++	uint8_t *pending_data;
++
++	if (size == 0)
++		return 0;
++	compact_pending_data(d);
++	if (d->pending_size > UINT32_MAX - size)
++		return -EOVERFLOW;
++	pending_data = realloc(d->pending_data, d->pending_size + size);
++	if (pending_data == NULL)
++		return -errno;
++	d->pending_data = pending_data;
++	memcpy(d->pending_data + d->pending_size, data, size);
++	d->pending_size += size;
++	return 0;
++}
++
++static void maybe_create_playback_stream(struct forwarder_data *d, const char *reason)
++{
++	int res;
++
++	if (!d->capture_streaming)
++		return;
++	if (d->playback != NULL) {
++		set_playback_active(d, true);
++		return;
++	}
++	if (d->target_id == PW_ID_ANY) {
++		pw_log_debug("compress-forwarder target:%s not resolved yet, defer output create (%s)",
++				d->target_name, reason);
++		return;
++	}
++	res = create_playback_stream(d);
++	if (res < 0)
++		pw_log_error("compress-forwarder target:%s create failed (%s): %s",
++				d->target_name, reason, spa_strerror(res));
++	else
++		set_playback_active(d, true);
++}
++
++static void destroy_playback_stream(struct forwarder_data *d)
++{
++	clear_pending_data(d);
++	if (d->playback == NULL)
++		return;
++	spa_hook_remove(&d->playback_listener);
++	pw_stream_destroy(d->playback);
++	d->playback = NULL;
++	d->playback_active = false;
++	d->playback_failed = false;
++}
++
++static const struct spa_pod *build_raw_format(struct forwarder_data *d,
++		struct spa_pod_builder *builder, uint32_t id)
++{
++	struct spa_audio_info_raw info;
++
++	spa_zero(info);
++	info.format = SPA_AUDIO_FORMAT_S16_LE;
++	info.rate = d->rate;
++	info.channels = d->channels;
++	if (info.channels == 1) {
++		info.position[0] = SPA_AUDIO_CHANNEL_MONO;
++	} else {
++		info.channels = 2;
++		info.position[0] = SPA_AUDIO_CHANNEL_FL;
++		info.position[1] = SPA_AUDIO_CHANNEL_FR;
++	}
++	return spa_format_audio_raw_build(builder, id, &info);
++}
++
++static const struct spa_pod *build_encoded_format(struct forwarder_data *d,
++		struct spa_pod_builder *builder, uint32_t id)
++{
++	struct spa_audio_info info;
++
++	spa_zero(info);
++	info.media_type = SPA_MEDIA_TYPE_audio;
++	info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++	info.info.mp3.rate = d->rate;
++	info.info.mp3.channels = d->channels;
++	info.info.mp3.channel_mode = d->channels == 1 ?
++		SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
++
++	return spa_format_audio_build(builder, id, &info);
++}
++
++static void playback_state_changed(void *data, enum pw_stream_state old,
++		enum pw_stream_state state, const char *error)
++{
++	struct forwarder_data *d = data;
++
++	pw_log_debug("compress-forwarder target:%s state %d -> %d%s%s",
++			d->target_name, old, state, error ? ": " : "", error ? error : "");
++	if (state == PW_STREAM_STATE_ERROR)
++		d->playback_failed = true;
++}
++
++static void set_playback_active(struct forwarder_data *d, bool active)
++{
++	if (d->playback == NULL || d->playback_active == active)
++		return;
++	pw_log_debug("compress-forwarder target:%s active=%d", d->target_name, active);
++	pw_stream_set_active(d->playback, active);
++	d->playback_active = active;
++}
++
++static void capture_state_changed(void *data, enum pw_stream_state old,
++		enum pw_stream_state state, const char *error)
++{
++	struct forwarder_data *d = data;
++
++	pw_log_debug("compress-forwarder source:%s state %d -> %d%s%s",
++			d->monitor_name, old, state, error ? ": " : "", error ? error : "");
++	if (d->playback_failed)
++		destroy_playback_stream(d);
++	d->capture_streaming = state == PW_STREAM_STATE_STREAMING;
++	if (state == PW_STREAM_STATE_PAUSED || state == PW_STREAM_STATE_ERROR)
++		set_playback_active(d, false);
++}
++
++static void capture_process(void *data)
++{
++	struct forwarder_data *d = data;
++	struct pw_buffer *in_buf, *out_buf;
++	struct spa_data *in_data, *out_data;
++	uint32_t in_offset, in_size, out_size, copy_size;
++	const void *input_data;
++	const void *copy_data;
++	uint32_t copy_available;
++	int res;
++
++	in_buf = pw_stream_dequeue_buffer(d->capture);
++	if (in_buf == NULL)
++		return;
++
++	in_data = &in_buf->buffer->datas[0];
++	if (in_data->data == NULL || in_data->chunk == NULL) {
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	in_offset = SPA_MIN(in_data->chunk->offset, in_data->maxsize);
++	in_size = SPA_MIN(in_data->chunk->size, in_data->maxsize - in_offset);
++	input_data = SPA_PTROFF(in_data->data, in_offset, void);
++	if (in_size == 0) {
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	if (buffer_is_zeroed(input_data, in_size)) {
++		if (!d->logged_silence_buffer) {
++			pw_log_debug("compress-forwarder source:%s ignoring zeroed startup buffer size=%u flags=0x%x",
++					d->monitor_name, in_size, in_data->chunk->flags);
++			d->logged_silence_buffer = true;
++		}
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	if (!d->logged_first_buffer) {
++		const uint8_t *bytes = SPA_PTROFF(in_data->data, in_offset, const uint8_t);
++		pw_log_debug("compress-forwarder source:%s first non-silence buffer size=%u offset=%u flags=0x%x",
++				d->monitor_name, in_size, in_offset, in_data->chunk->flags);
++		pw_log_debug("compress-forwarder source:%s first non-silence bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
++				d->monitor_name,
++				in_size > 0 ? bytes[0] : 0,
++				in_size > 1 ? bytes[1] : 0,
++				in_size > 2 ? bytes[2] : 0,
++				in_size > 3 ? bytes[3] : 0,
++				in_size > 4 ? bytes[4] : 0,
++				in_size > 5 ? bytes[5] : 0,
++				in_size > 6 ? bytes[6] : 0,
++				in_size > 7 ? bytes[7] : 0);
++		d->logged_first_buffer = true;
++	}
++
++	if (d->playback_failed)
++		destroy_playback_stream(d);
++
++	res = append_pending_data(d, input_data, in_size);
++	if (res < 0) {
++		pw_log_error("compress-forwarder source:%s failed to preserve input before target write: %s",
++				d->monitor_name, spa_strerror(res));
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	if (d->playback == NULL) {
++		request_playback_activation(d);
++		if (d->playback == NULL) {
++			pw_log_debug("compress-forwarder source:%s preserved %u bytes pending target create total=%u",
++					d->monitor_name, in_size, d->pending_size - d->pending_offset);
++			pw_stream_queue_buffer(d->capture, in_buf);
++			return;
++		}
++	}
++	if (!d->playback_active)
++		set_playback_active(d, true);
++	if (d->playback_failed || !d->playback_active) {
++		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending inactive target total=%u",
++				d->monitor_name, in_size, d->pending_size - d->pending_offset);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_buf = pw_stream_dequeue_buffer(d->playback);
++	if (out_buf == NULL) {
++		pw_log_debug("compress-forwarder source:%s preserved %u bytes pending output buffer total=%u",
++				d->monitor_name, in_size, d->pending_size - d->pending_offset);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_data = &out_buf->buffer->datas[0];
++	if (out_data->data == NULL || out_data->chunk == NULL) {
++		pw_stream_queue_buffer(d->playback, out_buf);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++
++	out_size = out_data->maxsize;
++	if (out_size == 0) {
++		pw_stream_queue_buffer(d->playback, out_buf);
++		pw_stream_queue_buffer(d->capture, in_buf);
++		return;
++	}
++	copy_data = d->pending_data + d->pending_offset;
++	copy_available = d->pending_size - d->pending_offset;
++	copy_size = SPA_MIN(copy_available, out_size);
++	memcpy(out_data->data, copy_data, copy_size);
++	d->pending_offset += copy_size;
++	if (d->pending_offset >= d->pending_size)
++		clear_pending_data(d);
++
++	out_data->chunk->offset = 0;
++	out_data->chunk->size = copy_size;
++	out_data->chunk->stride = 1;
++	out_buf->size = copy_size;
++
++	if (!d->logged_first_output_buffer) {
++		const uint8_t *out_bytes = out_data->data;
++		pw_log_debug("compress-forwarder target:%s queue buffer copy_size=%u out_max=%u chunk=%u/%u/%d bytes=%02x %02x %02x %02x %02x %02x %02x %02x",
++				d->target_name, copy_size, out_data->maxsize,
++				out_data->chunk->offset, out_data->chunk->size,
++				out_data->chunk->stride,
++				copy_size > 0 ? out_bytes[0] : 0,
++				copy_size > 1 ? out_bytes[1] : 0,
++				copy_size > 2 ? out_bytes[2] : 0,
++				copy_size > 3 ? out_bytes[3] : 0,
++				copy_size > 4 ? out_bytes[4] : 0,
++				copy_size > 5 ? out_bytes[5] : 0,
++				copy_size > 6 ? out_bytes[6] : 0,
++				copy_size > 7 ? out_bytes[7] : 0);
++		d->logged_first_output_buffer = true;
++	}
++
++	pw_stream_queue_buffer(d->playback, out_buf);
++	pw_stream_queue_buffer(d->capture, in_buf);
++}
++
++static const struct pw_stream_events capture_events = {
++	PW_VERSION_STREAM_EVENTS,
++	.state_changed = capture_state_changed,
++	.process = capture_process,
++};
++
++static const struct pw_stream_events playback_events = {
++	PW_VERSION_STREAM_EVENTS,
++	.state_changed = playback_state_changed,
++};
++
++static void registry_global(void *data, uint32_t id, uint32_t permissions,
++		const char *type, uint32_t version, const struct spa_dict *props)
++{
++	struct forwarder_data *d = data;
++	const char *name;
++
++	if (!spa_streq(type, PW_TYPE_INTERFACE_Node) || props == NULL)
++		return;
++	name = spa_dict_lookup(props, PW_KEY_NODE_NAME);
++	if (!spa_streq(name, d->target_name))
++		return;
++	d->target_id = id;
++	pw_log_info("compress-forwarder target:%s resolved id=%u", d->target_name, id);
++}
++
++static void registry_global_remove(void *data, uint32_t id)
++{
++	struct forwarder_data *d = data;
++
++	if (id != d->target_id)
++		return;
++	pw_log_info("compress-forwarder target:%s removed id=%u", d->target_name, id);
++	d->target_id = PW_ID_ANY;
++	destroy_playback_stream(d);
++}
++
++static const struct pw_registry_events registry_events = {
++	PW_VERSION_REGISTRY_EVENTS,
++	.global = registry_global,
++	.global_remove = registry_global_remove,
++};
++
++static int create_playback_stream(struct forwarder_data *d)
++{
++	struct pw_properties *props;
++	const struct spa_pod *params[2];
++	uint8_t buffer[1024];
++	struct spa_pod_builder builder;
++	uint32_t n_params = 0;
++	int res;
++
++	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Output/Audio",
++			PW_KEY_NODE_NAME, "compress-offload-forwarder-output",
++			PW_KEY_MEDIA_TYPE, "Audio",
++			PW_KEY_MEDIA_CATEGORY, "Playback",
++			PW_KEY_MEDIA_ROLE, "Music",
++			PW_KEY_TARGET_OBJECT, d->target_name,
++			PW_KEY_NODE_AUTOCONNECT, "true",
++			PW_KEY_STREAM_DONT_REMIX, "true",
++			"node.dont-reconnect", "true",
++			PW_KEY_NODE_RATE, "1/48000",
++			"compress.offload", "true",
++			"codec.type", d->codec,
++			NULL);
++	if (props == NULL)
++		return -errno;
++	pw_properties_setf(props, "codec.sample_rate", "%u", d->rate);
++	pw_properties_setf(props, "codec.channels", "%u", d->channels);
++	pw_properties_setf(props, "codec.bit_rate", "%u", d->bitrate);
++	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
++
++	d->playback = pw_stream_new(d->core, "compress offload forwarder output", props);
++	if (d->playback == NULL)
++		return -errno;
++	pw_stream_add_listener(d->playback, &d->playback_listener, &playback_events, d);
++
++	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
++	params[n_params++] = build_encoded_format(d, &builder, SPA_PARAM_EnumFormat);
++	pw_log_debug("compress-forwarder target:%s connect target-id=%u", d->target_name, d->target_id);
++	res = pw_stream_connect(d->playback, PW_DIRECTION_OUTPUT, d->target_id,
++			PW_STREAM_FLAG_AUTOCONNECT |
++			PW_STREAM_FLAG_NO_CONVERT |
++			PW_STREAM_FLAG_MAP_BUFFERS |
++			PW_STREAM_FLAG_RT_PROCESS,
++			params, n_params);
++	if (res < 0) {
++		destroy_playback_stream(d);
++		return res;
++	}
++	pw_stream_set_active(d->playback, false);
++	d->playback_active = false;
++	d->playback_failed = false;
++	return 0;
++}
++
++static int create_capture_stream(struct forwarder_data *d)
++{
++	struct pw_properties *props;
++	const struct spa_pod *params[2];
++	uint8_t buffer[1024];
++	struct spa_pod_builder builder;
++	uint32_t n_params = 0;
++	int res;
++
++	props = pw_properties_new(PW_KEY_MEDIA_CLASS, "Stream/Input/Audio",
++			PW_KEY_NODE_NAME, "compress-offload-forwarder-capture",
++			PW_KEY_TARGET_OBJECT, d->source_name,
++			PW_KEY_NODE_AUTOCONNECT, "true",
++			PW_KEY_STREAM_CAPTURE_SINK, "true",
++			PW_KEY_STREAM_DONT_REMIX, "true",
++			"node.dont-reconnect", "true",
++			NULL);
++	if (props == NULL)
++		return -errno;
++	pw_properties_setf(props, PW_KEY_NODE_RATE, "1/%u", d->rate);
++
++	d->capture = pw_stream_new(d->core, "compress offload forwarder capture", props);
++	if (d->capture == NULL)
++		return -errno;
++	pw_stream_add_listener(d->capture, &d->capture_listener, &capture_events, d);
++
++	spa_pod_builder_init(&builder, buffer, sizeof(buffer));
++	params[n_params++] = build_raw_format(d, &builder, SPA_PARAM_EnumFormat);
++	res = pw_stream_connect(d->capture, PW_DIRECTION_INPUT, PW_ID_ANY,
++			PW_STREAM_FLAG_AUTOCONNECT |
++			PW_STREAM_FLAG_MAP_BUFFERS |
++			PW_STREAM_FLAG_RT_PROCESS,
++			params, n_params);
++	if (res < 0)
++		return res;
++	pw_stream_set_active(d->capture, true);
++	return 0;
++}
++
++static void core_error(void *data, uint32_t id, int seq, int res, const char *message)
++{
++	struct module *module = data;
++
++	pw_log_error("compress-forwarder error id:%u seq:%d res:%d (%s): %s",
++			id, seq, res, spa_strerror(res), message);
++	if (id == PW_ID_CORE && res == -EPIPE)
++		module_schedule_unload(module);
++}
++
++static const struct pw_core_events core_events = {
++	PW_VERSION_CORE_EVENTS,
++	.error = core_error,
++};
++
++static int module_compress_offload_forwarder_load(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++	int res;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++	d->loop = pw_context_get_main_loop(module->impl->context);
++	if (d->loop == NULL)
++		return -EINVAL;
++	d->activate_event = pw_loop_add_event(d->loop, playback_activate_event, d);
++	if (d->activate_event == NULL)
++		return -errno;
++	d->core = pw_context_connect(module->impl->context, NULL, 0);
++	if (d->core == NULL)
++		return -errno;
++	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
++	d->target_id = PW_ID_ANY;
++	d->registry = pw_core_get_registry(d->core, PW_VERSION_REGISTRY, 0);
++	if (d->registry == NULL)
++		return -errno;
++	pw_registry_add_listener(d->registry, &d->registry_listener, &registry_events, d);
++
++	res = create_capture_stream(d);
++	if (res < 0)
++		return res;
++
++	pw_log_info("compress-forwarder loaded: source=%s monitor=%s target=%s codec=%s rate=%u channels=%u",
++			d->source_name, d->monitor_name, d->target_name,
++			d->codec, d->rate, d->channels);
++	module_emit_loaded(module, 0);
++	return 0;
++}
++
++static int module_compress_offload_forwarder_unload(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++
++	if (d->capture != NULL) {
++		spa_hook_remove(&d->capture_listener);
++		pw_stream_destroy(d->capture);
++		d->capture = NULL;
++	}
++	destroy_playback_stream(d);
++	if (d->registry != NULL) {
++		spa_hook_remove(&d->registry_listener);
++		pw_proxy_destroy((struct pw_proxy*)d->registry);
++		d->registry = NULL;
++	}
++	if (d->core != NULL) {
++		spa_hook_remove(&d->core_listener);
++		pw_core_disconnect(d->core);
++		d->core = NULL;
++	}
++	if (d->activate_event != NULL) {
++		pw_loop_destroy_source(d->loop, d->activate_event);
++		d->activate_event = NULL;
++	}
++	d->loop = NULL;
++	return 0;
++}
++
++static int module_compress_offload_forwarder_prepare(struct module *module)
++{
++	struct forwarder_data *d = module->user_data;
++	struct pw_properties *props = module->props;
++	const char *str;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++	str = pw_properties_get(props, "source_sink");
++	spa_scnprintf(d->source_name, sizeof(d->source_name), "%s",
++			str ? str : "pal_speaker_compress");
++	str = pw_properties_get(props, "target_sink");
++	spa_scnprintf(d->target_name, sizeof(d->target_name), "%s",
++			str ? str : "pal_sink_speaker_compress");
++	str = pw_properties_get(props, "codec");
++	spa_scnprintf(d->codec, sizeof(d->codec), "%s", str ? str : DEFAULT_CODEC);
++	d->rate = pw_properties_get_uint32(props, "rate", DEFAULT_RATE);
++	d->channels = pw_properties_get_uint32(props, "channels", DEFAULT_CHANNELS);
++	d->bitrate = pw_properties_get_uint32(props, "bitrate", DEFAULT_BITRATE);
++	d->block_size = pw_properties_get_uint32(props, "block_size", DEFAULT_BLOCK_SIZE);
++	spa_scnprintf(d->monitor_name, sizeof(d->monitor_name), "%s.monitor", d->source_name);
++
++	if (!spa_streq(d->codec, "mp3")) {
++		pw_log_warn("compress-forwarder only supports mp3 right now, requested codec=%s", d->codec);
++		return -ENOTSUP;
++	}
++	if (d->channels == 0)
++		d->channels = DEFAULT_CHANNELS;
++	if (d->rate == 0)
++		d->rate = DEFAULT_RATE;
++	if (d->block_size == 0)
++		d->block_size = DEFAULT_BLOCK_SIZE;
++
++	return 0;
++}
++
++static const struct spa_dict_item module_compress_offload_forwarder_info[] = {
++	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
++	{ PW_KEY_MODULE_DESCRIPTION, "Forward Pulse compress-offload sink data to PAL compress sink" },
++	{ PW_KEY_MODULE_USAGE,       forwarder_options },
++	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
++};
++
++DEFINE_MODULE_INFO(module_compress_offload_forwarder) = {
++	.name       = "module-compress-offload-forwarder",
++	.prepare    = module_compress_offload_forwarder_prepare,
++	.load       = module_compress_offload_forwarder_load,
++	.unload     = module_compress_offload_forwarder_unload,
++	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_forwarder_info),
++	.data_size  = sizeof(struct forwarder_data),
++};
+diff --git a/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+new file mode 100644
+index 0000000..243cc8e
+--- /dev/null
++++ b/src/modules/module-protocol-pulse/modules/module-compress-offload-sink.c
+@@ -0,0 +1,293 @@
++/* PipeWire */
++/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
++/* SPDX-License-Identifier: BSD-3-Clause-Clear */
++
++#include <errno.h>
++#include <stdlib.h>
++
++#include <spa/utils/result.h>
++#include <pipewire/pipewire.h>
++
++#include "../module.h"
++
++static const char *const pulse_module_options =
++	"sink_name=<name of sink> "
++	"sink_properties=<properties for the sink> "
++	"target_sink=<node.name of the downstream compress-offload sink> "
++	"codec=<codec name, default mp3> "
++	"rate=<sample rate, default 44100> "
++	"channels=<number of channels, default 2> "
++	"bitrate=<bit rate, default 128000>";
++
++#define NAME "compress-offload-sink"
++
++PW_LOG_TOPIC_STATIC(mod_topic, "mod." NAME);
++#define PW_LOG_TOPIC_DEFAULT mod_topic
++
++struct module_compress_offload_sink_data {
++	struct pw_core *core;
++	struct spa_hook core_listener;
++
++	struct pw_proxy *proxy;
++	struct spa_hook proxy_listener;
++};
++
++static void module_proxy_removed(void *data)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder proxy removed: proxy=%p", d->proxy);
++	pw_proxy_destroy(d->proxy);
++}
++
++static void module_proxy_destroy(void *data)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder proxy destroy: proxy=%p - scheduling module unload", d->proxy);
++	spa_hook_remove(&d->proxy_listener);
++	d->proxy = NULL;
++	module_schedule_unload(module);
++}
++
++static void module_proxy_bound_props(void *data, uint32_t global_id, const struct spa_dict *props)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("proxy %p bound id:%u module_index=%u", d->proxy, global_id, module->index);
++	pw_log_debug("compress-forwarder node successfully created and bound, emitting loaded");
++	module_emit_loaded(module, 0);
++}
++
++static void module_proxy_error(void *data, int seq, int res, const char *message)
++{
++	struct module *module = data;
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_error("proxy %p error %d: %s", d->proxy, res, message);
++	pw_proxy_destroy(d->proxy);
++}
++
++static const struct pw_proxy_events proxy_events = {
++	PW_VERSION_PROXY_EVENTS,
++	.removed      = module_proxy_removed,
++	.bound_props  = module_proxy_bound_props,
++	.error        = module_proxy_error,
++	.destroy      = module_proxy_destroy,
++};
++
++static void module_core_error(void *data, uint32_t id, int seq, int res, const char *message)
++{
++	struct module *module = data;
++
++	pw_log_error("error id:%u seq:%d res:%d (%s): %s",
++			id, seq, res, spa_strerror(res), message);
++
++	if (id == PW_ID_CORE && res == -EPIPE)
++		module_schedule_unload(module);
++}
++
++static const struct pw_core_events core_events = {
++	PW_VERSION_CORE_EVENTS,
++	.error = module_core_error,
++};
++
++static int module_compress_offload_sink_load(struct module *module)
++{
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_info("compress-forwarder load: node=%s target=%s codec=%s rate=%s channels=%s bitrate=%s",
++			pw_properties_get(module->props, PW_KEY_NODE_NAME),
++			pw_properties_get(module->props, "compress.target.object"),
++			pw_properties_get(module->props, "codec.type"),
++			pw_properties_get(module->props, "codec.sample_rate"),
++			pw_properties_get(module->props, "codec.channels"),
++			pw_properties_get(module->props, "codec.bit_rate"));
++
++	d->core = pw_context_connect(module->impl->context, NULL, 0);
++	if (d->core == NULL) {
++		pw_log_error("compress-forwarder core connect failed: errno=%d (%s)",
++				errno, spa_strerror(-errno));
++		return -errno;
++	}
++
++	pw_log_debug("compress-forwarder core connected: core=%p", d->core);
++	pw_core_add_listener(d->core, &d->core_listener, &core_events, module);
++	pw_properties_setf(module->props, "pulse.module.id", "%u", module->index);
++
++	d->proxy = pw_core_create_object(d->core,
++					 "adapter", PW_TYPE_INTERFACE_Node, PW_VERSION_NODE,
++					 module->props ? &module->props->dict : NULL, 0);
++	if (d->proxy == NULL) {
++		pw_log_error("compress-forwarder adapter create failed: errno=%d (%s)",
++				errno, spa_strerror(-errno));
++		return -errno;
++	}
++
++	pw_log_debug("compress-forwarder adapter create requested: proxy=%p - waiting for bound_props", d->proxy);
++	pw_proxy_add_listener(d->proxy, &d->proxy_listener, &proxy_events, module);
++	return SPA_RESULT_RETURN_ASYNC(0);
++}
++
++static int module_compress_offload_sink_unload(struct module *module)
++{
++	struct module_compress_offload_sink_data *d = module->user_data;
++
++	pw_log_debug("compress-forwarder unload: proxy=%p core=%p - cleaning up", d->proxy, d->core);
++	if (d->proxy != NULL) {
++		spa_hook_remove(&d->proxy_listener);
++		pw_proxy_destroy(d->proxy);
++		d->proxy = NULL;
++	}
++	if (d->core != NULL) {
++		spa_hook_remove(&d->core_listener);
++		pw_core_disconnect(d->core);
++		d->core = NULL;
++	}
++	return 0;
++}
++
++static int module_compress_offload_sink_prepare(struct module * const module)
++{
++	struct pw_properties * const props = module->props;
++	const char *str;
++	uint32_t rate = 44100;
++	uint32_t channels = 2;
++	uint32_t bitrate = 128000;
++
++	PW_LOG_TOPIC_INIT(mod_topic);
++
++	if ((str = pw_properties_get(props, "sink_name")) != NULL) {
++		pw_log_debug("compress-forwarder option: sink_name=%s", str);
++		pw_properties_set(props, PW_KEY_NODE_NAME, str);
++		pw_properties_set(props, "sink_name", NULL);
++	} else {
++		pw_log_debug("compress-forwarder option: sink_name missing, using default");
++		pw_properties_set(props, PW_KEY_NODE_NAME, "compress-offload-sink");
++	}
++
++	if ((str = pw_properties_get(props, "sink_properties")) != NULL) {
++		pw_log_debug("compress-forwarder option: sink_properties=%s", str);
++		module_args_add_props(props, str);
++		pw_properties_set(props, "sink_properties", NULL);
++	}
++
++	if ((str = pw_properties_get(props, "target_sink")) != NULL) {
++		pw_log_debug("compress-forwarder option: target_sink=%s", str);
++		pw_properties_set(props, "compress.target.object", str);
++		pw_properties_set(props, "target_sink", NULL);
++	} else {
++		pw_log_warn("compress-forwarder option: target_sink missing; stream will not have explicit compress target");
++	}
++
++	if ((str = pw_properties_get(props, "rate")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			rate = v;
++		pw_properties_set(props, "rate", NULL);
++	}
++	if ((str = pw_properties_get(props, "channels")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			channels = v;
++		pw_properties_set(props, "channels", NULL);
++	}
++	if ((str = pw_properties_get(props, "bitrate")) != NULL) {
++		uint32_t v = (uint32_t)atoi(str);
++		if (v > 0)
++			bitrate = v;
++		pw_properties_set(props, "bitrate", NULL);
++	}
++	if ((str = pw_properties_get(props, "channel_map")) != NULL) {
++		pw_properties_set(props, "audio.position", str);
++		pw_properties_set(props, "channel_map", NULL);
++	} else {
++		switch (channels) {
++		case 1:
++			pw_properties_set(props, "audio.position", "[ MONO ]");
++			break;
++		case 2:
++			pw_properties_set(props, "audio.position", "[ FL FR ]");
++			break;
++		case 3:
++			pw_properties_set(props, "audio.position", "[ FL FR LFE ]");
++			break;
++		case 4:
++			pw_properties_set(props, "audio.position", "[ FL FR RL RR ]");
++			break;
++		case 5:
++			pw_properties_set(props, "audio.position", "[ FL FR FC RL RR ]");
++			break;
++		case 6:
++			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR ]");
++			break;
++		case 8:
++			pw_properties_set(props, "audio.position", "[ FL FR FC LFE RL RR SL SR ]");
++			break;
++		default:
++			break;
++		}
++	}
++
++	str = pw_properties_get(props, "codec");
++	pw_properties_set(props, "codec.type", str ? str : "mp3");
++	pw_properties_setf(props, "codec.sample_rate", "%u", rate);
++	pw_properties_setf(props, "codec.channels",    "%u", channels);
++	pw_properties_setf(props, "codec.bit_rate",    "%u", bitrate);
++	pw_properties_set(props, "codec", NULL);
++
++	if (pw_properties_get(props, PW_KEY_MEDIA_CLASS) == NULL)
++		pw_properties_set(props, PW_KEY_MEDIA_CLASS, "Audio/Sink");
++	if (pw_properties_get(props, PW_KEY_NODE_DESCRIPTION) == NULL)
++		pw_properties_setf(props, PW_KEY_NODE_DESCRIPTION, "%s (compress offload)",
++				pw_properties_get(props, PW_KEY_NODE_NAME));
++
++	/*
++	 * Advertise this node as an encoded-only sink so WirePlumber's
++	 * canPassthrough() allows linking compress streams to it.
++	 * audio.format=S16LE is kept as the synthetic PCM sample_spec that
++	 * Pulse clients see in pactl; no PCM conversion ever occurs.
++	 */
++	pw_properties_set(props, PW_KEY_AUDIO_FORMAT,                "S16LE");
++	pw_properties_setf(props, PW_KEY_AUDIO_RATE,                 "%u", rate);
++	pw_properties_setf(props, PW_KEY_AUDIO_CHANNELS,             "%u", channels);
++	pw_properties_set(props, "item.node.supports-encoded-fmts",  "true");
++	pw_properties_set(props, PW_KEY_NODE_VIRTUAL,                "true");
++	pw_properties_set(props, PW_KEY_PRIORITY_SESSION,            "1");
++	pw_properties_set(props, PW_KEY_PRIORITY_DRIVER,             "1");
++	pw_properties_set(props, "monitor.channel-volumes",          "true");
++	pw_properties_set(props, "monitor.passthrough",              "true");
++	pw_properties_set(props, "compress.offload",                 "true");
++	pw_properties_set(props, PW_KEY_FACTORY_NAME,                "support.null-audio-sink");
++
++	pw_log_info("prepared compress-forwarder alias: name=%s target=%s codec=%s rate=%u channels=%u bitrate=%u media.class=%s audio.format=%s virtual=%s factory=%s",
++			pw_properties_get(props, PW_KEY_NODE_NAME),
++			pw_properties_get(props, "compress.target.object"),
++			pw_properties_get(props, "codec.type"),
++			rate, channels, bitrate,
++			pw_properties_get(props, PW_KEY_MEDIA_CLASS),
++			pw_properties_get(props, PW_KEY_AUDIO_FORMAT),
++			pw_properties_get(props, PW_KEY_NODE_VIRTUAL),
++			pw_properties_get(props, PW_KEY_FACTORY_NAME));
++
++	return 0;
++}
++
++static const struct spa_dict_item module_compress_offload_sink_info[] = {
++	{ PW_KEY_MODULE_AUTHOR,      "Qualcomm Technologies, Inc." },
++	{ PW_KEY_MODULE_DESCRIPTION, "Pulse-visible alias sink for compressed offload playback" },
++	{ PW_KEY_MODULE_USAGE,       pulse_module_options },
++	{ PW_KEY_MODULE_VERSION,     PACKAGE_VERSION },
++};
++
++DEFINE_MODULE_INFO(module_compress_offload_sink) = {
++	.name       = "module-compress-offload-sink",
++	.prepare    = module_compress_offload_sink_prepare,
++	.load       = module_compress_offload_sink_load,
++	.unload     = module_compress_offload_sink_unload,
++	.properties = &SPA_DICT_INIT_ARRAY(module_compress_offload_sink_info),
++	.data_size  = sizeof(struct module_compress_offload_sink_data),
++};
+diff --git a/src/modules/module-protocol-pulse/pulse-server.c b/src/modules/module-protocol-pulse/pulse-server.c
+index eb3233b..61f0dfb 100644
+--- a/src/modules/module-protocol-pulse/pulse-server.c
++++ b/src/modules/module-protocol-pulse/pulse-server.c
+@@ -84,6 +84,9 @@ struct temporary_move_data {
+ 	uint8_t used:1;
+ };
+
++/* Buffer size used for compress-offload streams (frame_size == 1). */
++#define COMPRESS_OFFLOAD_BUF_SIZE  16484u
++
+ static struct sample *find_sample(struct impl *impl, uint32_t index, const char *name)
+ {
+ 	union pw_map_item *item;
+@@ -1199,10 +1202,18 @@ static const struct spa_pod *get_buffers_param(struct stream *s,
+ 	blocks = 1;
+ 	stride = s->frame_size;
+
++	/* compressed offload uses byte granularity */
++	if (s->frame_size == 1) {
++		size = COMPRESS_OFFLOAD_BUF_SIZE;
++		pw_log_debug("[%s] get_buffers_param: compress offload path size=%u", s->client->name, size);
++		goto build_buffers_param;
++	}
++
+ 	size = defs->quantum_limit * s->frame_size;
+
+ 	pw_log_info("[%s] stride %d size %u", s->client->name, stride, size);
+
++build_buffers_param:
+ 	param = spa_pod_builder_add_object(b,
+ 			SPA_TYPE_OBJECT_ParamBuffers, SPA_PARAM_Buffers,
+ 			SPA_PARAM_BUFFERS_buffers, SPA_POD_CHOICE_RANGE_Int(MIN_BUFFERS,
+@@ -1228,6 +1239,23 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
+ 	if (id != SPA_PARAM_Format || param == NULL)
+ 		return;
+
++	/* For compress-offload streams, force byte-granularity regardless
++	 * of negotiated format (we connect with S16LE but data is compressed). */
++	{
++		const char *co = stream->props ?
++			pw_properties_get(stream->props, "compress.offload") : NULL;
++		if (co && pw_properties_parse_bool(co)) {
++			uint32_t media_type = 0, media_subtype = 0;
++			spa_format_parse(param, &media_type, &media_subtype);
++			stream->frame_size = 1;
++			stream->rate = stream->ss.rate ? stream->ss.rate :
++				pw_properties_get_uint32(stream->props, "codec.sample_rate", 44100);
++			pw_log_debug("[%s] compress-offload stream_param_changed: forcing frame_size=1 rate=%u subtype=%u",
++				stream->client->name, stream->rate, media_subtype);
++			goto stream_param_format_done;
++		}
++	}
++
+ 	if ((res = format_parse_param(param, false, &stream->ss, &stream->map, NULL, NULL)) < 0) {
+ 		pw_stream_set_error(stream->stream, res, "format not supported");
+ 		return;
+@@ -1243,6 +1271,9 @@ static void stream_param_changed(void *data, uint32_t id, const struct spa_pod *
+ 		return;
+ 	}
+ 	stream->rate = stream->ss.rate;
++stream_param_format_done:
++	pw_log_debug("[%s] stream param done: frame_size=%u rate=%u ss.format=%u",
++			stream->client->name, stream->frame_size, stream->rate, stream->ss.format);
+
+ 	if (stream->create_tag != SPA_ID_INVALID) {
+ 		struct pw_manager_object *peer;
+@@ -1583,6 +1614,98 @@ static void log_format_info(struct impl *impl, enum spa_log_level level, struct
+ 				impl, it->key, it->value);
+ }
+
++static const struct spa_pod *build_compress_offload_format(struct spa_pod_builder *b,
++		uint32_t id, const struct pw_properties *props, uint32_t *rate)
++{
++	const char *codec;
++	struct spa_audio_info info;
++	uint32_t sample_rate, channels, bitrate;
++
++	spa_zero(info);
++	info.media_type = SPA_MEDIA_TYPE_audio;
++	codec = pw_properties_get(props, "codec.type");
++	sample_rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
++	channels = pw_properties_get_uint32(props, "codec.channels", 2);
++	bitrate = pw_properties_get_uint32(props, "codec.bit_rate", 128000);
++
++	if (codec == NULL || spa_streq(codec, "mp3")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_mp3;
++		info.info.mp3.rate = sample_rate;
++		info.info.mp3.channels = channels;
++		info.info.mp3.channel_mode = channels == 1 ?
++			SPA_AUDIO_MP3_CHANNEL_MODE_MONO : SPA_AUDIO_MP3_CHANNEL_MODE_STEREO;
++	} else if (spa_streq(codec, "aac") || spa_streq(codec, "aac_adts")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4ADTS;
++	} else if (spa_streq(codec, "aac_adif")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_ADIF;
++	} else if (spa_streq(codec, "aac_latm")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_aac;
++		info.info.aac.rate = sample_rate;
++		info.info.aac.channels = channels;
++		info.info.aac.bitrate = bitrate;
++		info.info.aac.stream_format = SPA_AUDIO_AAC_STREAM_FORMAT_MP4LATM;
++	} else if (spa_streq(codec, "flac")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_flac;
++		info.info.flac.rate = sample_rate;
++		info.info.flac.channels = channels;
++	} else if (spa_streq(codec, "vorbis")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_vorbis;
++		info.info.vorbis.rate = sample_rate;
++		info.info.vorbis.channels = channels;
++	} else if (spa_streq(codec, "opus")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_opus;
++		info.info.opus.rate = sample_rate;
++		info.info.opus.channels = channels;
++	} else if (spa_streq(codec, "wma") || spa_streq(codec, "wma_std")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
++		info.info.wma.rate = sample_rate;
++		info.info.wma.channels = channels;
++		info.info.wma.bitrate = bitrate;
++		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9;
++	} else if (spa_streq(codec, "wma_pro")) {
++		info.media_subtype = SPA_MEDIA_SUBTYPE_wma;
++		info.info.wma.rate = sample_rate;
++		info.info.wma.channels = channels;
++		info.info.wma.bitrate = bitrate;
++		info.info.wma.profile = SPA_AUDIO_WMA_PROFILE_WMA9_PRO;
++	} else {
++		errno = ENOTSUP;
++		return NULL;
++	}
++	if (rate != NULL)
++		*rate = sample_rate;
++	return spa_format_audio_build(b, id, &info);
++}
++
++static void synthesize_compress_offload_spec(struct sample_spec *ss,
++		struct channel_map *map, const struct pw_properties *props)
++{
++	uint32_t channels;
++	ss->format = SPA_AUDIO_FORMAT_S16_LE;
++	ss->rate = pw_properties_get_uint32(props, "codec.sample_rate", 44100);
++	channels = pw_properties_get_uint32(props, "codec.channels", 2);
++	ss->channels = (uint8_t)(channels > 0 ? channels : 2);
++	spa_zero(*map);
++	switch (ss->channels) {
++	case 1: channel_map_parse("mono", map); break;
++	case 2: channel_map_parse("stereo", map); break;
++	case 3: channel_map_parse("surround-21", map); break;
++	case 4: channel_map_parse("surround-40", map); break;
++	case 5: channel_map_parse("surround-50", map); break;
++	case 6: channel_map_parse("surround-51", map); break;
++	case 8: channel_map_parse("surround-71", map); break;
++	default: channel_map_parse("stereo", map); ss->channels = 2; break;
++	}
++}
++
+ static int do_create_playback_stream(struct client *client, uint32_t command, uint32_t tag, struct message *m)
+ {
+ 	struct impl *impl = client->impl;
+@@ -1609,7 +1732,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 		muted_set = false,
+ 		fail_on_suspend = false,
+ 		relative_volume = false,
+-		passthrough = false;
++		passthrough = false,
++		compress_offload = false;
+ 	struct volume volume;
+ 	struct pw_properties *props = NULL;
+ 	uint8_t n_formats = 0;
+@@ -1668,6 +1792,68 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	}
+ 	o = find_device(client, sink_index, sink_name, true, &is_monitor);
+
++	if (o != NULL) {
++		const struct pw_node_info *ninfo = o->info;
++		const struct spa_dict *sp = (ninfo && ninfo->props) ? ninfo->props : NULL;
++		char node_name_buf[256] = {0};
++		const char *node_name;
++		const char *co;
++		const char *_nn = pw_properties_get(o->props, PW_KEY_NODE_NAME);
++
++		if (_nn)
++			snprintf(node_name_buf, sizeof(node_name_buf), "%s", _nn);
++		node_name = node_name_buf[0] ? node_name_buf : NULL;
++		co = sp ? spa_dict_lookup(sp, "compress.offload") : NULL;
++		pw_log_debug("[%s] compress-offload check: node=%s ninfo=%p co=%s",
++				client->name, node_name ? node_name : "(null)", ninfo, co ? co : "(null)");
++		if (co && spa_atob(co)) {
++			char target_buf[256] = {0};
++			char codec_buf[64] = {0};
++			char rate_buf[32] = {0};
++			char channels_buf[16] = {0};
++			char bitrate_buf[32] = {0};
++			const char *target;
++			const char *codec;
++			const char *rate_s;
++			const char *channels;
++			const char *bitrate;
++			const char *_s;
++
++			if ((_s = spa_dict_lookup(sp, "compress.target.object")) != NULL)
++				snprintf(target_buf, sizeof(target_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.type")) != NULL)
++				snprintf(codec_buf, sizeof(codec_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.sample_rate")) != NULL)
++				snprintf(rate_buf, sizeof(rate_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.channels")) != NULL)
++				snprintf(channels_buf, sizeof(channels_buf), "%s", _s);
++			if ((_s = spa_dict_lookup(sp, "codec.bit_rate")) != NULL)
++				snprintf(bitrate_buf, sizeof(bitrate_buf), "%s", _s);
++
++			target = target_buf[0] ? target_buf : NULL;
++			codec = codec_buf[0] ? codec_buf : NULL;
++			rate_s = rate_buf[0] ? rate_buf : NULL;
++			channels = channels_buf[0] ? channels_buf : NULL;
++			bitrate = bitrate_buf[0] ? bitrate_buf : NULL;
++
++			pw_properties_set(props, "compress.offload", "true");
++			pw_properties_set(props, "item.node.supports-encoded-fmts", "true");
++			pw_properties_set(props, PW_KEY_MEDIA_TYPE, "Audio");
++			pw_properties_set(props, PW_KEY_MEDIA_CATEGORY, "Playback");
++			pw_properties_set(props, PW_KEY_MEDIA_ROLE, "Music");
++			if (codec) pw_properties_set(props, "codec.type", codec);
++			if (rate_s) pw_properties_set(props, "codec.sample_rate", rate_s);
++			if (channels) pw_properties_set(props, "codec.channels", channels);
++			if (bitrate) pw_properties_set(props, "codec.bit_rate", bitrate);
++
++			pw_log_info("[%s] detected compress-offload sink=%s target=%s codec=%s",
++					client->name, node_name ? node_name : "(null)",
++					target ? target : "(null)", codec ? codec : "(null)");
++			pw_log_debug("[%s] compress target=%s - leaving sink_name=%s for virtual sink routing",
++					client->name, target ? target : "(null)", sink_name ? sink_name : "(null)");
++		}
++	}
++
+ 	spa_zero(fix_ss);
+ 	spa_zero(fix_map);
+ 	if ((fix_format || fix_rate || fix_channels) && o != NULL) {
+@@ -1715,6 +1901,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			goto error_protocol;
+ 	}
+
++	compress_offload = pw_properties_parse_bool(
++			pw_properties_get(props, "compress.offload"));
++
+ 	if (client->version >= 21) {
+ 		if (message_get(m,
+ 				TAG_U8, &n_formats,
+@@ -1732,7 +1921,9 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 						TAG_INVALID) < 0)
+ 					goto error_protocol;
+
+-				if (n_params < MAX_FORMATS &&
++				if (compress_offload) {
++					log_format_info(impl, SPA_LOG_LEVEL_DEBUG, &format);
++				} else if (n_params < MAX_FORMATS &&
+ 				    (params[n_params] = format_info_build_param(&b,
+ 						SPA_PARAM_EnumFormat, &format, &r)) != NULL) {
+ 					n_params++;
+@@ -1746,7 +1937,23 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			}
+ 		}
+ 	}
+-	if (sample_spec_valid(&ss)) {
++	if (compress_offload) {
++		uint32_t compress_rate = 0;
++		if (n_params < MAX_FORMATS &&
++		    (params[n_params] = build_compress_offload_format(&b,
++					SPA_PARAM_EnumFormat, props, &compress_rate)) != NULL) {
++			n_params++;
++			n_valid_formats++;
++			ss_rate = rate = compress_rate;
++			synthesize_compress_offload_spec(&ss, &map, props);
++			pw_log_debug("[%s] synthesized compress-offload format codec=%s rate=%u channels=%u",
++					client->name, pw_properties_get(props, "codec.type"), compress_rate,
++					pw_properties_get_uint32(props, "codec.channels", 2));
++		} else {
++			pw_log_warn("%p: unsupported compress codec:%s",
++					impl, pw_properties_get(props, "codec.type"));
++		}
++	} else if (sample_spec_valid(&ss)) {
+ 		struct sample_spec sfix = ss;
+ 		struct channel_map mfix = map;
+
+@@ -1770,6 +1977,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	if (m->offset != m->length)
+ 		goto error_protocol;
+
++	pw_log_debug("[%s] format check: n_valid=%u n_params=%u compress=%d passthrough=%d",
++			client->name, n_valid_formats, n_params, compress_offload, passthrough);
+ 	if (n_valid_formats == 0)
+ 		goto error_no_formats;
+
+@@ -1806,6 +2015,8 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 	flags = 0;
+ 	if (no_move)
+ 		flags |= PW_STREAM_FLAG_DONT_RECONNECT;
++	if (compress_offload)
++		flags |= PW_STREAM_FLAG_NO_CONVERT;
+
+ 	if (sink_name != NULL) {
+ 		if (o != NULL)
+@@ -1833,14 +2044,35 @@ static int do_create_playback_stream(struct client *client, uint32_t command, ui
+ 			&stream->stream_listener,
+ 			&stream_events, stream);
+
+-	pw_stream_connect(stream->stream,
+-			PW_DIRECTION_OUTPUT,
+-			SPA_ID_INVALID,
+-			flags |
+-			PW_STREAM_FLAG_AUTOCONNECT |
+-			PW_STREAM_FLAG_RT_PROCESS |
+-			PW_STREAM_FLAG_MAP_BUFFERS,
+-			params, n_params);
++	if (compress_offload) {
++		uint8_t raw_buf[256];
++		struct spa_pod_builder rb = SPA_POD_BUILDER_INIT(raw_buf, sizeof(raw_buf));
++		struct spa_audio_info_raw raw_info = {
++			.format = SPA_AUDIO_FORMAT_S16_LE,
++			.rate = ss.rate ? ss.rate : 44100,
++			.channels = ss.channels ? ss.channels : 2,
++		};
++		const struct spa_pod *raw_params[1];
++		raw_params[0] = spa_format_audio_raw_build(&rb, SPA_PARAM_EnumFormat, &raw_info);
++		pw_log_debug("[%s] pw_stream_connect: using raw S16LE param for compress sink", client->name);
++		pw_stream_connect(stream->stream,
++				PW_DIRECTION_OUTPUT,
++				SPA_ID_INVALID,
++				flags |
++				PW_STREAM_FLAG_AUTOCONNECT |
++				PW_STREAM_FLAG_RT_PROCESS |
++				PW_STREAM_FLAG_MAP_BUFFERS,
++				raw_params, 1);
++	} else {
++		pw_stream_connect(stream->stream,
++				PW_DIRECTION_OUTPUT,
++				SPA_ID_INVALID,
++				flags |
++				PW_STREAM_FLAG_AUTOCONNECT |
++				PW_STREAM_FLAG_RT_PROCESS |
++				PW_STREAM_FLAG_MAP_BUFFERS,
++				params, n_params);
++	}
+
+ 	stream_update_tag_param(stream);
+
+--
+2.43.0
+
diff --git a/meta/recipes-multimedia/pipewire/pipewire/0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch b/meta/recipes-multimedia/pipewire/pipewire/0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch
new file mode 100644
index 00000000000..d6fc5866ec8
--- /dev/null
+++ b/meta/recipes-multimedia/pipewire/pipewire/0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch
@@ -0,0 +1,25 @@
+From 1a37f445a20e67976c83360ab5830887fffe37e2 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 17 Mar 2026 03:17:15 +1100
+Subject: [PATCH] spa/plugins/alsa/acp/compat.h: p is already const do not
+ recast
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/1a37f445a20e67976c83360ab5830887fffe37e2]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ spa/plugins/alsa/acp/compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/alsa/acp/compat.h b/spa/plugins/alsa/acp/compat.h
+index 0f7b959df..87151d197 100644
+--- a/spa/plugins/alsa/acp/compat.h
++++ b/spa/plugins/alsa/acp/compat.h
+@@ -436,7 +436,7 @@ static inline const char *pa_path_get_filename(const char *p)
+         return NULL;
+     if ((fn = strrchr(p, PA_PATH_SEP_CHAR)))
+         return fn+1;
+-    return (char*) p;
++    return p;
+ }
+ 
+ static inline bool pa_is_path_absolute(const char *fn)
diff --git a/meta/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch b/meta/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch
new file mode 100644
index 00000000000..1030d6aaaf9
--- /dev/null
+++ b/meta/recipes-multimedia/pipewire/pipewire/0003-spa-libcamera-device-0.8-compatibility.patch
@@ -0,0 +1,50 @@
+From 15c4a92ceae560a4e8c6c14b8c338db075860a57 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>
+Date: Tue, 27 Oct 2026 21:28:56 +0100
+Subject: [PATCH] spa: libcamera: device: 0.8 compatibility
+
+Version 0.8 of libcamera has incompatible changes, so adjust the code,
+while keeping compatibility with older versions as well.
+
+(cherry picked from commit 54f2f51f5233026e608f8235f5377b9b473918e3)
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/15c4a92ceae560a4e8c6c14b8c338db075860a57]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ spa/plugins/libcamera/libcamera-device.cpp | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/spa/plugins/libcamera/libcamera-device.cpp b/spa/plugins/libcamera/libcamera-device.cpp
+index 0aeaed855..c6b6106bc 100644
+--- a/spa/plugins/libcamera/libcamera-device.cpp
++++ b/spa/plugins/libcamera/libcamera-device.cpp
+@@ -28,6 +28,7 @@
+ 
+ #include <libcamera/camera.h>
+ #include <libcamera/property_ids.h>
++#include <libcamera/version.h>
+ 
+ using namespace libcamera;
+ 
+@@ -69,12 +70,21 @@ const char *cameraLoc(const Camera& camera)
+ {
+ 	if (auto location = camera.properties().get(properties::Location)) {
+ 		switch (location.value()) {
++#if LIBCAMERA_VERSION_MAJOR > 0 || (LIBCAMERA_VERSION_MAJOR == 0 && LIBCAMERA_VERSION_MINOR >= 8)
++		case properties::LocationFront:
++			return "front";
++		case properties::LocationBack:
++			return "back";
++		case properties::LocationExternal:
++			return "external";
++#else
+ 		case properties::CameraLocationFront:
+ 			return "front";
+ 		case properties::CameraLocationBack:
+ 			return "back";
+ 		case properties::CameraLocationExternal:
+ 			return "external";
++#endif
+ 		}
+ 	}
+ 
diff --git a/meta/recipes-multimedia/pipewire/pipewire_1.6.11.bb b/meta/recipes-multimedia/pipewire/pipewire_1.6.11.bb
new file mode 100644
index 00000000000..5fe4f3cb907
--- /dev/null
+++ b/meta/recipes-multimedia/pipewire/pipewire_1.6.11.bb
@@ -0,0 +1,426 @@
+SUMMARY     = "Multimedia processing server for Linux"
+DESCRIPTION = "Linux server for handling and routing audio and video streams between applications and multimedia I/O devices"
+HOMEPAGE    = "https://pipewire.org/"
+BUGTRACKER  = "https://gitlab.freedesktop.org/pipewire/pipewire/issues"
+SECTION     = "multimedia"
+
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later AND MIT"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72 \
+    file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a \
+"
+
+DEPENDS = "dbus"
+
+SRCREV = "4287f31510771fc999f8a58a024c81ca10b8d55f"
+BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
+SRC_URI += "file://0001-pipewire-compress-offload.patch"
+SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"
+SRC_URI += "file://0003-spa-libcamera-device-0.8-compatibility.patch"
+
+inherit meson pkgconfig systemd gettext useradd
+
+# https://gitlab.freedesktop.org/pipewire/pipewire/-/work_items/5616
+# Remove when https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/3206 merges
+INSANE_SKIP:append = " 32bit-time"
+
+USERADD_PACKAGES = "${PN}"
+
+GROUPADD_PARAM:${PN} = "--system pipewire"
+
+USERADD_PARAM:${PN} = "--system --home / --no-create-home \
+                       --comment 'PipeWire multimedia daemon' \
+                       --gid pipewire --groups audio,video \
+                       pipewire"
+
+SYSTEMD_PACKAGES = "${PN}"
+
+# For "EVL", look up https://evlproject.org/ . It involves
+# a specially prepared kernel, and is currently unavailable
+# in Yocto.
+#
+#
+# manpage generation requires xmltoman, which is not available.
+#
+# The session-managers list specifies which session managers Meson
+# shall download (via git clone) and build as subprojects. In OE,
+# this is not how a session manager should be built. Instead, they
+# should be integrated as separate OE recipes. To prevent PipeWire
+# from using this Meson feature, set an empty list.
+# This does not disable support or the need for session managers,
+# it just prevents this subproject feature.
+#
+# AptX and LDAC are not available in OE. Currently, neither
+# are lv2, ROC, and libmysofa.
+#
+# AptX support is only available via freeaptx (libfreeaptx)
+# for Bluetooth audio (A2DP).
+#
+# The RTKit module is deprecated in favor of the newer RT module.
+# It still exists for legacy setups that still include it in
+# their PipeWire configuration files.
+EXTRA_OEMESON += " \
+    -Devl=disabled \
+    -Dtests=disabled \
+    -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
+    -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
+    -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
+    -Dman=disabled \
+    -Dsession-managers='[]' \
+    -Dlv2=disabled \
+    -Droc=disabled \
+    -Dbluez5-codec-ldac=disabled \
+    -Dlegacy-rtkit=false \
+    -Dlibmysofa=disabled \
+"
+
+# spa alsa plugin code uses typedef redefinition, which is officially a C11 feature.
+# Pipewire builds with 'c_std=gnu99' by default. Recent versions of gcc don't issue this warning in gnu99
+# mode but it looks like clang still does
+CFLAGS:append = " -Wno-typedef-redefinition"
+
+# Specify linking with -latomic on architectures missing 64bit atomics.
+LDFLAGS += "${@bb.utils.contains_any('TUNE_FEATURES', 'riscv32 armv5 mips ppc32 m32', '-latomic', '', d)}"
+
+# According to wireplumber documentation only one session manager should be installed at a time
+# Possible options are media-session, which has fewer dependencies but is very simple,
+# or wireplumber, which is more powerful.
+PIPEWIRE_SESSION_MANAGER ??= "wireplumber"
+
+FFMPEG_AVAILABLE = "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)}"
+BLUETOOTH_AAC = "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'bluez-aac', '', d)}"
+
+PACKAGECONFIG:class-target ??= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
+    ${PIPEWIRE_SESSION_MANAGER} \
+    ${FFMPEG_AVAILABLE} flatpak gstreamer gsettings pw-cat raop sndfile v4l2 udev volume \
+    readline ncurses \
+"
+
+# "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
+# since "jack" imports libjack, and "pipewire-jack" generates
+# libjack.so* files, thus colliding with the libpack package. This
+# is why these two are marked in their respective packageconfigs
+# as being in conflict.
+PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,${MLPREFIX}pipewire-alsa ${MLPREFIX}pipewire-alsa-card-profile"
+PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
+PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc glib-2.0-native"
+PACKAGECONFIG[bluez-aac] = "-Dbluez5-codec-aac=enabled,-Dbluez5-codec-aac=disabled,fdk-aac"
+PACKAGECONFIG[bluez-opus] = "-Dbluez5-codec-opus=enabled,-Dbluez5-codec-opus=disabled,libopus"
+PACKAGECONFIG[bluez-lc3] = "-Dbluez5-codec-lc3=enabled,-Dbluez5-codec-lc3=disabled,liblc3"
+# Eneble libfreeaptx to support bluetooth audio codec
+PACKAGECONFIG[bluez-aptx]     = "-Dbluez5-codec-aptx=enabled,-Dbluez5-codec-aptx=disabled,libfreeaptx"
+# From the pipewire git log:
+# "Some Linux phones doesn't use oFono but ModemManager to control the modem."
+# This packageconfig enables modemmanager specific code in the BlueZ backend.
+PACKAGECONFIG[bluez-backend-native-mm] = "-Dbluez5-backend-native-mm=enabled,-Dbluez5-backend-native-mm=disabled,modemmanager"
+PACKAGECONFIG[docs] = "-Ddocs=enabled,-Ddocs=disabled,doxygen-native graphviz-native"
+PACKAGECONFIG[ffmpeg] = "-Dffmpeg=enabled,-Dffmpeg=disabled,ffmpeg"
+PACKAGECONFIG[flatpak] = "-Dflatpak=enabled,-Dflatpak=disabled,glib-2.0"
+PACKAGECONFIG[gsettings] = "-Dgsettings=enabled,-Dgsettings=disabled,glib-2.0"
+PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,${MLPREFIX}gstreamer1.0-pipewire"
+PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
+PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera libdrm"
+PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
+PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
+PACKAGECONFIG[media-session] = ",,,pipewire-media-session,,wireplumber"
+PACKAGECONFIG[ncurses] = ",,ncurses"
+PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio,,${MLPREFIX}pipewire-pulse"
+PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
+PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,${MLPREFIX}pipewire-jack,jack"
+PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
+PACKAGECONFIG[raop] = "-Draop=enabled,-Draop=disabled,openssl"
+# Starting with version 0.3.60, readline usage can be turned off in pw-cli.
+# If it is disabled, getline() is used as a fallback.
+PACKAGECONFIG[readline] = "-Dreadline=enabled,-Dreadline=disabled,readline"
+PACKAGECONFIG[sdl2] = "-Dsdl2=enabled,-Dsdl2=disabled,virtual/libsdl2"
+PACKAGECONFIG[sndfile] = "-Dsndfile=enabled,-Dsndfile=disabled,libsndfile1"
+PACKAGECONFIG[systemd] = "-Dlibsystemd=enabled,-Dlibsystemd=disabled,systemd"
+PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsystemd-system-service=disabled,systemd"
+# "systemd-user-service" packageconfig will only install service
+# files to rootfs but not enable them as systemd.bbclass
+# currently lacks the feature of enabling user services.
+PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
+# pw-cat needs sndfile packageconfig to be enabled
+PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
+PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
+PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
+PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing-2"
+PACKAGECONFIG[wireplumber] = ",,,wireplumber,,media-session"
+
+PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
+PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
+
+SPA_SUBDIR = "spa-0.2"
+PW_MODULE_SUBDIR = "pipewire-0.3"
+
+remove_unused_installed_files() {
+    # jack.conf is used by pipewire-jack (not the JACK SPA plugin).
+    # Remove it if pipewire-jack is not built to avoid creating the
+    # pipewire-jack package.
+    if ${@bb.utils.contains('PACKAGECONFIG', 'pipewire-jack', 'false', 'true', d)}; then
+        rm -f "${D}${datadir}/pipewire/jack.conf"
+    fi
+
+    # minimal.conf is an example of how to minimally configure the
+    # daemon and is not meant to be used for production.
+    rm -f "${D}${datadir}/pipewire/minimal.conf"
+}
+
+do_install:append:class-target() {
+    # The pipewire-alsa plugin needs the following files in /etc/alsa/conf.d/ to
+    # be picked up by alsa.
+    install -d ${D}${sysconfdir}/alsa/conf.d
+    ln -sf ${datadir}/alsa/alsa.conf.d/50-pipewire.conf ${D}${sysconfdir}/alsa/conf.d/50-pipewire.conf
+    ln -sf ${datadir}/alsa/alsa.conf.d/99-pipewire-default.conf ${D}${sysconfdir}/alsa/conf.d/99-pipewire-default.conf
+}
+
+do_install[postfuncs] += "remove_unused_installed_files"
+
+python split_dynamic_packages () {
+    # Create packages for each SPA plugin. These plugins are located
+    # in individual subdirectories, so a recursive search is needed.
+    spa_libdir = d.expand('${libdir}/${SPA_SUBDIR}')
+    do_split_packages(d, spa_libdir, r'^libspa-(.*)\.so$', d.expand('${PN}-spa-plugins-%s'), 'PipeWire SPA plugin for %s', extra_depends='', recursive=True)
+
+    # Create packages for each PipeWire module.
+    pw_module_libdir = d.expand('${libdir}/${PW_MODULE_SUBDIR}')
+    do_split_packages(d, pw_module_libdir, r'^libpipewire-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'PipeWire %s module', extra_depends='', recursive=False)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    if bb.data.inherits_class('nativesdk', d) or bb.data.inherits_class('native', d):
+        return
+
+    # Go through all generated SPA plugin and PipeWire module packages
+    # (excluding the main package and the -meta package itself) and
+    # add them to the -meta package as RDEPENDS.
+
+    base_pn = d.getVar('PN')
+
+    spa_pn = base_pn + '-spa-plugins'
+    spa_metapkg =  spa_pn + '-meta'
+
+    pw_module_pn = base_pn + '-modules'
+    pw_module_metapkg =  pw_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY:' + spa_metapkg, "1")
+    d.setVar('FILES:' + spa_metapkg, "")
+
+    d.setVar('ALLOW_EMPTY:' + pw_module_metapkg, "1")
+    d.setVar('FILES:' + pw_module_metapkg, "")
+
+    blacklist = [ spa_pn, spa_metapkg, pw_module_pn, pw_module_metapkg ]
+    spa_metapkg_rdepends = []
+    pw_module_metapkg_rdepends = []
+    pkgdest = d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_spa_pkg = pkg.startswith(spa_pn)
+        is_pw_module_pkg = pkg.startswith(pw_module_pn)
+        if not is_spa_pkg and not is_pw_module_pkg:
+            continue
+
+        if pkg in spa_metapkg_rdepends or pkg in pw_module_metapkg_rdepends:
+            continue
+
+        # See if the package is empty by looking at the contents of its
+        # PKGDEST subdirectory. If this subdirectory is empty, then then
+        # package is empty as well. Empty packages do not get added to
+        # the meta package's RDEPENDS.
+        pkgdir = os.path.join(pkgdest, pkg)
+        if os.path.exists(pkgdir):
+            dir_contents = os.listdir(pkgdir) or []
+        else:
+            dir_contents = []
+        is_empty = len(dir_contents) == 0
+        if not is_empty:
+            if is_spa_pkg:
+                spa_metapkg_rdepends.append(pkg)
+            if is_pw_module_pkg:
+                pw_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS:' + spa_metapkg, ' '.join(spa_metapkg_rdepends))
+    d.setVar('DESCRIPTION:' + spa_metapkg, spa_pn + ' meta package')
+
+    d.setVar('RDEPENDS:' + pw_module_metapkg, ' '.join(pw_module_metapkg_rdepends))
+    d.setVar('DESCRIPTION:' + pw_module_metapkg, pw_module_pn + ' meta package')
+}
+
+PACKAGES =+ "\
+    libpipewire \
+    ${PN}-tools \
+    ${PN}-pulse \
+    ${PN}-alsa \
+    ${PN}-jack \
+    ${PN}-spa-plugins \
+    ${PN}-spa-plugins-meta \
+    ${PN}-spa-tools \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+    ${PN}-alsa-card-profile \
+    ${PN}-v4l2 \
+    ${PN}-aes67 \
+    gstreamer1.0-pipewire \
+"
+
+PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
+PACKAGES_DYNAMIC:class-native = ""
+
+SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
+CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
+FILES:${PN} = " \
+    ${datadir}/pipewire \
+    ${systemd_system_unitdir}/pipewire* \
+    ${systemd_user_unitdir} \
+    ${bindir}/pipewire \
+    ${bindir}/pipewire-avb \
+    ${bindir}/pipewire-vulkan \
+"
+
+RRECOMMENDS:${PN}:append:class-target = " \
+	pipewire-modules-meta \
+	pipewire-spa-plugins-meta \
+"
+
+FILES:${PN}-dev += " \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so \
+"
+
+CONFFILES:libpipewire += "${datadir}/pipewire/client.conf"
+FILES:libpipewire = " \
+    ${datadir}/pipewire/client.conf \
+    ${libdir}/libpipewire-*.so.* \
+    ${libdir}/${SPA_SUBDIR}/libspa.so \
+"
+# Add the bare minimum modules and plugins required to be able
+# to use libpipewire. Without these, it is essentially unusable.
+RDEPENDS:libpipewire += " \
+    ${PN}-modules-client-node \
+    ${PN}-modules-protocol-native \
+    ${PN}-spa-plugins-support \
+"
+
+FILES:${PN}-tools = " \
+    ${bindir}/pw-cat \
+    ${bindir}/pw-cli \
+    ${bindir}/pw-config \
+    ${bindir}/pw-container \
+    ${bindir}/pw-dot \
+    ${bindir}/pw-dsdplay \
+    ${bindir}/pw-dump \
+    ${bindir}/pw-encplay \
+    ${bindir}/pw-link \
+    ${bindir}/pw-loopback \
+    ${bindir}/pw-metadata \
+    ${bindir}/pw-midi2play \
+    ${bindir}/pw-midi2record \
+    ${bindir}/pw-mididump \
+    ${bindir}/pw-midiplay \
+    ${bindir}/pw-midirecord \
+    ${bindir}/pw-mon \
+    ${bindir}/pw-play \
+    ${bindir}/pw-profiler \
+    ${bindir}/pw-record \
+    ${bindir}/pw-reserve \
+    ${bindir}/pw-sysex \
+    ${bindir}/pw-top \
+"
+
+# This is a shim daemon that is intended to be used as a
+# drop-in PulseAudio replacement, providing a pulseaudio-compatible
+# socket that can be used by applications that use libpulse.
+CONFFILES:${PN}-pulse += "${datadir}/pipewire/pipewire-pulse.conf"
+FILES:${PN}-pulse = " \
+    ${datadir}/pipewire/pipewire-pulse.conf \
+    ${systemd_system_unitdir}/pipewire-pulse.* \
+    ${systemd_user_unitdir}/pipewire-pulse.* \
+    ${bindir}/pipewire-pulse \
+"
+# This uses :append:class-target rather than += to avoid a dependency from
+# pipewire-native to pipewire.
+RDEPENDS:${PN}-pulse:append:class-target = " \
+    ${PN}-modules-protocol-pulse \
+"
+
+# ALSA plugin to redirect audio to pipewire.
+FILES:${PN}-alsa = "\
+    ${libdir}/alsa-lib/* \
+    ${datadir}/alsa/alsa.conf.d/* \
+    ${sysconfdir}/alsa/conf.d/50-pipewire.conf \
+    ${sysconfdir}/alsa/conf.d/99-pipewire-default.conf \
+"
+
+# JACK drop-in libraries to redirect audio to pipewire.
+CONFFILES:${PN}-jack = "${datadir}/pipewire/jack.conf"
+FILES:${PN}-jack = "\
+    ${bindir}/pw-jack \
+    ${datadir}/pipewire/jack.conf \
+    ${libdir}/${PW_MODULE_SUBDIR}/jack/libjack*.so.* \
+"
+
+# Dynamic SPA plugin packages (see set_dynamic_metapkg_rdepends).
+FILES:${PN}-spa-plugins = ""
+RRECOMMENDS:${PN}-spa-plugins += "${PN}-spa-plugins-meta"
+
+FILES:${PN}-spa-plugins-bluez5 += " \
+    ${datadir}/${SPA_SUBDIR}/bluez5/* \
+"
+
+FILES:${PN}-spa-tools = " \
+    ${bindir}/spa-* \
+"
+
+# Dynamic PipeWire module packages (see set_dynamic_metapkg_rdepends).
+FILES:${PN}-modules = ""
+RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"
+
+CONFFILES:${PN}-modules-rt = "${datadir}/pipewire/client-rt.conf"
+FILES:${PN}-modules-rt += " \
+    ${datadir}/pipewire/client-rt.conf \
+    ${sysconfdir}/security/limits.d/* \
+    "
+
+CONFFILES:${PN}-modules-filter-chain = "${datadir}/pipewire/filter-chain/*"
+FILES:${PN}-modules-filter-chain += " \
+    ${datadir}/pipewire/filter-chain/* \
+"
+
+FILES:${PN}-alsa-card-profile = " \
+    ${datadir}/alsa-card-profile/* \
+    ${nonarch_base_libdir}/udev/rules.d/90-pipewire-alsa.rules \
+"
+
+# V4L2 interface emulator for sending/receiving data between PipeWire and V4L2 applications.
+FILES:${PN}-v4l2 += " \
+    ${bindir}/pw-v4l2 \
+    ${libdir}/${PW_MODULE_SUBDIR}/v4l2/libpw-v4l2.so \
+"
+
+# AES67 is a standard for audio over IP, from the Audio Engineering Society (AES).
+FILES:${PN}-aes67 += " \
+    ${bindir}/pipewire-aes67 \
+"
+
+FILES:gstreamer1.0-pipewire = " \
+    ${libdir}/gstreamer-1.0/* \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
+do_install:append() {
+  if ls ${D}${datadir}/doc/pipewire/html/dir_*html; then
+    sed -i "s,${WORKDIR},,g" ${D}${datadir}/doc/pipewire/html/dir_*html
+  fi
+}
diff --git a/meta/recipes-multimedia/wireplumber/files/90-OE-disable-session-dbus-dependent-features.lua b/meta/recipes-multimedia/wireplumber/files/90-OE-disable-session-dbus-dependent-features.lua
new file mode 100644
index 00000000000..353a49c0b59
--- /dev/null
+++ b/meta/recipes-multimedia/wireplumber/files/90-OE-disable-session-dbus-dependent-features.lua
@@ -0,0 +1,5 @@
+-- These features require a session DBus instance, which is not available
+-- by default in OE generated images. The absence of such a DBus instance
+-- causes WirePlumber to fail to start. Turn these off to prevent that.
+alsa_monitor.properties["alsa.reserve"] = false
+default_access.properties["enable-flatpak-portal"] = false
diff --git a/meta/recipes-multimedia/wireplumber/files/run-ptest b/meta/recipes-multimedia/wireplumber/files/run-ptest
new file mode 100644
index 00000000000..d987f777664
--- /dev/null
+++ b/meta/recipes-multimedia/wireplumber/files/run-ptest
@@ -0,0 +1,55 @@
+#!/bin/sh
+RET=0
+
+export HOME=/invalid
+export XDG_RUNTIME_DIR=/invalid
+export PIPEWIRE_RUNTIME_DIR=/tmp
+export XDG_CONFIG_HOME=$(pwd)/.config
+export XDG_STATE_HOME=$(pwd)/.local/state
+export FILE_MONITOR_DIR=$(pwd)/.local/file_monitor
+export WIREPLUMBER_MODULE_DIR=/usr/lib/wireplumber-0.5
+export G_TEST_SRCDIR=/usr/lib/wireplumber/ptest/data
+
+run_scripted_test(){
+    test_dir=$(dirname $1)
+    cd $test_dir
+    while read line; do
+        arg1=$(echo $line | cut -f1 -d" ")
+        arg2=$(echo $line | cut -f2 -d" ")
+        if ./script-tester $arg1 scripts/$arg2 > $(echo $arg2 | tr / _).out 2>&1; then
+            echo PASS: $arg2
+        else
+            echo FAIL: $arg2
+            RET=1
+        fi
+    done < ./ptest-list
+    cd -
+}
+
+run_regular_test(){
+  if ./$1 > $1.out 2>&1; then
+    echo PASS: $1
+  else
+    echo FAIL: $1
+    RET=1
+  fi
+}
+
+run_test(){
+    case $1 in
+      *run-ptest)
+        ;;
+      *script-tester)
+        run_scripted_test $1
+        ;;
+      *)
+        run_regular_test $1
+        ;;
+    esac
+}
+
+
+for t in $(find . -type f -executable); do
+    run_test $t
+done
+exit $RET
diff --git a/meta/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb b/meta/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
new file mode 100644
index 00000000000..3f1f13a56cd
--- /dev/null
+++ b/meta/recipes-multimedia/wireplumber/wireplumber_0.5.19.bb
@@ -0,0 +1,183 @@
+SUMMARY    = "Session / policy manager implementation for PipeWire"
+HOMEPAGE   = "https://gitlab.freedesktop.org/pipewire/wireplumber"
+BUGTRACKER = "https://gitlab.freedesktop.org/pipewire/wireplumber/issues"
+SECTION    = "multimedia"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=17d1fe479cdec331eecbc65d26bc7e77"
+
+DEPENDS = "glib-2.0 glib-2.0-native lua pipewire \
+    ${@bb.utils.contains("DISTRO_FEATURES", "gobject-introspection-data", "python3-native python3-lxml-native doxygen-native", "", d)} \
+"
+
+SRCREV = "4ab992fa2931ae2b17ef73508b1370030b7878c3"
+SRC_URI = " \
+    git://gitlab.freedesktop.org/pipewire/wireplumber.git;branch=master;protocol=https;tag=${PV} \
+    file://run-ptest \
+    file://90-OE-disable-session-dbus-dependent-features.lua \
+"
+
+
+inherit meson pkgconfig gobject-introspection systemd bash-completion ptest
+
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+# Enable system-lua to let wireplumber use OE's lua.
+# Documentation needs python-sphinx, which is not in oe-core or meta-python2 for now.
+# elogind is not (yet) available in OE, so disable support.
+EXTRA_OEMESON += " \
+    -Ddoc=disabled \
+    -Dsystem-lua=true \
+    -Delogind=disabled \
+    -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
+    -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
+"
+
+PACKAGECONFIG ??= " dbus \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)} \
+"
+
+PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
+PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=true,-Dsystemd-system-service=false,systemd"
+# "systemd-user-service" packageconfig will only install service
+# files to rootfs but not enable them as systemd.bbclass
+# currently lacks the feature of enabling user services.
+PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=true,-Dsystemd-user-service=false,systemd"
+PACKAGECONFIG[dbus] = ""
+PACKAGECONFIG[test] = "-Dtests=true,-Dtests=false"
+
+# The dbus tests spawn a private bus through GTestDBus, which needs the
+# dbus-daemon binary. It is missing when dbus-broker provides the bus.
+WP_DBUS_TESTS = "${@'true' if d.getVar('VIRTUAL-RUNTIME_dbus') == 'dbus' else 'false'}"
+EXTRA_OEMESON += "-Ddbus-tests=${WP_DBUS_TESTS}"
+
+PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
+PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
+
+WP_MODULE_SUBDIR = "wireplumber-0.5"
+
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'false', 'true', d)}; then
+        install -m 0644 ${UNPACKDIR}/90-OE-disable-session-dbus-dependent-features.lua ${D}${datadir}/wireplumber/main.lua.d
+    fi
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/data/config
+    cd ${B}/tests
+    find . -maxdepth 2 -type f -executable -exec install -D {} ${D}${PTEST_PATH}/{} \;
+
+    install -m 644 ${S}/tests/wp/component-loader.conf ${D}${PTEST_PATH}/data/
+    cp -r ${S}/tests/scripts/scripts ${D}${PTEST_PATH}/scripts/
+    cp -r ${S}/tests/wplua/scripts ${D}${PTEST_PATH}/wplua/
+    cp -r ${S}/tests/wp/conf ${D}${PTEST_PATH}/data
+    cp -r ${S}/tests/wp/settings ${D}${PTEST_PATH}/data
+    install -m 644 ${S}/src/config/wireplumber.conf ${D}${PTEST_PATH}/data/config/
+    install -Dm 644 ${S}/tests/wplua/scripts/lib/testlib.lua ${D}${datadir}/wireplumber/scripts/lib/testlib.lua
+    install -Dm 644 ${S}/tests/scripts/scripts/lib/test-utils.lua ${D}${datadir}/wireplumber/scripts/lib/test-utils.lua
+    install -Dm 644 ${S}/tests/scripts/scripts/lib/suspend-test-utils.lua ${D}${datadir}/wireplumber/scripts/lib/suspend-test-utils.lua
+
+    # this is not a test
+    rm -rf ${D}${PTEST_PATH}/examples
+
+    # Beside regular bianry executables, this package comes with lua tests also
+    # which need to be executed with specific parameters. Take the parameters
+    # from the meson.build files, and read them from run-ptest script.
+    grep args ${S}/tests/wplua/meson.build   | cut -d[ -f2 | cut -d] -f1 | tr -d ",'" > ${D}${PTEST_PATH}/wplua/ptest-list
+    grep args ${S}/tests/scripts/meson.build | cut -d[ -f2 | cut -d] -f1 | tr -d ",'" > ${D}${PTEST_PATH}/scripts/ptest-list
+}
+
+python split_dynamic_packages () {
+    # Create packages for each WirePlumber module.
+    wp_module_libdir = d.expand('${libdir}/${WP_MODULE_SUBDIR}')
+    do_split_packages(d, wp_module_libdir, r'^libwireplumber-module-(.*)\.so$', d.expand('${PN}-modules-%s'), 'WirePlumber %s module', extra_depends='', recursive=False)
+}
+
+python set_dynamic_metapkg_rdepends () {
+    import os
+    import oe.utils
+
+    # Go through all generated WirePlumber module packages
+    # (excluding the main package and the -meta package itself)
+    # and add them to the -meta package as RDEPENDS.
+
+    base_pn = d.getVar('PN')
+
+    wp_module_pn = base_pn + '-modules'
+    wp_module_metapkg =  wp_module_pn + '-meta'
+
+    d.setVar('ALLOW_EMPTY:' + wp_module_metapkg, "1")
+    d.setVar('FILES:' + wp_module_metapkg, "")
+
+    blacklist = [ wp_module_pn, wp_module_metapkg ]
+    wp_module_metapkg_rdepends = []
+    pkgdest = d.getVar('PKGDEST')
+
+    for pkg in oe.utils.packages_filter_out_system(d):
+        if pkg in blacklist:
+            continue
+
+        is_wp_module_pkg = pkg.startswith(wp_module_pn)
+        if not is_wp_module_pkg:
+            continue
+
+        if pkg in wp_module_metapkg_rdepends:
+            continue
+
+        # See if the package is empty by looking at the contents of its
+        # PKGDEST subdirectory. If this subdirectory is empty, then then
+        # package is empty as well. Empty packages do not get added to
+        # the meta package's RDEPENDS.
+        pkgdir = os.path.join(pkgdest, pkg)
+        if os.path.exists(pkgdir):
+            dir_contents = os.listdir(pkgdir) or []
+        else:
+            dir_contents = []
+        is_empty = len(dir_contents) == 0
+        if not is_empty:
+            if is_wp_module_pkg:
+                wp_module_metapkg_rdepends.append(pkg)
+
+    d.setVar('RDEPENDS:' + wp_module_metapkg, ' '.join(wp_module_metapkg_rdepends))
+    d.setVar('DESCRIPTION:' + wp_module_metapkg, wp_module_pn + ' meta package')
+}
+
+PACKAGES =+ "\
+    libwireplumber \
+    ${PN}-default-config \
+    ${PN}-scripts \
+    ${PN}-modules \
+    ${PN}-modules-meta \
+"
+
+PACKAGES_DYNAMIC = "^${PN}-modules.*"
+
+CONFFILES:${PN} += " \
+    ${datadir}/wireplumber/wireplumber.conf \
+    ${datadir}/wireplumber/*.lua.d/* \
+"
+# Add pipewire to RRECOMMENDS, since WirePlumber expects a PipeWire daemon to
+# be present. While in theory any application that uses libpipewire can configure
+# itself to become a daemon, in practice, the PipeWire daemon is used.
+RRECOMMENDS:${PN} += "pipewire ${PN}-scripts ${PN}-modules-meta"
+
+FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir}/zsh"
+
+SYSTEMD_SERVICE:${PN} = "wireplumber.service"
+
+FILES:libwireplumber = " \
+    ${libdir}/libwireplumber-*.so.* \
+"
+
+FILES:${PN}-scripts += "${datadir}/wireplumber/scripts/*"
+
+# Dynamic packages (see set_dynamic_metapkg_rdepends).
+FILES:${PN}-modules = ""
+RRECOMMENDS:${PN}-modules += "${PN}-modules-meta"
+
+FILES:${PN}-ptest += "${datadir}/wireplumber/scripts/lib/test-utils.lua ${datadir}/wireplumber/scripts/lib/suspend-test-utils.lua ${datadir}/wireplumber/scripts/testlib.lua"
+RDEPENDS:${PN}-ptest += "${MLPREFIX}pipewire-modules-protocol-native ${PN}-scripts \
+    ${@'dbus' if d.getVar('WP_DBUS_TESTS') == 'true' else ''} \
+"
-- 
2.47.3

