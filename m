Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8D708600E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 04:24:13 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 204so10902652pge.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Feb 2017 20:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CNiUqehttrfkh+gniFWDZwSI0xKXZPzWq9Jz+KALvfk=;
	b=nZcVJ7+HvOS3c1bps7td2La4rt9ToimkpBOwtcY2oTjqmVNtMqPxOx8cH1h6kMVWlX
	2uPlvVl6W+9V/c3QpMbFARFRYIPscBMlTxgqn3HHkas0E/QV3Z2RXPWsWF99HnGMoz8S
	WSeKFYtDvjse5mUDVWuhQZy0kV/1TF8EW2U1o6qFwbOeD3TflGbmBgiPInwBjayctYqI
	4K6OLGH2I1ReJtn0OvZRyB5fN0eA/YyGRI3Cv59g8mr7kj0KTX90EBtj3l48ofK92OXJ
	roKd2jDi5e3O8CMDR5y5KsZsd5S3EDVL6eM7dHcuo8BXxM4hZN9EDbcDeOKhjq5/hbHw
	bJoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CNiUqehttrfkh+gniFWDZwSI0xKXZPzWq9Jz+KALvfk=;
	b=T+gpmuja6ICGWJjSrsQmO2+DUBI0zjDAnirMYpoFhrCMgjoaaxdZa/Nzh8dHN8QQ7R
	PNnY6BlSi7zJAncL7fE4WNxZvRggzNaLOClEFMoJvPqUI/3WmzyDZCts4LU1iQS6Rfrg
	jW9BHhLrWb9pQrJGEwDNS8+rBCIP1e8REQyul+U/uVENHr8cZbZSczCLugDKb2BAekcy
	bWMcUiVRp6KQcF7CaL05tm+OwYAZ9dWiZxBwaqjrxqEmMN0cim4yq5eMUbH044jmAJhj
	7a35tx2xEBYBRxxa7jdxqTXI8NC4ARyBWtAOxqAaTRFG21b/MpswHgnmG+Ng6yVOtPYk
	WJWA==
X-Gm-Message-State: AIkVDXK+xVF6PU1fDVYNqxNUCaYZsOxBOEwMUvVuJRQiBDLs48Ta5uNOXHOPYaTlvoahZw==
X-Received: by 10.98.16.201 with SMTP id 70mr17381531pfq.25.1486441454394;
	Mon, 06 Feb 2017 20:24:14 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm6397067pfl.17.2017.02.06.20.24.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 20:24:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 20:24:04 -0800
Message-Id: <20170207042405.22707-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <20170207042405.22707-1-raj.khem@gmail.com>
References: <20170207042405.22707-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] go-examples: Add an example, helloworld written in go
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
X-List-Received-Date: Tue, 07 Feb 2017 04:24:14 -0000
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


