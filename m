Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1PwhdQ-000769-Iy
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Mar 2011 22:06:34 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 07 Mar 2011 13:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,279,1297065600"; d="scan'208";a="664780757"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by fmsmga002.fm.intel.com with ESMTP; 07 Mar 2011 13:02:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Mon, 7 Mar 2011 13:02:42 -0800
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Mon, 7 Mar 2011 13:02:42 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2011 13:02:40 -0800
Thread-Topic: [OE-core] [PATCH] python: add generate-manifest-2.6.py script
	and regen python-2.6-manifest.inc
Thread-Index: AcvcAs74XwPiCgx9TNOx3DPzS4boFAA9Bc3Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE9431E288F7@orsmsx504.amr.corp.intel.com>
References: <1299315707-17264-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1299315707-17264-1-git-send-email-Martin.Jansa@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] python: add generate-manifest-2.6.py script and regen python-2.6-manifest.inc
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
X-List-Received-Date: Mon, 07 Mar 2011 21:06:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

  I see ${PN}-devel has been changed to ${PN}-dev
  Other than that all the python sub packages are preserved. Also build of =
python packages are working fine with this change.

Acked By: Nitin A Kamble <nitin.a.kamble@intel.com>

Thanks,
Nitin



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Saturday, March 05, 2011 1:02 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] python: add generate-manifest-2.6.py script
> and regen python-2.6-manifest.inc
>
> * imported from OE with sorted entries etc
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../python/python-2.6-manifest.inc                 |  344 ++++++++++--
> -------
>  meta/recipes-devtools/python/python.inc            |    2 +-
>  scripts/contrib/python/generate-manifest-2.6.py    |  362
> ++++++++++++++++++++
>  3 files changed, 538 insertions(+), 170 deletions(-)
>  create mode 100755 scripts/contrib/python/generate-manifest-2.6.py
>
> diff --git a/meta/recipes-devtools/python/python-2.6-manifest.inc
> b/meta/recipes-devtools/python/python-2.6-manifest.inc
> index 282cb0e..e4e503c 100644
> --- a/meta/recipes-devtools/python/python-2.6-manifest.inc
> +++ b/meta/recipes-devtools/python/python-2.6-manifest.inc
> @@ -1,195 +1,209 @@
>
>  # WARNING: This file is AUTO GENERATED: Manual edits will be lost next
> time I regenerate the file.
> -# Generator: '../../contrib/python/generate-manifest-2.6.py' Version
> 20091004 (C) 2002-2009 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
> +# Generator: '../../../scripts/contrib/python/generate-manifest-
> 2.6.py' Version 20110222 (C) 2002-2010 Michael 'Mickey' Lauer
> <mlauer@vanille-media.de>
>  # Visit the Python for Embedded Systems Site =3D>
> http://www.Vanille.de/projects/python.spy
>
> -PROVIDES+=3D"${PN}-profile ${PN}-threading ${PN}-distutils ${PN}-doctest
> ${PN}-stringold ${PN}-codecs ${PN}-ctypes ${PN}-pickle ${PN}-datetime
> ${PN}-core ${PN}-io ${PN}-compiler ${PN}-compression ${PN}-re ${PN}-
> xmlrpc ${PN}-terminal ${PN}-email ${PN}-image ${PN}-tests ${PN}-core-
> dbg ${PN}-resource ${PN}-json ${PN}-devel ${PN}-difflib ${PN}-math
> ${PN}-syslog ${PN}-hotshot ${PN}-unixadmin ${PN}-textutils ${PN}-
> tkinter ${PN}-gdbm ${PN}-elementtree ${PN}-fcntl ${PN}-netclient ${PN}-
> pprint ${PN}-netserver ${PN}-curses ${PN}-smtpd ${PN}-html ${PN}-
> readline ${PN}-subprocess ${PN}-pydoc ${PN}-logging ${PN}-mailbox
> ${PN}-xml ${PN}-mime ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-unittest
> ${PN}-multiprocessing ${PN}-robotparser ${PN}-compile ${PN}-debugger
> ${PN}-pkgutil ${PN}-shell ${PN}-bsddb ${PN}-mmap ${PN}-zlib ${PN}-db
> ${PN}-crypt ${PN}-idle ${PN}-lang ${PN}-audio "
> +
>
> -PACKAGES=3D"${PN}-core-dbg ${PN}-profile ${PN}-threading ${PN}-distutils
> ${PN}-doctest ${PN}-stringold ${PN}-codecs ${PN}-ctypes ${PN}-pickle
> ${PN}-datetime ${PN}-core ${PN}-io ${PN}-compiler ${PN}-compression
> ${PN}-re ${PN}-xmlrpc ${PN}-terminal ${PN}-email ${PN}-image ${PN}-
> tests ${PN}-resource ${PN}-json ${PN}-devel ${PN}-difflib ${PN}-math
> ${PN}-syslog ${PN}-hotshot ${PN}-unixadmin ${PN}-textutils ${PN}-
> tkinter ${PN}-gdbm ${PN}-elementtree ${PN}-fcntl ${PN}-netclient ${PN}-
> pprint ${PN}-netserver ${PN}-curses ${PN}-smtpd ${PN}-html ${PN}-
> readline ${PN}-subprocess ${PN}-pydoc ${PN}-logging ${PN}-mailbox
> ${PN}-xml ${PN}-mime ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-unittest
> ${PN}-multiprocessing ${PN}-robotparser ${PN}-compile ${PN}-debugger
> ${PN}-pkgutil ${PN}-shell ${PN}-bsddb ${PN}-mmap ${PN}-zlib ${PN}-db
> ${PN}-crypt ${PN}-idle ${PN}-lang ${PN}-audio ${PN}-modules"
> +PROVIDES+=3D"${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-
> compiler ${PN}-compression ${PN}-core ${PN}-core-dbg ${PN}-crypt ${PN}-
> ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev
> ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-
> email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-
> image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-
> math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-
> netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-
> profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-
> robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests
> ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-
> tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest
> ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
>
> -DESCRIPTION_${PN}-profile=3D"Python Basic Profiling Support"
> -RDEPENDS_${PN}-profile=3D"${PN}-core ${PN}-textutils"
> -FILES_${PN}-profile=3D"${libdir}/python2.6/profile.*
> ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.*
> ${libdir}/python2.6/lib-dynload/_lsprof.so "
> -
> -DESCRIPTION_${PN}-threading=3D"Python Threading & Synchronization
> Support"
> -RDEPENDS_${PN}-threading=3D"${PN}-core ${PN}-lang"
> -FILES_${PN}-threading=3D"${libdir}/python2.6/_threading_local.*
> ${libdir}/python2.6/dummy_thread.*
> ${libdir}/python2.6/dummy_threading.* ${libdir}/python2.6/mutex.*
> ${libdir}/python2.6/threading.* ${libdir}/python2.6/Queue.* "
> -
> -DESCRIPTION_${PN}-distutils=3D"Python Distribution Utilities"
> -RDEPENDS_${PN}-distutils=3D"${PN}-core"
> -FILES_${PN}-distutils=3D"${libdir}/python2.6/config
> ${libdir}/python2.6/distutils "
> +PACKAGES=3D"${PN}-core-dbg ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-
> compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-
> ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev
> ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-
> email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-
> image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-
> math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-
> netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-
> profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-
> robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests
> ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-
> tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest
> ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
>
> -DESCRIPTION_${PN}-doctest=3D"Python framework for running examples in
> docstrings."
> -RDEPENDS_${PN}-doctest=3D"${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-
> unittest ${PN}-debugger ${PN}-difflib"
> -FILES_${PN}-doctest=3D"${libdir}/python2.6/doctest.* "
> +DESCRIPTION_${PN}-audio=3D"Python Audio Handling"
> +RDEPENDS_${PN}-audio=3D"${PN}-core"
> +FILES_${PN}-audio=3D"${libdir}/python2.6/wave.*
> ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.*
> ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-
> dynload/audioop.so "
>
> -DESCRIPTION_${PN}-stringold=3D"Python String APIs [deprecated]"
> -RDEPENDS_${PN}-stringold=3D"${PN}-core ${PN}-re"
> -FILES_${PN}-stringold=3D"${libdir}/python2.6/lib-dynload/strop.so
> ${libdir}/python2.6/string.* "
> +DESCRIPTION_${PN}-bsddb=3D"Python Berkeley Database Bindings"
> +RDEPENDS_${PN}-bsddb=3D"${PN}-core"
> +FILES_${PN}-bsddb=3D"${libdir}/python2.6/bsddb ${libdir}/python2.6/lib-
> dynload/_bsddb.so "
>
>  DESCRIPTION_${PN}-codecs=3D"Python Codecs, Encodings & i18n Support"
>  RDEPENDS_${PN}-codecs=3D"${PN}-core ${PN}-lang"
>  FILES_${PN}-codecs=3D"${libdir}/python2.6/codecs.*
> ${libdir}/python2.6/encodings ${libdir}/python2.6/gettext.*
> ${libdir}/python2.6/locale.* ${libdir}/python2.6/lib-dynload/_locale.so
> ${libdir}/python2.6/lib-dynload/unicodedata.so
> ${libdir}/python2.6/stringprep.* ${libdir}/python2.6/xdrlib.* "
>
> +DESCRIPTION_${PN}-compile=3D"Python Bytecode Compilation Support"
> +RDEPENDS_${PN}-compile=3D"${PN}-core"
> +FILES_${PN}-compile=3D"${libdir}/python2.6/py_compile.*
> ${libdir}/python2.6/compileall.* "
> +
> +DESCRIPTION_${PN}-compiler=3D"Python Compiler Support"
> +RDEPENDS_${PN}-compiler=3D"${PN}-core"
> +FILES_${PN}-compiler=3D"${libdir}/python2.6/compiler "
> +
> +DESCRIPTION_${PN}-compression=3D"Python High Level Compression Support"
> +RDEPENDS_${PN}-compression=3D"${PN}-core ${PN}-zlib"
> +FILES_${PN}-compression=3D"${libdir}/python2.6/gzip.*
> ${libdir}/python2.6/zipfile.* ${libdir}/python2.6/tarfile.*
> ${libdir}/python2.6/lib-dynload/bz2.so "
> +
> +DESCRIPTION_${PN}-core=3D"Python Interpreter and core modules (needed!)"
> +RDEPENDS_${PN}-core=3D""
> +FILES_${PN}-core=3D"${libdir}/python2.6/__future__.*
> ${libdir}/python2.6/_abcoll.* ${libdir}/python2.6/abc.*
> ${libdir}/python2.6/copy.* ${libdir}/python2.6/copy_reg.*
> ${libdir}/python2.6/ConfigParser.* ${libdir}/python2.6/genericpath.*
> ${libdir}/python2.6/getopt.* ${libdir}/python2.6/linecache.*
> ${libdir}/python2.6/new.* ${libdir}/python2.6/os.*
> ${libdir}/python2.6/posixpath.* ${libdir}/python2.6/struct.*
> ${libdir}/python2.6/warnings.* ${libdir}/python2.6/site.*
> ${libdir}/python2.6/stat.* ${libdir}/python2.6/UserDict.*
> ${libdir}/python2.6/UserList.* ${libdir}/python2.6/UserString.*
> ${libdir}/python2.6/lib-dynload/binascii.so ${libdir}/python2.6/lib-
> dynload/_struct.so ${libdir}/python2.6/lib-dynload/time.so
> ${libdir}/python2.6/lib-dynload/xreadlines.so
> ${libdir}/python2.6/types.* ${libdir}/python2.6/platform.*
> ${bindir}/python* "
> +
> +DESCRIPTION_${PN}-core-dbg=3D"Python core module debug information"
> +RDEPENDS_${PN}-core-dbg=3D"${PN}-core"
> +FILES_${PN}-core-dbg=3D"${libdir}/python2.6/config/.debug
> ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug
> ${libdir}/.debug "
> +
> +DESCRIPTION_${PN}-crypt=3D"Python Basic Cryptographic and Hashing
> Support"
> +RDEPENDS_${PN}-crypt=3D"${PN}-core"
> +FILES_${PN}-crypt=3D"${libdir}/python2.6/hashlib.*
> ${libdir}/python2.6/md5.* ${libdir}/python2.6/sha.*
> ${libdir}/python2.6/lib-dynload/crypt.so ${libdir}/python2.6/lib-
> dynload/_hashlib.so ${libdir}/python2.6/lib-dynload/_sha256.so
> ${libdir}/python2.6/lib-dynload/_sha512.so "
> +
>  DESCRIPTION_${PN}-ctypes=3D"Python C Types Support"
>  RDEPENDS_${PN}-ctypes=3D"${PN}-core"
>  FILES_${PN}-ctypes=3D"${libdir}/python2.6/ctypes
> ${libdir}/python2.6/lib-dynload/_ctypes.so "
>
> -DESCRIPTION_${PN}-pickle=3D"Python Persistence Support"
> -RDEPENDS_${PN}-pickle=3D"${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
> -FILES_${PN}-pickle=3D"${libdir}/python2.6/pickle.*
> ${libdir}/python2.6/shelve.* ${libdir}/python2.6/lib-dynload/cPickle.so
> "
> +DESCRIPTION_${PN}-curses=3D"Python Curses Support"
> +RDEPENDS_${PN}-curses=3D"${PN}-core"
> +FILES_${PN}-curses=3D"${libdir}/python2.6/curses
> ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-
> dynload/_curses_panel.so "
>
>  DESCRIPTION_${PN}-datetime=3D"Python Calendar and Time support"
>  RDEPENDS_${PN}-datetime=3D"${PN}-core ${PN}-codecs"
>  FILES_${PN}-datetime=3D"${libdir}/python2.6/_strptime.*
> ${libdir}/python2.6/calendar.* ${libdir}/python2.6/lib-
> dynload/datetime.so "
>
> -DESCRIPTION_${PN}-core=3D"Python Interpreter and core modules (needed!)"
> -RDEPENDS_${PN}-core=3D""
> -FILES_${PN}-core=3D"${libdir}/python2.6/__future__.*
> ${libdir}/python2.6/_abcoll.* ${libdir}/python2.6/abc.*
> ${libdir}/python2.6/copy.* ${libdir}/python2.6/copy_reg.*
> ${libdir}/python2.6/ConfigParser.* ${libdir}/python2.6/genericpath.*
> ${libdir}/python2.6/getopt.* ${libdir}/python2.6/linecache.*
> ${libdir}/python2.6/new.* ${libdir}/python2.6/os.*
> ${libdir}/python2.6/posixpath.* ${libdir}/python2.6/struct.*
> ${libdir}/python2.6/warnings.* ${libdir}/python2.6/site.*
> ${libdir}/python2.6/stat.* ${libdir}/python2.6/UserDict.*
> ${libdir}/python2.6/UserList.* ${libdir}/python2.6/UserString.*
> ${libdir}/python2.6/lib-dynload/binascii.so ${libdir}/python2.6/lib-
> dynload/_struct.so ${libdir}/python2.6/lib-dynload/time.so
> ${libdir}/python2.6/lib-dynload/xreadlines.so
> ${libdir}/python2.6/types.* ${bindir}/python* "
> +DESCRIPTION_${PN}-db=3D"Python File-Based Database Support"
> +RDEPENDS_${PN}-db=3D"${PN}-core"
> +FILES_${PN}-db=3D"${libdir}/python2.6/anydbm.*
> ${libdir}/python2.6/dumbdbm.* ${libdir}/python2.6/whichdb.* "
>
> -DESCRIPTION_${PN}-io=3D"Python Low-Level I/O"
> -RDEPENDS_${PN}-io=3D"${PN}-core ${PN}-math"
> -FILES_${PN}-io=3D"${libdir}/python2.6/lib-dynload/_socket.so
> ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-
> dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so
> ${libdir}/python2.6/lib-dynload/cStringIO.so
> ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.*
> ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
> +DESCRIPTION_${PN}-debugger=3D"Python Debugger"
> +RDEPENDS_${PN}-debugger=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-re
> ${PN}-stringold ${PN}-shell ${PN}-pprint"
> +FILES_${PN}-debugger=3D"${libdir}/python2.6/bdb.*
> ${libdir}/python2.6/pdb.* "
>
> -DESCRIPTION_${PN}-compiler=3D"Python Compiler Support"
> -RDEPENDS_${PN}-compiler=3D"${PN}-core"
> -FILES_${PN}-compiler=3D"${libdir}/python2.6/compiler "
> +DESCRIPTION_${PN}-dev=3D"Python Development Package"
> +RDEPENDS_${PN}-dev=3D"${PN}-core"
> +FILES_${PN}-dev=3D"${includedir} ${libdir}/libpython2.6.so "
>
> -DESCRIPTION_${PN}-compression=3D"Python High Level Compression Support"
> -RDEPENDS_${PN}-compression=3D"${PN}-core ${PN}-zlib"
> -FILES_${PN}-compression=3D"${libdir}/python2.6/gzip.*
> ${libdir}/python2.6/zipfile.* ${libdir}/python2.6/tarfile.*
> ${libdir}/python2.6/lib-dynload/bz2.so "
> +DESCRIPTION_${PN}-difflib=3D"Python helpers for computing deltas between
> objects."
> +RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
> +FILES_${PN}-difflib=3D"${libdir}/python2.6/difflib.* "
>
> -DESCRIPTION_${PN}-re=3D"Python Regular Expression APIs"
> -RDEPENDS_${PN}-re=3D"${PN}-core"
> -FILES_${PN}-re=3D"${libdir}/python2.6/re.* ${libdir}/python2.6/sre.*
> ${libdir}/python2.6/sre_compile.* ${libdir}/python2.6/sre_constants*
> ${libdir}/python2.6/sre_parse.* "
> +DESCRIPTION_${PN}-distutils=3D"Python Distribution Utilities"
> +RDEPENDS_${PN}-distutils=3D"${PN}-core"
> +FILES_${PN}-distutils=3D"${libdir}/python2.6/config
> ${libdir}/python2.6/distutils "
>
> -DESCRIPTION_${PN}-xmlrpc=3D"Python XMLRPC Support"
> -RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml ${PN}-netserver ${PN}-
> lang"
> -FILES_${PN}-xmlrpc=3D"${libdir}/python2.6/xmlrpclib.*
> ${libdir}/python2.6/SimpleXMLRPCServer.* "
> +DESCRIPTION_${PN}-doctest=3D"Python framework for running examples in
> docstrings."
> +RDEPENDS_${PN}-doctest=3D"${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-
> unittest ${PN}-debugger ${PN}-difflib"
> +FILES_${PN}-doctest=3D"${libdir}/python2.6/doctest.* "
>
> -DESCRIPTION_${PN}-terminal=3D"Python Terminal Controlling Support"
> -RDEPENDS_${PN}-terminal=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-terminal=3D"${libdir}/python2.6/pty.*
> ${libdir}/python2.6/tty.* "
> +DESCRIPTION_${PN}-elementtree=3D"Python elementree"
> +RDEPENDS_${PN}-elementtree=3D"${PN}-core"
> +FILES_${PN}-elementtree=3D"${libdir}/python2.6/lib-
> dynload/_elementtree.so "
>
>  DESCRIPTION_${PN}-email=3D"Python Email Support"
>  RDEPENDS_${PN}-email=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-
> audio ${PN}-image ${PN}-netclient"
>  FILES_${PN}-email=3D"${libdir}/python2.6/imaplib.*
> ${libdir}/python2.6/email "
>
> +DESCRIPTION_${PN}-fcntl=3D"Python's fcntl Interface"
> +RDEPENDS_${PN}-fcntl=3D"${PN}-core"
> +FILES_${PN}-fcntl=3D"${libdir}/python2.6/lib-dynload/fcntl.so "
> +
> +DESCRIPTION_${PN}-gdbm=3D"Python GNU Database Support"
> +RDEPENDS_${PN}-gdbm=3D"${PN}-core"
> +FILES_${PN}-gdbm=3D"${libdir}/python2.6/lib-dynload/gdbm.so "
> +
> +DESCRIPTION_${PN}-hotshot=3D"Python Hotshot Profiler"
> +RDEPENDS_${PN}-hotshot=3D"${PN}-core"
> +FILES_${PN}-hotshot=3D"${libdir}/python2.6/hotshot
> ${libdir}/python2.6/lib-dynload/_hotshot.so "
> +
> +DESCRIPTION_${PN}-html=3D"Python HTML Processing"
> +RDEPENDS_${PN}-html=3D"${PN}-core"
> +FILES_${PN}-html=3D"${libdir}/python2.6/formatter.*
> ${libdir}/python2.6/htmlentitydefs.* ${libdir}/python2.6/htmllib.*
> ${libdir}/python2.6/markupbase.* ${libdir}/python2.6/sgmllib.* "
> +
> +DESCRIPTION_${PN}-idle=3D"Python Integrated Development Environment"
> +RDEPENDS_${PN}-idle=3D"${PN}-core ${PN}-tkinter"
> +FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python2.6/idlelib "
> +
>  DESCRIPTION_${PN}-image=3D"Python Graphical Image Handling"
>  RDEPENDS_${PN}-image=3D"${PN}-core"
>  FILES_${PN}-image=3D"${libdir}/python2.6/colorsys.*
> ${libdir}/python2.6/imghdr.* ${libdir}/python2.6/lib-dynload/imageop.so
> ${libdir}/python2.6/lib-dynload/rgbimg.so "
>
> -DESCRIPTION_${PN}-tests=3D"Python Tests"
> -RDEPENDS_${PN}-tests=3D"${PN}-core"
> -FILES_${PN}-tests=3D"${libdir}/python2.6/test "
> -
> -DESCRIPTION_${PN}-core-dbg=3D"Python core module debug information"
> -RDEPENDS_${PN}-core-dbg=3D"${PN}-core"
> -FILES_${PN}-core-dbg=3D"${libdir}/python2.6/config/.debug
> ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug
> ${libdir}/.debug "
> -
> -DESCRIPTION_${PN}-resource=3D"Python Resource Control Interface"
> -RDEPENDS_${PN}-resource=3D"${PN}-core"
> -FILES_${PN}-resource=3D"${libdir}/python2.6/lib-dynload/resource.so "
> +DESCRIPTION_${PN}-io=3D"Python Low-Level I/O"
> +RDEPENDS_${PN}-io=3D"${PN}-core ${PN}-math"
> +FILES_${PN}-io=3D"${libdir}/python2.6/lib-dynload/_socket.so
> ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-
> dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so
> ${libdir}/python2.6/lib-dynload/cStringIO.so
> ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.*
> ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.*
> ${libdir}/python2.6/StringIO.* "
>
>  DESCRIPTION_${PN}-json=3D"Python JSON Support"
>  RDEPENDS_${PN}-json=3D"${PN}-core ${PN}-math ${PN}-re"
>  FILES_${PN}-json=3D"${libdir}/python2.6/json "
>
> -DESCRIPTION_${PN}-devel=3D"Python Development Package"
> -RDEPENDS_${PN}-devel=3D"${PN}-core"
> -FILES_${PN}-devel=3D"${includedir} ${libdir}/libpython2.6.so
> ${libdir}/python2.6/config "
> +DESCRIPTION_${PN}-lang=3D"Python Low-Level Language Support"
> +RDEPENDS_${PN}-lang=3D"${PN}-core"
> +FILES_${PN}-lang=3D"${libdir}/python2.6/lib-dynload/_bisect.so
> ${libdir}/python2.6/lib-dynload/_collections.so
> ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-
> dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so
> ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-
> dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so
> ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.*
> ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.*
> ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.*
> ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.*
> ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.*
> ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.*
> ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.*
> ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.*
> ${libdir}/python2.6/traceback.* ${libdir}/python2.6/weakref.* "
>
> -DESCRIPTION_${PN}-difflib=3D"Python helpers for computing deltas between
> objects."
> -RDEPENDS_${PN}-difflib=3D"${PN}-lang ${PN}-re"
> -FILES_${PN}-difflib=3D"${libdir}/python2.6/difflib.* "
> +DESCRIPTION_${PN}-logging=3D"Python Logging Support"
> +RDEPENDS_${PN}-logging=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle
> ${PN}-stringold"
> +FILES_${PN}-logging=3D"${libdir}/python2.6/logging "
> +
> +DESCRIPTION_${PN}-mailbox=3D"Python Mailbox Format Support"
> +RDEPENDS_${PN}-mailbox=3D"${PN}-core ${PN}-mime"
> +FILES_${PN}-mailbox=3D"${libdir}/python2.6/mailbox.* "
>
>  DESCRIPTION_${PN}-math=3D"Python Math Support"
>  RDEPENDS_${PN}-math=3D"${PN}-core"
>  FILES_${PN}-math=3D"${libdir}/python2.6/lib-dynload/cmath.so
> ${libdir}/python2.6/lib-dynload/math.so ${libdir}/python2.6/lib-
> dynload/_random.so ${libdir}/python2.6/random.*
> ${libdir}/python2.6/sets.* "
>
> -DESCRIPTION_${PN}-syslog=3D"Python Syslog Interface"
> -RDEPENDS_${PN}-syslog=3D"${PN}-core"
> -FILES_${PN}-syslog=3D"${libdir}/python2.6/lib-dynload/syslog.so "
> -
> -DESCRIPTION_${PN}-hotshot=3D"Python Hotshot Profiler"
> -RDEPENDS_${PN}-hotshot=3D"${PN}-core"
> -FILES_${PN}-hotshot=3D"${libdir}/python2.6/hotshot
> ${libdir}/python2.6/lib-dynload/_hotshot.so "
> -
> -DESCRIPTION_${PN}-unixadmin=3D"Python Unix Administration Support"
> -RDEPENDS_${PN}-unixadmin=3D"${PN}-core"
> -FILES_${PN}-unixadmin=3D"${libdir}/python2.6/lib-dynload/nis.so
> ${libdir}/python2.6/lib-dynload/grp.so ${libdir}/python2.6/lib-
> dynload/pwd.so ${libdir}/python2.6/getpass.* "
> -
> -DESCRIPTION_${PN}-textutils=3D"Python Option Parsing, Text Wrapping and
> Comma-Separated-Value Support"
> -RDEPENDS_${PN}-textutils=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-
> stringold"
> -FILES_${PN}-textutils=3D"${libdir}/python2.6/lib-dynload/_csv.so
> ${libdir}/python2.6/csv.* ${libdir}/python2.6/optparse.*
> ${libdir}/python2.6/textwrap.* "
> -
> -DESCRIPTION_${PN}-tkinter=3D"Python Tcl/Tk Bindings"
> -RDEPENDS_${PN}-tkinter=3D"${PN}-core"
> -FILES_${PN}-tkinter=3D"${libdir}/python2.6/lib-dynload/_tkinter.so
> ${libdir}/python2.6/lib-tk "
> -
> -DESCRIPTION_${PN}-gdbm=3D"Python GNU Database Support"
> -RDEPENDS_${PN}-gdbm=3D"${PN}-core"
> -FILES_${PN}-gdbm=3D"${libdir}/python2.6/lib-dynload/gdbm.so "
> +DESCRIPTION_${PN}-mime=3D"Python MIME Handling APIs"
> +RDEPENDS_${PN}-mime=3D"${PN}-core ${PN}-io"
> +FILES_${PN}-mime=3D"${libdir}/python2.6/mimetools.*
> ${libdir}/python2.6/uu.* ${libdir}/python2.6/quopri.*
> ${libdir}/python2.6/rfc822.* "
>
> -DESCRIPTION_${PN}-elementtree=3D"Python elementree"
> -RDEPENDS_${PN}-elementtree=3D"${PN}-core"
> -FILES_${PN}-elementtree=3D"${libdir}/python2.6/lib-
> dynload/_elementtree.so "
> +DESCRIPTION_${PN}-mmap=3D"Python Memory-Mapped-File Support"
> +RDEPENDS_${PN}-mmap=3D"${PN}-core ${PN}-io"
> +FILES_${PN}-mmap=3D"${libdir}/python2.6/lib-dynload/mmap.so "
>
> -DESCRIPTION_${PN}-fcntl=3D"Python's fcntl Interface"
> -RDEPENDS_${PN}-fcntl=3D"${PN}-core"
> -FILES_${PN}-fcntl=3D"${libdir}/python2.6/lib-dynload/fcntl.so "
> +DESCRIPTION_${PN}-multiprocessing=3D"Python Multiprocessing Support"
> +RDEPENDS_${PN}-multiprocessing=3D"${PN}-core ${PN}-io ${PN}-lang"
> +FILES_${PN}-multiprocessing=3D"${libdir}/python2.6/lib-
> dynload/_multiprocessing.so ${libdir}/python2.6/multiprocessing "
>
>  DESCRIPTION_${PN}-netclient=3D"Python Internet Protocol Clients"
>  RDEPENDS_${PN}-netclient=3D"${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-
> io ${PN}-lang ${PN}-logging ${PN}-mime"
>  FILES_${PN}-netclient=3D"${libdir}/python2.6/*Cookie*.*
> ${libdir}/python2.6/base64.* ${libdir}/python2.6/cookielib.*
> ${libdir}/python2.6/ftplib.* ${libdir}/python2.6/gopherlib.*
> ${libdir}/python2.6/hmac.* ${libdir}/python2.6/httplib.*
> ${libdir}/python2.6/mimetypes.* ${libdir}/python2.6/nntplib.*
> ${libdir}/python2.6/poplib.* ${libdir}/python2.6/smtplib.*
> ${libdir}/python2.6/telnetlib.* ${libdir}/python2.6/urllib.*
> ${libdir}/python2.6/urllib2.* ${libdir}/python2.6/urlparse.*
> ${libdir}/python2.6/uuid.* ${libdir}/python2.6/rfc822.*
> ${libdir}/python2.6/mimetools.* "
>
> -DESCRIPTION_${PN}-pprint=3D"Python Pretty-Print Support"
> -RDEPENDS_${PN}-pprint=3D"${PN}-core"
> -FILES_${PN}-pprint=3D"${libdir}/python2.6/pprint.* "
> -
>  DESCRIPTION_${PN}-netserver=3D"Python Internet Protocol Servers"
>  RDEPENDS_${PN}-netserver=3D"${PN}-core ${PN}-netclient"
>  FILES_${PN}-netserver=3D"${libdir}/python2.6/cgi.*
> ${libdir}/python2.6/*HTTPServer.* ${libdir}/python2.6/SocketServer.* "
>
> -DESCRIPTION_${PN}-curses=3D"Python Curses Support"
> -RDEPENDS_${PN}-curses=3D"${PN}-core"
> -FILES_${PN}-curses=3D"${libdir}/python2.6/curses
> ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-
> dynload/_curses_panel.so "
> +DESCRIPTION_${PN}-numbers=3D"Python Number APIs"
> +RDEPENDS_${PN}-numbers=3D"${PN}-core ${PN}-lang ${PN}-re"
> +FILES_${PN}-numbers=3D"${libdir}/python2.6/decimal.*
> ${libdir}/python2.6/numbers.* "
>
> -DESCRIPTION_${PN}-smtpd=3D"Python Simple Mail Transport Daemon"
> -RDEPENDS_${PN}-smtpd=3D"${PN}-core ${PN}-netserver ${PN}-email ${PN}-
> mime"
> -FILES_${PN}-smtpd=3D"${bindir}/smtpd.* "
> +DESCRIPTION_${PN}-pickle=3D"Python Persistence Support"
> +RDEPENDS_${PN}-pickle=3D"${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
> +FILES_${PN}-pickle=3D"${libdir}/python2.6/pickle.*
> ${libdir}/python2.6/shelve.* ${libdir}/python2.6/lib-dynload/cPickle.so
> "
>
> -DESCRIPTION_${PN}-html=3D"Python HTML Processing"
> -RDEPENDS_${PN}-html=3D"${PN}-core"
> -FILES_${PN}-html=3D"${libdir}/python2.6/formatter.*
> ${libdir}/python2.6/htmlentitydefs.* ${libdir}/python2.6/htmllib.*
> ${libdir}/python2.6/markupbase.* ${libdir}/python2.6/sgmllib.* "
> +DESCRIPTION_${PN}-pkgutil=3D"Python Package Extension Utility Support"
> +RDEPENDS_${PN}-pkgutil=3D"${PN}-core"
> +FILES_${PN}-pkgutil=3D"${libdir}/python2.6/pkgutil.* "
>
> -DESCRIPTION_${PN}-readline=3D"Python Readline Support"
> -RDEPENDS_${PN}-readline=3D"${PN}-core"
> -FILES_${PN}-readline=3D"${libdir}/python2.6/lib-dynload/readline.so
> ${libdir}/python2.6/rlcompleter.* "
> +DESCRIPTION_${PN}-pprint=3D"Python Pretty-Print Support"
> +RDEPENDS_${PN}-pprint=3D"${PN}-core"
> +FILES_${PN}-pprint=3D"${libdir}/python2.6/pprint.* "
>
> -DESCRIPTION_${PN}-subprocess=3D"Python Subprocess Support"
> -RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl
> ${PN}-pickle"
> -FILES_${PN}-subprocess=3D"${libdir}/python2.6/subprocess.* "
> +DESCRIPTION_${PN}-profile=3D"Python Basic Profiling Support"
> +RDEPENDS_${PN}-profile=3D"${PN}-core ${PN}-textutils"
> +FILES_${PN}-profile=3D"${libdir}/python2.6/profile.*
> ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.*
> ${libdir}/python2.6/lib-dynload/_lsprof.so "
>
>  DESCRIPTION_${PN}-pydoc=3D"Python Interactive Help Support"
>  RDEPENDS_${PN}-pydoc=3D"${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
>  FILES_${PN}-pydoc=3D"${bindir}/pydoc ${libdir}/python2.6/pydoc.* "
>
> -DESCRIPTION_${PN}-logging=3D"Python Logging Support"
> -RDEPENDS_${PN}-logging=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle
> ${PN}-stringold"
> -FILES_${PN}-logging=3D"${libdir}/python2.6/logging "
> +DESCRIPTION_${PN}-re=3D"Python Regular Expression APIs"
> +RDEPENDS_${PN}-re=3D"${PN}-core"
> +FILES_${PN}-re=3D"${libdir}/python2.6/re.* ${libdir}/python2.6/sre.*
> ${libdir}/python2.6/sre_compile.* ${libdir}/python2.6/sre_constants*
> ${libdir}/python2.6/sre_parse.* "
>
> -DESCRIPTION_${PN}-mailbox=3D"Python Mailbox Format Support"
> -RDEPENDS_${PN}-mailbox=3D"${PN}-core ${PN}-mime"
> -FILES_${PN}-mailbox=3D"${libdir}/python2.6/mailbox.* "
> +DESCRIPTION_${PN}-readline=3D"Python Readline Support"
> +RDEPENDS_${PN}-readline=3D"${PN}-core"
> +FILES_${PN}-readline=3D"${libdir}/python2.6/lib-dynload/readline.so
> ${libdir}/python2.6/rlcompleter.* "
>
> -DESCRIPTION_${PN}-xml=3D"Python basic XML support."
> -RDEPENDS_${PN}-xml=3D"${PN}-core ${PN}-re"
> -FILES_${PN}-xml=3D"${libdir}/python2.6/lib-dynload/pyexpat.so
> ${libdir}/python2.6/xml ${libdir}/python2.6/xmllib.* "
> +DESCRIPTION_${PN}-resource=3D"Python Resource Control Interface"
> +RDEPENDS_${PN}-resource=3D"${PN}-core"
> +FILES_${PN}-resource=3D"${libdir}/python2.6/lib-dynload/resource.so "
>
> -DESCRIPTION_${PN}-mime=3D"Python MIME Handling APIs"
> -RDEPENDS_${PN}-mime=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-mime=3D"${libdir}/python2.6/mimetools.*
> ${libdir}/python2.6/uu.* ${libdir}/python2.6/quopri.*
> ${libdir}/python2.6/rfc822.* "
> +DESCRIPTION_${PN}-robotparser=3D"Python robots.txt parser"
> +RDEPENDS_${PN}-robotparser=3D"${PN}-core ${PN}-netclient"
> +FILES_${PN}-robotparser=3D"${libdir}/python2.6/robotparser.* "
> +
> +DESCRIPTION_${PN}-shell=3D"Python Shell-Like Functionality"
> +RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
> +FILES_${PN}-shell=3D"${libdir}/python2.6/cmd.*
> ${libdir}/python2.6/commands.* ${libdir}/python2.6/dircache.*
> ${libdir}/python2.6/fnmatch.* ${libdir}/python2.6/glob.*
> ${libdir}/python2.6/popen2.* ${libdir}/python2.6/shlex.*
> ${libdir}/python2.6/shutil.* "
> +
> +DESCRIPTION_${PN}-smtpd=3D"Python Simple Mail Transport Daemon"
> +RDEPENDS_${PN}-smtpd=3D"${PN}-core ${PN}-netserver ${PN}-email ${PN}-
> mime"
> +FILES_${PN}-smtpd=3D"${bindir}/smtpd.* "
>
>  DESCRIPTION_${PN}-sqlite3=3D"Python Sqlite3 Database Support"
>  RDEPENDS_${PN}-sqlite3=3D"${PN}-core ${PN}-datetime ${PN}-lang ${PN}-
> crypt ${PN}-io ${PN}-threading ${PN}-zlib"
> @@ -199,68 +213,60 @@ DESCRIPTION_${PN}-sqlite3-tests=3D"Python Sqlite3
> Database Support Tests"
>  RDEPENDS_${PN}-sqlite3-tests=3D"${PN}-core ${PN}-sqlite3"
>  FILES_${PN}-sqlite3-tests=3D"${libdir}/python2.6/sqlite3/test "
>
> -DESCRIPTION_${PN}-unittest=3D"Python Unit Testing Framework"
> -RDEPENDS_${PN}-unittest=3D"${PN}-core ${PN}-stringold ${PN}-lang"
> -FILES_${PN}-unittest=3D"${libdir}/python2.6/unittest.* "
> -
> -DESCRIPTION_${PN}-multiprocessing=3D"Python Multiprocessing Support"
> -RDEPENDS_${PN}-multiprocessing=3D"${PN}-core ${PN}-io ${PN}-lang"
> -FILES_${PN}-multiprocessing=3D"${libdir}/python2.6/lib-
> dynload/_multiprocessing.so ${libdir}/python2.6/multiprocessing "
> -
> -DESCRIPTION_${PN}-robotparser=3D"Python robots.txt parser"
> -RDEPENDS_${PN}-robotparser=3D"${PN}-core ${PN}-netclient"
> -FILES_${PN}-robotparser=3D"${libdir}/python2.6/robotparser.* "
> +DESCRIPTION_${PN}-stringold=3D"Python String APIs [deprecated]"
> +RDEPENDS_${PN}-stringold=3D"${PN}-core ${PN}-re"
> +FILES_${PN}-stringold=3D"${libdir}/python2.6/lib-dynload/strop.so
> ${libdir}/python2.6/string.* "
>
> -DESCRIPTION_${PN}-compile=3D"Python Bytecode Compilation Support"
> -RDEPENDS_${PN}-compile=3D"${PN}-core"
> -FILES_${PN}-compile=3D"${libdir}/python2.6/py_compile.*
> ${libdir}/python2.6/compileall.* "
> +DESCRIPTION_${PN}-subprocess=3D"Python Subprocess Support"
> +RDEPENDS_${PN}-subprocess=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl
> ${PN}-pickle"
> +FILES_${PN}-subprocess=3D"${libdir}/python2.6/subprocess.* "
>
> -DESCRIPTION_${PN}-debugger=3D"Python Debugger"
> -RDEPENDS_${PN}-debugger=3D"${PN}-core ${PN}-io ${PN}-lang ${PN}-re
> ${PN}-stringold ${PN}-shell ${PN}-pprint"
> -FILES_${PN}-debugger=3D"${libdir}/python2.6/bdb.*
> ${libdir}/python2.6/pdb.* "
> +DESCRIPTION_${PN}-syslog=3D"Python Syslog Interface"
> +RDEPENDS_${PN}-syslog=3D"${PN}-core"
> +FILES_${PN}-syslog=3D"${libdir}/python2.6/lib-dynload/syslog.so "
>
> -DESCRIPTION_${PN}-pkgutil=3D"Python Package Extension Utility Support"
> -RDEPENDS_${PN}-pkgutil=3D"${PN}-core"
> -FILES_${PN}-pkgutil=3D"${libdir}/python2.6/pkgutil.* "
> +DESCRIPTION_${PN}-terminal=3D"Python Terminal Controlling Support"
> +RDEPENDS_${PN}-terminal=3D"${PN}-core ${PN}-io"
> +FILES_${PN}-terminal=3D"${libdir}/python2.6/pty.*
> ${libdir}/python2.6/tty.* "
>
> -DESCRIPTION_${PN}-shell=3D"Python Shell-Like Functionality"
> -RDEPENDS_${PN}-shell=3D"${PN}-core ${PN}-re"
> -FILES_${PN}-shell=3D"${libdir}/python2.6/cmd.*
> ${libdir}/python2.6/commands.* ${libdir}/python2.6/dircache.*
> ${libdir}/python2.6/fnmatch.* ${libdir}/python2.6/glob.*
> ${libdir}/python2.6/popen2.* ${libdir}/python2.6/shlex.*
> ${libdir}/python2.6/shutil.* "
> +DESCRIPTION_${PN}-tests=3D"Python Tests"
> +RDEPENDS_${PN}-tests=3D"${PN}-core"
> +FILES_${PN}-tests=3D"${libdir}/python2.6/test "
>
> -DESCRIPTION_${PN}-bsddb=3D"Python Berkeley Database Bindings"
> -RDEPENDS_${PN}-bsddb=3D"${PN}-core"
> -FILES_${PN}-bsddb=3D"${libdir}/python2.6/bsddb ${libdir}/python2.6/lib-
> dynload/_bsddb.so "
> +DESCRIPTION_${PN}-textutils=3D"Python Option Parsing, Text Wrapping and
> Comma-Separated-Value Support"
> +RDEPENDS_${PN}-textutils=3D"${PN}-core ${PN}-io ${PN}-re ${PN}-
> stringold"
> +FILES_${PN}-textutils=3D"${libdir}/python2.6/lib-dynload/_csv.so
> ${libdir}/python2.6/csv.* ${libdir}/python2.6/optparse.*
> ${libdir}/python2.6/textwrap.* "
>
> -DESCRIPTION_${PN}-mmap=3D"Python Memory-Mapped-File Support"
> -RDEPENDS_${PN}-mmap=3D"${PN}-core ${PN}-io"
> -FILES_${PN}-mmap=3D"${libdir}/python2.6/lib-dynload/mmap.so "
> +DESCRIPTION_${PN}-threading=3D"Python Threading & Synchronization
> Support"
> +RDEPENDS_${PN}-threading=3D"${PN}-core ${PN}-lang"
> +FILES_${PN}-threading=3D"${libdir}/python2.6/_threading_local.*
> ${libdir}/python2.6/dummy_thread.*
> ${libdir}/python2.6/dummy_threading.* ${libdir}/python2.6/mutex.*
> ${libdir}/python2.6/threading.* ${libdir}/python2.6/Queue.* "
>
> -DESCRIPTION_${PN}-zlib=3D"Python zlib Support."
> -RDEPENDS_${PN}-zlib=3D"${PN}-core"
> -FILES_${PN}-zlib=3D"${libdir}/python2.6/lib-dynload/zlib.so "
> +DESCRIPTION_${PN}-tkinter=3D"Python Tcl/Tk Bindings"
> +RDEPENDS_${PN}-tkinter=3D"${PN}-core"
> +FILES_${PN}-tkinter=3D"${libdir}/python2.6/lib-dynload/_tkinter.so
> ${libdir}/python2.6/lib-tk "
>
> -DESCRIPTION_${PN}-db=3D"Python File-Based Database Support"
> -RDEPENDS_${PN}-db=3D"${PN}-core"
> -FILES_${PN}-db=3D"${libdir}/python2.6/anydbm.*
> ${libdir}/python2.6/dumbdbm.* ${libdir}/python2.6/whichdb.* "
> +DESCRIPTION_${PN}-unittest=3D"Python Unit Testing Framework"
> +RDEPENDS_${PN}-unittest=3D"${PN}-core ${PN}-stringold ${PN}-lang"
> +FILES_${PN}-unittest=3D"${libdir}/python2.6/unittest.* "
>
> -DESCRIPTION_${PN}-crypt=3D"Python Basic Cryptographic and Hashing
> Support"
> -RDEPENDS_${PN}-crypt=3D"${PN}-core"
> -FILES_${PN}-crypt=3D"${libdir}/python2.6/hashlib.*
> ${libdir}/python2.6/md5.* ${libdir}/python2.6/sha.*
> ${libdir}/python2.6/lib-dynload/crypt.so ${libdir}/python2.6/lib-
> dynload/_hashlib.so ${libdir}/python2.6/lib-dynload/_sha256.so
> ${libdir}/python2.6/lib-dynload/_sha512.so "
> +DESCRIPTION_${PN}-unixadmin=3D"Python Unix Administration Support"
> +RDEPENDS_${PN}-unixadmin=3D"${PN}-core"
> +FILES_${PN}-unixadmin=3D"${libdir}/python2.6/lib-dynload/nis.so
> ${libdir}/python2.6/lib-dynload/grp.so ${libdir}/python2.6/lib-
> dynload/pwd.so ${libdir}/python2.6/getpass.* "
>
> -DESCRIPTION_${PN}-idle=3D"Python Integrated Development Environment"
> -RDEPENDS_${PN}-idle=3D"${PN}-core ${PN}-tkinter"
> -FILES_${PN}-idle=3D"${bindir}/idle ${libdir}/python2.6/idlelib "
> +DESCRIPTION_${PN}-xml=3D"Python basic XML support."
> +RDEPENDS_${PN}-xml=3D"${PN}-core ${PN}-elementtree ${PN}-re"
> +FILES_${PN}-xml=3D"${libdir}/python2.6/lib-dynload/pyexpat.so
> ${libdir}/python2.6/xml ${libdir}/python2.6/xmllib.* "
>
> -DESCRIPTION_${PN}-lang=3D"Python Low-Level Language Support"
> -RDEPENDS_${PN}-lang=3D"${PN}-core"
> -FILES_${PN}-lang=3D"${libdir}/python2.6/lib-dynload/_bisect.so
> ${libdir}/python2.6/lib-dynload/_collections.so
> ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-
> dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so
> ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-
> dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so
> ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.*
> ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.*
> ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.*
> ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.*
> ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.*
> ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.*
> ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.*
> ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.*
> ${libdir}/python2.6/traceback.* ${libdir}/python2.6/linecache.*
> ${libdir}/python2.6/weakref.* "
> +DESCRIPTION_${PN}-xmlrpc=3D"Python XMLRPC Support"
> +RDEPENDS_${PN}-xmlrpc=3D"${PN}-core ${PN}-xml ${PN}-netserver ${PN}-
> lang"
> +FILES_${PN}-xmlrpc=3D"${libdir}/python2.6/xmlrpclib.*
> ${libdir}/python2.6/SimpleXMLRPCServer.* "
>
> -DESCRIPTION_${PN}-audio=3D"Python Audio Handling"
> -RDEPENDS_${PN}-audio=3D"${PN}-core"
> -FILES_${PN}-audio=3D"${libdir}/python2.6/wave.*
> ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.*
> ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-
> dynload/audioop.so "
> +DESCRIPTION_${PN}-zlib=3D"Python zlib Support."
> +RDEPENDS_${PN}-zlib=3D"${PN}-core"
> +FILES_${PN}-zlib=3D"${libdir}/python2.6/lib-dynload/zlib.so "
>
>  DESCRIPTION_${PN}-modules=3D"All Python modules"
> -RDEPENDS_${PN}-modules=3D"${PN}-profile ${PN}-threading ${PN}-distutils
> ${PN}-doctest ${PN}-stringold ${PN}-codecs ${PN}-ctypes ${PN}-pickle
> ${PN}-datetime ${PN}-core ${PN}-io ${PN}-compiler ${PN}-compression
> ${PN}-re ${PN}-xmlrpc ${PN}-terminal ${PN}-email ${PN}-image ${PN}-
> tests ${PN}-resource ${PN}-json ${PN}-devel ${PN}-difflib ${PN}-math
> ${PN}-syslog ${PN}-hotshot ${PN}-unixadmin ${PN}-textutils ${PN}-
> tkinter ${PN}-gdbm ${PN}-elementtree ${PN}-fcntl ${PN}-netclient ${PN}-
> pprint ${PN}-netserver ${PN}-curses ${PN}-smtpd ${PN}-html ${PN}-
> readline ${PN}-subprocess ${PN}-pydoc ${PN}-logging ${PN}-mailbox
> ${PN}-xml ${PN}-mime ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-unittest
> ${PN}-multiprocessing ${PN}-robotparser ${PN}-compile ${PN}-debugger
> ${PN}-pkgutil ${PN}-shell ${PN}-bsddb ${PN}-mmap ${PN}-zlib ${PN}-db
> ${PN}-crypt ${PN}-idle ${PN}-lang ${PN}-audio  "
> +RDEPENDS_${PN}-modules=3D"${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-
> compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-
> ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-
> difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email
> ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image
> ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math
> ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-
> netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-
> profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-
> robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests
> ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-
> tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest
> ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
>  ALLOW_EMPTY_${PN}-modules =3D "1"
>
>
> diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-
> devtools/python/python.inc
> index f782507..bfa0bb2 100644
> --- a/meta/recipes-devtools/python/python.inc
> +++ b/meta/recipes-devtools/python/python.inc
> @@ -4,7 +4,7 @@ LICENSE =3D "PSF"
>  SECTION =3D "devel/python"
>  PRIORITY =3D "optional"
>  # bump this on every change in contrib/python/generate-manifest-2.6.py
> -INC_PR =3D "nk0"
> +INC_PR =3D "nk1"
>
>  DEFAULT_PREFERENCE =3D "-26"
>
> diff --git a/scripts/contrib/python/generate-manifest-2.6.py
> b/scripts/contrib/python/generate-manifest-2.6.py
> new file mode 100755
> index 0000000..1b11266
> --- /dev/null
> +++ b/scripts/contrib/python/generate-manifest-2.6.py
> @@ -0,0 +1,362 @@
> +#!/usr/bin/env python
> +
> +# generate Python Manifest for the OpenEmbedded build system
> +# (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
> +# (C) 2007 Jeremy Laine
> +# licensed under MIT, see COPYING.MIT
> +
> +import os
> +import sys
> +import time
> +
> +VERSION =3D "2.6.6"
> +
> +__author__ =3D "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
> +__version__ =3D "20110222"
> +
> +class MakefileMaker:
> +
> +    def __init__( self, outfile ):
> +        """initialize"""
> +        self.packages =3D {}
> +        self.targetPrefix =3D "${libdir}/python%s/" % VERSION[:3]
> +        self.output =3D outfile
> +        self.out( """
> +# WARNING: This file is AUTO GENERATED: Manual edits will be lost next
> time I regenerate the file.
> +# Generator: '%s' Version %s (C) 2002-2010 Michael 'Mickey' Lauer
> <mlauer@vanille-media.de>
> +# Visit the Python for Embedded Systems Site =3D>
> http://www.Vanille.de/projects/python.spy
> +""" % ( sys.argv[0], __version__ ) )
> +
> +    #
> +    # helper functions
> +    #
> +
> +    def out( self, data ):
> +        """print a line to the output file"""
> +        self.output.write( "%s\n" % data )
> +
> +    def setPrefix( self, targetPrefix ):
> +        """set a file prefix for addPackage files"""
> +        self.targetPrefix =3D targetPrefix
> +
> +    def doProlog( self ):
> +        self.out( """ """ )
> +        self.out( "" )
> +
> +    def addPackage( self, name, description, dependencies, filenames
> ):
> +        """add a package to the Makefile"""
> +        if type( filenames ) =3D=3D type( "" ):
> +            filenames =3D filenames.split()
> +        fullFilenames =3D []
> +        for filename in filenames:
> +            if filename[0] !=3D "$":
> +                fullFilenames.append( "%s%s" % ( self.targetPrefix,
> filename ) )
> +            else:
> +                fullFilenames.append( filename )
> +        self.packages[name] =3D description, dependencies, fullFilenames
> +
> +    def doBody( self ):
> +        """generate body of Makefile"""
> +
> +        global VERSION
> +
> +        #
> +        # generate provides line
> +        #
> +
> +        provideLine =3D 'PROVIDES+=3D"'
> +        for name in sorted(self.packages):
> +            provideLine +=3D "%s " % name
> +        provideLine +=3D '"'
> +
> +        self.out( provideLine )
> +        self.out( "" )
> +
> +        #
> +        # generate package line
> +        #
> +
> +        packageLine =3D 'PACKAGES=3D"${PN}-core-dbg '
> +        for name in sorted(self.packages):
> +            if name !=3D '${PN}-core-dbg':
> +                packageLine +=3D "%s " % name
> +        packageLine +=3D '${PN}-modules"'
> +
> +        self.out( packageLine )
> +        self.out( "" )
> +
> +        #
> +        # generate package variables
> +        #
> +
> +        for name, data in sorted(self.packages.iteritems()):
> +            desc, deps, files =3D data
> +
> +            #
> +            # write out the description, revision and dependencies
> +            #
> +            self.out( 'DESCRIPTION_%s=3D"%s"' % ( name, desc ) )
> +            self.out( 'RDEPENDS_%s=3D"%s"' % ( name, deps ) )
> +
> +            line =3D 'FILES_%s=3D"' % name
> +
> +            #
> +            # check which directories to make in the temporary
> directory
> +            #
> +
> +            dirset =3D {} # if python had a set-datatype this would be
> sufficient. for now, we're using a dict instead.
> +            for target in files:
> +                dirset[os.path.dirname( target )] =3D True
> +
> +            #
> +            # generate which files to copy for the target (-dfR
> because whole directories are also allowed)
> +            #
> +
> +            for target in files:
> +                line +=3D "%s " % target
> +
> +            line +=3D '"'
> +            self.out( line )
> +            self.out( "" )
> +
> +        self.out( 'DESCRIPTION_${PN}-modules=3D"All Python modules"' )
> +        line =3D 'RDEPENDS_${PN}-modules=3D"'
> +
> +        for name, data in sorted(self.packages.iteritems()):
> +            if name not in ['${PN}-core-dbg', '${PN}-dev']:
> +                line +=3D "%s " % name
> +
> +        self.out( "%s \"" % line )
> +        self.out( 'ALLOW_EMPTY_${PN}-modules =3D "1"' )
> +
> +    def doEpilog( self ):
> +        self.out( """""" )
> +        self.out( "" )
> +
> +    def make( self ):
> +        self.doProlog()
> +        self.doBody()
> +        self.doEpilog()
> +
> +if __name__ =3D=3D "__main__":
> +
> +    if len( sys.argv ) > 1:
> +        os.popen( "rm -f ./%s" % sys.argv[1] )
> +        outfile =3D file( sys.argv[1], "w" )
> +    else:
> +        outfile =3D sys.stdout
> +
> +    m =3D MakefileMaker( outfile )
> +
> +    # Add packages here. Only specify dlopen-style library
> dependencies here, no ldd-style dependencies!
> +    # Parameters: revision, name, description, dependencies, filenames
> +    #
> +
> +    m.addPackage( "${PN}-core", "Python Interpreter and core modules
> (needed!)", "",
> +    "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
> +    "genericpath.* getopt.* linecache.* new.* " +
> +    "os.* posixpath.* struct.* " +
> +    "warnings.* site.* stat.* " +
> +    "UserDict.* UserList.* UserString.* " +
> +    "lib-dynload/binascii.so lib-dynload/_struct.so lib-
> dynload/time.so " +
> +    "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python*" )
> +
> +    m.addPackage( "${PN}-core-dbg", "Python core module debug
> information", "${PN}-core",
> +    "config/.debug lib-dynload/.debug ${bindir}/.debug
> ${libdir}/.debug" )
> +
> +    m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-
> core",
> +    "${includedir} ${libdir}/libpython2.6.so" ) # package
> +
> +    m.addPackage( "${PN}-idle", "Python Integrated Development
> Environment", "${PN}-core ${PN}-tkinter",
> +    "${bindir}/idle idlelib" ) # package
> +
> +    m.addPackage( "${PN}-pydoc", "Python Interactive Help Support",
> "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
> +    "${bindir}/pydoc pydoc.*" )
> +
> +    m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport
> Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
> +    "${bindir}/smtpd.*" )
> +
> +    m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-
> core",
> +    "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-
> dynload/audioop.so" )
> +
> +    m.addPackage( "${PN}-bsddb", "Python Berkeley Database Bindings",
> "${PN}-core",
> +    "bsddb lib-dynload/_bsddb.so" ) # package
> +
> +    m.addPackage( "${PN}-codecs", "Python Codecs, Encodings & i18n
> Support", "${PN}-core ${PN}-lang",
> +    "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-
> dynload/unicodedata.so stringprep.* xdrlib.*" )
> +
> +    m.addPackage( "${PN}-compile", "Python Bytecode Compilation
> Support", "${PN}-core",
> +    "py_compile.* compileall.*" )
> +
> +    m.addPackage( "${PN}-compiler", "Python Compiler Support", "${PN}-
> core",
> +    "compiler" ) # package
> +
> +    m.addPackage( "${PN}-compression", "Python High Level Compression
> Support", "${PN}-core ${PN}-zlib",
> +    "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
> +
> +    m.addPackage( "${PN}-crypt", "Python Basic Cryptographic and
> Hashing Support", "${PN}-core",
> +    "hashlib.* md5.* sha.* lib-dynload/crypt.so lib-
> dynload/_hashlib.so lib-dynload/_sha256.so lib-dynload/_sha512.so" )
> +
> +    m.addPackage( "${PN}-textutils", "Python Option Parsing, Text
> Wrapping and Comma-Separated-Value Support", "${PN}-core ${PN}-io
> ${PN}-re ${PN}-stringold",
> +    "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
> +
> +    m.addPackage( "${PN}-curses", "Python Curses Support", "${PN}-
> core",
> +    "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) #
> directory + low level module
> +
> +    m.addPackage( "${PN}-ctypes", "Python C Types Support", "${PN}-
> core",
> +    "ctypes lib-dynload/_ctypes.so" ) # directory + low level module
> +
> +    m.addPackage( "${PN}-datetime", "Python Calendar and Time
> support", "${PN}-core ${PN}-codecs",
> +    "_strptime.* calendar.* lib-dynload/datetime.so" )
> +
> +    m.addPackage( "${PN}-db", "Python File-Based Database Support",
> "${PN}-core",
> +    "anydbm.* dumbdbm.* whichdb.* " )
> +
> +    m.addPackage( "${PN}-debugger", "Python Debugger", "${PN}-core
> ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
> +    "bdb.* pdb.*" )
> +
> +    m.addPackage( "${PN}-difflib", "Python helpers for computing
> deltas between objects.", "${PN}-lang ${PN}-re",
> +    "difflib.*" )
> +
> +    m.addPackage( "${PN}-distutils", "Python Distribution Utilities",
> "${PN}-core",
> +    "config distutils" ) # package
> +
> +    m.addPackage( "${PN}-doctest", "Python framework for running
> examples in docstrings.", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re
> ${PN}-unittest ${PN}-debugger ${PN}-difflib",
> +    "doctest.*" )
> +
> +    # FIXME consider adding to some higher level package
> +    m.addPackage( "${PN}-elementtree", "Python elementree", "${PN}-
> core",
> +    "lib-dynload/_elementtree.so" )
> +
> +    m.addPackage( "${PN}-email", "Python Email Support", "${PN}-core
> ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
> +    "imaplib.* email" ) # package
> +
> +    m.addPackage( "${PN}-fcntl", "Python's fcntl Interface", "${PN}-
> core",
> +    "lib-dynload/fcntl.so" )
> +
> +    m.addPackage( "${PN}-hotshot", "Python Hotshot Profiler", "${PN}-
> core",
> +    "hotshot lib-dynload/_hotshot.so" )
> +
> +    m.addPackage( "${PN}-html", "Python HTML Processing", "${PN}-
> core",
> +    "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* " )
> +
> +    m.addPackage( "${PN}-gdbm", "Python GNU Database Support", "${PN}-
> core",
> +    "lib-dynload/gdbm.so" )
> +
> +    m.addPackage( "${PN}-image", "Python Graphical Image Handling",
> "${PN}-core",
> +    "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so"
> )
> +
> +    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core
> ${PN}-math",
> +    "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so
> lib-dynload/termios.so lib-dynload/cStringIO.so " +
> +    "pipes.* socket.* ssl.* tempfile.* StringIO.* " )
> +
> +    m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core
> ${PN}-math ${PN}-re",
> +    "json" ) # package
> +
> +    m.addPackage( "${PN}-lang", "Python Low-Level Language Support",
> "${PN}-core",
> +    "lib-dynload/_bisect.so lib-dynload/_collections.so lib-
> dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
> +    "lib-dynload/array.so lib-dynload/itertools.so lib-
> dynload/operator.so lib-dynload/parser.so " +
> +    "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.*
> heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
> +    "tokenize.* traceback.* weakref.*" )
> +
> +    m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-
> core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
> +    "logging" ) # package
> +
> +    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support",
> "${PN}-core ${PN}-mime",
> +    "mailbox.*" )
> +
> +    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core",
> +    "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so
> random.* sets.*" )
> +
> +    m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-
> core ${PN}-io",
> +    "mimetools.* uu.* quopri.* rfc822.*" )
> +
> +    m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support",
> "${PN}-core ${PN}-io",
> +    "lib-dynload/mmap.so " )
> +
> +    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing
> Support", "${PN}-core ${PN}-io ${PN}-lang",
> +    "lib-dynload/_multiprocessing.so multiprocessing" ) # package
> +
> +    m.addPackage( "${PN}-netclient", "Python Internet Protocol
> Clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang
> ${PN}-logging ${PN}-mime",
> +    "*Cookie*.* " +
> +    "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.*
> mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.*
> urlparse.* uuid.* rfc822.* mimetools.*" )
> +
> +    m.addPackage( "${PN}-netserver", "Python Internet Protocol
> Servers", "${PN}-core ${PN}-netclient",
> +    "cgi.* *HTTPServer.* SocketServer.*" )
> +
> +    m.addPackage( "${PN}-numbers", "Python Number APIs", "${PN}-core
> ${PN}-lang ${PN}-re",
> +    "decimal.* numbers.*" )
> +
> +    m.addPackage( "${PN}-pickle", "Python Persistence Support",
> "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
> +    "pickle.* shelve.* lib-dynload/cPickle.so" )
> +
> +    m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility
> Support", "${PN}-core",
> +    "pkgutil.*")
> +
> +    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support",
> "${PN}-core",
> +    "pprint.*" )
> +
> +    m.addPackage( "${PN}-profile", "Python Basic Profiling Support",
> "${PN}-core ${PN}-textutils",
> +    "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
> +
> +    m.addPackage( "${PN}-re", "Python Regular Expression APIs",
> "${PN}-core",
> +    "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is
> builtin
> +
> +    m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-
> core",
> +    "lib-dynload/readline.so rlcompleter.*" )
> +
> +    m.addPackage( "${PN}-resource", "Python Resource Control
> Interface", "${PN}-core",
> +    "lib-dynload/resource.so" )
> +
> +    m.addPackage( "${PN}-shell", "Python Shell-Like Functionality",
> "${PN}-core ${PN}-re",
> +    "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.*
> shutil.*" )
> +
> +    m.addPackage( "${PN}-robotparser", "Python robots.txt parser",
> "${PN}-core ${PN}-netclient",
> +    "robotparser.*")
> +
> +    m.addPackage( "${PN}-subprocess", "Python Subprocess Support",
> "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
> +    "subprocess.*" )
> +
> +    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 Database Support",
> "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-
> threading ${PN}-zlib",
> +    "lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__init__.*
> sqlite3/dump.*" )
> +
> +    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 Database
> Support Tests", "${PN}-core ${PN}-sqlite3",
> +    "sqlite3/test" )
> +
> +    m.addPackage( "${PN}-stringold", "Python String APIs
> [deprecated]", "${PN}-core ${PN}-re",
> +    "lib-dynload/strop.so string.*" )
> +
> +    m.addPackage( "${PN}-syslog", "Python Syslog Interface", "${PN}-
> core",
> +    "lib-dynload/syslog.so" )
> +
> +    m.addPackage( "${PN}-terminal", "Python Terminal Controlling
> Support", "${PN}-core ${PN}-io",
> +    "pty.* tty.*" )
> +
> +    m.addPackage( "${PN}-tests", "Python Tests", "${PN}-core",
> +    "test" ) # package
> +
> +    m.addPackage( "${PN}-threading", "Python Threading &
> Synchronization Support", "${PN}-core ${PN}-lang",
> +    "_threading_local.* dummy_thread.* dummy_threading.* mutex.*
> threading.* Queue.*" )
> +
> +    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk Bindings", "${PN}-
> core",
> +    "lib-dynload/_tkinter.so lib-tk" ) # package
> +
> +    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework",
> "${PN}-core ${PN}-stringold ${PN}-lang",
> +    "unittest.*" )
> +
> +    m.addPackage( "${PN}-unixadmin", "Python Unix Administration
> Support", "${PN}-core",
> +    "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so
> getpass.*" )
> +
> +    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-
> core ${PN}-elementtree ${PN}-re",
> +    "lib-dynload/pyexpat.so xml xmllib.*" ) # package
> +
> +    m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core
> ${PN}-xml ${PN}-netserver ${PN}-lang",
> +    "xmlrpclib.* SimpleXMLRPCServer.*" )
> +
> +    m.addPackage( "${PN}-zlib", "Python zlib Support.", "${PN}-core",
> +    "lib-dynload/zlib.so" )
> +
> +    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support",
> "${PN}-core ${PN}-mime",
> +    "mailbox.*" )
> +
> +    m.make()
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


