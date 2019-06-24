Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 12F2C7D391
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 11:13:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n9so13499815wru.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=gpaGAUP6ZbvEHafmRoO8pgWn/bJnCsCxEZrGL3rlR3k=;
	b=SOXNgxlRgNMnTtbmFII9BJ6cQF0iP8NRdnV/4mRNNLnHPghaqCACpIE6quTmtgY0Qc
	7rMxxqS9qw2pt8z9ZxjbaV0iKEMURE4+OLPImLwjcLjRtTewSfUMRsGFQW3WM4sqirt7
	ROdNiQHzroyG+9G+6avE4o7+W5w0oQA7z3UEA9fRu0Qf0LfM8xbIKclJBMcCXA8s02tH
	wSJ2OzTb1G+1BvAq8XBgsoUEu6YLfzG+MWAzJ5Js4OS82h7bOCKvkGDrIo17vHyTtV5C
	JIrHEMSNUFccbwQ5aSntplDZJRw6ORUL3qCaxFAD4UdXduZ+NWvc8O+86ZvH5OGXgaku
	6L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=gpaGAUP6ZbvEHafmRoO8pgWn/bJnCsCxEZrGL3rlR3k=;
	b=NAZtrZv6+hmun8yEFQpHDvX/7sYcECRjEc5wHzdw9KUGz5SrTvrcwY70RbRRCoZq1p
	PG3mRexDgUmllXCA+OnhGv3dhFl2HX3FDh7ke84MfeTEFQ9ghDVBAjdHZq3Y2pGbd27V
	xFk5V5GKWyXl/JYFyIya+AhGytn2CaIO4beBrrGb+dvvhxjAcJvowqprEFCZPYRElyMo
	0mZpf2k3MiZRJGOgmwl+b1bBN52gg9UFq+UOnlIoZxWTZxNuC7YAZCxNQDBnyHKFlcXD
	ThXRZ01LIWKuyvzWhqQlxP8yifhm6tHmnbVFp7FDtVL1iVTQfkIx5lKf0MO5gfaX2QTp
	avTQ==
X-Gm-Message-State: APjAAAXArsvIF3l2wydkqTbaOG0W3tCW9ykzPXVhF5rmbQ7RpuEDK4aN
	QAj1+jkYpTrHftM7PMjookg7a0FA2vU=
X-Google-Smtp-Source: APXvYqzKK8pqWRLsnFG6LE2FeosDqH54ciK/bc9mf0IQjuSgX6WeGWLCs1166amJbI7ihvT6G+QR5g==
X-Received: by 2002:adf:9d81:: with SMTP id p1mr32978915wre.294.1561374807367; 
	Mon, 24 Jun 2019 04:13:27 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r2sm9748806wme.30.2019.06.24.04.13.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jun 2019 04:13:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2019 12:13:23 +0100
Message-Id: <20190624111324.8921-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] fortran-helloworld: add a very dumb Fortran Hello World for testing
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
X-List-Received-Date: Mon, 24 Jun 2019 11:13:27 -0000

For future runtime testing something more complex is preferred but this is
sufficient to exercise the cross compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/recipes-test/fortran/files/hello.f95 |  5 +++++
 .../recipes-test/fortran/fortran-helloworld.bb     | 23 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta-selftest/recipes-test/fortran/files/hello.f95
 create mode 100644 meta-selftest/recipes-test/fortran/fortran-helloworld.bb

diff --git a/meta-selftest/recipes-test/fortran/files/hello.f95 b/meta-selftest/recipes-test/fortran/files/hello.f95
new file mode 100644
index 00000000000..a0745fc64d7
--- /dev/null
+++ b/meta-selftest/recipes-test/fortran/files/hello.f95
@@ -0,0 +1,5 @@
+program helloworld
+
+      print * , "Hello World!"
+
+end program helloworld
diff --git a/meta-selftest/recipes-test/fortran/fortran-helloworld.bb b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
new file mode 100644
index 00000000000..3f5298aeee2
--- /dev/null
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Fortran Hello World"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = "file://hello.f95"
+
+# These set flags that Fortran doesn't support
+SECURITY_CFLAGS = ""
+SECURITY_LDFLAGS = ""
+
+do_compile() {
+	${HOST_PREFIX}gfortran ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS} ${WORKDIR}/hello.f95 -o ${B}/fortran-hello
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	install ${B}/fortran-hello ${D}${bindir}
+}
+
+python () {
+    if not d.getVar("FORTRAN"):
+        raise bb.parse.SkipRecipe("Fortran isn't enabled")
+}
\ No newline at end of file
-- 
2.11.0


