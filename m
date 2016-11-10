Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id C5D86719C8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 00:39:42 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y68so1941153pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 16:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gcEPOn4TkgbsrlSFg7ZCnOWnnJQIiLWVuhiO0IPYK10=;
	b=iUCsh2Jfp9ph621/lCcVHTjgPRyeP7RHk0ozP9aXe9gtNnwDyizAvoK/idVYy8U+hv
	A6l/iMlJGI1WGs12eSFbxZsW4fDCUEb/8FWvppR1RTCkRgQ/NtW+ST+N6OT3D4l91qUB
	5uBlYV4BN4lM8xAZdP5BVM/u0GwFQwDnvu1NnrrmkjHvoS+dH4l9YSNbipDvij7OIHy2
	38GFAYtF7ejBLAn9QBKGBaRkXmGKzQUmS/xaFhmH8C8adV3MgCsttKMN3NgUhI5oQk4p
	rM/WiERUTvN095P1XY9kb2hW07udZg+m1f+MTXdA0mKMtjILurNXcElSGIArU7qEA95e
	wn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gcEPOn4TkgbsrlSFg7ZCnOWnnJQIiLWVuhiO0IPYK10=;
	b=GbVYX6/v011tK0JKg6t2c+73M01rXEfpXkrHQc7Z7xsXM3NCQsDK8QQZoDaLImT1Is
	fkv2mxVZa1MGDCqdEYqUNbfOeVdDL9HPa3Imk5wEYb4d8S780Cf3Tyt0v+ddZ5Iv43OY
	0PFzYb3HTi0DLf90RbLevu4lZ0GhJBh6tg7orq1KlFUAZZzYIPlLwt8ytayHv0piJ4Xw
	dKIkr2baEc9OPdWLRuPeoxO2kJiinkxe0cml8moAchREMtLfkD7IIcYP1OsPt5i1fGei
	FGImWBkuxDvRXsOUuQFoN4hVk648AMSfOFkGkTjuRy8BhaU27XonCBncpAlzK1AWOBBk
	2q1A==
X-Gm-Message-State: ABUngvcDUZh1D621TwnvrHaCKg4MryEE7zQrjJ5UrNxnbgrXXr8FAEhE6OCRIpBnBd66yA==
X-Received: by 10.99.114.73 with SMTP id c9mr19292120pgn.44.1478738383742;
	Wed, 09 Nov 2016 16:39:43 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ix3sm1959306pac.17.2016.11.09.16.39.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 16:39:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2016 16:39:35 -0800
Message-Id: <20161110003935.1858-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161110003935.1858-1-raj.khem@gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] go-examples: Add an example, helloworld written in go
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
X-List-Received-Date: Thu, 10 Nov 2016 00:39:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should serve as temlate for writing go recipes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/go-examples/files/helloworld.go  | 10 ++++++++++
 meta/recipes-extended/go-examples/go-examples.inc      | 10 ++++++++++
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 15 +++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/go-examples/files/helloworld.go
 create mode 100644 meta/recipes-extended/go-examples/go-examples.inc
 create mode 100644 meta/recipes-extended/go-examples/go-helloworld_0.1.bb

diff --git a/meta/recipes-extended/go-examples/files/helloworld.go b/meta/recipes-extended/go-examples/files/helloworld.go
new file mode 100644
index 0000000..0253c40
--- /dev/null
+++ b/meta/recipes-extended/go-examples/files/helloworld.go
@@ -0,0 +1,10 @@
+// You can edit this code!
+// Click here and start typing.
+// taken from https://golang.org/
+package main
+
+import "fmt"
+
+func main() {
+	fmt.Println("Hello, 世界")
+}
diff --git a/meta/recipes-extended/go-examples/go-examples.inc b/meta/recipes-extended/go-examples/go-examples.inc
new file mode 100644
index 0000000..c632681
--- /dev/null
+++ b/meta/recipes-extended/go-examples/go-examples.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "This is a simple example recipe that cross-compiles a Go program."
+SECTION = "examples"
+HOMEPAGE = "https://golang.org/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+
+S = "${WORKDIR}"
+
+inherit go
diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
new file mode 100644
index 0000000..af9d3b7
--- /dev/null
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -0,0 +1,15 @@
+require go-examples.inc
+
+
+SRC_URI += " \
+  file://helloworld.go \
+"
+
+do_compile() {
+  go build helloworld.go
+}
+
+do_install() {
+  install -d "${D}/${bindir}"
+  install -m 0755 "${S}/helloworld" "${D}/${bindir}"
+}
-- 
2.10.2


