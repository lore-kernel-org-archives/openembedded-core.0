Return-Path: <matt@console-pimps.org>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1E77465ED7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 16:10:45 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so8114174wib.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jun 2014 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=SEbP8CP4gWBIvLW1Zfu5TwnasU16+z0XLCy9DHpUTz4=;
	b=ltAK3fA0eyFV2ak2F7JkXYYKV4A8k7NGEC2wh5do+ZtzQ8WSgfzjRkuiATtqr0F+yW
	Zk5Qkzkda+0NOuOkkGfoVl8HPRrHO2hfg8bJczxgaioTN2rfyI9RG2wiLVD4DoYV5dp3
	Eyd4jq3JODCJev3uRc/o2KVlFlCUPuZGOGiFOImuVOyOfnstYxdVquYjdJHm3iV5/x5g
	EMndjM50MIUMHLs78IB/J3cVPlKy9efPXOBaqOwVtErCHBeVVZXUaQ+JfkLvVbV5g4je
	p+YMHeGrHVE72EDJHLN/fQn2ZR6vnuSrb/8HSEXW5bSntOcby1wA+fYNCNNMDUWMkefG
	ZTzw==
X-Gm-Message-State: ALoCoQleCKxOaJOKd8ZJfCpzStTR4U4mtXdz4036ua5D75b9x13qE75ir1CgnXUbdjQhSgJPsy5P
X-Received: by 10.180.76.179 with SMTP id l19mr6742614wiw.43.1401898245411;
	Wed, 04 Jun 2014 09:10:45 -0700 (PDT)
Received: from localhost ([90.207.204.193]) by mx.google.com with ESMTPSA id
	gu2sm27782440wib.14.2014.06.04.09.10.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 09:10:44 -0700 (PDT)
From: Matt Fleming <matt@console-pimps.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jun 2014 17:10:38 +0100
Message-Id: <1401898238-18043-3-git-send-email-matt@console-pimps.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1401898238-18043-1-git-send-email-matt@console-pimps.org>
References: <1401898238-18043-1-git-send-email-matt@console-pimps.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Matt Fleming <matt.fleming@intel.com>
Subject: [PATCH 2/2] generate-manifest-3.3.py: Add importlib
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
X-List-Received-Date: Wed, 04 Jun 2014 16:10:46 -0000

From: Matt Fleming <matt.fleming@intel.com>

importlib isn't currently included in any of the python packages, so
create a new one for recipes that require it.

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/recipes-devtools/python/python-3.3-manifest.inc | 10 +++++++---
 scripts/contrib/python/generate-manifest-3.3.py      |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.3-manifest.inc
index ea56970..46a2d44 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.3-manifest.inc
@@ -5,9 +5,9 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
+PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc "
 
-PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
+PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
 SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
@@ -105,6 +105,10 @@ SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python3.3/colorsys.* ${libdir}/python3.3/imghdr.* ${libdir}/python3.3/lib-dynload/imageop.*.so ${libdir}/python3.3/lib-dynload/rgbimg.*.so "
 
+SUMMARY_${PN}-importlib="Python import implementation library"
+RDEPENDS_${PN}-importlib="${PN}-core"
+FILES_${PN}-importlib="${libdir}/python3.3/importlib "
+
 SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
 FILES_${PN}-io="${libdir}/python3.3/lib-dynload/_socket.*.so ${libdir}/python3.3/lib-dynload/_io.*.so ${libdir}/python3.3/lib-dynload/_ssl.*.so ${libdir}/python3.3/lib-dynload/select.*.so ${libdir}/python3.3/lib-dynload/termios.*.so ${libdir}/python3.3/lib-dynload/cStringIO.*.so ${libdir}/python3.3/pipes.* ${libdir}/python3.3/socket.* ${libdir}/python3.3/ssl.* ${libdir}/python3.3/tempfile.* ${libdir}/python3.3/StringIO.* ${libdir}/python3.3/io.* ${libdir}/python3.3/_pyio.* "
@@ -254,7 +258,7 @@ RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python3.3/xmlrpclib.* ${libdir}/python3.3/SimpleXMLRPCServer.* ${libdir}/python3.3/DocXMLRPCServer.* ${libdir}/python3.3/xmlrpc "
 
 SUMMARY_${PN}-modules="All Python modules"
-RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
+RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-importlib ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
 
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 1586c46..288def2 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -261,6 +261,9 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
+    m.addPackage( "${PN}-importlib", "Python import implementation library", "${PN}-core",
+    "importlib" )
+
     m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/_gdbm.*.so" )
 
-- 
1.9.0


