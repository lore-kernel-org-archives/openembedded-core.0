Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SP0UB-0001U2-2P
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 01:58:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2012 16:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="160174883"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2012 16:48:47 -0700
Message-ID: <4F9F24DF.1090803@linux.intel.com>
Date: Mon, 30 Apr 2012 16:48:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
	<aaa5eab3838d2b85d4e1316afdd91d354527ae20.1335734193.git.Martin.Jansa@gmail.com>
	<4F9EBCFB.3030103@linux.intel.com>
	<20120430185947.GG3664@jama.jama.net>
	<CAMKF1spuvow-U+zuBkL3j0y0hMM75iN-Ch8YxEH+Z9+JgDcv4Q@mail.gmail.com>
In-Reply-To: <CAMKF1spuvow-U+zuBkL3j0y0hMM75iN-Ch8YxEH+Z9+JgDcv4Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: upgrade to 2.32.1
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
X-List-Received-Date: Mon, 30 Apr 2012 23:58:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2012 12:29 PM, Khem Raj wrote:
>
>
> On Monday, April 30, 2012, Martin Jansa <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>  > On Mon, Apr 30, 2012 at 09:25:31AM -0700, Saul Wold wrote:
>  >> On 04/29/2012 02:27 PM, Martin Jansa wrote:
>  >> > * g_once_init_enter.patch shouldn't be needed after upstream commit
>  >> >    794c1a30bc27b4c8d77537813acb1213d5ac80f2
>  >> >
>  >> > * LIC_FILES_CHKSUM change is only because PCRE was upgraded and now
>  >> >    pcre.h says "Copyright (c) 1997-2012 University of Cambridge"
> instead
>  >> >    of 2010 and COPYING file
>  >> > "Please see the file LICENCE in the PCRE distribution for licensing
>  >> >    details."  but LICENSE file is not part of glib distribution
> (but still
>  >> >    BSD in standalone PCRE)
>  >> >
>  >> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>>
>  >> > ---
>  >> >   .../glib-2.0/glib-2.0/configure-libtool.patch      |   54
> ++++++++++++++------
>  >> >   .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
>  >> >   .../{glib-2.0_2.30.3.bb <http://glib-2.0_2.30.3.bb> =>
> glib-2.0_2.32.1.bb <http://glib-2.0_2.32.1.bb>}     |    6 +--
>  >> >   meta/recipes-core/glib-2.0/glib.inc                |    2 +-
>  >> >   4 files changed, 41 insertions(+), 45 deletions(-)
>  >> >   delete mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
>  >> >   rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb
> <http://glib-2.0_2.30.3.bb> => glib-2.0_2.32.1.bb
> <http://glib-2.0_2.32.1.bb>} (91%)
>  >> >
>  >> Martin:
>  >>
>  >> Did you see any issue similar to what was reported in
>  >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2369?
>  >>
>  >> There is a new alignment check at configure time requiring updating the
>  >> site file?
>  >
>  > not while building, but in runtime I've seen some
>  > Floating point exceptions where I'm not sure if they are caused by new
>  > gcc or glib or something completely different if that's what reporter
> meant by
>  > "div0 crashes in glib"
>  >
>
> That patch is good it should be applied along with this upgrade
> And its got formatted so no need for it to resend to ml

I will pull it in shortly, but turns out there are other issues with 
this glib-2.0 update, this update deprecated g_atexit() which is used by 
evolution_data_server.

Sau!

>  > so probably worth trying
>  >
>  >>
>  >> Sau!
>  >>
>  >> > diff --git
> a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>  >> > index c21e378..1d69a3f 100644
>  >> > --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>  >> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
>  >> > @@ -1,15 +1,31 @@
>  >> > -# Poky renames libtool to $host_alias-libtool.
>  >> > -# ./$host_alias-libtool isn't created until after configure runs
> with libtool>= 2.2.2
>  >> > -# so we can't call # it at this point. We can safely assume a
> version is available
>  >> > -# from PATH though
>  >> > -# Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com
> <mailto:dongxiao.xu@intel.com>>
>  >> > +From 1c5718648d49e795efee91c220a2bf9386c184f2 Mon Sep 17 00:00:00
> 2001
>  >> > +From: Martin Jansa<Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>>
>  >> > +Date: Sat, 28 Apr 2012 18:24:50 +0200
>  >> > +Subject: [PATCH] configure: use $host_alias-libtool instead of
> libtool
>  >> > + directly
>  >> > +
>  >> > +Poky renames libtool to $host_alias-libtool.
>  >> > +./$host_alias-libtool isn't created until after configure runs with
>  >> > +libtool>= 2.2.2
>  >> > +so we can't call # it at this point. We can safely assume a
> version is
>  >> > +available
>  >> > +from PATH though
>  >> > +
>  >> > +Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com
> <mailto:dongxiao.xu@intel.com>>
>  >> > +Rebased to glib-2.32.1 by Martin Jansa<Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>>
>  >> >
>  >> >   Upstream-Status: Inappropriate [configuration]
>  >> >
>  >> > -diff -ruN glib-2.27.3-orig/configure.ac <http://configure.ac>
> glib-2.27.3/configure.ac <http://configure.ac>
>  >> > ---- glib-2.27.3-orig/configure.ac <http://configure.ac>
>   2010-11-03 11:02:05.000000000 +0800
>  >> > -+++ glib-2.27.3/configure.ac <http://configure.ac>
> 2010-11-16 12:38:12.610485990 +0800
>  >> > -@@ -1385,7 +1385,7 @@
>  >> > +Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>>
>  >> > +---
>  >> > + configure.ac <http://configure.ac> |    8 ++++----
>  >> > + 1 files changed, 4 insertions(+), 4 deletions(-)
>  >> > +
>  >> > +diff --git a/configure.ac <http://configure.ac> b/configure.ac
> <http://configure.ac>
>  >> > +index a6478c6..9a93d60 100644
>  >> > +--- a/configure.ac <http://configure.ac>
>  >> > ++++ b/configure.ac <http://configure.ac>
>  >> > +@@ -1470,7 +1470,7 @@ if test x"$glib_native_win32" = xyes; then
>  >> >      G_MODULE_LDFLAGS=
>  >> >    else
>  >> >      export SED
>  >> > @@ -18,16 +34,19 @@ diff -ruN glib-2.27.3-orig/configure.ac
> <http://configure.ac> glib-2.27.3/configure.ac <http://configure.ac>
>  >> >    fi
>  >> >    dnl G_MODULE_IMPL= don't reset, so cmd-line can override
>  >> >    G_MODULE_NEED_USCORE=0
>  >> > -@@ -1450,7 +1450,7 @@
>  >> > +@@ -1535,9 +1535,9 @@ if test "$G_MODULE_IMPL" =
> "G_MODULE_IMPL_DL"; then
>  >> >     LDFLAGS="$LDFLAGS $G_MODULE_LDFLAGS"
>  >> >    dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
>  >> >     echo "void glib_plugin_test(void) { }">  plugin.c
>  >> > --  ${SHELL} ./libtool --mode=compile ${CC} -shared \
>  >> > -+  ${SHELL} ./$host_alias-libtool --mode=compile ${CC} -shared \
>  >> > -           -export-dynamic -o plugin.o plugin.c 2>&1>/dev/null
>  >> > -   AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
>  >> > -           glib_cv_rtldglobal_broken,[
>  >> > -@@ -1524,7 +1524,7 @@
>  >> > +-  ${SHELL} ./libtool --mode=compile --tag=CC ${CC} ${CFLAGS} \
>  >> > ++  ${SHELL} ./$host_alias-libtool --mode=compile --tag=CC ${CC}
> ${CFLAGS} \
>  >> > +   --
>  > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>
>  >


