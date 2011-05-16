Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM1L4-0004CH-Da
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 19:13:51 +0200
Received: by ewy5 with SMTP id 5so1363772ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZvboNMCIIvKfzxDvYvDqNd2/uCBRJkVvrwCUxzUNkso=;
	b=lyYXHVYfEnYGtZ5JzG80BOowjgWGJCvAgy3DL94OdsbBK3HjunK8THUG47j+qrlWvz
	C0oFdbM+FcGx/MoA3NB5bqZHXai69Thw5oSAGQ+cjeaEWqVEQY12/QOPfjs8p1IjVMe3
	3tQh1CsyS8prd0dT08+YzHK3H3pWN84HLkgLc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Gxym+5bQpm219mVuRSm668Mm7TSYcb7+f/YlMUqlWSJiNiNiIgVJbLjabJuzA3Rvq1
	+2ErCAVHqdNdl0KfasSis/+fa0D5/iO5aC/wbbngt+OkaBNNXYF9mY4wBKi+JC0SneI2
	Y1qYcbS72VjQjz8/6SDLsPSXTtV5UqVPkQTS8=
Received: by 10.14.95.8 with SMTP id o8mr1525458eef.76.1305565757182; Mon, 16
	May 2011 10:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 10:08:47 -0700 (PDT)
In-Reply-To: <4DD13B6F.4010009@intel.com>
References: <cover.1305418871.git.sgw@linux.intel.com>
	<E943FF3D-A282-4E6D-8B5A-B954A678A0E1@gmail.com>
	<4DD13B6F.4010009@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 10:08:47 -0700
Message-ID: <BANLkTi=0TcHgXmYpwCjX6P5h6+y9O2YQFw@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 0/3] Move Old Recipes to meta-extras
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
X-List-Received-Date: Mon, 16 May 2011 17:13:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 7:57 AM, Saul Wold <saul.wold@intel.com> wrote:
> On 05/15/2011 11:19 PM, Khem Raj wrote:
>>
>>
>> On May 14, 2011, at 5:23 PM, Saul Wold<sgw@linux.intel.com> =C2=A0wrote:
>>
>>> From: Saul Wold<sgw@linux.intel.com>
>>>
>>> This proposes to move the YAFFS2-utils, older clutter-1.4
>>> and older GCC version (4.3.3 and 3.4.4) as they are unused
>>> and currently unbuildable.
>>>
>>
>> Are we left with any GPLv2 version of gcc after this ?
>>
> Khem,
>
> Is not having a GPLv2 version of gcc an issue? For the non-gplv3 version,=
 my
> understanding is to have an installed user-space for oe-core for a
> non-development system, therefore gcc is not an issue.
>

there are certain parts of gcc which go onto target e.g. libgcc libstdc++

> Let me know if you think otherwise.
>
> Sau!
>
>>> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>>> =C2=A0Branch: sgw/rfc
>>> =C2=A0Browse:
>>> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dsgw/rfc
>>>
>>> Thanks,
>>> =C2=A0 =C2=A0Saul Wold<sgw@linux.intel.com>
>>> ---
>>>
>>>
>>> Saul Wold (3):
>>> =C2=A0yaffs2: Remove yaffs2 from oe-core
>>> =C2=A0clutter: Clean up old recipes
>>> =C2=A0gcc: Move 4.3.3 and Special kernel gcc-3.4.4 to meta-extras
>>>
>>> meta/classes/image_types.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 -
>>> meta/recipes-devtools/gcc/gcc-4.3.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 71 -
>>> .../gcc/gcc-4.3.3/100-uclibc-conf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 37 -
>>> .../gcc/gcc-4.3.3/103-uclibc-conf-noupstream.patch | =C2=A0 11 -
>>> .../gcc/gcc-4.3.3/110-arm-eabi.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 27 -
>>> .../gcc/gcc-4.3.3/200-uclibc-locale.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 2833 ---------
>>> .../gcc/gcc-4.3.3/203-uclibc-locale-no__x.patch =C2=A0 =C2=A0| =C2=A023=
3 -
>>> .../gcc-4.3.3/204-uclibc-locale-wchar_fix.patch =C2=A0 =C2=A0| =C2=A0 4=
8 -
>>> .../gcc/gcc-4.3.3/205-uclibc-locale-update.patch =C2=A0 | =C2=A0519 --
>>> .../gcc/gcc-4.3.3/300-libstdc++-pic.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 46 -
>>> .../gcc/gcc-4.3.3/301-missing-execinfo_h.patch =C2=A0 =C2=A0 | =C2=A0 1=
1 -
>>> .../gcc/gcc-4.3.3/302-c99-snprintf.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 13 -
>>> .../gcc/gcc-4.3.3/303-c99-complex-ugly-hack.patch =C2=A0| =C2=A0 12 -
>>> .../gcc/gcc-4.3.3/304-index_macro.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 24 -
>>> .../gcc-4.3.3/305-libmudflap-susv3-legacy.patch =C2=A0 =C2=A0| =C2=A0 4=
9 -
>>> .../gcc/gcc-4.3.3/306-libstdc++-namespace.patch =C2=A0 =C2=A0| =C2=A0 3=
6 -
>>> .../gcc/gcc-4.3.3/307-locale_facets.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 19 -
>>> .../gcc-4.3.3/402-libbackend_dep_gcov-iov.h.patch =C2=A0| =C2=A0 13 -
>>> .../gcc/gcc-4.3.3/602-sdk-libstdc++-includes.patch | =C2=A0 20 -
>>> .../recipes-devtools/gcc/gcc-4.3.3/64bithack.patch | =C2=A0 33 -
>>> .../gcc/gcc-4.3.3/740-sh-pr24836.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 25 -
>>> .../gcc/gcc-4.3.3/800-arm-bigendian.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 34 -
>>> .../gcc/gcc-4.3.3/801-arm-bigendian-eabi.patch =C2=A0 =C2=A0 | =C2=A0 1=
4 -
>>> .../gcc/gcc-4.3.3/904-flatten-switch-stmt-00.patch | =C2=A0153 -
>>> .../gcc/gcc-4.3.3/arm-nolibfloat.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 24 -
>>> .../gcc/gcc-4.3.3/arm-softfloat.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 16 -
>>> .../gcc/gcc-4.3.3/arm-thumb-cache.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 29 -
>>> .../recipes-devtools/gcc/gcc-4.3.3/arm-thumb.patch | =C2=A0 43 -
>>> .../gcc/gcc-4.3.3/cache-amnesia.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 31 -
>>> .../debian/arm-unbreak-eabi-armv4t.dpatch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 36 -
>>> .../gcc/gcc-4.3.3/debian/gcc-ice-hack.dpatch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0331 -
>>> .../gcc/gcc-4.3.3/debian/libstdc++-pic.dpatch =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 71 -
>>> .../gcc/gcc-4.3.3/debian/pr30961.dpatch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0179 -
>>> .../fedora/gcc43-c++-builtin-redecl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0102 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-cpp-pragma.patch =C2=A0 =C2=A0| =C2=A028=
4 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-i386-libgomp.patch =C2=A0| =C2=A0 61 -
>>> .../gcc-4.3.3/fedora/gcc43-ia64-libunwind.patch =C2=A0 =C2=A0| =C2=A053=
8 --
>>> .../fedora/gcc43-java-debug-iface-type.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 17 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-java-nomulti.patch =C2=A0| =C2=A0 44 -
>>> .../gcc-4.3.3/fedora/gcc43-libgomp-speedup.patch =C2=A0 | 2797 --------
>>> .../gcc/gcc-4.3.3/fedora/gcc43-ppc32-retaddr.patch | =C2=A0 86 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-pr27898.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 16 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-pr32139.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 19 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-pr33763.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0153 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-pr35440.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 56 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-pr35751.patch =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0114 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-rh251682.patch =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 89 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-rh330771.patch =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 34 -
>>> .../gcc/gcc-4.3.3/fedora/gcc43-rh341221.patch =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 28 -
>>> .../gcc/gcc-4.3.3/fortran-cross-compile-hack.patch | =C2=A0 30 -
>>> .../gcc/gcc-4.3.3/fortran-static-linking.patch =C2=A0 =C2=A0 | =C2=A0 4=
8 -
>>> .../gcc/gcc-4.3.3/gcc-4.0.2-e300c2c3.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0319 -
>>> .../gcc-4.3.3/gcc-4.2.3-linux-multilib-fix.patch =C2=A0 | =C2=A0 23 -
>>> .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 31 -
>>> .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch =C2=A0 =C2=A0 =C2=A0| 669=
1
>>> --------------------
>>> .../gcc/gcc-4.3.3/gcc-arm-frename-registers.patch =C2=A0| =C2=A0 25 -
>>> .../gcc/gcc-4.3.3/gcc-flags-for-build.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0279 -
>>> .../gcc-release-branch/PR-36500-fix-neon.patch =C2=A0 =C2=A0 | =C2=A026=
5 -
>>> .../gcc/gcc-4.3.3/gcc41-configure.in.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 22 -
>>> .../gcc/gcc-4.3.3/gcc43-build-id.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 74 -
>>> .../gcc/gcc-4.3.3/gcc43-ppc64-ia64-GNU-stack.patch | =C2=A0 86 -
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gfortran.patch | =C2=A0 40 -
>>> .../gcc/gcc-4.3.3/headerpath.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 42 -
>>> .../gcc/gcc-4.3.3/intermask-bigendian.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 24 -
>>> meta/recipes-devtools/gcc/gcc-4.3.3/ldflags.patch =C2=A0| =C2=A0 22 -
>>> .../gcc/gcc-4.3.3/optional_libstdc.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 23 -
>>> meta/recipes-devtools/gcc/gcc-4.3.3/pr34130.patch =C2=A0| =C2=A0 16 -
>>> meta/recipes-devtools/gcc/gcc-4.3.3/pr35942.patch =C2=A0| =C2=A0 38 -
>>> .../gcc/gcc-4.3.3/sdk-libstdc++-includes.patch =C2=A0 =C2=A0 | =C2=A0 2=
2 -
>>> .../gcc/gcc-4.3.3/sh3-installfix-fixheaders.patch =C2=A0| =C2=A0 11 -
>>> .../recipes-devtools/gcc/gcc-4.3.3/sh_unwind.patch | =C2=A0 18 -
>>> .../gcc/gcc-4.3.3/sparseset_rule.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 20 -
>>> .../gcc/gcc-4.3.3/unbreak-armv4t.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 12 -
>>> .../gcc/gcc-4.3.3/zecke-no-host-includes.patch =C2=A0 =C2=A0 | =C2=A0 3=
1 -
>>> .../gcc/gcc-4.3.3/zecke-xgcc-cpp.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 28 -
>>> .../gcc/gcc-cross-canadian_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 24 -
>>> .../gcc/gcc-cross-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A05 -
>>> .../gcc/gcc-cross-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A04 -
>>> .../gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb =C2=A0 | =C2=A0 15 -
>>> meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 10 -
>>> .../gcc/gcc-crosssdk-initial_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 -
>>> .../gcc/gcc-crosssdk-intermediate_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A03 -
>>> meta/recipes-devtools/gcc/gcc-crosssdk_4.3.3.bb =C2=A0 =C2=A0| =C2=A0 =
=C2=A03 -
>>> meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb =C2=A0 =C2=A0 | =C2=A0 1=
1 -
>>> meta/recipes-devtools/gcc/gcc_4.3.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 10 -
>>> .../yaffs2/files/mkyaffs2image.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0351 -
>>> .../yaffs2/files/yaffs2-unioob.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0218 -
>>> meta/recipes-devtools/yaffs2/yaffs2-utils.inc =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 28 -
>>> meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb =C2=A0 | =C2=A0 =C2=A0=
4 -
>>> meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb | =C2=A0 25 -
>>> meta/recipes-graphics/clutter/clutter-box2d_git.bb | =C2=A0 =C2=A04 +-
>>> .../clutter/clutter-gst-1.4/enable_tests.patch =C2=A0 =C2=A0 | =C2=A0 1=
5 -
>>> .../clutter/clutter-gst-1.4_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 19 -
>>> .../clutter/clutter-gtk-1.4_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 18 -
>>> 94 files changed, 2 insertions(+), 18490 deletions(-)
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3.inc
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/100-uclibc-conf.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/103-uclibc-conf-noupstream.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/110-arm-eabi.pat=
ch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/200-uclibc-locale.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/203-uclibc-locale-no__x.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/204-uclibc-locale-wchar_fix.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/205-uclibc-locale-update.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/300-libstdc++-pic.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/301-missing-execinfo_h.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/302-c99-snprintf.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/303-c99-complex-ugly-hack.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/304-index_macro.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/305-libmudflap-susv3-legacy.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/306-libstdc++-namespace.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/307-locale_facets.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/402-libbackend_dep_gcov-iov.h.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/602-sdk-libstdc++-includes.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/64bithack.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/740-sh-pr24836.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/800-arm-bigendian.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/801-arm-bigendian-eabi.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/904-flatten-switch-stmt-00.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/arm-nolibfloat.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/arm-softfloat.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/arm-thumb-cache.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/arm-thumb.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/cache-amnesia.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/debian/arm-unbreak-eabi-armv4t.dpat=
ch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/debian/gcc-ice-hack.dpatch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/debian/libstdc++-pic.dpatch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/debian/pr30961.dpatch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-c++-builtin-redecl.pat=
ch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-cpp-pragma.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-i386-libgomp.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-ia64-libunwind.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-java-debug-iface-type.=
patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-java-nomulti.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-libgomp-speedup.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-ppc32-retaddr.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr27898.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr32139.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr33763.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr35440.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-pr35751.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh251682.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh330771.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fedora/gcc43-rh341221.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fortran-cross-compile-hack.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/fortran-static-linking.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.0.2-e300c2c3.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.2.3-linux-multilib-fix.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.pat=
ch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET=
.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-arm-frename-registers.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-flags-for-build.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc-release-branch/PR-36500-fix-neo=
n.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc41-configure.in.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc43-build-id.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/gcc43-ppc64-ia64-GNU-stack.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/gfortran.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/headerpath.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/intermask-bigendian.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/ldflags.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/optional_libstdc.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/pr34130.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/pr35942.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/sdk-libstdc++-includes.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/sh3-installfix-fixheaders.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-4.3.3/sh_unwind.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/sparseset_rule.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/unbreak-armv4t.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/zecke-no-host-includes.patch
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-4.3.3/zecke-xgcc-cpp.patch
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-canadian_4.3.3.b=
b
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.3.3.bb
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-cross-intermediate_4.3.3.bb
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-cross-kernel-3.4.4_csl-arm-2005q3.bb
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.3.3.bb
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.3.3.bb
>>> delete mode 100644
>>> meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.3.3.bb
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk_4.3.3.bb
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.3.3.bb
>>> delete mode 100644 meta/recipes-devtools/gcc/gcc_4.3.3.bb
>>> delete mode 100644 meta/recipes-devtools/yaffs2/files/mkyaffs2image.pat=
ch
>>> delete mode 100644 meta/recipes-devtools/yaffs2/files/yaffs2-unioob.pat=
ch
>>> delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils.inc
>>> delete mode 100644 meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb
>>> delete mode 100644 meta/recipes-graphics/clutter/clutter-1.4_1.4.2.bb
>>> delete mode 100644
>>> meta/recipes-graphics/clutter/clutter-gst-1.4/enable_tests.patch
>>> delete mode 100644 meta/recipes-graphics/clutter/clutter-gst-1.4_git.bb
>>> delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.4_git.bb
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
>


