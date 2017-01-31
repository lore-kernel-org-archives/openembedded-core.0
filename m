Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id D2DCD72001
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:18:26 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id n124so206156064lfd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WTj9Z7oUFy3W6/hZdjFewRV6wRDU6C1t778lifHEqh4=;
	b=grgAJZ/O1GZhUogLPNwFom28S7VrmFG/huBrxWw5fvcOKNCkYIEH14Xdd4c8mS6g6b
	wJEDr+7l42N1Kjopm6aWUxfYfSBbgg7YInoILmrdlJkpYDBZV3KCiw4LjATb5FYT8OQ0
	s40PFYla8bT7oKax5Ibn01yo4QHzD5vfRZt6kmdTiKbJo2e4gso5CF6lW/1ZPvWYBTnx
	C5Ty1JCaZX0rdZE1ZRgbdxYrenlZHP8mWNehVlO+EbFNk/WFbLkQVKlVP77N3oif7ViY
	OW73ZgXluwWEB9gOg/cotKr1CCAqeA9r19BNkxUFoBuBVYBjGRkj4lOAMbDIWt65n5Pc
	qf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WTj9Z7oUFy3W6/hZdjFewRV6wRDU6C1t778lifHEqh4=;
	b=O5nFZDYd4gFMY99eKFIo0N7FxpYqxB6nQHgiz/vVicoiS2szJPjIW/t1c+oDlfElGe
	cbden9WFqEyiG93EbUvdhBUSeBxmGYvNhoA+5E+xdkkpj73QdgaNuBNJUUa1BXrvSlhS
	fTMC9fYBq2xDrysaoUEi32n9Aib2OgTZEb3Ll5K+5MWZD2l8HOf+e3yvKUZXZoZ7oSFF
	PEYLvoO3mcgkcksnKUMljXpSpJcE5bNDv5wiuBKd1oV1CkTHPnDuhDwlz7QqUl4+MQ3+
	XHY7Q6o+sRb+Yk/7lQsK6AALWAf+YlUZ+cupfv1yJOMdVUc4R/MpmOZ7ZQRKO/T6tkdy
	idgw==
X-Gm-Message-State: AIkVDXLX7/OviT4fJNnoof61Ck1D7vIwhg7w48bBphbmWIR/OEX6ExwWrWVyeU+LyjUwiQ==
X-Received: by 10.25.206.146 with SMTP id e140mr8765776lfg.94.1485847105869;
	Mon, 30 Jan 2017 23:18:25 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id 28sm4328067ljw.17.2017.01.30.23.18.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:18:24 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 08:18:15 +0100
Message-Id: <d1e89104fff0c1a1ae1574770a86ca241cd7f577.1485846907.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485846907.git.anders@chargestorm.se>
References: <cover.1485846907.git.anders@chargestorm.se>
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v2 6/7] python-3-manifest: add ipaddress to python3-io
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
X-List-Received-Date: Tue, 31 Jan 2017 07:18:27 -0000

This allows us to use ipaddress without requiring the add the whole
python3-misc.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index 8b64069..d4c7c4d 100644
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
index 1a06896..55bda19 100755
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
2.10.2


