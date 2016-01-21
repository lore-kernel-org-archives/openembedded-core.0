Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABF136010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:44:12 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id a202so1410162oib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jCKsg3ePc1SLvpfvHb4Oc5KC6VvTi7f7KVnce6V+tic=;
	b=yihiyA0f8NOF3FUGXs1czqH4UJsRYvWBAt/2rZa9/QGCa4swr3ZgryCqSXJi74fPvI
	kQBMYz6CfxQOao75V2DTKNTD4I1pJxIr/13VIpLjrxLu+3ulkdstFvRvsZ6mNB3YqAKv
	hJ7aeq4OaH6nYg6ID+tagMkjlJ5TPMqVDKHhMwro1/heeBuWE6LFECMDrKMn3upzjk3Q
	F7PYlTlEIp/hn5HRDwmnluPKMAadD4FqztsOyu0EVr5sbYL7kbHkSnq7oGX2BUgGQRbx
	bTS2g/6pwaencw7n0w4FzyInC4W+CKn89kTqtUPDJB84C0M/jWCj8jqF18ksj9ZM40NJ
	pNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jCKsg3ePc1SLvpfvHb4Oc5KC6VvTi7f7KVnce6V+tic=;
	b=lJvOC2x0bpDkCQeUrESgOawiX7MRBJSRvdKNs42Xd7GhQ2lELjGlEj2ce7I6I6hySC
	+kODSBJ52Mis9uIeWils8Hg/Lhs6f6H8+hsjbnnLuAkTVijGlSyZDAf/gf1MjT7e3++1
	dathz9qscnTlbAh/GgjOg32yfgVaTXIPTWl+NLJEahvV9FId6whZK+yREscZBmmH4p2/
	u8XLeQEd5vpg4jM4eS9b8WwfvlnzQU5fD2kOxpew0pNvmUgOzUQA98vhtdbVV9chh62/
	tl5fRt+tqHzxhFS6iMN9dzTwfQTwU3pDzNi3K1m8OVaE3AeCKNHFiCnP9HiGDkNVRUkT
	lCew==
X-Gm-Message-State: ALoCoQm59s41IOrP/PLbI+YTtZjOQIyfUVj1ovdZn8eBtaQGs3Gpp/cY/KwZqltGWYyRM8kbLNaEyy9pt1pmR/fVMdtEyIb2ew==
X-Received: by 10.202.227.136 with SMTP id a130mr30021774oih.8.1453344253544; 
	Wed, 20 Jan 2016 18:44:13 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.44.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:44:12 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:19 -0800
Message-Id: <1453344203-7118-22-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 21/25] gstreamer1.0-plugins-base: update git recipe to 1.7.1
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
X-List-Received-Date: Thu, 21 Jan 2016 02:44:12 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 ...make-gio_unix_2_0-dependency-configurable.patch | 47 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-base_git.bb     | 16 +++++---
 2 files changed, 58 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
new file mode 100644
index 0000000..01e944d
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/make-gio_unix_2_0-dependency-configurable.patch
@@ -0,0 +1,47 @@
+From 10d2a977ee1d469f0bf9059bb2d0b55fd2eecbac Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Wed, 20 Jan 2016 13:00:00 -0800
+Subject: [PATCH] make gio_unix_2_0 dependency configurable
+
+Prior to 1.7.1, gst-plugins-base accepted a configure option to
+disable gio_unix_2_0, however it was implemented incorrectly using
+AG_GST_CHECK_FEATURE. That was fixed in 1.7.1 by making the
+dependency unconditional.
+
+  http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=aadefefba88afe4acbe64454650f24e7ce7c8d70
+
+To make builds deterministic, re-instate support for
+--disable-gio_unix_2_0, but implement it using the AC_ARG_ENABLE
+instead of AG_GST_CHECK_FEATURE.
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ configure.ac | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9c52aeb..26cacd6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -747,9 +747,16 @@ AC_SUBST(FT2_CFLAGS)
+ AC_SUBST(FT2_LIBS)
+ 
+ dnl *** gio-unix-2.0 for tests/check/pipelines/tcp.c ***
++AC_ARG_ENABLE([gio_unix_2_0],
++  [AS_HELP_STRING([--disable-gio_unix_2_0],[disable use of gio_unix_2_0])],
++  [],
++  [enable_gio_unix_2_0=yes])
++
++if test "x${enable_gio_unix_2_0}" != "xno"; then
+ PKG_CHECK_MODULES(GIO_UNIX_2_0, gio-unix-2.0 >= 2.24,
+     HAVE_GIO_UNIX_2_0="yes",
+     HAVE_GIO_UNIX_2_0="no")
++fi
+ AM_CONDITIONAL(USE_GIO_UNIX_2_0, test "x$HAVE_GIO_UNIX_2_0" = "xyes")
+ 
+ dnl *** finalize CFLAGS, LDFLAGS, LIBS
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
index 3d74e85..8ac3a7b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
@@ -6,14 +6,20 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
                     file://COPYING.LIB;md5=6762ed442b3822387a51c92d928ead0d \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=a4e1830fce078028c8f0974161272607"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-plugins-base"
+SRC_URI = " \
+    git://anongit.freedesktop.org/gstreamer/gst-plugins-base;name=base \
+    git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common \
+    file://make-gio_unix_2_0-dependency-configurable.patch \
+"
 
-SRCREV = "8d4cb64a4b9d84b10076bf350f80a0d6ea68ec2d"
+PV = "1.7.1+git${SRCPV}"
+
+SRCREV_base = "5f98203bd753c32666c8fa7a2fde6d186c2a4247"
+SRCREV_common = "86e46630ed8af8d94796859db550a9c3d89c9f65"
+SRCREV_FORMAT = "base"
 
 S = "${WORKDIR}/git"
 
 do_configure_prepend() {
-	cd ${S}
-	./autogen.sh --noconfigure
-	cd ${B}
+	${S}/autogen.sh --noconfigure
 }
-- 
1.9.1


