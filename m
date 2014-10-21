Return-Path: <mike.holmes@linaro.org>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6D49060097
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 21:02:59 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id j107so1601961qga.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 14:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ACm+dS1It0bdQiu2vH6Y/enoHtHo5O8ADajlTcQ5YGU=;
	b=TTUIctPCqww9ESH2VX5HWmV621fdJoP9ZTlcjSx2bDmfQpNTcl/UGaKfhK4akld7k8
	C/e9LUlki6NDR9O1RxUqr1GmzUJEHeKna/VeW+f5NmU4ecxlvNWPHxeOOro1qmOe/YLa
	O36m5UHyB9XI67qQ6kxpUqU1TSvRnE0ru5lf2fYmd47GvpephjDvhaY+yxRaiAH7+fdn
	ufIothAosAIIi3I2ludOYWvFhtoo5Kc4DqN07aJGubYDEXk51/au9s3PzImz1Hr9IN7H
	0GZw6X01XlzxaTnTyo1yF9gPVJi8Kx4tVEN3fbD5Ej/TIximbdtFRKFLxS0x2pmJS6id
	kygw==
X-Gm-Message-State: ALoCoQmic8CfUY5RTV9612ZsH3iC8yKAo9xZTOtLa8eNGq0eJiN07hX4ONp/vbfV6pN1uD2q3Uls
X-Received: by 10.229.102.72 with SMTP id f8mr49801265qco.9.1413925380153;
	Tue, 21 Oct 2014 14:03:00 -0700 (PDT)
Received: from fedora1.holmesfamily.ws ([98.221.136.245])
	by mx.google.com with ESMTPSA id
	m36sm11679500qgd.28.2014.10.21.14.02.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 14:02:59 -0700 (PDT)
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Oct 2014 17:02:36 -0400
Message-Id: <1413925357-53983-1-git-send-email-mike.holmes@linaro.org>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] add CUnit test suite
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
X-List-Received-Date: Tue, 21 Oct 2014 21:03:02 -0000

Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
---
 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb

diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
new file mode 100644
index 0000000..0e9b2ff
--- /dev/null
+++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "CUnit is a C framework for unit testing. Test output supports comandline and GUI reults reporting"
+HOMEPAGE = "http://cunit.sourceforge.net"
+LICENSE = "LGPL-2"
+SECTION = "libs"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
+
+S = "${WORKDIR}/CUnit-${PV}"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2"
+SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
+SRC_URI[sha256sum] = "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
+
+inherit autotools-brokensep
+
+EXTRA_OECONF = "--srcdir=`pwd` --prefix=$INSTALL_HOME --enable-debug --enable-memtrace --enable-automated --enable-basic --enable-console"
+
+FILES_${PN}-doc += "doc"
+FILES_${PN}-dev += "${prefix}/share"
-- 
1.9.1


