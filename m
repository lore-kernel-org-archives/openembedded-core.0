Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2CCD077357
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:25 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id x1so71992460lff.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tbd8oVVkFq4s+ELEFmOaeOKAWAI4/n7uo8WilD5UDl8=;
	b=jg9i5Yrvzpfv2Ul5/n5UWsAM8POfitHxin7zLqa8L4VmFEnlW8Uo3svHc2WtTRYiM2
	rTVccC20/KTiIsjdnKFe91lX00AZt33sx2Xz3fT8GS2zL+MhDIZ73W+drAN5QtlrqCX6
	OAJY+PN8E5e3/5JTP7hWkSHUL2QOxYhZkG3ZLFQpdLDucqC8lmfxqbb10KvpLRgC8P+P
	IMYHh7trJSVhC+/uwxMGwksGYxOWwjHlq5yTveal9xjAK/NC3EWD0aInMFT7wxEE9bii
	B4VWmbZnjppRALS9ojIkMAavXDy7fGBLcIsrVz6PpJ8ElCILhmTykOyWgQ0IoJ1GQ+pt
	XC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tbd8oVVkFq4s+ELEFmOaeOKAWAI4/n7uo8WilD5UDl8=;
	b=s0arRIWJ2aYFqvLyhjT0Rg2dc7psMA+l2amq1viugr123rJmesTQdKtqnKzq49IV0I
	tBrAqlD4ddguANW+J4IUKLrLzV4AOF2gHRXLqv0uSc6V3bg6yoWs6HzV63J5QdI3Hrsi
	yNNJAwzUEqmssBP37hZ5MmkcgD/ulqM1vqfKYEqdLRTtW4Bqsoa+zeY1Jq0ESH/HswMg
	w0oCZ9uMZdNikkPueT9EO9WYq01zc2vFIkirvNK2e92lzHkSwJAv9s8YYaaUlTanCdte
	qyYB33Iu2CSZIu6Djtp+EPXvhe6dMDhXE0NfZZSZHSWEh5M6/FOatCOXcE42jz4nKCRd
	e7Kg==
X-Gm-Message-State: AIkVDXKi4FDBt3wGtsvi0IS0q68CLjynb7s2oufdfznDXs7LxG3FFknTgbxCFmyLhi460Q==
X-Received: by 10.46.5.196 with SMTP id 187mr2534299ljf.36.1485507985776;
	Fri, 27 Jan 2017 01:06:25 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id b7sm1131720lfe.33.2017.01.27.01.06.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:24 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:06:01 +0100
Message-Id: <d7426610afcacb602cd98931738bc330b5bd3e3c.1485505681.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 6/7] python-3-manifest: add ipaddress to python3-io
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:26 -0000

This allows us to use ipaddress without requiring the add the whole
python3-misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 8b64069a2f..d4c7c4d1b1 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -119,7 +119,7 @@ FILES_${PN}-importlib="${libdir}/python3.5/importlib ${libdir}/python3.5/importl
 
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
-FILES_${PN}-io="${libdir}/python3.5/lib-dynload/_socket.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_socket.*.so ${libdir}/python3.5/lib-dynload/_io.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_io.*.so ${libdir}/python3.5/lib-dynload/_ssl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ssl.*.so ${libdir}/python3.5/lib-dynload/select.*.so ${libdir}/python3.5/lib-dynload/__pycache__/select.*.so ${libdir}/python3.5/lib-dynload/termios.*.so ${libdir}/python3.5/lib-dynload/__pycache__/termios.*.so ${libdir}/python3.5/lib-dynload/cStringIO.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cStringIO.*.so ${libdir}/python3.5/pipes.* ${libdir}/python3.5/__pycache__/pipes.* ${libdir}/python3.5/socket.* ${libdir}/python3.5/__pycache__/socket.* ${libdir}/python3.5/ssl.* ${libdir}/python3.5/__pycache__/ssl.* ${libdir}/python3.5/tempfile.* ${libdir}/python3.5/__pycache__/tempfile.* ${libdir}/python3.5/StringIO.* ${libdir}/python3.5/__pycache__/StringIO.* ${libdir}/python3.5/io.* ${libdir}/python3.5/__pycache__/io.* ${libdir}/python3.5/_pyio.* ${libdir}/python3.5/__pycache__/_pyio.* "
+FILES_${PN}-io="${libdir}/python3.5/lib-dynload/_socket.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_socket.*.so ${libdir}/python3.5/lib-dynload/_io.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_io.*.so ${libdir}/python3.5/lib-dynload/_ssl.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_ssl.*.so ${libdir}/python3.5/lib-dynload/select.*.so ${libdir}/python3.5/lib-dynload/__pycache__/select.*.so ${libdir}/python3.5/lib-dynload/termios.*.so ${libdir}/python3.5/lib-dynload/__pycache__/termios.*.so ${libdir}/python3.5/lib-dynload/cStringIO.*.so ${libdir}/python3.5/lib-dynload/__pycache__/cStringIO.*.so ${libdir}/python3.5/ipaddress.* ${libdir}/python3.5/__pycache__/ipaddress.* ${libdir}/python3.5/pipes.* ${libdir}/python3.5/__pycache__/pipes.* ${libdir}/python3.5/socket.* ${libdir}/python3.5/__pycache__/socket.* ${libdir}/python3.5/ssl.* ${libdir}/python3.5/__pycache__/ssl.* ${libdir}/python3.5/tempfile.* ${libdir}/python3.5/__pycache__/tempfile.* ${libdir}/python3.5/StringIO.* ${libdir}/python3.5/__pycache__/StringIO.* ${libdir}/python3.5/io.* ${libdir}/python3.5/__pycache__/io.* ${libdir}/python3.5/_pyio.* ${libdir}/python3.5/__pycache__/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 1a06896b5c..55bda1973f 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -289,7 +289,7 @@ if __name__ == "__main__":
 
     m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math",
     "lib-dynload/_socket.*.so lib-dynload/_io.*.so lib-dynload/_ssl.*.so lib-dynload/select.*.so lib-dynload/termios.*.so lib-dynload/cStringIO.*.so " +
-    "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
+    "ipaddress.* pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
     m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
     "json lib-dynload/_json.*.so" ) # package
-- 
2.11.0


