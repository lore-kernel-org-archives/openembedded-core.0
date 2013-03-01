Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1UBRmW-0006vh-2Z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 16:22:22 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Mar 2013 07:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,761,1355126400"; d="scan'208";a="263142358"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by azsmga001.ch.intel.com with ESMTP; 01 Mar 2013 07:05:29 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 17:06:41 +0200
Message-Id: <1362150401-9826-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] apt: upgrade to 0.9.7.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 15:22:34 -0000

bb files: remove invalid config.sub/config.guess files (autotools will
generate the correct files)
allocate-larger-memory.patch: not needed anymore
fix-gcc-4.6-null-not-defined.patch: added
	- include header that defines NULL
includes-fix.patch: not needed anymore
localefixes.patch: removed
	- not necessary anymore (no compiling errors)
makerace.patch: adapted to the new version
no-ko-translation.patch: adapted to the new version
no-nls-dpkg.patch: added
	- fix build without nls
noconfigure.patch: adapted to the new version
nodoc.patch: adapted to the new version (apply patch on all cases
because the doc generation needs docbook-xsl)
remove-redeclaration.patch: not needed anymore
truncate-filename.patch: moved
use-host.patch: adapted to the new version
no-curl.patch: adapted to the new version
disable-configure-in-makefile.patch: added
    - do not run configure at do_compile

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../apt/apt-0.7.14/allocate-larger-memory.patch    | 75 ------------------
 .../apt/apt-0.7.14/includes-fix.patch              | 44 -----------
 .../apt/apt-0.7.14/localefixes.patch               | 91 ----------------------
 .../apt/apt-0.7.14/remove-redeclaration.patch      | 63 ---------------
 .../disable-configure-in-makefile.patch            | 18 +++++
 .../apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch | 10 +++
 .../apt/{apt-0.7.14 => apt-0.9.7.7}/makerace.patch |  0
 .../no-ko-translation.patch                        |  8 +-
 .../apt/apt-0.9.7.7/no-nls-dpkg.patch              | 24 ++++++
 .../{apt-0.7.14 => apt-0.9.7.7}/noconfigure.patch  | 39 +++++-----
 .../apt/{apt-0.7.14 => apt-0.9.7.7}/nodoc.patch    | 21 +++--
 .../truncate-filename.patch                        |  0
 .../apt/{apt-0.7.14 => apt-0.9.7.7}/use-host.patch | 37 +--------
 meta/recipes-devtools/apt/apt-native.inc           |  2 +
 ...{apt-native_0.7.14.bb => apt-native_0.9.7.7.bb} | 12 ++-
 meta/recipes-devtools/apt/apt-package.inc          | 39 ++--------
 meta/recipes-devtools/apt/apt.inc                  | 12 ++-
 .../apt/{apt_0.7.14.bb => apt_0.9.7.7.bb}          |  8 +-
 meta/recipes-devtools/apt/files/no-curl.patch      | 26 +++----
 19 files changed, 122 insertions(+), 407 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
 delete mode 100644 meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch
 create mode 100644 meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/no-ko-translation.patch (28%)
 create mode 100644 meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/noconfigure.patch (23%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/nodoc.patch (32%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.7.14 => apt-0.9.7.7}/use-host.patch (31%)
 rename meta/recipes-devtools/apt/{apt-native_0.7.14.bb => apt-native_0.9.7.7.bb} (26%)
 rename meta/recipes-devtools/apt/{apt_0.7.14.bb => apt_0.9.7.7.bb} (64%)

diff --git a/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch b/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
deleted file mode 100644
index 36e1499..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/allocate-larger-memory.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-Method file has died unexpectedly
-
-"Method file has died unexpectedly!", this is because the "char S[1024]"
-is not enough for the long the URI, "char S[2048]" would be enough.
-
-It would be boring if we use malloc here since we can't know how much
-memory is needed except strelen() every component of it. So similarly
-use "char S[2048]" as it did before.
-
-Upstream-Status: Pending
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- apt-pkg/acquire-method.cc |   12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/apt-pkg/acquire-method.cc b/apt-pkg/acquire-method.cc
---- a/apt-pkg/acquire-method.cc
-+++ b/apt-pkg/acquire-method.cc
-@@ -95,7 +95,7 @@ void pkgAcqMethod::Fail(string Err,bool Transient)
- 	 *I = ' ';
-    }
-    
--   char S[1024];
-+   char S[2048];
-    if (Queue != 0)
-    {
-       snprintf(S,sizeof(S)-50,"400 URI Failure\nURI: %s\n"
-@@ -132,7 +132,7 @@ void pkgAcqMethod::URIStart(FetchResult &Res)
-    if (Queue == 0)
-       abort();
-    
--   char S[1024] = "";
-+   char S[2048] = "";
-    char *End = S;
-    
-    End += snprintf(S,sizeof(S),"200 URI Start\nURI: %s\n",Queue->Uri.c_str());
-@@ -160,7 +160,7 @@ void pkgAcqMethod::URIDone(FetchResult &Res, FetchResult *Alt)
-    if (Queue == 0)
-       abort();
-    
--   char S[1024] = "";
-+   char S[2048] = "";
-    char *End = S;
-    
-    End += snprintf(S,sizeof(S),"201 URI Done\nURI: %s\n",Queue->Uri.c_str());
-@@ -242,7 +242,7 @@ void pkgAcqMethod::URIDone(FetchResult &Res, FetchResult *Alt)
-    to be ackd */
- bool pkgAcqMethod::MediaFail(string Required,string Drive)
- {
--   char S[1024];
-+   char S[2048];
-    snprintf(S,sizeof(S),"403 Media Failure\nMedia: %s\nDrive: %s\n\n",
- 	    Required.c_str(),Drive.c_str());
- 
-@@ -411,7 +411,7 @@ void pkgAcqMethod::Log(const char *Format,...)
-    va_start(args,Format);
- 
-    // sprintf the description
--   char S[1024];
-+   char S[2048];
-    unsigned int Len = snprintf(S,sizeof(S)-4,"101 Log\nURI: %s\n"
- 			       "Message: ",CurrentURI.c_str());
- 
-@@ -435,7 +435,7 @@ void pkgAcqMethod::Status(const char *Format,...)
-    va_start(args,Format);
- 
-    // sprintf the description
--   char S[1024];
-+   char S[2048];
-    unsigned int Len = snprintf(S,sizeof(S)-4,"102 Status\nURI: %s\n"
- 			       "Message: ",CurrentURI.c_str());
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch b/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
deleted file mode 100644
index c85c388..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/includes-fix.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Upstream-Status: Backport
-
-Add missing includes required when building with modern toolchain, based on
-patch from Debian bugzilla:
-http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=505954
-
-Should no longer be required once upgraded to 0.7.22 or later.
-
-Index: apt-0.7.14/apt-pkg/acquire.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/acquire.cc	2008-05-28 14:22:13.000000000 +0100
-+++ apt-0.7.14/apt-pkg/acquire.cc	2010-07-23 17:30:11.494883936 +0100
-@@ -22,6 +22,7 @@
- 
- #include <apti18n.h>
- 
-+#include <cstdio>
- #include <iostream>
- #include <sstream>
-     
-Index: apt-0.7.14/apt-pkg/contrib/sha256.h
-===================================================================
---- apt-0.7.14.orig/apt-pkg/contrib/sha256.h	2008-05-28 14:22:14.000000000 +0100
-+++ apt-0.7.14/apt-pkg/contrib/sha256.h	2010-07-23 17:30:11.494883936 +0100
-@@ -14,6 +14,7 @@
- #ifndef APTPKG_SHA256_H
- #define APTPKG_SHA256_H
- 
-+#include <stdint.h>
- #include <string>
- #include <cstring>
- #include <algorithm>
-Index: apt-0.7.14/apt-pkg/deb/dpkgpm.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/deb/dpkgpm.cc	2008-05-28 14:22:14.000000000 +0100
-+++ apt-0.7.14/apt-pkg/deb/dpkgpm.cc	2010-07-23 17:30:36.960856870 +0100
-@@ -20,6 +20,7 @@
- #include <stdlib.h>
- #include <fcntl.h>
- #include <sys/select.h>
-+#include <sys/stat.h>
- #include <sys/types.h>
- #include <sys/wait.h>
- #include <signal.h>
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch b/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
deleted file mode 100644
index 8025273..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/localefixes.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-Add in missing header includes to resolve compile failures with recent 
-compiler/glibc combinations.
-
-Upstream-Status: Inappropriate [Resolved upstream]
-
-RP 2011/11/23
-
-Index: apt-0.7.14/apt-pkg/init.cc
-===================================================================
---- apt-0.7.14.orig/apt-pkg/init.cc	2011-11-23 22:48:53.544637868 +0000
-+++ apt-0.7.14/apt-pkg/init.cc	2011-11-23 22:48:59.456638260 +0000
-@@ -16,6 +16,7 @@
- #include <config.h>
- #include <cstdlib>
- #include <sys/stat.h>
-+#include <locale>
- 									/*}}}*/
- 
- #define Stringfy_(x) # x
-Index: apt-0.7.14/cmdline/apt-cache.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-cache.cc	2011-11-23 22:53:29.048631067 +0000
-+++ apt-0.7.14/cmdline/apt-cache.cc	2011-11-23 22:54:15.784616212 +0000
-@@ -32,6 +32,7 @@
- #include <apti18n.h>
- 
- #include <locale.h>
-+#include <locale>
- #include <iostream>
- #include <unistd.h>
- #include <errno.h>
-Index: apt-0.7.14/cmdline/apt-cdrom.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-cdrom.cc	2011-11-23 22:53:29.064631096 +0000
-+++ apt-0.7.14/cmdline/apt-cdrom.cc	2011-11-23 22:53:57.616630261 +0000
-@@ -27,6 +27,7 @@
- //#include "indexcopy.h"
- 
- #include <locale.h>
-+#include <locale>
- #include <iostream>
- #include <fstream>
- #include <vector>
-Index: apt-0.7.14/cmdline/apt-config.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-config.cc	2011-11-23 22:50:16.796635352 +0000
-+++ apt-0.7.14/cmdline/apt-config.cc	2011-11-23 22:50:25.640633906 +0000
-@@ -27,6 +27,7 @@
- #include <locale.h>
- #include <iostream>
- #include <string>
-+#include <locale>
- 									/*}}}*/
- using namespace std;
- 
-Index: apt-0.7.14/cmdline/apt-extracttemplates.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:29.080631084 +0000
-+++ apt-0.7.14/cmdline/apt-extracttemplates.cc	2011-11-23 22:53:38.304630439 +0000
-@@ -39,6 +39,7 @@
- #include <config.h>
- #include <apti18n.h>
- #include "apt-extracttemplates.h"
-+#include <locale>
- 									/*}}}*/
- 
- using namespace std;
-Index: apt-0.7.14/cmdline/apt-get.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-get.cc	2011-11-23 22:53:29.096631090 +0000
-+++ apt-0.7.14/cmdline/apt-get.cc	2011-11-23 22:53:49.368629452 +0000
-@@ -48,6 +48,7 @@
- 
- #include <set>
- #include <locale.h>
-+#include <locale>
- #include <langinfo.h>
- #include <fstream>
- #include <termios.h>
-Index: apt-0.7.14/cmdline/apt-sortpkgs.cc
-===================================================================
---- apt-0.7.14.orig/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:03.872640247 +0000
-+++ apt-0.7.14/cmdline/apt-sortpkgs.cc	2011-11-23 22:52:10.880638611 +0000
-@@ -27,6 +27,7 @@
- 
- #include <locale.h>
- #include <unistd.h>
-+#include <locale>
- 									/*}}}*/
- 
- using namespace std;
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch b/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
deleted file mode 100644
index 8d7c891..0000000
--- a/meta/recipes-devtools/apt/apt-0.7.14/remove-redeclaration.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Fix build errors on gcc 4.7:
-
-deb/deblistparser.cc: In member function 'virtual short unsigned int debListParser::VersionHash()':
-deb/deblistparser.cc:212:13: error: redeclaration of 'char* I'
-deb/deblistparser.cc:202:22: error: 'const char** I' previously declared here
-
-Upstream-Status: Backport
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- apt-pkg/deb/deblistparser.cc |   10 +++++-----
- cmdline/apt-get.cc           |    8 ++++----
- 2 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/apt-pkg/deb/deblistparser.cc b/apt-pkg/deb/deblistparser.cc
---- a/apt-pkg/deb/deblistparser.cc
-+++ b/apt-pkg/deb/deblistparser.cc
-@@ -209,18 +209,18 @@ unsigned short debListParser::VersionHash()
-       /* Strip out any spaces from the text, this undoes dpkgs reformatting
-          of certain fields. dpkg also has the rather interesting notion of
-          reformatting depends operators < -> <= */
--      char *I = S;
-+      char *J = S;
-       for (; Start != End; Start++)
-       {
- 	 if (isspace(*Start) == 0)
--	    *I++ = tolower(*Start);
-+	    *J++ = tolower(*Start);
- 	 if (*Start == '<' && Start[1] != '<' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
- 	 if (*Start == '>' && Start[1] != '>' && Start[1] != '=')
--	    *I++ = '=';
-+	    *J++ = '=';
-       }
- 
--      Result = AddCRC16(Result,S,I - S);
-+      Result = AddCRC16(Result,S,J - S);
-    }
-    
-    return Result;
-diff --git a/cmdline/apt-get.cc b/cmdline/apt-get.cc
---- a/cmdline/apt-get.cc
-+++ b/cmdline/apt-get.cc
-@@ -1752,12 +1752,12 @@ bool DoInstall(CommandLine &CmdL)
- 	 if ((*Cache)[I].Install() == false)
- 	    continue;
- 
--	 const char **J;
--	 for (J = CmdL.FileList + 1; *J != 0; J++)
--	    if (strcmp(*J,I.Name()) == 0)
-+	 const char **K;
-+	 for (K = CmdL.FileList + 1; *K != 0; K++)
-+	    if (strcmp(*K,I.Name()) == 0)
- 		break;
- 	 
--	 if (*J == 0) {
-+	 if (*K == 0) {
- 	    List += string(I.Name()) + " ";
- 	    VersionsList += string(Cache[I].CandVersion) + "\n";
- 	 }
--- 
-1.7.1
-
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch
new file mode 100644
index 0000000..7c2f64e
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/disable-configure-in-makefile.patch
@@ -0,0 +1,18 @@
+Disable configure at compilation stage
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: apt-0.9.7.7/Makefile
+===================================================================
+--- apt-0.9.7.7.orig/Makefile
++++ apt-0.9.7.7/Makefile
+@@ -33,7 +33,7 @@ veryclean: clean
+ # The startup target builds the necessary configure scripts. It should
+ # be used after a CVS checkout.
+ CONVERTED=environment.mak include/config.h include/apti18n.h build/doc/Doxyfile makefile
+-include buildlib/configure.mak
++#include buildlib/configure.mak
+ $(BUILDDIR)/include/config.h: buildlib/config.h.in
+ $(BUILDDIR)/include/apti18n.h: buildlib/apti18n.h.in
+ $(BUILDDIR)/environment.mak: buildlib/environment.mak.in
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
new file mode 100644
index 0000000..70ecd95
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/fix-gcc-4.6-null-not-defined.patch
@@ -0,0 +1,10 @@
+--- a/apt-pkg/contrib/weakptr.h
++++ b/apt-pkg/contrib/weakptr.h
+@@ -21,6 +21,7 @@
+ #ifndef WEAK_POINTER_H
+ #define WEAK_POINTER_H
+ 
++#include <cstdlib>
+ #include <set>
+ /**
+  * Class for objects providing support for weak pointers.
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/makerace.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/makerace.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/makerace.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/makerace.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/no-ko-translation.patch
similarity index 28%
rename from meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/no-ko-translation.patch
index 7fd1db8..7aa408f 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/no-ko-translation.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/no-ko-translation.patch
@@ -4,8 +4,8 @@ Upstream-Status: Inappropriate [configuration]
  po/LINGUAS |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- apt-0.7.14.orig/po/LINGUAS
-+++ apt-0.7.14/po/LINGUAS
+--- a/po/LINGUAS
++++ b/po/LINGUAS
 @@ -1 +1 @@
--ar bg bs ca cs cy da de dz el en_GB es eu fi fr gl he hu it ja km ko ku mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
-+ar bg bs ca cs cy da de dz el en_GB es eu fi fr gl he hu it ja km ku mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
+-ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ko ku lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
++ar ast bg bs ca cs cy da de dz el es eu fi fr gl hu it ja km ku lt mr nb ne nl nn pl pt pt_BR ro ru sk sl sv th tl uk vi zh_CN zh_TW
diff --git a/meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
new file mode 100644
index 0000000..f1dd5fd
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/no-nls-dpkg.patch
@@ -0,0 +1,24 @@
+--- a/apt-pkg/deb/dpkgpm.cc
++++ b/apt-pkg/deb/dpkgpm.cc
+@@ -42,6 +42,12 @@
+ #include <apti18n.h>
+ 									/*}}}*/
+ 
++#ifdef USE_NLS
++#define _dpkg(x) dgettext("dpkg", x)
++#else
++#define _dpkg(x) x
++#endif
++
+ using namespace std;
+ 
+ namespace
+@@ -1279,7 +1285,7 @@ void pkgDPkgPM::WriteApportReport(const
+    }
+ 
+    // check if its not a follow up error 
+-   const char *needle = dgettext("dpkg", "dependency problems - leaving unconfigured");
++   const char *needle = _dpkg("dependency problems - leaving unconfigured");
+    if(strstr(errormsg, needle) != NULL) {
+       std::clog << _("No apport report written because the error message indicates its a followup error from a previous failure.") << std::endl;
+       return;
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/noconfigure.patch
similarity index 23%
rename from meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/noconfigure.patch
index 04e721d..712d5e7 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/noconfigure.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/noconfigure.patch
@@ -1,36 +1,35 @@
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
----
- apt-pkg/packagemanager.cc |    4 ++++
- 1 file changed, 4 insertions(+)
-
---- apt-0.6.45exp2.orig/apt-pkg/packagemanager.cc
-+++ apt-0.6.45exp2/apt-pkg/packagemanager.cc
-@@ -534,10 +534,12 @@ bool pkgPackageManager::SmartUnPack(PkgI
-    
-    List->Flag(Pkg,pkgOrderList::UnPacked,pkgOrderList::States);
-    
+Index: apt-0.9.7.7/apt-pkg/packagemanager.cc
+===================================================================
+--- apt-0.9.7.7.orig/apt-pkg/packagemanager.cc
++++ apt-0.9.7.7/apt-pkg/packagemanager.cc
+@@ -893,10 +893,12 @@ bool pkgPackageManager::SmartUnPack(PkgI
+       return false;
+ 
+    if (Immediate == true) {
 +#if 0
-    // Perform immedate configuration of the package.
-    if (List->IsFlag(Pkg,pkgOrderList::Immediate) == true)
-       if (SmartConfigure(Pkg) == false)
- 	 return _error->Error("Internal Error, Could not perform immediate configuration (2) on %s",Pkg.Name());
+       // Perform immedate configuration of the package. 
+          if (SmartConfigure(Pkg, Depth + 1) == false)
+             _error->Warning(_("Could not perform immediate configuration on '%s'. "
+                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
 +#endif
+    }
     
     return true;
- }
-@@ -609,6 +611,7 @@ pkgPackageManager::OrderResult pkgPackag
-       DoneSomething = true;
+@@ -986,6 +988,7 @@ pkgPackageManager::OrderResult pkgPackag
+       }
     }
-    
+ 
 +#if 0
     // Final run through the configure phase
     if (ConfigureAll() == false)
        return Failed;
-@@ -623,6 +626,7 @@ pkgPackageManager::OrderResult pkgPackag
+@@ -1000,6 +1003,7 @@ pkgPackageManager::OrderResult pkgPackag
  	 return Failed;
        }
-    }   
+    }
 +#endif
  	 
     return Completed;
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/nodoc.patch
similarity index 32%
rename from meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/nodoc.patch
index 216c091..449e42d 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/nodoc.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/nodoc.patch
@@ -1,21 +1,18 @@
-Upstream-Status: Inappropriate [configuration]
+Disable documentation
 
----
- Makefile |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 
---- apt-0.7.14.orig/Makefile
-+++ apt-0.7.14/Makefile
-@@ -15,11 +15,11 @@ all headers library clean veryclean bina
- 	$(MAKE) -C apt-inst $@
- 	$(MAKE) -C methods $@
+Index: apt-0.9.7.7/Makefile
+===================================================================
+--- apt-0.9.7.7.orig/Makefile
++++ apt-0.9.7.7/Makefile
+@@ -17,7 +17,7 @@ all headers library clean veryclean bina
  	$(MAKE) -C cmdline $@
  	$(MAKE) -C ftparchive $@
  	$(MAKE) -C dselect $@
 -	$(MAKE) -C doc $@
 +#	$(MAKE) -C doc $@
  	$(MAKE) -C po $@
+ 	$(MAKE) -C test $@
  
- # Some very common aliases
- .PHONY: maintainer-clean dist-clean distclean pristine sanity 
- maintainer-clean dist-clean distclean pristine sanity: veryclean
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/truncate-filename.patch
similarity index 100%
rename from meta/recipes-devtools/apt/apt-0.7.14/truncate-filename.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/truncate-filename.patch
diff --git a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch b/meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
similarity index 31%
rename from meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
rename to meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
index 485ad7b..f7eaaed 100644
--- a/meta/recipes-devtools/apt/apt-0.7.14/use-host.patch
+++ b/meta/recipes-devtools/apt/apt-0.9.7.7/use-host.patch
@@ -1,37 +1,8 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- buildlib/sizetable |    4 +++-
- configure.in       |    2 +-
- 2 files changed, 4 insertions(+), 2 deletions(-)
-
-Index: apt-0.7.14/buildlib/sizetable
+Index: apt-0.9.7.7/configure.in
 ===================================================================
---- apt-0.7.14.orig/buildlib/sizetable
-+++ apt-0.7.14/buildlib/sizetable
-@@ -11,6 +11,9 @@
- # The format is:-
- # CPU endian sizeof: char, int, short, long
- i386    little  1 4 2 4
-+i486    little  1 4 2 4
-+i586    little  1 4 2 4
-+i686    little  1 4 2 4
- armeb   big     1 4 2 4
- arm     little  1 4 2 4
- alpha   little  1 4 2 8
-@@ -21,4 +24,5 @@ m68k    big     1 4 2 4
- powerpc big     1 4 2 4
- mips    big     1 4 2 4
- hppa    big     1 4 2 4
--m32r	big	1 4 2 4
-\ No newline at end of file
-+m32r	big	1 4 2 4
-+x86_64	little	1 4 2 8
-Index: apt-0.7.14/configure.in
-===================================================================
---- apt-0.7.14.orig/configure.in
-+++ apt-0.7.14/configure.in
-@@ -88,7 +88,7 @@ dnl This is often the dpkg architecture 
+--- apt-0.9.7.7.orig/configure.in
++++ apt-0.9.7.7/configure.in
+@@ -112,7 +112,7 @@ dnl This is often the dpkg architecture
  dnl First check against the full canonical canoncial-system-type in $target
  dnl and if that fails, just look for the cpu
  AC_MSG_CHECKING(debian architecture)
diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index c7e7e42..a29e986 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -58,6 +58,8 @@ do_install_base () {
 	install -m 0755 dselect/update ${D}${libdir}/dpkg/methods/apt/ 
 
 	install -d ${D}${sysconfdir}/apt
+	install -d ${D}${sysconfdir}/apt/apt.conf.d
+	install -d ${D}${sysconfdir}/apt/preferences.d
 	install -d ${D}${localstatedir}/lib/apt/lists/partial
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
similarity index 26%
rename from meta/recipes-devtools/apt/apt-native_0.7.14.bb
rename to meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
index d4513ca..1e420a4 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.9.7.7.bb
@@ -1,13 +1,11 @@
 require apt-native.inc
 
-PR = "r11"
+PR = "r0"
 
-SRC_URI += "file://nodoc.patch \
-            file://noconfigure.patch \
-	    file://no-curl.patch \
-	    file://includes-fix.patch"
+SRC_URI += "file://noconfigure.patch \
+	    file://no-curl.patch"
 
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
+SRC_URI[md5sum] = "3f86f4eff53c94b7f285b3c59eb89754"
+SRC_URI[sha256sum] = "71fc7ff15fda50f16c9d73f701adf3bd67c9803a2304cd3d82cb490d76d3c3b3"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
diff --git a/meta/recipes-devtools/apt/apt-package.inc b/meta/recipes-devtools/apt/apt-package.inc
index 762ecf7..b0e5056 100644
--- a/meta/recipes-devtools/apt/apt-package.inc
+++ b/meta/recipes-devtools/apt/apt-package.inc
@@ -5,33 +5,9 @@ apt-manpages="doc/apt-cache.8 \
 	      doc/apt.8 \
 	      doc/apt.conf.5 \
 	      doc/apt_preferences.5 \
-	      doc/fr/apt-cache.fr.8 \
-	      doc/fr/apt-cdrom.fr.8 \
-	      doc/fr/apt-config.fr.8 \
-	      doc/fr/apt-get.fr.8 \
-	      doc/fr/apt.conf.fr.5 \
-	      doc/fr/apt_preferences.fr.5 \
-	      doc/fr/sources.list.fr.5 \
-	      doc/es/apt.es.8 \
-	      doc/es/apt-cache.es.8 \
-	      doc/es/apt-cdrom.es.8 \
-	      doc/es/apt-config.es.8 \
-	      doc/es/apt-get.es.8 \
-	      doc/es/apt.conf.es.5 \
-	      doc/es/apt_preferences.es.5 \
-	      doc/es/sources.list.es.5 \
-	      doc/pt_BR/apt_preferences.pt_BR.5 \
-	      doc/ja/apt-cache.ja.8 \
-	      doc/ja/apt-cdrom.ja.8 \
-	      doc/ja/apt-get.ja.8 \
-	      doc/ja/apt.conf.ja.5 \
 	      doc/sources.list.5"
 apt-utils-manpages="doc/apt-extracttemplates.1 \
-		    doc/apt-sortpkgs.1 \
-		    doc/fr/apt-extracttemplates.fr.1 \
-		    doc/fr/apt-sortpkgs.fr.1"
-#		    doc/fr/apt-ftparchive.fr.1
-#		    doc/apt-ftparchive.1
+		    doc/apt-sortpkgs.1"
 
 def get_files_apt_doc(d, bb, manpages):
     import re
@@ -65,8 +41,6 @@ FILES_${PN}-dev = "${libdir}/libapt*.so ${includedir}"
 
 do_install () {
 	set -x
-	${@get_commands_apt_doc(d, bb, d.getVar('apt-manpages', True))}
-	${@get_commands_apt_doc(d, bb, d.getVar('apt-utils-manpages', True))}
 	install -d ${D}${bindir}
 	install -m 0755 bin/apt-cdrom ${D}${bindir}/
 	install -m 0755 bin/apt-get ${D}${bindir}/
@@ -76,12 +50,8 @@ do_install () {
 	install -m 0755 bin/apt-sortpkgs ${D}${bindir}/
 	install -m 0755 bin/apt-extracttemplates ${D}${bindir}/
 
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	eval `cat environment.mak | grep ^LIBSTDCPP_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-pkg$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER$LIBSTDCPP_VER ${D}${libdir}/
-	ln -sf libapt-inst$GLIBC_VER$LIBSTDCPP_VER.so ${D}${libdir}/libapt-inst.so
+	oe_libinstall -so -C bin libapt-pkg ${D}${libdir}
+	oe_libinstall -so -C bin libapt-inst ${D}${libdir}
 
 	install -d ${D}${libdir}/apt/methods
 	install -m 0755 bin/methods/* ${D}${libdir}/apt/methods/
@@ -94,6 +64,9 @@ do_install () {
 	install -m 0755 dselect/update ${D}${libdir}/dpkg/methods/apt/ 
 
 	install -d ${D}${sysconfdir}/apt
+	install -d ${D}${sysconfdir}/apt/apt.conf.d
+	install -d ${D}${sysconfdir}/apt/sources.list.d
+	install -d ${D}${sysconfdir}/apt/preferences.d
 	install -d ${D}${localstatedir}/lib/apt/lists/partial
 	install -d ${D}${localstatedir}/cache/apt/archives/partial
 	install -d ${D}${docdir}/apt/examples
diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 973ccb5..e3ca6d0 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -5,17 +5,23 @@ SECTION = "base"
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
            file://no-ko-translation.patch \
            file://use-host.patch \
-           file://localefixes.patch \
            file://makerace.patch \
-           file://remove-redeclaration.patch \
+           file://no-nls-dpkg.patch \
+           file://fix-gcc-4.6-null-not-defined.patch \
            file://truncate-filename.patch \
-           file://allocate-larger-memory.patch \
+           file://nodoc.patch \
+           file://disable-configure-in-makefile.patch \
            "
 
 inherit autotools gettext
 
 EXTRA_AUTORECONF = "--exclude=autopoint,autoheader"
 
+do_configure_prepend() {
+    rm -rf buildlib/config.sub
+    rm -rf buildlib/config.guess
+}
+
 # Apt wants to know the glibc version by running a binary file, which will
 # fail, so we have to tell configure which version to use Since I don't know
 # the impliations of setting a wrong value I only provide one for angstrom,
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.9.7.7.bb
similarity index 64%
rename from meta/recipes-devtools/apt/apt_0.7.14.bb
rename to meta/recipes-devtools/apt/apt_0.9.7.7.bb
index 7f1572b..a9dcc74 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.9.7.7.bb
@@ -3,13 +3,11 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r15"
+PR = "r0"
 
-SRC_URI += "file://nodoc.patch \
-            file://includes-fix.patch "
 
-SRC_URI[md5sum] = "19efa18fb1ef20c58b9b44e94258b814"
-SRC_URI[sha256sum] = "8fc06effaf8a4e4333308eedcdc6840f1c8056f2e924210f151dfc076bcd4045"
+SRC_URI[md5sum] = "039fc57668d1a0c2f62dc22e71900a16"
+SRC_URI[sha256sum] = "6eca4285f1ac2e8cb837b9546553b0546881ed15853aa5bbeb860bab6bfa1700"
 
 require apt-package.inc
 
diff --git a/meta/recipes-devtools/apt/files/no-curl.patch b/meta/recipes-devtools/apt/files/no-curl.patch
index eb2f100..9fd3b3a 100644
--- a/meta/recipes-devtools/apt/files/no-curl.patch
+++ b/meta/recipes-devtools/apt/files/no-curl.patch
@@ -5,11 +5,9 @@ Upstream-Status: Inappropriate [configuration]
  methods/makefile |    7 -------
  2 files changed, 13 deletions(-)
 
---- apt-0.7.14.orig/configure.in
-+++ apt-0.7.14/configure.in
-@@ -84,16 +84,10 @@ AC_CHECK_HEADER(db.h,
-     )]
- )
+--- a/configure.in
++++ b/configure.in
+@@ -86,12 +86,6 @@ AC_CHECK_HEADER(db.h,
  
  LIBS="$saveLIBS"
  
@@ -22,25 +20,19 @@ Upstream-Status: Inappropriate [configuration]
  
  AC_SUBST(BDBLIB)
  
- dnl Converts the ARCH to be something singular for this general CPU family
- dnl This is often the dpkg architecture string.
---- apt-0.7.14.orig/methods/makefile
-+++ apt-0.7.14/methods/makefile
-@@ -50,17 +50,10 @@ PROGRAM=http
- SLIBS = -lapt-pkg $(SOCKETLIBS)
- LIB_MAKES = apt-pkg/makefile
- SOURCE = http.cc rfc2553emu.cc connect.cc
+--- a/methods/makefile
++++ b/methods/makefile
+@@ -51,13 +51,6 @@ LIB_MAKES = apt-pkg/makefile
+ SOURCE = http.cc http_main.cc rfc2553emu.cc connect.cc
  include $(PROGRAM_H)
  
 -# The https method
 -PROGRAM=https
--SLIBS = -lapt-pkg -lcurl
+-SLIBS = -lapt-pkg -lcurl $(INTLLIBS)
 -LIB_MAKES = apt-pkg/makefile
 -SOURCE = https.cc
 -include $(PROGRAM_H)
 -
  # The ftp method
  PROGRAM=ftp
- SLIBS = -lapt-pkg $(SOCKETLIBS)
- LIB_MAKES = apt-pkg/makefile
- SOURCE = ftp.cc rfc2553emu.cc connect.cc
+ SLIBS = -lapt-pkg $(SOCKETLIBS) $(INTLLIBS)
-- 
1.7.11.7



