Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id DCBB5780A0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 17:03:26 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id j2so458439ota.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 09:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oPn/JwPPjoRaOTzgVJbu7VlKgIol7xcc+dUMefUTqkQ=;
	b=biMUeZch2krM0hRGGXG4KO99Ik8N3B8KuCJxSN2Ah0TIGwcqcV9lJfyyLrHaYv7vs7
	V/WGtDzxvPBe7QXhB25T8UsPqVcgkklk1Xceg1L7ogS/5ptW0jyh03btqKc0/TwFzYsz
	a7xcBYwxlHX4vehtK0dBUr/vTfXmJSjzUYK8yNiQrQLcpSVLPKKrK1A6c25dpNDIb7GS
	adYLJrPGYc4yjlYANvAinpIb6w6F3OY7jY38rjZdXHJaytlQMEM0yqFR5+SvtDkrRN+T
	jk6fv2ko7EAC13Pzt3LIaaQV6ABKmP/PSVIUzTSYxlyww+tpfHofm0NmNRQDpbX3K0II
	hqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oPn/JwPPjoRaOTzgVJbu7VlKgIol7xcc+dUMefUTqkQ=;
	b=r7lwuZ7ZHD+xJ8fipm4yeLZXCQK0f1hxgjqGutAjAgwnZcIFs1WStiYGOI9lvAPenK
	M165THzHq7YZMb/eAo+CwoGgUCXaJMiu61SG5K92e4NI27ihSXqYB0N5Q19eylcbdvlU
	2I9sDSFyteIJIHgvVD5g8H1jMTq55BXitmXDkosDdB+D9n8C7YcjZCJKeCLjaj5ZMQsl
	Nsi+vsqPWQceztQ4r0TY40CcDicGPFPdmbaOoKfXZ7rwZIo6upwE7wIzMgZrv/5MBmpE
	1lbioM4/YEt03u3Tiut76yKmMpC/l73MYFC5PLJI6RtpF9i2Q2CczN3HQbB3xtIWQmDA
	yDaw==
X-Gm-Message-State: AJaThX65I/GxLygGy1cDelD/Ruj5YW2ve89SQNHkggAYMVElOHNZWBp0
	eXpe9BDSU0fm3yBcL8H3wBcZ7gVU
X-Google-Smtp-Source: AGs4zMacJWNORRXC+Szq+ISYtYgkk4PsIcH0Jy+MTFLrRIJdG8tAhSUGZd4Nv6rGmVi2Aupg5CoskA==
X-Received: by 10.157.82.153 with SMTP id f25mr16880997oth.97.1511888607453;
	Tue, 28 Nov 2017 09:03:27 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	y51sm13742130oti.9.2017.11.28.09.03.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 09:03:26 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 11:03:23 -0600
Message-Id: <20171128170323.4864-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv4] recipes-graphics/piglit: Add patch to fix build in some platforms
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
X-List-Received-Date: Tue, 28 Nov 2017 17:03:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

The entry point is not guaranteed to exist, so use the
piglit_egl_get_default_display() helper which does the correct thing.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...gl-context-priority.c-Use-piglit_egl_get_.patch | 41 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
new file mode 100644
index 0000000000..e2e87cc1ed
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
@@ -0,0 +1,41 @@
+From cb562a383229074b44db6998b85572d2abe7c363 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
+Date: Fri, 24 Nov 2017 10:31:55 -0600
+Subject: [PATCH] tests/egl/egl-context-priority.c: Use
+ piglit_egl_get_default_display
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The entry point is not guaranteed to exist, so use the
+piglit_egl_get_default_display() helper which does the correct thing.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Tapani Pälli <tapani.palli@intel.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-Status: Backport
+
+https://cgit.freedesktop.org/piglit/commit/?id=cb562a3832
+---
+ tests/egl/egl-context-priority.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tests/egl/egl-context-priority.c b/tests/egl/egl-context-priority.c
+index 7f26fc614..9590ccae3 100644
+--- a/tests/egl/egl-context-priority.c
++++ b/tests/egl/egl-context-priority.c
+@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
+ 	if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
+ 		piglit_report_result(PIGLIT_SKIP);
+ 
+-	dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
+-				    EGL_DEFAULT_DISPLAY, NULL);
++	dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
+ 
+ 	ok = eglInitialize(dpy, &major, &minor);
+ 	if (!ok) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d274a8fbd5..45fd534dfa 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.11.0


