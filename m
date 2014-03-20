Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 03B596F98E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 19:24:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Mar 2014 12:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,697,1389772800"; d="scan'208";a="476625243"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.120.182])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2014 12:24:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2014 19:24:35 +0000
Message-Id: <70f072513f5596661fc91a6900cf150857ab13e2.1395343268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] generate-manifest-2.7.py: sync with python-2.7-manifest.inc
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
X-List-Received-Date: Thu, 20 Mar 2014 19:24:56 -0000

Some changes were made earlier by me to SUMMARY values in
python-2.7-manifest.inc without changing the manifest script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/python/generate-manifest-2.7.py | 118 ++++++++++++------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/scripts/contrib/python/generate-manifest-2.7.py b/scripts/contrib/python/generate-manifest-2.7.py
index 419268d..4356ad0 100755
--- a/scripts/contrib/python/generate-manifest-2.7.py
+++ b/scripts/contrib/python/generate-manifest-2.7.py
@@ -163,7 +163,7 @@ if __name__ == "__main__":
     # Parameters: revision, name, description, dependencies, filenames
     #
 
-    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "${PN}-lang ${PN}-re",
+    m.addPackage( "${PN}-core", "Python interpreter and core modules", "${PN}-lang ${PN}-re",
     "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
@@ -175,7 +175,7 @@ if __name__ == "__main__":
     "${includedir}/python${PYTHON_MAJMIN}/pyconfig*.h " +
     "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py ")
 
-    m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
+    m.addPackage( "${PN}-dev", "Python development package", "${PN}-core",
     "${includedir} " +
     "${libdir}/lib*${SOLIBSDEV} " +
     "${libdir}/*.la " +
@@ -187,13 +187,13 @@ if __name__ == "__main__":
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
@@ -202,187 +202,187 @@ if __name__ == "__main__":
     m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-dynload/audioop.so audiodev.* sunaudio.* sunau.* toaiff.*" )
 
-    m.addPackage( "${PN}-bsddb", "Python Berkeley Database Bindings", "${PN}-core",
+    m.addPackage( "${PN}-bsddb", "Python bindings for the Berkeley Database", "${PN}-core",
     "bsddb lib-dynload/_bsddb.so" ) # package
 
-    m.addPackage( "${PN}-codecs", "Python Codecs, Encodings & i18n Support", "${PN}-core ${PN}-lang",
+    m.addPackage( "${PN}-codecs", "Python codecs, encodings & i18n support", "${PN}-core ${PN}-lang",
     "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-dynload/_codecs* lib-dynload/_multibytecodec.so lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
 
-    m.addPackage( "${PN}-compile", "Python Bytecode Compilation Support", "${PN}-core",
+    m.addPackage( "${PN}-compile", "Python bytecode compilation support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "${PN}-compiler", "Python Compiler Support", "${PN}-core",
+    m.addPackage( "${PN}-compiler", "Python compiler support", "${PN}-core",
     "compiler" ) # package
 
-    m.addPackage( "${PN}-compression", "Python High Level Compression Support", "${PN}-core ${PN}-zlib",
+    m.addPackage( "${PN}-compression", "Python high-level compression support", "${PN}-core ${PN}-zlib",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
 
-    m.addPackage( "${PN}-crypt", "Python Basic Cryptographic and Hashing Support", "${PN}-core",
+    m.addPackage( "${PN}-crypt", "Python basic cryptographic and hashing support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.so lib-dynload/_hashlib.so lib-dynload/_sha256.so lib-dynload/_sha512.so" )
 
-    m.addPackage( "${PN}-textutils", "Python Option Parsing, Text Wrapping and Comma-Separated-Value Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
+    m.addPackage( "${PN}-textutils", "Python option parsing, text wrapping and CSV support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
     "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
 
-    m.addPackage( "${PN}-curses", "Python Curses Support", "${PN}-core",
+    m.addPackage( "${PN}-curses", "Python curses support", "${PN}-core",
     "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) # directory + low level module
 
-    m.addPackage( "${PN}-ctypes", "Python C Types Support", "${PN}-core",
+    m.addPackage( "${PN}-ctypes", "Python C types support", "${PN}-core",
     "ctypes lib-dynload/_ctypes.so lib-dynload/_ctypes_test.so" ) # directory + low level module
 
-    m.addPackage( "${PN}-datetime", "Python Calendar and Time support", "${PN}-core ${PN}-codecs",
+    m.addPackage( "${PN}-datetime", "Python calendar and time support", "${PN}-core ${PN}-codecs",
     "_strptime.* calendar.* lib-dynload/datetime.so" )
 
-    m.addPackage( "${PN}-db", "Python File-Based Database Support", "${PN}-core",
+    m.addPackage( "${PN}-db", "Python file-based database support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* " )
 
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
     "lib-dynload/_elementtree.so" )
 
-    m.addPackage( "${PN}-email", "Python Email Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
+    m.addPackage( "${PN}-email", "Python email support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
     "imaplib.* email" ) # package
 
-    m.addPackage( "${PN}-fcntl", "Python's fcntl Interface", "${PN}-core",
+    m.addPackage( "${PN}-fcntl", "Python's fcntl interface", "${PN}-core",
     "lib-dynload/fcntl.so" )
 
-    m.addPackage( "${PN}-hotshot", "Python Hotshot Profiler", "${PN}-core",
+    m.addPackage( "${PN}-hotshot", "Python hotshot performance profiler", "${PN}-core",
     "hotshot lib-dynload/_hotshot.so" )
 
-    m.addPackage( "${PN}-html", "Python HTML Processing", "${PN}-core",
+    m.addPackage( "${PN}-html", "Python HTML processing support", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* HTMLParser.* " )
 
-    m.addPackage( "${PN}-gdbm", "Python GNU Database Support", "${PN}-core",
+    m.addPackage( "${PN}-gdbm", "Python GNU database support", "${PN}-core",
     "lib-dynload/gdbm.so" )
 
-    m.addPackage( "${PN}-image", "Python Graphical Image Handling", "${PN}-core",
+    m.addPackage( "${PN}-image", "Python graphical image handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math ${PN}-textutils",
+    m.addPackage( "${PN}-io", "Python low-level I/O", "${PN}-core ${PN}-math ${PN}-textutils",
     "lib-dynload/_socket.so lib-dynload/_io.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* io.* _pyio.*" )
 
-    m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN}-math ${PN}-re",
+    m.addPackage( "${PN}-json", "Python JSON support", "${PN}-core ${PN}-math ${PN}-re",
     "json lib-dynload/_json.so" ) # package
 
-    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${PN}-core",
+    m.addPackage( "${PN}-lang", "Python low-level language support", "${PN}-core",
     "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
     "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so lib-dynload/parser.so " +
     "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* weakref.*" )
 
-    m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
+    m.addPackage( "${PN}-logging", "Python logging support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
 
-    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
+    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
-    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core ${PN}-crypt",
+    m.addPackage( "${PN}-math", "Python math support", "${PN}-core ${PN}-crypt",
     "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so random.* sets.*" )
 
-    m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-mime", "Python MIME handling APIs", "${PN}-core ${PN}-io",
     "mimetools.* uu.* quopri.* rfc822.* MimeWriter.*" )
 
-    m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-mmap", "Python memory-mapped file support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.so " )
 
-    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
+    m.addPackage( "${PN}-multiprocessing", "Python multiprocessing support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-threading ${PN}-ctypes ${PN}-mmap",
     "lib-dynload/_multiprocessing.so multiprocessing" ) # package
 
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
     "pickle.* shelve.* lib-dynload/cPickle.so pickletools.*" )
 
-    m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility Support", "${PN}-core",
+    m.addPackage( "${PN}-pkgutil", "Python package extension utility support", "${PN}-core",
     "pkgutil.*")
 
-    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support", "${PN}-core ${PN}-io",
+    m.addPackage( "${PN}-pprint", "Python pretty-print support", "${PN}-core ${PN}-io",
     "pprint.*" )
 
-    m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "${PN}-core ${PN}-textutils",
+    m.addPackage( "${PN}-profile", "Python basic performance profiling support", "${PN}-core ${PN}-textutils",
     "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
 
     m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
     "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin
 
-    m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-core",
+    m.addPackage( "${PN}-readline", "Python readline support", "${PN}-core",
     "lib-dynload/readline.so rlcompleter.*" )
 
-    m.addPackage( "${PN}-resource", "Python Resource Control Interface", "${PN}-core",
+    m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
     "lib-dynload/resource.so" )
 
-    m.addPackage( "${PN}-shell", "Python Shell-Like Functionality", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-shell", "Python shell-like functionality", "${PN}-core ${PN}-re",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
     m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
     "robotparser.*")
 
-    m.addPackage( "${PN}-subprocess", "Python Subprocess Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
+    m.addPackage( "${PN}-subprocess", "Python subprocess support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
-    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 Database Support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib",
+    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 database support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib",
     "lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
 
-    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 Database Support Tests", "${PN}-core ${PN}-sqlite3",
+    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 database support tests", "${PN}-core ${PN}-sqlite3",
     "sqlite3/test" )
 
-    m.addPackage( "${PN}-stringold", "Python String APIs [deprecated]", "${PN}-core ${PN}-re",
+    m.addPackage( "${PN}-stringold", "Python string APIs [deprecated]", "${PN}-core ${PN}-re",
     "lib-dynload/strop.so string.* stringold.*" )
 
-    m.addPackage( "${PN}-syslog", "Python Syslog Interface", "${PN}-core",
+    m.addPackage( "${PN}-syslog", "Python syslog interface", "${PN}-core",
     "lib-dynload/syslog.so" )
 
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
     "lib-dynload/_tkinter.so lib-tk" ) # package
 
-    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
+    m.addPackage( "${PN}-unittest", "Python unit testing framework", "${PN}-core ${PN}-stringold ${PN}-lang ${PN}-io ${PN}-difflib ${PN}-pprint ${PN}-shell",
     "unittest/" )
 
-    m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
+    m.addPackage( "${PN}-unixadmin", "Python Unix administration support", "${PN}-core",
     "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
 
-    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-core ${PN}-elementtree ${PN}-re",
+    m.addPackage( "${PN}-xml", "Python basic XML support", "${PN}-core ${PN}-elementtree ${PN}-re",
     "lib-dynload/pyexpat.so xml xmllib.*" ) # package
 
-    m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
+    m.addPackage( "${PN}-xmlrpc", "Python XML-RPC support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
     "xmlrpclib.* SimpleXMLRPCServer.* DocXMLRPCServer.*" )
 
-    m.addPackage( "${PN}-zlib", "Python zlib Support.", "${PN}-core",
+    m.addPackage( "${PN}-zlib", "Python zlib compression support", "${PN}-core",
     "lib-dynload/zlib.so" )
 
-    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
+    m.addPackage( "${PN}-mailbox", "Python mailbox format support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
     m.make()
-- 
1.8.5.3


