Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id EBC4A77332
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 09:06:27 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id v186so158698202lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=51kQtai3EuFpvo6SMCejxxJYuFlpppiIAuRhbovjtY4=;
	b=zTMNtGVOQfFRsCkKAVWNbGzECUq2oQrDieUv2cK8ZxmR5yTh+vEU7tL9lAYiEZtuHc
	QlMGBAhvI6DOk+iI0TGRCPj/NtStxpRyPls90rC4ACbaM5nOzgBiIwr07aL6WvZ+Aq8W
	MBKkcu5EtevSMUBXR91oc8zXStckjLQzgTHqr+GT1YmEKpTiGgREtDKj5hXg/J/azTim
	zsKo3TeSbliy3NNzjLaXuLmuRp6Xs49x+btJ3g86eTNFPlv+C+TO3IdsnP7jzd1fiwvk
	Sstu3OwpoHxkXiq38JYpp7XctOcmNGAWRjNoYHZLsjLtSjMri7oDXaN+RkPo15PdNpoI
	a+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=51kQtai3EuFpvo6SMCejxxJYuFlpppiIAuRhbovjtY4=;
	b=iy6bXUbspClJ6SOIXj9zMpfVl9LL+j5rp0+1+JIbtjuTxi1tS2gLspbc18KNQkqaU4
	m4BeftbSvpSf94zbdtupDaOv2j8tbxrQtzqznGc4lTza3ylOwJ6oJ2EzS7tHbC/3sN/W
	J78YLQnDmFW921Sc7bDSSorZ3X/lqIPIQ3OA0fu2NwgVzNV6r9nzpnz3XRMTc8b8J/2C
	JJRd9veF46d76lumZaF0nQNwQWa3WfhzIpcWyemP6E3R+K4N0DLc8VhVKpA+8pUMxr6W
	i6GvkH329MrHkGLR8lVP2ViC+XCAtB1RvQ2pPnxDROSOYbFbq0SEkzheDK/MhA1to/V1
	3qmg==
X-Gm-Message-State: AIkVDXK6OSq7TcGVvLK7njmTy5/lD6FNZzuo75CN/tuICa3W/EF1whElRe4AhYwTO6KJag==
X-Received: by 10.46.83.19 with SMTP id h19mr2724413ljb.72.1485507987552;
	Fri, 27 Jan 2017 01:06:27 -0800 (PST)
Received: from localhost (194-237-220-218.customer.telia.com.
	[194.237.220.218]) by smtp.gmail.com with ESMTPSA id
	i186sm1120275lfg.38.2017.01.27.01.06.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 27 Jan 2017 01:06:26 -0800 (PST)
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 10:06:02 +0100
Message-Id: <c1df0e8de6d4bf01952748016a285259a0aac448.1485505681.git.anders@chargestorm.se>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1485505680.git.anders@chargestorm.se>
References: <cover.1485505680.git.anders@chargestorm.se>
Subject: [PATCH 7/7] python-3-manifest: split out typing
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
X-List-Received-Date: Fri, 27 Jan 2017 09:06:28 -0000

This allows us to use typing.py without having to add the whole
python3-misc package.

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/recipes-devtools/python/python-3.5-manifest.inc | 10 +++++++---
 scripts/contrib/python/generate-manifest-3.5.py      |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
index d4c7c4d1b1..a53a8d5d1f 100644
--- a/meta/recipes-devtools/python/python-3.5-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
@@ -5,9 +5,9 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -257,6 +257,10 @@ SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
 FILES_${PN}-tkinter="${libdir}/python3.5/lib-dynload/_tkinter.*.so ${libdir}/python3.5/lib-dynload/__pycache__/_tkinter.*.so ${libdir}/python3.5/lib-tk ${libdir}/python3.5/lib-tk/__pycache__ ${libdir}/python3.5/tkinter ${libdir}/python3.5/tkinter/__pycache__ "
 
+SUMMARY_${PN}-typing="Python typing support"
+RDEPENDS_${PN}-typing="${PN}-core"
+FILES_${PN}-typing="${libdir}/python3.5/typing.* ${libdir}/python3.5/__pycache__/typing.* "
+
 SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell"
 FILES_${PN}-unittest="${libdir}/python3.5/unittest/ ${libdir}/python3.5/unittest/__pycache__ "
@@ -274,7 +278,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python3.5/xmlrpclib.* ${libdir}/python3.5/__pycache__/xmlrpclib.* ${libdir}/python3.5/SimpleXMLRPCServer.* ${libdir}/python3.5/__pycache__/SimpleXMLRPCServer.* ${libdir}/python3.5/DocXMLRPCServer.* ${libdir}/python3.5/__pycache__/DocXMLRPCServer.* ${libdir}/python3.5/xmlrpc ${libdir}/python3.5/xmlrpc/__pycache__ "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-argparse ${PN}-asyncio ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-email ${PN}-enum ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-reprlib ${PN}-resource ${PN}-selectors ${PN}-shell ${PN}-signal ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-typing ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
index 55bda1973f..5e2eeb7bef 100755
--- a/scripts/contrib/python/generate-manifest-3.5.py
+++ b/scripts/contrib/python/generate-manifest-3.5.py
@@ -388,6 +388,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
     "lib-dynload/_tkinter.*.so lib-tk tkinter" ) # package
 
+    m.addPackage( "${PN}-typing", "Python typing support", "${PN}-core",
+    "typing.*" )
+
     m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
     "unittest/" )
 
-- 
2.11.0


