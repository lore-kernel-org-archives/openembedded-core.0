Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7707E6C5F6
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 03:26:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11285.1733196369147655200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 19:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2067c8c0a9=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B33J3XP014418
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Dec 2024 03:26:08 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437qx12tvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:26:07 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 2 Dec 2024 19:26:06 -0800
Received: from pek-lpg-core2.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 2 Dec 2024 19:26:06 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] sysvinit: upgrade 3.04 -> 3.11
Date: Tue, 3 Dec 2024 11:26:05 +0800
Message-ID: <20241203032605.2651655-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: jtYO9UiyqUVvBJnDaRHC5nuHD5NKreTk
X-Authority-Analysis: v=2.4 cv=EuYorTcA c=1 sm=1 tr=0 ts=674e7a50 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=5KEJ3k9QAAAA:8 a=20KFwNOVAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=KlJKwSvTAAAA:8 a=hc3Y6PCLAAAA:8 a=QyXUC8HyAAAA:8 a=6sJjxqMxkPgO8Xa_p6IA:9 a=GUWpzuUKvtD1TzFp:21 a=olg2BfGzmf2haRflzj8J:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=hg6DrcduIUDBMDTMTUZT:22 a=S5bhdcXtTeLX7qDPhYnx:22
X-Proofpoint-ORIG-GUID: jtYO9UiyqUVvBJnDaRHC5nuHD5NKreTk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-03_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412030027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 03:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208175

From: Changqing Li <changqing.li@windriver.com>

Refresh patches:
crypt-lib.patch
install.patch
pidof-add-m-option.patch
realpath.patch

Drop patches since upstream already include these changes:
0001-hddown-include-libgen.h-for-basename-API.patch
sysvinit_remove_linux_fs.patch

Refer:
https://github.com/slicer69/sysvinit/releases

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...wn-include-libgen.h-for-basename-API.patch | 38 --------------
 .../sysvinit/sysvinit/crypt-lib.patch         | 19 ++++---
 .../sysvinit/sysvinit/install.patch           | 52 ++++++-------------
 .../sysvinit/pidof-add-m-option.patch         | 30 ++++++-----
 .../sysvinit/sysvinit/realpath.patch          | 14 ++---
 .../sysvinit/sysvinit_remove_linux_fs.patch   | 17 ------
 .../{sysvinit_3.04.bb => sysvinit_3.11.bb}    |  4 +-
 7 files changed, 53 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
 delete mode 100644 meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
 rename meta/recipes-core/sysvinit/{sysvinit_3.04.bb => sysvinit_3.11.bb} (95%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch b/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
deleted file mode 100644
index 5e4053bad1d..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/0001-hddown-include-libgen.h-for-basename-API.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From a07c1d94e79840c59563741b45e690e77d4f3dfa Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 20:09:30 -0800
-Subject: [PATCH] hddown: include libgen.h for basename API
-
-musl has removed the non-prototype declaration of basename from string.h [1] which now results in build errors with clang-17+ compiler
-
-include libgen.h for using the posix declaration of the funciton.
-
-Fixes
-
-hddown.c:135:8: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
-  135 |                         ptr = basename(lnk);
-      |                             ^ ~~~~~~~~~~~~~
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/21]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/hddown.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/hddown.c b/src/hddown.c
-index 7a2cf28..3b31bc0 100644
---- a/src/hddown.c
-+++ b/src/hddown.c
-@@ -24,6 +24,7 @@ char *v_hddown = "@(#)hddown.c  1.02  22-Apr-2003  miquels@cistron.nl";
- #ifndef _GNU_SOURCE
- #define _GNU_SOURCE
- #endif
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
--- 
-2.43.0
-
diff --git a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
index 5c39fb001b1..24c81822187 100644
--- a/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/crypt-lib.patch
@@ -1,4 +1,4 @@
-From c3a068cf24a22bea7349849ec111ae8d91a54db4 Mon Sep 17 00:00:00 2001
+From 49250c8e0ef563aafd5bbea62612f3d15fdee3af Mon Sep 17 00:00:00 2001
 From: Jeff Dike <jdike@x86_64.user-mode-linux.org>
 Date: Wed, 14 Jul 2010 14:35:52 -0400
 Subject: [PATCH] sysvinit - Remove sulogin dependency on /usr/lib*/libcrypt.a
@@ -9,19 +9,19 @@ Upstream-Status: Inappropriate [configuration]
 # build environment.  This patch checks for $LCRYPT in the environment
 # and uses it if it's there.
 # - jdike@linux.intel.com
-
 ---
- src/Makefile | 11 ++---------
- 1 file changed, 2 insertions(+), 9 deletions(-)
+ src/Makefile | 12 ++----------
+ 1 file changed, 2 insertions(+), 10 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 5b1a5a2..b686394 100644
+index 0210171..f696247 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -97,15 +97,8 @@ else
- endif
+@@ -101,16 +101,8 @@ endif
  
- # Additional libs for GNU libc.
+ ROOT	?= $(DESTDIR)
+ 
+-# Additional libs for GNU libc.
 -ifneq ($(wildcard $(ROOT)/usr/lib*/libcrypt.*),)
 -  SULOGINLIBS	+= -lcrypt
 -endif
@@ -36,3 +36,6 @@ index 5b1a5a2..b686394 100644
  endif
  
  all:		$(BIN) $(SBIN) $(USRBIN)
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/install.patch b/meta/recipes-core/sysvinit/sysvinit/install.patch
index bc6d493c2ba..536bd771041 100644
--- a/meta/recipes-core/sysvinit/sysvinit/install.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/install.patch
@@ -1,19 +1,18 @@
-From 5e35aa105e7a2e85db2a89fee4114090b1ac55be Mon Sep 17 00:00:00 2001
+From f73a2c768687f3fed0ab570f47fa2157e5d4e586 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Fri, 18 Jun 2010 09:40:30 +0800
 Subject: [PATCH] sysvinit: upgrade to version 2.88dsf
 
 Upstream-Status: Submitted [https://github.com/slicer69/sysvinit/pull/13]
-
 ---
- src/Makefile | 53 +++++++++++++++++++++++++++++-----------------------
- 1 file changed, 30 insertions(+), 23 deletions(-)
+ src/Makefile | 37 ++++++++++++++++++++++---------------
+ 1 file changed, 22 insertions(+), 15 deletions(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 1b368dc..5b1a5a2 100644
+index 21cbb2e..0210171 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -77,7 +77,14 @@ else
+@@ -80,7 +80,14 @@ else
    INSTALL_DATA	= install -m 644
  endif
  INSTALL_DIR	= install -m 755 -d
@@ -29,7 +28,7 @@ index 1b368dc..5b1a5a2 100644
  
  ifeq ($(WITH_SELINUX),yes)
    SELINUX_DEF	=  -DWITH_SELINUX
-@@ -191,43 +198,43 @@ clobber:	cleanobjs
+@@ -196,31 +203,31 @@ clobber:	cleanobjs
  distclean:	clobber
  
  install:	all
@@ -55,43 +54,26 @@ index 1b368dc..5b1a5a2 100644
 -		ln -sf halt $(ROOT)/sbin/reboot
 -		ln -sf halt $(ROOT)/sbin/poweroff
 -		ln -sf init $(ROOT)/sbin/telinit
--		ln -sf /sbin/killall5 $(ROOT)/bin/pidof
+-		ln -sf ../sbin/killall5 $(ROOT)/bin/pidof
 -		if [ ! -f $(ROOT)/usr/bin/lastb ]; then \
 -			ln -sf last $(ROOT)/usr/bin/lastb; \
 +		ln -sf halt $(ROOT)$(base_sbindir)/reboot
 +		ln -sf halt $(ROOT)$(base_sbindir)/poweroff
 +		ln -sf init $(ROOT)$(base_sbindir)/telinit
-+		ln -sf $(base_sbindir)/killall5 $(ROOT)$(base_bindir)/pidof
++		ln -sf ..$(base_sbindir)/killall5 $(ROOT)$(base_bindir)/pidof
 +		if [ ! -f $(ROOT)$(bindir)/lastb ]; then \
 +			ln -sf last $(ROOT)$(bindir)/lastb; \
  		fi
 -		$(INSTALL_DIR) $(ROOT)/usr/include/
 -		$(INSTALL_DATA) initreq.h $(ROOT)/usr/include/
--		$(INSTALL_DIR) $(ROOT)$(MANDIR)/man1/
--		$(INSTALL_DIR) $(ROOT)$(MANDIR)/man5/
--		$(INSTALL_DIR) $(ROOT)$(MANDIR)/man8/
 +		$(INSTALL_DIR) $(ROOT)$(includedir)/
 +		$(INSTALL_DATA) initreq.h $(ROOT)$(includedir)/
-+		$(INSTALL_DIR) $(ROOT)$(mandir)/man1/
-+		$(INSTALL_DIR) $(ROOT)$(mandir)/man5/
-+		$(INSTALL_DIR) $(ROOT)$(mandir)/man8/
- 		for man in $(MAN1); do \
--			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man1/; \
--			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man1/$$man ; \
-+			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man1/; \
-+			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man1/$$man ; \
- 		done
- 		for man in $(MAN5); do \
--			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man5/; \
--			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man5/$$man ; \
-+			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man5/; \
-+			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man5/$$man ; \
- 		done
- 		for man in $(MAN8); do \
--			$(INSTALL_DATA) ../man/$$man $(ROOT)$(MANDIR)/man8/; \
--			sed -i "1{ $(MANDB); }" $(ROOT)$(MANDIR)/man8/$$man ; \
-+			$(INSTALL_DATA) ../man/$$man $(ROOT)$(mandir)/man8/; \
-+			sed -i "1{ $(MANDB); }" $(ROOT)$(mandir)/man8/$$man ; \
- 		done
- ifeq ($(ROOT),)
- 		#
+ 		for man in $(MANPAGES) ; do \
+-		    targetdir=$(ROOT)$(MANDIR)/$$(dirname $$man)/man$${man##*.}; \
++		    targetdir=$(ROOT)$(mandir)/$$(dirname $$man)/man$${man##*.}; \
+ 		    $(INSTALL_DIR) $$targetdir; \
+ 		    $(INSTALL_DATA) ../man/$$man $$targetdir/$$(basename $$man); \
+ 		    sed -i "1{ $(MANDB); }" $$targetdir/$$(basename $$man); \
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 8ef292ed129..66da6fb4032 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 0e441712d0e366a0384ff3fa879f5a2d2607c24f Mon Sep 17 00:00:00 2001
+From 2b19b36409b8de0621b9aeb0d13748e947a5bbfb Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -14,7 +14,6 @@ Upstream-Status: Backport
 Imported patch from: https://bugzilla.redhat.com/attachment.cgi?id=658166
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  man/pidof.8    |  6 +++++
  src/killall5.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++---
@@ -45,17 +44,17 @@ index 6866cb3..a87d878 100644
  .TP
  .B 0
 diff --git a/src/killall5.c b/src/killall5.c
-index b0728fa..72289e3 100644
+index 6f7528a..34d656b 100644
 --- a/src/killall5.c
 +++ b/src/killall5.c
 @@ -121,6 +121,7 @@ typedef struct _s_nfs
  
  /* List of processes. */
- PROC *plist;
-+PROC *olist;
+ PROC *plist = NULL;
++PROC *olist = NULL;
  
  /* List of processes to omit. */
- OMIT *omit;
+ OMIT *omit = NULL;
 @@ -356,6 +357,20 @@ static void clear_mnt(void)
  	}
  }
@@ -85,7 +84,7 @@ index b0728fa..72289e3 100644
  	struct dirent	*d;
  	char		path[PATH_MAX+1];
  	char		buf[PATH_MAX+1];
-@@ -670,6 +686,17 @@ int readproc()
+@@ -671,6 +687,17 @@ int readproc()
  		p->next = plist;
  		plist = p;
  		p->pid = pid;
@@ -103,7 +102,7 @@ index b0728fa..72289e3 100644
  	}
  	closedir(dir);
  
-@@ -870,6 +897,26 @@ PIDQ_HEAD *pidof(char *prog)
+@@ -877,6 +904,26 @@ PIDQ_HEAD *pidof(char *prog)
  	return q;
  }
  
@@ -130,7 +129,7 @@ index b0728fa..72289e3 100644
  /* Give usage message and exit. */
  void usage(void)
  {
-@@ -920,6 +967,7 @@ void nsyslog(int pri, char *fmt, ...)
+@@ -927,6 +974,7 @@ void nsyslog(int pri, char *fmt, ...)
  #define PIDOF_OMIT	0x02
  #define PIDOF_NETFS	0x04
  #define PIDOF_QUIET     0x08
@@ -138,7 +137,7 @@ index b0728fa..72289e3 100644
  
  /*
   *	Pidof functionality.
-@@ -937,6 +985,7 @@ int main_pidof(int argc, char **argv)
+@@ -944,6 +992,7 @@ int main_pidof(int argc, char **argv)
  	char		tmp[512];
          char            sep = ' ';
  
@@ -146,7 +145,7 @@ index b0728fa..72289e3 100644
  	omit = (OMIT*)0;
  	nlist = (NFS*)0;
  	opterr = 0;
-@@ -944,7 +993,7 @@ int main_pidof(int argc, char **argv)
+@@ -951,7 +1000,7 @@ int main_pidof(int argc, char **argv)
  	if ((token = getenv("PIDOF_NETFS")) && (strcmp(token,"no") != 0))
  		flags |= PIDOF_NETFS;
  
@@ -155,7 +154,7 @@ index b0728fa..72289e3 100644
  		case '?':
  			nsyslog(LOG_ERR,"invalid options on command line!\n");
  			closelog();
-@@ -995,6 +1044,9 @@ int main_pidof(int argc, char **argv)
+@@ -1002,6 +1051,9 @@ int main_pidof(int argc, char **argv)
                  case 'z':
                          list_dz_processes = TRUE;
                          break;
@@ -165,7 +164,7 @@ index b0728fa..72289e3 100644
  		case 'n':
  			flags |= PIDOF_NETFS;
  			break;
-@@ -1026,10 +1078,13 @@ int main_pidof(int argc, char **argv)
+@@ -1033,10 +1085,13 @@ int main_pidof(int argc, char **argv)
  			pid_t spid = 0;
  			while ((p = get_next_from_pid_q(q))) {
  				if ((flags & PIDOF_OMIT) && omit) {
@@ -181,7 +180,7 @@ index b0728fa..72289e3 100644
  					}
  
  					/*
-@@ -1071,6 +1126,7 @@ int main_pidof(int argc, char **argv)
+@@ -1078,6 +1133,7 @@ int main_pidof(int argc, char **argv)
  		printf("\n");
          }
  
@@ -189,3 +188,6 @@ index b0728fa..72289e3 100644
  	clear_mnt();
  
  	closelog();
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/realpath.patch b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
index b559aa3b490..7a669d01111 100644
--- a/meta/recipes-core/sysvinit/sysvinit/realpath.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/realpath.patch
@@ -1,4 +1,4 @@
-From eb158c97f19d473d01befe96359a7f93ae834517 Mon Sep 17 00:00:00 2001
+From 50e6b3a0fc7c083e6514a55ac93e5591aaeb787d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 19 Nov 2015 00:10:03 +0000
 Subject: [PATCH] Fix build on musl use realpath() API its available on all
@@ -10,7 +10,6 @@ However for Linux it should always work
 Upstream-Status: Inappropriate [Linux specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  src/killall5.c   | 4 ++--
  src/mountpoint.c | 1 +
@@ -18,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  3 files changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/killall5.c b/src/killall5.c
-index a664954..9798423 100644
+index 34d656b..bc19d7f 100644
 --- a/src/killall5.c
 +++ b/src/killall5.c
-@@ -977,9 +977,9 @@ int matches(PROC *o, PROC *p)
+@@ -910,9 +910,9 @@ int matches(PROC *o, PROC *p)
  	char *oargv1, *pargv1;
  	if ((o->argv0 && p->argv0 && !strcmp(o->argv0,p->argv0))) {
  		if (o->argv1 && p->argv1) {
@@ -34,7 +33,7 @@ index a664954..9798423 100644
  			if (! strcmp(oargv1, pargv1)) {
  				ret = 1;
 diff --git a/src/mountpoint.c b/src/mountpoint.c
-index b24335e..5f20522 100644
+index 184b1f6..c55b0df 100644
 --- a/src/mountpoint.c
 +++ b/src/mountpoint.c
 @@ -23,6 +23,7 @@
@@ -46,7 +45,7 @@ index b24335e..5f20522 100644
  #include <unistd.h>
  #include <stdlib.h>
 diff --git a/src/wall.c b/src/wall.c
-index d3a2c70..00826e9 100644
+index e527613..1d363ca 100644
 --- a/src/wall.c
 +++ b/src/wall.c
 @@ -30,6 +30,7 @@
@@ -57,3 +56,6 @@ index d3a2c70..00826e9 100644
  #include "init.h"
  
  
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch b/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
deleted file mode 100644
index 89d65c23b71..00000000000
--- a/meta/recipes-core/sysvinit/sysvinit/sysvinit_remove_linux_fs.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-# From glibc 2.36, <linux/mount.h> (included from <linux/fs.h>) and 
-# <sys/mount.h> (included from glibc) are no longer compatible:
-# https://sourceware.org/glibc/wiki/Release/2.36#Usage_of_.3Clinux.2Fmount.h.3E_and_.3Csys.2Fmount.h.3E
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- sysvinit-3.04/src/sulogin.c.orig	2022-08-07 23:07:42.952576274 +0200
-+++ sysvinit-3.04/src/sulogin.c	2022-08-07 23:08:26.511470983 +0200
-@@ -51,7 +51,6 @@
- #ifdef __linux__
- #  include <sys/statfs.h>
- #  include <sys/mount.h>
--#  include <linux/fs.h>
- #  include <linux/magic.h>
- #  include <linux/major.h>
- #  ifndef TMPFS_MAGIC
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.04.bb b/meta/recipes-core/sysvinit/sysvinit_3.11.bb
similarity index 95%
rename from meta/recipes-core/sysvinit/sysvinit_3.04.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.11.bb
index 27ab4162a79..e8eab275644 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.04.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.11.bb
@@ -16,15 +16,13 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
            file://pidof-add-m-option.patch \
            file://realpath.patch \
            file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
-           file://sysvinit_remove_linux_fs.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
            file://bootlogd.init \
            file://01_bootlogd \
-           file://0001-hddown-include-libgen.h-for-basename-API.patch \
            "
-SRC_URI[sha256sum] = "2a621fe6e4528bc91308b74867ddaaebbdf7753f02395c0c5bae817bd2b7e3a5"
+SRC_URI[sha256sum] = "04f1b7d67413af1c09c41acc1e3ce946f2d0f7a1e47c9978744bc542864e13d4"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1


