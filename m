Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6718F7E2B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 22:28:41 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f204so211629wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0W29VGW1gy1m0YdiYy+6BT/4+6NOa8eR95FghLDZghw=;
	b=aAZ6xgjWpuF6eM5uMNc8KebUhSik3/Xk3SAaN3183Kea3DikXuLizGAWuP1cNDh1Oc
	UYPIEUGfNGdN6IbbyOcszUjyqanZ536ZyryGu0DVeZJ6aUb827o9tfd4J7CxzmoQxLXI
	/1cLzkI7uaVbQH7HpwfVt9kBRBDBOqhbI9R6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0W29VGW1gy1m0YdiYy+6BT/4+6NOa8eR95FghLDZghw=;
	b=gPLHjO1FqUMng20jxExppgiBxJ8DVgPur0+SAfupIn2DiOQC+9vnQ+0pIMzXaQ9IqU
	ipB0ObElQP450npblTlMKmAE2UcdSCZlvyoVYSsMc/THux4HmwF2sef4i2meDCe/saeL
	9uOApQNgG+2SeuozvM52Q1l8QV4ivbzBaDS2V4is40qA8UfHI1X4500DQIPI8nGZFgc2
	TE+1ttznTGvZDDzvRbBzE2/N7hzTnawvePul0+cebcsOdCR9+zv1+ZtpNnOGOBqiv2g6
	yRST2qGVIL7i/pLMKPpS4STOT4f8fdjvj/9w6CXpccRcuoMtYR8ri3DdZv+EyBPgZ02I
	f0vw==
X-Gm-Message-State: APjAAAWHmSY1i7vvhtdUJMcxhYhvgtLOTYV7cjlfo9cIdraQvPeiEJVa
	rgG4gRCWqsI+AsC3DR19mnG5VAGOWCg=
X-Google-Smtp-Source: APXvYqymANOuShaG0Jw0E5NWCdM7/8Zfz5CkwB3MjHBXd3/qX9ypQaSFi+T5Mr+E3NvbF4HjyGLJvg==
X-Received: by 2002:a1c:5f02:: with SMTP id t2mr5214759wmb.19.1558477721860;
	Tue, 21 May 2019 15:28:41 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z74sm5585446wmc.2.2019.05.21.15.28.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 15:28:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 23:28:35 +0100
Message-Id: <20190521222835.23928-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
References: <20190521222835.23928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/6] perl/modules: Add various missing ptest perl module dependencies
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
X-List-Received-Date: Tue, 21 May 2019 22:28:41 -0000
Content-Transfer-Encoding: 8bit

Whilst not complete, this resolves some module dependency failures being seen
by various lib*-perl ptests and in quilt.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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
index 362d317da7d..3efc3f7b34b 100644
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
index a7cfa0fbe3c..fea4d2490e4 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.74.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.74.bb
@@ -33,6 +33,6 @@ do_install_prepend() {
 	rm -rf ${B}/t/file.t
 }
 
-RDEPENDS_${PN}-ptest += "libtest-needs-perl"
+RDEPENDS_${PN}-ptest += "libtest-needs-perl perl-module-test-more"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
index 95af4d1de65..4cfd28a9dad 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.44.bb
@@ -50,4 +50,6 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/samples
 }
 
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
+
 BBCLASSEXTEND="native nativesdk"
diff --git a/meta/recipes-devtools/perl/libxml-perl_0.08.bb b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
index 0f6099868a7..a2eee9aa6e4 100644
--- a/meta/recipes-devtools/perl/libxml-perl_0.08.bb
+++ b/meta/recipes-devtools/perl/libxml-perl_0.08.bb
@@ -26,3 +26,4 @@ do_compile() {
 	cpan_do_compile
 }
 
+RDEPENDS_${PN}-ptest += "libxml-parser-perl"
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 8e1461ceb9b..7129c647cb3 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -15,6 +15,7 @@ BBCLASSEXTEND = "native"
 
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
+RDEPENDS_${PN}-ptest += "perl-module-test-more"
 
 SRC_URI[md5sum] = "b1d91153ac971347aee84292ed886c1c"
 SRC_URI[sha256sum] = "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 373b522d6ac..2bff65a082d 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -21,4 +21,6 @@ S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
 inherit cpan ptest-perl
 
+RDEPENDS_${PN}-ptest += "perl-module-test perl-module-test-more"
+
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
index eccd0ad6b4b..fd3a2a0ee70 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
@@ -29,4 +29,6 @@ do_install_ptest() {
 	chown -R root:root ${D}${PTEST_PATH}/testfiles
 }
 
+RDEPENDS_${PN}-ptest += "perl-module-test"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


