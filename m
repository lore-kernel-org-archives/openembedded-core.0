Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id CBE467824A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:56 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id k2so9343042qte.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=+pnD+I81MP4p4OdOgGJv/cfu0PrGv1SjeBgLsYoTqgI=;
	b=r0JSqDHF88ke2BoooBG5JAWxfI4v8RPgqnHUuZl+igZ9OyV2QQhEL1WhZyv0EOSK7Y
	9h2/tJni6hQWv30UP9dxCINtlInJUYfogj4NwDIhRoMbJ4YK5utRLoBZdEiLm/6q1Zln
	qQ4Yin5KEdLyHEcdjrcmWLRI6aFluDVLBS7CcVMihNH9HRqMb2ncIY7EqUb8uPQ5C+Mt
	tYttodmYOHcJWMOI1gPIVhKM72axvAVGShjiOLiVBWJ0a9+qfLawY4Qg5/rpblEBLNMz
	YBW4bKGbZ72voBMSMOLNw6wnwTbzq4poZSS5Dz9RLUOG4vRK4I0Bzix2EsMRWECPYYOw
	vLyA==
X-Gm-Message-State: AHPjjUjYhHFrF4nIk39XnvfR1T6MlNV3+oHyMHhNhAtrZi1/NXC2NbQS
	Q+WkdgQiiW14zhqs
X-Google-Smtp-Source: AOwi7QCOPo9D0l5eSLyutJ2b5mLx8DBbN0wu2fA3hJf5o2Ju39ebgFaHug/Cqr7GkWzTbPFSOUpfuQ==
X-Received: by 10.200.14.79 with SMTP id j15mr6043770qti.201.1504904817631;
	Fri, 08 Sep 2017 14:06:57 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	x194sm2014575qkx.74.2017.09.08.14.06.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:56 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:50 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:44 -0300
Message-Id: <20170908210444.25763-15-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 14/14] go-helloworld: Use the Golang examples repository
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This updates the recipe to use the Golang examples repository so it
makes use of the unpack as well as standard tasks showing how easy it
can be.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5:
- new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../go-examples/files/helloworld.go                | 10 ---------
 meta/recipes-extended/go-examples/go-examples.inc  | 10 ---------
 .../go-examples/go-helloworld_0.1.bb               | 24 ++++++++++++++--------
 3 files changed, 15 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
 delete mode 100644 meta/recipes-extended/go-examples/go-examples.inc

diff --git a/meta/recipes-extended/go-examples/files/helloworld.go b/meta/recipes-extended/go-examples/files/helloworld.go
deleted file mode 100644
index 0253c40411..0000000000
--- a/meta/recipes-extended/go-examples/files/helloworld.go
+++ /dev/null
@@ -1,10 +0,0 @@
-// You can edit this code!
-// Click here and start typing.
-// taken from https://golang.org/
-package main
-
-import "fmt"
-
-func main() {
-	fmt.Println("Hello, 世界")
-}
diff --git a/meta/recipes-extended/go-examples/go-examples.inc b/meta/recipes-extended/go-examples/go-examples.inc
deleted file mode 100644
index c63268116b..0000000000
--- a/meta/recipes-extended/go-examples/go-examples.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program."
-SECTION = "examples"
-HOMEPAGE = "https://golang.org/"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-S = "${WORKDIR}"
-
-inherit go
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 930c57df95..222fc9d349 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -1,13 +1,19 @@
-require go-examples.inc
+DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program."
+SECTION = "examples"
+HOMEPAGE = "https://golang.org/"
 
-SRC_URI += " \
-  file://helloworld.go \
-"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-do_compile() {
-	go build helloworld.go
-}
+SRC_URI = "git://${GO_IMPORT}"
+SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
+
+GO_IMPORT = "github.com/golang/example"
+GO_INSTALL = "${GO_IMPORT}/hello"
+
+inherit go
 
-do_install() {
-	install -D -m 0755 ${S}/helloworld ${D}${bindir}/helloworld
+# This is just to make clear where this example is
+do_install_append() {
+    mv ${D}${bindir}/hello ${D}${bindir}/${BPN}
 }
-- 
2.14.1


