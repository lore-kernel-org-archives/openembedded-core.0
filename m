Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7700B72544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 16:47:25 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so10020986pdi.21
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Dec 2014 08:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Be/PxhyWUoc7muYW3P0ex06znWI2D9Br5XfmFSvHrQ8=;
	b=gH99xiJBmwiJMf+Lwr3Piq7kOUf6FMQywqy79OhyQEbnzLBuhdE+aD11TtClDq/iIR
	LYunvj33aSsK3aeOu1a4k4KttXKfovoV+wQ47Y1CAIf4KWD8cIxYAQ8rxDLbb8VSky+j
	ElN6PSMF5vqFtOzc6aFarnGxyxu0Ebdr/K08yJQ2GPnpyaSD0TDkZ0LpsdqugM4byuJO
	ulTji6l0qD/frtpk+OjLJO+QZGjCtxDHUODjorN3iOG4Ij+3IEgvsWqUpk0GxOxIBZHf
	YXKnAy9DrHn71wnJRdiWnxMPnA3oby1oFxsfyI7wRhNyZ+xfwA6n1gYllP705jHJQuxV
	0k6A==
X-Received: by 10.68.57.225 with SMTP id l1mr51951055pbq.87.1418662045635;
	Mon, 15 Dec 2014 08:47:25 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id co1sm9734660pbc.22.2014.12.15.08.47.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 15 Dec 2014 08:47:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Dec 2014 08:47:12 -0800
Message-Id: <a2ec3bb12f3b91e6812e9d87b80a1ed5a6b99e38.1418661484.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <22af9154ebaf84f17b9356f593b8f5f5ada7ef81.1418661484.git.akuster808@gmail.com>
References: <22af9154ebaf84f17b9356f593b8f5f5ada7ef81.1418661484.git.akuster808@gmail.com>
In-Reply-To: <cover.1418661484.git.akuster808@gmail.com>
References: <cover.1418661484.git.akuster808@gmail.com>
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 2/2] python: fix ssl import error
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
X-List-Received-Date: Mon, 15 Dec 2014 16:47:25 -0000

From: "Maxin B. John" <maxin.john@enea.com>

Fix this ssl import error:
Python 2.7.3 (default, Dec  5 2014, 16:24:17)
[GCC 4.9.1] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import ssl
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python2.7/ssl.py", line 92, in <module>
    import base64        # for DER-to-PEM translation
ImportError: No module named base64

(From OE-Core rev: dfa34e70a4c7543dc67835c2e9a270ccd011ac72)

Signed-off-by: Maxin B. John <maxin.john@enea.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-
 scripts/contrib/python/generate-manifest-2.7.py      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index a8afe13..9a514b1 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -122,7 +122,7 @@ RDEPENDS_${PN}-importlib="${PN}-core"
 FILES_${PN}-importlib="${libdir}/python2.7/importlib "
 
 SUMMARY_${PN}-io="Python low-level I/O"
-RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils"
+RDEPENDS_${PN}-io="${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient"
 FILES_${PN}-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_io.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* ${libdir}/python2.7/io.* ${libdir}/python2.7/_pyio.* "
 
 SUMMARY_${PN}-json="Python JSON support"
diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 65486d8..21b874f 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -275,7 +275,7 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils",
+    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils ${PN}-netclient",
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-- 
1.9.1


