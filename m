Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id B4E6A6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 13:46:10 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id 1so5275737qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 06:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=yHnVZYbffzMuvSVtJLUP+xauoeXJz8a8hyznzmuJsBg=;
	b=J/xNGesbhLT4DJWFlyC14fv+z8e2E27gvvzC8KozdFb34cocFEmBPBnQBbo7oiUnzX
	EDM51lOy1KKugR4XEvsT0bn9k39o7hmg5YtUHrTINuiZFxBkFQTitxZE7ehFIyHYRTr8
	UrzF9Sz9NFpi90VW9AV0D3tYlFl749TyxsLETmmT03nLhejia4xlPJz1yGT3qMyKJ+AA
	1WFgJAJKre9Eb45J7VIN+hdZUu+4/Lf9qYwTJZU0wMRl2yUyH4o6VVe60O8/1SarzB55
	kBvAObhCThzZKshq63y6HF1G3zXy5R+RY17wmPngYgqr0U8AAxxoso786GQqrPNy3hkb
	aisg==
X-Gm-Message-State: AMCzsaWB5HX6j90tauNV8DL8iG5JPiHfjX75PBQLQRxFRrCi9GNFSCZ5
	/MfivlK9vdANpULbXfIUBs18sA==
X-Google-Smtp-Source: AOwi7QDVe02LOTu9EJkRxo0TbFTTtpp/Zpk8tneNZBjHRi9C5Xz3CsTsWlcW4uIYtOVBGaUIV0InBQ==
X-Received: by 10.200.23.196 with SMTP id r4mr14302551qtk.158.1507729571156;
	Wed, 11 Oct 2017 06:46:11 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 35sm8070608qtx.43.2017.10.11.06.46.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Oct 2017 06:46:10 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 11 Oct 2017 10:46:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Oct 2017 10:46:02 -0300
Message-Id: <20171011134602.25918-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Wed, 11 Oct 2017 13:46:10 -0000

This upgrades CMake from 3.8.2 to 3.9.3 release. The Copyright.txt
file checksum change was due the addition of a new contributor on the
contributors list.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- amend commit log

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


