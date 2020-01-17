Return-Path: <diego.rondini@kynetics.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A2C667F898
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:17:45 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so7613110wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kynetics-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=oQvTOL2MxtNwHj6ZiD9JTCEuOH+i4NQn4G0/C1+xu8c=;
	b=HE/gB/kakLH4XXx3+dWC/aXssg+CwwDAlzFMQNl5lH54bZBvSC6vJYapsi+JStFCME
	qk/tPEG3GtgNoBM6OAm4MfPbpQtAcTGVjFFTcxaI8QRcCIITgY/9RlMxAfT/GyN6K2xM
	NSVZVN2F47ZpovigpTxlp3JEqTfaI9QO1uQtdP0Oqjnx1tQevYf4CNEHS+N8AnAPTDSr
	eIf+4CDfiYLLwiFF7UCBEsPqprNdfdbEavRBqtCpWI3YyTvXpzJ1sMjESipv3IPu7izw
	PriaPLMbxNKyqGfoAEXlr6OmlO6LykNQV5gST/Pgg8i46oF1Y5ebDJrv4/PzA/u4lL/m
	CUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oQvTOL2MxtNwHj6ZiD9JTCEuOH+i4NQn4G0/C1+xu8c=;
	b=BHdm437LF9tjK6kMhlIUADDP4RQ2lisZnIoTBOKqvoFd/S1wcxPi6Z9gxuP2Lyr0mE
	LszC6qjCyUGElh+STPlLBvIo9tvCx75Tt1R+GcEGToyRlqMh4ZaTcr+2jyyK4jXRD3P/
	eabQcV1H+llkHDrDqk2mMgsjNwRX7ai2YPZAVRqw3UhtlhuvGAfzdrFCwB4tUdmLor8i
	WOLNzsHJJX6XTmyVx7JF/wECmGPm+zHALD7z6fj8otrMywrR/JXXFq9LqOEb/wr4EJSL
	R8xG4M4pYZfh1R8xnT3ru5FXIqDGxcCxNkLwxmBZbHYeLmJxXQkE+F60aU1y/nRZIA+2
	JW0g==
X-Gm-Message-State: APjAAAXwbmL6FoKKFz/AExPXjLeTFsaKdkKs1pzAnJfGqOZVXbzUbI/o
	KEEnfQRr8uE95k4t6Kicmat3rcimKtwYT5ZNTm8=
X-Google-Smtp-Source: APXvYqwPvzZ4DUuW7SOFO24jB3Cib2xg2ZixERo+NUjqiK4ReMsn7jzGixFEGDv5u9qgmy2w9vGU3Q==
X-Received: by 2002:a05:600c:20c7:: with SMTP id
	y7mr4529192wmm.21.1579267065735; 
	Fri, 17 Jan 2020 05:17:45 -0800 (PST)
Received: from ip-172-31-6-138.eu-west-1.compute.internal
	(ec2-52-215-233-21.eu-west-1.compute.amazonaws.com. [52.215.233.21])
	by smtp.gmail.com with ESMTPSA id x6sm9230035wmi.44.2020.01.17.05.17.44
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 05:17:45 -0800 (PST)
From: Diego Rondini <diego.rondini@kynetics.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 13:17:28 +0000
Message-Id: <20200117131728.7054-1-diego.rondini@kynetics.com>
X-Mailer: git-send-email 2.17.1
Cc: Diego Rondini <diego.rondini@kynetics.com>
Subject: [PATCH] foomatic-filters: remove recipe
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
X-List-Received-Date: Fri, 17 Jan 2020 13:17:46 -0000

Remove foomatic-filters recipe, as the project hasn't seen a release
since 2012 and is unmaintained.
Most of foomatic-filters code is part of cups-filters as foomatic-rip
(see [1] and [2]), which is in meta-oe since commit
a67aaaf00f4c818847f95c02340872a1a49a0f34.

[1] https://github.com/OpenPrinting/cups-filters/blob/release-1-26-2/NEWS#L2563
[2] https://lists.gt.net/gentoo/user/288187#288187

Signed-off-by: Diego Rondini <diego.rondini@kynetics.com>
---
 .../CVE-2015-8327.patch                       | 23 ----------
 .../CVE-2015-8560.patch                       | 23 ----------
 .../foomatic/foomatic-filters_4.0.17.bb       | 44 -------------------
 3 files changed, 90 deletions(-)
 delete mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
 delete mode 100644 meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
 delete mode 100644 meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb

diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
deleted file mode 100644
index aaedc88aa3..0000000000
--- a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8327.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport
-
-
-http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7406
-
-Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
-
-CVE: CVE-2015-8327
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: util.c
-===================================================================
---- a/util.c
-+++ b/util.c
-@@ -31,7 +31,7 @@
- #include <assert.h>
- 
- 
--const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
-+const char* shellescapes = "|;<>&!$\'\"`#*?()[]{}";
- 
- const char * temp_dir()
- {
diff --git a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch b/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
deleted file mode 100644
index dc973c4592..0000000000
--- a/meta/recipes-extended/foomatic/foomatic-filters-4.0.17/CVE-2015-8560.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Upstream-Status: Backport
-
-
-http://bzr.linuxfoundation.org/loggerhead/openprinting/cups-filters/revision/7419
-
-Hand applied change to util.c. Fix was for cups-filters but also applied to foomatic-filters.
-
-CVE: CVE-2015-8560
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-Index: util.c
-===================================================================
---- a/util.c
-+++ b/util.c
-@@ -31,7 +31,7 @@
- #include <assert.h>
- 
- 
--const char* shellescapes = "|<>&!$\'\"#*?()[]{}";
-+const char* shellescapes = "|;<>&!$\'\"#*?()[]{}";
- 
- const char * temp_dir()
- {
diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
deleted file mode 100644
index 742c9a5cf2..0000000000
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.17.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "OpenPrinting printer support - filters"
-HOMEPAGE = "https://wiki.linuxfoundation.org/openprinting/start"
-DESCRIPTION = "Foomatic is a printer database designed to make it easier to set up \
-common printers for use with UNIX-like operating systems.\
-It provides the "glue" between a print spooler (like CUPS or lpr) and \
-the printer, by processing files sent to the printer. \
- \
-This package consists of filters used by the printer spoolers \
-to convert the incoming PostScript data into the printer's native \
-format using a printer-specific, but spooler-independent PPD file. \
-"
-
-DEPENDS += "cups perl libxml2"
-PR = "r1"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.tar.gz"
-
-SRC_URI += "file://CVE-2015-8560.patch \
-            file://CVE-2015-8327.patch \
-           "
-
-SRC_URI[md5sum] = "b05f5dcbfe359f198eef3df5b283d896"
-SRC_URI[sha256sum] = "a2e2e53e502571e88eeb9010c45a0d54671f15707ee104f5c9c22b59ea7a33e3"
-
-UPSTREAM_CHECK_REGEX = "foomatic-filters-(?P<pver>((\d|\d\d)\.*)+)\.tar\.gz"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
-
-do_configure_prepend() {
-    export PERL="${bindir}/env perl"
-    export CUPS_SERVERBIN=${exec_prefix}/lib/cups       # /usr/lib NOT libdir
-}
-
-do_install_append_linuxstdbase() {
-    install -d ${D}${exec_prefix}/lib/cups/filter
-    ln -sf ${bindir}/foomatic-rip ${D}${exec_prefix}/lib/cups/filter
-}
-
-FILES_${PN} += "${exec_prefix}/lib/cups/ ${exec_prefix}/lib/ppr/"
-- 
2.17.1


