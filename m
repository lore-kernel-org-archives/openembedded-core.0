Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 908DA6F992
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:24:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="476625251"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:24:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:24:36 +0000
Message-Id: <12fd7afe92c258326d38aa703666abb8f67c4148.1395343268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/5] generate-manifest-3.3.py: sync descriptions with 2.7 version
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
X-List-Received-Date: Thu, 20 Mar 2014 19:24:58 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-3.3-manifest.inc                 | 124 ++++++++++-----------
 scripts/contrib/python/generate-manifest-3.3.py    | 110 +++++++++---------
 2 files changed, 117 insertions(+), 117 deletions(-)

diff --git a/meta/recipes-devtools/python/python-3.3-manifest.inc b/meta/recipes-devtools/python/python-3.3-manifest.inc
index 806704e..2cfc3ae 100644
--- a/meta/recipes-devtools/python/python-3.3-manifest.inc
+++ b/meta/recipes-devtools/python/python-3.3-manifest.inc
@@ -9,251 +9,251 @@ PROVIDES+="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression $
 
 PACKAGES="${PN}-dbg ${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils-staticdev ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-modules"
 
-DESCRIPTION_${PN}-2to3="Python Automated Python 2 to 3 code translation"
+SUMMARY_${PN}-2to3="Python automated Python 2 to 3 code translator"
 RDEPENDS_${PN}-2to3="${PN}-core"
 FILES_${PN}-2to3="${bindir}/2to3 ${libdir}/python3.3/lib2to3 "
 
-DESCRIPTION_${PN}-audio="Python Audio Handling"
+SUMMARY_${PN}-audio="Python Audio Handling"
 RDEPENDS_${PN}-audio="${PN}-core"
 FILES_${PN}-audio="${libdir}/python3.3/wave.* ${libdir}/python3.3/chunk.* ${libdir}/python3.3/sndhdr.* ${libdir}/python3.3/lib-dynload/ossaudiodev.*.so ${libdir}/python3.3/lib-dynload/audioop.*.so ${libdir}/python3.3/audiodev.* ${libdir}/python3.3/sunaudio.* ${libdir}/python3.3/sunau.* ${libdir}/python3.3/toaiff.* "
 
-DESCRIPTION_${PN}-codecs="Python Codecs, Encodings & i18n Support"
+SUMMARY_${PN}-codecs="Python codecs, encodings & i18n support"
 RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
 FILES_${PN}-codecs="${libdir}/python3.3/codecs.* ${libdir}/python3.3/encodings ${libdir}/python3.3/gettext.* ${libdir}/python3.3/locale.* ${libdir}/python3.3/lib-dynload/_locale.*.so ${libdir}/python3.3/lib-dynload/_codecs* ${libdir}/python3.3/lib-dynload/_multibytecodec.*.so ${libdir}/python3.3/lib-dynload/unicodedata.*.so ${libdir}/python3.3/stringprep.* ${libdir}/python3.3/xdrlib.* "
 
-DESCRIPTION_${PN}-compile="Python Bytecode Compilation Support"
+SUMMARY_${PN}-compile="Python bytecode compilation support"
 RDEPENDS_${PN}-compile="${PN}-core"
 FILES_${PN}-compile="${libdir}/python3.3/py_compile.* ${libdir}/python3.3/compileall.* "
 
-DESCRIPTION_${PN}-compression="Python High Level Compression Support"
+SUMMARY_${PN}-compression="Python high-level compression support"
 RDEPENDS_${PN}-compression="${PN}-core ${PN}-codecs"
 FILES_${PN}-compression="${libdir}/python3.3/gzip.* ${libdir}/python3.3/zipfile.* ${libdir}/python3.3/tarfile.* ${libdir}/python3.3/lib-dynload/bz2.*.so "
 
-DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
+SUMMARY_${PN}-core="Python interpreter and core modules"
 RDEPENDS_${PN}-core="${PN}-lang ${PN}-re"
 FILES_${PN}-core="${libdir}/python3.3/__future__.* ${libdir}/python3.3/_abcoll.* ${libdir}/python3.3/abc.* ${libdir}/python3.3/copy.* ${libdir}/python3.3/copy_reg.* ${libdir}/python3.3/ConfigParser.* ${libdir}/python3.3/genericpath.* ${libdir}/python3.3/getopt.* ${libdir}/python3.3/linecache.* ${libdir}/python3.3/new.* ${libdir}/python3.3/os.* ${libdir}/python3.3/posixpath.* ${libdir}/python3.3/struct.* ${libdir}/python3.3/warnings.* ${libdir}/python3.3/site.* ${libdir}/python3.3/stat.* ${libdir}/python3.3/UserDict.* ${libdir}/python3.3/UserList.* ${libdir}/python3.3/UserString.* ${libdir}/python3.3/lib-dynload/binascii.*.so ${libdir}/python3.3/lib-dynload/_struct.*.so ${libdir}/python3.3/lib-dynload/time.*.so ${libdir}/python3.3/lib-dynload/xreadlines.*.so ${libdir}/python3.3/types.* ${libdir}/python3.3/platform.* ${bindir}/python* ${libdir}/python3.3/_weakrefset.* ${libdir}/python3.3/sysconfig.* ${libdir}/python3.3/config/Makefile ${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h ${libdir}/python${PYTHON_MAJMIN}/collections ${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py "
 
-DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
+SUMMARY_${PN}-crypt="Python basic cryptographic and hashing support"
 RDEPENDS_${PN}-crypt="${PN}-core"
 FILES_${PN}-crypt="${libdir}/python3.3/hashlib.* ${libdir}/python3.3/md5.* ${libdir}/python3.3/sha.* ${libdir}/python3.3/lib-dynload/crypt.*.so ${libdir}/python3.3/lib-dynload/_hashlib.*.so ${libdir}/python3.3/lib-dynload/_sha256.*.so ${libdir}/python3.3/lib-dynload/_sha512.*.so "
 
-DESCRIPTION_${PN}-ctypes="Python C Types Support"
+SUMMARY_${PN}-ctypes="Python C types support"
 RDEPENDS_${PN}-ctypes="${PN}-core"
 FILES_${PN}-ctypes="${libdir}/python3.3/ctypes ${libdir}/python3.3/lib-dynload/_ctypes.*.so ${libdir}/python3.3/lib-dynload/_ctypes_test.*.so "
 
-DESCRIPTION_${PN}-curses="Python Curses Support"
+SUMMARY_${PN}-curses="Python curses support"
 RDEPENDS_${PN}-curses="${PN}-core"
 FILES_${PN}-curses="${libdir}/python3.3/curses ${libdir}/python3.3/lib-dynload/_curses.*.so ${libdir}/python3.3/lib-dynload/_curses_panel.*.so "
 
-DESCRIPTION_${PN}-datetime="Python Calendar and Time support"
+SUMMARY_${PN}-datetime="Python calendar and time support"
 RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
 FILES_${PN}-datetime="${libdir}/python3.3/_strptime.* ${libdir}/python3.3/calendar.* ${libdir}/python3.3/lib-dynload/datetime.*.so "
 
-DESCRIPTION_${PN}-db="Python File-Based Database Support"
+SUMMARY_${PN}-db="Python file-based database support"
 RDEPENDS_${PN}-db="${PN}-core"
 FILES_${PN}-db="${libdir}/python3.3/anydbm.* ${libdir}/python3.3/dumbdbm.* ${libdir}/python3.3/whichdb.* ${libdir}/python3.3/dbm ${libdir}/python3.3/lib-dynload/_dbm.*.so "
 
-DESCRIPTION_${PN}-debugger="Python Debugger"
+SUMMARY_${PN}-debugger="Python debugger"
 RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
 FILES_${PN}-debugger="${libdir}/python3.3/bdb.* ${libdir}/python3.3/pdb.* "
 
-DESCRIPTION_${PN}-dev="Python Development Package"
+SUMMARY_${PN}-dev="Python development package"
 RDEPENDS_${PN}-dev="${PN}-core"
 FILES_${PN}-dev="${includedir} ${libdir}/lib*${SOLIBSDEV} ${libdir}/*.la ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig ${base_libdir}/*.a ${base_libdir}/*.o ${datadir}/aclocal ${datadir}/pkgconfig "
 
-DESCRIPTION_${PN}-difflib="Python helpers for computing deltas between objects."
+SUMMARY_${PN}-difflib="Python helpers for computing deltas between objects"
 RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
 FILES_${PN}-difflib="${libdir}/python3.3/difflib.* "
 
-DESCRIPTION_${PN}-distutils="Python Distribution Utilities"
+SUMMARY_${PN}-distutils="Python Distribution Utilities"
 RDEPENDS_${PN}-distutils="${PN}-core"
 FILES_${PN}-distutils="${libdir}/python3.3/config ${libdir}/python3.3/distutils "
 
-DESCRIPTION_${PN}-distutils-staticdev="Python Distribution Utilities (Static Libraries)"
+SUMMARY_${PN}-distutils-staticdev="Python distribution utilities (static libraries)"
 RDEPENDS_${PN}-distutils-staticdev="${PN}-distutils"
 FILES_${PN}-distutils-staticdev="${libdir}/python3.3/config/lib*.a "
 
-DESCRIPTION_${PN}-doctest="Python framework for running examples in docstrings."
+SUMMARY_${PN}-doctest="Python framework for running examples in docstrings"
 RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
 FILES_${PN}-doctest="${libdir}/python3.3/doctest.* "
 
-DESCRIPTION_${PN}-elementtree="Python elementree"
+SUMMARY_${PN}-elementtree="Python elementree"
 RDEPENDS_${PN}-elementtree="${PN}-core"
 FILES_${PN}-elementtree="${libdir}/python3.3/lib-dynload/_elementtree.*.so "
 
-DESCRIPTION_${PN}-email="Python Email Support"
+SUMMARY_${PN}-email="Python email support"
 RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
 FILES_${PN}-email="${libdir}/python3.3/imaplib.* ${libdir}/python3.3/email "
 
-DESCRIPTION_${PN}-fcntl="Python's fcntl Interface"
+SUMMARY_${PN}-fcntl="Python's fcntl interface"
 RDEPENDS_${PN}-fcntl="${PN}-core"
 FILES_${PN}-fcntl="${libdir}/python3.3/lib-dynload/fcntl.*.so "
 
-DESCRIPTION_${PN}-gdbm="Python GNU Database Support"
+SUMMARY_${PN}-gdbm="Python GNU database support"
 RDEPENDS_${PN}-gdbm="${PN}-core"
 FILES_${PN}-gdbm="${libdir}/python3.3/lib-dynload/_gdbm.*.so "
 
-DESCRIPTION_${PN}-html="Python HTML Processing"
+SUMMARY_${PN}-html="Python HTML processing support"
 RDEPENDS_${PN}-html="${PN}-core"
 FILES_${PN}-html="${libdir}/python3.3/formatter.* ${libdir}/python3.3/htmlentitydefs.* ${libdir}/python3.3/htmllib.* ${libdir}/python3.3/markupbase.* ${libdir}/python3.3/sgmllib.* ${libdir}/python3.3/HTMLParser.* "
 
-DESCRIPTION_${PN}-idle="Python Integrated Development Environment"
+SUMMARY_${PN}-idle="Python Integrated Development Environment"
 RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
 FILES_${PN}-idle="${bindir}/idle ${libdir}/python3.3/idlelib "
 
-DESCRIPTION_${PN}-image="Python Graphical Image Handling"
+SUMMARY_${PN}-image="Python graphical image handling"
 RDEPENDS_${PN}-image="${PN}-core"
 FILES_${PN}-image="${libdir}/python3.3/colorsys.* ${libdir}/python3.3/imghdr.* ${libdir}/python3.3/lib-dynload/imageop.*.so ${libdir}/python3.3/lib-dynload/rgbimg.*.so "
 
-DESCRIPTION_${PN}-io="Python Low-Level I/O"
+SUMMARY_${PN}-io="Python low-level I/O"
 RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
 FILES_${PN}-io="${libdir}/python3.3/lib-dynload/_socket.*.so ${libdir}/python3.3/lib-dynload/_io.*.so ${libdir}/python3.3/lib-dynload/_ssl.*.so ${libdir}/python3.3/lib-dynload/select.*.so ${libdir}/python3.3/lib-dynload/termios.*.so ${libdir}/python3.3/lib-dynload/cStringIO.*.so ${libdir}/python3.3/pipes.* ${libdir}/python3.3/socket.* ${libdir}/python3.3/ssl.* ${libdir}/python3.3/tempfile.* ${libdir}/python3.3/StringIO.* ${libdir}/python3.3/io.* ${libdir}/python3.3/_pyio.* "
 
-DESCRIPTION_${PN}-json="Python JSON Support"
+SUMMARY_${PN}-json="Python JSON support"
 RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
 FILES_${PN}-json="${libdir}/python3.3/json ${libdir}/python3.3/lib-dynload/_json.*.so "
 
-DESCRIPTION_${PN}-lang="Python Low-Level Language Support"
+SUMMARY_${PN}-lang="Python low-level language support"
 RDEPENDS_${PN}-lang="${PN}-core"
 FILES_${PN}-lang="${libdir}/python3.3/lib-dynload/_bisect.*.so ${libdir}/python3.3/lib-dynload/_collections.*.so ${libdir}/python3.3/lib-dynload/_heapq.*.so ${libdir}/python3.3/lib-dynload/_weakref.*.so ${libdir}/python3.3/lib-dynload/_functools.*.so ${libdir}/python3.3/lib-dynload/array.*.so ${libdir}/python3.3/lib-dynload/itertools.*.so ${libdir}/python3.3/lib-dynload/operator.*.so ${libdir}/python3.3/lib-dynload/parser.*.so ${libdir}/python3.3/atexit.* ${libdir}/python3.3/bisect.* ${libdir}/python3.3/code.* ${libdir}/python3.3/codeop.* ${libdir}/python3.3/collections.* ${libdir}/python3.3/dis.* ${libdir}/python3.3/functools.* ${libdir}/python3.3/heapq.* ${libdir}/python3.3/inspect.* ${libdir}/python3.3/keyword.* ${libdir}/python3.3/opcode.* ${libdir}/python3.3/symbol.* ${libdir}/python3.3/repr.* ${libdir}/python3.3/token.* ${libdir}/python3.3/tokenize.* ${libdir}/python3.3/traceback.* ${libdir}/python3.3/weakref.* "
 
-DESCRIPTION_${PN}-logging="Python Logging Support"
+SUMMARY_${PN}-logging="Python logging support"
 RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
 FILES_${PN}-logging="${libdir}/python3.3/logging "
 
-DESCRIPTION_${PN}-mailbox="Python Mailbox Format Support"
+SUMMARY_${PN}-mailbox="Python mailbox format support"
 RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
 FILES_${PN}-mailbox="${libdir}/python3.3/mailbox.* "
 
-DESCRIPTION_${PN}-math="Python Math Support"
+SUMMARY_${PN}-math="Python math support"
 RDEPENDS_${PN}-math="${PN}-core"
 FILES_${PN}-math="${libdir}/python3.3/lib-dynload/cmath.*.so ${libdir}/python3.3/lib-dynload/math.*.so ${libdir}/python3.3/lib-dynload/_random.*.so ${libdir}/python3.3/random.* ${libdir}/python3.3/sets.* "
 
-DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
+SUMMARY_${PN}-mime="Python MIME handling APIs"
 RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
 FILES_${PN}-mime="${libdir}/python3.3/mimetools.* ${libdir}/python3.3/uu.* ${libdir}/python3.3/quopri.* ${libdir}/python3.3/rfc822.* ${libdir}/python3.3/MimeWriter.* "
 
-DESCRIPTION_${PN}-mmap="Python Memory-Mapped-File Support"
+SUMMARY_${PN}-mmap="Python memory-mapped file support"
 RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
 FILES_${PN}-mmap="${libdir}/python3.3/lib-dynload/mmap.*.so "
 
-DESCRIPTION_${PN}-multiprocessing="Python Multiprocessing Support"
+SUMMARY_${PN}-multiprocessing="Python multiprocessing support"
 RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang"
 FILES_${PN}-multiprocessing="${libdir}/python3.3/lib-dynload/_multiprocessing.*.so ${libdir}/python3.3/multiprocessing "
 
-DESCRIPTION_${PN}-netclient="Python Internet Protocol Clients"
+SUMMARY_${PN}-netclient="Python Internet Protocol clients"
 RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
 FILES_${PN}-netclient="${libdir}/python3.3/*Cookie*.* ${libdir}/python3.3/base64.* ${libdir}/python3.3/cookielib.* ${libdir}/python3.3/ftplib.* ${libdir}/python3.3/gopherlib.* ${libdir}/python3.3/hmac.* ${libdir}/python3.3/httplib.* ${libdir}/python3.3/mimetypes.* ${libdir}/python3.3/nntplib.* ${libdir}/python3.3/poplib.* ${libdir}/python3.3/smtplib.* ${libdir}/python3.3/telnetlib.* ${libdir}/python3.3/urllib.* ${libdir}/python3.3/urllib2.* ${libdir}/python3.3/urlparse.* ${libdir}/python3.3/uuid.* ${libdir}/python3.3/rfc822.* ${libdir}/python3.3/mimetools.* "
 
-DESCRIPTION_${PN}-netserver="Python Internet Protocol Servers"
+SUMMARY_${PN}-netserver="Python Internet Protocol servers"
 RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
 FILES_${PN}-netserver="${libdir}/python3.3/cgi.* ${libdir}/python3.3/*HTTPServer.* ${libdir}/python3.3/SocketServer.* "
 
-DESCRIPTION_${PN}-numbers="Python Number APIs"
+SUMMARY_${PN}-numbers="Python number APIs"
 RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
 FILES_${PN}-numbers="${libdir}/python3.3/decimal.* ${libdir}/python3.3/numbers.* "
 
-DESCRIPTION_${PN}-pickle="Python Persistence Support"
+SUMMARY_${PN}-pickle="Python serialisation/persistence support"
 RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
 FILES_${PN}-pickle="${libdir}/python3.3/pickle.* ${libdir}/python3.3/shelve.* ${libdir}/python3.3/lib-dynload/cPickle.*.so ${libdir}/python3.3/pickletools.* "
 
-DESCRIPTION_${PN}-pkgutil="Python Package Extension Utility Support"
+SUMMARY_${PN}-pkgutil="Python package extension utility support"
 RDEPENDS_${PN}-pkgutil="${PN}-core"
 FILES_${PN}-pkgutil="${libdir}/python3.3/pkgutil.* "
 
-DESCRIPTION_${PN}-pprint="Python Pretty-Print Support"
+SUMMARY_${PN}-pprint="Python pretty-print support"
 RDEPENDS_${PN}-pprint="${PN}-core"
 FILES_${PN}-pprint="${libdir}/python3.3/pprint.* "
 
-DESCRIPTION_${PN}-profile="Python Basic Profiling Support"
+SUMMARY_${PN}-profile="Python basic performance profiling support"
 RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
 FILES_${PN}-profile="${libdir}/python3.3/profile.* ${libdir}/python3.3/pstats.* ${libdir}/python3.3/cProfile.* ${libdir}/python3.3/lib-dynload/_lsprof.*.so "
 
-DESCRIPTION_${PN}-pydoc="Python Interactive Help Support"
+SUMMARY_${PN}-pydoc="Python interactive help support"
 RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
 FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python3.3/pydoc.* ${libdir}/python3.3/pydoc_data "
 
-DESCRIPTION_${PN}-re="Python Regular Expression APIs"
+SUMMARY_${PN}-re="Python Regular Expression APIs"
 RDEPENDS_${PN}-re="${PN}-core"
 FILES_${PN}-re="${libdir}/python3.3/re.* ${libdir}/python3.3/sre.* ${libdir}/python3.3/sre_compile.* ${libdir}/python3.3/sre_constants* ${libdir}/python3.3/sre_parse.* "
 
-DESCRIPTION_${PN}-readline="Python Readline Support"
+SUMMARY_${PN}-readline="Python readline support"
 RDEPENDS_${PN}-readline="${PN}-core"
 FILES_${PN}-readline="${libdir}/python3.3/lib-dynload/readline.*.so ${libdir}/python3.3/rlcompleter.* "
 
-DESCRIPTION_${PN}-resource="Python Resource Control Interface"
+SUMMARY_${PN}-resource="Python resource control interface"
 RDEPENDS_${PN}-resource="${PN}-core"
 FILES_${PN}-resource="${libdir}/python3.3/lib-dynload/resource.*.so "
 
-DESCRIPTION_${PN}-robotparser="Python robots.txt parser"
+SUMMARY_${PN}-robotparser="Python robots.txt parser"
 RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
 FILES_${PN}-robotparser="${libdir}/python3.3/urllib/robotparser.* "
 
-DESCRIPTION_${PN}-shell="Python Shell-Like Functionality"
+SUMMARY_${PN}-shell="Python shell-like functionality"
 RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
 FILES_${PN}-shell="${libdir}/python3.3/cmd.* ${libdir}/python3.3/commands.* ${libdir}/python3.3/dircache.* ${libdir}/python3.3/fnmatch.* ${libdir}/python3.3/glob.* ${libdir}/python3.3/popen2.* ${libdir}/python3.3/shlex.* ${libdir}/python3.3/shutil.* "
 
-DESCRIPTION_${PN}-smtpd="Python Simple Mail Transport Daemon"
+SUMMARY_${PN}-smtpd="Python Simple Mail Transport Daemon"
 RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
 FILES_${PN}-smtpd="${bindir}/smtpd.* ${libdir}/python3.3/smtpd.* "
 
-DESCRIPTION_${PN}-sqlite3="Python Sqlite3 Database Support"
+SUMMARY_${PN}-sqlite3="Python Sqlite3 database support"
 RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading"
 FILES_${PN}-sqlite3="${libdir}/python3.3/lib-dynload/_sqlite3.*.so ${libdir}/python3.3/sqlite3/dbapi2.* ${libdir}/python3.3/sqlite3/__init__.* ${libdir}/python3.3/sqlite3/dump.* "
 
-DESCRIPTION_${PN}-sqlite3-tests="Python Sqlite3 Database Support Tests"
+SUMMARY_${PN}-sqlite3-tests="Python Sqlite3 database support tests"
 RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
 FILES_${PN}-sqlite3-tests="${libdir}/python3.3/sqlite3/test "
 
-DESCRIPTION_${PN}-stringold="Python String APIs [deprecated]"
+SUMMARY_${PN}-stringold="Python string APIs [deprecated]"
 RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
 FILES_${PN}-stringold="${libdir}/python3.3/lib-dynload/strop.*.so ${libdir}/python3.3/string.* ${libdir}/python3.3/stringold.* "
 
-DESCRIPTION_${PN}-subprocess="Python Subprocess Support"
+SUMMARY_${PN}-subprocess="Python subprocess support"
 RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
 FILES_${PN}-subprocess="${libdir}/python3.3/subprocess.* "
 
-DESCRIPTION_${PN}-syslog="Python Syslog Interface"
+SUMMARY_${PN}-syslog="Python syslog interface"
 RDEPENDS_${PN}-syslog="${PN}-core"
 FILES_${PN}-syslog="${libdir}/python3.3/lib-dynload/syslog.*.so "
 
-DESCRIPTION_${PN}-terminal="Python Terminal Controlling Support"
+SUMMARY_${PN}-terminal="Python terminal controlling support"
 RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
 FILES_${PN}-terminal="${libdir}/python3.3/pty.* ${libdir}/python3.3/tty.* "
 
-DESCRIPTION_${PN}-tests="Python Tests"
+SUMMARY_${PN}-tests="Python tests"
 RDEPENDS_${PN}-tests="${PN}-core"
 FILES_${PN}-tests="${libdir}/python3.3/test "
 
-DESCRIPTION_${PN}-textutils="Python Option Parsing, Text Wrapping and Comma-Separated-Value Support"
+SUMMARY_${PN}-textutils="Python option parsing, text wrapping and CSV support"
 RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
 FILES_${PN}-textutils="${libdir}/python3.3/lib-dynload/_csv.*.so ${libdir}/python3.3/csv.* ${libdir}/python3.3/optparse.* ${libdir}/python3.3/textwrap.* "
 
-DESCRIPTION_${PN}-threading="Python Threading & Synchronization Support"
+SUMMARY_${PN}-threading="Python threading & synchronization support"
 RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
 FILES_${PN}-threading="${libdir}/python3.3/_threading_local.* ${libdir}/python3.3/dummy_thread.* ${libdir}/python3.3/dummy_threading.* ${libdir}/python3.3/mutex.* ${libdir}/python3.3/threading.* ${libdir}/python3.3/Queue.* "
 
-DESCRIPTION_${PN}-tkinter="Python Tcl/Tk Bindings"
+SUMMARY_${PN}-tkinter="Python Tcl/Tk bindings"
 RDEPENDS_${PN}-tkinter="${PN}-core"
 FILES_${PN}-tkinter="${libdir}/python3.3/lib-dynload/_tkinter.*.so ${libdir}/python3.3/lib-tk ${libdir}/python3.3/tkinter "
 
-DESCRIPTION_${PN}-unittest="Python Unit Testing Framework"
+SUMMARY_${PN}-unittest="Python unit testing framework"
 RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang"
 FILES_${PN}-unittest="${libdir}/python3.3/unittest/ "
 
-DESCRIPTION_${PN}-unixadmin="Python Unix Administration Support"
+SUMMARY_${PN}-unixadmin="Python Unix administration support"
 RDEPENDS_${PN}-unixadmin="${PN}-core"
 FILES_${PN}-unixadmin="${libdir}/python3.3/lib-dynload/nis.*.so ${libdir}/python3.3/lib-dynload/grp.*.so ${libdir}/python3.3/lib-dynload/pwd.*.so ${libdir}/python3.3/getpass.* "
 
-DESCRIPTION_${PN}-xml="Python basic XML support."
+SUMMARY_${PN}-xml="Python basic XML support"
 RDEPENDS_${PN}-xml="${PN}-core ${PN}-elementtree ${PN}-re"
 FILES_${PN}-xml="${libdir}/python3.3/lib-dynload/pyexpat.*.so ${libdir}/python3.3/xml ${libdir}/python3.3/xmllib.* "
 
-DESCRIPTION_${PN}-xmlrpc="Python XMLRPC Support"
+SUMMARY_${PN}-xmlrpc="Python XML-RPC support"
 RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
 FILES_${PN}-xmlrpc="${libdir}/python3.3/xmlrpclib.* ${libdir}/python3.3/SimpleXMLRPCServer.* ${libdir}/python3.3/DocXMLRPCServer.* ${libdir}/python3.3/xmlrpc "
 
-DESCRIPTION_${PN}-modules="All Python modules"
+SUMMARY_${PN}-modules="All Python modules"
 RDEPENDS_${PN}-modules="${PN}-2to3 ${PN}-audio ${PN}-codecs ${PN}-compile ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc  "
 ALLOW_EMPTY_${PN}-modules = "1"
 
diff --git a/scripts/contrib/python/generate-manifest-3.3.py b/scripts/contrib/python/generate-manifest-3.3.py
index 273f99f..23d1887 100755
--- a/scripts/contrib/python/generate-manifest-3.3.py
+++ b/scripts/contrib/python/generate-manifest-3.3.py
@@ -166,7 +166,7 @@ if __name__ == "__main__":
     # Parameters: revision, name, description, dependencies, filenames
     #
 
-    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "${PN}-lang ${PN}-re",
+    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re",
     "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
@@ -179,7 +179,7 @@ if __name__ == "__main__":
     "${libdir}/python${PYTHON_MAJMIN}/collections " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
-    m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
+    m.addPackage( "${PN}-dev", "Python development package", "${PN}-core",
     "${includedir} " +
     "${libdir}/lib*${SOLIBSDEV} " +
     "${libdir}/*.la " +
@@ -191,13 +191,13 @@ if __name__ == "__main__":
     "${datadir}/aclocal " +
     "${datadir}/pkgconfig " )
 
-    m.addPackage( "${PN}-2to3", "Python Automated Python 2 to 3 code translation", "${PN}-core",
+    m.addPackage( "${PN}-2to3", "Python automated Python 2 to 3 code translator", "${PN}-core",
     "${bindir}/2to3 lib2to3" ) # package
 
     m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
     "${bindir}/idle idlelib" ) # package
 
-    m.addPackage( "${PN}-pydoc", "Python Interactive Help Support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
+    m.addPackage( "${PN}-pydoc", "Python interactive help support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
     "${bindir}/pydoc pydoc.* pydoc_data" )
 
     m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
@@ -206,175 +206,175 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.*.so lib-dynload/audioop.*.so audiodev.* sunaudio.* sunau.* toaiff.*" )
 
-    m.addPackage( "${PN}-codecs", "Python Codecs, Encodings & i18n Support", "${PN}-core ${PN}-lang",
+    m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n support", "${PN}-core ${PN}-lang",
     "codecs.* encodings gettext.* locale.* lib-dynload/_locale.*.so lib-dynload/_codecs* lib-dynload/_multibytecodec.*.so lib-dynload/unicodedata.*.so stringprep.* xdrlib.*" )
 
-    m.addPackage( "${PN}-compile", "Python Bytecode Compilation Support", "${PN}-core",
+    m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "${PN}-compression", "Python High Level Compression Support", "${PN}-core ${PN}-codecs",
+    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-codecs",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.*.so" )
 
-    m.addPackage( "${PN}-crypt", "Python Basic Cryptographic and Hashing Support", "${PN}-core",
+    m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.*.so lib-dynload/_hashlib.*.so lib-dynload/_sha256.*.so lib-dynload/_sha512.*.so" )
 
-    m.addPackage( "${PN}-textutils", "Python Option Parsing, Text Wrapping and Comma-Separated-Value Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
+    m.addPackage( "${PN}-textutils", "Python option parsing, text wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
     "lib-dynload/_csv.*.so csv.* optparse.* textwrap.*" )
 
-    m.addPackage( "${PN}-curses", "Python Curses Support", "${PN}-core",
+    m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
     "curses lib-dynload/_curses.*.so lib-dynload/_curses_panel.*.so" ) # directory + low level module
 
-    m.addPackage( "${PN}-ctypes", "Python C Types Support", "${PN}-core",
+    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core",
     "ctypes lib-dynload/_ctypes.*.so lib-dynload/_ctypes_test.*.so" ) # directory + low level module
 
-    m.addPackage( "${PN}-datetime", "Python Calendar and Time support", "${PN}-core ${PN}-codecs",
+    m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
     "_strptime.* calendar.* lib-dynload/datetime.*.so" )
 
-    m.addPackage( "${PN}-db", "Python File-Based Database Support", "${PN}-core",
+    m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* dbm lib-dynload/_dbm.*.so" )
 
-    m.addPackage( "${PN}-debugger", "Python Debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
+    m.addPackage( "${PN}-debugger", "Python debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
     "bdb.* pdb.*" )
 
-    m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects.", "${PN}-lang ${PN}-re",
+    m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects", "${PN}-lang ${PN}-re",
     "difflib.*" )
 
-    m.addPackage( "${PN}-distutils-staticdev", "Python Distribution Utilities (Static Libraries)", "${PN}-distutils",
+    m.addPackage( "${PN}-distutils-staticdev", "Python distribution utilities (static libraries)", "${PN}-distutils",
     "config/lib*.a" ) # package
 
     m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core",
     "config distutils" ) # package
 
-    m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings.", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
+    m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
     "doctest.*" )
 
     # FIXME consider adding to some higher level package
     m.addPackage( "${PN}-elementtree", "Python elementree", "${PN}-core",
     "lib-dynload/_elementtree.*.so" )
 
-    m.addPackage( "${PN}-email", "Python Email Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
+    m.addPackage( "${PN}-email", "Python email support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
     "imaplib.* email" ) # package
 
-    m.addPackage( "${PN}-fcntl", "Python's fcntl Interface", "${PN}-core",
+    m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
     "lib-dynload/fcntl.*.so" )
 
-    m.addPackage( "${PN}-html", "Python HTML Processing", "${PN}-core",
+    m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
-    m.addPackage( "${PN}-gdbm", "Python GNU Database Support", "${PN}-core",
+    m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/_gdbm.*.so" )
 
-    m.addPackage( "${PN}-image", "Python Graphical Image Handling", "${PN}-core",
+    m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.*.so lib-dynload/rgbimg.*.so" )
 
-    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math",
+    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math",
     "lib-dynload/_socket.*.so lib-dynload/_io.*.so lib-dynload/_ssl.*.so lib-dynload/select.*.so lib-dynload/termios.*.so lib-dynload/cStringIO.*.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-    m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN}-math ${PN}-re",
+    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
     "json lib-dynload/_json.*.so" ) # package
 
-    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${PN}-core",
+    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
     "lib-dynload/_bisect.*.so lib-dynload/_collections.*.so lib-dynload/_heapq.*.so lib-dynload/_weakref.*.so lib-dynload/_functools.*.so " +
     "lib-dynload/array.*.so lib-dynload/itertools.*.so lib-dynload/operator.*.so lib-dynload/parser.*.so " +
     "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* weakref.*" )
 
-    m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
+    m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
 
-    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
+    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
-    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core",
+    m.addPackage( "${PN}-math", "Python math support", "${PN}-core",
     "lib-dynload/cmath.*.so lib-dynload/math.*.so lib-dynload/_random.*.so random.* sets.*" )
 
-    m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core ${PN}-io",
     "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
 
-    m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-mmap", "Python memory-mapped file support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.*.so " )
 
-    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing Support", "${PN}-core ${PN}-io ${PN}-lang",
+    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang",
     "lib-dynload/_multiprocessing.*.so multiprocessing" ) # package
 
-    m.addPackage( "${PN}-netclient", "Python Internet Protocol Clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
+    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
 
-    m.addPackage( "${PN}-netserver", "Python Internet Protocol Servers", "${PN}-core ${PN}-netclient",
+    m.addPackage( "${PN}-netserver", "Python Internet Protocol servers", "${PN}-core ${PN}-netclient",
     "cgi.* *HTTPServer.* SocketServer.*" )
 
-    m.addPackage( "${PN}-numbers", "Python Number APIs", "${PN}-core ${PN}-lang ${PN}-re",
+    m.addPackage( "${PN}-numbers", "Python number APIs", "${PN}-core ${PN}-lang ${PN}-re",
     "decimal.* numbers.*" )
 
-    m.addPackage( "${PN}-pickle", "Python Persistence Support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
+    m.addPackage( "${PN}-pickle", "Python serialisation/persistence support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
     "pickle.* shelve.* lib-dynload/cPickle.*.so pickletools.*" )
 
-    m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility Support", "${PN}-core",
+    m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
 
-    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support", "${PN}-core",
+    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core",
     "pprint.*" )
 
-    m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "${PN}-core ${PN}-textutils",
+    m.addPackage( "${PN}-profile", "Python basic performance profiling support", "${PN}-core ${PN}-textutils",
     "profile.* pstats.* cProfile.* lib-dynload/_lsprof.*.so" )
 
     m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
     "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin
 
-    m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-core",
+    m.addPackage( "${PN}-readline", "Python readline support", "${PN}-core",
     "lib-dynload/readline.*.so rlcompleter.*" )
 
-    m.addPackage( "${PN}-resource", "Python Resource Control Interface", "${PN}-core",
+    m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.*.so" )
 
-    m.addPackage( "${PN}-shell", "Python Shell-Like Functionality", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
     m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
     "urllib/robotparser.*")
 
-    m.addPackage( "${PN}-subprocess", "Python Subprocess Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
+    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
-    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 Database Support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading",
+    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading",
     "lib-dynload/_sqlite3.*.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
 
-    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 Database Support Tests", "${PN}-core ${PN}-sqlite3",
+    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 database support tests", "${PN}-core ${PN}-sqlite3",
     "sqlite3/test" )
 
-    m.addPackage( "${PN}-stringold", "Python String APIs [deprecated]", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-stringold", "Python string APIs [deprecated]", "${PN}-core ${PN}-re",
     "lib-dynload/strop.*.so string.* stringold.*" )
 
-    m.addPackage( "${PN}-syslog", "Python Syslog Interface", "${PN}-core",
+    m.addPackage( "${PN}-syslog", "Python syslog interface", "${PN}-core",
     "lib-dynload/syslog.*.so" )
 
-    m.addPackage( "${PN}-terminal", "Python Terminal Controlling Support", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-terminal", "Python terminal controlling support", "${PN}-core ${PN}-io",
     "pty.* tty.*" )
 
-    m.addPackage( "${PN}-tests", "Python Tests", "${PN}-core",
+    m.addPackage( "${PN}-tests", "Python tests", "${PN}-core",
     "test" ) # package
 
-    m.addPackage( "${PN}-threading", "Python Threading & Synchronization Support", "${PN}-core ${PN}-lang",
+    m.addPackage( "${PN}-threading", "Python threading & synchronization support", "${PN}-core ${PN}-lang",
     "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* Queue.*" )
 
-    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk Bindings", "${PN}-core",
+    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk bindings", "${PN}-core",
     "lib-dynload/_tkinter.*.so lib-tk tkinter" ) # package
 
-    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang",
+    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang",
     "unittest/" )
 
-    m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
+    m.addPackage( "${PN}-unixadmin", "Python Unix administration support", "${PN}-core",
     "lib-dynload/nis.*.so lib-dynload/grp.*.so lib-dynload/pwd.*.so getpass.*" )
 
-    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-core ${PN}-elementtree ${PN}-re",
+    m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core ${PN}-elementtree ${PN}-re",
     "lib-dynload/pyexpat.*.so xml xmllib.*" ) # package
 
-    m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
+    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
     "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.* xmlrpc" )
 
-    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
+    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
     m.make()
-- 
1.8.5.3


