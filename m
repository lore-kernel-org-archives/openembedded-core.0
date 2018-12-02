Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id EA1126C5B4
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Dec 2018 16:58:44 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z18so3413838wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Dec 2018 08:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hbHNgJkwnD8+s57VWgs5Vp5aBhGBcU6IVzkOCLuswLc=;
	b=Q4Y6uNLjGtc3flWsBZ5Ppf/pxF9D2auqcrSdQWTn2QGj8TPW/XDX6+Mg5bN/fSyt4X
	XXrn0hbAHEHUWWq0Rt6AYl4cbAtKCtoqQPN2MXuF5SG16oBuccLV1juXBhMdQ64l7u4w
	CT+r/g2XtymnsdIM5y8W+PmxZ2B8lkeYcIrkIKUKpxMyVTV9UgGi1TfSLGvr5pNJ9gPy
	SowkmiI8a765YfRgoCooMxYwVycl50gQrQ/IlnN3vEGnd+O8wVaavaE8M1qAtgX9qamr
	TzfW4Yayw8sQuE6L7EvhWV6K2Gav/EtlHpX6GMBWFGkLLqyeegEEgrgG8pohJJVWAT9i
	fEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hbHNgJkwnD8+s57VWgs5Vp5aBhGBcU6IVzkOCLuswLc=;
	b=I5C8uIsn27LUscYmharcYDNDy3Igjj6lOH9AHfu2vLWoei/5u4/1kBua1WFWf7N8pS
	JZFKzYsSoGZ1MWXwLtaX784z7BRwL631nac/vkI31yI1umqMVJeak0M5wM1Tp4wQJTQs
	rKUJQiO6BZRZ9iJ0Lt5jDMRXH5pWdOI1i3c0WMSvzJ1M7ccW3czAe07GsVtWjbsfqEka
	u642OQPKXzlzr0HLOWLXch2bljUHXcShO+cHJ3bKqMk6r0c0+sVD3vSJn6u5ZVdxch0O
	PijhBCMgc7wQ6C5a0fw440AEH63lcRnf++cKAw8oSgVDJ/by0snUEJ7brP6LcShx+UCj
	CUpg==
X-Gm-Message-State: AA+aEWZFJyxmjYbSMfzg/cbkvKeAMs5ZoBE8l5mJD4OfwSw814G4j3WF
	BHRxWajeeaX28Qm5dKHesxnOy9pp
X-Google-Smtp-Source: AFSGD/VlKGdMl7DI1KD1A5c/I163/7KH2U5HrMIuGubAJn3+lDnWggsAGP4hluD8RMHgaZ/9XrMZ6Q==
X-Received: by 2002:a1c:174f:: with SMTP id 76mr5174211wmx.116.1543769925168; 
	Sun, 02 Dec 2018 08:58:45 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	k135sm6872346wmd.42.2018.12.02.08.58.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 02 Dec 2018 08:58:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Dec 2018 17:58:32 +0100
Message-Id: <c6e0886760873100bb51adbf2395ee5198db9f9d.1543769657.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
In-Reply-To: <cover.1543769657.git.alex.kanavin@gmail.com>
References: <cover.1543769657.git.alex.kanavin@gmail.com>
Subject: [PATCH 4/4] recipes: adjust to the new perl recipe
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
X-List-Received-Date: Sun, 02 Dec 2018 16:58:45 -0000

This mostly means setting native RDEPENDS to an empty string (as there is no
longer a separate perl-native recipe), and removing the use of nativeperl binary
as that is no longer provided either.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../docbook-xml/docbook-xsl-stylesheets_1.79.1.bb               | 1 +
 meta/recipes-devtools/intltool/intltool_0.51.0.bb               | 2 +-
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb                       | 1 +
 meta/recipes-extended/groff/groff_1.22.3.bb                     | 1 +
 meta/recipes-extended/texinfo/texinfo_6.5.bb                    | 1 +
 5 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index 07d32ce9795..f4ff4241d9c 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -59,5 +59,6 @@ do_install_append_class-native () {
 }
 
 RDEPENDS_${PN} += "perl"
+RDEPENDS_${PN}_class-native = ""
 FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
 FILES_${PN}-doc = "${datadir}/doc/*"
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index ecff2faf253..f2f8bb511ce 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -21,7 +21,7 @@ DEPENDS_class-native = "libxml-parser-perl-native gettext-native"
 inherit autotools pkgconfig perlnative
 
 export PERL = "${bindir}/env perl"
-PERL_class-native = "/usr/bin/env nativeperl"
+PERL_class-native = "/usr/bin/env perl"
 PERL_class-nativesdk = "/usr/bin/env perl"
 
 # gettext is assumed to exist on the host
diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
index ef5d631917c..a0883c59525 100644
--- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
@@ -141,6 +141,7 @@ FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 RPROVIDES_${PN} += "rpm-build"
 
 RDEPENDS_${PN} = "bash perl python3-core"
+RDEPENDS_${PN}_class-native = ""
 
 PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
 
diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index ba90cadd88c..35d737c09b4 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "3a48a9d6c97750bfbd535feeb5be0111db6406ddb7bb79fc680809cda6
 DEPENDS = "groff-native"
 DEPENDS_class-native = ""
 RDEPENDS_${PN} += "perl sed"
+RDEPENDS_${PN}_class-native = ""
 
 inherit autotools texinfo multilib_script
 
diff --git a/meta/recipes-extended/texinfo/texinfo_6.5.bb b/meta/recipes-extended/texinfo/texinfo_6.5.bb
index f966457f881..866c20fd9c3 100644
--- a/meta/recipes-extended/texinfo/texinfo_6.5.bb
+++ b/meta/recipes-extended/texinfo/texinfo_6.5.bb
@@ -77,6 +77,7 @@ FILES_info-doc = "${infodir}/info.info* ${infodir}/dir ${infodir}/info-*.info* \
 
 FILES_${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi ${bindir}/pod2texi ${datadir}/texinfo"
 RDEPENDS_${PN} = "perl"
+RDEPENDS_${PN}_class-native = ""
 FILES_${PN}-doc = "${infodir}/texinfo* \
                    ${datadir}/${tex_texinfo} \
                    ${mandir}/man1 ${mandir}/man5"
-- 
2.17.1


