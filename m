Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RjEJX-0006GI-KT
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 19:14:52 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 06 Jan 2012 10:07:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="93165284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.226.49])
	by azsmga001.ch.intel.com with ESMTP; 06 Jan 2012 10:07:26 -0800
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx603.amr.corp.intel.com (10.22.226.49) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 6 Jan 2012 10:07:25 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.229]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.40]) with mapi id
	14.01.0355.002; Fri, 6 Jan 2012 10:07:25 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Saul Wold <sgw@linux.intel.com>, Patches and discussions about the oe-core
	layer <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
Thread-Index: AQHMzCUG3QQ9CEymOE63C0FLBhqCf5X+x1nQgACqywCAADDtQA==
Date: Fri, 6 Jan 2012 18:07:25 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C014F82@ORSMSX106.amr.corp.intel.com>
References: <1325821207-2843-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
	<4F069E36.7000600@linux.intel.com>
In-Reply-To: <4F069E36.7000600@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.140]
MIME-Version: 1.0
Subject: Re: [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
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
X-List-Received-Date: Fri, 06 Jan 2012 18:14:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, January 05, 2012 11:10 PM
> To: Patches and discussions about the oe-core layer
> Cc: Kamble, Nitin A
> Subject: Re: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 -> 2.15
>=20
> On 01/05/2012 08:59 PM, Kamble, Nitin A wrote:
> > Can this be done without removing eglibc 2.14 recipe files ?
> >
> > X32 layer is depending on the eglibc-2.14 recipe.
> >
> Can this 2.15 recipe be updated for x32?


That is a big change for x32, It may work out or not, last time x32 + eglib=
c-2.15 was causing some issues which were I think actually more eglibc-2.15=
 issues. The worst case is I can move the eglibc-2.14 recipe into the meta-=
x32 layer.

Thanks,
Nitin



>=20
> Sau!
> > Thanks,
> > Nitin
> >
> >
> >> -----Original Message-----
> >> From: openembedded-core-bounces@lists.openembedded.org
> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> Khem Raj
> >> Sent: Thursday, January 05, 2012 7:40 PM
> >> To: openembedded-core@lists.openembedded.org
> >> Subject: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 ->  2.15
> >>
> >> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> >> ---
> >>   ...tive_2.14.bb =3D>  cross-localedef-native_2.15.bb} |    0
> >>   .../IO-acquire-lock-fix.patch                      |    0
> >>   .../armv4-eabi-compile-fix.patch                   |    0
> >>   .../eglibc-rpc-export-again.patch                  |    0
> >>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
> >>   .../{eglibc-2.14 =3D>  eglibc-2.15}/etc/ld.so.conf    |    0
> >>   .../generate-supported.mk                          |    0
> >>   .../glibc-2.14-libdl-crash.patch                   |    0
> >>   .../ld-search-order.patch                          |    0
> >>   .../mips-rld-map-check.patch                       |    0
> >>   .../multilib_readlib.patch                         |    0
> >>   .../{eglibc-2.14 =3D>  eglibc-2.15}/ppc-sqrt.patch    |    0
> >>   .../stack-protector-test.patch                     |    0
> >>   .../use-sysroot-cxx-headers.patch                  |   30
> >> ++++++++++++--------
> >>   .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29
> >> +++++++++++++++++++
> >>   ...libc-initial_2.14.bb =3D>  eglibc-initial_2.15.bb} |    0
> >>   ...eglibc-locale_2.14.bb =3D>  eglibc-locale_2.15.bb} |    0
> >>   .../eglibc/{eglibc_2.14.bb =3D>  eglibc_2.15.bb}      |   15
> ++++++++--
> >>   18 files changed, 59 insertions(+), 15 deletions(-)
> >>   rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb =3D>
> >> cross-localedef-native_2.15.bb} (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-2.15}/IO-
> >> acquire-lock-fix.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/armv4-
> >> eabi-compile-fix.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/eglibc-
> >> rpc-export-again.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/eglibc-
> >> svn-arm-lowlevellock-include-tls.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> >> 2.15}/etc/ld.so.conf (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/generate-
> >> supported.mk (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/glibc-
> >> 2.14-libdl-crash.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-2.15}/ld-
> >> search-order.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/mips-rld-
> >> map-check.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> >> 2.15}/multilib_readlib.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-2.15}/ppc-
> >> sqrt.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-
> 2.15}/stack-
> >> protector-test.patch (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-2.14 =3D>  eglibc-2.15}/use-
> >> sysroot-cxx-headers.patch (51%)
> >>   create mode 100644 meta/recipes-core/eglibc/eglibc-
> 2.15/x86_fenv.patch
> >>   rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb =3D>
> eglibc-
> >> initial_2.15.bb} (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb =3D>  eglibc-
> >> locale_2.15.bb} (100%)
> >>   rename meta/recipes-core/eglibc/{eglibc_2.14.bb =3D>
> eglibc_2.15.bb}
> >> (95%)
> >>
> >> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
> >> b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
> >> rename to meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-
> >> fix.patch b/meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-
> >> fix.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-
> >> fix.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-
> >> fix.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-
> compile-
> >> fix.patch b/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-
> >> fix.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-
> >> fix.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-
> >> fix.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-
> >> again.patch b/meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-
> export-
> >> again.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-
> >> again.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-export-
> >> again.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-
> >> lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-
> >> 2.15/eglibc-svn-arm-lowlevellock-include-tls.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-
> >> lowlevellock-include-tls.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-arm-
> >> lowlevellock-include-tls.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
> >> b/meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/generate-
> supported.mk
> >> b/meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/generate-
> supported.mk
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-
> >> crash.patch b/meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-
> >> crash.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-
> >> crash.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-
> >> crash.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ld-search-
> order.patch
> >> b/meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/ld-search-
> order.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-
> >> check.patch b/meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-
> >> check.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-
> >> check.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-
> check.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-
> >> 2.14/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-
> >> 2.15/multilib_readlib.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-
> 2.14/multilib_readlib.patch
> >> rename to meta/recipes-core/eglibc/eglibc-
> 2.15/multilib_readlib.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
> >> b/meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/stack-protector-
> >> test.patch b/meta/recipes-core/eglibc/eglibc-2.15/stack-protector-
> >> test.patch
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/stack-protector-
> >> test.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/stack-protector-
> >> test.patch
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
> >> headers.patch b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-
> cxx-
> >> headers.patch
> >> similarity index 51%
> >> rename from meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
> >> headers.patch
> >> rename to meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-
> >> headers.patch
> >> index c06eebf..7f82253 100644
> >> --- a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
> >> headers.patch
> >> +++ b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-
> >> headers.patch
> >> @@ -10,27 +10,33 @@ Upstream-Status: Inappropriate [OE-specific]
> >>
> >>   --- a/configure.in
> >>   +++ b/configure.in
> >> -@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
> >> -   SYSINCLUDES=3D"$SYSINCLUDES \
> >> +@@ -1094,11 +1094,10 @@ if test -n "$sysheaders"; then
> >>    -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
> >>      if test -n "$CXX"; then
> >> +     CXX_SYSINCLUDES=3D
> >>   -    cxxversion=3D`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD`&&
> >>        cxxmachine=3D`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD`&&
> >> --    cxxheaders=3D`$CXX -print-file-
> >> name=3D../../../../include/c++/`"$cxxversion"&&
> >> -+    cxxheaders=3D`$CXX -print-sysroot`"$prefix/include/c++"&&
> >> -     CXX_SYSINCLUDES=3D"-isystem $cxxheaders \
> >> +     for d in include "$cxxmachine/include"; do
> >> +-      i=3D../../../../$d/c++/$cxxversion
> >> +-      cxxheaders=3D`$CXX -print-file-name=3D"$i"`&&
> >> ++      i=3D"$prefix/$d/c++"
> >> ++      cxxheaders=3D`$CXX -print-sysroot`"$i"&&
> >> +       test "x$cxxheaders" !=3D x&&  test "x$i" !=3D "x$cxxheaders"&&
> >> +       CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders \
> >>    -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
> >> -   fi
> >>   --- a/configure
> >>   +++ b/configure
> >> -@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
> >> -   SYSINCLUDES=3D"$SYSINCLUDES \
> >> +@@ -5618,11 +5618,10 @@ if test -n "$sysheaders"; then
> >>    -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
> >>      if test -n "$CXX"; then
> >> +     CXX_SYSINCLUDES=3D
> >>   -    cxxversion=3D`$CXX -dumpversion 2>&5`&&
> >>        cxxmachine=3D`$CXX -dumpmachine 2>&5`&&
> >> --    cxxheaders=3D`$CXX -print-file-
> >> name=3D../../../../include/c++/`"$cxxversion"&&
> >> -+    cxxheaders=3D`$CXX -print-sysroot`"$prefix/include/c++"&&
> >> -     CXX_SYSINCLUDES=3D"-isystem $cxxheaders \
> >> +     for d in include "$cxxmachine/include"; do
> >> +-      i=3D../../../../$d/c++/$cxxversion
> >> +-      cxxheaders=3D`$CXX -print-file-name=3D"$i"`&&
> >> ++      i=3D"$prefix/$d/c++"
> >> ++      cxxheaders=3D`$CXX -print-sysroot`"$i"&&
> >> +       test "x$cxxheaders" !=3D x&&  test "x$i" !=3D "x$cxxheaders"&&
> >> +       CXX_SYSINCLUDES=3D"$CXX_SYSINCLUDES -isystem $cxxheaders \
> >>    -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
> >> -   fi
> >> diff --git a/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
> >> b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
> >> new file mode 100644
> >> index 0000000..40c1c4d
> >> --- /dev/null
> >> +++ b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
> >> @@ -0,0 +1,29 @@
> >> +--- a/sysdeps/x86_64/fpu/bits/fenv.h
> >> ++++ b/sysdeps/x86_64/fpu/bits/fenv.h
> >> +@@ -112,16 +112,24 @@ __NTH (feraiseexcept (int __excepts))
> >> + 	{
> >> + 	  /* One example of a invalid operation is 0.0 / 0.0.  */
> >> + 	  float __f =3D 0.0;
> >> +-
> >> ++# if defined __SSE_MATH__ || __WORDSIZE =3D=3D 64
> >> + 	  __asm__ __volatile__ ("divss %0, %0 " : : "x" (__f));
> >> ++# else
> >> ++	 __asm__ __volatile__ ("fdiv %%st, %%st(0); fwait"
> >> ++			       : "=3Dt" (__f) : "0" (__f));
> >> ++# endif
> >> + 	  (void)&__f;
> >> + 	}
> >> +       if ((FE_DIVBYZERO&  __excepts) !=3D 0)
> >> + 	{
> >> + 	  float __f =3D 1.0;
> >> + 	  float __g =3D 0.0;
> >> +-
> >> ++# if defined __SSE_MATH__ || __WORDSIZE =3D=3D 64
> >> + 	  __asm__ __volatile__ ("divss %1, %0" : : "x" (__f), "x" (__g));
> >> ++# else
> >> ++	  __asm__ __volatile__ ("fdivp %%st(1), %%st; fwait"
> >> ++				: "=3Dt" (__f) : "0" (__f), "u" (__g) : "st(1)");
> >> ++# endif
> >> + 	  (void)&__f;
> >> + 	}
> >> +
> >> diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.14.bb
> >> b/meta/recipes-core/eglibc/eglibc-initial_2.15.bb
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-initial_2.14.bb
> >> rename to meta/recipes-core/eglibc/eglibc-initial_2.15.bb
> >> diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.14.bb
> >> b/meta/recipes-core/eglibc/eglibc-locale_2.15.bb
> >> similarity index 100%
> >> rename from meta/recipes-core/eglibc/eglibc-locale_2.14.bb
> >> rename to meta/recipes-core/eglibc/eglibc-locale_2.15.bb
> >> diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-
> >> core/eglibc/eglibc_2.15.bb
> >> similarity index 95%
> >> rename from meta/recipes-core/eglibc/eglibc_2.14.bb
> >> rename to meta/recipes-core/eglibc/eglibc_2.15.bb
> >> index ad2161e..9c6354a 100644
> >> --- a/meta/recipes-core/eglibc/eglibc_2.14.bb
> >> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
> >> @@ -1,12 +1,11 @@
> >>   require eglibc.inc
> >>
> >> -SRCREV =3D "15870"
> >> +SRCREV =3D "16540"
> >>
> >>   DEPENDS +=3D "gperf-native"
> >> -PR =3D "r3"
> >>   PR_append =3D "+svnr${SRCPV}"
> >>
> >> -EGLIBC_BRANCH=3D"eglibc-2_14"
> >> +EGLIBC_BRANCH=3D"eglibc-2_15"
> >>   SRC_URI =3D
> >>
> "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH};proto=3Dhtt=
p
> >> \
> >>              file://eglibc-svn-arm-lowlevellock-include-tls.patch \
> >>              file://IO-acquire-lock-fix.patch \
> >> @@ -20,6 +19,7 @@ SRC_URI =3D
> >>
> "svn://www.eglibc.org/svn/branches/;module=3D${EGLIBC_BRANCH};proto=3Dhtt=
p
> >>              file://eglibc-rpc-export-again.patch \
> >>              file://glibc-2.14-libdl-crash.patch \
> >>              file://use-sysroot-cxx-headers.patch \
> >> +           file://x86_fenv.patch \
> >>             "
> >>   LIC_FILES_CHKSUM =3D
> >> "file://LICENSES;md5=3D98a1128c4b58120182cbea3b1752d8b9 \
> >>         file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833 \
> >> @@ -88,6 +88,15 @@ do_patch_append() {
> >>   	bb.build.exec_func('do_fix_readlib_c', d)
> >>   }
> >>
> >> +# for mips eglibc now builds syscall tables for all abi's
> >> +# so we make sure that we choose right march option which is
> >> +# compatible with o32,n32 and n64 abi's
> >> +# e.g. -march=3Dmips32 is not compatible with n32 and n64 therefore
> >> +# we filter it out in such case -march=3Dfrom-abi which will be
> >> +# mips1 when using o32 and mips3 when using n32/n64
> >> +
> >> +TUNE_CCARGS_mips :=3D "${@oe_filter_out('-march=3Dmips32',
> >> '${TUNE_CCARGS}', d)}"
> >> +
> >>   # We need to ensure that all of the i386 and x86_64 headers are
> >> identical
> >>   # to support the multilib case.  We do this by copying headers
> from
> >> x86_64
> >>   # to i386 directories.  Normally when hand building eglibc or a
> >> combined
> >> --
> >> 1.7.5.4
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> core
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >


