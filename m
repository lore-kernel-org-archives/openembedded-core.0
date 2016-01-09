Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id A349C758DB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Jan 2016 14:32:44 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e65so23120693pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Jan 2016 06:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=t24MmQYVjvSftporbQ36E/0TMscSgw0awIsvwQTtlb8=;
	b=MQU69OEFn2OcY4LSUwH6G8GYh5wrWcLmOG26PUJvFa6sA67rGhS/c1YGPdICR+PIP0
	I9Yni4IuaZfNyJudybAnz0W6myP9gLPtGsVTJkHYfAHx50N6qpopfDYLgsTHrws1G3Rf
	FdZtVAJum8dBnPEsVDMzwkIEcj5dQvNOa/V8jpWJFRxAPwbiQCBKpJVvoEsH/Ji60I1Z
	MuD4EKiKix7DW5spYdFdDOAngaRbAGsmyc45Sn3c6Ep8OupOBWfranN9jg+Q/ioQfjOa
	8UeV99C6gPSp4j/9hkqurXq52DTc2EmhyeXMZ334hOWz+VErE+4KupfQx/L4U3CDaPBo
	703Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=t24MmQYVjvSftporbQ36E/0TMscSgw0awIsvwQTtlb8=;
	b=VVCZMWrd65VDQrfUbKhV81X0XsTultn3RMbyZ0hoVN8jDHNoZNcKTx65r+JgUp7uaB
	8mgSvsC2s/MFuIMeRsBeEsEvYTfoTncXoa6Dk7qCv9ay/WU3Ya+35qLRf7ROTIM5e4aI
	tkut+Tw/5kzDU96nZ3nBtsJMSAneYeYjHfvuRAjgcALOCcFpKHbWa8tgH8ucbJXy+eh4
	C2R2G3sOVIhE25P4MXEZLAz7a88hUfpQAWEwpyoGoY0cca/xgg/0/B/Ct6FcpfRdIAQB
	pt2SRycCZcUOeCrj9yrrNqZewvRRwo/ySxKmBZjLT7BrE/ZVEeAqH862xgjWDVI47K+7
	MM7Q==
X-Gm-Message-State: ALoCoQliHFZW7OSNLP7pm2buEQ9Pa/IdPmdpA7eu4TNmFNWtzqEIoB2469WSkanu2ebnUDKs+afgG+Shmh30DKjgjYGF54FGzw==
X-Received: by 10.98.71.157 with SMTP id p29mr12492464pfi.45.1452349965774;
	Sat, 09 Jan 2016 06:32:45 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	68sm11858413pfa.78.2016.01.09.06.32.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 09 Jan 2016 06:32:44 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Jan 2016 20:02:32 +0530
Message-Id: <1452349952-11016-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1452349952-11016-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH 2/2] pango: make ${PN}-ptest RDEPENDS on cantarell-fonts
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
X-List-Received-Date: Sat, 09 Jan 2016 14:32:45 -0000

Pango test case (test-layout.test) requires cantarell-font
typeface. This test case uses 'Cantarell 11' font type.

Test result after this change on qemux86:
-- snip --
root@qemux86:/usr/lib/pango/ptest# ./run-ptest
Running test: pango/testboundaries_ucd.test
/text/break/grapheme: Testing
/usr/lib/pango/installed-tests/pango/GraphemeBreakTest.txt.
OK
/text/break/word: /usr/lib/pango/installed-tests/pango/WordBreakTest.txt not
found.  Skipping test.
OK
/text/break/sentence: /usr/lib/pango/installed-tests/pango/SentenceBreakTest.txt
not found.  Skipping test.
OK
/text/break/line: /usr/lib/pango/installed-tests/pango/LineBreakTest.txt not
found.  Skipping test.
OK
PASS: pango/testboundaries_ucd.test
Running test: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test

Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
Executing: pango/test-pangocairo-threads.test
PASS: pango/test-pangocairo-threads.test
Running test: pango/test-layout.test
/layout/valid-2.markup: OK
/layout/valid-1.markup: OK
PASS: pango/test-layout.test
Running test: pango/markup-parse.test
/markup/parse/fail-1.markup: OK
/markup/parse/valid-3.markup: OK
/markup/parse/valid-2.markup: OK
/markup/parse/valid-1.markup: OK
/markup/parse/valid-4.markup: OK
PASS: pango/markup-parse.test
Running test: pango/test-ot-tags.test
/tags/script: OK
/tags/language: OK
PASS: pango/test-ot-tags.test
Running test: pango/testiter.test
/layout/iter: OK
/layout/glyphitem-iter: OK
PASS: pango/testiter.test
Running test: pango/testcolor.test
/color/parse: OK
PASS: pango/testcolor.test
Running test: pango/cxx-test.test
PASS: pango/cxx-test.test
Running test: pango/testboundaries.test
/text/boundaries: sample file:
/usr/lib/pango/installed-tests/pango/boundaries.utf8
testboundaries passed
OK
PASS: pango/testboundaries.test
Running test: pango/testscript.test
/script/iter: OK
PASS: pango/testscript.test
Running test: pango/testattributes.test
/attributes/basic: OK
/attributes/equal: OK
/attributes/list/basic: OK
/attributes/list/change: OK
/attributes/list/splice: OK
/attributes/list/filter: OK
/attributes/iter/basic: OK
/attributes/iter/get: OK
/attributes/iter/get_font: OK
/attributes/iter/get_attrs: OK
PASS: pango/testattributes.test
Running test: pango/test-font.test
/pango/fontdescription/parse: OK
/pango/fontdescription/roundtrip: OK
PASS: pango/test-font.test
SUMMARY: total=12; passed=12; skipped=0; failed=0; user=74.9s; system=1.9s;
maxrss=52356
root@qemux86:/usr/lib/pango/ptest#
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-graphics/pango/pango.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 3e9c068..a2a92fe 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -42,7 +42,7 @@ do_compile_prepend () {
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-RDEPENDS_${PN}-ptest += "liberation-fonts"
+RDEPENDS_${PN}-ptest += "liberation-fonts cantarell-fonts"
 
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
-- 
1.9.1


