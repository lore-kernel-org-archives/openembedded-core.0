Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 31AC377EA5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 14:12:32 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id 34so26210295qtb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 07:12:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=OwHYbE3cIG52v3A+8KphlcL9mw7TEQ69PRsBp++9Gs0=;
	b=tBdhIX4ehJYNuvj8GEOOp1xRbq38jMUiF1PFhpYm0cGapAUSxNZ1lkHdU/7X+DqrYT
	n/4Kve5NhN+QuLkZGVOyGSNjOFn9FXH1NQ9fu5DHi1yFV6A/xEmRTgdi7j4fI14BxpHz
	P6qVsyJJsk6enipRbKPtLDndm46sQTtIZy7AY9gTZlVcnwlBTrK3VWVQqt4eiGn3qhS8
	dYgLv76/X2yVAPArmp/EEnU1zIb+YMIfMP4CDPp58ZYVsA5GuhtqlEmH5YYq28UL5k5N
	uPRELJKUFxLsCO0/iEO5BvVkt7+HEDPUjVkWXVLeLPLfmxvuU3RuA/VMCooCix8rtIX0
	2Oig==
X-Gm-Message-State: AMCzsaVxIpS01LYcAfkyZTZEO9dx9b5TRhkaK2VUOAYPmE6ST/QN8l/z
	VTFFXtDhIm9HgF2ghf3p8rY0Dw==
X-Google-Smtp-Source: AOwi7QAOWYcYTvJoKTTkoR0etA+/dv9heecmUQkeoOtImZEeVjbO9R6nU1qM3PS71ieK2fVet4AqvQ==
X-Received: by 10.200.3.14 with SMTP id q14mr14944600qtg.336.1507558353866;
	Mon, 09 Oct 2017 07:12:33 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	m66sm4826277qkf.23.2017.10.09.07.12.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Oct 2017 07:12:32 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 09 Oct 2017 11:12:27 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  9 Oct 2017 11:12:27 -0300
Message-Id: <20171009141227.21795-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Mon, 09 Oct 2017 14:12:33 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../cmake/{cmake-native_3.8.2.bb => cmake-native_3.9.3.bb}   |  0
 meta/recipes-devtools/cmake/cmake.inc                        | 12 ++++++++----
 .../cmake/{cmake_3.8.2.bb => cmake_3.9.3.bb}                 |  0
 3 files changed, 8 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.8.2.bb => cmake-native_3.9.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.8.2.bb => cmake_3.9.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.8.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.9.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.8.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.9.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6aeb25fdd5..092ac74610 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=8d8c7bc32f8797d23f5cf605d9339d2d \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=24600643e5d1d2b8f7478ae5c9074949 \
                     file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -17,8 +17,8 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0001-FindCUDA-Use-find_program-if-find_host_program-is-no.patch \
            "
 
-SRC_URI[md5sum] = "b5dff61f6a7f1305271ab3f6ae261419"
-SRC_URI[sha256sum] = "da3072794eb4c09f2d782fcee043847b99bb4cf8d4573978d9b2024214d6e92d"
+SRC_URI[md5sum] = "cb0f19828461904c72ed6a1e55459d03"
+SRC_URI[sha256sum] = "8eaf75e1e932159aae98ab5e7491499545554be62a08cbcbc7c75c84b999f28a"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
@@ -42,5 +42,9 @@ do_configure_prepend() {
 	sed -i 's/^find_package(Qt5Widgets QUIET)/#find_package(Qt5Widgets QUIET)/g' ${S}/Source/QtDialog/CMakeLists.txt
 	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutoUicInterface/CMakeLists.txt
 	sed -i 's/^  find_package(Qt5Widgets REQUIRED)/#  find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/CMakeLists.txt
-	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/autorcc_depends/CMakeLists.txt
+	sed -i 's/^find_package(Qt5Core REQUIRED)/#find_package(Qt5Core REQUIRED)/g' ${S}/Tests/RunCMake/IncompatibleQt/IncompatibleQt.cmake
+	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/mocRerun/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/rccDepends/CMakeLists.txt
+	sed -i 's/^  find_package(Qt5Core REQUIRED)/#  find_package(Qt5Core REQUIRED)/g' ${S}/Tests/QtAutogen/mocDepends/CMakeLists.txt
+	sed -i 's/^find_package(Qt5Widgets REQUIRED)/#find_package(Qt5Widgets REQUIRED)/g' ${S}/Tests/QtAutogen/mocPlugin/CMakeLists.txt
 }
diff --git a/meta/recipes-devtools/cmake/cmake_3.8.2.bb b/meta/recipes-devtools/cmake/cmake_3.9.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.8.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.9.3.bb
-- 
2.14.2


