Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TiCOZ-0002V3-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 00:04:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Dec 2012 14:49:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,254,1355126400"; d="scan'208";a="262101709"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.85])
	by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2012 14:49:31 -0800
Message-ID: <50C666FB.90001@linux.intel.com>
Date: Mon, 10 Dec 2012 14:49:31 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei.gherzan@windriver.com>
References: <1354793849-9595-1-git-send-email-andrei.gherzan@windriver.com>
In-Reply-To: <1354793849-9595-1-git-send-email-andrei.gherzan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Rebase remove-lscpu.patch for the current version
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
X-List-Received-Date: Mon, 10 Dec 2012 23:04:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Andrei,

I think our patches crossed on the list, already applied a similar patch.

Sau!

On 12/06/2012 03:37 AM, Andrei Gherzan wrote:
> Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
> ---
>   .../util-linux/util-linux/remove-lscpu.patch       |   30 +++++++++----------
>   meta/recipes-core/util-linux/util-linux_2.22.1.bb  |    2 +-
>   2 files changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
> index a15c1e3..4d0b311 100644
> --- a/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
> +++ b/meta/recipes-core/util-linux/util-linux/remove-lscpu.patch
> @@ -3,12 +3,13 @@ Upstream-Status: Inappropriate [distribution]
>   Take out lscpu stuff from the code
>
>   Signed-off-by: Saul Wold <sgw@linux.intel.com>
> +Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> -Index: util-linux-2.21/configure.ac
> +Index: util-linux-2.22.1/configure.ac
>   ===================================================================
> ---- util-linux-2.21.orig/configure.ac
> -+++ util-linux-2.21/configure.ac
> -@@ -871,7 +871,7 @@ UL_REQUIRES_BUILD([lsblk], [libblkid])
> +--- util-linux-2.22.1.orig/configure.ac	2012-12-06 13:22:58.209874400 +0200
> ++++ util-linux-2.22.1/configure.ac	2012-12-06 13:23:18.721873663 +0200
> +@@ -934,7 +934,7 @@
>    AM_CONDITIONAL(BUILD_LSBLK, test "x$build_lsblk" = xyes)
>
>
> @@ -17,24 +18,21 @@ Index: util-linux-2.21/configure.ac
>    UL_REQUIRES_LINUX([lscpu])
>    UL_REQUIRES_HAVE([lscpu], [cpu_set_t], [cpu_set_t type])
>    AM_CONDITIONAL(BUILD_LSCPU, test "x$build_lscpu" = xyes)
> -Index: util-linux-2.21/sys-utils/Makefile.am
> +Index: util-linux-2.22.1/sys-utils/Makemodule.am
>   ===================================================================
> ---- util-linux-2.21.orig/sys-utils/Makefile.am
> -+++ util-linux-2.21/sys-utils/Makefile.am
> -@@ -108,16 +108,6 @@ swapon_CFLAGS = $(AM_CFLAGS) -I$(ul_libb
> - swapon_LDADD = $(ul_libblkid_la)
> +--- util-linux-2.22.1.orig/sys-utils/Makemodule.am	2012-12-06 13:23:07.585874063 +0200
> ++++ util-linux-2.22.1/sys-utils/Makemodule.am	2012-12-06 13:23:34.217873111 +0200
> +@@ -224,13 +224,6 @@
> + swapoff_LDADD = $(LDADD) libmount.la
>    endif
>
>   -if BUILD_LSCPU
>   -usrbin_exec_PROGRAMS += lscpu
> --lscpu_SOURCES = lscpu.c $(top_srcdir)/lib/cpuset.c \
> --			$(top_srcdir)/lib/strutils.c \
> --			$(top_srcdir)/lib/mbsalign.c \
> --			$(top_srcdir)/lib/tt.c \
> --			$(top_srcdir)/lib/path.c
> --dist_man_MANS += lscpu.1
> +-lscpu_SOURCES = sys-utils/lscpu.c
> +-lscpu_LDADD = $(LDADD) libcommon.la
> +-dist_man_MANS += sys-utils/lscpu.1
>   -endif
>   -
>    if BUILD_CHCPU
>    sbin_PROGRAMS += chcpu
> - chcpu_SOURCES = chcpu.c $(top_srcdir)/lib/cpuset.c \
> + chcpu_SOURCES = sys-utils/chcpu.c
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.1.bb b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
> index 0177bba..f5d777f 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.1.bb
> @@ -1,5 +1,5 @@
>   MAJOR_VERSION = "2.22"
> -PR = "r1"
> +PR = "r2"
>   require util-linux.inc
>
>   # note that `lscpu' is under GPLv3+
>


