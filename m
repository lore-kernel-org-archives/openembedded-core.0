Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D36AE7854B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 22:03:24 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id 25so4140865ioj.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 14:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PnWc2cuK0u68YeDrmkMYi4VOyvG7n5jJjK3+aYNX2sw=;
	b=JvHa3AhrnziZ2hAhA82n5p92y5/sn2LrJNtze5JMPv4B6B1cqsP5Qu8laxCeaM9MjQ
	Pr4SFPC7vjrt0m0Z2BLTRUoqu6JbMToccTEEltAgnk9pNbpdvisxraB3Kco7iDIZmX/f
	4DpmX5lmzyDJ9evtvkT8xtMz/aaa/LaXf8N0nohxePzk/vQ3fX/IvQBX2OlJBFTmXEwV
	vsVduDMogVc88s5WEI8OMv8Pj2pezbrCispHjjcxtaoa985RBynRkIuADydj3MlrZg3c
	/dKiwN0FCsBTsAmQCQ8Tatft0YgUlMeGpKWH1/z9YuDtEijqAidWfeBgQusDcmQGdasn
	P5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PnWc2cuK0u68YeDrmkMYi4VOyvG7n5jJjK3+aYNX2sw=;
	b=MMrCEFNthXa/52s28LiQ/zu/yt5FcgCwz0jP6f6OlGy1oDt8eIkZ9VFoUXOE/eFuNp
	zniYXeK8aNh3N8NhQNaz62wPEMgYjhZnNsW02vagNJ/EH01hWIE9qTSY+l4hqO684jR0
	MTQrRzWLvv/ve+bOSz55QyP7mHAyccYxpWs4hEyCeX0cWmi0Wx42KYAOLm9uDb1FDL96
	T2tRVJcUTuM93od+hICjUtQQdpuqICb8WrVUMutbO5MzvEv8jouRjt3eqtpz2kmSUlFh
	QqAFMkJbpg2oW+p9hbiC75TyrHGC23T7p8SGjCOqhz/SrmT9HJwh64V/qLvrRopWexbR
	xgVA==
X-Gm-Message-State: APf1xPCDM/QjOMzL2sumg3ydWr+EPfj4VLyaM9aExx0LZ0GzSuoLvDIz
	B6MRh4siBz7rpPvRRO0i+gyLgZ5j
X-Google-Smtp-Source: AH8x226O/4FINd8wFpSrnq6tiKkhPpFve8pogTWR2xp0uLpm6UeNW2/0c52YCCS9zwfu8/rHRWioVw==
X-Received: by 10.107.134.194 with SMTP id q63mr4556130ioi.225.1517954606131; 
	Tue, 06 Feb 2018 14:03:26 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	g69sm294785ita.9.2018.02.06.14.03.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 06 Feb 2018 14:03:25 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue,  6 Feb 2018 16:01:32 -0600
Message-Id: <01d2ca4a15327dee7e56a94487131a639b8090e8.1517857764.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1517857764.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
Subject: [PATCH 13/14] icecc-toolchain: Add SDK icecream setup
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
X-List-Received-Date: Tue, 06 Feb 2018 22:03:25 -0000

IceCream can now be optionally included in the generated SDK by
including nativesdk-icecc-toolchain to TOOLCHAIN_HOST_TASK. When the SDK
is installed, it will check if icecc exists, and if so will generate the
toolchain environment.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../icecc-toolchain/icecc-toolchain/icecc-env.sh   | 37 +++++++++++++++++++
 .../icecc-toolchain/icecc-toolchain/icecc-setup.sh | 43 ++++++++++++++++++++++
 .../nativesdk-icecc-toolchain_0.1.bb               | 38 +++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
 create mode 100644 meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb

diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
new file mode 100644
index 00000000000..4c34edbbc5d
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
@@ -0,0 +1,37 @@
+#! /bin/sh
+# Copyright 2018 Garmin Ltd. or its subsidiaries
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the "Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# SOFTWARE.
+#
+
+if [ -z "$ICECC_PATH" ]; then
+    ICECC_PATH=$(which icecc 2> /dev/null)
+fi
+
+if [ -n "$ICECC_PATH" ]; then
+    export ICECC_PATH
+    export ICECC_VERSION="$OECORE_NATIVE_SYSROOT/usr/share/icecream/@TOOLCHAIN_ENV@"
+    export ICECC="$(which ${CROSS_COMPILE}gcc)"
+    export ICECXX="$(which ${CROSS_COMPILE}g++)"
+    export ICEAS="$(which ${CROSS_COMPILE}as)"
+    export PATH="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin:$PATH"
+else
+    echo "Icecc not found. Disabling distributed compiling"
+fi
+
diff --git a/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
new file mode 100644
index 00000000000..a433e55b029
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
@@ -0,0 +1,43 @@
+#! /bin/sh
+# Copyright 2018 Garmin Ltd. or its subsidiaries
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the "Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be included in
+# all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# SOFTWARE.
+#
+
+# Setup environment
+for env_setup_script in `ls $1/environment-setup-*`; do
+	. $env_setup_script
+done
+
+# ICECC_PATH will have been found icecc-env.sh
+if [ -z "$ICECC_PATH" ]; then
+    exit 0
+fi
+
+echo "Setting up IceCream distributed compiling..."
+
+# Create the environment
+mkdir -p "`dirname $ICECC_VERSION`"
+icecc-create-env $ICECC $ICECXX $ICEAS $ICECC_VERSION || exit $?
+
+# Create symbolic links
+d="$OECORE_NATIVE_SYSROOT/usr/share/icecream/bin"
+mkdir -p "$d"
+ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}gcc"
+ln -s "$ICECC_PATH" "$d/${CROSS_COMPILE}g++"
diff --git a/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
new file mode 100644
index 00000000000..28b2924ebfb
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -0,0 +1,38 @@
+# Copyright (C) 2018 Joshua Watt <JPEWhacker@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+DESCRIPTION = "Generates IceCream toolchains for SDKs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/icecc-env.sh;beginline=2;endline=20;md5=aafdb7bc2aa7ac5d039fda0c8733983c"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "\
+    file://icecc-env.sh \
+    file://icecc-setup.sh \
+    "
+
+inherit nativesdk
+
+ENV_NAME="${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TUNE_PKGARCH}-${DISTRO_VERSION}.tar.gz"
+
+do_compile() {
+}
+
+do_install() {
+    install -d ${D}${SDKPATHNATIVE}${datadir}/icecream/bin
+
+    install -d ${D}${SDKPATHNATIVE}/environment-setup.d/
+    install -m 0644 ${WORKDIR}/icecc-env.sh ${D}${SDKPATHNATIVE}/environment-setup.d/
+    sed -i ${D}${SDKPATHNATIVE}/environment-setup.d/icecc-env.sh \
+        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
+
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+    install -m 0755 ${WORKDIR}/icecc-setup.sh ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+    sed -i ${D}${SDKPATHNATIVE}/post-relocate-setup.d/icecc-setup.sh \
+        -e "s,@TOOLCHAIN_ENV@,${ENV_NAME},g"
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${SDKPATHNATIVE}"
+RDEPENDS_${PN} += "nativesdk-icecc-create-env"
+
-- 
2.14.3


