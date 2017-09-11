Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA827823C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:31 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id i50so18710324qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=ViSz0j4Z8lh3Yt/A3/lXn35k6zilknwugqoyKGfS5Gw=;
	b=rTXF7z4gShtnDYNbkPiWGCFVeH7LJ7HW1ILLiniPBC571B0zx5tjumA7oC4Y3+87yR
	fumosiEPruyknDDjd4OX12EaEuwfBsL0+p+CyMoVHQREP7DVC3LWSmR0+D6iXe5sEeZq
	Q6KK1yfUExvRqMQf5Yy3K1uDGRu5jo+7j39/DzCN2Z+zP8e20pV6cRD3OtZ3x/g0eQ9/
	/BY5Vx3q53LjpDVgtASJFkAuQFfKlPYH6QjgrSR01YHv1oZ8weRUzEp486HJcCxEryLs
	cxzWMD2JxJMX40/70rPuUeBrrnMv7n0vg7gdXZLz9INQeOPIIW2RTe5nojBGusJZHjwE
	LCXQ==
X-Gm-Message-State: AHPjjUifzylCzG/PPlRdWegvVnGxChnElMWtY4oBhEcSa6/gT5OHKYdx
	TB3YKm5R+Ev0/04x
X-Google-Smtp-Source: AOwi7QB+bEm0N6cI2Pn8ha+puaJY1wD+N6UM8S7yDGRTezmEO5Hgh8ZRXqBbnLYb9PpH49/LpyVIHQ==
X-Received: by 10.237.37.103 with SMTP id w36mr7504881qtc.325.1505134052011;
	Mon, 11 Sep 2017 05:47:32 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id o5sm6227427qtc.16.2017.09.11.05.47.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:31 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:26 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:46 -0300
Message-Id: <20170911124558.2863-15-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 14/26] go-helloworld: Use the Golang examples repository
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This updates the recipe to use the Golang examples repository so it
makes use of the unpack as well as standard tasks showing how easy it
can be.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
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


