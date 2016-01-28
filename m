Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id C2625771A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2016 02:18:03 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id cy9so14538839pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 18:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=r9X36SlLD2WygriYC7x7KwRH9Ug0exCdRazQvomlsEQ=;
	b=BzLTI9PVE0y9I3EcQdZwIy4lzYU43WgPtqO9gcO72DLBNkeTkM0Qyaa9+KHuCLBskD
	3hiluJN32MEe53t8hjwVgqElgjOxcYrZfFU5hEZBMEYgp31YfWIt5xYIx5a75/59BRXR
	h7UPL7qD/Yuqx2HLZGD7eTJ3nbTq7/YRIWfCGew/JpBWa4CaLZDT77Mh8x+n8xWIpcZp
	oEvkP5f4dpB2C0Cve8g77vvrLS6hML70vYtoecCv8vEvOJsVvSZhWR2avzCBvUTP7yuu
	TMe5zLme1AMbMsef2HI2mF5wnMn561AHIULePZtmrzjSRWRcW4Hg3eCoiu4O8YBJQGCL
	TlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r9X36SlLD2WygriYC7x7KwRH9Ug0exCdRazQvomlsEQ=;
	b=OrGGuiZvZN1tIjxtxghk1NZeo4tJCN4Mq0a292qvYI0BbkgiHW8LpmSgwIFeP1UxVx
	Oqs5sRxj1kxkPMhjZ38P2I/6NjUnDvUolPEUfYlNib635qin+A4DM9zpI4he7A4VQPHl
	8YCJLOYNZzxhWouI5bLdIRpK2BK2HuVqDvY5Is4Yjm9WyM6TOU58Qh4RYBe8BrcEhZLs
	XwFyXkMMOzITB7m31bhIR2y93VicizrBstlnWD8TA6M1B94VYMdrcnj0ez5TwBZU1i1R
	2NvGteIlbCrW4uDxqNYfcoM/kw7lKI+rYeWKYYmfgACcAJTlmjBCziORuFMQ+CSVGfgu
	xLGQ==
X-Gm-Message-State: AG10YOQ5ltNNDmjTIZ3I9CPByFKl5V8Ia+81fg+qsfD83qUNxNnWtu665AWE1diAwmkbEg==
X-Received: by 10.66.158.37 with SMTP id wr5mr869646pab.48.1453947483980;
	Wed, 27 Jan 2016 18:18:03 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	x81sm11844509pfa.72.2016.01.27.18.18.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Jan 2016 18:18:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jan 2016 18:17:58 -0800
Message-Id: <1453947479-9270-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][master, jethro, fido] 1/2] tzcode: update to 2016a
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
X-List-Received-Date: Thu, 28 Jan 2016 02:18:03 -0000

From: Armin Kuster <akuster@mvista.com>

Change LIC_CHKSUM_FILES to License. Some files are BSD clause 3

Changes affecting build procedure

An installer can now combine leap seconds with use of the backzone file,
e.g., with 'make PACKRATDATA=backzone REDO=posix_right zones'.
The old 'make posix_packrat' rule is now marked as obsolescent.
(Thanks to Ian Abbott for an initial implementation.)

Changes affecting documentation and commentary

A new file LICENSE makes it easier to see that the code and data
are mostly public-domain.  (Thanks to James Knight.) The three
non-public-domain files now use the current (3-clause) BSD license
instead of older versions of that license.

tz-link.htm mentions the BDE library (thanks to Andrew Paprocki),
CCTZ (thanks to Tim Parenti), TimeJones.com, and has a new section
on editing tz source files (with a mention of Sublime zoneinfo,
thanks to Gilmore Davidson).

The Theory and asia files now mention the 2015 book "The Global
Transformation of Time, 1870-1950", and cite a couple of reviews.

The America/Chicago entry now documents the informal use of US
central time in Fort Pierre, South Dakota.  (Thanks to Rick
McDermid, Matt Johnson, and Steve Jones.)

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-extended/tzcode/tzcode-native_2015g.bb | 25 ----------------------
 .../recipes-extended/tzcode/tzcode-native_2016a.bb | 25 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/tzcode-native_2015g.bb
 create mode 100644 meta/recipes-extended/tzcode/tzcode-native_2016a.bb

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb b/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
deleted file mode 100644
index 34e338e..0000000
--- a/meta/recipes-extended/tzcode/tzcode-native_2015g.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# note that we allow for us to use data later than our code version
-#
-SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
-LICENSE = "PD & BSD"
-
-LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=d0ff93a73dd5bc3c6e724bb4343760f6"
-
-SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://ftp.iana.org/tz/releases/tzdata2015g.tar.gz;name=tzdata"
-
-SRC_URI[tzcode.md5sum] = "a2c47d908a6426f530efb1393cf1cd06"
-SRC_URI[tzcode.sha256sum] = "18e402ef24bfad2ded38643c9a7a9a580f940a729cb47d983052fc28ff0c7ec4"
-SRC_URI[tzdata.md5sum] = "8d46e8b225b9a04c75f5c39636435ad6"
-SRC_URI[tzdata.sha256sum] = "b923cdbf078491696b17bc8d069c74bce73fabc5774629da2f410c9b31576161"
-
-S = "${WORKDIR}"
-
-inherit native
-
-do_install () {
-        install -d ${D}${bindir}/
-        install -m 755 zic ${D}${bindir}/
-        install -m 755 zdump ${D}${bindir}/
-        install -m 755 tzselect ${D}${bindir}/
-}
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2016a.bb b/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
new file mode 100644
index 0000000..76f97f0
--- /dev/null
+++ b/meta/recipes-extended/tzcode/tzcode-native_2016a.bb
@@ -0,0 +1,25 @@
+# note that we allow for us to use data later than our code version
+#
+SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
+LICENSE = "PD & BSD & BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=76ae2becfcb9a685041c6f166b44c2c2"
+
+SRC_URI =" ftp://ftp.iana.org/tz/releases/tzcode${PV}.tar.gz;name=tzcode \
+           ftp://ftp.iana.org/tz/releases/tzdata${PV}.tar.gz;name=tzdata"
+
+SRC_URI[tzcode.md5sum] = "f5e0299925631da7cf82d8ce1205111d"
+SRC_URI[tzcode.sha256sum] = "11ae66d59b844e8c6c81914c9dd73b666627bd7792855ba9de195eee4520c28d"
+SRC_URI[tzdata.md5sum] = "0d3123eb1b453ec0620822bd65be4c42"
+SRC_URI[tzdata.sha256sum] = "5efa6b324e64ef921ef700ac3273a51895f672684a30e342f68e47871c6a8cd1"
+
+S = "${WORKDIR}"
+
+inherit native
+
+do_install () {
+        install -d ${D}${bindir}/
+        install -m 755 zic ${D}${bindir}/
+        install -m 755 zdump ${D}${bindir}/
+        install -m 755 tzselect ${D}${bindir}/
+}
-- 
2.3.5


