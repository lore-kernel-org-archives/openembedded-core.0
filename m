Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D99F277332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:24 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id v186so158697607lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u2Kho+2QzhbTs4k73pVvKn54GRXS+7jdeesGKELuGFs=;
	b=deEB7yrAP94vxxb/q1p0wiZ0sADShopW87jO1WIrCwyING4wVN0dHS34F7uVAWUvIg
	OEz5hsYyJxETu1KFhdjrizRxmluA9g0Mk1B2iUEOJCsySwx49Ztl1kcKzodqK92RSNr9
	GfcIuV7HfwUHraFQLpr96vB7bmjy8TM9KvBWxAvHqCcTVNXSrs+KqJ9s6Obij3rZ/sbw
	ZeYO1dxOc1hIG8Y5fxC3C6x47L88hkiCmUdDA8erzq5WOVZzgac0tzkShy4C8lGrRgm2
	JbWKEL88YDzb8sQ14cVoxDWoD/HK/IFmjD78+M1bB//MTsmo4qubO9g8LjZGFiXOT/JN
	JvnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u2Kho+2QzhbTs4k73pVvKn54GRXS+7jdeesGKELuGFs=;
	b=g9nmRA7cSwAs1jweKn/qc+NnlxQaCP8Q2eKU+10CFABdJ0DUm/0eqCtN3WhiDhO4hF
	0tTnuFpNhDB+Yk5geQom7DUMkBhDJol0E9NJci3CGiQ1L59a0I/52LONQ1lYpo8I1NjJ
	OCxCI28j8CXf1zc6P2OiPbI62n4n5Y0FAy5HH0hgbVRQpBW/palZItt5LqPJcR0XV+qI
	0M5/n49G4yySSNUwpZmkdPDzxGSxIjl8T8qCDNzsVMMI/aYqusvnBs+AMpXzUIqUtQnF
	jjHSURvgy4zhb70WwX7XDE+N/jjttwxAD0V/BDRTi56Ncvnxbhr8zcZoIHK2A/z4Qdm5
	S71A==
X-Gm-Message-State: AIkVDXK63pXJlI450zHSXJoQzUYZVomjhywuJqQ/uIs68hGm/SCcTPveqnfHXxeKDbkAfw==
X-Received: by 10.46.83.19 with SMTP id h19mr2724313ljb.72.1485507984329;
	Fri, 27 Jan 2017 01:06:24 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 18sm1148845ljj.3.2017.01.27.01.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:23 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:06:00 +0100
Message-Id: <3c657fa60a1123fb80f7cd2171d91f24dcc9269a.1485505681.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 5/7] python-3-manifest: add _compat_pickle to python3-pickle
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:25 -0000

This allows us to depend on _compat_pickle.* wihtout having to add the whole
python3-misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 555ac8844d..8b64069a2f 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -167,7 +167,7 @@ FILES_${PN}-numbers="${libdir}/python3.5/decimal.* ${libdir}/python3.5/__pycache
 
 SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
-FILES_${PN}-pickle="${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
+FILES_${PN}-pickle="${libdir}/python3.5/_compat_pickle.* ${libdir}/python3.5/__pycache__/_compat_pickle.* ${libdir}/python3.5/pickle.* ${libdir}/python3.5/__pycache__/pickle.* ${libdir}/python3.5/shelve.* ${libdir}/python3.5/__pycache__/shelve.* ${libdir}/python3.5/lib-dynload/cPickle.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cPickle.*.so ${libdir}/python3.5/pickletools.* ${libdir}/python3.5/__pycache__/pickletools.* "
 
 SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 770ef754e6..1a06896b5c 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -329,7 +329,7 @@ if __name__ == "__main__":
     "decimal.* fractions.* numbers.*" )
 
     m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
-    "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
+    "_compat_pickle.* pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
 
     m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
-- 
2.11.0


