Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id A1ECF75D4A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 23:10:17 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id o11so7625109qge.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jan 2016 15:10:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=InjtJyv9nwT9pFtsJPhGQ3vIqVsYaYeMaTnP5eoSaGg=;
	b=R4+K2YPMb2db4TA7RI49xFJxT1BUaoxPoMhHR4diby1X6k35/VhxcisCfIZ4hZkfRD
	wZGnM4KkK4bYrmlSrw4r8T5sBU8KdKRmUDQF1gYamztdf+0XJyk6rWTpNQhc4gZAzIko
	3y03+o3wVG1Jl3sxIx/jZK8dHfBEsRRHFl/wOyW83dZ12dMbKNNdD5pHP5i44C61tupH
	nkyKzB87KFKmlFxoW21oPJGxv+/+yJrfIGKWWI4P61Q//C0NoOl7mUOictM03jKV8xCN
	PcEHN4c+SP+RpugyjILWaw1eHwGVlWnVnaamS6o63kGhI2sybZldBQ1cfY5zy3To295R
	xeyw==
X-Gm-Message-State: AG10YORw3OK+KbbD014ev1X+FAppw0H06kVDAvgWrhaEtAo0KrNOGK1wDFyT2FbRXtwlTg==
X-Received: by 10.140.142.207 with SMTP id 198mr13250857qho.77.1453590617981; 
	Sat, 23 Jan 2016 15:10:17 -0800 (PST)
Received: from build-slave.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id 67sm5769501qht.14.2016.01.23.15.10.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 23 Jan 2016 15:10:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 18:09:58 -0500
Message-Id: <c4f289c43b404d30da3f0a77a4971ea84d7f97ea.1453589999.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
In-Reply-To: <cover.1453589999.git.derek@asterius.io>
References: <cover.1453589999.git.derek@asterius.io>
Subject: [meta-python][PATCH 01/13] meta-python: update pypi class to avoid setuptool inherit to be more flexible
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
X-List-Received-Date: Sat, 23 Jan 2016 23:10:19 -0000

---
 meta-python/classes/pypi.bbclass                               | 4 +---
 meta-python/recipes-devtools/python/python-cffi_1.3.1.bb       | 3 +--
 meta-python/recipes-devtools/python/python-chardet_2.3.0.bb    | 2 +-
 meta-python/recipes-devtools/python/python-cryptography_1.1.bb | 4 ++--
 meta-python/recipes-devtools/python/python-enum34_1.0.4.bb     | 2 +-
 meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb   | 2 +-
 meta-python/recipes-devtools/python/python-monotonic_0.4.bb    | 2 +-
 meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb    | 2 +-
 meta-python/recipes-devtools/python/python-pretend_1.0.8.bb    | 2 +-
 meta-python/recipes-devtools/python/python-psutil_2.2.1.bb     | 2 +-
 meta-python/recipes-devtools/python/python-py_1.4.26.bb        | 2 +-
 meta-python/recipes-devtools/python/python-pycparser_2.10.bb   | 2 +-
 meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb  | 2 +-
 meta-python/recipes-devtools/python/python-pytest_2.7.0.bb     | 2 +-
 meta-python/recipes-devtools/python/python-six_1.9.0.bb        | 2 +-
 15 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index 41a70e2..9b8f784 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -16,6 +16,4 @@ PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
 HOMEPAGE ?= "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
 SECTION = "devel/python"
 SRC_URI += "${PYPI_SRC_URI}"
-S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
-
-inherit setuptools
+S = "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
\ No newline at end of file
diff --git a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
index f3cdbd9..c3a6803 100644
--- a/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-cffi_1.3.1.bb
@@ -6,6 +6,5 @@ DEPENDS = "libffi python-pycparser"
 SRC_URI[md5sum] = "deeba7c1fd32a66f1db587988d760c11"
 SRC_URI[sha256sum] = "d45dd39a770b4afb591c82555f6a8bbc1ac7eb019eda9b621eee1a0a72201220"
 
-inherit pypi
-
+inherit pypi setuptools
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
index 25326aa..dfc979b 100644
--- a/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python-chardet_2.3.0.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6f89e2100d9b6cdffcea4f398e37343"
 SRC_URI[md5sum] = "25274d664ccb5130adae08047416e1a8"
 SRC_URI[sha256sum] = "e53e38b3a4afe6d1132de62b7400a4ac363452dc5dfcf8d88e8e0cce663c68aa"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
index b3eee03..16806fb 100644
--- a/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-cryptography_1.1.bb
@@ -13,7 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 SRC_URI[md5sum] = "dd06da41535184f48f2c8e8b74dd570f"
 SRC_URI[sha256sum] = "059bc6428b1d0e2317f505698602642f1d8dda5b120ec573a59a430d8cb7a32d"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                   python-pyasn1\
@@ -50,4 +50,4 @@ do_install_ptest() {
 
 FILES_${PN}-dbg += " \
     ${libdir}/python2.7/site-packages/${SRCNAME}/hazmat/bindings/.debug \
-    "
\ No newline at end of file
+    "
diff --git a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
index 2ef5df1..3227c10 100644
--- a/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
+++ b/meta-python/recipes-devtools/python/python-enum34_1.0.4.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://enum/LICENSE;md5=0a97a53a514564c20efd7b2e8976c87e"
 SRC_URI[md5sum] = "ac80f432ac9373e7d162834b264034b6"
 SRC_URI[sha256sum] = "d3c19f26a6a34629c18c775f59dfc5dd595764c722b57a2da56ebfb69b94e447"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
index 227de54..f7e30cf 100644
--- a/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
+++ b/meta-python/recipes-devtools/python/python-iso8601_0.1.10.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ffb8415711cf5d3b081b87c3d0aff737"
 SRC_URI[md5sum] = "23acb1029acfef9c32069c6c851c3a41"
 SRC_URI[sha256sum] = "e712ff3a18604833f5073e836aad795b21170b19bbef70947c441ed89d0ac0e1"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
index c97ed48..875dee2 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_0.4.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 SRC_URI[md5sum] = "1919cc3aff2a1b907fe24c1f801343ef"
 SRC_URI[sha256sum] = "852f656adbf623ee859def6ca2f5498f4cae3256f8320d5c50570ee8a0592ab6"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "${PYTHON_PN}-ctypes ${PYTHON_PN}-re"
diff --git a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
index faadcec..b8f5f3f 100644
--- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
+++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
@@ -3,7 +3,7 @@ LICENSE = "EPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=eb48c6ee2cb9f5b8b9fe75e6f817bdfc"
 SRCNAME = "paho-mqtt"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
                python-math \
diff --git a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
index 44b584e..ddc7b62 100644
--- a/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python-pretend_1.0.8.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=411780c0b7fa756753e94affeee5bc99"
 SRC_URI[md5sum] = "7147050a95c9f494248557b42b58ad79"
 SRC_URI[sha256sum] = "930f2c1e18503e8f8c403abe2e02166c4a881941745147e712cdd4f49f3fb964"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
index 326d668..1d643eb 100644
--- a/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python-psutil_2.2.1.bb
@@ -9,4 +9,4 @@ RDEPENDS_${PN} += " \
     python-subprocess \
     "
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-py_1.4.26.bb b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
index e606ed9..bb20a41 100644
--- a/meta-python/recipes-devtools/python/python-py_1.4.26.bb
+++ b/meta-python/recipes-devtools/python/python-py_1.4.26.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "30c3fd92a53f1a5ed6f3591c1fe75c0e"
 SRC_URI[sha256sum] = "28dd0b90d29b386afb552efc4e355c889f4639ce93658a7872a2150ece28bb89"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
index fbb6486..3ff2412 100644
--- a/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
+++ b/meta-python/recipes-devtools/python/python-pycparser_2.10.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d29d3ce07825100c58ca57eea171ab65"
 SRC_URI[md5sum] = "d87aed98c8a9f386aa56d365fe4d515f"
 SRC_URI[sha256sum] = "957d98b661c0b64b580ab6f94b125e09b6714154ee51de40bca16d3f0076b86c"
 
-inherit pypi
+inherit pypi setuptools
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
index 3fc5142..092accd 100644
--- a/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
+++ b/meta-python/recipes-devtools/python/python-pyroute2_0.3.14.bb
@@ -8,7 +8,7 @@ SRC_URI[sha256sum] = "aed742a7dbe55eb7f02dbb26719f554b9e92198c4b3c7ac501ad03bbb6
 
 SRC_URI += "file://import-simplejson-as-json.patch"
 
-inherit pypi
+inherit pypi setuptools
 
 RDEPENDS_${PN} += "\
   python-distutils \
diff --git a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
index 14dc85b..91b58af 100644
--- a/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-pytest_2.7.0.bb
@@ -7,4 +7,4 @@ SRC_URI[sha256sum] = "91dc842785417208d57e5e8dc8bb40f57316c45da24a50c53b49cb8d04
 
 RDEPENDS_${PN} = "python-py"
 
-inherit pypi
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-six_1.9.0.bb b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
index c6575f3..15bb0c9 100644
--- a/meta-python/recipes-devtools/python/python-six_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python-six_1.9.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6f00d4a50713fa859858dd9abaa35b21"
 SRC_URI[md5sum] = "476881ef4012262dfc8adc645ee786c4"
 SRC_URI[sha256sum] = "e24052411fc4fbd1f672635537c3fc2330d9481b18c0317695b46259512c91d5"
 
-inherit pypi
+inherit pypi setuptools
 
 do_compile_append() {
     export BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS}
-- 
1.9.1


