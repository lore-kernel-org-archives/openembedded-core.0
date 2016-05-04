Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B756C6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 21:52:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r12so13294992wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2016 14:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=COgAeQbyJA7gJH+OY7uOoG+M4bURE7q+98+MRkIFDv0=;
	b=eNVLyRxiJdX12m3GXwBWQw/Tgb1AtekATfIbWu2U1QEpHuOfsSDfvf2e360JetKUnh
	jXMjGpd1ZeyUY1ermORDsZ4gU8ooCy7KIPlUIRhABshQHuPyAulNFWKQYqCRatFliGTn
	cqad5G0l8MT6tel8zOiRERt5eN391J/t5tGjb6W8lEwq6iz9d369USWJ/rOnwsREpOLm
	ecTcDIpsRF5MO01EOXLsLT0SBSLsh+Uv5uSxgciJ7yTihhb/srrytHHhSJor5GjSYgMa
	InERX9sXnp90EaVwn5dC0WizgwaSrQ7clZXw4wyO0XdRh61HBzEBEjWgMdi5EYC0P1K0
	SXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=COgAeQbyJA7gJH+OY7uOoG+M4bURE7q+98+MRkIFDv0=;
	b=BU/Y7JqrxDD834AqCpoLL3jppgFfn1ItDXBoW/bFnuv5kzI2r12k53tbML0xDpBM+b
	FMvwmGXmSGOBTSHPAfWdmzwGA9bYG2UFO5EVx7t0LIemQjTYRm36maqTDq1x9OeqSAaw
	z14zv7UIT4ZffOSxiu7vMd8GGJbhmPVBnQIHCY+49GSeg/OIC1+J/MVjZUZgqJW0/GmB
	kcUsFnp5qfFwrvIPkHjvuaykmLCJBokdru2NvJCZuJofZF2VmzrNN/Hyw1K4a6ZhMo+P
	vJm0bFuIy4rIVmBkOhVuuswxH3MwgmE3kHzaXViSQ4OVAGGC7l/QN8IQqeuS3M010IVf
	Yn8A==
X-Gm-Message-State: AOPr4FWiKpZ16R5u7bbtNqWEIT/qOrmbtxpADWr/A6fNQUNSeLUQ52nuDn10CMYQZ9gyPQ==
X-Received: by 10.194.230.97 with SMTP id sx1mr12136979wjc.0.1462398778463;
	Wed, 04 May 2016 14:52:58 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id gk4sm6364887wjd.7.2016.05.04.14.52.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 May 2016 14:52:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 14:52:49 -0700
Message-Id: <1462398769-28796-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] gcc: obey ldflags in the link of libgcc
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
X-List-Received-Date: Wed, 04 May 2016 21:53:02 -0000

From: Christopher Larson <chris_larson@mentor.com>

Explicitly obey it, the way it should, rather than only relying on
--with-linker-hash-style.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc                    |  1 +
 .../gcc/gcc-4.9/0075-libgcc-use-ldflags.patch            | 16 ++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc                    |  1 +
 .../gcc/gcc-5.3/0059-libgcc-use-ldflags.patch            | 16 ++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index c187918..bb50205 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -90,6 +90,7 @@ SRC_URI = "\
     file://0072-support-ffile-prefix-map.patch \
     file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
     file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch \
+    file://0075-libgcc-use-ldflags.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch b/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
new file mode 100644
index 0000000..325b72a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
@@ -0,0 +1,16 @@
+Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+--- gcc-5.3.0.orig/libgcc/config/t-slibgcc
++++ gcc-5.3.0/libgcc/config/t-slibgcc
+@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_S
+ 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+ 
+ SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
+-	$(SHLIB_LDFLAGS) \
++	$(LDFLAGS) $(SHLIB_LDFLAGS) \
+ 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
+ 	$(SHLIB_OBJS) $(SHLIB_LC) && \
+ 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index f2eda18..ad56145 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -88,6 +88,7 @@ SRC_URI = "\
            file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
+           file://0059-libgcc-use-ldflags.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch b/meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch
new file mode 100644
index 0000000..325b72a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch
@@ -0,0 +1,16 @@
+Link libgcc using LDFLAGS, not just SHLIB_LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+--- gcc-5.3.0.orig/libgcc/config/t-slibgcc
++++ gcc-5.3.0/libgcc/config/t-slibgcc
+@@ -32,7 +32,7 @@ SHLIB_INSTALL_SOLINK = $(LN_S) $(SHLIB_S
+ 	$(DESTDIR)$(slibdir)$(SHLIB_SLIBDIR_QUAL)/$(SHLIB_SOLINK)
+ 
+ SHLIB_LINK = $(CC) $(LIBGCC2_CFLAGS) -shared -nodefaultlibs \
+-	$(SHLIB_LDFLAGS) \
++	$(LDFLAGS) $(SHLIB_LDFLAGS) \
+ 	-o $(SHLIB_DIR)/$(SHLIB_SONAME).tmp @multilib_flags@ \
+ 	$(SHLIB_OBJS) $(SHLIB_LC) && \
+ 	rm -f $(SHLIB_DIR)/$(SHLIB_SOLINK) && \
-- 
2.8.0


