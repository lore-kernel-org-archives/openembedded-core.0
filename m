Received: from mail-wi0-f179.google.com ([209.85.212.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UaP84-0005XK-2U
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 13:35:22 +0200
Received: by mail-wi0-f179.google.com with SMTP id hn3so128969wib.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2013 04:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=QYpSR5Bsj/oFreJZ5xqxZ8h83pbsLZLMSPpH8nzMUWU=;
	b=XmBLAbCfyS5LhZwb40/6u4GhmPImbRk2S7ZwFVtjtgiFeTvbPU6n6qxZX2HykqmYa5
	kHlRRTfTPPE2o1uKZ7wUAlfyZr0XPr1eKHUGanfntG0TF1IBpnZy19pGLbCMFvTJ+ZTz
	ymlcbKfNTrMn4avU6nzjUZiawbabWRxGm34b6f6b9wQblKBxxE0amj1EUyIvxiDfIPrs
	H4IGjJQAtXZ8Fdsq7mXTbrGHn+DrkmsKRs0h5KCWnFnbqLD7ZMMA0hZCnJQpee2ghbC5
	Oidz5RLOsIUPsHehQDv1d6rIw7Kc5I8Bbzax20DHmW4pTvtI97y0jYKpxxG7zq8vNHLN
	DGGg==
X-Received: by 10.180.83.199 with SMTP id s7mr16745700wiy.19.1368098235796;
	Thu, 09 May 2013 04:17:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.38 with HTTP; Thu, 9 May 2013 04:16:55 -0700 (PDT)
In-Reply-To: <518A7D62.6050606@linux.intel.com>
References: <1367931613-25770-1-git-send-email-bogdan.a.marinescu@intel.com>
	<518A7D62.6050606@linux.intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 9 May 2013 14:16:55 +0300
Message-ID: <CAMZjud04zVZqFjZ46s1SOM3Brr=G3Tb21GuD9GA7+VwLmn=5cQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnrvjAyjo1PPEpVM30BHHvrgUSMd9kG/7HakrqKRV1Zc2G2tKpkbu6hy1gIL+XG2PJ2YUaN
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmp: updated to 5.1.1
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
X-List-Received-Date: Thu, 09 May 2013 11:35:24 -0000
X-List-Received-Date: Thu, 09 May 2013 11:35:24 -0000
Content-Type: multipart/alternative; boundary=14dae9cc973c5ce27204dc473178

--14dae9cc973c5ce27204dc473178
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 8, 2013 at 7:29 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/07/2013 06:00 AM, Bogdan Marinescu wrote:
>
>> A number of patches are now part of the upstream.
>> Tested by compiling and running core-image-minimal/qemux86.
>>
>>
> This patch is not applying cleaning, please verify it. see below
>
>
>
>  Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> ---
>>   .../gmp/gmp-5.1.0/**187b7b1646ee.patch               |   44
>> --------------------
>>   .../gmp/gmp-5.1.0/obsolete_**automake_macros.patch   |   13 ------
>>   .../gmp/{gmp-5.1.0 => gmp-5.1.1}/configure.patch   |    6 +--
>>   meta/recipes-support/gmp/gmp/**gmp_fix_for_x32.patch |   41
>> ------------------
>>   meta/recipes-support/gmp/gmp_**5.1.0.bb <http://gmp_5.1.0.bb>
>>      |   15 -------
>>   meta/recipes-support/gmp/gmp_**5.1.1.bb <http://gmp_5.1.1.bb>
>>      |   10 +++++
>>   6 files changed, 13 insertions(+), 116 deletions(-)
>>   delete mode 100644 meta/recipes-support/gmp/gmp-**
>> 5.1.0/187b7b1646ee.patch
>>   delete mode 100644 meta/recipes-support/gmp/gmp-**
>> 5.1.0/obsolete_automake_**macros.patch
>>   rename meta/recipes-support/gmp/{gmp-**5.1.0 =>
>> gmp-5.1.1}/configure.patch (97%)
>>   delete mode 100644 meta/recipes-support/gmp/gmp/**gmp_fix_for_x32.patch
>>   delete mode 100644 meta/recipes-support/gmp/gmp_**5.1.0.bb<http://gmp_5.1.0.bb>
>>   create mode 100644 meta/recipes-support/gmp/gmp_**5.1.1.bb<http://gmp_5.1.1.bb>
>>
>> diff --git a/meta/recipes-support/gmp/**gmp-5.1.0/187b7b1646ee.patch
>> b/meta/recipes-support/gmp/**gmp-5.1.0/187b7b1646ee.patch
>> deleted file mode 100644
>> index 486f8c5..0000000
>> --- a/meta/recipes-support/gmp/**gmp-5.1.0/187b7b1646ee.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -Upstream-status: Backport
>> -
>> -# HG changeset patch
>> -# User Torbjorn Granlund <tege@gmplib.org>
>> -# Date 1357413121 -3600
>> -# Node ID 187b7b1646ee0ace782768bb36117b**62c8408bb6
>> -# Parent  87a24013e9ee2cabf74e32282c1858**4a2c669009
>> -(aarch64): Make add_ssaaaa and sub_ddmmss actually work.
>> -
>> -diff -r 87a24013e9ee -r 187b7b1646ee longlong.h
>> ---- a/longlong.h       Fri Jan 04 16:32:01 2013 +0100
>> -+++ b/longlong.h       Sat Jan 05 20:12:01 2013 +0100
>> -@@ -530,23 +530,16 @@
>> - #endif /* __arm__ */
>> -
>> - #if defined (__aarch64__) && W_TYPE_SIZE == 64
>> -+/* FIXME: Extend the immediate range for the low word by using both
>> -+   ADDS and SUBS, since they set carry in the same way.  */
>> - #define add_ssaaaa(sh, sl, ah, al, bh, bl) \
>> --  __asm__ ("adds\t%1, %4, %5\n\tadc\t%0, %2, %3"                      \
>> -+  __asm__ ("adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3"                   \
>> -          : "=r" (sh), "=&r" (sl)                                      \
>> --         : "r" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
>> -+         : "rZ" (ah), "rZ" (bh), "%r" (al), "rI" (bl) __CLOBBER_CC)
>> - #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
>> --  do {
>>        \
>> --    if (__builtin_constant_p (bl))                                    \
>> --      {
>>       \
>> --      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"                  \
>> --               : "=r" (sh), "=&r" (sl)                                \
>> --               : "r" (ah), "r" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);
>> \
>> --      }
>>       \
>> --    else /* only bh might be a constant */                            \
>> --      __asm__ ("subs\t%1, %4, %5\n\tsbc\t%0, %2, %3"                  \
>> --             : "=r" (sh), "=&r" (sl)                                  \
>> --             : "r" (ah), "rZ" (bh), "r" (al), "rI" (bl) __CLOBBER_CC);\
>> --    } while (0)
>> -+  __asm__ ("subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3"                   \
>> -+         : "=r,r" (sh), "=&r,&r" (sl)                                 \
>> -+         : "rZ,rZ" (ah), "rZ,rZ" (bh), "r,Z" (al), "rI,r" (bl)
>> __CLOBBER_CC)
>> - #define umul_ppmm(ph, pl, m0, m1) \
>> -   do {
>>        \
>> -     UDItype __m0 = (m0), __m1 = (m1);                                 \
>> -
>> diff --git a/meta/recipes-support/gmp/**gmp-5.1.0/obsolete_automake_**macros.patch
>> b/meta/recipes-support/gmp/**gmp-5.1.0/obsolete_automake_**macros.patch
>> deleted file mode 100644
>> index adff6ca..0000000
>> --- a/meta/recipes-support/gmp/**gmp-5.1.0/obsolete_automake_**
>> macros.patch
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -Upstream-Status: Accepted
>> -
>> -Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>> -diff -Nurd gmp-5.1.0/configure.in gmp-5.1.0/configure.in
>> ---- gmp-5.1.0/configure.in     2012-12-18 21:05:09.000000000 +0200
>> -+++ gmp-5.1.0/configure.in     2013-01-02 06:00:41.552958778 +0200
>> -@@ -67,7 +67,7 @@
>> - dnl  so update there too if changing anything.
>> - dnl
>> - AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])
>> --AM_CONFIG_HEADER(config.h:co**nfig.in <http://config.in>)
>> -+AC_CONFIG_HEADERS(config.h:c**onfig.in <http://config.in>)
>> - AM_MAINTAINER_MODE
>> diff --git a/meta/recipes-support/gmp/**gmp-5.1.0/configure.patch
>> b/meta/recipes-support/gmp/**gmp-5.1.1/configure.patch
>> similarity index 97%
>> rename from meta/recipes-support/gmp/gmp-**5.1.0/configure.patch
>> rename to meta/recipes-support/gmp/gmp-**5.1.1/configure.patch
>> index fb5435c..591ea79 100644
>> --- a/meta/recipes-support/gmp/**gmp-5.1.0/configure.patch
>> +++ b/meta/recipes-support/gmp/**gmp-5.1.1/configure.patch
>> @@ -115,9 +115,9 @@ diff -Nurd gmp-5.1.0/acinclude.m4
>> gmp-5.1.0/acinclude.m4
>>    ])
>>
>>
>> -diff -Nurd gmp-5.1.0/configure.in gmp-5.1.0/configure.in
>> ---- gmp-5.1.0/configure.in     2012-12-18 21:05:09.000000000 +0200
>> -+++ gmp-5.1.0/configure.in     2013-01-02 05:19:26.977013073 +0200
>> +diff -Nurd gmp-5.1.0/configure.ac gmp-5.1.0/configure.ac
>> +--- gmp-5.1.0/configure.ac     2012-12-18 21:05:09.000000000 +0200
>> ++++ gmp-5.1.0/configure.ac     2013-01-02 05:19:26.977013073 +0200
>>   @@ -29,13 +29,6 @@
>>    AC_PREREQ(2.59)
>>    AC_INIT(GNU MP, GMP_VERSION, [gmp-bugs@gmplib.org, see
>> http://gmplib.org/manual/**Reporting-Bugs.html<http://gmplib.org/manual/Reporting-Bugs.html>],
>> gmp)
>> diff --git a/meta/recipes-support/gmp/**gmp/gmp_fix_for_x32.patch
>> b/meta/recipes-support/gmp/**gmp/gmp_fix_for_x32.patch
>> deleted file mode 100644
>> index 76d3a00..0000000
>> --- a/meta/recipes-support/gmp/**gmp/gmp_fix_for_x32.patch
>> +++ /dev/null
>> @@ -1,41 +0,0 @@
>> -Upstream-Status: Pending
>> -
>> -Add X32 support in gmp configure.
>> -
>> -Patch Originator: H J Lu @ Intel
>> -Patch modified for Yocto by Nitin Kamble
>> -Signed Off By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/11/21
>> -
>> ---- gmp-4.3.2/configure.in.x32 2011-08-12 15:03:06.143548291 -0700
>> -+++ gmp-4.3.2/configure.in     2011-08-12 15:06:20.580595316 -0700
>> -@@ -1499,6 +1499,21 @@ case $host in
>> -           path_64="x86_64/atom x86_64"
>> -           ;;
>> -       esac
>> -+
>> -+      # X32 support.
>> -+      case x"$path_64" in
>> -+        xx86_64*)
>> -+          abilist="x32 64 32"
>> -+          path_x32="$path_64"
>> -+          limb_x32=longlong
>> -+          cclist_x32="gcc"
>> -+          gcc_x32_cflags="-O2 -mx32"
>> -+          any_x32_testlist="sizeof-long-**4"
>> -+          CALLING_CONVENTIONS_OBJS_x32='**amd64call.lo amd64check$U.lo'
>> -+          SPEED_CYCLECOUNTER_OBJ_x32=**x86_64.lo
>> -+          cyclecounter_size_x32=2
>> -+          ;;
>> -+      esac
>> -       ;;
>> -     esac
>> -     ;;
>> -@@ -3039,7 +3058,7 @@ if test "$gmp_asm_syntax_testing" != no;
>> -             GMP_INCLUDE_MPN(x86/darwin.m4) ;;
>> -         esac
>> -           ;;
>> --        64)
>> -+        64|x32)
>> -           GMP_INCLUDE_MPN(x86_64/x86_64-**defs.m4)
>> -         case $host in
>> -           *-*-darwin*)
>> diff --git a/meta/recipes-support/gmp/gmp**_5.1.0.bb<http://gmp_5.1.0.bb>b/meta/recipes-support/gmp/
>> gmp**_5.1.0.bb <http://gmp_5.1.0.bb>
>> deleted file mode 100644
>> index 6591ebe..0000000
>> --- a/meta/recipes-support/gmp/gmp**_5.1.0.bb <http://gmp_5.1.0.bb>
>> +++ /dev/null
>> @@ -1,15 +0,0 @@
>> -require gmp.inc
>> -LICENSE="LGPLv3&GPLv3"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=**d32239bcb673463ab874e80d47fae5*
>> *04 \
>> -                   file://version.c;endline=18;**md5=**
>> d8c56b52b9092346b9f93b4da65ef7**90"
>> -
>> -PR = "r1"
>> -
>> -SRC_URI_append = " file://use-includedir.patch \
>> -                   file://gmp_fix_for_x32.patch \
>> -                   file://187b7b1646ee.patch \
>> -                   file://obsolete_automake_**macros.patch \
>> -                   "
>> -
>> -SRC_URI[md5sum] = "**362cf515aff8dc240958ce47418e4c**78"
>> -SRC_URI[sha256sum] = "**dfd9aba98fe5caa54a715b4584c7d4**
>> 5eb0ee0c8be9a3181164ad2fad5eef**c796"
>>
>
> These checksums are different that what's in OE-Core!
>
> PR = "r2"
>
> SRC_URI[md5sum] = "**cf6d7cb5915f29ce0fc41d042205c0**80"
> SRC_URI[sha256sum] = "**ed5239a62aeaba6cfc8d50ec36fb59**
> 215618f98c248d4bb05ca9bccd9907**94dc"
>
> Are you using a current master?
>

I wasn't using the current master, sorry about that. I've sent v2 of this
patch.

Thanks,
Bogdan


>
> Sau!
>
>
>  diff --git a/meta/recipes-support/gmp/gmp**_5.1.1.bb<http://gmp_5.1.1.bb>b/meta/recipes-support/gmp/
>> gmp**_5.1.1.bb <http://gmp_5.1.1.bb>
>> new file mode 100644
>> index 0000000..d6dcb97
>> --- /dev/null
>> +++ b/meta/recipes-support/gmp/gmp**_5.1.1.bb <http://gmp_5.1.1.bb>
>> @@ -0,0 +1,10 @@
>> +require gmp.inc
>> +LICENSE="LGPLv3&GPLv3"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=**d32239bcb673463ab874e80d47fae5*
>> *04 \
>> +                   file://version.c;endline=18;**md5=**
>> d8c56b52b9092346b9f93b4da65ef7**90"
>> +
>> +SRC_URI_append = " file://use-includedir.patch \
>> +                   "
>> +
>> +SRC_URI[md5sum] = "**2fa018a7cd193c78494525f236d02d**d6"
>> +SRC_URI[sha256sum] = "**a0d4779f48b36519dfaceb5f987a7c**
>> 76fcac223258bebea3bb2244310970**afad"
>>
>>

--14dae9cc973c5ce27204dc473178
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, May 8, 2013 at 7:29 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 05/07/2013 06:00 AM, Bo=
gdan Marinescu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
A number of patches are now part of the upstream.<br>
Tested by compiling and running core-image-minimal/qemux86.<br>
<br>
</blockquote>
<br></div>
This patch is not applying cleaning, please verify it. see below<div><div c=
lass=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Bogdan Marinescu &lt;<a href=3D"mailto:bogdan.a.marinescu@in=
tel.com" target=3D"_blank">bogdan.a.marinescu@intel.com</a>&gt;<br>
---<br>
=A0 .../gmp/gmp-5.1.0/<u></u>187b7b1646ee.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 44 --------------------<br>
=A0 .../gmp/gmp-5.1.0/obsolete_<u></u>automake_macros.patch =A0 | =A0 13 --=
----<br>
=A0 .../gmp/{gmp-5.1.0 =3D&gt; gmp-5.1.1}/configure.patch =A0 | =A0 =A06 +-=
-<br>
=A0 meta/recipes-support/gmp/gmp/<u></u>gmp_fix_for_x32.patch | =A0 41 ----=
--------------<br>
=A0 meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" target=3D"_bla=
nk">gmp_<u></u>5.1.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 15 -------<br>
=A0 meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.1.bb" target=3D"_bla=
nk">gmp_<u></u>5.1.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 10 +++++<br>
=A0 6 files changed, 13 insertions(+), 116 deletions(-)<br>
=A0 delete mode 100644 meta/recipes-support/gmp/gmp-<u></u>5.1.0/187b7b1646=
ee.patch<br>
=A0 delete mode 100644 meta/recipes-support/gmp/gmp-<u></u>5.1.0/obsolete_a=
utomake_<u></u>macros.patch<br>
=A0 rename meta/recipes-support/gmp/{gmp-<u></u>5.1.0 =3D&gt; gmp-5.1.1}/co=
nfigure.patch (97%)<br>
=A0 delete mode 100644 meta/recipes-support/gmp/gmp/<u></u>gmp_fix_for_x32.=
patch<br>
=A0 delete mode 100644 meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0=
.bb" target=3D"_blank">gmp_<u></u>5.1.0.bb</a><br>
=A0 create mode 100644 meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.1=
.bb" target=3D"_blank">gmp_<u></u>5.1.1.bb</a><br>
<br>
diff --git a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/187b7b1646ee.patch b=
/meta/recipes-support/gmp/<u></u>gmp-5.1.0/187b7b1646ee.patch<br>
deleted file mode 100644<br>
index 486f8c5..0000000<br>
--- a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/187b7b1646ee.patch<br>
+++ /dev/null<br>
@@ -1,44 +0,0 @@<br>
-Upstream-status: Backport<br>
-<br>
-# HG changeset patch<br>
-# User Torbjorn Granlund &lt;<a href=3D"mailto:tege@gmplib.org" target=3D"=
_blank">tege@gmplib.org</a>&gt;<br>
-# Date 1357413121 -3600<br>
-# Node ID 187b7b1646ee0ace782768bb36117b<u></u>62c8408bb6<br>
-# Parent =A087a24013e9ee2cabf74e32282c1858<u></u>4a2c669009<br>
-(aarch64): Make add_ssaaaa and sub_ddmmss actually work.<br>
-<br>
-diff -r 87a24013e9ee -r 187b7b1646ee longlong.h<br>
---- a/longlong.h =A0 =A0 =A0 Fri Jan 04 16:32:01 2013 +0100<br>
-+++ b/longlong.h =A0 =A0 =A0 Sat Jan 05 20:12:01 2013 +0100<br>
-@@ -530,23 +530,16 @@<br>
- #endif /* __arm__ */<br>
-<br>
- #if defined (__aarch64__) &amp;&amp; W_TYPE_SIZE =3D=3D 64<br>
-+/* FIXME: Extend the immediate range for the low word by using both<br>
-+ =A0 ADDS and SUBS, since they set carry in the same way. =A0*/<br>
- #define add_ssaaaa(sh, sl, ah, al, bh, bl) \<br>
-- =A0__asm__ (&quot;adds\t%1, %4, %5\n\tadc\t%0, %2, %3&quot; =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
-+ =A0__asm__ (&quot;adds\t%1, %x4, %5\n\tadc\t%0, %x2, %x3&quot; =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
- =A0 =A0 =A0 =A0 =A0: &quot;=3Dr&quot; (sh), &quot;=3D&amp;r&quot; (sl) =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
\<br>
-- =A0 =A0 =A0 =A0 : &quot;r&quot; (ah), &quot;rZ&quot; (bh), &quot;%r&quot=
; (al), &quot;rI&quot; (bl) __CLOBBER_CC)<br>
-+ =A0 =A0 =A0 =A0 : &quot;rZ&quot; (ah), &quot;rZ&quot; (bh), &quot;%r&quo=
t; (al), &quot;rI&quot; (bl) __CLOBBER_CC)<br>
- #define sub_ddmmss(sh, sl, ah, al, bh, bl) \<br>
-- =A0do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0\<br>
-- =A0 =A0if (__builtin_constant_p (bl)) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
-- =A0 =A0 =A0{ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 \<br>
-- =A0 =A0 =A0__asm__ (&quot;subs\t%1, %4, %5\n\tsbc\t%0, %2, %3&quot; =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 : &quot;=3Dr&quot; (sh), &quot;=3D&amp;r&quo=
t; (sl) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br=
>
-- =A0 =A0 =A0 =A0 =A0 =A0 =A0 : &quot;r&quot; (ah), &quot;r&quot; (bh), &q=
uot;r&quot; (al), &quot;rI&quot; (bl) __CLOBBER_CC); \<br>
-- =A0 =A0 =A0} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 \<br>
-- =A0 =A0else /* only bh might be a constant */ =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
-- =A0 =A0 =A0__asm__ (&quot;subs\t%1, %4, %5\n\tsbc\t%0, %2, %3&quot; =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br>
-- =A0 =A0 =A0 =A0 =A0 =A0 : &quot;=3Dr&quot; (sh), &quot;=3D&amp;r&quot; (=
sl) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\<br=
>
-- =A0 =A0 =A0 =A0 =A0 =A0 : &quot;r&quot; (ah), &quot;rZ&quot; (bh), &quot=
;r&quot; (al), &quot;rI&quot; (bl) __CLOBBER_CC);\<br>
-- =A0 =A0} while (0)<br>
-+ =A0__asm__ (&quot;subs\t%1, %x4, %5\n\tsbc\t%0, %x2, %x3&quot; =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
-+ =A0 =A0 =A0 =A0 : &quot;=3Dr,r&quot; (sh), &quot;=3D&amp;r,&amp;r&quot; =
(sl) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
-+ =A0 =A0 =A0 =A0 : &quot;rZ,rZ&quot; (ah), &quot;rZ,rZ&quot; (bh), &quot;=
r,Z&quot; (al), &quot;rI,r&quot; (bl) __CLOBBER_CC)<br>
- #define umul_ppmm(ph, pl, m0, m1) \<br>
- =A0 do { =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0\<br>
- =A0 =A0 UDItype __m0 =3D (m0), __m1 =3D (m1); =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \<br>
-<br>
diff --git a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/obsolete_automake_<u=
></u>macros.patch b/meta/recipes-support/gmp/<u></u>gmp-5.1.0/obsolete_auto=
make_<u></u>macros.patch<br>
deleted file mode 100644<br>
index adff6ca..0000000<br>
--- a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/obsolete_automake_<u></u>ma=
cros.patch<br>
+++ /dev/null<br>
@@ -1,13 +0,0 @@<br>
-Upstream-Status: Accepted<br>
-<br>
-Signed-off-by: Marko Lindqvist &lt;<a href=3D"mailto:cazfi74@gmail.com" ta=
rget=3D"_blank">cazfi74@gmail.com</a>&gt;<br>
-diff -Nurd gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">con=
figure.in</a> gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">c=
onfigure.in</a><br>
---- gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">configure.=
in</a> =A0 =A0 2012-12-18 21:05:09.000000000 +0200<br>
-+++ gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">configure.=
in</a> =A0 =A0 2013-01-02 06:00:41.552958778 +0200<br>
-@@ -67,7 +67,7 @@<br>
- dnl =A0so update there too if changing anything.<br>
- dnl<br>
- AM_INIT_AUTOMAKE([1.8 gnu no-dependencies])<br>
--AM_CONFIG_HEADER(config.h:<a href=3D"http://config.in" target=3D"_blank">=
co<u></u>nfig.in</a>)<br>
-+AC_CONFIG_HEADERS(config.h:<a href=3D"http://config.in" target=3D"_blank"=
>c<u></u>onfig.in</a>)<br>
- AM_MAINTAINER_MODE<br>
diff --git a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/configure.patch b/me=
ta/recipes-support/gmp/<u></u>gmp-5.1.1/configure.patch<br>
similarity index 97%<br>
rename from meta/recipes-support/gmp/gmp-<u></u>5.1.0/configure.patch<br>
rename to meta/recipes-support/gmp/gmp-<u></u>5.1.1/configure.patch<br>
index fb5435c..591ea79 100644<br>
--- a/meta/recipes-support/gmp/<u></u>gmp-5.1.0/configure.patch<br>
+++ b/meta/recipes-support/gmp/<u></u>gmp-5.1.1/configure.patch<br>
@@ -115,9 +115,9 @@ diff -Nurd gmp-5.1.0/acinclude.m4 gmp-5.1.0/acinclude.m=
4<br>
=A0 =A0])<br>
<br>
<br>
-diff -Nurd gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">con=
figure.in</a> gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">c=
onfigure.in</a><br>
---- gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">configure.=
in</a> =A0 =A0 2012-12-18 21:05:09.000000000 +0200<br>
-+++ gmp-5.1.0/<a href=3D"http://configure.in" target=3D"_blank">configure.=
in</a> =A0 =A0 2013-01-02 05:19:26.977013073 +0200<br>
+diff -Nurd gmp-5.1.0/<a href=3D"http://configure.ac" target=3D"_blank">con=
figure.ac</a> gmp-5.1.0/<a href=3D"http://configure.ac" target=3D"_blank">c=
onfigure.ac</a><br>
+--- gmp-5.1.0/<a href=3D"http://configure.ac" target=3D"_blank">configure.=
ac</a> =A0 =A0 2012-12-18 21:05:09.000000000 +0200<br>
++++ gmp-5.1.0/<a href=3D"http://configure.ac" target=3D"_blank">configure.=
ac</a> =A0 =A0 2013-01-02 05:19:26.977013073 +0200<br>
=A0 @@ -29,13 +29,6 @@<br>
=A0 =A0AC_PREREQ(2.59)<br>
=A0 =A0AC_INIT(GNU MP, GMP_VERSION, [<a href=3D"mailto:gmp-bugs@gmplib.org"=
 target=3D"_blank">gmp-bugs@gmplib.org</a>, see <a href=3D"http://gmplib.or=
g/manual/Reporting-Bugs.html" target=3D"_blank">http://gmplib.org/manual/<u=
></u>Reporting-Bugs.html</a>], gmp)<br>


diff --git a/meta/recipes-support/gmp/<u></u>gmp/gmp_fix_for_x32.patch b/me=
ta/recipes-support/gmp/<u></u>gmp/gmp_fix_for_x32.patch<br>
deleted file mode 100644<br>
index 76d3a00..0000000<br>
--- a/meta/recipes-support/gmp/<u></u>gmp/gmp_fix_for_x32.patch<br>
+++ /dev/null<br>
@@ -1,41 +0,0 @@<br>
-Upstream-Status: Pending<br>
-<br>
-Add X32 support in gmp configure.<br>
-<br>
-Patch Originator: H J Lu @ Intel<br>
-Patch modified for Yocto by Nitin Kamble<br>
-Signed Off By: Nitin A Kamble &lt;<a href=3D"mailto:nitin.a.kamble@intel.c=
om" target=3D"_blank">nitin.a.kamble@intel.com</a>&gt; 2011/11/21<br>
-<br>
---- gmp-4.3.2/configure.in.x32 2011-08-12 15:03:06.143548291 -0700<br>
-+++ gmp-4.3.2/<a href=3D"http://configure.in" target=3D"_blank">configure.=
in</a> =A0 =A0 2011-08-12 15:06:20.580595316 -0700<br>
-@@ -1499,6 +1499,21 @@ case $host in<br>
- =A0 =A0 =A0 =A0 =A0 path_64=3D&quot;x86_64/atom x86_64&quot;<br>
- =A0 =A0 =A0 =A0 =A0 ;;<br>
- =A0 =A0 =A0 esac<br>
-+<br>
-+ =A0 =A0 =A0# X32 support.<br>
-+ =A0 =A0 =A0case x&quot;$path_64&quot; in<br>
-+ =A0 =A0 =A0 =A0xx86_64*)<br>
-+ =A0 =A0 =A0 =A0 =A0abilist=3D&quot;x32 64 32&quot;<br>
-+ =A0 =A0 =A0 =A0 =A0path_x32=3D&quot;$path_64&quot;<br>
-+ =A0 =A0 =A0 =A0 =A0limb_x32=3Dlonglong<br>
-+ =A0 =A0 =A0 =A0 =A0cclist_x32=3D&quot;gcc&quot;<br>
-+ =A0 =A0 =A0 =A0 =A0gcc_x32_cflags=3D&quot;-O2 -mx32&quot;<br>
-+ =A0 =A0 =A0 =A0 =A0any_x32_testlist=3D&quot;sizeof-long-<u></u>4&quot;<b=
r>
-+ =A0 =A0 =A0 =A0 =A0CALLING_CONVENTIONS_OBJS_x32=3D&#39;<u></u>amd64call.=
lo amd64check$U.lo&#39;<br>
-+ =A0 =A0 =A0 =A0 =A0SPEED_CYCLECOUNTER_OBJ_x32=3D<u></u>x86_64.lo<br>
-+ =A0 =A0 =A0 =A0 =A0cyclecounter_size_x32=3D2<br>
-+ =A0 =A0 =A0 =A0 =A0;;<br>
-+ =A0 =A0 =A0esac<br>
- =A0 =A0 =A0 ;;<br>
- =A0 =A0 esac<br>
- =A0 =A0 ;;<br>
-@@ -3039,7 +3058,7 @@ if test &quot;$gmp_asm_syntax_testing&quot; !=3D no;=
<br>
- =A0 =A0 =A0 =A0 =A0 =A0 GMP_INCLUDE_MPN(x86/darwin.m4) ;;<br>
- =A0 =A0 =A0 =A0 esac<br>
- =A0 =A0 =A0 =A0 =A0 ;;<br>
-- =A0 =A0 =A0 =A064)<br>
-+ =A0 =A0 =A0 =A064|x32)<br>
- =A0 =A0 =A0 =A0 =A0 GMP_INCLUDE_MPN(x86_64/x86_64-<u></u>defs.m4)<br>
- =A0 =A0 =A0 =A0 case $host in<br>
- =A0 =A0 =A0 =A0 =A0 *-*-darwin*)<br>
diff --git a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" targe=
t=3D"_blank">gmp<u></u>_5.1.0.bb</a> b/meta/recipes-support/gmp/<a href=3D"=
http://gmp_5.1.0.bb" target=3D"_blank">gmp<u></u>_5.1.0.bb</a><br>
deleted file mode 100644<br>
index 6591ebe..0000000<br>
--- a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.0.bb" target=3D"_b=
lank">gmp<u></u>_5.1.0.bb</a><br>
+++ /dev/null<br>
@@ -1,15 +0,0 @@<br>
-require gmp.inc<br>
-LICENSE=3D&quot;LGPLv3&amp;GPLv3&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>d32239bcb673463ab87=
4e80d47fae5<u></u>04 \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://version.c;endline=3D18;<u></u>=
md5=3D<u></u>d8c56b52b9092346b9f93b4da65ef7<u></u>90&quot;<br>
-<br>
-PR =3D &quot;r1&quot;<br>
-<br>
-SRC_URI_append =3D &quot; file://use-includedir.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://gmp_fix_for_x32.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://187b7b1646ee.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://obsolete_automake_<u></u>macro=
s.patch \<br>
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<u></u>362cf515aff8dc240958ce47418e4c<u></u>78&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>dfd9aba98fe5caa54a715b4584c7d4<u></u>5=
eb0ee0c8be9a3181164ad2fad5eef<u></u>c796&quot;<br>
</blockquote>
<br></div></div>
These checksums are different that what&#39;s in OE-Core!<br>
<br>
PR =3D &quot;r2&quot;<br>
<br>
SRC_URI[md5sum] =3D &quot;<u></u>cf6d7cb5915f29ce0fc41d042205c0<u></u>80&qu=
ot;<br>
SRC_URI[sha256sum] =3D &quot;<u></u>ed5239a62aeaba6cfc8d50ec36fb59<u></u>21=
5618f98c248d4bb05ca9bccd9907<u></u>94dc&quot;<br>
<br>
Are you using a current master?<br></blockquote><div><br></div><div style>I=
 wasn&#39;t using the current master, sorry about that. I&#39;ve sent v2 of=
 this patch.</div><div style><br></div><div style>Thanks,</div><div style>

Bogdan</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
diff --git a/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.1.bb" targe=
t=3D"_blank">gmp<u></u>_5.1.1.bb</a> b/meta/recipes-support/gmp/<a href=3D"=
http://gmp_5.1.1.bb" target=3D"_blank">gmp<u></u>_5.1.1.bb</a><br>
new file mode 100644<br>
index 0000000..d6dcb97<br>
--- /dev/null<br>
+++ b/meta/recipes-support/gmp/<a href=3D"http://gmp_5.1.1.bb" target=3D"_b=
lank">gmp<u></u>_5.1.1.bb</a><br>
@@ -0,0 +1,10 @@<br>
+require gmp.inc<br>
+LICENSE=3D&quot;LGPLv3&amp;GPLv3&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>d32239bcb673463ab87=
4e80d47fae5<u></u>04 \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 file://version.c;endline=3D18;<u></u>=
md5=3D<u></u>d8c56b52b9092346b9f93b4da65ef7<u></u>90&quot;<br>
+<br>
+SRC_URI_append =3D &quot; file://use-includedir.patch \<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<u></u>2fa018a7cd193c78494525f236d02d<u></u>d6&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>a0d4779f48b36519dfaceb5f987a7c<u></u>7=
6fcac223258bebea3bb2244310970<u></u>afad&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--14dae9cc973c5ce27204dc473178--
