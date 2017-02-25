Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id F2E9873144
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 18:13:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 5so7337749pgj.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 10:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fCQs+gmAvkUEHGuzdvurI3TnvF1rJIcY7wdIf64ZKgk=;
	b=KIVPK6SYdzxl2SPRezBOap/ppNwYMxKK3dY1I4IBtjxy3/u1uOtaAaMDHxOAG6fYeI
	kg2nr58avsAeaCFX/wv9iQZ3xQoz/dOHx7CVttCjMMMTj3H3fEHf0ShV74d3QV5H4bTQ
	lzjr0meZRdlkSHyskAifuKb2r+y3S4Vxn/pSwux267k1zQlmw/VvfhHhS+5GkbEF+PLa
	UAxzwYCUgIppbZhYP60ztxq3miXzFxDj5RzGgq71Svv1agalUGH8y5SZJdBWBrJUJ3ww
	xlSLcdprxDS3fE1jACoDZ2AFdc8vUxIJUDSvS+VDRhlhpHl3YT9tELFxlGjsvtH+OkgZ
	zGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fCQs+gmAvkUEHGuzdvurI3TnvF1rJIcY7wdIf64ZKgk=;
	b=Q3tqRLWhoIqAxK3xwXwPkZ0OW3zajfAn9ij2ldz/DceizArX4ABcpaINbFhdkQGCrl
	lEB7zJtu79ICOnRwQSBluAuouQ/hxhyicGbXrTFyxMaD0dxRTQjdKdtJfdafui2Ng1LQ
	zsXDeWgNtA/B7xa9eQiBztIuV9sa2Puvy7LLFIyuxI+tiFmqKORba/dG559NxW6Xr0QX
	SBWy/dM9/XeetuFHrCo5eLGyNiz+YbBfeMaYGCqVxtA2CSA75xjeVfs3RbgzhjuvmahC
	pNlLnrgbemCtNQJmGhYMVOpdA0uAoyqJJcFhnP+88o6vANU+G035ExNtUItkk5zwiowU
	Yebw==
X-Gm-Message-State: AMke39nBr9iUNjsMcVA0HqqMzDJ5M1rZovWp4t7Zp36vcyJhr44NAhWuv+2XK4MomN5G2Q==
X-Received: by 10.84.229.10 with SMTP id b10mr12567314plk.148.1488046408019;
	Sat, 25 Feb 2017 10:13:28 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y5sm21851692pgy.28.2017.02.25.10.13.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Feb 2017 10:13:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2017 10:13:13 -0800
Message-Id: <90844974c128323bc5fd7fdda850b2f3f2f83a1c.1488046239.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1488046239.git.raj.khem@gmail.com>
References: <cover.1488046239.git.raj.khem@gmail.com>
Subject: [PATCH 3/4] go: Fix go cross build with rss
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
X-List-Received-Date: Sat, 25 Feb 2017 18:13:27 -0000

recipe specific sysroot demanded changes how cross go compiler was built
rename PN to include ARCH_NAME for cross recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass                  |  2 +-
 meta/recipes-devtools/go/go-cross.inc    | 10 ++++++++++
 meta/recipes-devtools/go/go-cross_1.7.bb |  5 +++++
 meta/recipes-devtools/go/go_1.7.bb       |  2 --
 4 files changed, 16 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-cross.inc
 create mode 100644 meta/recipes-devtools/go/go-cross_1.7.bb

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e10864d99b..293194d39a 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -21,7 +21,7 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-DEPENDS += "go-cross"
+DEPENDS += "go-cross-${TARGET_ARCH}"
 DEPENDS_class-native += "go-native"
 
 INHIBIT_PACKAGE_STRIP = "1"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
new file mode 100644
index 0000000000..fa9c339b93
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -0,0 +1,10 @@
+inherit cross
+
+DEPENDS += "gcc-cross-${TARGET_ARCH}"
+
+PN = "go-cross-${TARGET_ARCH}"
+
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
+
+GOROOT_FINAL ="${libdir}/go"
+export GOROOT_FINAL
diff --git a/meta/recipes-devtools/go/go-cross_1.7.bb b/meta/recipes-devtools/go/go-cross_1.7.bb
new file mode 100644
index 0000000000..56ee084b10
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross_1.7.bb
@@ -0,0 +1,5 @@
+require go-cross.inc
+require go_${PV}.bb
+
+# Go binaries are not understood by the strip tool.
+INHIBIT_SYSROOT_STRIP = "1"
diff --git a/meta/recipes-devtools/go/go_1.7.bb b/meta/recipes-devtools/go/go_1.7.bb
index 8186427933..e7a6ab277e 100644
--- a/meta/recipes-devtools/go/go_1.7.bb
+++ b/meta/recipes-devtools/go/go_1.7.bb
@@ -1,4 +1,2 @@
 require go-${PV}.inc
 require go.inc
-
-BBCLASSEXTEND = "cross"
-- 
2.11.1


