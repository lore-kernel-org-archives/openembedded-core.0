Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFEF61301
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:05:54 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id fa20so801831pjb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 00:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WLw/pxjYNKmgKisp7Ds04R9ZWH1rSG68jufNqqaj37Y=;
	b=Gle9STrmCFL7zVdF16v95LhLL2Op0uIHhCaMHjrD2DTTkS3SPnAgiEmSoTIsLA5pxa
	Yg/pHexgDJn+px3HVfSgfvZsKU6ad1MJRZKdfkCyl++f5YuV9oahsLSN865UuZx7bibv
	MwT/CdOZ1WzWgv11BfvRNEa4Adx1xsxn5S4KyhDSTQvc6SsRkvlhhfVSteeiv+2ONR3n
	5/0x5CDjVcaGlVmlM2vFjwL9JteyEcG+MCmDzrqZEZlVLz4WTUwVqg5xx2zCh21kZq58
	pXeY6oI43JU5rdvy4x7A+uZpGVC+nTZRzJxKftTdPsr9qfbYG35XqH/kJynpQNBUpKX+
	WKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WLw/pxjYNKmgKisp7Ds04R9ZWH1rSG68jufNqqaj37Y=;
	b=ouPbNsnj1HE6t53D64tJtSwb60Y3cGQT+pbMzANfSc2cGawrgisNtLDm8ToTQMEsBb
	OqiGkNEzQwessrivlM6BYu1znDKqeqdhLVlWirVo2g/lfgDmh8oYiJJQQRhKcClQOHID
	dzsO2lk9byJ6QzqVUMXWBbvRdimFuYHUzFVmXn19L8/+RHc/NJcOzFfGd2E11lX6Etea
	CLNd+V1tfkBxwaXqqx4hxzXOwSnDEzuX36xGBoPEZZuEXmLxYxUn8O5zWZuaYS/M/Sjx
	GPiS99YT++leewlzkA4SE+tjqgF+Fom4o475NQZlFQw/n0io3Iko5TAg6MeaJLq4Sz55
	/UXQ==
X-Gm-Message-State: APjAAAWaGn2RrCLIqIZxNdvtqi1G5JIzjSxbfAb0Sj+Q7Z/MpGEvV8S/
	aDiHJ0XsdUpoDkvFCWgDpd4QBzyDmEk=
X-Google-Smtp-Source: APXvYqwqN1kk6oe8dGC0dGIeR28o71xswYrcIm13kZKB8QO3OzAkJB8pXD922RTE4KcvelRepXMqrQ==
X-Received: by 2002:a17:90a:330f:: with SMTP id
	m15mr3510914pjb.24.1582790755014; 
	Thu, 27 Feb 2020 00:05:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	188sm1431753pfa.62.2020.02.27.00.05.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 00:05:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2020 00:05:57 -0800
Message-Id: <20200227080558.3819138-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227080558.3819138-1-raj.khem@gmail.com>
References: <20200227080558.3819138-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] systemd: Drop local time64 patch in favour of upstreamed patches
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
X-List-Received-Date: Thu, 27 Feb 2020 08:05:54 -0000
Content-Transfer-Encoding: 8bit

https://github.com/systemd/systemd/commit/9e7c8f64cfda101496f56f5546097221e8ad5d6a
https://github.com/systemd/systemd/commit/601f91bec5646a9c6fbd4f1ec5f1b4ae28d3a770

Fixed this issue upstream and they are present in 244 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ead-of-TIME_T_MAX-for-timerfd_settim.patch | 31 -------------------
 meta/recipes-core/systemd/systemd_244.3.bb    |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch

diff --git a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch b/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
deleted file mode 100644
index 33c575871c..0000000000
--- a/meta/recipes-core/systemd/systemd/0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 3cc30186f9d9adb565dc29f2d4e68889974676ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Dec 2019 12:49:07 -0800
-Subject: [PATCH] Use INT_MAX instead of TIME_T_MAX for timerfd_settime timeout
-
-kernel prior to 64bit time_t support might not entertain such large
-timeout therefore reduce it to INT_MAX which would set timer expiration
-event after 68 years of uptime, should be good for all practical
-purposes
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
----
- src/basic/time-util.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/basic/time-util.c b/src/basic/time-util.c
-index d7ef30d2fe52..4d3219f114b5 100644
---- a/src/basic/time-util.c
-+++ b/src/basic/time-util.c
-@@ -1487,7 +1487,7 @@ int time_change_fd(void) {
- 
-         /* We only care for the cancellation event, hence we set the timeout to the latest possible value. */
-         static const struct itimerspec its = {
--                .it_value.tv_sec = TIME_T_MAX,
-+                .it_value.tv_sec = INT_MAX,
-         };
- 
-         _cleanup_close_ int fd;
diff --git a/meta/recipes-core/systemd/systemd_244.3.bb b/meta/recipes-core/systemd/systemd_244.3.bb
index e7d2997963..dfb7ad59c0 100644
--- a/meta/recipes-core/systemd/systemd_244.3.bb
+++ b/meta/recipes-core/systemd/systemd_244.3.bb
@@ -17,9 +17,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 SRC_URI += "file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
+           file://99-default.preset \
            file://0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
-           file://99-default.preset \
            "
 
 # patches needed by musl
@@ -42,7 +42,6 @@ SRC_URI_MUSL = "\
                file://0019-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch \
                file://0020-missing_type.h-add-__compar_d_fn_t-definition.patch \
                file://0021-avoid-redefinition-of-prctl_mm_map-structure.patch \
-               file://0022-Use-INT_MAX-instead-of-TIME_T_MAX-for-timerfd_settim.patch \
                file://0024-test-json.c-define-M_PIl.patch \
                file://0001-do-not-disable-buffer-in-writing-files.patch \
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
-- 
2.25.1


