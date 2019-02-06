Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0A06A7C38E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 08:44:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id n2so2620925pgm.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 00:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rk7JYvyXdb+FmWIt8CxxW98jnj8+MV+hN5wvaz7MTmg=;
	b=iSurQcPGi+aGm4Ud7C3ZZzSB9tPl7gRP1Ibbu6kMSRIcgAe3Sjp9Tfyqwq5ZnHfVQ1
	eiyL9pQecGDwX0NPZpL3IT3s6u3p+/DBrnQAkJ17wH8wA1T1OliOcVojizxKHr+fCAs6
	3uPvdDdduITbp1F7jbCnnlq5cOtQVU31PJz8KIcDLj1y8RcGzvIUHECrwwyrvktAthEY
	j93yjC+/9DffEcRYTHX4nmYerqMj6/HHoe7eZsAbWo2ZO0YpUAgXlsdGTqVW1HAXo010
	motOdsV/BuIWakcBNrQzHxplIEDPDWiBtK4lDCmqy21Tkh5bv6Lxfmk+tn8F22b6CRRM
	T9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rk7JYvyXdb+FmWIt8CxxW98jnj8+MV+hN5wvaz7MTmg=;
	b=EbI2v+U2Yy1S92KLsDpmknxAZDKdyCNCHXljyNldr91iNrqKyCE1h/lc0aUURYpIJn
	9M9zytJTysjRM4+pm1N2iQfXBMwCU+jQ2eSXSGFhWH2CbX/rpd6Gj8XZGAhkEtdbgHqz
	IEfygMGAQBY0zzaNyJEN8N8VGA+VAgLhWrYH+mM34lrKiDHJiwYmXFkAQxCNQt+P5bE2
	VWBCQKjU9D2Ca+pg3ZODJiiQ0g+KcL8xp3CuYwz/Hc2zef5nWFh2GvmFeniYQc22UJwv
	3S7F2Kpx8xLzSJun1wHubd3ShOiqHrJ2m35VMpkXE8olQAxerjiHJhQJ6R65kTc7O51j
	8y/Q==
X-Gm-Message-State: AHQUAuY9fpAblq4r7yqsnrpOW1ktxXQpH43zIH7SzMWgtN6LHebzFNhT
	mi1YH+NOmbmkiwwYYgmWr2ckK0mD
X-Google-Smtp-Source: AHgI3IaawMQFkltfvI/4Y6X+ldvmsZHO6E75ZJ/lRDzuGux18PQpMkMAs3vAiD2FxwurUowbdqA4jQ==
X-Received: by 2002:a63:3287:: with SMTP id y129mr8609133pgy.337.1549442657591;
	Wed, 06 Feb 2019 00:44:17 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::a005])
	by smtp.gmail.com with ESMTPSA id
	m3sm8631122pfi.102.2019.02.06.00.44.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 00:44:17 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Feb 2019 00:44:06 -0800
Message-Id: <20190206084406.18441-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Vlad Zakharov <vzakhar@synopsys.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Claudiu Zissulescu <claziss@synopsys.com>
Subject: [PATCH V2] mpfr: Upgrade to 4.0.2 release
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
X-List-Received-Date: Wed, 06 Feb 2019 08:44:17 -0000
Content-Transfer-Encoding: 8bit

License-Update: Formatting changes and replace http with https in urls.

Drop backported patch which is now applied upstream in 4.0.2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Drop devtool added comments

 ...001-Fix-obsolete-ARC-asm-constraints.patch | 45 -------------------
 meta/recipes-support/mpfr/mpfr_4.0.1.bb       | 19 --------
 meta/recipes-support/mpfr/mpfr_4.0.2.bb       | 19 ++++++++
 3 files changed, 19 insertions(+), 64 deletions(-)
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
index 0000000000..03059174ee
--- /dev/null
+++ b/meta/recipes-support/mpfr/mpfr_4.0.2.bb
@@ -0,0 +1,19 @@
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


