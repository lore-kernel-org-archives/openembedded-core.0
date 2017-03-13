Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 068E3776C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 19:57:46 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id b5so19347326pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jR/tWyFlVL8c9B5J4xT4LM70Wd8vCcIoDzFwnQ/ggOY=;
	b=ZBqGJ5DoCGyLg5yCUNVe5jkWaHKh1SBRBN1ZrHgYNI1PLvoA6SIK3eU05rZ4jDM41z
	GSu61S7BrWoJPQCk+cPl47cdVeFuaMGmc6nd5WsNhUKze1kiSsesb48Ngq1VNDA1KMLJ
	p7rayHzFwJozcQNV8lPLigfiAA5pf6OJ+zsz0O5rT89Wsxrs04oQ8JyXBfmRCx9V8JYW
	6H21V2z/q7AXIqPqV+sTDyOAOV1LI9lH5ZVb0Ph71nOk7H2IguCSukMppj/3MDI3jZ6U
	V/z/03N/dDj3nHbkXCW7/JnrWFLNy2oRRzd9BzpzYpg6WWe2KHKAWMJZObE5C6qFjRAu
	B3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jR/tWyFlVL8c9B5J4xT4LM70Wd8vCcIoDzFwnQ/ggOY=;
	b=mKJIVCCwtXvBfSJOoDUW9E4b0IqNf9zjXBxNttJT0J0EcIaBU4ziwzrr0ZonOcQ13w
	hy/fXinl6qYrttasYPXZ7OQ+ONNYj3QUPhPhEKzaMBBr8aaxZaMhQyUZLZmhyE6FOJIU
	vgTGLo4q9mjwcgp/v7b3C24XwqrU0BUF09Usplbj8UaXm6rK/o4dNe3Yei0x9iy2XRl4
	Xn2/9JdwMYSrjtFQHSN8SR1S87vfbWYmOiLZRgaJX0N9qMy4NLXOW5SpSzg8dZX65Lj6
	dQCO0lwPI+jgJeAPBhpSMEPWdKhqunt6dZSNzatU+BTwThtuLMSB4rO3gloIg403IWQ8
	zVLg==
X-Gm-Message-State: AMke39lgrCM+VcgGUKFi12fY6xsW0hHiq2yUQTo/2Z1CzsVzUe94Fz9l4xzXTfwHM7MVjA==
X-Received: by 10.99.171.75 with SMTP id k11mr38344747pgp.16.1489435067639;
	Mon, 13 Mar 2017 12:57:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	g21sm34235291pfb.41.2017.03.13.12.57.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Mar 2017 12:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Mar 2017 12:57:37 -0700
Message-Id: <229f24ad39b3a7e20327b398ed0f7ab21ee63b47.1489434627.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489434627.git.raj.khem@gmail.com>
References: <cover.1489434627.git.raj.khem@gmail.com>
Subject: [PATCH 2/2] go: add native recipes for 1.8
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
X-List-Received-Date: Mon, 13 Mar 2017 19:57:46 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb      |  3 +++
 meta/recipes-devtools/go/go-native.inc                   | 16 +++++++++-------
 .../go/{go-native_1.4.bb => go-native_1.8.bb}            |  1 +
 meta/recipes-devtools/go/go.inc                          |  4 ++--
 4 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
 rename meta/recipes-devtools/go/{go-native_1.4.bb => go-native_1.8.bb} (54%)

diff --git a/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb b/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
new file mode 100644
index 0000000000..3d4141e879
--- /dev/null
+++ b/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
@@ -0,0 +1,3 @@
+BOOTSTRAP = "1.4"
+require go-native.inc
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 89bc63459d..c1ada5121a 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -1,8 +1,10 @@
 inherit native
 
+BOOTSTRAP ?= ""
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-export GOROOT_FINAL = "${STAGING_LIBDIR_NATIVE}/go"
+export GOROOT_FINAL = "${STAGING_LIBDIR_NATIVE}/go${BOOTSTRAP}"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go1.4"
 export CGO_ENABLED = "1"
 
 do_configure[noexec] = "1"
@@ -31,18 +33,18 @@ END
 }
 
 do_install() {
-	install -d ${D}${libdir}/go
-	cp -a ${B}/pkg ${D}${libdir}/go/
-	install -d ${D}${libdir}/go/src
+	install -d ${D}${libdir}/go${BOOTSTRAP}
+	cp -a ${B}/pkg ${D}${libdir}/go${BOOTSTRAP}/
+	install -d ${D}${libdir}/go${BOOTSTRAP}/src
 	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
+		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go${BOOTSTRAP}/src/; \
 	done)
 
-	install -d ${D}${bindir} ${D}${libdir}/go/bin
+	install -d ${D}${bindir} ${D}${libdir}/go${BOOTSTRAP}/bin
 	for f in ${B}/bin/*
 	do
 		base=`basename $f`
-		install -m755 $f ${D}${libdir}/go/bin
+		install -m755 $f ${D}${libdir}/go${BOOTSTRAP}/bin
 		make_wrapper $base $base
 	done
 }
diff --git a/meta/recipes-devtools/go/go-native_1.4.bb b/meta/recipes-devtools/go/go-native_1.8.bb
similarity index 54%
rename from meta/recipes-devtools/go/go-native_1.4.bb
rename to meta/recipes-devtools/go/go-native_1.8.bb
index bbf3c0dd73..182fca27a0 100644
--- a/meta/recipes-devtools/go/go-native_1.4.bb
+++ b/meta/recipes-devtools/go/go-native_1.8.bb
@@ -1,2 +1,3 @@
 require ${PN}.inc
 require go-${PV}.inc
+DEPENDS += "go-bootstrap-native"
diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 1c94fc9c34..0b0cbf19ad 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -1,6 +1,6 @@
 inherit goarch
 # libgcc is required for the target specific libraries to build properly
-DEPENDS += " go-native libgcc"
+DEPENDS += "go-bootstrap-native libgcc"
 # Prevent runstrip from running because you get errors when the host arch != target arch
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
@@ -15,7 +15,7 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go1.4"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
 export CC_FOR_TARGET = "${CC}"
-- 
2.12.0


