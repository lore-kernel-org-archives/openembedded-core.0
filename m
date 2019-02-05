Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7817C048
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 00:36:35 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w73so708160pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 16:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=qZ2RtFumktH85oU6Qkol/D0jOz+T5S0US8garSHwmuQ=;
	b=Ju2pe194QyxhUM63eoucOQfg5NyEcqRbXKTPTEXVQbpYQoX71cKY8ybt5s+68Aw/AY
	PN41rFTTZM2Fr2iR7oQdTm4fXEqZ+xXKnczIoPxo/OysklX5xt4rs61f6WSNPxySHLta
	gyxdvld6ZW481132UNu6DEFcrLjiH4F4Vx2nvvnKaoSDAfxB1vedUj2Eq1A5DZRrADqH
	VUNuxM+0bYOp72BJ3K93yuOXSE7PcshbrROAiVp5DrVouHM0pd/mU7ky8S10RpuEvcwQ
	yzKzFChU6ju47sy7B1GDyNIRy49BnjdUmdwVYEr23u1stGrafS12ZIUEJBqKkTDeSU82
	jt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qZ2RtFumktH85oU6Qkol/D0jOz+T5S0US8garSHwmuQ=;
	b=N3GQXG7X8nGkblMwYAPZCXT19/hEWm2U+T4284qjWEL+CZLQ2VzuTlfETwdLUmJUSR
	UPwady+JT69VUuBabU8wC9CHeQRrSeqVD6A3woiERdnOiCg50+iPXsFCc4WXlCEuFrpt
	GNchX3flU1dwTECenhNrWEUajMECS+V6YTGco4u0TuEmKmG2PpUhZ1Vc471vFA7vRjQ1
	ueocLPLCZB3tttT0lVKDByszAEgRO0ir0CJa1guQupxZ46SIvaHwK3osRP3K0NHZcYle
	evcQlA7emJvbAcORT2XrSEb1E46oMFza2fcl6mwkSMmMsOWYxYz1prurbk46ieLr6dwh
	JG5w==
X-Gm-Message-State: AHQUAuZJvw/gWZL77nrIw6gvEoMrC5DFHH/hi3H7dB3psXeIWZKnUezG
	u5ILWO3ww4sxE13W8gQby9h5Avp9
X-Google-Smtp-Source: AHgI3IapUZQRLiK2jkoFa9/6sZiHUfYjL9oT52KAy70LwN+p8r4ad+Imgq6bz/WVj5j2SwRT5NtkUw==
X-Received: by 2002:a63:5c41:: with SMTP id n1mr1909592pgm.1.1549326996065;
	Mon, 04 Feb 2019 16:36:36 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	j6sm1641821pfg.126.2019.02.04.16.36.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Feb 2019 16:36:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2019 16:36:27 -0800
Message-Id: <20190205003627.4454-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190205003627.4454-1-raj.khem@gmail.com>
References: <20190205003627.4454-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Vlad Zakharov <vzakhar@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Claudiu Zissulescu <claziss@synopsys.com>
Subject: [PATCH 2/2] mpfr: Upgrade to 4.0.2 release
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
X-List-Received-Date: Tue, 05 Feb 2019 00:36:35 -0000
Content-Transfer-Encoding: 8bit

Drop backported patch which is now applied upstream in 4.0.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-obsolete-ARC-asm-constraints.patch | 45 ---------
 meta/recipes-support/mpfr/mpfr_4.0.1.bb       | 19 ----
 meta/recipes-support/mpfr/mpfr_4.0.2.bb       | 94 +++++++++++++++++++
 3 files changed, 94 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
 delete mode 100644 meta/recipes-support/mpfr/mpfr_4.0.1.bb
 create mode 100644 meta/recipes-support/mpfr/mpfr_4.0.2.bb

diff --git a/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch b/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
deleted file mode 100644
index 59d1b0db67..0000000000
--- a/meta/recipes-support/mpfr/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-mpfr-longlong.h: Fix obsolete ARC asm constraints
-
-This patch replaces obsolete ARC "J" asm constraint with
-up-to-date "Cal" constraint.
-
-"J" constraint only existed in pre-upstream GCC port for ARC.
-In current upstream port "Cal" constraint is used which leads
-to compile-time error.
-
-Proposed fix is known to work in Buildroot, Crosstool-NG etc.
-
-[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=09cb6a17e71bd40d2fbfaf82a1502fc210e33c87
-
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-
-Upstream-Status: Backport [https://gforge.inria.fr/scm/viewvc.php/mpfr?view=revision&revision=13251]
----
-Index: src/mpfr-longlong.h
-===================================================================
---- a/src/mpfr-longlong.h	(revision 10963)
-+++ b/src/mpfr-longlong.h	(working copy)
-@@ -416,17 +416,17 @@
- 	   : "=r" (sh),							\
- 	     "=&r" (sl)							\
- 	   : "r"  ((USItype) (ah)),					\
--	     "rIJ" ((USItype) (bh)),					\
-+	     "rICal" ((USItype) (bh)),					\
- 	     "%r" ((USItype) (al)),					\
--	     "rIJ" ((USItype) (bl)))
-+	     "rICal" ((USItype) (bl)))
- #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
-   __asm__ ("sub.f\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
- 	   : "=r" (sh),							\
- 	     "=&r" (sl)							\
- 	   : "r" ((USItype) (ah)),					\
--	     "rIJ" ((USItype) (bh)),					\
-+	     "rICal" ((USItype) (bh)),					\
- 	     "r" ((USItype) (al)),					\
--	     "rIJ" ((USItype) (bl)))
-+	     "rICal" ((USItype) (bl)))
- #endif
- 
- #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
diff --git a/meta/recipes-support/mpfr/mpfr_4.0.1.bb b/meta/recipes-support/mpfr/mpfr_4.0.1.bb
deleted file mode 100644
index 2eee76a357..0000000000
--- a/meta/recipes-support/mpfr/mpfr_4.0.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
-HOMEPAGE = "http://www.mpfr.org/"
-LICENSE = "LGPLv3+"
-SECTION = "devel"
-
-inherit autotools texinfo
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "gmp autoconf-archive"
-
-SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz \
-           file://0001-Fix-obsolete-ARC-asm-constraints.patch"
-SRC_URI[md5sum] = "b8dd19bd9bb1ec8831a6a582a7308073"
-SRC_URI[sha256sum] = "67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e"
-
-UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/mpfr/mpfr_4.0.2.bb b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
new file mode 100644
index 0000000000..3cd09abdd7
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
@@ -0,0 +1,94 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -1,7 +1,7 @@
+#                      GNU GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -645,7 +645,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License
+# -    along with this program.  If not, see <http://www.gnu.org/licenses/>.
+# +    along with this program.  If not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# @@ -664,11 +664,11 @@
+#    You should also get your employer (if you work as a programmer) or school,
+#  if any, to sign a "copyright disclaimer" for the program, if necessary.
+#  For more information on this, and how to apply and follow the GNU GPL, see
+# -<http://www.gnu.org/licenses/>.
+# +<https://www.gnu.org/licenses/>.
+#  
+#    The GNU General Public License does not permit incorporating your program
+#  into proprietary programs.  If your program is a subroutine library, you
+#  may consider it more useful to permit linking proprietary applications with
+#  the library.  If this is what you want to do, use the GNU Lesser General
+#  Public License instead of this License.  But first, please read
+# -<http://www.gnu.org/philosophy/why-not-lgpl.html>.
+# +<https://www.gnu.org/licenses/why-not-lgpl.html>.
+# --- COPYING.LESSER
+# +++ COPYING.LESSER
+# @@ -1,7 +1,7 @@
+# -		   GNU LESSER GENERAL PUBLIC LICENSE
+# +                   GNU LESSER GENERAL PUBLIC LICENSE
+#                         Version 3, 29 June 2007
+#  
+# - Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
+# + Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -10,7 +10,7 @@
+#  the terms and conditions of version 3 of the GNU General Public
+#  License, supplemented by the additional permissions listed below.
+#  
+# -  0. Additional Definitions. 
+# +  0. Additional Definitions.
+#  
+#    As used herein, "this License" refers to version 3 of the GNU Lesser
+#  General Public License, and the "GNU GPL" refers to version 3 of the GNU
+# @@ -111,7 +111,7 @@
+#         a copy of the Library already present on the user's computer
+#         system, and (b) will operate properly with a modified version
+#         of the Library that is interface-compatible with the Linked
+# -       Version. 
+# +       Version.
+#  
+#     e) Provide Installation Information, but only if you would otherwise
+#     be required to provide such information under section 6 of the
+# 
+#
+
+SUMMARY = "C library for multiple-precision floating-point computations with exact rounding"
+HOMEPAGE = "http://www.mpfr.org/"
+LICENSE = "LGPLv3+"
+SECTION = "devel"
+
+inherit autotools texinfo
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
+                    file://COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
+                    "
+DEPENDS = "gmp autoconf-archive"
+
+SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.xz"
+SRC_URI[md5sum] = "320fbc4463d4c8cb1e566929d8adc4f8"
+SRC_URI[sha256sum] = "1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a"
+
+UPSTREAM_CHECK_URI = "http://www.mpfr.org/mpfr-current/"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


