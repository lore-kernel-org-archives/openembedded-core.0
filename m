Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8198378297
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 16:52:33 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id o13so7475120ito.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 08:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TJRJAtWUX9RmRxJ7JN+FHCYG2uhj/55WuvsJlnPUdLs=;
	b=N2nw6wpuhlBRUIfLycDVJOTCe+u7oSFGinRRNennTA6a5SEramOueIE0QDDlv/0utO
	ZvUaHkVDeWGzzhGaL4L/C/CrEIjIIani0EUAg8Mih2cbUWUGD60q7mLN2mzOWKPN+SGh
	OFK9PjXIlkmKRUvgz6RQi3L2YniSUgu5g6XF/xnnJhlDsbRii339yNVZiq2Ugc37Fyd6
	lUjDw8l6onC6KdUTPty4vYGDRCGRHiZ6CEnMHH3DFsX1UnFnpc+7UA6iRq0oq4fbLxSg
	3PNnoWqUlEkgDczc5PseVKKmWQAcIif+3UfOhRZNGNgR0E0GAZ/wgLb2T9Eu26VUJyLR
	tFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TJRJAtWUX9RmRxJ7JN+FHCYG2uhj/55WuvsJlnPUdLs=;
	b=QirdfDWblz0MJkIrfEyys4hWbn68p9gfScuVMWBHYea2gpG95E0Q2s6LI5bZs5Qz2P
	p6UnJEntw7BRQ2ERBkjMvlEtdUGaiTgJsJBIoG0FcIOXfqTzMFofai0Q04xxS0qIR57v
	OtPg5+5mFB1SJHLMwaApisEcaACsDrktltHRHOfLAp/6fgY+rrp0dAvW5KfogY8axlPx
	sM2fmv4OrILBgWQ5/xCqn6CTjlyU28X7HKkKAlbu6FU8PqCFxc6FH1hBBp5Jl5eb2tKu
	lTgMwdJqKY615Vry4X/AZ3EpLSxAaXk5ZTJvYrRQ3WUgtK6OCY3hn4aQD2IlCO4AZQDA
	aHTA==
X-Gm-Message-State: APf1xPDlHE0w9cSvTClXhyg+Ci8r+RRcJ9IXCe9awCZskwRgor/hiyMZ
	rc2YBa8Q8htCV7fu9kSo+grTpu4C
X-Google-Smtp-Source: AH8x225RwdYfydWC8yvRV3tSRML1OJJQ217GEMRmY7wHoNo8ltXjYQKqeelIn45P9WeJrNC5bllmpQ==
X-Received: by 10.36.39.201 with SMTP id g192mr1162086ita.144.1518454354532;
	Mon, 12 Feb 2018 08:52:34 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	w132sm12206760iow.51.2018.02.12.08.52.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 08:52:33 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Feb 2018 10:52:08 -0600
Message-Id: <b9d52b53fc2be75e287fdfe35b1a19f74fb9306d.1518453683.git.JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1518453683.git.JPEWhacker@gmail.com>
References: <cover.1517857764.git.JPEWhacker@gmail.com>
	<cover.1518453683.git.JPEWhacker@gmail.com>
Cc: Tomas Novotny <tomas@novotny.cz>
Subject: [PATCH v2 13/17] icecc-toolchain: Add SDK icecream setup
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
X-List-Received-Date: Mon, 12 Feb 2018 16:52:33 -0000

Icecream can now be optionally included in the generated SDK by
including nativesdk-icecc-toolchain to TOOLCHAIN_HOST_TASK. When the SDK
is installed a post-relocation script will check if icecc exists and if
so will generate the toolchain environment.

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
index 00000000000..9c9bb4dc4ea
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-env.sh
@@ -0,0 +1,37 @@
+#! /bin/sh
+# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
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
index 00000000000..04808265781
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/icecc-toolchain/icecc-setup.sh
@@ -0,0 +1,43 @@
+#! /bin/sh
+# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
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
index 00000000000..91958d7fbcc
--- /dev/null
+++ b/meta/recipes-devtools/icecc-toolchain/nativesdk-icecc-toolchain_0.1.bb
@@ -0,0 +1,38 @@
+# Copyright (c) 2018 Joshua Watt, Garmin International,Inc.
+# Released under the MIT license (see COPYING.MIT for the terms)
+SUMMARY = "Generates Icecream toolchain for SDK"
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


