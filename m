Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S7pkt-0002BL-9s
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 16:04:47 +0100
Received: by eaae1 with SMTP id e1so895313eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=IpqOQkGou2HPkvPAwrIB895Quh1sNDUkPW822+oKjXo=;
	b=JHp7bO3WTir1QF6eTS2/HEHX2MtOYR99rRau5UjkSETZ/niPDLyVwKaXVvWVWkwxtr
	8ggUstQI49/yxkghXlYJkcJEzfkoiFqaYoA7AskprXFvQyv4B+7vu6WVCeMdJorwqYir
	RW9MFxvccUv1N4cFrVWvuoW9BVcXIl1Pu5qZp7sl/YUGArBsovnvkxMM0+6UVYLfdGUw
	FlhLvtXcWSI4v5J3m76ijFoRg4x1ddbR9kb4rAFaivuke2rwV3wknThsr1q2qoK7/DiB
	OwxxCsuvXO5FEScV2ICgpVe+lZlaCD0n3rJIvMyAQeB5jt/gc6lOqyDTk0gQz2DNO/9h
	2t9g==
Received: by 10.14.94.141 with SMTP id n13mr427534eef.15.1331736962145;
	Wed, 14 Mar 2012 07:56:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y11sm14261659eem.3.2012.03.14.07.56.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Mar 2012 07:56:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 15:55:53 +0100
Message-Id: <1331736953-19464-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] python: regenerate python-2.7-manifest.inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 15:04:47 -0000

* only manual change is extra line break in FILES_${PN}-core, because
  git send-email doesn't like long lines
  fatal: /tmp/0wfyzTvlIf/0001-python-regenerate-python-2.7-manifest.inc.patch: 30: patch contains a line longer than 998 characters

* fixes PROVIDES and it will be easier to review next patch without this
  extra changes

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../python/python-2.7-manifest.inc                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python-2.7-manifest.inc b/meta/recipes-devtools/python/python-2.7-manifest.inc
index 5f8b7cf..3193565 100644
--- a/meta/recipes-devtools/python/python-2.7-manifest.inc
+++ b/meta/recipes-devtools/python/python-2.7-manifest.inc
@@ -5,7 +5,7 @@
 
  
 
-PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
+PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-distutils-staticdev ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
 PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
@@ -80,7 +80,7 @@ FILES_${PN}-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils
 
 DESCRIPTION_${PN}-distutils-staticdev="Python Distribution Utilities (Static Libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
-FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a"
+FILES_${PN}-distutils-staticdev="${libdir}/python2.7/config/lib*.a "
 
 DESCRIPTION_${PN}-doctest="Python framework for running examples in docstrings."
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
-- 
1.7.8.5



