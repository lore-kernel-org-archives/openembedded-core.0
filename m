Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7402B61621
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 13:53:23 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id g4so918078wro.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Mec+B/Ml1TVo5I/VsteSZXaY1fGBdeQXmr0g2t9sfJU=;
	b=J5oFwyZis3+nB933KzpaAJX9OvTmHDCq4Qu2Vu4cyNB6yf33IjjFp1cLQXFZYuOYSw
	5UMMo4rfkNaAmSL7BeEKvIdWDNjCDHILW4oszjyWmy2ZZ/6pMD6QlHKaFkbShxYStEKq
	7QCuUziYYTan7tfuaFUgAbWyftlCUwYoQzlaSLrzyoZ2H9zMi5SRzZVQo2pW5ocZgsG/
	MYxpQ2mBjw8wClqc1sxd8zahVRzH+OfXHDFLSFqJg5PUpvRbc3pOLytX4BdkxyNEYi0o
	S1UKVQ19BFKviGJz+rnyEj7I31h+wpybp2c19k7Wdhmq906zak8q9zq68FH22AEVMwaU
	ELiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Mec+B/Ml1TVo5I/VsteSZXaY1fGBdeQXmr0g2t9sfJU=;
	b=HpDJT03LpzzlinWiSRbbpYdzyXlUAelzu7dld8lTk90QEWRLBtuDZTs/6WiUaDmyo1
	ZSWlE53m5YMlPHfR5hJExLZ1PVB1tEKIsfGW2wWQi4sIQyix8jElHplU8fcGnoJn7y0M
	LAfnV3+JHJwuUWz5WdPkdlkfKmZohUaGE1HrbFcc43W3zFDc34qD2bq2k6XO54urvnHg
	StrT0a9h7E1StGdeYOFnIXh3lG6UjVjrJr+4cvO4Em0pS8cNamy9SXg3JYieSdaAsq2/
	QaPwySVL9GU0ojSrutd/q/MWtzp+twUYbdB3armOD3S/+r9H91nzS0VJiVDT8SX4RgTq
	np0w==
X-Gm-Message-State: APjAAAUSuxtr3z4b9ESKELMycXhlGIYthBvOOiV+a/kjg8w/Jk3Qvkof
	UUFLhR7VCvmLm1HwzppdAWSeLF8K
X-Google-Smtp-Source: APXvYqz/qBBjGyIJRMtCjSZgcKhgYoP36V98y79JkIuuduN4d4DdgMuEFM+L8+s0V4HpyvXHL84sKA==
X-Received: by 2002:adf:dec4:: with SMTP id i4mr2125034wrn.163.1582466003570; 
	Sun, 23 Feb 2020 05:53:23 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g15sm13984949wro.65.2020.02.23.05.53.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 23 Feb 2020 05:53:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Feb 2020 14:52:30 +0100
Message-Id: <20200223135231.22138-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200223135231.22138-1-alex.kanavin@gmail.com>
References: <20200223135231.22138-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libinput: update 1.14.3 -> 1.15.2
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
X-List-Received-Date: Sun, 23 Feb 2020 13:53:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...64bit-time_t-for-32bit-architectures.patch | 386 ------------------
 ...{libinput_1.14.3.bb => libinput_1.15.2.bb} |   8 +-
 2 files changed, 4 insertions(+), 390 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
 rename meta/recipes-graphics/wayland/{libinput_1.14.3.bb => libinput_1.15.2.bb} (86%)

diff --git a/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch b/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
deleted file mode 100644
index 344e6aaf8f..0000000000
--- a/meta/recipes-graphics/wayland/libinput/0001-adjust-for-64bit-time_t-for-32bit-architectures.patch
+++ /dev/null
@@ -1,386 +0,0 @@
-From ab6ce09bfb669177c90cc5c10155eec44e9fc34b Mon Sep 17 00:00:00 2001
-From: Peter Hutterer <peter.hutterer@who-t.net>
-Date: Sat, 23 Nov 2019 17:23:56 -0800
-Subject: [PATCH] Adjust for 64bit time_t for 32bit architectures
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/libinput/libinput/merge_requests/346]
-Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
----
- meson.build                     |  1 +
- src/evdev-mt-touchpad-buttons.c | 15 ++++---
- src/evdev.c                     |  5 ++-
- src/util-input-event.h          | 69 +++++++++++++++++++++++++++++++++
- tools/libinput-record.c         | 16 +++++---
- 5 files changed, 90 insertions(+), 16 deletions(-)
- create mode 100644 src/util-input-event.h
-
---- a/meson.build
-+++ b/meson.build
-@@ -220,7 +220,8 @@ endif
- ############ libinput-util.a ############
- src_libinput_util = [
- 		'src/libinput-util.c',
--		'src/libinput-util.h'
-+		'src/libinput-util.h',
-+		'src/util-input-event.h'
- ]
- libinput_util = static_library('libinput-util',
- 			       src_libinput_util,
---- a/src/evdev-mt-touchpad-buttons.c
-+++ b/src/evdev-mt-touchpad-buttons.c
-@@ -30,6 +30,7 @@
- #include <unistd.h>
- #include "linux/input.h"
- 
-+#include "util-input-event.h"
- #include "evdev-mt-touchpad.h"
- 
- #define DEFAULT_BUTTON_ENTER_TIMEOUT ms2us(100)
-@@ -1145,14 +1146,12 @@ tp_notify_clickpadbutton(struct tp_dispa
- 	if (tp->buttons.trackpoint) {
- 		if (is_topbutton) {
- 			struct evdev_dispatch *dispatch = tp->buttons.trackpoint->dispatch;
--			struct input_event event;
--			struct input_event syn_report = {{ 0, 0 }, EV_SYN, SYN_REPORT, 0 };
-+			struct input_event event, syn_report;
-+			int value;
- 
--			event.time = us2tv(time);
--			event.type = EV_KEY;
--			event.code = button;
--			event.value = (state == LIBINPUT_BUTTON_STATE_PRESSED) ? 1 : 0;
--			syn_report.time = event.time;
-+			value = (state == LIBINPUT_BUTTON_STATE_PRESSED) ? 1 : 0;
-+			event = input_event_init(time, EV_KEY, button, value);
-+			syn_report = input_event_init(time, EV_SYN, SYN_REPORT, 0);
- 			dispatch->interface->process(dispatch,
- 						     tp->buttons.trackpoint,
- 						     &event,
---- a/src/evdev.c
-+++ b/src/evdev.c
-@@ -44,6 +44,7 @@
- #include "filter.h"
- #include "libinput-private.h"
- #include "quirks.h"
-+#include "util-input-event.h"
- 
- #if HAVE_LIBWACOM
- #include <libwacom/libwacom.h>
-@@ -859,7 +860,7 @@ evdev_print_event(struct evdev_device *d
- {
- 	static uint32_t offset = 0;
- 	static uint32_t last_time = 0;
--	uint32_t time = us2ms(tv2us(&e->time));
-+	uint32_t time = us2ms(input_event_time(e));
- 
- 	if (offset == 0) {
- 		offset = time;
-@@ -891,7 +892,7 @@ static inline void
- evdev_process_event(struct evdev_device *device, struct input_event *e)
- {
- 	struct evdev_dispatch *dispatch = device->dispatch;
--	uint64_t time = tv2us(&e->time);
-+	uint64_t time = input_event_time(e);
- 
- #if 0
- 	evdev_print_event(device, e);
---- /dev/null
-+++ b/src/util-input-event.h
-@@ -0,0 +1,69 @@
-+/*
-+ * Copyright © 2019 Red Hat, Inc.
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a
-+ * copy of this software and associated documentation files (the "Software"),
-+ * to deal in the Software without restriction, including without limitation
-+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+ * and/or sell copies of the Software, and to permit persons to whom the
-+ * Software is furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice (including the next
-+ * paragraph) shall be included in all copies or substantial portions of the
-+ * Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+ * DEALINGS IN THE SOFTWARE.
-+ */
-+
-+#pragma once
-+
-+#include "config.h"
-+
-+#include "util-time.h"
-+#include <linux/input.h>
-+
-+static inline struct input_event
-+input_event_init(uint64_t time,
-+		 unsigned int code,
-+		 unsigned int type,
-+		 int value)
-+{
-+	struct input_event ev;
-+	struct timeval tval = us2tv(time);
-+
-+	ev.input_event_sec = tval.tv_sec;
-+	ev.input_event_usec = tval.tv_usec;
-+	ev.type = type;
-+	ev.code = code;
-+	ev.value = value;
-+
-+	return ev;
-+}
-+
-+static inline uint64_t
-+input_event_time(const struct input_event *e)
-+{
-+	struct timeval tval;
-+
-+	tval.tv_sec = e->input_event_sec;
-+	tval.tv_usec = e->input_event_usec;
-+
-+	return tv2us(&tval);
-+}
-+
-+
-+static inline void
-+input_event_set_time(struct input_event *e,
-+		     uint64_t time)
-+{
-+	struct timeval tval = us2tv(time);
-+
-+	e->input_event_sec = tval.tv_sec;
-+	e->input_event_usec = tval.tv_usec;
-+}
---- a/tools/libinput-record.c
-+++ b/tools/libinput-record.c
-@@ -41,6 +41,7 @@
- #include <stdbool.h>
- 
- #include "libinput-versionsort.h"
-+#include "util-input-event.h"
- #include "libinput-util.h"
- #include "libinput-version.h"
- #include "libinput-git-version.h"
-@@ -196,8 +197,9 @@ print_evdev_event(struct record_context
- 	const char *cname;
- 	bool was_modified = false;
- 	char desc[1024];
-+	uint64_t time = input_event_time(ev) - ctx->offset;
- 
--	ev->time = us2tv(tv2us(&ev->time) - ctx->offset);
-+	input_event_set_time(ev, time);
- 
- 	/* Don't leak passwords unless the user wants to */
- 	if (!ctx->show_keycodes)
-@@ -215,7 +217,7 @@ print_evdev_event(struct record_context
- 		static unsigned long last_ms = 0;
- 		unsigned long time, dt;
- 
--		time = us2ms(tv2us(&ev->time));
-+		time = us2ms(input_event_time(ev));
- 		dt = time - last_ms;
- 		last_ms = time;
- 
-@@ -239,8 +241,8 @@ print_evdev_event(struct record_context
- 
- 	iprintf(ctx,
- 		"- [%3lu, %6u, %3d, %3d, %6d] # %s\n",
--		ev->time.tv_sec,
--		(unsigned int)ev->time.tv_usec,
-+		ev->input_event_sec,
-+		(unsigned int)ev->input_event_usec,
- 		ev->type,
- 		ev->code,
- 		ev->value,
-@@ -268,16 +270,18 @@ handle_evdev_frame(struct record_context
- 	while (libevdev_next_event(evdev,
- 				   LIBEVDEV_READ_FLAG_NORMAL,
- 				   &e) == LIBEVDEV_READ_STATUS_SUCCESS) {
-+		uint64_t time;
- 
- 		if (ctx->offset == 0)
--			ctx->offset = tv2us(&e.time);
-+			ctx->offset = input_event_time(&e);
- 
- 		if (d->nevents == d->events_sz)
- 			resize(d->events, d->events_sz);
- 
- 		event = &d->events[d->nevents++];
- 		event->type = EVDEV;
--		event->time = tv2us(&e.time) - ctx->offset;
-+		time = input_event_time(&e);
-+		input_event_set_time(&e, time - ctx->offset);
- 		event->u.evdev = e;
- 		count++;
- 
---- a/src/libinput-private.h
-+++ b/src/libinput-private.h
-@@ -39,6 +39,7 @@
- 
- #include "libinput.h"
- #include "libinput-util.h"
-+#include "util-time.h"
- #include "libinput-version.h"
- 
- #if LIBINPUT_VERSION_MICRO >= 90
---- a/src/libinput-util.h
-+++ b/src/libinput-util.h
-@@ -206,12 +206,6 @@ clear_bit(unsigned char *array, int bit)
- 	array[bit / 8] &= ~(1 << (bit % 8));
- }
- 
--static inline void
--msleep(unsigned int ms)
--{
--	usleep(ms * 1000);
--}
--
- static inline bool
- long_bit_is_set(const unsigned long *array, int bit)
- {
-@@ -453,53 +447,6 @@ bool
- parse_switch_reliability_property(const char *prop,
- 				  enum switch_reliability *reliability);
- 
--static inline uint64_t
--us(uint64_t us)
--{
--	return us;
--}
--
--static inline uint64_t
--ns2us(uint64_t ns)
--{
--	return us(ns / 1000);
--}
--
--static inline uint64_t
--ms2us(uint64_t ms)
--{
--	return us(ms * 1000);
--}
--
--static inline uint64_t
--s2us(uint64_t s)
--{
--	return ms2us(s * 1000);
--}
--
--static inline uint32_t
--us2ms(uint64_t us)
--{
--	return (uint32_t)(us / 1000);
--}
--
--static inline uint64_t
--tv2us(const struct timeval *tv)
--{
--	return s2us(tv->tv_sec) + tv->tv_usec;
--}
--
--static inline struct timeval
--us2tv(uint64_t time)
--{
--	struct timeval tv;
--
--	tv.tv_sec = time / ms2us(1000);
--	tv.tv_usec = time % ms2us(1000);
--
--	return tv;
--}
--
- static inline bool
- safe_atoi_base(const char *str, int *val, int base)
- {
---- /dev/null
-+++ b/src/util-time.h
-@@ -0,0 +1,84 @@
-+/*
-+ * Copyright © 2013-2019 Red Hat, Inc.
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a
-+ * copy of this software and associated documentation files (the "Software"),
-+ * to deal in the Software without restriction, including without limitation
-+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
-+ * and/or sell copies of the Software, and to permit persons to whom the
-+ * Software is furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice (including the next
-+ * paragraph) shall be included in all copies or substantial portions of the
-+ * Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
-+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-+ * DEALINGS IN THE SOFTWARE.
-+ */
-+
-+#pragma once
-+
-+#include "config.h"
-+
-+#include <time.h>
-+#include <stdint.h>
-+#include <unistd.h>
-+#include <linux/input.h>
-+
-+static inline void
-+msleep(unsigned int ms)
-+{
-+	usleep(ms * 1000);
-+}
-+
-+static inline uint64_t
-+us(uint64_t us)
-+{
-+	return us;
-+}
-+
-+static inline uint64_t
-+ns2us(uint64_t ns)
-+{
-+	return us(ns / 1000);
-+}
-+
-+static inline uint64_t
-+ms2us(uint64_t ms)
-+{
-+	return us(ms * 1000);
-+}
-+
-+static inline uint64_t
-+s2us(uint64_t s)
-+{
-+	return ms2us(s * 1000);
-+}
-+
-+static inline uint32_t
-+us2ms(uint64_t us)
-+{
-+	return (uint32_t)(us / 1000);
-+}
-+
-+static inline uint64_t
-+tv2us(const struct timeval *tv)
-+{
-+	return s2us(tv->tv_sec) + tv->tv_usec;
-+}
-+
-+static inline struct timeval
-+us2tv(uint64_t time)
-+{
-+	struct timeval tv;
-+
-+	tv.tv_sec = time / ms2us(1000);
-+	tv.tv_usec = time % ms2us(1000);
-+
-+	return tv;
-+}
diff --git a/meta/recipes-graphics/wayland/libinput_1.14.3.bb b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
similarity index 86%
rename from meta/recipes-graphics/wayland/libinput_1.14.3.bb
rename to meta/recipes-graphics/wayland/libinput_1.15.2.bb
index bc5a76dc9a..810532774e 100644
--- a/meta/recipes-graphics/wayland/libinput_1.14.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.15.2.bb
@@ -13,11 +13,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f2ea9ebff3a2c6d458faf58492efb63"
 DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz \
-           file://0001-adjust-for-64bit-time_t-for-32bit-architectures.patch \
            file://determinism.patch \
-"
-SRC_URI[md5sum] = "d052faa64eb6d2e649e582cc0fcf6e32"
-SRC_URI[sha256sum] = "0feb3a0589709cc1032893bfaf4c49150d5360bd9782bec888f9e4dd9044c5b7"
+           "
+SRC_URI[md5sum] = "eb6bd2907ad33d53954d70dfb881a643"
+SRC_URI[sha256sum] = "971c3fbfb624f95c911adeb2803c372e4e3647d1b98f278f660051f834597747"
 
 UPSTREAM_CHECK_REGEX = "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 
@@ -38,3 +37,4 @@ EXTRA_OEMESON += "-Dudev-dir=${UDEVDIR} \
 RPROVIDES_${PN} = "libinput"
 RREPLACES_${PN} = "libinput"
 RCONFLICTS_${PN} = "libinput"
+
-- 
2.25.0


