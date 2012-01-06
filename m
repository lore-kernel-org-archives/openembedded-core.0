Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rj432-00017l-0n
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 08:17:08 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Jan 2012 23:09:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53831648"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jan 2012 23:09:42 -0800
Message-ID: <4F069E36.7000600@linux.intel.com>
Date: Thu, 05 Jan 2012 23:09:42 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325821207-2843-1-git-send-email-raj.khem@gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C014BC2@ORSMSX106.amr.corp.intel.com>
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
X-List-Received-Date: Fri, 06 Jan 2012 07:17:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2012 08:59 PM, Kamble, Nitin A wrote:
> Can this be done without removing eglibc 2.14 recipe files ?
>
> X32 layer is depending on the eglibc-2.14 recipe.
>
Can this 2.15 recipe be updated for x32?

Sau!
> Thanks,
> Nitin
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Thursday, January 05, 2012 7:40 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] eglibc: Upgrade recipes 2.14 ->  2.15
>>
>> Signed-off-by: Khem Raj<raj.khem@gmail.com>
>> ---
>>   ...tive_2.14.bb =>  cross-localedef-native_2.15.bb} |    0
>>   .../IO-acquire-lock-fix.patch                      |    0
>>   .../armv4-eabi-compile-fix.patch                   |    0
>>   .../eglibc-rpc-export-again.patch                  |    0
>>   .../eglibc-svn-arm-lowlevellock-include-tls.patch  |    0
>>   .../{eglibc-2.14 =>  eglibc-2.15}/etc/ld.so.conf    |    0
>>   .../generate-supported.mk                          |    0
>>   .../glibc-2.14-libdl-crash.patch                   |    0
>>   .../ld-search-order.patch                          |    0
>>   .../mips-rld-map-check.patch                       |    0
>>   .../multilib_readlib.patch                         |    0
>>   .../{eglibc-2.14 =>  eglibc-2.15}/ppc-sqrt.patch    |    0
>>   .../stack-protector-test.patch                     |    0
>>   .../use-sysroot-cxx-headers.patch                  |   30
>> ++++++++++++--------
>>   .../recipes-core/eglibc/eglibc-2.15/x86_fenv.patch |   29
>> +++++++++++++++++++
>>   ...libc-initial_2.14.bb =>  eglibc-initial_2.15.bb} |    0
>>   ...eglibc-locale_2.14.bb =>  eglibc-locale_2.15.bb} |    0
>>   .../eglibc/{eglibc_2.14.bb =>  eglibc_2.15.bb}      |   15 ++++++++--
>>   18 files changed, 59 insertions(+), 15 deletions(-)
>>   rename meta/recipes-core/eglibc/{cross-localedef-native_2.14.bb =>
>> cross-localedef-native_2.15.bb} (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/IO-
>> acquire-lock-fix.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/armv4-
>> eabi-compile-fix.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/eglibc-
>> rpc-export-again.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/eglibc-
>> svn-arm-lowlevellock-include-tls.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-
>> 2.15}/etc/ld.so.conf (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/generate-
>> supported.mk (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/glibc-
>> 2.14-libdl-crash.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/ld-
>> search-order.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/mips-rld-
>> map-check.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-
>> 2.15}/multilib_readlib.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/ppc-
>> sqrt.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/stack-
>> protector-test.patch (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-2.14 =>  eglibc-2.15}/use-
>> sysroot-cxx-headers.patch (51%)
>>   create mode 100644 meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>>   rename meta/recipes-core/eglibc/{eglibc-initial_2.14.bb =>  eglibc-
>> initial_2.15.bb} (100%)
>>   rename meta/recipes-core/eglibc/{eglibc-locale_2.14.bb =>  eglibc-
>> locale_2.15.bb} (100%)
>>   rename meta/recipes-core/eglibc/{eglibc_2.14.bb =>  eglibc_2.15.bb}
>> (95%)
>>
>> diff --git a/meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
>> b/meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/cross-localedef-native_2.14.bb
>> rename to meta/recipes-core/eglibc/cross-localedef-native_2.15.bb
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-
>> fix.patch b/meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-
>> fix.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/IO-acquire-lock-
>> fix.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/IO-acquire-lock-
>> fix.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-
>> fix.patch b/meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-
>> fix.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/armv4-eabi-compile-
>> fix.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/armv4-eabi-compile-
>> fix.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-
>> again.patch b/meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-export-
>> again.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-
>> again.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-rpc-export-
>> again.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-
>> lowlevellock-include-tls.patch b/meta/recipes-core/eglibc/eglibc-
>> 2.15/eglibc-svn-arm-lowlevellock-include-tls.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/eglibc-svn-arm-
>> lowlevellock-include-tls.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/eglibc-svn-arm-
>> lowlevellock-include-tls.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
>> b/meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/etc/ld.so.conf
>> rename to meta/recipes-core/eglibc/eglibc-2.15/etc/ld.so.conf
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
>> b/meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/generate-supported.mk
>> rename to meta/recipes-core/eglibc/eglibc-2.15/generate-supported.mk
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-
>> crash.patch b/meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-
>> crash.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/glibc-2.14-libdl-
>> crash.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/glibc-2.14-libdl-
>> crash.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
>> b/meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/ld-search-order.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/ld-search-order.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-
>> check.patch b/meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-
>> check.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/mips-rld-map-
>> check.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/mips-rld-map-check.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-
>> 2.14/multilib_readlib.patch b/meta/recipes-core/eglibc/eglibc-
>> 2.15/multilib_readlib.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/multilib_readlib.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/multilib_readlib.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
>> b/meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/ppc-sqrt.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/ppc-sqrt.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/stack-protector-
>> test.patch b/meta/recipes-core/eglibc/eglibc-2.15/stack-protector-
>> test.patch
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/stack-protector-
>> test.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/stack-protector-
>> test.patch
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
>> headers.patch b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-
>> headers.patch
>> similarity index 51%
>> rename from meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
>> headers.patch
>> rename to meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-
>> headers.patch
>> index c06eebf..7f82253 100644
>> --- a/meta/recipes-core/eglibc/eglibc-2.14/use-sysroot-cxx-
>> headers.patch
>> +++ b/meta/recipes-core/eglibc/eglibc-2.15/use-sysroot-cxx-
>> headers.patch
>> @@ -10,27 +10,33 @@ Upstream-Status: Inappropriate [OE-specific]
>>
>>   --- a/configure.in
>>   +++ b/configure.in
>> -@@ -1118,9 +1118,8 @@ if test -n "$sysheaders"; then
>> -   SYSINCLUDES="$SYSINCLUDES \
>> +@@ -1094,11 +1094,10 @@ if test -n "$sysheaders"; then
>>    -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
>>      if test -n "$CXX"; then
>> +     CXX_SYSINCLUDES=
>>   -    cxxversion=`$CXX -dumpversion 2>&AS_MESSAGE_LOG_FD`&&
>>        cxxmachine=`$CXX -dumpmachine 2>&AS_MESSAGE_LOG_FD`&&
>> --    cxxheaders=`$CXX -print-file-
>> name=../../../../include/c++/`"$cxxversion"&&
>> -+    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++"&&
>> -     CXX_SYSINCLUDES="-isystem $cxxheaders \
>> +     for d in include "$cxxmachine/include"; do
>> +-      i=../../../../$d/c++/$cxxversion
>> +-      cxxheaders=`$CXX -print-file-name="$i"`&&
>> ++      i="$prefix/$d/c++"
>> ++      cxxheaders=`$CXX -print-sysroot`"$i"&&
>> +       test "x$cxxheaders" != x&&  test "x$i" != "x$cxxheaders"&&
>> +       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
>>    -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
>> -   fi
>>   --- a/configure
>>   +++ b/configure
>> -@@ -5544,9 +5544,8 @@ if test -n "$sysheaders"; then
>> -   SYSINCLUDES="$SYSINCLUDES \
>> +@@ -5618,11 +5618,10 @@ if test -n "$sysheaders"; then
>>    -isystem `echo $sysheaders | sed 's/:/ -isystem /g'`"
>>      if test -n "$CXX"; then
>> +     CXX_SYSINCLUDES=
>>   -    cxxversion=`$CXX -dumpversion 2>&5`&&
>>        cxxmachine=`$CXX -dumpmachine 2>&5`&&
>> --    cxxheaders=`$CXX -print-file-
>> name=../../../../include/c++/`"$cxxversion"&&
>> -+    cxxheaders=`$CXX -print-sysroot`"$prefix/include/c++"&&
>> -     CXX_SYSINCLUDES="-isystem $cxxheaders \
>> +     for d in include "$cxxmachine/include"; do
>> +-      i=../../../../$d/c++/$cxxversion
>> +-      cxxheaders=`$CXX -print-file-name="$i"`&&
>> ++      i="$prefix/$d/c++"
>> ++      cxxheaders=`$CXX -print-sysroot`"$i"&&
>> +       test "x$cxxheaders" != x&&  test "x$i" != "x$cxxheaders"&&
>> +       CXX_SYSINCLUDES="$CXX_SYSINCLUDES -isystem $cxxheaders \
>>    -isystem $cxxheaders/$cxxmachine -isystem $cxxheaders/backward"
>> -   fi
>> diff --git a/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>> b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>> new file mode 100644
>> index 0000000..40c1c4d
>> --- /dev/null
>> +++ b/meta/recipes-core/eglibc/eglibc-2.15/x86_fenv.patch
>> @@ -0,0 +1,29 @@
>> +--- a/sysdeps/x86_64/fpu/bits/fenv.h
>> ++++ b/sysdeps/x86_64/fpu/bits/fenv.h
>> +@@ -112,16 +112,24 @@ __NTH (feraiseexcept (int __excepts))
>> + 	{
>> + 	  /* One example of a invalid operation is 0.0 / 0.0.  */
>> + 	  float __f = 0.0;
>> +-
>> ++# if defined __SSE_MATH__ || __WORDSIZE == 64
>> + 	  __asm__ __volatile__ ("divss %0, %0 " : : "x" (__f));
>> ++# else
>> ++	 __asm__ __volatile__ ("fdiv %%st, %%st(0); fwait"
>> ++			       : "=t" (__f) : "0" (__f));
>> ++# endif
>> + 	  (void)&__f;
>> + 	}
>> +       if ((FE_DIVBYZERO&  __excepts) != 0)
>> + 	{
>> + 	  float __f = 1.0;
>> + 	  float __g = 0.0;
>> +-
>> ++# if defined __SSE_MATH__ || __WORDSIZE == 64
>> + 	  __asm__ __volatile__ ("divss %1, %0" : : "x" (__f), "x" (__g));
>> ++# else
>> ++	  __asm__ __volatile__ ("fdivp %%st(1), %%st; fwait"
>> ++				: "=t" (__f) : "0" (__f), "u" (__g) : "st(1)");
>> ++# endif
>> + 	  (void)&__f;
>> + 	}
>> +
>> diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.14.bb
>> b/meta/recipes-core/eglibc/eglibc-initial_2.15.bb
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-initial_2.14.bb
>> rename to meta/recipes-core/eglibc/eglibc-initial_2.15.bb
>> diff --git a/meta/recipes-core/eglibc/eglibc-locale_2.14.bb
>> b/meta/recipes-core/eglibc/eglibc-locale_2.15.bb
>> similarity index 100%
>> rename from meta/recipes-core/eglibc/eglibc-locale_2.14.bb
>> rename to meta/recipes-core/eglibc/eglibc-locale_2.15.bb
>> diff --git a/meta/recipes-core/eglibc/eglibc_2.14.bb b/meta/recipes-
>> core/eglibc/eglibc_2.15.bb
>> similarity index 95%
>> rename from meta/recipes-core/eglibc/eglibc_2.14.bb
>> rename to meta/recipes-core/eglibc/eglibc_2.15.bb
>> index ad2161e..9c6354a 100644
>> --- a/meta/recipes-core/eglibc/eglibc_2.14.bb
>> +++ b/meta/recipes-core/eglibc/eglibc_2.15.bb
>> @@ -1,12 +1,11 @@
>>   require eglibc.inc
>>
>> -SRCREV = "15870"
>> +SRCREV = "16540"
>>
>>   DEPENDS += "gperf-native"
>> -PR = "r3"
>>   PR_append = "+svnr${SRCPV}"
>>
>> -EGLIBC_BRANCH="eglibc-2_14"
>> +EGLIBC_BRANCH="eglibc-2_15"
>>   SRC_URI =
>> "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>> \
>>              file://eglibc-svn-arm-lowlevellock-include-tls.patch \
>>              file://IO-acquire-lock-fix.patch \
>> @@ -20,6 +19,7 @@ SRC_URI =
>> "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
>>              file://eglibc-rpc-export-again.patch \
>>              file://glibc-2.14-libdl-crash.patch \
>>              file://use-sysroot-cxx-headers.patch \
>> +           file://x86_fenv.patch \
>>             "
>>   LIC_FILES_CHKSUM =
>> "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
>>         file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
>> @@ -88,6 +88,15 @@ do_patch_append() {
>>   	bb.build.exec_func('do_fix_readlib_c', d)
>>   }
>>
>> +# for mips eglibc now builds syscall tables for all abi's
>> +# so we make sure that we choose right march option which is
>> +# compatible with o32,n32 and n64 abi's
>> +# e.g. -march=mips32 is not compatible with n32 and n64 therefore
>> +# we filter it out in such case -march=from-abi which will be
>> +# mips1 when using o32 and mips3 when using n32/n64
>> +
>> +TUNE_CCARGS_mips := "${@oe_filter_out('-march=mips32',
>> '${TUNE_CCARGS}', d)}"
>> +
>>   # We need to ensure that all of the i386 and x86_64 headers are
>> identical
>>   # to support the multilib case.  We do this by copying headers from
>> x86_64
>>   # to i386 directories.  Normally when hand building eglibc or a
>> combined
>> --
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


