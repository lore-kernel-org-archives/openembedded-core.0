Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id E0013783C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 14:40:54 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id q85so4985956pfq.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jul 2017 07:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=OMYpTlnLxWNgcs7z4sC4b8L5f+An8ogcQ4Bx/Sn/W/Q=;
	b=A/iD6KWjmZExk6fGEc5lKxEF00GJKv6YixIBtoSU011G9AOXZFgRuSawXVSHV08zL0
	VtVzt/o/9LSTH0Bw5L9ItdHnXFDXGJcgbCyz9GlkBjG3WS+hRJwHSHMHmlvj8aiU8+WA
	ZgLuwonTpBsUQQskv3bp/oGNMRa5Q3n3QF183huV1AYiXTNRJh82c5cWOnERhYNQAPu3
	WhWDI+FfYT/L6Ds7eSkDKeT2sQbRNL/ngu2bk7z3PKjwBYEO5Vr8sNGNKPssRl0ScKVW
	VOcNLVJVz874MwZ5FDHciCSSE/n7MCLupryFnkQ1ug/5VgO6alatkjfJEyh+Wcz1Rpkd
	nniQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OMYpTlnLxWNgcs7z4sC4b8L5f+An8ogcQ4Bx/Sn/W/Q=;
	b=lL6cryP+yAzXazrv6Ql4wTtnAJWpHN7rItpIcGsMpi3aTzfTjf+7dgqVNXL7txQP19
	FFNN/IZVIN46T9FnJlgs4dabPCzWnZHBXO3GgxxLs9R1eEIUQICu4he3+gEox2bD01Sb
	6AgAunOEyM11W2CGBv7Q0JO6SKahOQ/lDtBdMxcoXLv6+e9WVTAP5Z0/qeN//j065wgm
	aJk+gupOn7BKZoVD8uYbtqD+MfmneKddmUiLotxUQ0ch3B9UazRLL8G0Xog0evRwAMh5
	rQEyHcsK9YRUsGk5bncqDQVGghIyJYh2ueOKSch5/vrjT/NSX4tUU74h3QaLgSO4z4k3
	kwBQ==
X-Gm-Message-State: AIVw110TAysIX0f4Hj18w/t2Rg1BqWKcyldBljg28AlE/yAsyacHebVl
	XApnt1U6Jnp5Yepk
X-Received: by 10.99.42.216 with SMTP id q207mr7682671pgq.298.1500648055819;
	Fri, 21 Jul 2017 07:40:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	z74sm11050373pfd.112.2017.07.21.07.40.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 07:40:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jul 2017 07:40:42 -0700
Message-Id: <20170721144042.19321-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
Subject: [PATCH] expat: Upgrade to 2.2.2
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
X-List-Received-Date: Fri, 21 Jul 2017 14:40:55 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/expat/expat.inc               |  1 +
 meta/recipes-core/expat/expat/libtool-tag.patch | 18 ++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.1.bb          |  5 -----
 meta/recipes-core/expat/expat_2.2.2.bb          |  4 ++++
 4 files changed, 23 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/libtool-tag.patch
 delete mode 100644 meta/recipes-core/expat/expat_2.2.1.bb
 create mode 100644 meta/recipes-core/expat/expat_2.2.2.bb

diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index 9fa0ca2eb3..067687e44a 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
+           file://libtool-tag.patch \
 	  "
 inherit autotools lib_package
 
diff --git a/meta/recipes-core/expat/expat/libtool-tag.patch b/meta/recipes-core/expat/expat/libtool-tag.patch
new file mode 100644
index 0000000000..3ef4197ce5
--- /dev/null
+++ b/meta/recipes-core/expat/expat/libtool-tag.patch
@@ -0,0 +1,18 @@
+Add CC tag to build
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: expat-2.2.2/Makefile.in
+===================================================================
+--- expat-2.2.2.orig/Makefile.in
++++ expat-2.2.2/Makefile.in
+@@ -109,7 +109,7 @@ mkdir-init:
+ 
+ CC = @CC@
+ CXX = @CXX@
+-LIBTOOL = @LIBTOOL@
++LIBTOOL = @LIBTOOL@ --tag CC
+ 
+ INCLUDES = -I$(srcdir)/lib -I.
+ LDFLAGS = @LDFLAGS@
diff --git a/meta/recipes-core/expat/expat_2.2.1.bb b/meta/recipes-core/expat/expat_2.2.1.bb
deleted file mode 100644
index 47827c5576..0000000000
--- a/meta/recipes-core/expat/expat_2.2.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require expat.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
-
-SRC_URI[md5sum] = "d9c3baeab58774cefc2f04faf29f2cf8"
-SRC_URI[sha256sum] = "1868cadae4c82a018e361e2b2091de103cd820aaacb0d6cfa49bd2cd83978885"
diff --git a/meta/recipes-core/expat/expat_2.2.2.bb b/meta/recipes-core/expat/expat_2.2.2.bb
new file mode 100644
index 0000000000..0e135d70df
--- /dev/null
+++ b/meta/recipes-core/expat/expat_2.2.2.bb
@@ -0,0 +1,4 @@
+require expat.inc
+LIC_FILES_CHKSUM = "file://COPYING;md5=5b8620d98e49772d95fc1d291c26aa79"
+SRC_URI[md5sum] = "1ede9a41223c78528b8c5d23e69a2667"
+SRC_URI[sha256sum] = "4376911fcf81a23ebd821bbabc26fd933f3ac74833f74924342c29aad2c86046"
-- 
2.13.3


