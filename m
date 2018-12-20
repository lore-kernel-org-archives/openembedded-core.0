Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B3A7579F78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 00:15:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z5so21272806wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2018 16:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=adROXzH26OCZwHjLD8MsIlE04UYSAaUNbxKDzO2M3ik=;
	b=W8YMpW4Czt5gTC9+G9fezi6ldcEiEmgHjcn5EHVDDDxjLC0+CcbJLwvkcIYu7x0AKH
	kPZbKNI1hzEAs/4RqGcgsRsWtTGQto225x/y3EY6sEGmCbvz4qpgWpNWOauaPvtNQhHI
	YUBnSs+vJA4/JvLqZZ50vi2u/sSAP1QCk6fJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=adROXzH26OCZwHjLD8MsIlE04UYSAaUNbxKDzO2M3ik=;
	b=XhsHy6YXNPKSe7bdmBZuTeJ4kRR68FUnu3DL3QkLjtfIUW6OQnmBAOffq5k1GrA9zw
	/Eiy3o8BZdlG0rw9jqyoPw6GATBxeu4IPZvP/c7i1tAcCxweYEJuCHPaFAdLGBz3ymd8
	lki3KDTIn/ggJFHZFSFPSA6qOxycTe3x9WRi9m1a5FbHH7Fsb8qNQI2W0+HZq2LEE/8m
	7nzW5U25p4VSNtjFux1aNpEKD4jBAXB4v7Epf8HxLjjgj7pQYbwO2AolhZmIC2McDsRv
	SjsG5CTEk/jAdYE73I2vfAnb0NK8WPsL1OTSgQlzrzGwBo3YwbGL5GcemPFRdO9BLZr/
	r+Sg==
X-Gm-Message-State: AA+aEWaLbDe1c4NcI4YczLFe+/3EEBvhf6i1akntNGtTAwT64Rc7DchY
	FtOQG6T3SkK3NkC1EWH1exYGrnqv3SYzrA==
X-Google-Smtp-Source: AFSGD/U3MI9JNuhYcV/Qj+jFupfHqllbqMqrsQwK//osVjcBlCS20yMBd2QGigNC9mt9EPkAgCVaUg==
X-Received: by 2002:adf:aa9c:: with SMTP id h28mr20068983wrc.216.1545264950955;
	Wed, 19 Dec 2018 16:15:50 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o81sm10175581wmd.10.2018.12.19.16.15.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Dec 2018 16:15:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 00:15:45 +0000
Message-Id: <20181220001545.12618-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
References: <20181220001545.12618-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/4] recipes: Drop virtual/libc-for-gcc
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
X-List-Received-Date: Thu, 20 Dec 2018 00:15:51 -0000
Content-Transfer-Encoding: 8bit

We no longer have special "libc" for gcc so we can rely on plain
virtual/libc and reduce the complexity in the dependencies.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/tcmode-default.inc      | 2 --
 meta/conf/layer.conf                             | 1 -
 meta/recipes-core/glibc/glibc.inc                | 2 +-
 meta/recipes-core/musl/musl_git.bb               | 2 +-
 meta/recipes-core/newlib/newlib_3.0.0.bb         | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc          | 1 -
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
 meta/recipes-devtools/go/go-cross-canadian.inc   | 2 +-
 9 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index a586c63d4b9..c9fed48bce2 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -16,8 +16,6 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "${TCLIBC}"
-PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
 PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index c67dec49ed2..7afccdf3351 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -51,7 +51,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   *->git-native \
   *->ccache-native \
   *->icecc-create-env-native \
-  gcc-cross-${TARGET_ARCH}->virtual/${TARGET_PREFIX}libc-for-gcc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
   ppp-dialin->ppp \
   resolvconf->bash \
diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index de692fbfd75..6aee89bb53a 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -17,7 +17,7 @@ python () {
 
 DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
 
-PROVIDES = "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+PROVIDES = "virtual/libc"
 PROVIDES += "virtual/libintl virtual/libiconv"
 inherit autotools texinfo distro_features_check systemd
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9cc875c4a61..3dc56cef851 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://git.musl-libc.org/musl \
 
 S = "${WORKDIR}/git"
 
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl virtual/crypt"
+PROVIDES += "virtual/libc virtual/libiconv virtual/libintl virtual/crypt"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
diff --git a/meta/recipes-core/newlib/newlib_3.0.0.bb b/meta/recipes-core/newlib/newlib_3.0.0.bb
index 09238fe006b..db13724eb58 100644
--- a/meta/recipes-core/newlib/newlib_3.0.0.bb
+++ b/meta/recipes-core/newlib/newlib_3.0.0.bb
@@ -1,6 +1,6 @@
 require newlib.inc
 
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl"
+PROVIDES += "virtual/libc virtual/libiconv virtual/libintl"
 
 do_configure() {
 	${S}/configure ${EXTRA_OECONF}
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 73f1e054463..e7c08d3a618 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext flex-native virtual/libc"
+DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index add6b43017d..6222c2e8c91 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -31,7 +31,6 @@ EXTRA_OECONF += "\
     --with-system-zlib \
 "
 
-DEPENDS_remove_libc-baremetal := "virtual/${TARGET_PREFIX}libc-for-gcc"
 EXTRA_OECONF_append_libc-baremetal = " --without-headers"
 EXTRA_OECONF_remove_libc-baremetal = "--enable-threads=posix"
 EXTRA_OECONF_remove_libc-newlib = "--enable-threads=posix"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 4fc6747d9da..475e4f08ef0 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -6,7 +6,7 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc"
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index ea68b8875d9..0bc5dce8a14 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -1,7 +1,7 @@
 inherit cross-canadian
 
 DEPENDS = "go-native virtual/${HOST_PREFIX}go-crosssdk virtual/nativesdk-${HOST_PREFIX}go-runtime \
-           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc \
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-libc \
            virtual/nativesdk-${HOST_PREFIX}compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-- 
2.19.1


