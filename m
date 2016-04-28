Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id E7D51731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 00:47:28 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id vv3so7660299pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=W/1AOoU35rxmx0XmkkdveVZdSluif007d5r8/DYiS+Q=;
	b=h3td4lx5AffpHPcZpa+TzITuVzWIb2LcFb7s8Vv3L5OSkoX+kkO80IrpClL4OFbO5I
	SgKf8vVz3XjG5U6+WiFwlwz6zsU3dCvPq4ftaoQrMoDjK6hnycZ5k2j7hPQEvGfWWcMS
	AyjTwhMZyChG9rQ47Jo6lfYamDI6UA0yT2dkgvTI+5eybIo0Th8tGmpEhyiw3kWyXUiB
	RHYHYO1SCY/QXuzKZj1TVVP0t0h9ea0O2AINydcsgID4R3Gc7pF0cs5bNdMeI0g6b/TQ
	M6Zhuu8g7LzyccKOeaEVsNiloJUJwLOBacmvKjB4jX/QHkeVXlp3inAu1vSwZt9keqcJ
	ILvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=W/1AOoU35rxmx0XmkkdveVZdSluif007d5r8/DYiS+Q=;
	b=JKBpardmxg3omm58iikKWxm0m9QW8SV/xU4pKSYLqy9G9Ho3WEHjSk7Q5W71T8Ls7W
	JBkOpwHsVIwVR+ViIgHamJTXl5wpqVK5ICXXN8L7y0qTumqoe/KWfcA3BrlWPOZ9GydF
	/iIzWuiLDOxvaO5n79II43kHTEzwmqhtEAsvYIOxG5zcxDiADxZh0ZcOkynsJ3r5lZZg
	SKCIrRMJBWVGL+q+GOT50bqS982UmAaqfWRkY6ICjlPzj7A6alA9OkoLinSkyfEpziLv
	QGa0BqLjYAIt1Rxq6I8A8cxxI1U/7e0Lr9vrLEuqAsb3FzqytazKY20qrNI7sI+x6Tvs
	LLXA==
X-Gm-Message-State: AOPr4FWXDuWow38xyPYGBGjlLCyW9+rBl/BkHEuXdwEsU5HKAlbkX18e6cNASfpmJlZnsQ==
X-Received: by 10.66.153.174 with SMTP id vh14mr16461314pab.131.1461804449962; 
	Wed, 27 Apr 2016 17:47:29 -0700 (PDT)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id m12sm9636649pfi.5.2016.04.27.17.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 17:47:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 17:47:22 -0700
Message-Id: <1461804443-13094-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
References: <1461804443-13094-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [master][krogoth][PATCH 3/4] busybox: Security fix CVE-2016-2147
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
X-List-Received-Date: Thu, 28 Apr 2016 00:47:29 -0000

From: Armin Kuster <akuster@mvista.com>

busybox <= 1.24.2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../busybox/busybox/CVE-2016-2147.patch            | 57 ++++++++++++++++++++++
 .../busybox/busybox/CVE-2016-2147_2.patch          | 32 ++++++++++++
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
new file mode 100644
index 0000000..84cae6a
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2016-2147.patch
@@ -0,0 +1,57 @@
+From d474ffc68290e0a83651c4432eeabfa62cd51e87 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 10 Mar 2016 11:47:58 +0100
+Subject: [PATCH] udhcp: fix a SEGV on malformed RFC1035-encoded domain name
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2016-2147
+
+https://git.busybox.net/busybox/commit/?id=d474ffc
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/udhcp/domain_codec.c | 13 +++++++++----
+ 1 file changed, 9 insertions(+), 4 deletions(-)
+
+Index: busybox-1.23.2/networking/udhcp/domain_codec.c
+===================================================================
+--- busybox-1.23.2.orig/networking/udhcp/domain_codec.c
++++ busybox-1.23.2/networking/udhcp/domain_codec.c
+@@ -63,11 +63,10 @@ char* FAST_FUNC dname_dec(const uint8_t
+ 				if (crtpos + *c + 1 > clen) /* label too long? abort */
+ 					return NULL;
+ 				if (dst)
+-					memcpy(dst + len, c + 1, *c);
++					/* \3com ---> "com." */
++					((char*)mempcpy(dst + len, c + 1, *c))[0] = '.';
+ 				len += *c + 1;
+ 				crtpos += *c + 1;
+-				if (dst)
+-					dst[len - 1] = '.';
+ 			} else {
+ 				/* NUL: end of current domain name */
+ 				if (retpos == 0) {
+@@ -78,7 +77,10 @@ char* FAST_FUNC dname_dec(const uint8_t
+ 					crtpos = retpos;
+ 					retpos = depth = 0;
+ 				}
+-				if (dst)
++				if (dst && len != 0)
++					/* \4host\3com\0\4host and we are at \0:
++					 * \3com was converted to "com.", change dot to space.
++					 */
+ 					dst[len - 1] = ' ';
+ 			}
+ 
+@@ -228,6 +230,9 @@ int main(int argc, char **argv)
+ 	int len;
+ 	uint8_t *encoded;
+ 
++        uint8_t str[6] = { 0x00, 0x00, 0x02, 0x65, 0x65, 0x00 };
++        printf("NUL:'%s'\n",   dname_dec(str, 6, ""));
++
+ #define DNAME_DEC(encoded,pre) dname_dec((uint8_t*)(encoded), sizeof(encoded), (pre))
+ 	printf("'%s'\n",       DNAME_DEC("\4host\3com\0", "test1:"));
+ 	printf("test2:'%s'\n", DNAME_DEC("\4host\3com\0\4host\3com\0", ""));
diff --git a/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
new file mode 100644
index 0000000..1473d46
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2016-2147_2.patch
@@ -0,0 +1,32 @@
+From 1b7c17391de66502dd7a97c866e0a33681edbb1f Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Fri, 11 Mar 2016 00:26:58 +0100
+Subject: [PATCH] udhcpc: fix a warning in debug code
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upsteam-Status: Backport
+CVE: CVE-2016-2147 regression fix
+
+https://git.busybox.net/busybox/commit/?id=1b7c17
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ networking/udhcp/domain_codec.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/networking/udhcp/domain_codec.c b/networking/udhcp/domain_codec.c
+index cee31f1..5a923cc 100644
+--- a/networking/udhcp/domain_codec.c
++++ b/networking/udhcp/domain_codec.c
+@@ -7,6 +7,7 @@
+  * Licensed under GPLv2 or later, see file LICENSE in this source tree.
+  */
+ #ifdef DNS_COMPR_TESTING
++# define _GNU_SOURCE
+ # define FAST_FUNC /* nothing */
+ # define xmalloc malloc
+ # include <stdlib.h>
+-- 
+2.3.5
+
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index 61fc878..82fc64f 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -45,6 +45,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rcK \
            file://runlevel \
            file://CVE-2016-2148.patch \
+           file://CVE-2016-2147.patch \
+           file://CVE-2016-2147_2.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.3.5


