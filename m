Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0661573138
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 18:13:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id s67so7328463pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2017 10:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version:in-reply-to
	:references:content-transfer-encoding;
	bh=CNiUqehttrfkh+gniFWDZwSI0xKXZPzWq9Jz+KALvfk=;
	b=X8qPbDSfctmQfW0VpTSwhdJvb54pdjxw574CxMHMQz8A1YAQxVVoD+cU/Co17locaV
	3mpdmB4gnkwJPZhKNxBpbak1pDoMCQXro6o3u7q1pj6L4IMPu/9P1dEETFwgymZXVbuB
	yn6gpnVYnX/xCNrJsFZO76SmJo8pEGWC/6DdQ4TKdFWwj8MJqVarhOZhca0CS06za8FJ
	uqyqw4N07MuC+9+DMdJlMGr0P3guUpjm9rIUx8HT/mW9qWhXXhWeaymqN7/tXVxjPjqw
	QrC1BwAayL3d6A2y/vCMB4GCc+68qlOvL/hfxDR/rKDjFbS8/5pbevG7m6/2H9l4H4oT
	TqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=CNiUqehttrfkh+gniFWDZwSI0xKXZPzWq9Jz+KALvfk=;
	b=cCXPnbJxLBoqKmOKMqeDeTuwXx2xB/svceiXjBXL7ZeL1PLFSzT7ALK1VjuMjmBf0A
	ii/GKf4t9ALbmM1JTw8tAe2XPGJEFu4TWbGHKJyCNhFtuoE11PXLDARZMk2ljtBorQeE
	T03ECZGtV0er8E2Gi12oz2/NPis7D2kQ+8YmI7Y1Ur1MaC8fnMTvuMRuBFhLlyR6zFSZ
	jpgnPUghu+g+RN02iX7+7bccUATfua9QLEOtto3d0BkT521iv0aSD+8SZ2xukhElwoGO
	C3A02qcn7orC5nxkMuhcz824C+CeLQhGkoXbGT3lTSXAK+tay2o7ZCmWuH9Wxlza0fuK
	UQNA==
X-Gm-Message-State: AMke39kTfkrbq8UIFoABG7VGnUSvsAhH88l/etGeHGrqrXALVd0sIQ8JzQR05YQVogrHmA==
X-Received: by 10.84.236.67 with SMTP id h3mr12734960pln.12.1488046407162;
	Sat, 25 Feb 2017 10:13:27 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y5sm21851692pgy.28.2017.02.25.10.13.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Feb 2017 10:13:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 25 Feb 2017 10:13:12 -0800
Message-Id: <6f389fa1e83f5fa48e0a26c01843f0028253d1f0.1488046239.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
In-Reply-To: <cover.1488046239.git.raj.khem@gmail.com>
References: <cover.1488046239.git.raj.khem@gmail.com>
Subject: [PATCH 2/4] go-examples: Add an example, helloworld written in go
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
X-List-Received-Date: Sat, 25 Feb 2017 18:13:26 -0000
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
index 0000000000..0253c40411
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
index 0000000000..c63268116b
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
index 0000000000..af9d3b7454
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
2.11.1


