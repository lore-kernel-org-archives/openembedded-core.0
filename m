Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id E3DD9770A0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:58 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id cy9so418764931pac.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=AzwbkBMM2EFH3WPtnCWn/yVXXiGTgT19XcL57WgwLxY=;
	b=Tsg4zorC1VBntBqo+b0kJJI9qeUz0Rx3FBcFK3Tcq9QRFWOoJq+PeK9uFZEMJqCi6n
	5YpPttlmKi9vK0kPLNqp/bnoELYfCj+Irvn5iGWpQZOXy2+msCXhpfbF+3MHhTmlMvR+
	Z9mLL6UWze0d8Wa0pXvlHtsNjFwvBsODQTw+mczGbaqH4wOkYL4d13T+yufyqhB6PTV9
	Y2r2OvhTN1ZzP4XonMjT9rnRL4KOvjt8zNlRxHbfNCLuo7mkju9191EusPyLTUUGK7Ps
	yNFBajEMYS83Uj30TO7Usbq/xP9mBHsxyzyh6I3frBbd+XwtV/Am5xj2/1Lqot4cIR51
	12/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=AzwbkBMM2EFH3WPtnCWn/yVXXiGTgT19XcL57WgwLxY=;
	b=ChUZcA+7+Qti/eIXwoEQqYjoAXyVv3RL535MGmPWvavMWKcH+D84He7k7TI+ai/Z7g
	nQEqBgNRXUNqn+6TyC6xD7R04ArLipn0rIN2DuRuO6KRgDuZo4/VAORKfLojE9myeRk1
	A+5imbhNOQMLASiM3uCH5aq0t/j6UtOTOoCky8/gCqzOcIXpnjglAzYaB9VQ/tzSIQkf
	IVhAZWFdBN9brV+krpMHyA+0tkEt4bCdVqbLgMMozZoxKSJ5PlubMCRpNF8UmFELN31z
	4eW9CiJa5bwRfbM6TcCwAC1zSoFDwBAcEUgax0QvZgxpLKyE6b0pFgzA9XCwW2tISBqV
	Ahcg==
X-Gm-Message-State: ALoCoQktlQil88GFNVLtm3/EAFq/ZKoXHwmPE0ad/uFbDhwV8r0huVWCAFTTYykjH5D+xasbww/sEtwolUlpF6+yQ8h28ywcXQ==
X-Received: by 10.66.252.136 with SMTP id zs8mr28370315pac.110.1453030679712; 
	Sun, 17 Jan 2016 03:37:59 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:36:39 -0800
Message-Id: <aa5998004a4bbcacf4dfa9855a7981aaf4ffc8fe.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 66/73] console-tools: Fix header inclusion when not using glibc
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:59 -0000

It did differentiate on features in libc but assumed always glibc
this patch make that assumption clear

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Cover-the-else-with-__GLIBC__.patch       | 51 ++++++++++++++++++++++
 .../console-tools/console-tools_0.3.2.bb           |  3 ++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch

diff --git a/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch
new file mode 100644
index 0000000..ace4bf0
--- /dev/null
+++ b/meta/recipes-core/console-tools/console-tools-0.3.2/0001-Cover-the-else-with-__GLIBC__.patch
@@ -0,0 +1,51 @@
+From b6a59b05f1fa514c6b387c9544bd63b1bfcf2eed Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 13 Jan 2016 05:38:29 +0000
+Subject: [PATCH] Cover the else with __GLIBC__
+
+Fixes build errors on musl/x86
+
+| In file included from
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/asm/termios.h:1:0,
+|                  from
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/linux/termios.h:5,
+|                  from
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/console-tools/0.3.2-r8/console-tools-0.3.2/vttools/resizecons.c:86:
+|
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/asm-generic/termios.h:14:8:
+error: redefinition of 'struct winsize'
+|  struct winsize {
+|         ^
+| In file included from
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/sys/ioctl.h:7:0,
+|                  from
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/work/i586-oe-linux-musl/console-tools/0.3.2-r8/console-tools-0.3.2/vttools/resizecons.c:81:
+|
+/home/ubuntu/work/oe/openembedded-core/build/tmp-musl/sysroots/qemux86/usr/include/bits/ioctl.h:90:8:
+note: originally defined here
+|  struct winsize {
+|         ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ vttools/resizecons.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/vttools/resizecons.c b/vttools/resizecons.c
+index f0a7055..e8753b1 100644
+--- a/vttools/resizecons.c
++++ b/vttools/resizecons.c
+@@ -81,7 +81,7 @@
+ #include <sys/ioctl.h>
+ #if (__GNU_LIBRARY__ >= 6)
+ # include <sys/perm.h>
+-#else
++#elif defined __GLIBC__
+ # include <linux/types.h>
+ # include <linux/termios.h>
+ #endif
+-- 
+2.7.0
+
diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index d14d683..1db8414 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://fix-libconsole-linking.patch \
            file://no-dep-on-libfl.patch \
            file://0001-kbdtools-Include-sys-types.h-for-u_char-and-u_short-.patch \
+           file://0001-Cover-the-else-with-__GLIBC__.patch \
            file://lcmessage.m4 \
            file://Makevars"
 
@@ -24,6 +25,8 @@ SRC_URI[sha256sum] = "eea6b441672dacd251079fc85ed322e196282e0e66c16303ec64c3a2b1
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/lct/files/console-tools-devel/"
 UPSTREAM_CHECK_REGEX = "/console-tools-devel/(?P<pver>(\d\d?\.)+\d\d?)/"
 
+CFLAGS_append_aarch64 = " -D_USE_TERMIOS "
+
 do_configure_prepend () {
 	mkdir -p ${S}/m4
 	cp ${WORKDIR}/lcmessage.m4 ${S}/m4/
-- 
2.7.0


