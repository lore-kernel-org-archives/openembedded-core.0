Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SIdyq-0005zD-9E
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 12:43:52 +0200
Received: by mail-qa0-f54.google.com with SMTP id 25so2321614qao.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 03:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=piEiy1/X3AHNl5TybK6Iuvu/1xQYOqHf9qsNUrxSKcc=;
	b=khljh8cRW06xHeM2INExvd2BCytOZCISGvZ5NGgiEvUwJjzBvT+mapxZuei6ZUYKht
	HivyRNX4YnCzlSZBXWQ3mLMYoZGO7bSK7glG+c8WwJ7a1u27hXpvk1PYkXiBZ1CrsRqH
	LCdX4//SqcCCY1Pf/hEgfv+kAdAJ5nXO2OMhIyJc+GrAh2VNlPbFL5ERTJdJMsNoWB+n
	OtPmsFFnX0prFF0roeVxhEmpZ1HknXPvg+p6RaPtN3RHiZnP/ufXEGvTgW7pDDA9gOLn
	8YEObriHuqGvHG1XYdaWuIa2qmJKufDDyIipb2qNX0reLehV7jAmvEk5GcTeDG+hzsJW
	mxiw==
Received: by 10.224.173.194 with SMTP id q2mr1741719qaz.15.1334313273150;
	Fri, 13 Apr 2012 03:34:33 -0700 (PDT)
Received: from localhost.localdomain ([93.114.75.57])
	by mx.google.com with ESMTPS id i12sm16864210qad.9.2012.04.13.03.34.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 03:34:32 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 13:34:19 +0300
Message-Id: <f00043fa865b36ddb4f6ac18aa917f812d1f4884.1334313002.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <8ef395eb05e1acafcf4ea012c281911a1f5e71ad.1334313002.git.andrei@gherzan.ro>
References: <8ef395eb05e1acafcf4ea012c281911a1f5e71ad.1334313002.git.andrei@gherzan.ro>
In-Reply-To: <cover.1334313002.git.andrei@gherzan.ro>
References: <cover.1334313002.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQn9wemE34w8oeYNzrTy3NCCnQIO0I9xFysZk+08xlh0wUhEFmdiTzrZ/pV20WKfPSiyL8HS
Subject: [V5 2/2] PR bump packages with gdbm in DEPENDS
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
X-List-Received-Date: Fri, 13 Apr 2012 10:43:52 -0000

This is done because of this change in gdbm:
"gdbm: Package compat libs in gdbm-compat"

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 meta/recipes-support/apr/apr-util_1.4.1.bb         |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 92ca9b8..8f3ad25 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r4"
+PR = "r5"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
index d1d0d83..0a1708a 100644
--- a/meta/recipes-devtools/python/python_2.7.2.bb
+++ b/meta/recipes-devtools/python/python_2.7.2.bb
@@ -1,6 +1,6 @@
 require python.inc
 DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
-PR = "${INC_PR}.10"
+PR = "${INC_PR}.11"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
 DISTRO_SRC_URI_linuxstdbase = ""
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index e98a591..fd61149 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index 029cf7e..deb608f 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
-- 
1.7.5.4



