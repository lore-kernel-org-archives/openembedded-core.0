Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBbgv-0007W6-2l
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Mar 2012 01:52:17 +0100
Received: by wera1 with SMTP id a1so3454911wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 17:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=btqwKlLvU5Pf1yJzepYxI6F5hlMfA6DX3PecFrodRZ0=;
	b=PIyNmmKLmbi/coeO4BZMV7dFIVQJznCPIeb4QvDH2yJ3s1YZ395tjEqABOJksMtWVZ
	HYx/6tBuLROhPZOj2E56bDBacmcRZMmQhll+OFJumsvP8QrpP8VYZD2o5Z+lWizeHv0n
	NSgGaWuNyp1q1GrghUg4HETpOi9QypQatjLiHk6S+p3HgcpB/w6oW+sdJ7mauNQXOhSh
	OmxBSiBs4U4x1FnHvPqJHxc5Ak3ZPmZnRAL/uI9AFSzKldddsXi5zhhwLS2DspsnZWEb
	qxGIBAQVw28B7I6jZ+Tfd11TDpDFjCClLUPLr5B74gTLMM30hZ413c8C9sM+ucAQRynj
	raHA==
MIME-Version: 1.0
Received: by 10.180.79.135 with SMTP id j7mr7770953wix.19.1332636199411;
	Sat, 24 Mar 2012 17:43:19 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id l5sm27303664wia.11.2012.03.24.17.43.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Mar 2012 17:43:19 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 02:43:09 +0200
Message-Id: <9ef1e1700b53a5da7afb6aad408c0efb9640272e.1332635505.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d6bc9ce28547772a079773078e6440568f1dd26c.1332635505.git.andrei@gherzan.ro>
References: <d6bc9ce28547772a079773078e6440568f1dd26c.1332635505.git.andrei@gherzan.ro>
In-Reply-To: <cover.1332635505.git.andrei@gherzan.ro>
References: <cover.1332635505.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmlcGIDMOVK66jEcdqma3ZORxgGqRWHuudMJPnmcrZHwvhjvkbrgP4XjvmBzZQzRsLjy0Vc
Subject: [PATCH 2/3] tk: Integrate tk v8.5.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Mar 2012 00:52:17 -0000

Tk (along with Tcl) is needed in python for module _tkinter.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/tcltk/tk_8.5.11.bb |   68 ++++++++++++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tk_8.5.11.bb

diff --git a/meta/recipes-devtools/tcltk/tk_8.5.11.bb b/meta/recipes-devtools/tcltk/tk_8.5.11.bb
new file mode 100644
index 0000000..0de83d0
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk_8.5.11.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "Tk graphical toolkit for the Tcl scripting language."
+LICENSE = "BSD-3-Clause"
+SECTION = "devel/tcltk"
+HOMEPAGE = "http://tcl.sourceforge.net"
+DEPENDS = "tcl virtual/libx11"
+
+LIC_FILES_CHKSUM = "file://../license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    file://../compat/license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    file://../library/license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    file://../macosx/license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    file://../tests/license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    file://../win/license.terms;md5=33c2a4845e058f33c0f52f375625f650 \
+                    "
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tk${PV}-src.tar.gz"
+SRC_URI[md5sum] = "b61b72f0aad230091b100746f078b8f1"
+SRC_URI[sha256sum] = "d35810b33a0931656f1d128e7e0776cc0c4d8b9c72af322cab5a7ee30485eb70"
+
+S = "${WORKDIR}/tk${PV}/unix"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-threads \
+                --disable-rpath \
+                --with-tcl=${STAGING_BINDIR_CROSS} \
+                "
+
+do_configure() {
+	gnu-configize
+	oe_runconf
+}
+
+do_install() {
+	autotools_do_install
+	oe_libinstall -so libtk8.5 ${STAGING_LIBDIR}
+	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tkConfig.sh
+	sed -i "s,-L${libdir},," tkConfig.sh
+	install -d ${STAGING_BINDIR_CROSS}/
+	install -m 0755 tkConfig.sh ${STAGING_BINDIR_CROSS}
+	cd ..
+	for dir in compat generic unix
+	do
+		install -d ${STAGING_INCDIR}/tk${PV}/$dir
+		install -m 0644 $dir/*.h ${STAGING_INCDIR}/tk${PV}/$dir/
+	done
+}
+
+PACKAGES =+ "${PN}-demos \
+	     ${PN}-lib \
+	     "
+FILES_${PN}-lib   = "${libdir}/libtk8.5.so* \
+                     "
+FILES_${PN}-demos = "${libdir}/tk8.5/demos/* \
+                     "
+FILES_${PN}      += "${libdir}/tk8.5/ttk/* \
+		     ${libdir}/tk8.5/images/* \
+		     ${libdir}/tk8.5/msgs/* \
+		     ${libdir}/tk8.5/*.tcl \
+		     ${libdir}/tk8.5/tclIndex \
+		     "
+FILES_${PN}-dev += "${libdir}/tkConfig.sh \
+		    ${libdir}/tk8.5/tkAppInit.c \
+		    "
+
+RDEPENDS_${PN} += "tk-lib"
+
-- 
1.7.5.4



