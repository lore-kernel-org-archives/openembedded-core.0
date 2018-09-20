Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBDE745AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 12:35:26 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id v17-v6so9214695wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 05:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=yAKLdKdYblWi1rl73cxJYUMt1PKHNHnXuyiqG0GJac0=;
	b=wluJMhSwX2rM3GeW1hRsiR7mC6HEo6dcaH2HQ1nxrU8P7XHuamPuXIPfBS8wa29/IF
	4Hnbqd9sV7BqpWij+vkiAKifUIUzJulCmHPMGMdr7ekGyJfQn1f9Z/s6RqMNT3u+75Cg
	tL/G+mOECZ4JLtnoUURTFqMJqf+lOJFAp298MIGdmSIp2B7cEaOz9j+BWISYWKInrZZh
	6kULlbMsDQ0slsBc3sKovp3cghjh0H8eYgIdjdgIoWVP9xhDq0OMa+O4zQTAReW9B0TU
	E6VWF5+Pq6JPKWSiU7EnoPHulJq5ITxO7xqP2k4LmiUIYHmjdySzlDl+AxgXLu4c5BqD
	lchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yAKLdKdYblWi1rl73cxJYUMt1PKHNHnXuyiqG0GJac0=;
	b=OuM8nhq4fjf/3/5/wUI2C4OA2Ku3Ktoyotlbb95enPlDFzu0kZBnDLJCTV8lpLoWV8
	XZhusRjTfTfeAVXvSmWy+aAAnBiUWB0ymDJC5GImDrq+N85WvuSattdxS0wdxt8DjkWg
	xQg9YfX0J19KE32mE+1Z0PVgoFail31di91vGNAhGLB1/Ui8S3je91ZFX6eIgQJGK3XB
	jDQP/ilv+QhQg3X9Nlc/GhKus0fEBvWSBCUPJAJlAgMJrKky+LaOE3i4h9XRRqPJG6kA
	h/oLuRsdu2UMNxdHVdpP7UvG/HQrNHeB9Ca1JpqZfNhVaFPzIksPR3rZvFHyzyXD9C7B
	Nh7w==
X-Gm-Message-State: APzg51D9oLpbnBRTjzmRwpyK+0TVgXr3sMlEdjmOJu0GDqx/0QFeGJFC
	EQiPkVTk0FzIA8vFNA+3cwCSB5UcaP0=
X-Google-Smtp-Source: ANB0VdbY/VgUfPKjQrKyuH8yCqI6lFc1JF2WXmxWomDpy9ue33iax+M8FQjon48jMZEtlFxL5a8feQ==
X-Received: by 2002:adf:9244:: with SMTP id
	62-v6mr30653346wrj.62.1537446926480; 
	Thu, 20 Sep 2018 05:35:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j75-v6sm3715672wmj.8.2018.09.20.05.35.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 05:35:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 13:35:24 +0100
Message-Id: <20180920123524.8407-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xserver-xorg: remove redundant patch
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
X-List-Received-Date: Thu, 20 Sep 2018 12:35:27 -0000

Upstream doesn't assume a monotonic clock isn't available anymore, so we can
remove this patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...onfigure.ac-Fix-check-for-CLOCK_MONOTONIC.patch | 60 ----------------------
 .../xorg-xserver/xserver-xorg_1.20.1.bb            |  1 -
 2 files changed, 61 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
deleted file mode 100644
index 020a1cf37ce..00000000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 8a91316c4a38f20e7866289f3d779a037d27a129 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 12 Dec 2016 12:11:39 +0200
-Subject: [PATCH] Discover monotonic clock using compile-time check
-
-monotonic clock check does not work when cross-compiling.
-
-Upstream-Status: Denied [Does not work on OpenBSD]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-
-Original patch follows:
-
-When xorg-xserver is being cross-compiled, there is currently no way
-for us to detect whether the monotonic clock is available on the
-target system, because we aren't able to run a test program on the host
-system. Currently, in this situation, we default to not use the
-monotonic clock. One problem with this situation is that the user will
-be treated as idle when the date is updated.
-
-To fix this situation, we now use a compile-time check to detect whether the
-monotonic clock is available. This check can run just fine when we are
-cross-compiling.
-
-Signed-off-by: David James <davidjames at google.com>
-
----
- configure.ac | 17 +++++++----------
- 1 file changed, 7 insertions(+), 10 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 2b21667..786e002 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -984,19 +984,16 @@ if ! test "x$have_clock_gettime" = xno; then
-         CPPFLAGS="$CPPFLAGS -D_POSIX_C_SOURCE=200112L"
-     fi
- 
--    AC_RUN_IFELSE([AC_LANG_SOURCE([
-+    AC_COMPILE_IFELSE([AC_LANG_SOURCE([[
- #include <time.h>
--
--int main(int argc, char *argv[[]]) {
--    struct timespec tp;
--
--    if (clock_gettime(CLOCK_MONOTONIC, &tp) == 0)
-+#include <unistd.h>
-+int main() {
-+#if !(defined(_POSIX_MONOTONIC_CLOCK) && _POSIX_MONOTONIC_CLOCK >= 0 && defined(CLOCK_MONOTONIC))
-+        #error No monotonic clock
-+#endif
-         return 0;
--    else
--        return 1;
- }
--    ])], [MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no],
--       [MONOTONIC_CLOCK="cross compiling"])
-+]])],[MONOTONIC_CLOCK=yes], [MONOTONIC_CLOCK=no])
- 
-     if test "$MONOTONIC_CLOCK" = "cross compiling"; then
-         AC_CHECK_DECL([CLOCK_MONOTONIC],[MONOTONIC_CLOCK="guessing yes"],[MONOTONIC_CLOCK=no],[#include <time.h>])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
index 2cbcd90eb8c..69be3c73850 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.1.bb
@@ -1,7 +1,6 @@
 require xserver-xorg.inc
 
 SRC_URI += "file://musl-arm-inb-outb.patch \
-            file://0001-configure.ac-Fix-check-for-CLOCK_MONOTONIC.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             "
-- 
2.11.0


