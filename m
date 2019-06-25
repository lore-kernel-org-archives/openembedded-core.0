Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8267BFB3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 14:52:08 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id p13so18216292wru.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Pg1oJ0HaAMAEHeXlIwn3eLHNtziLTqF0llPIGvZ6Q+Q=;
	b=yKZqus7pivNjIi9f05I8a7vBh8fwmnnP7RIJ1lDHYI7rFWpfiYeaHXt1dDBoZL9Et2
	foX++fr26shocdgSvfDM3pYGg8B3+PyIWM4sCIqaTMvmw12HzrvYfdg6omZh0EjkxrMC
	YHbIMJQBrgXmxFHlOC9kqMZkkux+HM9EqJ9Ym6VcX3zXiTPvQ4+f3ms1ccTAFBmjcjDU
	d6uYIonFjpAeExbsQ7M3wLnSolR1aZIN0TuRf/29/VMz3XhUgvG6JstJpKtWvAc8LS0S
	QSm+TUg/VSnpfMaumJQKyNYVsqy/MxCSuvB7t9jGp28DZC+s1TZ5Tq4Nahidn0odeXOY
	+hKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Pg1oJ0HaAMAEHeXlIwn3eLHNtziLTqF0llPIGvZ6Q+Q=;
	b=L4ADYtWyiaSMY2oH2T3uMiAHHwe3+oYUaOkpXUNVxQ4G5SdGkst46eHejbohUpVdB9
	UOUz5xZ7Dah1C9R02M1wCe00uOMuUlkAf1Q4qqjdiVkGH8v/5bRlhFvFhw7uy/s7uB0/
	W0+tfsadO/RXn8Nk0jbRG2A/vbbnLusyeZ/Yjmgwp0X3b/kE03J1WJoC7igUO28Qyc4G
	ljFog0vTVtoXp/DNzJDWbcrkRedmD/kyi7okuBAgmeBHIzqcLfTb/DAw+lJciW/dlZU4
	V2ByR5mU1jXvhdxf1Vmn3+iZyoxywI36BmW7sw47lZF4rlPgxryNFE7WZLPr1dUqowpw
	9lKA==
X-Gm-Message-State: APjAAAWC6cdIJ7vYc4CwDs3Onwjs5tvFjoqXE/MigqMNfYofS3ZNK/2R
	D9AdLY2hqaBYoCN5rMogaFzK+JbV3y8=
X-Google-Smtp-Source: APXvYqxU8NfrZTF2d9HAjX8+NWVvISj187EUrsCf8Aq7NKswAvg3s3+g4nTNCDpmAB+c3Cok4kmFLw==
X-Received: by 2002:a5d:5448:: with SMTP id w8mr81932541wrv.180.1561474328978; 
	Tue, 25 Jun 2019 07:52:08 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p140sm2263877wme.31.2019.06.25.07.52.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 07:52:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jun 2019 15:52:02 +0100
Message-Id: <20190625145203.24342-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH v2 1/2] fortran-helloworld: add a very dumb Fortran Hello World for testing
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
X-List-Received-Date: Tue, 25 Jun 2019 14:52:09 -0000

For future runtime testing something more complex is preferred but this is
sufficient to exercise the cross compiler.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-selftest/recipes-test/fortran/files/hello.f95 |  5 +++++
 .../recipes-test/fortran/fortran-helloworld.bb     | 25 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
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
index 00000000000..97313d7e249
--- /dev/null
+++ b/meta-selftest/recipes-test/fortran/fortran-helloworld.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Fortran Hello World"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+DEPENDS = "libgfortran"
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


