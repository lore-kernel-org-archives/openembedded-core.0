Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id A22D97319F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 13:29:38 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id i7so1903818wjf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 05:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c16Q6H+uO/VxBrPIdAM5WjdQf6+DB2sWf/X7wa7ZzZ4=;
	b=dvnrSXoDP6lHpMi1iehEiO4qNot2dKMKkf4WmlYjZ4JyKWHqAXarC+d2izLUmsOt2Y
	BlCsMRtvfgGdyEyc4mb2U7BUV/VUgVNBNZjd9eyCMpFTHWrTD85tEc4SQQvro0O5YA9p
	ruMaquLWYlTeGEm2IQaxJQXsBY4hw4uQKi4pO9lhCW14Y+kpZBeznk3Stpz3hfxlTAZQ
	bydKC1SzX/miZVH7e5G6Vt4X/8ZfXQe3aGjR4oy7TZUpE3wnoqjM6wCKgDttBR2gyH3h
	mYwUurpEs1OOJnbr3t7bliyXEsytUywFVSwZy28rnaM97eZRhIhahqmlwtQ7rGZgeQBh
	u7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=c16Q6H+uO/VxBrPIdAM5WjdQf6+DB2sWf/X7wa7ZzZ4=;
	b=UhAtugHz/rtm+Dr/WsrNYkkoC83Acsih4gjJXuODS/T6ojJROJ2eNJ2IvM7fyhBpGM
	yBjsLCZ8q7XKawtP7PcqC8RQsMGx9Leumme/dF33S5Iicr3osIs5LGgH+7xOm4fnF9Sp
	MlqHVuWIWmcBwapuelEV6YcoPWzGwCijmqQrIAsa7jjuHUaqp5daBJ2n/fC06ymYGG/r
	Mzsc7R4CLRlss5qEGfKlEoILa1shu+/ggILnCjbX/tugDKgY1l4sy3qN/6cC0chaoo2e
	PH7xNj7aHXsAfYANbyR076pQlp2bDZwWbfhJcYsgR1fzBSBJ8UBa7lggyiHT8dxTGoSr
	Ku4Q==
X-Gm-Message-State: AIkVDXLCIeb/Qqu7Rw+eiHyzIp8n3K1t+id3/3ZaEprx/EyuOS5ywPQ+RJNkMyvxR8vsUg==
X-Received: by 10.223.170.195 with SMTP id i3mr27515608wrc.123.1485178177804; 
	Mon, 23 Jan 2017 05:29:37 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-48.hsi12.unitymediagroup.de. [109.91.251.48])
	by smtp.googlemail.com with ESMTPSA id
	u41sm14658736wrc.1.2017.01.23.05.29.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jan 2017 05:29:37 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 14:29:29 +0100
Message-Id: <1485178169-27145-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V3] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Mon, 23 Jan 2017 13:29:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* add PACKAGECONFIF for python: smixer is build with python only
* allow empty alsa-lib package for python disabled
* fix EXTRA_OECONF: soft-float was never enabled
* alsa-fpu.inc: replace tabs by spaces

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-multimedia/alsa/alsa-fpu.inc          |  6 ++--
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ++++++++++++++++++++
 .../0002-use-pkg-config-to-find-python.patch       | 36 ++++++++++++++++++++++
 .../alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb}  | 12 +++++---
 4 files changed, 80 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0002-use-pkg-config-to-find-python.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.2.bb => alsa-lib_1.1.3.bb} (75%)

diff --git a/meta/recipes-multimedia/alsa/alsa-fpu.inc b/meta/recipes-multimedia/alsa/alsa-fpu.inc
index 1ca31e7..943fae6 100644
--- a/meta/recipes-multimedia/alsa/alsa-fpu.inc
+++ b/meta/recipes-multimedia/alsa/alsa-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_alsa_fpu_setting(bb, d):
-	if d.getVar('TARGET_FPU') in [ 'soft' ]:
-		return "--with-softfloat"
-	return ""
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
+        return "--with-softfloat"
+    return ""
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
new file mode 100644
index 0000000..9d464f4
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
@@ -0,0 +1,33 @@
+From 9ed4075f05a4242f32331f7f2c365767970f5003 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 21 Dec 2016 19:46:34 -0300
+Subject: [PATCH] ucm: parser needs limits.h
+
+It's using PATH_MAX which is defined there, otherwise the build fails on
+musl libc.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream-Status: Backport [1]
+
+[1] http://git.alsa-project.org/?p=alsa-lib.git;a=commit;h=9ed4075f05a4242f32331f7f2c365767970f5003
+---
+ src/ucm/parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/ucm/parser.c b/src/ucm/parser.c
+index c98373a..f520abc 100644
+--- a/src/ucm/parser.c
++++ b/src/ucm/parser.c
+@@ -32,6 +32,7 @@
+ 
+ #include "ucm_local.h"
+ #include <dirent.h>
++#include <limits.h>
+ 
+ /** The name of the environment variable containing the UCM directory */
+ #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0002-use-pkg-config-to-find-python.patch b/meta/recipes-multimedia/alsa/alsa-lib/0002-use-pkg-config-to-find-python.patch
new file mode 100644
index 0000000..b7748c3
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0002-use-pkg-config-to-find-python.patch
@@ -0,0 +1,36 @@
+From ab5010c7098e7d580189553ac30c6b5d85950fe3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 23 Jan 2017 14:13:23 +0100
+Subject: [PATCH] use pkg-config to find python
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 83f0ac3..264188d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -388,11 +388,11 @@ if test "$build_python" = "yes"; then
+   AC_ARG_WITH(pythonlibs,
+     AS_HELP_STRING([--with-pythonlibs=ldflags],
+       [specify python libraries (-lpthread -lm -ldl -lpython2.4)]),
+-    pythonlibs="$withval", pythonlibs=`python-config --libs`)
++    pythonlibs="$withval", pythonlibs=`pkg-config --libs python`)
+   AC_ARG_WITH(pythonincludes,
+     AS_HELP_STRING([--with-pythonincludes=Cflags],
+       [specify python C header files (-I/usr/include/python)]),
+-    pythonincludes="$withval", pythonincludes=`python-config --includes`)
++    pythonincludes="$withval", pythonincludes=`pkg-config --cflags python`)
+   if test -z "$pythonlibs"; then
+     echo "Unable to determine python libraries! Probably python-config is not"
+     echo "available on this system. Please, use --with-pythonlibs and"
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
similarity index 75%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
index e313da7..3e0b7e0 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
@@ -11,21 +11,25 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
+           file://0001-ucm-parser-needs-limits.h.patch \
+           file://0002-use-pkg-config-to-find-python.patch \
 "
-SRC_URI[md5sum] = "1946e6438b8262a7b8fdadacd0e06ba7"
-SRC_URI[sha256sum] = "d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6"
+SRC_URI[md5sum] = "eefe5992567ba00d6110a540657aaf5c"
+SRC_URI[sha256sum] = "71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c"
 
 inherit autotools pkgconfig
 
 require alsa-fpu.inc
-EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
+EXTRA_OECONF = "${@get_alsa_fpu_setting(bb, d)}"
 
-EXTRA_OECONF = "--disable-python"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,python"
 
 EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
 
 PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
 FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
+# no python -> smixer is not build
+ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
-- 
2.7.4


