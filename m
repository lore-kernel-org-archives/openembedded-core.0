Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EDCCDE003
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 22:27:15 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32862.1782253628638172021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 15:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tWpLBVcv;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so10829735e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782253627; x=1782858427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+DesP1lolvDkn7SIcZSk0omXQlmPhDeCuLhPxvonv8=;
        b=tWpLBVcvRO8QzpxwP9u71aA0x6PT1WEiYP+pK3+twrOgfH1dkMDrWNuiMAW+svn6Cy
         PFZuRszBwsw7CnqvI6fen6oDYMdDNg3QInrcybMmX+WvuOl7S2g2sbyoSi92LlzrS0me
         1XK3/p1QqqrEp6uEAXfiYewxA3xrISsBWycBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782253627; x=1782858427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L+DesP1lolvDkn7SIcZSk0omXQlmPhDeCuLhPxvonv8=;
        b=Hovpu470iQhN4AMMS0mXFv3v6FmVd6+vutqa+x3aivTNGwIXT+QZX4mjLbxy71oK+q
         vW36kzE1LS8GWxr4b8elX7leGFjbbVsfpgo4H1qftYrO0uuv8ZJ043hC41BrGbPwj2s3
         xTfwO5kAdtfKQjDODjUG81ZR1bQZUvACFAfr+Id4nGIrC9sOcuhQY/aoZpWjgt47TQ0b
         xbtS8AbETdk7V0a/uX6nBEhCOfwlhJnV6fL+npWXQMJkNaN19qb5hj9vekwnWSPbT3O6
         LZ8EHv6fPck341PIOSMagz1lt5AbJEYyGV41xWdpPzIqrJMOSabzNEvYuvFz8O1vO+/C
         euGQ==
X-Gm-Message-State: AOJu0YxGvCwqRafEguPZR53axfEj1iqG0AIxt6rrBszR5217zjVPyV2f
	zIOgkooY8fUyxuKGYj5OYYmEFQFmCDR0mya/2nNpiFZvATCk4jS4vPk/ijjO4er9I6Pz1eLDtMy
	wH+Vv
X-Gm-Gg: AfdE7clzOJDjtEhaMAmZ3a+hOhh7kRtd8IfaAZe1+N8urgLj7TX5hxjbszoHFEPE9ie
	kC5f7kOaOyGKzOOyaC8aF1gWc6WOug/0qP/dt2WjYMDUQW8Kfg5V+Dqerwkp0YFVSFsliTIirFO
	YbgO/NW4O/VrCxenc6lQ7T/j9eOTaq4FihGLSr4Rhne+IhnjJaNHuQzLXrSJ4bei/1ucip7qP9P
	lH+fBbuYYuPojs5tKOvNnnKyyx2lCVp+/L0wRI3q64dW8Tp4nZ5cTf6yVHw/JUH8TfjvPp/e3yp
	nyafdcapnoMhTk5FzYN+Qgk0CuPQ+zvpSS2gb/bQ7gNZEY+kVnjac+kB6vD9xFBjaV3VdwUXXgs
	KFTR1VT6F4rY494jui7EDrvtlaScD8Me/9PQqYg3rHPdWKK6r2jMsHF4k/ZJ5/59MFoccElUrOd
	UNwyTNq9rtboEQxOmeTTetbiJPdMZudOwrcRoc8Cibuon8HsaN6+m6LZN4vwUZNH7+5XmVVMG88
	d2BTczhaknD4eRY
X-Received: by 2002:a05:600c:83c8:b0:492:4889:3d18 with SMTP id 5b1f17b1804b1-4925a0b434emr74397425e9.9.1782253626762;
        Tue, 23 Jun 2026 15:27:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa0055dd0cae868d89dd.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:55dd:cae:868d:89dd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd21dbdsm370786745e9.6.2026.06.23.15.27.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 15:27:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap v2 16/41] libinput: fix for CVE-2026-50292
Date: Wed, 24 Jun 2026 00:26:15 +0200
Message-ID: <19fc681a3fca99801e2e50d6a9c6c921c66a2ce9.1782252148.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782252148.git.yoann.congal@smile.fr>
References: <cover.1782252148.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 22:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239438

From: Hitendra Prajapati <hprajapati@mvista.com>

Pick patch from [1] & [2] also mentioned at Debian report in [3].

[1] https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc
[2] https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b
[3] https://security-tracker.debian.org/tracker/CVE-2026-50292

More details :
1. https://nvd.nist.gov/vuln/detail/CVE-2026-50292
2. https://www.openwall.com/lists/oss-security/2026/06/04/5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wayland/libinput/CVE-2026-50292-01.patch  | 109 ++++++++++++++++++
 .../wayland/libinput/CVE-2026-50292-02.patch  |  99 ++++++++++++++++
 .../wayland/libinput_1.25.0.bb                |   2 +
 3 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch

diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
new file mode 100644
index 00000000000..35b2734d7a5
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
@@ -0,0 +1,109 @@
+From fc2262e1c1847021239065e84f39f15492ef05cc Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:12:29 +1000
+Subject: [PATCH] util: sanitize control characters in str_sanitize()
+
+str_sanitize() only escaped '%' characters for format string safety.
+Device names from uinput devices can contain arbitrary bytes including
+ANSI escape sequences (ESC, 0x1b) and other control characters. When
+these strings are included in log messages and printed to a terminal,
+the escape sequences are interpreted by the terminal emulator. This
+could allow an attacker to manipulate terminal output (change colors,
+set window title, clear screen) when an administrator views libinput
+logs.
+
+Replace all control characters (0x00-0x1f and 0x7f) with '?' in
+addition to the existing '%' escaping. This prevents terminal escape
+sequence injection through device names in log output.
+
+Assisted-by: Claude:claude-opus-4-6
+(cherry picked from commit 71a2c5cae2a80a1e3bb29e3f3a07ccc3f3de5acb)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/fc2262e1c1847021239065e84f39f15492ef05cc]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/util-strings.h | 30 +++++++++++++++++++++++-------
+ test/test-utils.c  | 10 ++++++++++
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/src/util-strings.h b/src/util-strings.h
+index b0916815..3429ec9c 100644
+--- a/src/util-strings.h
++++ b/src/util-strings.h
+@@ -456,26 +456,42 @@ trunkname(const char *filename);
+ 
+ /**
+  * Return a copy of str with all % converted to %% to make the string
+- * acceptable as printf format.
++ * acceptable as printf format, and all non-NUL control characters
++ * (bytes 0x01-0x1f, 0x7f) replaced with '?' to prevent terminal
++ * escape sequence injection. NUL bytes are excluded implicitly
++ * because the string is null-terminated.
+  */
+ static inline char *
+ str_sanitize(const char *str)
+ {
+ 	if (!str)
+ 		return NULL;
++	size_t slen = strlen(str);
++	slen = min(slen, 512);
+ 
+-	if (!strchr(str, '%'))
++	bool needs_sanitization = false;
++	for (size_t i = 0; i < slen; i++) {
++		unsigned char c = str[i];
++		if (c == '%' || c < 0x20 || c == 0x7f) {
++			needs_sanitization = true;
++			break;
++		}
++	}
++	if (!needs_sanitization)
+ 		return strdup(str);
+-
+-	size_t slen = min(strlen(str), 512);
+ 	char *sanitized = zalloc(2 * slen + 1);
+ 	const char *src = str;
+ 	char *dst = sanitized;
+-
+ 	for (size_t i = 0; i < slen; i++) {
+-		if (*src == '%')
++		unsigned char c = *src++;
++		if (c == '%') {
+ 			*dst++ = '%';
+-		*dst++ = *src++;
++			*dst++ = '%';
++		} else if (c < 0x20 || c == 0x7f) {
++			*dst++ = '?';
++		} else {
++			*dst++ = c;
++		}
+ 	}
+ 	*dst = '\0';
+ 
+diff --git a/test/test-utils.c b/test/test-utils.c
+index fa307031..88aede23 100644
+--- a/test/test-utils.c
++++ b/test/test-utils.c
+@@ -1388,6 +1388,16 @@ START_TEST(strsanitize_test)
+ 		{ "x %", "x %%" },
+ 		{ "%sx", "%%sx" },
+ 		{ "%s%s", "%%s%%s" },
++		{ "\t", "?" },
++		{ "\n", "?" },
++		{ "\r", "?" },
++		{ "\x1b[31m", "?[31m" },
++		{ "foo\tbar", "foo?bar" },
++		{ "foo\nbar", "foo?bar" },
++		{ "\x01\x1f\x7f", "???" },
++		{ "clean", "clean" },
++		{ "a\x1b[0mb", "a?[0mb" },
++		{ "%\n", "%%?" },
+ 		{ NULL, NULL },
+ 	};
+ 
+-- 
+2.50.1
+
diff --git a/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch
new file mode 100644
index 00000000000..f78c9f90663
--- /dev/null
+++ b/meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch
@@ -0,0 +1,99 @@
+From b2bde9504d42a5976d76e1f27c640dc561fbd99b Mon Sep 17 00:00:00 2001
+From: Peter Hutterer <peter.hutterer@who-t.net>
+Date: Mon, 1 Jun 2026 10:48:24 +1000
+Subject: [PATCH] libinput-device-group: sanitize phys before printing it
+
+Bug: https://gitlab.freedesktop.org/libinput/libinput/-/work_items/1296
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-50292
+
+A malicious uinput device could set the phys value (via UI_SET_PHYS)
+to contain a '\n'. When the value is printed as part of the device group
+the udev rules will interpret it as separate property.
+
+Depending on the property this can cause local privilege escalation.
+
+Closes #1296
+
+Found-by: Csome
+(cherry picked from commit 76f0d8a7f57e2868882864b4611281f12f704b55)
+
+Part-of: <https://gitlab.freedesktop.org/libinput/libinput/-/merge_requests/1489>
+
+CVE: CVE-2026-50292
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libinput/libinput/-/commit/b2bde9504d42a5976d76e1f27c640dc561fbd99b]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ udev/libinput-device-group.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/udev/libinput-device-group.c b/udev/libinput-device-group.c
+index 3da904e0..d0522685 100644
+--- a/udev/libinput-device-group.c
++++ b/udev/libinput-device-group.c
+@@ -109,7 +109,8 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 	udev_list_entry_foreach(entry, udev_enumerate_get_list_entry(e)) {
+ 		struct udev_device *d;
+-		const char *path, *phys;
++		char *phys = NULL;
++		const char *path;
+ 		const char *pidstr, *vidstr;
+ 		int pid, vid, dist;
+ 
+@@ -124,7 +125,7 @@ wacom_handle_ekr(struct udev_device *device,
+ 
+ 		vidstr = udev_device_get_property_value(d, "ID_VENDOR_ID");
+ 		pidstr = udev_device_get_property_value(d, "ID_MODEL_ID");
+-		phys = udev_device_get_sysattr_value(d, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(d, "phys"));
+ 
+ 		if (vidstr && pidstr && phys &&
+ 		    safe_atoi_base(vidstr, &vid, 16) &&
+@@ -138,11 +139,13 @@ wacom_handle_ekr(struct udev_device *device,
+ 				best_dist = dist;
+ 
+ 				free(*phys_attr);
+-				*phys_attr = safe_strdup(phys);
++				*phys_attr = phys;
++				phys = NULL;
+ 			}
+ 		}
+ 
+ 		udev_device_unref(d);
++		free(phys);
+ 	}
+ 
+ 	udev_enumerate_unref(e);
+@@ -154,8 +157,8 @@ int main(int argc, char **argv)
+ 	int rc = 1;
+ 	struct udev *udev = NULL;
+ 	struct udev_device *device = NULL;
+-	const char *syspath,
+-	           *phys = NULL;
++	char *phys = NULL;
++	const char *syspath = NULL;
+ 	const char *product;
+ 	int bustype, vendor_id, product_id, version;
+ 	char group[1024];
+@@ -179,8 +182,7 @@ int main(int argc, char **argv)
+ 	 * bit and use the remainder as device group identifier */
+ 	while (device != NULL) {
+ 		struct udev_device *parent;
+-
+-		phys = udev_device_get_sysattr_value(device, "phys");
++		phys = str_sanitize(udev_device_get_sysattr_value(device, "phys"));
+ 		if (phys)
+ 			break;
+ 
+@@ -249,6 +251,8 @@ int main(int argc, char **argv)
+ 
+ 	printf("LIBINPUT_DEVICE_GROUP=%s\n", group);
+ 
++	free(phys);
++
+ 	rc = 0;
+ out:
+ 	if (device)
+-- 
+2.50.1
+
diff --git a/meta/recipes-graphics/wayland/libinput_1.25.0.bb b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
index 894858e3617..1a33d16f3a6 100644
--- a/meta/recipes-graphics/wayland/libinput_1.25.0.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.25.0.bb
@@ -14,6 +14,8 @@ DEPENDS = "libevdev udev mtdev"
 
 SRC_URI = "git://gitlab.freedesktop.org/libinput/libinput.git;protocol=https;branch=main \
            file://run-ptest \
+           file://CVE-2026-50292-01.patch \
+           file://CVE-2026-50292-02.patch \
            "
 SRCREV = "3fd38d89276b679ac3565efd7c2150fd047902cb"
 S = "${WORKDIR}/git"

