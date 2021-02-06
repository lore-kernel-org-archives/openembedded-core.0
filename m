Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web08.4319.1612602259919457242
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 01:04:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e/TE3PCS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id v15so10464754wrx.4
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 01:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k3WArWRFHisP+Lvwjctuty9fBrGn7vZMD1k0zUcwXeM=;
        b=e/TE3PCSHH7uoMBjVEn5FxrPO0TGV9aAmdGXy27a9xbwWiN1DjOgNNIKjJMjsvOQYZ
         R8Is4P4nXPj+gozxnnSfNcO3J9sjdV/DmXkAKn1dpv7Ve/2PnGy3Jgx6ALdVYIvMGPwM
         eqfzncgWxOYIrnVjLmElCg/4QSiaUK1szk4r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k3WArWRFHisP+Lvwjctuty9fBrGn7vZMD1k0zUcwXeM=;
        b=j2gCEkV4ZYLOhZGs4OaDSVe7wGSQIFkkMxQsBy5LLsLhpdRi23VyqaPouV69cRF4Cp
         x/7IkeBzd/zmexs5ADUEpYE/UsrK4KKkN7Zn9IbZR7AIU2i+HJlWEI7SOkvqH2pw+cZl
         0v9wYjKKfHqxpNA7mSXj6PWh0UihAMm9wUrfEkE87qSWFkfh1Ins1sMv5OQV2BmqxvaE
         D6hMLahYzVqe4SwPbNJ67uxwFdCpr4nZKfuem/fuhyqX0Q7UJsvMwXVBuhu4pNRSQ5dz
         nWrsv0x8gEQNNZTzLL8EoB+Q0J3WK7/NuaGhiYnSngcaqOTE66taA20pm1UVwms6AGE/
         gUuA==
X-Gm-Message-State: AOAM532rsAEiEhjAA7OW/MYjVGZQFHvSGiZfiq41CTPo1+JqenGmQ2Q4
	+TnMH3oOYvUJ/JE9kblL8/2eSq8sq4U3jQ==
X-Google-Smtp-Source: ABdhPJwE+d7JZfzSR88VeuWz57QHUhd8uRVIT4GT/b3LOQHheK5+tRAEPBwOVCe9tYdd8UF403PGQw==
X-Received: by 2002:adf:d852:: with SMTP id k18mr9520630wrl.262.1612602258435;
        Sat, 06 Feb 2021 01:04:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:be75:a088:9c76:71df])
        by smtp.gmail.com with ESMTPSA id o124sm11332678wmb.5.2021.02.06.01.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 01:04:18 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH 05/10] autoconf: merge .bb and .inc files
Date: Sat,  6 Feb 2021 09:04:10 +0000
Message-Id: <20210206090415.1707868-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
References: <20210206090415.1707868-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

These files are split for historical reasons, so merge them to make
maintaining them easier.

The bb and inc had differing LICENSE assignments.  Current autoconf is
GPLv3+.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc   | 55 ------------------
 .../autoconf/autoconf_2.69.bb                 | 57 ++++++++++++++++++-
 2 files changed, 55 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf.inc

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
deleted file mode 100644
index a4db7ca38f3..00000000000
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
-DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
-configure software source code packages. Autoconf creates a configuration script for a package from a template \
-file that lists the operating system features that the package can use, in the form of M4 macro calls."
-LICENSE = "GPLv3"
-HOMEPAGE = "http://www.gnu.org/software/autoconf/"
-SECTION = "devel"
-DEPENDS = "m4-native gnu-config-native"
-
-RDEPENDS_${PN} = "m4 gnu-config \
-		  perl \
-		  perl-module-bytes \
-		  perl-module-carp \
-		  perl-module-constant \
-		  perl-module-data-dumper \
-		  perl-module-errno \
-		  perl-module-exporter \
-		  perl-module-file-basename \
-		  perl-module-file-compare \
-		  perl-module-file-copy \
-		  perl-module-file-find \
-		  perl-module-file-glob \
-		  perl-module-file-path \
-		  perl-module-file-spec \
-		  perl-module-file-spec-unix \
-		  perl-module-file-stat \
-		  perl-module-getopt-long \
-		  perl-module-io-file \
-		  perl-module-overloading \
-		  perl-module-posix \
-		  perl-module-symbol \
-		  perl-module-thread-queue \
-		  perl-module-threads \
-		 "
-RDEPENDS_${PN}_class-native = "m4-native gnu-config-native hostperl-runtime-native"
-
-inherit autotools texinfo
-
-PERL = "${USRBINPATH}/perl"
-PERL_class-native = "/usr/bin/env perl"
-PERL_class-nativesdk = "/usr/bin/env perl"
-
-CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
-
-do_configure() {
-	# manually install a newer config.guess/.sub
-	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
-	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
-
-	oe_runconf
-}
-
-do_install_append() {
-    rm -rf ${D}${datadir}/emacs
-}
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.69.bb b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
index 2e1b9bdc908..e30536a2213 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.69.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.69.bb
@@ -1,8 +1,14 @@
-require autoconf.inc
+SUMMARY = "A GNU tool that produce shell scripts to automatically configure software"
+DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
+configure software source code packages. Autoconf creates a configuration script for a package from a template \
+file that lists the operating system features that the package can use, in the form of M4 macro calls."
+LICENSE = "GPLv3+"
+HOMEPAGE = "http://www.gnu.org/software/autoconf/"
+SECTION = "devel"
+DEPENDS = "m4-native gnu-config-native"
 
 PR = "r11"
 
-LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
 
@@ -26,6 +32,53 @@ SRC_URI[sha256sum] = "954bd69b391edc12d6a4a51a2dd1476543da5c6bbf05a95b59dc0dd6fd
 
 SRC_URI_append_class-native = " file://fix_path_xtra.patch"
 
+RDEPENDS_${PN} = "m4 gnu-config \
+		  perl \
+		  perl-module-bytes \
+		  perl-module-carp \
+		  perl-module-constant \
+		  perl-module-data-dumper \
+		  perl-module-errno \
+		  perl-module-exporter \
+		  perl-module-file-basename \
+		  perl-module-file-compare \
+		  perl-module-file-copy \
+		  perl-module-file-find \
+		  perl-module-file-glob \
+		  perl-module-file-path \
+		  perl-module-file-spec \
+		  perl-module-file-spec-unix \
+		  perl-module-file-stat \
+		  perl-module-getopt-long \
+		  perl-module-io-file \
+		  perl-module-overloading \
+		  perl-module-posix \
+		  perl-module-symbol \
+		  perl-module-thread-queue \
+		  perl-module-threads \
+		 "
+RDEPENDS_${PN}_class-native = "m4-native gnu-config-native hostperl-runtime-native"
+
+inherit autotools texinfo
+
+PERL = "${USRBINPATH}/perl"
+PERL_class-native = "/usr/bin/env perl"
+PERL_class-nativesdk = "/usr/bin/env perl"
+
+CACHED_CONFIGUREVARS += "ac_cv_path_PERL='${PERL}'"
+
 EXTRA_OECONF += "ac_cv_path_M4=m4 ac_cv_prog_TEST_EMACS=no"
 
+do_configure() {
+	# manually install a newer config.guess/.sub
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/build-aux
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/build-aux
+
+	oe_runconf
+}
+
+do_install_append() {
+    rm -rf ${D}${datadir}/emacs
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.27.0

