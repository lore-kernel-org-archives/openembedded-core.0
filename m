Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D081F60722
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 14:37:51 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id q128so17206827wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tMOsI8XFkiPMT1Q5jGZHTgcP8iaxdlu+KyOxWhSlWV4=;
	b=E9YY+JKC7LRK4BsepA4PGB70y+5A9Hya5HwCwzFkrOvrujpfXQrJsEGxQOwysPVIF3
	dcPkffO6DxWQws9wZzQ4OEn14JSLLQaDAf79E+zJX96NI+cK4J/e2jROBkKo4z7OAZ1q
	bky7SBPY7emI94OXW0jBCrgn77czdup+1MG9ax/OusKl+ooDRB0TO/5pcIfG5WMJkxuV
	GjtndMySus6iYHzgfYUtG3xVH4FPqyQ0Hu8MxzbXTlTpMHYlJt3Ay7HtVqWinBw/2GfE
	PDomXpGQkz52k3L57B747ux0ds/2K8ePwUXQhtqIm6btfyDIMaLJSRfr/m/N/OB3xMSs
	mruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tMOsI8XFkiPMT1Q5jGZHTgcP8iaxdlu+KyOxWhSlWV4=;
	b=RUMEDXONu2u1k/Ajs6mKKmhtB3jurbhbhAQykvSjqw2NnHS1vdSr5+cmDDv+re12jw
	8V9BsY/zdyEBI4Qf5enJPRD03piLKHi8zihPi+rcbPPlwpfwaxlLCKc7lgaysRgbGI6f
	km/TKuGseLsYMjSWPHv8zOsyUHwJtg3TEdi4QAnseKzTZMU+qi6aPr8rAYDw762O8NKk
	JImZfPlV+573UFYWwheWgC8Q+BwV5+s8LWy9gDB6DqzqJJTiiMxEGy5LR1BiLLtf/oDn
	ktX/Nu6KmCwT33Gm7cSeboLkqzlzTePf2tHifh509PFpP08TBVqB6oYBLJcvGzk9tQGa
	CkFg==
X-Gm-Message-State: ALyK8tKZ9Y1lLNjwcwff7CP3UEBmOg9MO+fNaQuJeSHlgRI2FQSgB474ktDdYfk1fZh2xEYt
X-Received: by 10.28.103.6 with SMTP id b6mr5010134wmc.89.1468939071284;
	Tue, 19 Jul 2016 07:37:51 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	i80sm7244453wmf.11.2016.07.19.07.37.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 07:37:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2016 15:37:46 +0100
Message-Id: <1468939067-17286-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/2] intltool: merge .bb and .inc
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
X-List-Received-Date: Tue, 19 Jul 2016 14:37:52 -0000

There's no use in having these split, so merge them together for clarity.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/intltool/intltool.inc       | 30 -------------------
 meta/recipes-devtools/intltool/intltool_0.51.0.bb | 36 ++++++++++++++++++-----
 2 files changed, 29 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/intltool/intltool.inc

diff --git a/meta/recipes-devtools/intltool/intltool.inc b/meta/recipes-devtools/intltool/intltool.inc
deleted file mode 100644
index eb7ae00..0000000
--- a/meta/recipes-devtools/intltool/intltool.inc
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Utility scripts for internationalizing XML"
-SECTION = "devel"
-LICENSE = "GPLv2"
-
-URLV="${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
-SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
-
-UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
-
-S = "${WORKDIR}/intltool-${PV}"
-
-DEPENDS = "libxml-parser-perl-native"
-RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
-DEPENDS_class-native = "libxml-parser-perl-native"
-# gettext is assumed to exist on the host
-RDEPENDS_${PN}_class-native = "libxml-parser-perl-native"
-RRECOMMENDS_${PN} = "perl-modules"
-RRECOMMENDS_${PN}_class-native = ""
-
-FILES_${PN}-dev = ""
-FILES_${PN} += "${datadir}/aclocal"
-
-INSANE_SKIP_${PN} += "dev-deps"
-
-inherit autotools pkgconfig perlnative
-
-export PERL = "${bindir}/env perl"
-PERL_class-native = "/usr/bin/env nativeperl"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/intltool/intltool_0.51.0.bb b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
index d520d43..0a610a3 100644
--- a/meta/recipes-devtools/intltool/intltool_0.51.0.bb
+++ b/meta/recipes-devtools/intltool/intltool_0.51.0.bb
@@ -1,19 +1,41 @@
-require intltool.inc
+SUMMARY = "Utility scripts for internationalizing XML"
+SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI += "file://intltool-nowarn.patch \
-            file://perl-522-deprecations.patch \
+SRC_URI = "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz \
+           file://intltool-nowarn.patch \
+           file://perl-522-deprecations.patch \
            ${NATIVEPATCHES} \
            "
+SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
+SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
 
-#
 # All of the intltool scripts have the correct paths to perl already
 # embedded into them and can find perl fine, so we add the remove xml-check
 # in the intltool.m4 via the remove-xml-check.patch
 NATIVEPATCHES = "file://noperlcheck.patch \
                  file://remove-xml-check.patch"
-NATIVEPATCHES_class-native = "file://use-nativeperl.patch" 
+NATIVEPATCHES_class-native = "file://use-nativeperl.patch"
 
-SRC_URI[md5sum] = "12e517cac2b57a0121cda351570f1e63"
-SRC_URI[sha256sum] = "67c74d94196b153b774ab9f89b2fa6c6ba79352407037c8c14d5aeb334e959cd"
+UPSTREAM_CHECK_URI = "https://launchpad.net/intltool/trunk/"
+
+DEPENDS = "libxml-parser-perl-native"
+RDEPENDS_${PN} = "gettext-dev libxml-parser-perl"
+DEPENDS_class-native = "libxml-parser-perl-native"
+# gettext is assumed to exist on the host
+RDEPENDS_${PN}_class-native = "libxml-parser-perl-native"
+RRECOMMENDS_${PN} = "perl-modules"
+RRECOMMENDS_${PN}_class-native = ""
+
+FILES_${PN}-dev = ""
+FILES_${PN} += "${datadir}/aclocal"
+
+INSANE_SKIP_${PN} += "dev-deps"
+
+inherit autotools pkgconfig perlnative
+
+export PERL = "${bindir}/env perl"
+PERL_class-native = "/usr/bin/env nativeperl"
+
+BBCLASSEXTEND = "native"
-- 
2.8.1


