Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9AC247E336
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 15:07:23 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id a23so10796898pff.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=AwTbEoseKu9nIxJ27Tio4WulseAi48B3ZV7scNqcxEw=;
	b=lebm7ew8m7wu7GcgzXJ3JL+r82OT/ltnFZsrynjYh8jZyDEGwEcWt8DvvHlFbQTXk+
	7snndbeZTi2xBnqTZ3YlvwPiFmWg0ILQ42ONtstkeNF6RSUEp0Gc3v6Vpn33uEUY3gDG
	bcP0nhjCVSCMKjsdd6GOjUZzeckMZVb/scpuKn2Z9Mfn2MKJMGOi/ThQHrG/2Q6m5cgu
	Ic8hrfWOo1lQdyB8n6kI3iMvSVMw8Sr3vHOTFbQvv+Ygf9OXFTLWeED75N4jPZHLiU3u
	CmO4080iBjRqjY5P7L4qUGa+ATUpN2E07ofonGmdrQjko9caNSKbcNcUrjGCKZ59sAGZ
	C5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=AwTbEoseKu9nIxJ27Tio4WulseAi48B3ZV7scNqcxEw=;
	b=MP2Cjkw8bIjBjpnA+xoRqMEZrxT75AGTbfPTLbjKpe+hLxwXey/iiQ79j2zh8vfsQt
	hGWc10egN5zvCLy2xRMzk6IMmbq7QXfzsYximb1c6oHp8heQk/o7Rbq2gfScXEJUPb2j
	6wn3pjKVtkEqLBEoYm3qoFcanmPKKC6U+hFiF0GGQ8x1CsMMtdf55S1Nqv7vIKKiBpUx
	npf0zzU5MeG4573gy7aBTTuUva/5nQZy/nNDah0ywewmUQb15uUjqiFPYXYVYD5/mu8k
	6zmCUl/ComRLOluxgE9yhJy57ksdTDSyZ8t3bXipH9b9pdUDmVjw03kygUmxRqxbY64A
	Qmww==
X-Gm-Message-State: APjAAAUTHs0gZmJ7i0Xpu50A5Lnw3419qkq21fdo507FtuV+wXY1xkup
	ZtZoT/1Jb1jDunXmbEKcTSZEP7Om
X-Google-Smtp-Source: APXvYqxhg8BBT1TvQE/YJ04q/r1yvwd7yHWiOSJwcXyZhlmFeHzXxJcUg2FjAlpF4CY5E/BKH4H5FQ==
X-Received: by 2002:aa7:9dc9:: with SMTP id g9mr31681608pfq.228.1559574444777; 
	Mon, 03 Jun 2019 08:07:24 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:847:4796:a7c5:c767])
	by smtp.gmail.com with ESMTPSA id
	s5sm14250546pgj.60.2019.06.03.08.07.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jun 2019 08:07:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jun 2019 08:07:02 -0700
Message-Id: <3f5f91a2a1f3ebb8151834ce4223dcd33f363803.1559574291.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1559574291.git.akuster808@gmail.com>
References: <cover.1559574291.git.akuster808@gmail.com>
Subject: [PATCH 19/21] perl/modules: Add various missing ptest perl module dependencies
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
X-List-Received-Date: Mon, 03 Jun 2019 15:07:23 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Whilst not complete, this resolves some module dependency failures being seen
by various lib*-perl ptests and in quilt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt | 5 +++++
 meta/recipes-devtools/perl/liburi-perl_1.74.bb            | 2 +-
 meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb     | 2 ++
 meta/recipes-devtools/perl/libxml-perl_0.08.bb            | 1 +
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb       | 1 +
 meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb   | 2 ++
 meta/recipes-extended/perl/libxml-sax-perl_1.00.bb        | 2 ++
 7 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index 362d317..3efc3f7 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -1484,6 +1484,7 @@ RDEPENDS_perl-module-overloading += "perl-module-overload-numbers"
 RDEPENDS_perl-module-overloading += "perl-module-warnings"
 RDEPENDS_perl-module-overload += "perl-module-mro"
 RDEPENDS_perl-module-overload += "perl-module-warnings-register"
+RDEPENDS_perl-module-overload += "perl-module-overloading"
 RDEPENDS_perl-module-params-check += "perl-module-exporter"
 RDEPENDS_perl-module-params-check += "perl-module-locale-maketext-simple"
 RDEPENDS_perl-module-params-check += "perl-module-strict"
@@ -1968,10 +1969,13 @@ RDEPENDS_perl-module-test-builder-module += "perl-module-exporter"
 RDEPENDS_perl-module-test-builder-module += "perl-module-strict"
 RDEPENDS_perl-module-test-builder-module += "perl-module-test-builder"
 RDEPENDS_perl-module-test-builder += "perl-module-data-dumper"
+RDEPENDS_perl-module-test-builder += "perl-module-list-util"
 RDEPENDS_perl-module-test-builder += "perl-module-overload"
 RDEPENDS_perl-module-test-builder += "perl-module-strict"
+RDEPENDS_perl-module-test-builder += "perl-module-scalar-util"
 RDEPENDS_perl-module-test-builder += "perl-module-test-builder-formatter"
 RDEPENDS_perl-module-test-builder += "perl-module-test-builder-tododiag"
+RDEPENDS_perl-module-test-builder += "perl-module-test2-util"
 RDEPENDS_perl-module-test-builder += "perl-module-warnings"
 RDEPENDS_perl-module-test-builder-tester-color += "perl-module-strict"
 RDEPENDS_perl-module-test-builder-tester-color += "perl-module-test-builder-tester"
@@ -2961,6 +2965,7 @@ RDEPENDS_perl-module-file-temp += "perl-module-io-seekable"
 RDEPENDS_perl-module-file-temp += "perl-module-overload"
 RDEPENDS_perl-module-file-temp += "perl-module-parent"
 RDEPENDS_perl-module-file-temp += "perl-module-posix"
+RDEPENDS_perl-module-file-temp += "perl-module-file-spec"
 RDEPENDS_perl-module-file-temp += "perl-module-strict"
 RDEPENDS_perl-module-file-temp += "perl-module-vars"
 RDEPENDS_perl-module-filter-simple += "perl-module-filter-util-call"
diff --git a/meta/recipes-devtools/perl/liburi-perl_1.74.bb b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
index a7cfa0f..fea4d24 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.74.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
@@ -33,6 +33,6 @@ do_install_prepend() {
 	rm -rf ${B}/t/file.t
 }
 
-RDEPENDS_${PN}-ptest += "libtest-needs-perl"
+RDEPENDS_${PN}-ptest += "libtest-needs-perl perl-module-test-more"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 95af4d1..4cfd28a 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -50,4 +50,6 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
+
 BBCLASSEXTEND="native nativesdk"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 0f60998..a2eee9a 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -26,3 +26,4 @@ do_compile() {
 	cpan_do_compile
 }
 
+RDEPENDS_${PN}-ptest += "libxml-parser-perl"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 8e1461c..7129c64 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
 
 SRC_URI[md5sum] = "b1d91153ac971347aee84292ed886c1c"
 SRC_URI[sha256sum] = "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 373b522..2bff65a 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -21,4 +21,6 @@ S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
 inherit cpan ptest-perl
 
+RDEPENDS_${PN}-ptest += "perl-module-test perl-module-test-more"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
index eccd0ad..fd3a2a0 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
@@ -29,4 +29,6 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/testfiles
 }
 
+RDEPENDS_${PN}-ptest += "perl-module-test"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


