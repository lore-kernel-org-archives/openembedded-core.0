Return-Path: <filipjares@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC377D3A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2019 07:34:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d17so1138007wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2019 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bMDyZAwFLTHN0rYwUHDT0254WMhRkezHOJoNfSwsicE=;
	b=mQl8iEv1xsv3j2lMRcEdmU8YCyGVofGThFD65GdMbZfIk/6TSAkE0I+nMPcwKHK6rU
	YbwO0ur9adcCNEcIj33KhbawmpzDmRYSwAKkxmBGV6/FTiGFN0/xx+5ft26T5lT2N9cQ
	9oMBtSiuw/fNCYvZXHUk8obXjYxxPwSoCjaTeNvIKnShaCyVhsmZSBjfb2HbH6dSLKRJ
	Kxn9pbmk9aEN9g4KhPG7gmM9wJjArpmllsoO1mT8jEUnEYqUA3KVvMNewUAjc9WHpvhL
	p5QZ52y2YMDDfWoxIqnJu5j72MYhwCXLouu4TG1ZLuei7pEtpdLBWohti6Ab1/6wiA6O
	Jyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bMDyZAwFLTHN0rYwUHDT0254WMhRkezHOJoNfSwsicE=;
	b=uOVSDhShklCWpbKEMosse9ZQ6kMVF0ir/QlQGFCqWdQDXtv5TzXtfHOEFPrbq6FXDN
	t0aYbUmDk7XqXJSTuzOgP+J5MqsjIIEHMcJ9v7UT4SpA/HcCNiWm1IV9vRHAU+AZqNnT
	iluEElIEFI+19eDTN+cskP4Ktf2Zih0eWEjITIReN8W0Q1tCCsL3mWSWX7GKzjSsf/jn
	anqQU7WFwlPXMwQ6x9SiC1e4dx7jfsQMgZLhfQhDrfwuECeZOEQE1y5sy8JTa+FlJCKN
	3dphLHhwJOFtg1cbPMiAq5fTUeg29rIRk5/beiOOMgwvGhRCcJHfNUWoCsqibmOkUerY
	WM3w==
X-Gm-Message-State: APjAAAW6dQe9zrCE1MgJY7t0tWRUhZVr4U4FrUrW5L9ZxOxiAwWwUP7z
	hmGiwmD/t47fRk+bhjqT82yM6g7L
X-Google-Smtp-Source: APXvYqwujfDz1E61to1tdi6HeOT2/XjceCxXJnhDvF858QTPUPuKZGGO6RIFDjbbAM1ajEN5V0tjcA==
X-Received: by 2002:a1c:cc02:: with SMTP id h2mr20952512wmb.13.1559720066179; 
	Wed, 05 Jun 2019 00:34:26 -0700 (PDT)
Received: from PC1007453.cc.certicon.cz ([193.86.95.165])
	by smtp.gmail.com with ESMTPSA id
	e13sm24378638wra.16.2019.06.05.00.34.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 05 Jun 2019 00:34:25 -0700 (PDT)
From: =?UTF-8?q?Filip=20Jare=C5=A1?= <filipjares@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jun 2019 09:34:08 +0200
Message-Id: <1559720048-7299-1-git-send-email-filipjares@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] Fix license "names"/versions.
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
X-List-Received-Date: Wed, 05 Jun 2019 07:34:26 -0000

These were broken in commit 4786ecdf7cd427089464dcb62579110d494e7cd7
which performed a cleanup to avoid non-standard field names.

There is an SPDX License list at https://spdx.org/licenses/ which
aims to be a standard. Yocto also uses a substitution map SPDXLICENSEMAP,
default one stored at meta/conf/licenses.conf.

According to meta/conf/licenses.conf, "AFL-2" corresponds to "AFL-2.0"
which is not correct for dbus.

According to the same licenses.conf file "MPL-1" corresponds to "MPL-1.0",
which is correct for libical but since SPDX aims to be a standard
I am updating the identifier in libical's .bb file as well.

To verify the actual license used you can use:

dbus:

    cd /tmp/
    wget http://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.110.tar.gz
    tar -xaf dbus-glib-0.110.tar.gz
    cd dbus-glib-0.110
    grep -A1 "^The Academic Free License$" COPYING

    cd /tmp/
    wget http://dbus.freedesktop.org/releases/dbus/dbus-1.12.14.tar.gz
    tar -xaf dbus-1.12.14.tar.gz
    cd dbus-1.12.14
    grep -A1 "^The Academic Free License$" COPYING

cairo:

    wget --quiet -O - https://cgit.freedesktop.org/cairo/plain/COPYING-MPL-1.1?h=1.16.0 | grep -A1 "MOZILLA PUBLIC LICENSE"

libical:

    wget --quiet -O - https://raw.githubusercontent.com/libical/libical/v2.0.0/COPYING | grep "Mozilla Public License"

taglib:

    wget --quiet -O - https://raw.githubusercontent.com/taglib/taglib/v1.11.1/COPYING.MPL | grep -A1 "MOZILLA PUBLIC LICENSE"
---
 meta/recipes-core/dbus/dbus-glib_0.110.bb     |  2 +-
 meta/recipes-core/dbus/dbus-test_1.12.14.bb   |  2 +-
 meta/recipes-core/dbus/dbus_1.12.14.bb        |  2 +-
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   | 12 ++++++------
 meta/recipes-support/libical/libical_2.0.0.bb |  2 +-
 meta/recipes-support/taglib/taglib_1.11.1.bb  |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-glib_0.110.bb b/meta/recipes-core/dbus/dbus-glib_0.110.bb
index b7383bd..9afbc2b 100644
--- a/meta/recipes-core/dbus/dbus-glib_0.110.bb
+++ b/meta/recipes-core/dbus/dbus-glib_0.110.bb
@@ -2,7 +2,7 @@ SUMMARY = "High level language (GLib) binding for D-Bus"
 DESCRIPTION = "GLib bindings for the D-Bus message bus that integrate \
 the D-Bus library with the GLib thread abstraction and main loop."
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
-LICENSE = "AFL-2 | GPLv2+"
+LICENSE = "AFL-2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cf5b3a2f7083750d504333114e738656 \
                     file://dbus/dbus-glib.h;beginline=7;endline=21;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 SECTION = "base"
diff --git a/meta/recipes-core/dbus/dbus-test_1.12.14.bb b/meta/recipes-core/dbus/dbus-test_1.12.14.bb
index d7eb628..10447c6 100644
--- a/meta/recipes-core/dbus/dbus-test_1.12.14.bb
+++ b/meta/recipes-core/dbus/dbus-test_1.12.14.bb
@@ -1,7 +1,7 @@
 SUMMARY = "D-Bus test package (for D-bus functionality testing only)"
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
-LICENSE = "AFL-2 | GPLv2+"
+LICENSE = "AFL-2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 
diff --git a/meta/recipes-core/dbus/dbus_1.12.14.bb b/meta/recipes-core/dbus/dbus_1.12.14.bb
index 60d589d..4e7f614 100644
--- a/meta/recipes-core/dbus/dbus_1.12.14.bb
+++ b/meta/recipes-core/dbus/dbus_1.12.14.bb
@@ -2,7 +2,7 @@ SUMMARY = "D-Bus message bus"
 DESCRIPTION = "D-Bus is a message bus system, a simple way for applications to talk to one another. In addition to interprocess communication, D-Bus helps coordinate process lifecycle; it makes it simple and reliable to code a \"single instance\" application or daemon, and to launch applications and daemons on demand when their services are needed."
 HOMEPAGE = "http://dbus.freedesktop.org"
 SECTION = "base"
-LICENSE = "AFL-2 | GPLv2+"
+LICENSE = "AFL-2.1 | GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
                     file://dbus/dbus.h;beginline=6;endline=20;md5=7755c9d7abccd5dbd25a6a974538bb3c"
 DEPENDS = "expat virtual/libintl autoconf-archive"
diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
index c2628ae..f32e9ba 100644
--- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
@@ -10,12 +10,12 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 
-LICENSE = "MPL-1 & LGPLv2.1 & GPLv3+"
-LICENSE_${PN} = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-dev = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-doc = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-gobject = "MPL-1 & LGPLv2.1"
-LICENSE_${PN}-script-interpreter = "MPL-1 & LGPLv2.1"
+LICENSE = "MPL-1.1 & LGPLv2.1 & GPLv3+"
+LICENSE_${PN} = "MPL-1.1 & LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1.1 & LGPLv2.1"
+LICENSE_${PN}-doc = "MPL-1.1 & LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1.1 & LGPLv2.1"
+LICENSE_${PN}-script-interpreter = "MPL-1.1 & LGPLv2.1"
 LICENSE_${PN}-perf-utils = "GPLv3+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
diff --git a/meta/recipes-support/libical/libical_2.0.0.bb b/meta/recipes-support/libical/libical_2.0.0.bb
index daa47ab..4d8144d 100644
--- a/meta/recipes-support/libical/libical_2.0.0.bb
+++ b/meta/recipes-support/libical/libical_2.0.0.bb
@@ -1,7 +1,7 @@
 SUMMARY = "iCal and scheduling (RFC 2445, 2446, 2447) library"
 HOMEPAGE = "https://github.com/libical/libical"
 BUGTRACKER = "https://github.com/libical/libical/issues"
-LICENSE = "LGPLv2.1 | MPL-1"
+LICENSE = "LGPLv2.1 | MPL-1.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
                     file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
 SECTION = "libs"
diff --git a/meta/recipes-support/taglib/taglib_1.11.1.bb b/meta/recipes-support/taglib/taglib_1.11.1.bb
index 01dcf66..f4e2882 100644
--- a/meta/recipes-support/taglib/taglib_1.11.1.bb
+++ b/meta/recipes-support/taglib/taglib_1.11.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Library for reading and editing the meta-data of popular audio formats"
 SECTION = "libs/multimedia"
 HOMEPAGE = "http://taglib.github.io/"
-LICENSE = "LGPLv2.1 | MPL-1"
+LICENSE = "LGPLv2.1 | MPL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING.MPL;md5=bfe1f75d606912a4111c90743d6c7325 \
                     file://taglib/audioproperties.h;beginline=1;endline=24;md5=9df2c7399519b7310568a7c55042ecee"
-- 
2.7.4


