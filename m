Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SBDZP-0007uf-2A
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:06:55 +0100
Received: by wgbds1 with SMTP id ds1so1298670wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 15:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=7ZrM3oE/5VD89KSRNMGzlJ9MoF0SC1P9MNEsryeMzew=;
	b=l2Bu902gkcLt5s3B7k48eheCDekKIYNgEMm4NP/NhL4JiEd+DZpaMutzynBY+7Zmh6
	WcLowPdc/xw9fV39QyNpiyzOxaOt6dNM5TKknPWYe2Twj1NiUuRygNarLBkzyUZf9Y8Z
	YbUcMhQNhpuIS72IV8/fNEKOPuSnRnuoV4HKscQkh4elIP7Auqxk5olUCFVgzJAvaic2
	wKhIzr/3PcqAvpmTsFroIcWus+7iY8jn414W6z6mlAS9+Ycy7hlI31st2US+ob5CscIE
	F8zr/b+Aezbztsz7jJ1EZNC2HbjUP6xn6z0BYUkSobaZLDg/zpzwnXOi0ZpH99TWumRl
	WFcA==
MIME-Version: 1.0
Received: by 10.180.85.70 with SMTP id f6mr775442wiz.5.1332543478639;
	Fri, 23 Mar 2012 15:57:58 -0700 (PDT)
Received: from localhost.localdomain ([79.117.107.69])
	by mx.google.com with ESMTPS id gg2sm28926628wib.7.2012.03.23.15.57.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 15:57:58 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 00:57:51 +0200
Message-Id: <86eb5c670aaf39a2d9858065979cf7d5af80e6b0.1332543292.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <6d8cb56a00a2d0f140b6b569f8577f96c6113e14.1332543292.git.andrei@gherzan.ro>
References: <6d8cb56a00a2d0f140b6b569f8577f96c6113e14.1332543292.git.andrei@gherzan.ro>
In-Reply-To: <cover.1332543292.git.andrei@gherzan.ro>
References: <cover.1332543292.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlqWY+9cI3BrNY7CW8+e2x1w3Rl2OYCpmELFYiwMoHzsQBNZDb+ToBJr9+qZ5xZuYU2HTCC
Subject: [PATCH 2/2] tk: Integrate tk v8.5.11
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
X-List-Received-Date: Fri, 23 Mar 2012 23:06:55 -0000

Tk (along with Tcl) is needed in python for module _tkinter.

[YOCTO #1937]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/tcltk/tk_8.5.11.bb |   68 ++++++++++++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/tcltk/tk_8.5.11.bb

diff --git a/meta/recipes-devtools/tcltk/tk_8.5.11.bb b/meta/recipes-devtools/tcltk/tk_8.5.11.bb
new file mode 100644
index 0000000..9be31f0
--- /dev/null
+++ b/meta/recipes-devtools/tcltk/tk_8.5.11.bb
@@ -0,0 +1,68 @@
+DESCRIPTION = "Tk graphical toolkit for the Tcl scripting language."
+LICENSE = "BSD-3-Clause"
+SECTION = "devel/tcltk"
+HOMEPAGE = "http://tcl.sourceforge.net"
+DEPENDS = "tcl xproto"
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



