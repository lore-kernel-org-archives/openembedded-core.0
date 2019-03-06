Return-Path: <tom.rini@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2157997F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 14:36:25 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id g9so10532167eds.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 06:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UW4zORkIwZrPAnYUFgO4gFLVeMQIMjWpnl4rfbaHUSM=;
	b=g7HxPJ9P4Yop4mDJzrV4V09RqtQptVXoX+t+fbpf0xZ0Lblojefv9hFOEJO/h3abf1
	Roavs6A7RQakR7rNQ0IO8ym2n9G796zImtt71jXVj1J5iXXbGP5MYKGI910phm7n9L7l
	SaSXkXwHu8pWVt/db/0D4iGLNTJhotnIWrdmfRNYerBcak8ShJyq166CwJLuzdEKsqbb
	9TbKm8Wh79A0H2kU0j9+ocjFdIJzV6GHC6XLWJnM9NpK3DnoHb3aK2snrcwAjLLpxo4f
	P5sh/OF3O0I4iCmzvA7MNutqxB+eHCiwOt00UfoldNSsHMgzgVEPja/XHxtgtLE6SIqq
	xdNg==
X-Gm-Message-State: APjAAAWV37GzREnzhulcBwr6ENDyfCAfq74EVtWD46F4UYwu1i/2D1Ms
	pd0Zynfn92brgS5z4ynfiWhYpSM=
X-Google-Smtp-Source: APXvYqz1Js2K+jf6s4sYUO8uajzsAm63D7YY2P9+FFl42WVIZtbbaMidjpD7isQCU96MsfHg1xEFiw==
X-Received: by 2002:a50:cd14:: with SMTP id z20mr23076499edi.146.1551882985935;
	Wed, 06 Mar 2019 06:36:25 -0800 (PST)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-880D-159-4081-9338-CA43.dyn6.twc.com.
	[2606:a000:1401:880d:159:4081:9338:ca43])
	by smtp.gmail.com with ESMTPSA id i14sm363467ejy.41.2019.03.06.06.36.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Mar 2019 06:36:25 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:36:11 -0500
Message-Id: <1551882973-8710-3-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1551882973-8710-1-git-send-email-trini@konsulko.com>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Wed, 06 Mar 2019 14:36:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to have more robust stand-alone network tools in oe-core, bring
in inetutils from meta-openembedded/meta-networking.  This imports the
recipes as of git commit:
commit 408204073e6bdcd8ac586e05d5b75213417673f2
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Thu Aug 16 20:39:15 2018 +0000

    inetutils: fix build with glibc-2.28

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Fix wording (thanks André!)
- Add self as maintainer
---
 meta/conf/distro/include/maintainers.inc           |   1 +
 .../0001-rcp-fix-to-work-with-large-files.patch    |  31 ++++
 .../inetutils/inetutils/fix-disable-ipv6.patch     |  83 +++++++++
 ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |  29 +++
 .../inetutils/inetutils-1.8-0003-wchar.patch       |  14 ++
 .../inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch |  26 +++
 ...ls-only-check-pam_appl.h-when-pam-enabled.patch |  40 ++++
 .../inetutils/inetutils/rexec.xinetd.inetutils     |  20 ++
 .../inetutils/inetutils/rlogin.xinetd.inetutils    |  23 +++
 .../inetutils/inetutils/rsh.xinetd.inetutils       |  21 +++
 .../inetutils/inetutils/telnet.xinetd.inetutils    |  13 ++
 .../inetutils/inetutils/tftpd.xinetd.inetutils     |  19 ++
 .../inetutils/inetutils/version.patch              |  17 ++
 .../inetutils/inetutils_1.9.4.bb                   | 206 +++++++++++++++++++++
 14 files changed, 543 insertions(+)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/version.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b727dc5f5525..1a198e12d862 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -269,6 +269,7 @@ RECIPE_MAINTAINER_pn-i2c-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-icecc-create-env = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-inetutils = "Tom Rini <trini@konsulko.com>"
 RECIPE_MAINTAINER_pn-init-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
diff --git a/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch b/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
new file mode 100644
index 000000000000..d4764f586736
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+Subject: rcp: fix to work with large files
+
+When we copy file by rcp command, if the file > 2GB, it will fail.
+The cause is that it used incorrect data type on file size in sink() of rcp.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/rcp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/rcp.c b/src/rcp.c
+index 21f55b6..bafa35f 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -876,9 +876,9 @@ sink (int argc, char *argv[])
+   enum
+   { YES, NO, DISPLAYED } wrerr;
+   BUF *bp;
+-  off_t i, j;
++  off_t i, j, size;
+   int amt, count, exists, first, mask, mode, ofd, omode;
+-  int setimes, size, targisdir, wrerrno;
++  int setimes, targisdir, wrerrno;
+   char ch, *cp, *np, *targ, *vect[1], buf[BUFSIZ];
+   const char *why;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch b/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
new file mode 100644
index 000000000000..24c134fcac8d
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/fix-disable-ipv6.patch
@@ -0,0 +1,83 @@
+Upstream: http://www.mail-archive.com/bug-inetutils@gnu.org/msg02103.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ ping/ping_common.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
+diff --git a/ping/ping_common.h b/ping/ping_common.h
+index 1dfd1b5..3bfbd12 100644
+--- a/ping/ping_common.h
++++ b/ping/ping_common.h
+@@ -17,10 +17,14 @@
+   You should have received a copy of the GNU General Public License
+   along with this program.  If not, see `http://www.gnu.org/licenses/'. */
+ 
++#include <config.h>
++
+ #include <netinet/in_systm.h>
+ #include <netinet/in.h>
+ #include <netinet/ip.h>
++#ifdef HAVE_IPV6
+ #include <netinet/icmp6.h>
++#endif
+ #include <icmp.h>
+ #include <error.h>
+ #include <progname.h>
+@@ -62,7 +66,12 @@ struct ping_stat
+    want to follow the traditional behaviour of ping.  */
+ #define DEFAULT_PING_COUNT 0
+ 
++#ifdef HAVE_IPV6
+ #define PING_HEADER_LEN (USE_IPV6 ? sizeof (struct icmp6_hdr) : ICMP_MINLEN)
++#else
++#define PING_HEADER_LEN (ICMP_MINLEN)
++#endif
++
+ #define PING_TIMING(s)  ((s) >= sizeof (struct timeval))
+ #define PING_DATALEN    (64 - PING_HEADER_LEN)  /* default data length */
+ 
+@@ -74,13 +83,20 @@ struct ping_stat
+   (t).tv_usec = ((i)%PING_PRECISION)*(1000000/PING_PRECISION) ;\
+ } while (0)
+ 
++#ifdef HAVE_IPV6
+ /* FIXME: Adjust IPv6 case for options and their consumption.  */
+ #define _PING_BUFLEN(p, u) ((u)? ((p)->ping_datalen + sizeof (struct icmp6_hdr)) : \
+ 				   (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN))
+ 
++#else
++#define _PING_BUFLEN(p, u) (MAXIPLEN + (p)->ping_datalen + ICMP_TSLEN)
++#endif
++
++#ifdef HAVE_IPV6
+ typedef int (*ping_efp6) (int code, void *closure, struct sockaddr_in6 * dest,
+ 			  struct sockaddr_in6 * from, struct icmp6_hdr * icmp,
+ 			  int datalen);
++#endif
+ 
+ typedef int (*ping_efp) (int code,
+ 			 void *closure,
+@@ -89,13 +105,17 @@ typedef int (*ping_efp) (int code,
+ 			 struct ip * ip, icmphdr_t * icmp, int datalen);
+ 
+ union event {
++#ifdef HAVE_IPV6
+   ping_efp6 handler6;
++#endif
+   ping_efp handler;
+ };
+ 
+ union ping_address {
+   struct sockaddr_in ping_sockaddr;
++#ifdef HAVE_IPV6
+   struct sockaddr_in6 ping_sockaddr6;
++#endif
+ };
+ 
+ typedef struct ping_data PING;
+-- 
+2.8.3
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
new file mode 100644
index 000000000000..3da4e9f55a78
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch
@@ -0,0 +1,29 @@
+From 552a7d64ad4a7188a9b7cd89933ae7caf7ebfe90 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier at gentoo.org>
+Date: Thu, 18 Nov 2010 16:59:14 -0500
+Subject: [PATCH gnulib] printf-parse: pull in features.h for __GLIBC__
+
+Upstream-Status: Pending
+
+Signed-off-by: Mike Frysinger <vapier at gentoo.org>
+---
+ lib/printf-parse.h |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/lib/printf-parse.h b/lib/printf-parse.h
+index 67a4a2a..3bd6152 100644
+--- a/lib/printf-parse.h
++++ b/lib/printf-parse.h
+@@ -25,6 +25,9 @@
+ 
+ #include "printf-args.h"
+ 
++#ifdef HAVE_FEATURES_H
++# include <features.h>	/* for __GLIBC__ */
++#endif
+ 
+ /* Flags */
+ #define FLAG_GROUP       1      /* ' flag */
+-- 
+1.7.3.2
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
new file mode 100644
index 000000000000..b13bb9229ff0
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.8-0003-wchar.patch
@@ -0,0 +1,14 @@
+Upstream-Status: Pending
+
+--- inetutils-1.8/lib/wchar.in.h
++++ inetutils-1.8/lib/wchar.in.h
+@@ -70,6 +70,9 @@
+ /* The include_next requires a split double-inclusion guard.  */
+ #if @HAVE_WCHAR_H@
+ # @INCLUDE_NEXT@ @NEXT_WCHAR_H@
++#else
++# include <stddef.h>
++# define MB_CUR_MAX 1
+ #endif
+ 
+ #undef _GL_ALREADY_INCLUDING_WCHAR_H
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
new file mode 100644
index 000000000000..2592989a90a3
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-1.9-PATH_PROCNET_DEV.patch
@@ -0,0 +1,26 @@
+inetutils: define PATH_PROCNET_DEV if not already defined
+
+this prevents the following compilation error :
+system/linux.c:401:15: error: 'PATH_PROCNET_DEV' undeclared (first use in this function)
+
+this patch comes from :
+ http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/
+
+Upstream-Status: Inappropriate [not author]
+
+Signed-of-by: Eric Bénard <eric@eukrea.com>
+---
+diff -Naur inetutils-1.9.orig/ifconfig/system/linux.c inetutils-1.9/ifconfig/system/linux.c
+--- inetutils-1.9.orig/ifconfig/system/linux.c	2012-01-04 16:31:36.000000000 -0500
++++ inetutils-1.9/ifconfig/system/linux.c	2012-01-04 16:40:53.000000000 -0500
+@@ -49,6 +49,10 @@
+ #include "../ifconfig.h"
+ 
+ 
++#ifndef PATH_PROCNET_DEV
++  #define PATH_PROCNET_DEV "/proc/net/dev"
++#endif
++
+ /* ARPHRD stuff.  */
+ 
+ static void
diff --git a/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
new file mode 100644
index 000000000000..ff3abd86aad3
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/inetutils-only-check-pam_appl.h-when-pam-enabled.patch
@@ -0,0 +1,40 @@
+Only check security/pam_appl.h which is provided by package libpam when pam is
+enabled.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/configure.ac b/configure.ac
+index b35e672..e78a751 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -195,6 +195,19 @@ fi
+ 
+ # See if we have libpam.a.  Investigate PAM versus Linux-PAM.
+ if test "$with_pam" = yes ; then
++  AC_CHECK_HEADERS([security/pam_appl.h], [], [], [
++#include <sys/types.h>
++#ifdef HAVE_NETINET_IN_SYSTM_H
++# include <netinet/in_systm.h>
++#endif
++#include <netinet/in.h>
++#ifdef HAVE_NETINET_IP_H
++# include <netinet/ip.h>
++#endif
++#ifdef HAVE_SYS_PARAM_H
++# include <sys/param.h>
++#endif
++])
+   AC_CHECK_LIB(dl, dlopen, LIBDL=-ldl)
+   AC_CHECK_LIB(pam, pam_authenticate, LIBPAM=-lpam)
+   if test "$ac_cv_lib_pam_pam_authenticate" = yes ; then
+@@ -587,7 +600,7 @@ AC_HEADER_DIRENT
+ AC_CHECK_HEADERS([arpa/nameser.h errno.h fcntl.h features.h \
+ 		  glob.h memory.h netinet/ether.h netinet/in_systm.h \
+ 		  netinet/ip.h netinet/ip_icmp.h netinet/ip_var.h \
+-		  security/pam_appl.h shadow.h \
++		  shadow.h \
+ 		  stdarg.h stdlib.h string.h stropts.h sys/tty.h \
+ 		  sys/utsname.h sys/ptyvar.h sys/msgbuf.h sys/filio.h \
+ 		  sys/ioctl_compat.h sys/cdefs.h sys/stream.h sys/mkdev.h \
diff --git a/meta/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils b/meta/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
new file mode 100644
index 000000000000..30e81ef4502b
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/rexec.xinetd.inetutils
@@ -0,0 +1,20 @@
+# default: off
+# description:
+# Rexecd is the server for the rexec program. The server provides remote 
+# execution facilities with authentication based on user names and 
+# passwords.
+#
+service exec
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rexecd
+	disable		= yes
+}
diff --git a/meta/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils b/meta/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
new file mode 100644
index 000000000000..21b55da9a9fd
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/rlogin.xinetd.inetutils
@@ -0,0 +1,23 @@
+# default: off
+# description:
+# Rlogind is a server for the rlogin program. The server provides remote 
+# execution with authentication based on privileged port numbers from trusted
+# host
+#
+service login
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rlogind -a
+	disable		= yes
+}
+							
+							
+							
diff --git a/meta/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils b/meta/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
new file mode 100644
index 000000000000..2b894a74bd41
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/rsh.xinetd.inetutils
@@ -0,0 +1,21 @@
+# default: off
+# description:
+# The rshd server is a server for the rcmd(3) routine and, 
+# consequently, for the rsh(1) program. The server provides 
+# remote execution facilities with authentication based on 
+# privileged port numbers from trusted hosts.
+#
+service shell
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rshd -aL
+	disable		= yes
+}
diff --git a/meta/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils b/meta/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
new file mode 100644
index 000000000000..2d9a0408c0db
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/telnet.xinetd.inetutils
@@ -0,0 +1,13 @@
+# default: on
+# description: The telnet server serves telnet sessions; it uses \
+#       unencrypted username/password pairs for authentication.
+service telnet
+{
+	disable		= no
+	flags		= REUSE
+	socket_type	= stream
+	wait		= no
+	user		= root
+	server		= @SBINDIR@/in.telnetd
+	log_on_failure	+= USERID
+}
diff --git a/meta/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils b/meta/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
new file mode 100644
index 000000000000..67b44c43e852
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/tftpd.xinetd.inetutils
@@ -0,0 +1,19 @@
+# default: off
+# description:
+# Tftpd is a server which supports the Internet Trivial File Transfer
+# Pro-tocol (RFC 783). The TFTP server operates at the port indicated
+# in the tftp service description; see services(5).
+#
+service tftp
+{
+        disable         = yes
+        socket_type     = dgram
+        protocol        = udp
+        flags           = IPv6
+        wait            = yes
+        user            = root
+        group           = root
+        server          = @SBINDIR@/in.tftpd
+        server_args     = /tftpboot
+}
+
diff --git a/meta/recipes-connectivity/inetutils/inetutils/version.patch b/meta/recipes-connectivity/inetutils/inetutils/version.patch
new file mode 100644
index 000000000000..532a0e5c0896
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils/version.patch
@@ -0,0 +1,17 @@
+Upstream-Status: Pending
+
+remove m4_esyscmd function
+
+Signed-off-by: Chunrong Guo <b40290@freescale.com>
+--- inetutils-1.9.1/configure.ac	2012-01-06 22:05:05.000000000 +0800
++++ inetutils-1.9.1/configure.ac	2012-11-12 14:01:11.732957019 +0800
+@@ -20,8 +20,7 @@
+ 
+ AC_PREREQ(2.59)
+ 
+-AC_INIT([GNU inetutils],
+- m4_esyscmd([build-aux/git-version-gen .tarball-version 's/inetutils-/v/;s/_/./g']),
++AC_INIT([GNU inetutils],[1.9.4],
+  [bug-inetutils@gnu.org])
+ 
+ AC_CONFIG_SRCDIR([src/inetd.c])
diff --git a/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
new file mode 100644
index 000000000000..a27dbae2e688
--- /dev/null
+++ b/meta/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -0,0 +1,206 @@
+DESCRIPTION = "The GNU inetutils are a collection of common \
+networking utilities and servers including ftp, ftpd, rcp, \
+rexec, rlogin, rlogind, rsh, rshd, syslog, syslogd, talk, \
+talkd, telnet, telnetd, tftp, tftpd, and uucpd."
+HOMEPAGE = "http://www.gnu.org/software/inetutils"
+SECTION = "net"
+DEPENDS = "ncurses netbase readline virtual/crypt"
+
+LICENSE = "GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"
+
+SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
+           file://version.patch \
+           file://inetutils-1.8-0001-printf-parse-pull-in-features.h-for-__GLIBC__.patch \
+           file://inetutils-1.8-0003-wchar.patch \
+           file://rexec.xinetd.inetutils  \
+           file://rlogin.xinetd.inetutils \
+           file://rsh.xinetd.inetutils \
+           file://telnet.xinetd.inetutils \
+           file://tftpd.xinetd.inetutils \
+           file://inetutils-1.9-PATH_PROCNET_DEV.patch \
+           file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://0001-rcp-fix-to-work-with-large-files.patch \
+"
+
+SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
+SRC_URI[sha256sum] = "be8f75eff936b8e41b112462db51adf689715658a1b09e0d6b05d11ec92cc616"
+
+inherit autotools gettext update-alternatives texinfo
+
+acpaths = "-I ./m4"
+
+SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
+
+PACKAGECONFIG ??= "ftp uucpd \
+                   ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6 ping6', '', d)} \
+                  "
+PACKAGECONFIG[ftp] = "--enable-ftp,--disable-ftp,readline"
+PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
+PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6 gl_cv_socket_ipv6=no,"
+PACKAGECONFIG[ping6] = "--enable-ping6,--disable-ping6,"
+
+EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
+        inetutils_cv_path_login=${base_bindir}/login \
+        --with-libreadline-prefix=${STAGING_LIBDIR} \
+        --enable-rpath=no \
+"
+
+EXTRA_OECONF_append_libc-musl = " --disable-rsh --disable-rcp --disable-rlogin "
+
+do_configure_prepend () {
+    export HELP2MAN='true'
+    cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}/build-aux/config.rpath
+    rm -f ${S}/glob/configure*
+}
+
+do_install_append () {
+    install -m 0755 -d ${D}${base_sbindir}
+    install -m 0755 -d ${D}${sbindir}
+    install -m 0755 -d ${D}${sysconfdir}/xinetd.d
+    if [ "${base_bindir}" != "${bindir}" ] ; then
+         install -m 0755 -d ${D}${base_bindir}
+         mv ${D}${bindir}/ping* ${D}${base_bindir}/
+         mv ${D}${bindir}/hostname ${D}${base_bindir}/
+    fi
+    mv ${D}${bindir}/ifconfig ${D}${base_sbindir}/
+    mv ${D}${libexecdir}/syslogd ${D}${base_sbindir}/
+    mv ${D}${libexecdir}/tftpd ${D}${sbindir}/in.tftpd
+    mv ${D}${libexecdir}/telnetd ${D}${sbindir}/in.telnetd
+    mv ${D}${libexecdir}/rexecd ${D}${sbindir}/in.rexecd
+    if [ -e ${D}${libexecdir}/rlogind ]; then
+        mv ${D}${libexecdir}/rlogind ${D}${sbindir}/in.rlogind
+    fi
+    if [ -e ${D}${libexecdir}/rshd ]; then
+        mv ${D}${libexecdir}/rshd ${D}${sbindir}/in.rshd
+    fi
+    if [ -e ${D}${libexecdir}/talkd ]; then
+        mv ${D}${libexecdir}/talkd ${D}${sbindir}/in.talkd
+    fi
+    mv ${D}${libexecdir}/uucpd ${D}${sbindir}/in.uucpd
+    mv ${D}${libexecdir}/* ${D}${bindir}/
+    cp ${WORKDIR}/rexec.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rexec
+    cp ${WORKDIR}/rlogin.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rlogin
+    cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
+    cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
+    cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
+
+    sed -e 's,@SBINDIR@,${sbindir},g' -i ${D}/${sysconfdir}/xinetd.d/*
+    if [ -e ${D}${libdir}/charset.alias ]; then
+        rm -rf ${D}${libdir}/charset.alias
+    fi
+    rm -rf ${D}${libexecdir}/
+    # remove usr/lib if empty
+    rmdir ${D}${libdir} || true
+}
+
+PACKAGES =+ "${PN}-ping ${PN}-ping6 ${PN}-hostname ${PN}-ifconfig \
+${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd \
+${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
+${PN}-rsh ${PN}-rshd"
+
+# The packages tftpd, telnetd and rshd conflict with the ones
+# provided by netkit, so add the corresponding -dbg packages
+# for them to avoid the confliction between the dbg package
+# of inetutils and netkit.
+PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
+NOAUTOPACKAGEDEBUG = "1"
+
+ALTERNATIVE_PRIORITY = "79"
+ALTERNATIVE_${PN} = "talk whois"
+ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
+ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
+
+ALTERNATIVE_PRIORITY_${PN}-logger = "60"
+ALTERNATIVE_${PN}-logger = "logger"
+ALTERNATIVE_${PN}-syslogd = "syslogd"
+ALTERNATIVE_LINK_NAME[syslogd]  = "${base_sbindir}/syslogd"
+
+ALTERNATIVE_${PN}-ftp = "ftp"
+ALTERNATIVE_${PN}-ftpd = "ftpd"
+ALTERNATIVE_${PN}-tftp = "tftp"
+ALTERNATIVE_${PN}-tftpd = "tftpd"
+ALTERNATIVE_LINK_NAME[tftpd] = "${sbindir}/tftpd"
+ALTERNATIVE_TARGET[tftpd]  = "${sbindir}/in.tftpd"
+
+ALTERNATIVE_${PN}-telnet = "telnet"
+ALTERNATIVE_${PN}-telnetd = "telnetd"
+ALTERNATIVE_LINK_NAME[telnetd] = "${sbindir}/telnetd"
+ALTERNATIVE_TARGET[telnetd] = "${sbindir}/in.telnetd"
+
+ALTERNATIVE_${PN}-rsh = "rcp rexec rlogin rsh"
+ALTERNATIVE_${PN}-rshd = "rshd rexecd rlogind"
+ALTERNATIVE_LINK_NAME[rshd] = "${sbindir}/rshd"
+ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
+ALTERNATIVE_LINK_NAME[rexecd] = "${sbindir}/rexecd"
+ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
+ALTERNATIVE_LINK_NAME[rlogind] = "${sbindir}/rlogind"
+ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
+
+ALTERNATIVE_${PN}-inetd= "inetd"
+ALTERNATIVE_${PN}-traceroute = "traceroute"
+
+ALTERNATIVE_${PN}-hostname = "hostname"
+ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
+
+ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8"
+ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
+ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
+ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
+
+ALTERNATIVE_${PN}-ifconfig = "ifconfig"
+ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
+
+ALTERNATIVE_${PN}-ping = "ping"
+ALTERNATIVE_LINK_NAME[ping]   = "${base_bindir}/ping"
+
+ALTERNATIVE_${PN}-ping6 = "${@bb.utils.filter('PACKAGECONFIG', 'ping6', d)}"
+ALTERNATIVE_LINK_NAME[ping6]  = "${base_bindir}/ping6"
+
+
+FILES_${PN}-dbg += "${base_bindir}/.debug ${base_sbindir}/.debug ${bindir}/.debug ${sbindir}/.debug"
+FILES_${PN}-ping = "${base_bindir}/ping.${BPN}"
+FILES_${PN}-ping6 = "${base_bindir}/ping6.${BPN}"
+FILES_${PN}-hostname = "${base_bindir}/hostname.${BPN}"
+FILES_${PN}-ifconfig = "${base_sbindir}/ifconfig.${BPN}"
+FILES_${PN}-traceroute = "${bindir}/traceroute.${BPN}"
+FILES_${PN}-logger = "${bindir}/logger.${BPN}"
+
+FILES_${PN}-syslogd = "${base_sbindir}/syslogd.${BPN}"
+RCONFLICTS_${PN}-syslogd = "rsyslog busybox-syslog sysklogd syslog-ng"
+
+FILES_${PN}-ftp = "${bindir}/ftp.${BPN}"
+
+FILES_${PN}-tftp = "${bindir}/tftp.${BPN}"
+FILES_${PN}-telnet = "${bindir}/telnet.${BPN}"
+FILES_${PN}-rsh = "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bindir}/rexec.${BPN} ${bindir}/rcp.${BPN}"
+
+FILES_${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
+                    ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
+FILES_${PN}-rshd-dbg = "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in.rlogind ${sbindir}/.debug/in.rexecd"
+RDEPENDS_${PN}-rshd += "xinetd tcp-wrappers"
+RCONFLICTS_${PN}-rshd += "netkit-rshd"
+RPROVIDES_${PN}-rshd = "rshd"
+
+FILES_${PN}-ftpd = "${bindir}/ftpd.${BPN}"
+FILES_${PN}-ftpd-dbg = "${bindir}/.debug/ftpd.${BPN}"
+RDEPENDS_${PN}-ftpd += "xinetd"
+
+FILES_${PN}-tftpd = "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
+FILES_${PN}-tftpd-dbg = "${sbindir}/.debug/in.tftpd"
+RCONFLICTS_${PN}-tftpd += "netkit-tftpd"
+RDEPENDS_${PN}-tftpd += "xinetd"
+
+FILES_${PN}-telnetd = "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/telnet"
+FILES_${PN}-telnetd-dbg = "${sbindir}/.debug/in.telnetd"
+RCONFLICTS_${PN}-telnetd += "netkit-telnetd"
+RPROVIDES_${PN}-telnetd = "telnetd"
+RDEPENDS_${PN}-telnetd += "xinetd"
+
+FILES_${PN}-inetd = "${bindir}/inetd.${BPN}"
+
+RDEPENDS_${PN} = "xinetd"
-- 
2.7.4


