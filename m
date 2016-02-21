Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6986FF78
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 19:01:23 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ho8so80620062pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 11:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C9xqcHqOkYKhdKOSxkHesYVEgJA9FiI4obl6CGnacn0=;
	b=xIH+RzDbv38e+iDxHYSQ+BLr47ISuZkyeCpvJfxQfZkyUCKfc95f0MFJeVzvkSh3/m
	THcEhGaULSOyu5FvRoOusUiNu9FxghpZcrSg0xEPXweZGOKxXL1vPYnSYCyjx9W1mQby
	8ShAiG/FJC9dmeOVodV2l/+qNlEpYw4fZrj9AgOxRrSrBgUeMgYuLd7lVvsbMTfjNNDQ
	tKwsfRj7pqS7y6akUTcgtQ12anlcJs0Jlnoi8o6D+Ur5n3rtotvsLSy2fyBRob1tjrfo
	OuB1tzO6tmcWBdsvwKZ24jaGEHjKmAGmhku2Xlu9KGZ+DEXfQ3y5MxBkS68OpE4fRo4v
	WTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C9xqcHqOkYKhdKOSxkHesYVEgJA9FiI4obl6CGnacn0=;
	b=WaJH00j3s+mDFJEE18qaj+Phjh8davkj8aVBo1g9W5b96arJcceUogIT9ez2Wlv0EL
	l5WLI5V5OPzDbAjtiVtlzfHzpbQ3uej/a2gj7PWk9jO407wZXBCXFPD4wuLjcdhNw5T+
	mNkTcWBCP2HMqIlwo5Ooii+6cmM8UEwuVrvt7pgLtXrPipMeJoz+eM8Utg9J6RBg2AY1
	4za9U5eoicnBgZz6TqTBMwsl9FYbFDZpsgwmZZaZBrHx74SFrnbYb88fa09PSn8aOzN6
	CrT2ajrOiytPJchtaCtKwt/vx64LWVcskKiJhsabXwFXeSgwtH+Hj2K2wAKhJKU+AT83
	BUnA==
X-Gm-Message-State: AG10YOQyo+3mclpKLsKmcUPXaHuWhUbuSv7sva1We0ZG3jK24gu7RqMvkVL24RStTD47JfJY
X-Received: by 10.66.62.134 with SMTP id y6mr32878672par.43.1456081284636;
	Sun, 21 Feb 2016 11:01:24 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	79sm31410836pfr.22.2016.02.21.11.01.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Feb 2016 11:01:23 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 00:30:53 +0530
Message-Id: <1456081253-27215-2-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1456081253-27215-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1456081253-27215-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH v2 2/2] pango: make ${PN}-ptest RDEPENDS on cantarell-fonts
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
X-List-Received-Date: Sun, 21 Feb 2016 19:01:24 -0000

Pango test case (test-layout.test) requires cantarell-font
typeface. This test case uses 'Cantarell 11' font type.

Test result after this change on qemux86:
-- snip --
root@qemux86:~# gnome-desktop-testing-runner pango
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
Running test: pango/test-ot-tags.test
/tags/script: OK
/tags/language: OK
PASS: pango/test-ot-tags.test
Running test: pango/testcolor.test
/color/parse: OK
PASS: pango/testcolor.test
Running test: pango/markup-parse.test
/markup/parse/valid-4.markup: OK
/markup/parse/valid-1.markup: OK
/markup/parse/valid-3.markup: OK
/markup/parse/valid-2.markup: OK
/markup/parse/fail-1.markup: OK
PASS: pango/markup-parse.test
Running test: pango/test-layout.test
/layout/valid-1.markup: OK
/layout/valid-2.markup: OK
PASS: pango/test-layout.test
Running test: pango/cxx-test.test
PASS: pango/cxx-test.test
Running test: pango/testboundaries_ucd.test
/text/break/grapheme: Testing /usr/libexec/installed-tests/pango/GraphemeBreakTest.txt.
OK
/text/break/word: /usr/libexec/installed-tests/pango/WordBreakTest.txt not found.
Skipping test.
OK
/text/break/sentence: /usr/libexec/installed-tests/pango/SentenceBreakTest.txt not found.
Skipping test.
OK
/text/break/line: /usr/libexec/installed-tests/pango/LineBreakTest.txt not found.
Skipping test.
OK
PASS: pango/testboundaries_ucd.test
Running test: pango/testboundaries.test
/text/boundaries: sample file: /usr/libexec/installed-tests/pango/boundaries.utf8
testboundaries passed
OK
PASS: pango/testboundaries.test
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
Running test: pango/testscript.test
/script/iter: OK
PASS: pango/testscript.test
Running test: pango/test-font.test
/pango/fontdescription/parse: OK
/pango/fontdescription/roundtrip: OK
PASS: pango/test-font.test
Running test: pango/testiter.test
/layout/iter: OK
/layout/glyphitem-iter: OK
PASS: pango/testiter.test
SUMMARY: total=12; passed=12; skipped=0; failed=0; user=76.1s; system=2.0s; maxrss=52664
root@qemux86:~#
-- CUT --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/recipes-graphics/pango/pango_1.38.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/pango/pango_1.38.1.bb b/meta/recipes-graphics/pango/pango_1.38.1.bb
index 3e57dc2..a9a7500 100644
--- a/meta/recipes-graphics/pango/pango_1.38.1.bb
+++ b/meta/recipes-graphics/pango/pango_1.38.1.bb
@@ -42,7 +42,7 @@ do_compile_prepend_class-target () {
 FILES_${PN} = "${bindir}/* ${libdir}/libpango*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-RDEPENDS_${PN}-ptest += "liberation-fonts"
+RDEPENDS_${PN}-ptest += "liberation-fonts cantarell-fonts"
 
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
-- 
1.8.3.1


