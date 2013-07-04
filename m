Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 5214D6A413
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 22:58:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2013 15:57:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,997,1363158000"; d="scan'208";a="264232845"
Received: from unknown (HELO [10.255.13.183]) ([10.255.13.183])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Jul 2013 15:57:33 -0700
Message-ID: <51D5FDDD.9060001@linux.intel.com>
Date: Thu, 04 Jul 2013 15:57:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Radu Moisan <radu.moisan@intel.com>
References: <cover.1372950678.git.radu.moisan@intel.com>
	<c58e7b4d95d7398f1bed76ec2787660addaa9b53.1372950678.git.radu.moisan@intel.com>
In-Reply-To: <c58e7b4d95d7398f1bed76ec2787660addaa9b53.1372950678.git.radu.moisan@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/10] busybox: Upgrade to v1.21.0
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
X-List-Received-Date: Thu, 04 Jul 2013 22:58:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2013 08:13 AM, Radu Moisan wrote:
> Removed obsolete patches
> Added a few fixes from upstream
> (http://busybox.net/downloads/fixes-1.21.0/)
> *busybox-1.21.0-mdev.patch
> *busybox-1.21.0-platform.patch
> *busybox-1.21.0-xz.patch
>

Did you see Qi Chen's patch to update to 1.21.1?


Sau!


> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
>   .../busybox/busybox-1.20.2/B921600.patch           |   24 -
>   .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 -
>   .../busybox-mkfs-minix-tests_bigendian.patch       |   34 -
>   .../fix-for-spurious-testsuite-failure.patch       |   27 -
>   .../busybox/busybox-1.20.2/sys_resource.patch      |   99 ---
>   .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 -
>   .../busybox-1.21.0/busybox-1.21.0-mdev.patch       |  647 ++++++++++++++++++++
>   .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   28 +
>   .../busybox/busybox-1.21.0/busybox-1.21.0-xz.patch |   88 +++
>   .../busybox-appletlib-dependency.patch             |    0
>   ...usybox-list-suid-and-non-suid-app-configs.patch |    0
>   .../busybox-sulogin-empty-root-password.patch      |    0
>   .../busybox-udhcpc-no_deconfig.patch               |    0
>   .../{busybox-1.20.2 => busybox-1.21.0}/defconfig   |    0
>   .../fail_on_no_media.patch                         |    0
>   .../get_header_tar.patch                           |    0
>   .../login-utilities.cfg                            |    0
>   .../run-parts.in.usr-bin.patch                     |    6 +-
>   .../stat-usr-bin.patch                             |    0
>   .../strict-atime.patch                             |    0
>   ...estsuite-du-du-k-works-fix-false-positive.patch |    0
>   .../watch.in.usr-bin.patch                         |    0
>   .../{busybox_1.20.2.bb => busybox_1.21.0.bb}       |   20 +-
>   23 files changed, 774 insertions(+), 257 deletions(-)
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
>   delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
>   create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
>   create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
>   create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-appletlib-dependency.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-list-suid-and-non-suid-app-configs.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-sulogin-empty-root-password.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-udhcpc-no_deconfig.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/defconfig (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/fail_on_no_media.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/get_header_tar.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/login-utilities.cfg (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/run-parts.in.usr-bin.patch (90%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/stat-usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/strict-atime.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
>   rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/watch.in.usr-bin.patch (100%)
>   rename meta/recipes-core/busybox/{busybox_1.20.2.bb => busybox_1.21.0.bb} (73%)
>
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch b/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
> deleted file mode 100644
> index c4d98e3..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -# copy commit message from OE as the patch comment:
> -#    commit 5b1ed09b1ab1a60a28a76e4658bc9957cd361b5d
> -#    Author: Valentin Longchamp <valentin.longchamp@epfl.ch>
> -#    Date:   Mon Dec 8 14:43:23 2008 +0100
> -
> -#    busybox: added support for 921600 speed of serial line
> -#
> -# above comment added by Kevin Tian <kevin.tian@intel.com>, 2010-07-06
> -
> -diff -upNr busybox-1.7.2/libbb/speed_table.c busybox-1.7.2-921600/libbb/speed_table.c
> ---- busybox-1.7.2/libbb/speed_table.c	2007-09-03 13:48:41.000000000 +0200
> -+++ busybox-1.7.2-921600/libbb/speed_table.c	2008-10-09 16:23:26.269592899 +0200
> -@@ -52,6 +52,9 @@ static const struct speed_map speeds[] =
> - #ifdef B460800
> - 	{B460800, 460800/256 + 0x8000U},
> - #endif
> -+#ifdef B921600
> -+	{B921600, 921600/256 + 0x8000U},
> -+#endif
> - };
> -
> - enum { NUM_SPEEDS = ARRAY_SIZE(speeds) };
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
> deleted file mode 100644
> index 69bbe73..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> -Upstream-Status: Pending
> -
> ---- busybox-1.20.2/libbb/kernel_version.c
> -+++ busybox-1.20.2-kernel_ver/libbb/kernel_version.c
> -@@ -20,18 +20,15 @@
> - int FAST_FUNC get_linux_version_code(void)
> - {
> - 	struct utsname name;
> --	char *s;
> -+	char *s, *t;
> - 	int i, r;
> -
> --	if (uname(&name) == -1) {
> --		bb_perror_msg("can't get system information");
> --		return 0;
> --	}
> --
> -+	uname(&name); /* never fails */
> - 	s = name.release;
> - 	r = 0;
> - 	for (i = 0; i < 3; i++) {
> --		r = r * 256 + atoi(strtok(s, "."));
> -+		t = strtok(s, ".");
> -+		r = r * 256 + (t ? atoi(t) : 0);
> - 		s = NULL;
> - 	}
> - 	return r;
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
> deleted file mode 100644
> index 089c5e0..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -patch mkfs.minix.tests to have correct md5sum on big endian platform
> -
> -Upstream-Status: Accepted, expected in next release
> -
> -Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> -
> -diff --git a/testsuite/mkfs.minix.tests b/testsuite/mkfs.minix.tests
> -index 8a33c16..7eecaf2 100755
> ---- a/testsuite/mkfs.minix.tests
> -+++ b/testsuite/mkfs.minix.tests
> -@@ -8,6 +8,14 @@
> -
> - # testing "test name" "options" "expected result" "file input" "stdin"
> -
> -+# '\n' produces 10 on little endian, but not on big endian
> -+cr=`echo | od -i | sed 's/.* //g;2d'`
> -+if [ x"$cr" = x"10" ]; then
> -+	hash=4f35f7afeba07d56055bed1f29ae20b7
> -+else
> -+	hash=5adbc1b3ccd20ca5d0ab5bc1e13ac3fc
> -+fi
> -+
> - testing "mkfs.minix" \
> - 	"dd if=/dev/zero of=input bs=1k count=1024 2>/dev/null; mkfs.minix input; md5sum <input" \
> - "352 inodes\n"\
> -@@ -15,7 +23,7 @@ testing "mkfs.minix" \
> - "Firstdatazone=15 (15)\n"\
> - "Zonesize=1024\n"\
> - "Maxsize=268966912\n"\
> --"4f35f7afeba07d56055bed1f29ae20b7  -\n" \
> -+"$hash  -\n" \
> - 	"" \
> - 	""
> -
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch b/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
> deleted file mode 100644
> index b75eaac..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -Backport the patch from:
> -http://git.busybox.net/busybox/commit/?id=a5ee090e8651692545514a81a16c6cde3a2dc577
> -
> -From a5ee090e8651692545514a81a16c6cde3a2dc577 Mon Sep 17 00:00:00 2001
> -From: Denys Vlasenko <vda.linux@googlemail.com>
> -Date: Thu, 10 May 2012 19:26:37 +0200
> -Subject: [PATCH] fix for spurious testsuite failure
> -
> -Upstream-Status: Backport
> -Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> ----
> - testsuite/du/du-k-works |    1 +
> - 1 files changed, 1 insertions(+), 0 deletions(-)
> -
> -diff --git a/testsuite/du/du-k-works b/testsuite/du/du-k-works
> -index 229a948..36dcaa8 100644
> ---- a/testsuite/du/du-k-works
> -+++ b/testsuite/du/du-k-works
> -@@ -3,4 +3,5 @@ cd du.testdir
> - dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
> - dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
> - test x"`busybox du -k .`" = x"80	." \
> -+  -o x"`busybox du -k .`" = x"84	." \
> -   -o x"`busybox du -k .`" = x"88	."
> ---
> -1.7.4.1
> -
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch b/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
> deleted file mode 100644
> index bd55961..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Upstream-Status: Pending
> -
> -From c5fe9f7b723f949457263ef8e22ab807d5b549ce Mon Sep 17 00:00:00 2001
> -From: Mike Frysinger <vapier@gentoo.org>
> -Date: Fri, 06 Jul 2012 03:19:09 +0000
> -Subject: include sys/resource.h where needed
> -
> -We use functions from sys/resource.h in misc applets, but don't include
> -the header.  This breaks building with newer glibc versions, so add the
> -include where needed.
> -
> -Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ----
> -Index: busybox-1.19.4/loginutils/passwd.c
> -===================================================================
> ---- busybox-1.19.4.orig/loginutils/passwd.c	2012-02-04 11:34:24.000000000 -0800
> -+++ busybox-1.19.4/loginutils/passwd.c	2012-07-06 17:48:27.388096092 -0700
> -@@ -15,6 +15,7 @@
> -
> - #include "libbb.h"
> - #include <syslog.h>
> -+#include <sys/resource.h> /* setrlimit */
> -
> - static void nuke_str(char *str)
> - {
> -Index: busybox-1.19.4/miscutils/time.c
> -===================================================================
> ---- busybox-1.19.4.orig/miscutils/time.c	2012-02-04 11:24:55.000000000 -0800
> -+++ busybox-1.19.4/miscutils/time.c	2012-07-06 17:48:27.388096092 -0700
> -@@ -16,6 +16,7 @@
> - //usage:     "\n	-v	Verbose"
> -
> - #include "libbb.h"
> -+#include <sys/resource.h> /* getrusage */
> -
> - /* Information on the resources used by a child process.  */
> - typedef struct {
> -Index: busybox-1.19.4/networking/inetd.c
> -===================================================================
> ---- busybox-1.19.4.orig/networking/inetd.c	2012-02-04 11:34:24.000000000 -0800
> -+++ busybox-1.19.4/networking/inetd.c	2012-07-06 17:48:54.852097259 -0700
> -@@ -165,6 +165,7 @@
> - //usage:     "\n		(default: 0 - disabled)"
> -
> - #include <syslog.h>
> -+#include <sys/resource.h> /* setrlimit */
> - #include <sys/un.h>
> -
> - #include "libbb.h"
> -Index: busybox-1.19.4/networking/ntpd.c
> -===================================================================
> ---- busybox-1.19.4.orig/networking/ntpd.c	2012-02-04 11:24:55.000000000 -0800
> -+++ busybox-1.19.4/networking/ntpd.c	2012-07-06 17:48:27.392096048 -0700
> -@@ -46,6 +46,7 @@
> - #include "libbb.h"
> - #include <math.h>
> - #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
> -+#include <sys/resource.h> /* setpriority */
> - #include <sys/timex.h>
> - #ifndef IPTOS_LOWDELAY
> - # define IPTOS_LOWDELAY 0x10
> -Index: busybox-1.19.4/networking/ntpd_simple.c
> -===================================================================
> ---- busybox-1.19.4.orig/networking/ntpd_simple.c	2012-02-04 11:24:55.000000000 -0800
> -+++ busybox-1.19.4/networking/ntpd_simple.c	2012-07-06 17:48:27.400095949 -0700
> -@@ -7,6 +7,7 @@
> -  */
> - #include "libbb.h"
> - #include <netinet/ip.h> /* For IPTOS_LOWDELAY definition */
> -+#include <sys/resource.h> /* setpriority */
> - #ifndef IPTOS_LOWDELAY
> - # define IPTOS_LOWDELAY 0x10
> - #endif
> -Index: busybox-1.19.4/runit/chpst.c
> -===================================================================
> ---- busybox-1.19.4.orig/runit/chpst.c	2012-02-04 11:34:24.000000000 -0800
> -+++ busybox-1.19.4/runit/chpst.c	2012-07-06 17:48:27.400095949 -0700
> -@@ -91,6 +91,7 @@
> - //usage:     "\n			a SIGXCPU after N seconds"
> -
> - #include "libbb.h"
> -+#include <sys/resource.h> /* getrlimit */
> -
> - /*
> - Five applets here: chpst, envdir, envuidgid, setuidgid, softlimit.
> -Index: busybox-1.19.4/shell/shell_common.c
> -===================================================================
> ---- busybox-1.19.4.orig/shell/shell_common.c	2012-02-04 11:34:24.000000000 -0800
> -+++ busybox-1.19.4/shell/shell_common.c	2012-07-06 17:48:27.400095949 -0700
> -@@ -18,6 +18,7 @@
> -  */
> - #include "libbb.h"
> - #include "shell_common.h"
> -+#include <sys/resource.h> /* getrlimit */
> -
> - const char defifsvar[] ALIGN1 = "IFS= \t\n";
> -
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch b/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
> deleted file mode 100644
> index 3003965..0000000
> --- a/meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -In cases where busybox wget is invoked with -P <...> and the url ends
> -in "/", the download directory is ignored (ie the file index.html is
> -implied), this change enables the -P option for those urls.
> -
> -Signed-off-by: Amy Fong <amy.fong@windriver.com>
> -Upstream-Status: Submitted
> ----
> - networking/wget.c |   10 +++++++---
> - 1 file changed, 7 insertions(+), 3 deletions(-)
> -
> ---- a/networking/wget.c
> -+++ b/networking/wget.c
> -@@ -589,10 +589,14 @@
> - 	if (!(option_mask32 & WGET_OPT_OUTNAME)) {
> - 		G.fname_out = bb_get_last_path_component_nostrip(target.path);
> - 		/* handle "wget http://kernel.org//" */
> --		if (G.fname_out[0] == '/' || !G.fname_out[0])
> --			G.fname_out = (char*)"index.html";
> -+		if (G.fname_out[0] == '/' || !G.fname_out[0]) {
> -+			/* bug: if we provide a default name, we should still look at -P option */
> -+			if (G.dir_prefix)
> -+				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, "index.html");
> -+			else
> -+				G.fname_out = (char*)"index.html";
> - 		/* -P DIR is considered only if there was no -O FILE */
> --		else {
> -+		} else {
> - 			if (G.dir_prefix)
> - 				G.fname_out = fname_out_alloc = concat_path_file(G.dir_prefix, G.fname_out);
> - 			else {
> diff --git a/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
> new file mode 100644
> index 0000000..a01ec08
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
> @@ -0,0 +1,647 @@
> +http://busybox.net/downloads/fixes-1.21.0/
> +
> +Upstream-Status: Pending
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> +--- busybox-1.21.0/util-linux/mdev.c
> ++++ busybox-1.21.0-mdev/util-linux/mdev.c
> +@@ -80,7 +80,7 @@
> + //usage:	IF_FEATURE_MDEV_CONF(
> + //usage:       "\n"
> + //usage:       "It uses /etc/mdev.conf with lines\n"
> +-//usage:       "	[-]DEVNAME UID:GID PERM"
> ++//usage:       "	[-][ENV=regex;]...DEVNAME UID:GID PERM"
> + //usage:			IF_FEATURE_MDEV_RENAME(" [>|=PATH]|[!]")
> + //usage:			IF_FEATURE_MDEV_EXEC(" [@|$|*PROG]")
> + //usage:       "\n"
> +@@ -230,9 +230,34 @@
> +  * SUBSYSTEM=block
> +  */
> +
> +-static const char keywords[] ALIGN1 = "add\0remove\0change\0";
> ++#define DEBUG_LVL 2
> ++
> ++#if DEBUG_LVL >= 1
> ++# define dbg1(...) do { if (G.verbose) bb_error_msg(__VA_ARGS__); } while(0)
> ++#else
> ++# define dbg1(...) ((void)0)
> ++#endif
> ++#if DEBUG_LVL >= 2
> ++# define dbg2(...) do { if (G.verbose >= 2) bb_error_msg(__VA_ARGS__); } while(0)
> ++#else
> ++# define dbg2(...) ((void)0)
> ++#endif
> ++#if DEBUG_LVL >= 3
> ++# define dbg3(...) do { if (G.verbose >= 3) bb_error_msg(__VA_ARGS__); } while(0)
> ++#else
> ++# define dbg3(...) ((void)0)
> ++#endif
> ++
> ++
> ++static const char keywords[] ALIGN1 = "add\0remove\0"; // "change\0"
> + enum { OP_add, OP_remove };
> +
> ++struct envmatch {
> ++	struct envmatch *next;
> ++	char *envname;
> ++	regex_t match;
> ++};
> ++
> + struct rule {
> + 	bool keep_matching;
> + 	bool regex_compiled;
> +@@ -243,12 +268,14 @@ struct rule {
> + 	char *ren_mov;
> + 	IF_FEATURE_MDEV_EXEC(char *r_cmd;)
> + 	regex_t match;
> ++	struct envmatch *envmatch;
> + };
> +
> + struct globals {
> + 	int root_major, root_minor;
> + 	smallint verbose;
> + 	char *subsystem;
> ++	char *subsys_env; /* for putenv("SUBSYSTEM=subsystem") */
> + #if ENABLE_FEATURE_MDEV_CONF
> + 	const char *filename;
> + 	parser_t *parser;
> +@@ -256,6 +283,7 @@ struct globals {
> + 	unsigned rule_idx;
> + #endif
> + 	struct rule cur_rule;
> ++	char timestr[sizeof("60.123456")];
> + } FIX_ALIASING;
> + #define G (*(struct globals*)&bb_common_bufsiz1)
> + #define INIT_G() do { \
> +@@ -270,13 +298,6 @@ struct globals {
> + /* We use additional 64+ bytes in make_device() */
> + #define SCRATCH_SIZE 80
> +
> +-#if 0
> +-# define dbg(...) bb_error_msg(__VA_ARGS__)
> +-#else
> +-# define dbg(...) ((void)0)
> +-#endif
> +-
> +-
> + #if ENABLE_FEATURE_MDEV_CONF
> +
> + static void make_default_cur_rule(void)
> +@@ -288,14 +309,65 @@ static void make_default_cur_rule(void)
> +
> + static void clean_up_cur_rule(void)
> + {
> ++	struct envmatch *e;
> ++
> + 	free(G.cur_rule.envvar);
> ++	free(G.cur_rule.ren_mov);
> + 	if (G.cur_rule.regex_compiled)
> + 		regfree(&G.cur_rule.match);
> +-	free(G.cur_rule.ren_mov);
> + 	IF_FEATURE_MDEV_EXEC(free(G.cur_rule.r_cmd);)
> ++	e = G.cur_rule.envmatch;
> ++	while (e) {
> ++		free(e->envname);
> ++		regfree(&e->match);
> ++		e = e->next;
> ++	}
> + 	make_default_cur_rule();
> + }
> +
> ++/* In later versions, endofname is in libbb */
> ++#define endofname mdev_endofname
> ++static
> ++const char* FAST_FUNC
> ++endofname(const char *name)
> ++{
> ++#define is_name(c)      ((c) == '_' || isalpha((unsigned char)(c)))
> ++#define is_in_name(c)   ((c) == '_' || isalnum((unsigned char)(c)))
> ++	if (!is_name(*name))
> ++		return name;
> ++	while (*++name) {
> ++		if (!is_in_name(*name))
> ++			break;
> ++	}
> ++	return name;
> ++}
> ++
> ++static char *parse_envmatch_pfx(char *val)
> ++{
> ++	struct envmatch **nextp = &G.cur_rule.envmatch;
> ++
> ++	for (;;) {
> ++		struct envmatch *e;
> ++		char *semicolon;
> ++		char *eq = strchr(val, '=');
> ++		if (!eq /* || eq == val? */)
> ++			return val;
> ++		if (endofname(val) != eq)
> ++			return val;
> ++		semicolon = strchr(eq, ';');
> ++		if (!semicolon)
> ++			return val;
> ++		/* ENVVAR=regex;... */
> ++		*nextp = e = xzalloc(sizeof(*e));
> ++		nextp = &e->next;
> ++		e->envname = xstrndup(val, eq - val);
> ++		*semicolon = '\0';
> ++		xregcomp(&e->match, eq + 1, REG_EXTENDED);
> ++		*semicolon = ';';
> ++		val = semicolon + 1;
> ++	}
> ++}
> ++
> + static void parse_next_rule(void)
> + {
> + 	/* Note: on entry, G.cur_rule is set to default */
> +@@ -308,12 +380,13 @@ static void parse_next_rule(void)
> + 			break;
> +
> + 		/* Fields: [-]regex uid:gid mode [alias] [cmd] */
> +-		dbg("token1:'%s'", tokens[1]);
> ++		dbg3("token1:'%s'", tokens[1]);
> +
> + 		/* 1st field */
> + 		val = tokens[0];
> + 		G.cur_rule.keep_matching = ('-' == val[0]);
> + 		val += G.cur_rule.keep_matching; /* swallow leading dash */
> ++		val = parse_envmatch_pfx(val);
> + 		if (val[0] == '@') {
> + 			/* @major,minor[-minor2] */
> + 			/* (useful when name is ambiguous:
> +@@ -328,8 +401,10 @@ static void parse_next_rule(void)
> + 			if (sc == 2)
> + 				G.cur_rule.min1 = G.cur_rule.min0;
> + 		} else {
> ++			char *eq = strchr(val, '=');
> + 			if (val[0] == '$') {
> +-				char *eq = strchr(++val, '=');
> ++				/* $ENVVAR=regex ... */
> ++				val++;
> + 				if (!eq) {
> + 					bb_error_msg("bad $envvar=regex on line %d", G.parser->lineno);
> + 					goto next_rule;
> +@@ -373,7 +448,7 @@ static void parse_next_rule(void)
> + 		clean_up_cur_rule();
> + 	} /* while (config_read) */
> +
> +-	dbg("config_close(G.parser)");
> ++	dbg3("config_close(G.parser)");
> + 	config_close(G.parser);
> + 	G.parser = NULL;
> +
> +@@ -390,7 +465,7 @@ static const struct rule *next_rule(void
> +
> + 	/* Open conf file if we didn't do it yet */
> + 	if (!G.parser && G.filename) {
> +-		dbg("config_open('%s')", G.filename);
> ++		dbg3("config_open('%s')", G.filename);
> + 		G.parser = config_open2(G.filename, fopen_for_read);
> + 		G.filename = NULL;
> + 	}
> +@@ -399,7 +474,7 @@ static const struct rule *next_rule(void
> + 		/* mdev -s */
> + 		/* Do we have rule parsed already? */
> + 		if (G.rule_vec[G.rule_idx]) {
> +-			dbg("< G.rule_vec[G.rule_idx:%d]=%p", G.rule_idx, G.rule_vec[G.rule_idx]);
> ++			dbg3("< G.rule_vec[G.rule_idx:%d]=%p", G.rule_idx, G.rule_vec[G.rule_idx]);
> + 			return G.rule_vec[G.rule_idx++];
> + 		}
> + 		make_default_cur_rule();
> +@@ -416,13 +491,28 @@ static const struct rule *next_rule(void
> + 			rule = memcpy(xmalloc(sizeof(G.cur_rule)), &G.cur_rule, sizeof(G.cur_rule));
> + 			G.rule_vec = xrealloc_vector(G.rule_vec, 4, G.rule_idx);
> + 			G.rule_vec[G.rule_idx++] = rule;
> +-			dbg("> G.rule_vec[G.rule_idx:%d]=%p", G.rule_idx, G.rule_vec[G.rule_idx]);
> ++			dbg3("> G.rule_vec[G.rule_idx:%d]=%p", G.rule_idx, G.rule_vec[G.rule_idx]);
> + 		}
> + 	}
> +
> + 	return rule;
> + }
> +
> ++static int env_matches(struct envmatch *e)
> ++{
> ++	while (e) {
> ++		int r;
> ++		char *val = getenv(e->envname);
> ++		if (!val)
> ++			return 0;
> ++		r = regexec(&e->match, val, /*size*/ 0, /*range[]*/ NULL, /*eflags*/ 0);
> ++		if (r != 0) /* no match */
> ++			return 0;
> ++		e = e->next;
> ++	}
> ++	return 1;
> ++}
> ++
> + #else
> +
> + # define next_rule() (&G.cur_rule)
> +@@ -479,9 +569,6 @@ static void make_device(char *device_nam
> + {
> + 	int major, minor, type, len;
> +
> +-	if (G.verbose)
> +-		bb_error_msg("device: %s, %s", device_name, path);
> +-
> + 	/* Try to read major/minor string.  Note that the kernel puts \n after
> + 	 * the data, so we don't need to worry about null terminating the string
> + 	 * because sscanf() will stop at the first nondigit, which \n is.
> +@@ -500,8 +587,7 @@ static void make_device(char *device_nam
> + 			/* no "dev" file, but we can still run scripts
> + 			 * based on device name */
> + 		} else if (sscanf(++dev_maj_min, "%u:%u", &major, &minor) == 2) {
> +-			if (G.verbose)
> +-				bb_error_msg("maj,min: %u,%u", major, minor);
> ++			dbg1("dev %u,%u", major, minor);
> + 		} else {
> + 			major = -1;
> + 		}
> +@@ -511,7 +597,8 @@ static void make_device(char *device_nam
> + 	/* Determine device name, type, major and minor */
> + 	if (!device_name)
> + 		device_name = (char*) bb_basename(path);
> +-	/* http://kernel.org/doc/pending/hotplug.txt says that only
> ++	/*
> ++	 * http://kernel.org/doc/pending/hotplug.txt says that only
> + 	 * "/sys/block/..." is for block devices. "/sys/bus" etc is not.
> + 	 * But since 2.6.25 block devices are also in /sys/class/block.
> + 	 * We use strstr("/block/") to forestall future surprises.
> +@@ -537,6 +624,8 @@ static void make_device(char *device_nam
> + 		rule = next_rule();
> +
> + #if ENABLE_FEATURE_MDEV_CONF
> ++		if (!env_matches(rule->envmatch))
> ++			continue;
> + 		if (rule->maj >= 0) {  /* @maj,min rule */
> + 			if (major != rule->maj)
> + 				continue;
> +@@ -547,7 +636,7 @@ static void make_device(char *device_nam
> + 		}
> + 		if (rule->envvar) { /* $envvar=regex rule */
> + 			str_to_match = getenv(rule->envvar);
> +-			dbg("getenv('%s'):'%s'", rule->envvar, str_to_match);
> ++			dbg3("getenv('%s'):'%s'", rule->envvar, str_to_match);
> + 			if (!str_to_match)
> + 				continue;
> + 		}
> +@@ -555,7 +644,7 @@ static void make_device(char *device_nam
> +
> + 		if (rule->regex_compiled) {
> + 			int regex_match = regexec(&rule->match, str_to_match, ARRAY_SIZE(off), off, 0);
> +-			dbg("regex_match for '%s':%d", str_to_match, regex_match);
> ++			dbg3("regex_match for '%s':%d", str_to_match, regex_match);
> + 			//bb_error_msg("matches:");
> + 			//for (int i = 0; i < ARRAY_SIZE(off); i++) {
> + 			//	if (off[i].rm_so < 0) continue;
> +@@ -574,9 +663,8 @@ static void make_device(char *device_nam
> + 		}
> + 		/* else: it's final implicit "match-all" rule */
> +  rule_matches:
> ++		dbg2("rule matched, line %d", G.parser ? G.parser->lineno : -1);
> + #endif
> +-		dbg("rule matched");
> +-
> + 		/* Build alias name */
> + 		alias = NULL;
> + 		if (ENABLE_FEATURE_MDEV_RENAME && rule->ren_mov) {
> +@@ -619,34 +707,30 @@ static void make_device(char *device_nam
> + 				}
> + 			}
> + 		}
> +-		dbg("alias:'%s'", alias);
> ++		dbg3("alias:'%s'", alias);
> +
> + 		command = NULL;
> + 		IF_FEATURE_MDEV_EXEC(command = rule->r_cmd;)
> + 		if (command) {
> +-			const char *s = "$@*";
> +-			const char *s2 = strchr(s, command[0]);
> +-
> + 			/* Are we running this command now?
> +-			 * Run $cmd on delete, @cmd on create, *cmd on both
> ++			 * Run @cmd on create, $cmd on delete, *cmd on any
> + 			 */
> +-			if (s2 - s != (operation == OP_remove) || *s2 == '*') {
> +-				/* We are here if: '*',
> +-				 * or: '@' and delete = 0,
> +-				 * or: '$' and delete = 1
> +-				 */
> ++			if ((command[0] == '@' && operation == OP_add)
> ++			 || (command[0] == '$' && operation == OP_remove)
> ++			 || (command[0] == '*')
> ++			) {
> + 				command++;
> + 			} else {
> + 				command = NULL;
> + 			}
> + 		}
> +-		dbg("command:'%s'", command);
> ++		dbg3("command:'%s'", command);
> +
> + 		/* "Execute" the line we found */
> + 		node_name = device_name;
> + 		if (ENABLE_FEATURE_MDEV_RENAME && alias) {
> + 			node_name = alias = build_alias(alias, device_name);
> +-			dbg("alias2:'%s'", alias);
> ++			dbg3("alias2:'%s'", alias);
> + 		}
> +
> + 		if (operation == OP_add && major >= 0) {
> +@@ -656,8 +740,17 @@ static void make_device(char *device_nam
> + 				mkdir_recursive(node_name);
> + 				*slash = '/';
> + 			}
> +-			if (G.verbose)
> +-				bb_error_msg("mknod: %s (%d,%d) %o", node_name, major, minor, rule->mode | type);
> ++			if (ENABLE_FEATURE_MDEV_CONF) {
> ++				dbg1("mknod %s (%d,%d) %o"
> ++					" %u:%u",
> ++					node_name, major, minor, rule->mode | type,
> ++					rule->ugid.uid, rule->ugid.gid
> ++				);
> ++			} else {
> ++				dbg1("mknod %s (%d,%d) %o",
> ++					node_name, major, minor, rule->mode | type
> ++				);
> ++			}
> + 			if (mknod(node_name, rule->mode | type, makedev(major, minor)) && errno != EEXIST)
> + 				bb_perror_msg("can't create '%s'", node_name);
> + 			if (ENABLE_FEATURE_MDEV_CONF) {
> +@@ -671,8 +764,7 @@ static void make_device(char *device_nam
> + //TODO: on devtmpfs, device_name already exists and symlink() fails.
> + //End result is that instead of symlink, we have two nodes.
> + //What should be done?
> +-					if (G.verbose)
> +-						bb_error_msg("symlink: %s", device_name);
> ++					dbg1("symlink: %s", device_name);
> + 					symlink(node_name, device_name);
> + 				}
> + 			}
> +@@ -681,27 +773,21 @@ static void make_device(char *device_nam
> + 		if (ENABLE_FEATURE_MDEV_EXEC && command) {
> + 			/* setenv will leak memory, use putenv/unsetenv/free */
> + 			char *s = xasprintf("%s=%s", "MDEV", node_name);
> +-			char *s1 = xasprintf("%s=%s", "SUBSYSTEM", G.subsystem);
> + 			putenv(s);
> +-			putenv(s1);
> +-			if (G.verbose)
> +-				bb_error_msg("running: %s", command);
> ++			dbg1("running: %s", command);
> + 			if (system(command) == -1)
> + 				bb_perror_msg("can't run '%s'", command);
> +-			bb_unsetenv_and_free(s1);
> + 			bb_unsetenv_and_free(s);
> + 		}
> +
> + 		if (operation == OP_remove && major >= -1) {
> + 			if (ENABLE_FEATURE_MDEV_RENAME && alias) {
> + 				if (aliaslink == '>') {
> +-					if (G.verbose)
> +-						bb_error_msg("unlink: %s", device_name);
> ++					dbg1("unlink: %s", device_name);
> + 					unlink(device_name);
> + 				}
> + 			}
> +-			if (G.verbose)
> +-				bb_error_msg("unlink: %s", node_name);
> ++			dbg1("unlink: %s", node_name);
> + 			unlink(node_name);
> + 		}
> +
> +@@ -746,9 +832,16 @@ static int FAST_FUNC dirAction(const cha
> + 	 * under /sys/class/ */
> + 	if (1 == depth) {
> + 		free(G.subsystem);
> ++		if (G.subsys_env) {
> ++			bb_unsetenv_and_free(G.subsys_env);
> ++			G.subsys_env = NULL;
> ++		}
> + 		G.subsystem = strrchr(fileName, '/');
> +-		if (G.subsystem)
> ++		if (G.subsystem) {
> + 			G.subsystem = xstrdup(G.subsystem + 1);
> ++			G.subsys_env = xasprintf("%s=%s", "SUBSYSTEM", G.subsystem);
> ++			putenv(G.subsys_env);
> ++		}
> + 	}
> +
> + 	return (depth >= MAX_SYSFS_DEPTH ? SKIP : TRUE);
> +@@ -813,12 +906,107 @@ static void load_firmware(const char *fi
> + 		full_write(loading_fd, "-1", 2);
> +
> +  out:
> ++	xchdir("/dev");
> + 	if (ENABLE_FEATURE_CLEAN_UP) {
> + 		close(firmware_fd);
> + 		close(loading_fd);
> + 	}
> + }
> +
> ++static char *curtime(void)
> ++{
> ++	struct timeval tv;
> ++	gettimeofday(&tv, NULL);
> ++	sprintf(G.timestr, "%u.%06u", (unsigned)tv.tv_sec % 60, (unsigned)tv.tv_usec);
> ++	return G.timestr;
> ++}
> ++
> ++static void open_mdev_log(const char *seq, unsigned my_pid)
> ++{
> ++	int logfd = open("mdev.log", O_WRONLY | O_APPEND);
> ++	if (logfd >= 0) {
> ++		xmove_fd(logfd, STDERR_FILENO);
> ++		G.verbose = 2;
> ++		applet_name = xasprintf("%s[%s]", applet_name, seq ? seq : utoa(my_pid));
> ++	}
> ++}
> ++
> ++/* If it exists, does /dev/mdev.seq match $SEQNUM?
> ++ * If it does not match, earlier mdev is running
> ++ * in parallel, and we need to wait.
> ++ * Active mdev pokes us with SIGCHLD to check the new file.
> ++ */
> ++static int
> ++wait_for_seqfile(const char *seq)
> ++{
> ++	/* We time out after 2 sec */
> ++	static const struct timespec ts = { 0, 32*1000*1000 };
> ++	int timeout = 2000 / 32;
> ++	int seq_fd = -1;
> ++	int do_once = 1;
> ++	sigset_t set_CHLD;
> ++
> ++	sigemptyset(&set_CHLD);
> ++	sigaddset(&set_CHLD, SIGCHLD);
> ++	sigprocmask(SIG_BLOCK, &set_CHLD, NULL);
> ++
> ++	for (;;) {
> ++		int seqlen;
> ++		char seqbuf[sizeof(int)*3 + 2];
> ++
> ++		if (seq_fd < 0) {
> ++			seq_fd = open("mdev.seq", O_RDWR);
> ++			if (seq_fd < 0)
> ++				break;
> ++		}
> ++		seqlen = pread(seq_fd, seqbuf, sizeof(seqbuf) - 1, 0);
> ++		if (seqlen < 0) {
> ++			close(seq_fd);
> ++			seq_fd = -1;
> ++			break;
> ++		}
> ++		seqbuf[seqlen] = '\0';
> ++		if (seqbuf[0] == '\n') {
> ++			/* seed file: write out seq ASAP */
> ++			xwrite_str(seq_fd, seq);
> ++			xlseek(seq_fd, 0, SEEK_SET);
> ++			dbg2("first seq written");
> ++			break;
> ++		}
> ++		if (strcmp(seq, seqbuf) == 0) {
> ++			/* correct idx */
> ++			break;
> ++		}
> ++		if (do_once) {
> ++			dbg2("%s waiting for '%s'", curtime(), seqbuf);
> ++			do_once = 0;
> ++		}
> ++		if (sigtimedwait(&set_CHLD, NULL, &ts) >= 0) {
> ++			dbg3("woken up");
> ++			continue; /* don't decrement timeout! */
> ++		}
> ++		if (--timeout == 0) {
> ++			dbg1("%s waiting for '%s'", "timed out", seqbuf);
> ++			break;
> ++		}
> ++	}
> ++	sigprocmask(SIG_UNBLOCK, &set_CHLD, NULL);
> ++	return seq_fd;
> ++}
> ++
> ++static void signal_mdevs(unsigned my_pid)
> ++{
> ++	procps_status_t* p = NULL;
> ++	while ((p = procps_scan(p, PSSCAN_ARGV0)) != NULL) {
> ++		if (p->pid != my_pid
> ++		 && p->argv0
> ++		 && strcmp(bb_basename(p->argv0), "mdev") == 0
> ++		) {
> ++			kill(p->pid, SIGCHLD);
> ++		}
> ++	}
> ++}
> ++
> + int mdev_main(int argc, char **argv) MAIN_EXTERNALLY_VISIBLE;
> + int mdev_main(int argc UNUSED_PARAM, char **argv)
> + {
> +@@ -840,8 +1028,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
> + 	xchdir("/dev");
> +
> + 	if (argv[1] && strcmp(argv[1], "-s") == 0) {
> +-		/* Scan:
> +-		 * mdev -s
> ++		/*
> ++		 * Scan: mdev -s
> + 		 */
> + 		struct stat st;
> +
> +@@ -853,6 +1041,8 @@ int mdev_main(int argc UNUSED_PARAM, cha
> + 		G.root_major = major(st.st_dev);
> + 		G.root_minor = minor(st.st_dev);
> +
> ++		putenv((char*)"ACTION=add");
> ++
> + 		/* ACTION_FOLLOWLINKS is needed since in newer kernels
> + 		 * /sys/block/loop* (for example) are symlinks to dirs,
> + 		 * not real directories.
> +@@ -878,11 +1068,13 @@ int mdev_main(int argc UNUSED_PARAM, cha
> + 		char *action;
> + 		char *env_devname;
> + 		char *env_devpath;
> ++		unsigned my_pid;
> ++		int seq_fd;
> + 		smalluint op;
> +
> + 		/* Hotplug:
> + 		 * env ACTION=... DEVPATH=... SUBSYSTEM=... [SEQNUM=...] mdev
> +-		 * ACTION can be "add" or "remove"
> ++		 * ACTION can be "add", "remove", "change"
> + 		 * DEVPATH is like "/block/sda" or "/class/input/mice"
> + 		 */
> + 		action = getenv("ACTION");
> +@@ -893,39 +1085,20 @@ int mdev_main(int argc UNUSED_PARAM, cha
> + 		if (!action || !env_devpath /*|| !G.subsystem*/)
> + 			bb_show_usage();
> + 		fw = getenv("FIRMWARE");
> +-		/* If it exists, does /dev/mdev.seq match $SEQNUM?
> +-		 * If it does not match, earlier mdev is running
> +-		 * in parallel, and we need to wait */
> + 		seq = getenv("SEQNUM");
> +-		if (seq) {
> +-			int timeout = 2000 / 32; /* 2000 msec */
> +-			do {
> +-				int seqlen;
> +-				char seqbuf[sizeof(int)*3 + 2];
> +-
> +-				seqlen = open_read_close("mdev.seq", seqbuf, sizeof(seqbuf) - 1);
> +-				if (seqlen < 0) {
> +-					seq = NULL;
> +-					break;
> +-				}
> +-				seqbuf[seqlen] = '\0';
> +-				if (seqbuf[0] == '\n' /* seed file? */
> +-				 || strcmp(seq, seqbuf) == 0 /* correct idx? */
> +-				) {
> +-					break;
> +-				}
> +-				usleep(32*1000);
> +-			} while (--timeout);
> +-		}
> +
> +-		{
> +-			int logfd = open("/dev/mdev.log", O_WRONLY | O_APPEND);
> +-			if (logfd >= 0) {
> +-				xmove_fd(logfd, STDERR_FILENO);
> +-				G.verbose = 1;
> +-				bb_error_msg("seq: %s action: %s", seq, action);
> +-			}
> +-		}
> ++		my_pid = getpid();
> ++		open_mdev_log(seq, my_pid);
> ++
> ++		seq_fd = seq ? wait_for_seqfile(seq) : -1;
> ++
> ++		dbg1("%s "
> ++			"ACTION:%s SUBSYSTEM:%s DEVNAME:%s DEVPATH:%s"
> ++			"%s%s",
> ++			curtime(),
> ++			action, G.subsystem, env_devname, env_devpath,
> ++			fw ? " FW:" : "", fw ? fw : ""
> ++		);
> +
> + 		snprintf(temp, PATH_MAX, "/sys%s", env_devpath);
> + 		if (op == OP_remove) {
> +@@ -935,16 +1108,18 @@ int mdev_main(int argc UNUSED_PARAM, cha
> + 			if (!fw)
> + 				make_device(env_devname, temp, op);
> + 		}
> +-		else if (op == OP_add) {
> ++		else {
> + 			make_device(env_devname, temp, op);
> + 			if (ENABLE_FEATURE_MDEV_LOAD_FIRMWARE) {
> +-				if (fw)
> ++				if (op == OP_add && fw)
> + 					load_firmware(fw, temp);
> + 			}
> + 		}
> +
> +-		if (seq) {
> +-			xopen_xwrite_close("mdev.seq", utoa(xatou(seq) + 1));
> ++		dbg1("%s exiting", curtime());
> ++		if (seq_fd >= 0) {
> ++			xwrite_str(seq_fd, utoa(xatou(seq) + 1));
> ++			signal_mdevs(my_pid);
> + 		}
> + 	}
> +
> diff --git a/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
> new file mode 100644
> index 0000000..f0a4230
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
> @@ -0,0 +1,28 @@
> +http://busybox.net/downloads/fixes-1.21.0/
> +
> +Upstream-Status: Pending
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> +--- busybox-1.21.0/archival/libarchive/decompress_unxz.c
> ++++ busybox-1.21.0-platform/archival/libarchive/decompress_unxz.c
> +@@ -30,8 +30,8 @@ static uint32_t xz_crc32(const uint8_t *
> + /* We use arch-optimized unaligned accessors */
> + #define get_unaligned_le32(buf) ({ uint32_t v; move_from_unaligned32(v, buf); SWAP_LE32(v); })
> + #define get_unaligned_be32(buf) ({ uint32_t v; move_from_unaligned32(v, buf); SWAP_BE32(v); })
> +-#define put_unaligned_le32(val, buf) move_to_unaligned16(buf, SWAP_LE32(val))
> +-#define put_unaligned_be32(val, buf) move_to_unaligned16(buf, SWAP_BE32(val))
> ++#define put_unaligned_le32(val, buf) move_to_unaligned32(buf, SWAP_LE32(val))
> ++#define put_unaligned_be32(val, buf) move_to_unaligned32(buf, SWAP_BE32(val))
> +
> + #include "unxz/xz_dec_bcj.c"
> + #include "unxz/xz_dec_lzma2.c"
> +--- busybox-1.21.0/include/platform.h
> ++++ busybox-1.21.0-platform/include/platform.h
> +@@ -228,7 +228,7 @@ typedef uint32_t bb__aliased_uint32_t FI
> + # define move_from_unaligned32(v, u32p) (memcpy(&(v), (u32p), 4))
> + # define move_to_unaligned16(u16p, v) do { \
> + 	uint16_t __t = (v); \
> +-	memcpy((u16p), &__t, 4); \
> ++	memcpy((u16p), &__t, 2); \
> + } while (0)
> + # define move_to_unaligned32(u32p, v) do { \
> + 	uint32_t __t = (v); \
> diff --git a/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
> new file mode 100644
> index 0000000..b8cda06
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
> @@ -0,0 +1,88 @@
> +http://busybox.net/downloads/fixes-1.21.0/
> +
> +Upstream-Status: Pending
> +Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> +--- busybox-1.21.0/archival/libarchive/decompress_unxz.c
> ++++ busybox-1.21.0-xz/archival/libarchive/decompress_unxz.c
> +@@ -40,6 +40,7 @@ static uint32_t xz_crc32(const uint8_t *
> + IF_DESKTOP(long long) int FAST_FUNC
> + unpack_xz_stream(transformer_aux_data_t *aux, int src_fd, int dst_fd)
> + {
> ++	enum xz_ret xz_result;
> + 	struct xz_buf iobuf;
> + 	struct xz_dec *state;
> + 	unsigned char *membuf;
> +@@ -63,9 +64,8 @@ unpack_xz_stream(transformer_aux_data_t
> + 	/* Limit memory usage to about 64 MiB. */
> + 	state = xz_dec_init(XZ_DYNALLOC, 64*1024*1024);
> +
> ++	xz_result = X_OK;
> + 	while (1) {
> +-		enum xz_ret r;
> +-
> + 		if (iobuf.in_pos == iobuf.in_size) {
> + 			int rd = safe_read(src_fd, membuf, BUFSIZ);
> + 			if (rd < 0) {
> +@@ -73,28 +73,57 @@ unpack_xz_stream(transformer_aux_data_t
> + 				total = -1;
> + 				break;
> + 			}
> ++			if (rd == 0 && xz_result == XZ_STREAM_END)
> ++				break;
> + 			iobuf.in_size = rd;
> + 			iobuf.in_pos = 0;
> + 		}
> ++		if (xz_result == XZ_STREAM_END) {
> ++			/*
> ++			 * Try to start decoding next concatenated stream.
> ++			 * Stream padding must always be a multiple of four
> ++			 * bytes to preserve four-byte alignment. To keep the
> ++			 * code slightly smaller, we aren't as strict here as
> ++			 * the .xz spec requires. We just skip all zero-bytes
> ++			 * without checking the alignment and thus can accept
> ++			 * files that aren't valid, e.g. the XZ utils test
> ++			 * files bad-0pad-empty.xz and bad-0catpad-empty.xz.
> ++			 */
> ++			do {
> ++				if (membuf[iobuf.in_pos] != 0) {
> ++					xz_dec_reset(state);
> ++					goto do_run;
> ++				}
> ++				iobuf.in_pos++;
> ++			} while (iobuf.in_pos < iobuf.in_size);
> ++		}
> ++ do_run:
> + //		bb_error_msg(">in pos:%d size:%d out pos:%d size:%d",
> + //				iobuf.in_pos, iobuf.in_size, iobuf.out_pos, iobuf.out_size);
> +-		r = xz_dec_run(state, &iobuf);
> ++		xz_result = xz_dec_run(state, &iobuf);
> + //		bb_error_msg("<in pos:%d size:%d out pos:%d size:%d r:%d",
> +-//				iobuf.in_pos, iobuf.in_size, iobuf.out_pos, iobuf.out_size, r);
> ++//				iobuf.in_pos, iobuf.in_size, iobuf.out_pos, iobuf.out_size, xz_result);
> + 		if (iobuf.out_pos) {
> + 			xwrite(dst_fd, iobuf.out, iobuf.out_pos);
> + 			IF_DESKTOP(total += iobuf.out_pos;)
> + 			iobuf.out_pos = 0;
> + 		}
> +-		if (r == XZ_STREAM_END) {
> +-			break;
> ++		if (xz_result == XZ_STREAM_END) {
> ++			/*
> ++			 * Can just "break;" here, if not for concatenated
> ++			 * .xz streams.
> ++			 * Checking for padding may require buffer
> ++			 * replenishment. Can't do it here.
> ++			 */
> ++			continue;
> + 		}
> +-		if (r != XZ_OK && r != XZ_UNSUPPORTED_CHECK) {
> ++		if (xz_result != XZ_OK && xz_result != XZ_UNSUPPORTED_CHECK) {
> + 			bb_error_msg("corrupted data");
> + 			total = -1;
> + 			break;
> + 		}
> + 	}
> ++
> + 	xz_dec_end(state);
> + 	free(membuf);
> +
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-appletlib-dependency.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-appletlib-dependency.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-appletlib-dependency.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-list-suid-and-non-suid-app-configs.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-list-suid-and-non-suid-app-configs.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-list-suid-and-non-suid-app-configs.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-sulogin-empty-root-password.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-sulogin-empty-root-password.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-sulogin-empty-root-password.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox-1.21.0/busybox-udhcpc-no_deconfig.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/busybox-udhcpc-no_deconfig.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/busybox-udhcpc-no_deconfig.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.21.0/defconfig
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/defconfig
> rename to meta/recipes-core/busybox/busybox-1.21.0/defconfig
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch b/meta/recipes-core/busybox/busybox-1.21.0/fail_on_no_media.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/fail_on_no_media.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/fail_on_no_media.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch b/meta/recipes-core/busybox/busybox-1.21.0/get_header_tar.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/get_header_tar.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/get_header_tar.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg b/meta/recipes-core/busybox/busybox-1.21.0/login-utilities.cfg
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/login-utilities.cfg
> rename to meta/recipes-core/busybox/busybox-1.21.0/login-utilities.cfg
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
> similarity index 90%
> rename from meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
> index 1fe20d4..65f6c96 100644
> --- a/meta/recipes-core/busybox/busybox-1.20.2/run-parts.in.usr-bin.patch
> +++ b/meta/recipes-core/busybox/busybox-1.21.0/run-parts.in.usr-bin.patch
> @@ -18,12 +18,12 @@ Upstream-Status: Inappropriate [configuration]
>   diff -uNr busybox-1.15.3.orig//include/applets.src.h busybox-1.15.3/include/applets.src.h
>   --- busybox-1.15.3.orig//include/applets.src.h	2009-12-12 22:13:28.000000000 +0100
>   +++ busybox-1.15.3/include/applets.src.h	2010-04-30 15:35:40.000000000 +0200
> -@@ -323,7 +323,7 @@
> +@@ -304,7 +304,7 @@
>    IF_RPM(APPLET(rpm, BB_DIR_BIN, BB_SUID_DROP))
>    IF_RPM2CPIO(APPLET(rpm2cpio, BB_DIR_USR_BIN, BB_SUID_DROP))
> - IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_RTCWAKE(APPLET(rtcwake, BB_DIR_USR_SBIN, BB_SUID_DROP))
>   -IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_BIN, BB_SUID_DROP, run_parts))
>   +IF_RUN_PARTS(APPLET_ODDNAME(run-parts, run_parts, BB_DIR_USR_BIN, BB_SUID_DROP, run_parts))
>    IF_RUNCON(APPLET(runcon, BB_DIR_USR_BIN, BB_SUID_DROP))
>    IF_RUNLEVEL(APPLET(runlevel, BB_DIR_SBIN, BB_SUID_DROP))
> - IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, _BB_SUID_DROP))
> + IF_RUNSV(APPLET(runsv, BB_DIR_USR_BIN, BB_SUID_DROP))
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/stat-usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/stat-usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch b/meta/recipes-core/busybox/busybox-1.21.0/strict-atime.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/strict-atime.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/strict-atime.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch b/meta/recipes-core/busybox/busybox-1.21.0/testsuite-du-du-k-works-fix-false-positive.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/testsuite-du-du-k-works-fix-false-positive.patch
> diff --git a/meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.21.0/watch.in.usr-bin.patch
> similarity index 100%
> rename from meta/recipes-core/busybox/busybox-1.20.2/watch.in.usr-bin.patch
> rename to meta/recipes-core/busybox/busybox-1.21.0/watch.in.usr-bin.patch
> diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.21.0.bb
> similarity index 73%
> rename from meta/recipes-core/busybox/busybox_1.20.2.bb
> rename to meta/recipes-core/busybox/busybox_1.21.0.bb
> index c854f0b..688b456 100644
> --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.21.0.bb
> @@ -1,15 +1,12 @@
>   require busybox.inc
> -PR = "r7"
> +PR = "r0"
>
>   SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
> -           file://B921600.patch \
>              file://get_header_tar.patch \
>              file://busybox-appletlib-dependency.patch \
>              file://run-parts.in.usr-bin.patch \
>              file://watch.in.usr-bin.patch \
>              file://busybox-udhcpc-no_deconfig.patch \
> -           file://sys_resource.patch \
> -           file://wget_dl_dir_fix.patch \
>              file://find-touchscreen.sh \
>              file://busybox-cron \
>              file://busybox-httpd \
> @@ -24,13 +21,11 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://mdev.conf \
>              file://umount.busybox \
>              file://defconfig \
> -           file://busybox-mkfs-minix-tests_bigendian.patch \
> -           file://fix-for-spurious-testsuite-failure.patch \
> -           file://busybox-1.20.2-kernel_ver.patch \
>              file://stat-usr-bin.patch \
> -           file://busybox-syslog.service.in \
> -           file://busybox-klogd.service.in \
>              file://testsuite-du-du-k-works-fix-false-positive.patch \
> +           file://busybox-1.21.0-mdev.patch \
> +           file://busybox-1.21.0-platform.patch \
> +           file://busybox-1.21.0-xz.patch \
>              file://strict-atime.patch \
>              file://fail_on_no_media.patch \
>              file://busybox-sulogin-empty-root-password.patch \
> @@ -38,10 +33,11 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://inetd.conf \
>              file://inetd \
>              file://login-utilities.cfg \
> -           file://busybox-list-suid-and-non-suid-app-configs.patch"
> +           file://busybox-list-suid-and-non-suid-app-configs.patch \
> +"
>
> -SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
> -SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
> +SRC_URI[tarball.md5sum] = "d613f2e4b580305c1de8691f7b84285e"
> +SRC_URI[tarball.sha256sum] = "eb9d268627783297f5f459cb9bd61a94e395dc7cb3647e10ec186e0159aa36ed"
>
>   EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
>
>

