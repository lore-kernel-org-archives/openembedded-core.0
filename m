Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PqBmE-0004BO-6Z
	for openembedded-core@lists.linuxtogo.org;
	Thu, 17 Feb 2011 22:52:42 +0100
Received: by fxm17 with SMTP id 17so2928455fxm.6
	for <openembedded-core@lists.linuxtogo.org>;
	Thu, 17 Feb 2011 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=igNE+tJhfP0vcVRVQ3UKl+X7RAqTAUhPdO2Zbx3z1lc=;
	b=U2mwrPDIaNq27H3EHkPL7+NE1vSQO2BB5sOSVpyAPmxoQCL7kldV2uOqwdv0OnlMTZ
	StKxIKZq2jC3cpPFfA2H51+nw9u8DLZ7Qs31uptte9qHxRRXafB54Lei/N2A/ETVWYga
	ieLDBXUCIudakL4Mb2lFACWnZowlXVAAfX5wE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=xNrjIVpwlNpAU3r+Fo4dLbQVujuUkKshjr3CxEZ8zXX/+lqNQ0OMI2/f3mh6T+zYtZ
	GFNCoXJtLHEwo8lta7lMKQK0ayr26yH4VdVchMXFwvjKr7x17PBDaDJwcovl0kAdzKmb
	jvPeLGoBoWgW7E6+m/AG4Jw/skbNswk09R4w8=
Received: by 10.223.53.68 with SMTP id l4mr3131718fag.44.1297979489323; Thu,
	17 Feb 2011 13:51:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.66.22 with HTTP; Thu, 17 Feb 2011 13:51:09 -0800 (PST)
In-Reply-To: <AANLkTi=L4njKeijS_W6VWWXqcHcfVv6ODWZVS+RBMFcj@mail.gmail.com>
References: <1297975874-8071-1-git-send-email-raj.khem@gmail.com>
	<AANLkTi=L4njKeijS_W6VWWXqcHcfVv6ODWZVS+RBMFcj@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2011 13:51:09 -0800
Message-ID: <AANLkTikJHbAoW6cK51sQ-9jUM0FE5zJbK_1eKRK_5Ok9@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
Subject: Re: [PATCH] gcc-4.5: Bring latest from linaro 4.5 and bump svn SRCREV for upstream
X-BeenThere: openembedded-core@lists.linuxtogo.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.linuxtogo.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.linuxtogo.org>
List-Help: <mailto:openembedded-core-request@lists.linuxtogo.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.linuxtogo.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Feb 2011 21:52:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2011 at 1:10 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> This looks to be against meta-oe instead of oe-core, but I guess you're
> testing patchwork?

This is a dummy patch, Yes I am testing the mailing list and patchwork
correct :)

>
> 2011/2/17 Khem Raj <raj.khem@gmail.com>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0recipes/gcc/gcc-4.5.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 13 +-
>> =C2=A0recipes/gcc/gcc-4.5/arm-bswapsi2.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 | =C2=A0 13 -
>> =C2=A0.../gcc-4.5/gcc-arm-volatile-bitfield-fix.patch =C2=A0 =C2=A0| =C2=
=A0 =C2=A06 +-
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch | =C2=A0147 -
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch | 3163 --------=
-------
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99457.patch | 4236
>> --------------------
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99464.patch | =C2=A0157 +
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99465.patch | =C2=A0 94 +
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99466.patch | =C2=A0 38 +
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99468.patch | =C2=A0811 +++=
+
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99473.patch | =C2=A0409 ++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99474.patch | 3346
>> ++++++++++++++++
>> =C2=A0.../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99475.patch | 4217
>> +++++++++++++++++++
>> =C2=A013 files changed, 9083 insertions(+), 7567 deletions(-)
>> =C2=A0delete mode 100644 recipes/gcc/gcc-4.5/arm-bswapsi2.patch
>> =C2=A0delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9944=
8.patch
>> =C2=A0delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9945=
6.patch
>> =C2=A0delete mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9945=
7.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9946=
4.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9946=
5.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9946=
6.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9946=
8.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9947=
3.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9947=
4.patch
>> =C2=A0create mode 100644 recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r9947=
5.patch
>>
>> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
>> index b630528..1f089f6 100644
>> --- a/recipes/gcc/gcc-4.5.inc
>> +++ b/recipes/gcc/gcc-4.5.inc
>> @@ -10,7 +10,7 @@ NATIVEDEPS =3D "mpfr-native gmp-native libmpc-native"
>>
>> =C2=A0INC_PR =3D "r31"
>>
>> -SRCREV =3D "168622"
>> +SRCREV =3D "170123"
>> =C2=A0PV =3D "4.5"
>> =C2=A0# BINV should be incremented after updating to a revision
>> =C2=A0# after a minor gcc release (e.g. 4.5.1 or 4.5.2) has been made
>> @@ -29,7 +29,6 @@ SRC_URI =3D
>> "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cache-amnesia.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-flags-for-build.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libstdc++-emit-__cxa_end_clean=
up-in-text.patch \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://arm-bswapsi2.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://Makefile.in.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-armv4-pass-fix-v4bx-to-ld.=
patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://sh4-multilib.patch \
>> @@ -154,7 +153,6 @@ SRC_URI =3D
>> "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99442.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99443.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99444.p=
atch \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99448.=
patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99449.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99450.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99451.p=
atch \
>> @@ -162,8 +160,13 @@ SRC_URI =3D
>> "svn://gcc.gnu.org/svn/gcc/branches;module=3D${BRANCH} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99453.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99454.p=
atch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99455.p=
atch \
>> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99456.patch=
 \
>> -# =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linaro/gcc-4.5-linaro-r99457.patch=
 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99464.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99465.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99466.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99468.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99473.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99474.=
patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linaro/gcc-4.5-linaro-r99475.=
patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-scalar-widening-pr45847.pa=
tch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc-arm-volatile-bitfield-fix.=
patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>> diff --git a/recipes/gcc/gcc-4.5/arm-bswapsi2.patch
>> b/recipes/gcc/gcc-4.5/arm-bswapsi2.patch
>> deleted file mode 100644
>> index 7ac61a6..0000000
>> --- a/recipes/gcc/gcc-4.5/arm-bswapsi2.patch
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -Index: gcc-4.5/gcc/config/arm/arm.md
>> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- gcc-4.5.orig/gcc/config/arm/arm.md 2010-06-17 09:13:07.000000000
>> -0700
>> -+++ gcc-4.5/gcc/config/arm/arm.md =C2=A0 =C2=A0 =C2=A02010-06-22 08:08:=
45.397212002
>> -0700
>> -@@ -11267,7 +11267,7 @@
>> - (define_expand "bswapsi2"
>> - =C2=A0 [(set (match_operand:SI 0 "s_register_operand" "=3Dr")
>> - =C2=A0 =C2=A0 =C2=A0 (bswap:SI (match_operand:SI 1 "s_register_operand=
" "r")))]
>> --"TARGET_EITHER"
>> -+"TARGET_EITHER && (arm_arch6 && !optimize_size)"
>> - "
>> - =C2=A0 if (!arm_arch6)
>> - =C2=A0 =C2=A0 {
>> diff --git a/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
>> b/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
>> index d5a31d1..f833358 100644
>> --- a/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
>> +++ b/recipes/gcc/gcc-4.5/gcc-arm-volatile-bitfield-fix.patch
>> @@ -89,9 +89,9 @@ ChangeLog
>>
>> =C2=A0Index: gcc-4_5-branch/gcc/expr.c
>> =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> ---- gcc-4_5-branch.orig/gcc/expr.c =C2=A0 =C2=A0 2010-12-23 00:42:11.69=
0101002
>> -0800
>> -+++ gcc-4_5-branch/gcc/expr.c =C2=A02010-12-24 15:07:39.400101000 -0800
>> -@@ -9029,7 +9029,8 @@
>> +--- gcc-4_5-branch.orig/gcc/expr.c
>> ++++ gcc-4_5-branch/gcc/expr.c
>> +@@ -9033,7 +9033,8 @@ expand_expr_real_1 (tree exp, rtx target
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& modifier !=3D =
EXPAND_INITIALIZER)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If the field is volatile, we=
 always want an aligned
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 access. =C2=A0*/
>> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
>> b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
>> deleted file mode 100644
>> index 9f3d47f..0000000
>> --- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99448.patch
>> +++ /dev/null
>> @@ -1,147 +0,0 @@
>> -2010-12-13 =C2=A0Chung-Lin Tang =C2=A0<cltang@codesourcery.com>
>> -
>> - =C2=A0 =C2=A0 =C2=A0 Backport from mainline:
>> -
>> - =C2=A0 =C2=A0 =C2=A0 2010-12-10 =C2=A0Jakub Jelinek =C2=A0<jakub@redha=
t.com>
>> -
>> - =C2=A0 =C2=A0 =C2=A0 PR rtl-optimization/46865
>> -
>> - =C2=A0 =C2=A0 =C2=A0 * rtl.c (rtx_equal_p_cb, rtx_equal_p): For last o=
perand of
>> - =C2=A0 =C2=A0 =C2=A0 ASM_OPERANDS and ASM_INPUT if integers are differ=
ent,
>> - =C2=A0 =C2=A0 =C2=A0 call locator_eq.
>> - =C2=A0 =C2=A0 =C2=A0 * jump.c (rtx_renumbered_equal_p): Likewise.
>> -
>> - =C2=A0 =C2=A0 =C2=A0 gcc/testsuite/
>> - =C2=A0 =C2=A0 =C2=A0 * gcc.target/i386/pr46865-1.c: New test.
>> - =C2=A0 =C2=A0 =C2=A0 * gcc.target/i386/pr46865-2.c: New test.
>> -
>> -=3D=3D=3D modified file 'gcc/jump.c'
>> ---- old/gcc/jump.c =C2=A0 =C2=A0 2009-11-25 10:55:54 +0000
>> -+++ new/gcc/jump.c =C2=A0 =C2=A0 2010-12-13 10:05:52 +0000
>> -@@ -1728,7 +1728,13 @@
>> -
>> - =C2=A0 =C2=A0 =C2=A0 case 'i':
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (XINT (x, i) !=3D XINT (y, i))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((code =3D=3D ASM_OPERAN=
DS && i =3D=3D 6)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (code =3D=
=3D ASM_INPUT && i =3D=3D 1))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& locator_eq =
(XINT (x, i), XINT (y, i)))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 case 't':
>> -
>> -=3D=3D=3D modified file 'gcc/rtl.c'
>> ---- old/gcc/rtl.c =C2=A0 =C2=A0 =C2=A02009-11-25 10:55:54 +0000
>> -+++ new/gcc/rtl.c =C2=A0 =C2=A0 =C2=A02010-12-13 10:05:52 +0000
>> -@@ -429,7 +429,15 @@
>> - =C2=A0 =C2=A0 =C2=A0 case 'n':
>> - =C2=A0 =C2=A0 =C2=A0 case 'i':
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (XINT (x, i) !=3D XINT (y, i))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+#ifndef GENERATOR_FILE
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((code =3D=3D ASM_OPERAN=
DS && i =3D=3D 6)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (code =3D=
=3D ASM_INPUT && i =3D=3D 1))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& locator_eq =
(XINT (x, i), XINT (y, i)))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 case 'V':
>> -@@ -549,7 +557,15 @@
>> - =C2=A0 =C2=A0 =C2=A0 case 'n':
>> - =C2=A0 =C2=A0 =C2=A0 case 'i':
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (XINT (x, i) !=3D XINT (y, i))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+#ifndef GENERATOR_FILE
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (((code =3D=3D ASM_OPERAN=
DS && i =3D=3D 6)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (code =3D=
=3D ASM_INPUT && i =3D=3D 1))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& locator_eq =
(XINT (x, i), XINT (y, i)))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 case 'V':
>> -
>> -=3D=3D=3D added file 'gcc/testsuite/gcc.target/i386/pr46865-1.c'
>> ---- old/gcc/testsuite/gcc.target/i386/pr46865-1.c =C2=A0 =C2=A0 =C2=A01=
970-01-01
>> 00:00:00 +0000
>> -+++ new/gcc/testsuite/gcc.target/i386/pr46865-1.c =C2=A0 =C2=A0 =C2=A02=
010-12-13
>> 10:05:52 +0000
>> -@@ -0,0 +1,31 @@
>> -+/* PR rtl-optimization/46865 */
>> -+/* { dg-do compile } */
>> -+/* { dg-options "-O2" } */
>> -+
>> -+extern unsigned long f;
>> -+
>> -+#define m1(f) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> -+ =C2=A0if (f & 1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n"); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0else =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n");
>> -+
>> -+#define m2(f) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> -+ =C2=A0if (f & 1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx"); =
=C2=A0 \
>> -+ =C2=A0else =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");
>> -+
>> -+void
>> -+foo (void)
>> -+{
>> -+ =C2=A0m1 (f);
>> -+}
>> -+
>> -+void
>> -+bar (void)
>> -+{
>> -+ =C2=A0m2 (f);
>> -+}
>> -+
>> -+/* { dg-final { scan-assembler-times "asmnop" 2 } } */
>> -
>> -=3D=3D=3D added file 'gcc/testsuite/gcc.target/i386/pr46865-2.c'
>> ---- old/gcc/testsuite/gcc.target/i386/pr46865-2.c =C2=A0 =C2=A0 =C2=A01=
970-01-01
>> 00:00:00 +0000
>> -+++ new/gcc/testsuite/gcc.target/i386/pr46865-2.c =C2=A0 =C2=A0 =C2=A02=
010-12-13
>> 10:05:52 +0000
>> -@@ -0,0 +1,32 @@
>> -+/* PR rtl-optimization/46865 */
>> -+/* { dg-do compile } */
>> -+/* { dg-options "-O2 -save-temps" } */
>> -+
>> -+extern unsigned long f;
>> -+
>> -+#define m1(f) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> -+ =C2=A0if (f & 1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n"); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0else =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n");
>> -+
>> -+#define m2(f) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> -+ =C2=A0if (f & 1) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx"); =
=C2=A0 \
>> -+ =C2=A0else =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0\
>> -+ =C2=A0 =C2=A0asm volatile ("nop /* asmnop */\n" : : "i" (6) : "cx");
>> -+
>> -+void
>> -+foo (void)
>> -+{
>> -+ =C2=A0m1 (f);
>> -+}
>> -+
>> -+void
>> -+bar (void)
>> -+{
>> -+ =C2=A0m2 (f);
>> -+}
>> -+
>> -+/* { dg-final { scan-assembler-times "asmnop" 2 } } */
>> -+/* { dg-final { cleanup-saved-temps } } */
>> -
>> diff --git a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
>> b/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
>> deleted file mode 100644
>> index 35f98d2..0000000
>> --- a/recipes/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99456.patch
>> +++ /dev/null
>> @@ -1,3163 +0,0 @@
>> -2011-01-03 =C2=A0Bernd Schmidt =C2=A0<bernds@codesourcery.com>
>> -
>> - =C2=A0 =C2=A0 =C2=A0 gcc/
>> - =C2=A0 =C2=A0 =C2=A0 * doc/tm.texi (RETURN_ADDR_REGNUM): Document.
>> - =C2=A0 =C2=A0 =C2=A0 * doc/md.texi (simple_return): Document pattern.
>> - =C2=A0 =C2=A0 =C2=A0 (return): Add a sentence to clarify.
>> - =C2=A0 =C2=A0 =C2=A0 * doc/rtl.texi (simple_return): Document.
>> - =C2=A0 =C2=A0 =C2=A0 * doc/invoke.texi (Optimize Options): Document -f=
shrink-wrap.
>> - =C2=A0 =C2=A0 =C2=A0 * common.opt (fshrink-wrap): New.
>> - =C2=A0 =C2=A0 =C2=A0 * opts.c (decode_options): Set it for -O2 and abo=
ve.
>> - =C2=A0 =C2=A0 =C2=A0 * gengenrtl.c (special_rtx): PC, CC0, RETURN and =
SIMPLE_RETURN
>> - =C2=A0 =C2=A0 =C2=A0 are special.
>> - =C2=A0 =C2=A0 =C2=A0 * rtl.h (ANY_RETURN_P): New macro.
>> - =C2=A0 =C2=A0 =C2=A0 (global_rtl_index): Add GR_RETURN and GR_SIMPLE_R=
ETURN.
>> - =C2=A0 =C2=A0 =C2=A0 (ret_rtx, simple_return_rtx): New macros.
>> - =C2=A0 =C2=A0 =C2=A0 * genemit.c (gen_exp): RETURN and SIMPLE_RETURN h=
ave unique rtxs.
>> - =C2=A0 =C2=A0 =C2=A0 (gen_expand, gen_split): Use ANY_RETURN_P.
>> - =C2=A0 =C2=A0 =C2=A0 * rtl.c (copy_rtx): RETURN and SIMPLE_RETURN are =
shared.
>> - =C2=A0 =C2=A0 =C2=A0 * emit-rtl.c (verify_rtx_sharing): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (skip_consecutive_labels): Return the argument if=
 it is a return
>> rtx.
>> - =C2=A0 =C2=A0 =C2=A0 (classify_insn): Handle both kinds of return.
>> - =C2=A0 =C2=A0 =C2=A0 (init_emit_regs): Create global rtl for ret_rtx a=
nd
>> simple_return_rtx.
>> - =C2=A0 =C2=A0 =C2=A0 * df-scan.c (df_uses_record): Handle SIMPLE_RETUR=
N.
>> - =C2=A0 =C2=A0 =C2=A0 * rtl.def (SIMPLE_RETURN): New.
>> - =C2=A0 =C2=A0 =C2=A0 * rtlanal.c (tablejump_p): Check JUMP_LABEL for r=
eturns.
>> - =C2=A0 =C2=A0 =C2=A0 * final.c (final_scan_insn): Recognize both kinds=
 of return.
>> - =C2=A0 =C2=A0 =C2=A0 * reorg.c (function_return_label, function_simple=
_return_label):
>> New
>> - =C2=A0 =C2=A0 =C2=A0 static variables.
>> - =C2=A0 =C2=A0 =C2=A0 (end_of_function_label): Remove.
>> - =C2=A0 =C2=A0 =C2=A0 (simplejump_or_return_p): New static function.
>> - =C2=A0 =C2=A0 =C2=A0 (find_end_label): Add a new arg, KIND. =C2=A0All =
callers changed.
>> - =C2=A0 =C2=A0 =C2=A0 Depending on KIND, look for a label suitable for =
return or
>> - =C2=A0 =C2=A0 =C2=A0 simple_return.
>> - =C2=A0 =C2=A0 =C2=A0 (make_return_insns): Make corresponding changes.
>> - =C2=A0 =C2=A0 =C2=A0 (get_jump_flags): Check JUMP_LABELs for returns.
>> - =C2=A0 =C2=A0 =C2=A0 (follow_jumps): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (get_branch_condition): Check target for return p=
atterns rather
>> - =C2=A0 =C2=A0 =C2=A0 than NULL.
>> - =C2=A0 =C2=A0 =C2=A0 (own_thread_p): Likewise for thread.
>> - =C2=A0 =C2=A0 =C2=A0 (steal_delay_list_from_target): Check JUMP_LABELs=
 for returns.
>> - =C2=A0 =C2=A0 =C2=A0 Use simplejump_or_return_p.
>> - =C2=A0 =C2=A0 =C2=A0 (fill_simple_delay_slots): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (optimize_skip): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (fill_slots_from_thread): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (relax_delay_slots): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (dbr_schedule): Adjust handling of end_of_functio=
n_label for the
>> - =C2=A0 =C2=A0 =C2=A0 two new variables.
>> - =C2=A0 =C2=A0 =C2=A0 * ifcvt.c (find_if_case_1): Take care when redire=
cting jumps to
>> the
>> - =C2=A0 =C2=A0 =C2=A0 exit block.
>> - =C2=A0 =C2=A0 =C2=A0 (dead_or_predicable): Change NEW_DEST arg to DEST=
_EDGE. =C2=A0All
>> callers
>> - =C2=A0 =C2=A0 =C2=A0 changed. =C2=A0Ensure that the right label is pas=
sed to redirect_jump.
>> - =C2=A0 =C2=A0 =C2=A0 * jump.c (condjump_p, condjump_in_parallel_p, any=
_condjump_p,
>> - =C2=A0 =C2=A0 =C2=A0 returnjump_p): Handle SIMPLE_RETURNs.
>> - =C2=A0 =C2=A0 =C2=A0 (delete_related_insns): Check JUMP_LABEL for retu=
rns.
>> - =C2=A0 =C2=A0 =C2=A0 (redirect_target): New static function.
>> - =C2=A0 =C2=A0 =C2=A0 (redirect_exp_1): Use it. =C2=A0Handle any kind o=
f return rtx as a
>> label
>> - =C2=A0 =C2=A0 =C2=A0 rather than interpreting NULL as a return.
>> - =C2=A0 =C2=A0 =C2=A0 (redirect_jump_1): Assert that nlabel is not NULL=
.
>> - =C2=A0 =C2=A0 =C2=A0 (redirect_jump): Likewise.
>> - =C2=A0 =C2=A0 =C2=A0 (redirect_jump_2): Handle any kind of return rtx =
as a label rather
>> - =C2=A0 =C2=A0 =C2=A0 than interpreting NULL as a return.
>> - =C2=A0 =C2=A0 =C2=A0 * dwarf2out.c (compute_barrier_args_size_1): Chec=
k JUMP_LABEL for
>> - =C2=A0 =C2=A0 =C2=A0 returns.
>> - =C2=A0 =C2=A0 =C2=A0 * function.c (emit_return_into_block): Remove use=
less declaration.
>> - =C2=A0 =C2=A0 =C2=A0 (record_hard_reg_sets, frame_required_for_rtx, ge=
n_return_pattern,
>> - =C2=A0 =C2=A0 =C2=A0 requires_stack_frame_p): New static functions.
>> - =C2=A0 =C2=A0 =C2=A0 (emit_return_into_block): New arg SIMPLE_P. =C2=
=A0All callers changed.
>> - =C2=A0 =C2=A0 =C2=A0 Generate either kind of return pattern and update=
 the JUMP_LABEL.
>> - =C2=A0 =C2=A0 =C2=A0 (thread_prologue_and_epilogue_insns): Implement a=
 form of
>> - =C2=A0 =C2=A0 =C2=A0 shrink-wrapping. =C2=A0Ensure JUMP_LABELs for ret=
urn insns are set.
>> - =C2=A0 =C2=A0 =C2=A0 * print-rtl.c (print_rtx): Handle returns in JUMP=
_LABELs.
>> - =C2=A0 =C2=A0 =C2=A0 * cfglayout.c (fixup_reorder_chain): Ensure JUMP_=
LABELs for
>> returns
>> - =C2=A0 =C2=A0 =C2=A0 remain correct.
>> - =C2=A0 =C2=A0 =C2=A0 * resource.c (find_dead_or_set_registers): Check =
JUMP_LABELs for
>> - =C2=A0 =C2=A0 =C2=A0 returns.
>> - =C2=A0 =C2=A0 =C2=A0 (mark_target_live_regs): Don't pass a return rtx =
to
>> next_active_insn.
>> - =C2=A0 =C2=A0 =C2=A0 * basic-block.h (force_nonfallthru_and_redirect):=
 Declare.
>> - =C2=A0 =C2=A0 =C2=A0 * sched-vis.c (print_pattern): Add case for SIMPL=
E_RETURN.
>> - =C2=A0 =C2=A0 =C2=A0 * cfgrtl.c (force_nonfallthru_and_redirect): No l=
onger static.
>> =C2=A0New arg
>> - =C2=A0 =C2=A0 =C2=A0 JUMP_LABEL. =C2=A0All callers changed. =C2=A0Use =
the label when generating
>> - =C2=A0 =C2=A0 =C2=A0 return insns.
>> -
>> - =C2=A0 =C2=A0 =C2=A0 * config/i386/i386.md (returns, return_str, retur=
n_cond): New
>> - =C2=A0 =C2=A0 =C2=A0 code_iterator and corresponding code_attrs.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return): Renamed from return and ada=
pted.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return_internal): Likewise for retur=
n_internal.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return_internal_long): Likewise for
>> return_internal_long.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return_pop_internal): Likewise for
>> return_pop_internal.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return_indirect_internal): Likewise =
for
>> - =C2=A0 =C2=A0 =C2=A0 return_indirect_internal.
>> - =C2=A0 =C2=A0 =C2=A0 * config/i386/i386.c (ix86_expand_epilogue): Expa=
nd a
>> simple_return as
>> - =C2=A0 =C2=A0 =C2=A0 the last insn.
>> - =C2=A0 =C2=A0 =C2=A0 (ix86_pad_returns): Handle both kinds of return r=
tx.
>> - =C2=A0 =C2=A0 =C2=A0 * config/arm/arm.c (use_simple_return_p): new fun=
ction.
>> - =C2=A0 =C2=A0 =C2=A0 (is_jump_table): Handle returns in JUMP_LABELs.
>> - =C2=A0 =C2=A0 =C2=A0 (output_return_instruction): New arg SIMPLE. =C2=
=A0All callers changed.
>> - =C2=A0 =C2=A0 =C2=A0 Use it to determine which kind of return to gener=
ate.
>> - =C2=A0 =C2=A0 =C2=A0 (arm_final_prescan_insn): Handle both kinds of re=
turn.
>> - =C2=A0 =C2=A0 =C2=A0 * config/arm/arm.md (returns, return_str, return_=
simple_p,
>> - =C2=A0 =C2=A0 =C2=A0 return_cond): New code_iterator and corresponding=
 code_attrs.
>> - =C2=A0 =C2=A0 =C2=A0 (<return_str>return): Renamed from return and ada=
pted.
>> - =C2=A0 =C2=A0 =C2=A0 (arm_<return_str>return): Renamed from arm_return=
 and adapted.
>> - =C2=A0 =C2=A0 =C2=A0 (cond_<return_str>return): Renamed from cond_retu=
rn and adapted.
>> - =C2=A0 =C2=A0 =C2=A0 (cond_<return_str>return_inverted): Renamed from
>> cond_return_inverted
>> - =C2=A0 =C2=A0 =C2=A0 and adapted.
>> - =C2=A0 =C2=A0 =C2=A0 (epilogue): Use ret_rtx instead of gen_rtx_RETURN=
.
>> - =C2=A0 =C2=A0 =C2=A0 * config/arm/thumb2.md (thumb2_<return_str>return=
): Renamed from
>> - =C2=A0 =C2=A0 =C2=A0 thumb2_return and adapted.
>> - =C2=A0 =C2=A0 =C2=A0 * config/arm/arm.h (RETURN_ADDR_REGNUM): Define.
>> - =C2=A0 =C2=A0 =C2=A0 * config/arm/arm-protos.h (use_simple_return_p): =
Declare.
>> - =C2=A0 =C2=A0 =C2=A0 (output_return_instruction): Adjust declaration.
>> - =C2=A0 =C2=A0 =C2=A0 * config/mips/mips.c (mips_expand_epilogue): Gene=
rate a
>> simple_return
>> - =C2=A0 =C2=A0 =C2=A0 as final insn.
>> - =C2=A0 =C2=A0 =C2=A0 * config/mips/mips.md (simple_return): New expand=
er.
>> - =C2=A0 =C2=A0 =C2=A0 (*simple_return, simple_return_internal): New pat=
terns.
>> - =C2=A0 =C2=A0 =C2=A0 * config/sh/sh.c (barrier_align): Handle return i=
n a JUMP_LABEL.
>> - =C2=A0 =C2=A0 =C2=A0 (split_branches): Don't pass a null label to redi=
rect_jump.
>> -
>> - =C2=A0 =C2=A0 =C2=A0 From mainline:
>> - =C2=A0 =C2=A0 =C2=A0 * vec.h (FOR_EACH_VEC_ELT, FOR_EACH_VEC_ELT_REVER=
SE): New macros.
>> - =C2=A0 =C2=A0 =C2=A0 * haifa-sched.c (find_fallthru_edge_from): Rename=
 from
>> - =C2=A0 =C2=A0 =C2=A0 find_fallthru_edge. =C2=A0All callers changed.
>> - =C2=A0 =C2=A0 =C2=A0 * sched-int.h (find_fallthru_edge_from): Rename d=
eclaration as
>> well.
>> - =C2=A0 =C2=A0 =C2=A0 * basic-block.h (find_fallthru_edge): New inline =
function.
>> -
>> -=3D=3D=3D modified file 'gcc/basic-block.h'
>> ---- old/gcc/basic-block.h =C2=A0 =C2=A0 =C2=A02010-09-01 13:29:58 +0000
>> -+++ new/gcc/basic-block.h =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 +0000
>> -@@ -884,6 +884,7 @@
>> -
>> - /* In cfgrtl.c =C2=A0*/
>> - extern basic_block force_nonfallthru (edge);
>> -+extern basic_block force_nonfallthru_and_redirect (edge, basic_block,
>> rtx);
>> - extern rtx block_label (basic_block);
>> - extern bool purge_all_dead_edges (void);
>> - extern bool purge_dead_edges (basic_block);
>> -@@ -1004,6 +1005,20 @@
>> - =C2=A0 return false;
>> - }
>> -
>> -+/* Return the fallthru edge in EDGES if it exists, NULL otherwise. =C2=
=A0*/
>> -+static inline edge
>> -+find_fallthru_edge (VEC(edge,gc) *edges)
>> -+{
>> -+ =C2=A0edge e;
>> -+ =C2=A0edge_iterator ei;
>> -+
>> -+ =C2=A0FOR_EACH_EDGE (e, ei, edges)
>> -+ =C2=A0 =C2=A0if (e->flags & EDGE_FALLTHRU)
>> -+ =C2=A0 =C2=A0 =C2=A0break;
>> -+
>> -+ =C2=A0return e;
>> -+}
>> -+
>> - /* In cfgloopmanip.c. =C2=A0*/
>> - extern edge mfb_kj_edge;
>> - extern bool mfb_keep_just (edge);
>> -
>> -=3D=3D=3D modified file 'gcc/cfganal.c'
>> ---- old/gcc/cfganal.c =C2=A02009-11-25 10:55:54 +0000
>> -+++ new/gcc/cfganal.c =C2=A02011-01-05 12:12:18 +0000
>> -@@ -271,6 +271,37 @@
>> - =C2=A0 =C2=A0 =C2=A0 EDGE_SUCC (bb, 0)->flags |=3D EDGE_CAN_FALLTHRU;
>> - =C2=A0 =C2=A0 =C2=A0 EDGE_SUCC (bb, 1)->flags |=3D EDGE_CAN_FALLTHRU;
>> - =C2=A0 =C2=A0 }
>> -+ =C2=A0/* dwarf2out expects that a NOTE_INSN_EPILOGUE_BEGIN is always =
paired
>> -+ =C2=A0 =C2=A0 with a return or a sibcall. =C2=A0Ensure that this rema=
ins the case if
>> -+ =C2=A0 =C2=A0 they are in different basic blocks. =C2=A0*/
>> -+ =C2=A0FOR_EACH_BB (bb)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0edge e;
>> -+ =C2=A0 =C2=A0 =C2=A0edge_iterator ei;
>> -+ =C2=A0 =C2=A0 =C2=A0rtx insn, end;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0end =3D BB_END (bb);
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_BB_INSNS (bb, insn)
>> -+ =C2=A0 =C2=A0 =C2=A0if (GET_CODE (insn) =3D=3D NOTE
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& NOTE_KIND (insn) =3D=3D NOTE_INS=
N_EPILOGUE_BEG
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !(CALL_P (end) && SIBLING_CALL_P=
 (end))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !returnjump_p (end))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block other_bb =3D NULL;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, bb->succs)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e->flags & EDGE_F=
ALLTHRU)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0other_bb =3D e=
->dest;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e->flags &=3D =
~EDGE_CAN_FALLTHRU;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, other_bb->pre=
ds)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!(e->flags & EDGE=
_FALLTHRU))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e->flags &=3D =
~EDGE_CAN_FALLTHRU;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0}
>> - }
>> -
>> - /* Find unreachable blocks. =C2=A0An unreachable block will have 0 in
>> -
>> -=3D=3D=3D modified file 'gcc/cfglayout.c'
>> ---- old/gcc/cfglayout.c =C2=A0 =C2=A0 =C2=A0 =C2=A02010-05-17 16:30:54 =
+0000
>> -+++ new/gcc/cfglayout.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 =
+0000
>> -@@ -766,6 +766,7 @@
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 edge e_fall, e_taken, e;
>> - =C2=A0 =C2=A0 =C2=A0 rtx bb_end_insn;
>> -+ =C2=A0 =C2=A0 =C2=A0rtx ret_label =3D NULL_RTX;
>> - =C2=A0 =C2=A0 =C2=A0 basic_block nb;
>> - =C2=A0 =C2=A0 =C2=A0 edge_iterator ei;
>> -
>> -@@ -785,6 +786,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 bb_end_insn =3D BB_END (bb);
>> - =C2=A0 =C2=A0 =C2=A0 if (JUMP_P (bb_end_insn))
>> - =C2=A0 =C2=A0 =C2=A0 {
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret_label =3D JUMP_LABEL (bb_end_insn);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (any_condjump_p (bb_end_insn))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* This might happen if the =
conditional jump has side
>> -@@ -899,7 +901,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 =C2=A0 /* We got here if we need to add a new jump insn.=
 =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0nb =3D force_nonfallthru (e_fall);
>> -+ =C2=A0 =C2=A0 =C2=A0nb =3D force_nonfallthru_and_redirect (e_fall, e_=
fall->dest,
>> ret_label);
>> - =C2=A0 =C2=A0 =C2=A0 if (nb)
>> - =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 nb->il.rtl->visited =3D 1;
>> -@@ -1118,24 +1120,30 @@
>> - bool
>> - cfg_layout_can_duplicate_bb_p (const_basic_block bb)
>> - {
>> -+ =C2=A0rtx insn;
>> -+
>> - =C2=A0 /* Do not attempt to duplicate tablejumps, as we need to unshar=
e
>> - =C2=A0 =C2=A0 =C2=A0the dispatch table. =C2=A0This is difficult to do,=
 as the instructions
>> - =C2=A0 =C2=A0 =C2=A0computing jump destination may be hoisted outside =
the basic block.
>> =C2=A0*/
>> - =C2=A0 if (tablejump_p (BB_END (bb), NULL, NULL))
>> - =C2=A0 =C2=A0 return false;
>> -
>> -- =C2=A0/* Do not duplicate blocks containing insns that can't be copie=
d. =C2=A0*/
>> -- =C2=A0if (targetm.cannot_copy_insn_p)
>> -+ =C2=A0insn =3D BB_HEAD (bb);
>> -+ =C2=A0while (1)
>> - =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0rtx insn =3D BB_HEAD (bb);
>> -- =C2=A0 =C2=A0 =C2=A0while (1)
>> -- =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (INSN_P (insn) && targetm.cannot_copy_i=
nsn_p (insn))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (insn =3D=3D BB_END (bb))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0insn =3D NEXT_INSN (insn);
>> -- =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0/* Do not duplicate blocks containing insns that =
can't be copied.
>> =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0if (INSN_P (insn) && targetm.cannot_copy_insn_p
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& targetm.cannot_copy_insn_p (insn))
>> -+ =C2=A0 =C2=A0 =C2=A0return false;
>> -+ =C2=A0 =C2=A0 =C2=A0/* dwarf2out expects that these notes are always =
paired with a
>> -+ =C2=A0 =C2=A0 =C2=A0 returnjump or sibling call. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0if (NOTE_P (insn) && NOTE_KIND (insn) =3D=3D NOTE=
_INSN_EPILOGUE_BEG
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !returnjump_p (BB_END (bb))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& (!CALL_P (BB_END (bb)) || !SIBLING_CALL=
_P (BB_END (bb))))
>> -+ =C2=A0 =C2=A0 =C2=A0return false;
>> -+ =C2=A0 =C2=A0 =C2=A0if (insn =3D=3D BB_END (bb))
>> -+ =C2=A0 =C2=A0 =C2=A0break;
>> -+ =C2=A0 =C2=A0 =C2=A0insn =3D NEXT_INSN (insn);
>> - =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 return true;
>> -@@ -1167,6 +1175,9 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || GET_CODE (PATTERN (insn))=
 =3D=3D ADDR_DIFF_VEC)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 copy =3D emit_copy_of_insn_after (insn, ge=
t_last_insn ());
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (JUMP_P (insn) && JUMP_LABEL (insn) !=
=3D NULL_RTX
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& ANY_RETURN_P (JUMP_LABEL =
(insn)))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JUMP_LABEL (copy) =3D JUMP_LABEL (i=
nsn);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 maybe_copy_epilogue_insn (insn, cop=
y);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> -
>> -
>> -=3D=3D=3D modified file 'gcc/cfgrtl.c'
>> ---- old/gcc/cfgrtl.c =C2=A0 2010-09-20 21:30:35 +0000
>> -+++ new/gcc/cfgrtl.c =C2=A0 2011-01-05 12:12:18 +0000
>> -@@ -1107,10 +1107,13 @@
>> - }
>> -
>> - /* Like force_nonfallthru below, but additionally performs redirection
>> -- =C2=A0 Used by redirect_edge_and_branch_force. =C2=A0*/
>> -+ =C2=A0 Used by redirect_edge_and_branch_force. =C2=A0JUMP_LABEL is us=
ed only
>> -+ =C2=A0 when redirecting to the EXIT_BLOCK, it is either a return or a
>> -+ =C2=A0 simple_return rtx indicating which kind of returnjump to creat=
e.
>> -+ =C2=A0 It should be NULL otherwise. =C2=A0*/
>> -
>> --static basic_block
>> --force_nonfallthru_and_redirect (edge e, basic_block target)
>> -+basic_block
>> -+force_nonfallthru_and_redirect (edge e, basic_block target, rtx
>> jump_label)
>> - {
>> - =C2=A0 basic_block jump_block, new_bb =3D NULL, src =3D e->src;
>> - =C2=A0 rtx note;
>> -@@ -1242,11 +1245,25 @@
>> - =C2=A0 e->flags &=3D ~EDGE_FALLTHRU;
>> - =C2=A0 if (target =3D=3D EXIT_BLOCK_PTR)
>> - =C2=A0 =C2=A0 {
>> -+ =C2=A0 =C2=A0 =C2=A0if (jump_label =3D=3D ret_rtx)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> - #ifdef HAVE_return
>> -- =C2=A0 =C2=A0 =C2=A0emit_jump_insn_after_setloc (gen_return (), BB_EN=
D (jump_block),
>> loc);
>> --#else
>> -- =C2=A0 =C2=A0 =C2=A0gcc_unreachable ();
>> --#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn_after_setloc (gen_return ()=
, BB_END (jump_block),
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loc);
>> -+#else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_unreachable ();
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (jump_label =3D=3D simple_retur=
n_rtx);
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn_after_setloc (gen_simple_re=
turn (),
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BB_END (jump_block=
), loc);
>> -+#else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_unreachable ();
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> - =C2=A0 =C2=A0 }
>> - =C2=A0 else
>> - =C2=A0 =C2=A0 {
>> -@@ -1273,7 +1290,7 @@
>> - basic_block
>> - force_nonfallthru (edge e)
>> - {
>> -- =C2=A0return force_nonfallthru_and_redirect (e, e->dest);
>> -+ =C2=A0return force_nonfallthru_and_redirect (e, e->dest, NULL_RTX);
>> - }
>> -
>> - /* Redirect edge even at the expense of creating new jump insn or
>> -@@ -1290,7 +1307,7 @@
>> - =C2=A0 /* In case the edge redirection failed, try to force it to be
>> non-fallthru
>> - =C2=A0 =C2=A0 =C2=A0and redirect newly created simplejump. =C2=A0*/
>> - =C2=A0 df_set_bb_dirty (e->src);
>> -- =C2=A0return force_nonfallthru_and_redirect (e, target);
>> -+ =C2=A0return force_nonfallthru_and_redirect (e, target, NULL_RTX);
>> - }
>> -
>> - /* The given edge should potentially be a fallthru edge. =C2=A0If that=
 is in
>> -
>> -=3D=3D=3D modified file 'gcc/common.opt'
>> ---- old/gcc/common.opt 2010-12-10 15:33:37 +0000
>> -+++ new/gcc/common.opt 2011-01-05 12:12:18 +0000
>> -@@ -1147,6 +1147,11 @@
>> - Common C ObjC C++ ObjC++ Report Var(flag_show_column) Init(1)
>> - Show column numbers in diagnostics, when available. =C2=A0Default on
>> -
>> -+fshrink-wrap
>> -+Common Report Var(flag_shrink_wrap) Optimization
>> -+Emit function prologues only before parts of the function that need it=
,
>> -+rather than at the top of the function.
>> -+
>> - fsignaling-nans
>> - Common Report Var(flag_signaling_nans) Optimization
>> - Disable optimizations observable by IEEE signaling NaNs
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm-protos.h'
>> ---- old/gcc/config/arm/arm-protos.h =C2=A0 =C2=A02010-11-04 10:45:05 +0=
000
>> -+++ new/gcc/config/arm/arm-protos.h =C2=A0 =C2=A02011-01-05 12:12:18 +0=
000
>> -@@ -26,6 +26,7 @@
>> - extern void arm_override_options (void);
>> - extern void arm_optimization_options (int, int);
>> - extern int use_return_insn (int, rtx);
>> -+extern bool use_simple_return_p (void);
>> - extern enum reg_class arm_regno_class (int);
>> - extern void arm_load_pic_register (unsigned long);
>> - extern int arm_volatile_func (void);
>> -@@ -137,7 +138,7 @@
>> - extern const char *output_add_immediate (rtx *);
>> - extern const char *arithmetic_instr (rtx, int);
>> - extern void output_ascii_pseudo_op (FILE *, const unsigned char *, int=
);
>> --extern const char *output_return_instruction (rtx, int, int);
>> -+extern const char *output_return_instruction (rtx, bool, bool, bool);
>> - extern void arm_poke_function_name (FILE *, const char *);
>> - extern void arm_print_operand (FILE *, rtx, int);
>> - extern void arm_print_operand_address (FILE *, rtx);
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.c'
>> ---- old/gcc/config/arm/arm.c =C2=A0 2011-01-05 11:32:50 +0000
>> -+++ new/gcc/config/arm/arm.c =C2=A0 2011-01-05 12:12:18 +0000
>> -@@ -2163,6 +2163,18 @@
>> - =C2=A0 return addr;
>> - }
>> -
>> -+/* Return true if we should try to use a simple_return insn, i.e.
>> perform
>> -+ =C2=A0 shrink-wrapping if possible. =C2=A0This is the case if we need=
 to emit a
>> -+ =C2=A0 prologue, which we can test by looking at the offsets. =C2=A0*=
/
>> -+bool
>> -+use_simple_return_p (void)
>> -+{
>> -+ =C2=A0arm_stack_offsets *offsets;
>> -+
>> -+ =C2=A0offsets =3D arm_get_frame_offsets ();
>> -+ =C2=A0return offsets->outgoing_args !=3D 0;
>> -+}
>> -+
>> - /* Return 1 if it is possible to return using a single instruction.
>> - =C2=A0 =C2=A0If SIBLING is non-null, this is a test for a return befor=
e a sibling
>> - =C2=A0 =C2=A0call. =C2=A0SIBLING is the call insn, so we can examine i=
ts register
>> usage. =C2=A0*/
>> -@@ -11284,6 +11296,7 @@
>> -
>> - =C2=A0 if (GET_CODE (insn) =3D=3D JUMP_INSN
>> - =C2=A0 =C2=A0 =C2=A0 && JUMP_LABEL (insn) !=3D NULL
>> -+ =C2=A0 =C2=A0 =C2=A0&& !ANY_RETURN_P (JUMP_LABEL (insn))
>> - =C2=A0 =C2=A0 =C2=A0 && ((table =3D next_real_insn (JUMP_LABEL (insn))=
)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D next_real_insn (insn))
>> - =C2=A0 =C2=A0 =C2=A0 && table !=3D NULL
>> -@@ -14168,7 +14181,7 @@
>> - /* Generate a function exit sequence. =C2=A0If REALLY_RETURN is false,=
 then
>> do
>> - =C2=A0 =C2=A0everything bar the final return instruction. =C2=A0*/
>> - const char *
>> --output_return_instruction (rtx operand, int really_return, int reverse=
)
>> -+output_return_instruction (rtx operand, bool really_return, bool
>> reverse, bool simple)
>> - {
>> - =C2=A0 char conditional[10];
>> - =C2=A0 char instr[100];
>> -@@ -14206,10 +14219,15 @@
>> -
>> - =C2=A0 sprintf (conditional, "%%?%%%c0", reverse ? 'D' : 'd');
>> -
>> -- =C2=A0cfun->machine->return_used_this_function =3D 1;
>> -+ =C2=A0if (simple)
>> -+ =C2=A0 =C2=A0live_regs_mask =3D 0;
>> -+ =C2=A0else
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0cfun->machine->return_used_this_function =3D 1;
>> -
>> -- =C2=A0offsets =3D arm_get_frame_offsets ();
>> -- =C2=A0live_regs_mask =3D offsets->saved_regs_mask;
>> -+ =C2=A0 =C2=A0 =C2=A0offsets =3D arm_get_frame_offsets ();
>> -+ =C2=A0 =C2=A0 =C2=A0live_regs_mask =3D offsets->saved_regs_mask;
>> -+ =C2=A0 =C2=A0}
>> -
>> - =C2=A0 if (live_regs_mask)
>> - =C2=A0 =C2=A0 {
>> -@@ -17108,6 +17126,7 @@
>> -
>> - =C2=A0 /* If we start with a return insn, we only succeed if we find a=
nother
>> one. =C2=A0*/
>> - =C2=A0 int seeking_return =3D 0;
>> -+ =C2=A0enum rtx_code return_code =3D UNKNOWN;
>> -
>> - =C2=A0 /* START_INSN will hold the insn from where we start looking. =
=C2=A0This is
>> the
>> - =C2=A0 =C2=A0 =C2=A0first insn after the following code_label if REVER=
SE is true. =C2=A0*/
>> -@@ -17146,7 +17165,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -- =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (body) =3D=3D RETURN)
>> -+ =C2=A0 =C2=A0 =C2=A0else if (ANY_RETURN_P (body))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 start_insn =3D next_nonnote_insn (start_in=
sn);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (start_insn) =3D=3D BARRIER)
>> -@@ -17157,6 +17176,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reverse =3D TRUE;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 seeking_return =3D 1;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return_code =3D GET_CODE (bo=
dy);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> -@@ -17197,11 +17217,15 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 label =3D XEXP (XEXP (SET_SRC (body), 2), =
0);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 then_not_else =3D FALSE;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -- =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (XEXP (SET_SRC (body), 1)) =3D=
=3D RETURN)
>> -- =C2=A0 =C2=A0 =C2=A0seeking_return =3D 1;
>> -- =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (XEXP (SET_SRC (body), 2)) =3D=
=3D RETURN)
>> -+ =C2=A0 =C2=A0 =C2=A0else if (ANY_RETURN_P (XEXP (SET_SRC (body), 1)))
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0seeking_return =3D 1;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return_code =3D GET_CODE (XEXP (SET_SRC (b=
ody), 1));
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0else if (ANY_RETURN_P (XEXP (SET_SRC (body), 2)))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 seeking_return =3D 1;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0return_code =3D GET_CODE (XEXP (SET_SRC (b=
ody), 2));
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 then_not_else =3D FALSE;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 else
>> -@@ -17302,8 +17326,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&& !use_return_insn (TRUE, NULL)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&& !optimize_size)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fail =3D TRUE;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (scanbody)=
 =3D=3D RETURN
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 && seeking_return)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (scanbody)=
 =3D=3D return_code)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_ccfsm_stat=
e =3D 2;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 succeed =3D TR=
UE;
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.h'
>> ---- old/gcc/config/arm/arm.h =C2=A0 2010-11-11 11:12:14 +0000
>> -+++ new/gcc/config/arm/arm.h =C2=A0 2011-01-05 12:12:18 +0000
>> -@@ -2622,6 +2622,8 @@
>> - #define RETURN_ADDR_RTX(COUNT, FRAME) \
>> - =C2=A0 arm_return_addr (COUNT, FRAME)
>> -
>> -+#define RETURN_ADDR_REGNUM LR_REGNUM
>> -+
>> - /* Mask of the bits in the PC that contain the real return address
>> - =C2=A0 =C2=A0when running in 26-bit mode. =C2=A0*/
>> - #define RETURN_ADDR_MASK26 (0x03fffffc)
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/arm.md'
>> ---- old/gcc/config/arm/arm.md =C2=A02011-01-05 11:52:16 +0000
>> -+++ new/gcc/config/arm/arm.md =C2=A02011-01-05 12:12:18 +0000
>> -@@ -8882,66 +8882,72 @@
>> - =C2=A0 [(set_attr "type" "call")]
>> - )
>> -
>> --(define_expand "return"
>> -- =C2=A0[(return)]
>> -- =C2=A0"TARGET_32BIT && USE_RETURN_INSN (FALSE)"
>> -+;; Both kinds of return insn.
>> -+(define_code_iterator returns [return simple_return])
>> -+(define_code_attr return_str [(return "") (simple_return "simple_")])
>> -+(define_code_attr return_simple_p [(return "false") (simple_return
>> "true")])
>> -+(define_code_attr return_cond [(return " && USE_RETURN_INSN (FALSE)")
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (simple_return " && use_simple_return_p
>> ()")])
>> -+
>> -+(define_expand "<return_str>return"
>> -+ =C2=A0[(returns)]
>> -+ =C2=A0"TARGET_32BIT<return_cond>"
>> - =C2=A0 "")
>> -
>> --;; Often the return insn will be the same as loading from memory, so s=
et
>> attr
>> --(define_insn "*arm_return"
>> -- =C2=A0[(return)]
>> -- =C2=A0"TARGET_ARM && USE_RETURN_INSN (FALSE)"
>> -- =C2=A0"*
>> -- =C2=A0{
>> -- =C2=A0 =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -- =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return \"\";
>> -- =C2=A0 =C2=A0 =C2=A0}
>> -- =C2=A0 =C2=A0return output_return_instruction (const_true_rtx, TRUE, =
FALSE);
>> -- =C2=A0}"
>> -+(define_insn "*arm_<return_str>return"
>> -+ =C2=A0[(returns)]
>> -+ =C2=A0"TARGET_ARM<return_cond>"
>> -+{
>> -+ =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -+ =C2=A0 =C2=A0 =C2=A0return "";
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0return output_return_instruction (const_true_rtx, true, false,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<return_simple_p>);
>> -+}
>> - =C2=A0 [(set_attr "type" "load1")
>> - =C2=A0 =C2=A0(set_attr "length" "12")
>> - =C2=A0 =C2=A0(set_attr "predicable" "yes")]
>> - )
>> -
>> --(define_insn "*cond_return"
>> -+(define_insn "*cond_<return_str>return"
>> - =C2=A0 [(set (pc)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 (if_then_else (match_operator 0 "arm_compa=
rison_operator"
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[(match_operand 1 "cc_register" "") (const_int 0)])
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(return)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0(returns)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (pc)))]
>> -- =C2=A0"TARGET_ARM && USE_RETURN_INSN (TRUE)"
>> -- =C2=A0"*
>> -- =C2=A0{
>> -- =C2=A0 =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -- =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return \"\";
>> -- =C2=A0 =C2=A0 =C2=A0}
>> -- =C2=A0 =C2=A0return output_return_instruction (operands[0], TRUE, FAL=
SE);
>> -- =C2=A0}"
>> -+ =C2=A0"TARGET_ARM<return_cond>"
>> -+{
>> -+ =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -+ =C2=A0 =C2=A0 =C2=A0return "";
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0return output_return_instruction (operands[0], true, false,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<return_simple_p>);
>> -+}
>> - =C2=A0 [(set_attr "conds" "use")
>> - =C2=A0 =C2=A0(set_attr "length" "12")
>> - =C2=A0 =C2=A0(set_attr "type" "load1")]
>> - )
>> -
>> --(define_insn "*cond_return_inverted"
>> -+(define_insn "*cond_<return_str>return_inverted"
>> - =C2=A0 [(set (pc)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 (if_then_else (match_operator 0 "arm_compa=
rison_operator"
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0[(match_operand 1 "cc_register" "") (const_int 0)])
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (pc)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(return)))]
>> -- =C2=A0"TARGET_ARM && USE_RETURN_INSN (TRUE)"
>> -- =C2=A0"*
>> -- =C2=A0{
>> -- =C2=A0 =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -- =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0return \"\";
>> -- =C2=A0 =C2=A0 =C2=A0}
>> -- =C2=A0 =C2=A0return output_return_instruction (operands[0], TRUE, TRU=
E);
>> -- =C2=A0}"
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
(returns)))]
>> -+ =C2=A0"TARGET_ARM<return_cond>"
>> -+{
>> -+ =C2=A0if (arm_ccfsm_state =3D=3D 2)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0arm_ccfsm_state +=3D 2;
>> -+ =C2=A0 =C2=A0 =C2=A0return "";
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0return output_return_instruction (operands[0], true, true,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<return_simple_p>);
>> -+}
>> - =C2=A0 [(set_attr "conds" "use")
>> - =C2=A0 =C2=A0(set_attr "length" "12")
>> - =C2=A0 =C2=A0(set_attr "type" "load1")]
>> -@@ -10809,8 +10815,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 DONE;
>> - =C2=A0 =C2=A0 }
>> - =C2=A0 emit_jump_insn (gen_rtx_UNSPEC_VOLATILE (VOIDmode,
>> -- =C2=A0 =C2=A0 =C2=A0gen_rtvec (1,
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_rtx_RETURN (VOIDm=
ode)),
>> -+ =C2=A0 =C2=A0 =C2=A0gen_rtvec (1, ret_rtx),
>> - =C2=A0 =C2=A0 =C2=A0 VUNSPEC_EPILOGUE));
>> - =C2=A0 DONE;
>> - =C2=A0 "
>> -@@ -10827,7 +10832,7 @@
>> - =C2=A0 "TARGET_32BIT"
>> - =C2=A0 "*
>> - =C2=A0 if (use_return_insn (FALSE, next_nonnote_insn (insn)))
>> -- =C2=A0 =C2=A0return output_return_instruction (const_true_rtx, FALSE,=
 FALSE);
>> -+ =C2=A0 =C2=A0return output_return_instruction (const_true_rtx, false,=
 false,
>> false);
>> - =C2=A0 return arm_output_epilogue (next_nonnote_insn (insn));
>> - =C2=A0 "
>> - ;; Length is absolute worst case
>> -
>> -=3D=3D=3D modified file 'gcc/config/arm/thumb2.md'
>> ---- old/gcc/config/arm/thumb2.md =C2=A0 =C2=A0 =C2=A0 2010-09-22 05:54:=
42 +0000
>> -+++ new/gcc/config/arm/thumb2.md =C2=A0 =C2=A0 =C2=A0 2011-01-05 12:12:=
18 +0000
>> -@@ -1020,16 +1020,15 @@
>> -
>> - ;; Note: this is not predicable, to avoid issues with linker-generated
>> - ;; interworking stubs.
>> --(define_insn "*thumb2_return"
>> -- =C2=A0[(return)]
>> -- =C2=A0"TARGET_THUMB2 && USE_RETURN_INSN (FALSE)"
>> -- =C2=A0"*
>> -- =C2=A0{
>> -- =C2=A0 =C2=A0return output_return_instruction (const_true_rtx, TRUE, =
FALSE);
>> -- =C2=A0}"
>> -+(define_insn "*thumb2_<return_str>return"
>> -+ =C2=A0[(returns)]
>> -+ =C2=A0"TARGET_THUMB2<return_cond>"
>> -+{
>> -+ =C2=A0return output_return_instruction (const_true_rtx, true, false,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<return_simple_p>);
>> -+}
>> - =C2=A0 [(set_attr "type" "load1")
>> -- =C2=A0 (set_attr "length" "12")]
>> --)
>> -+ =C2=A0 (set_attr "length" "12")])
>> -
>> - (define_insn_and_split "thumb2_eh_return"
>> - =C2=A0 [(unspec_volatile [(match_operand:SI 0 "s_register_operand" "r"=
)]
>> -
>> -=3D=3D=3D modified file 'gcc/config/i386/i386.c'
>> ---- old/gcc/config/i386/i386.c 2010-11-16 18:05:53 +0000
>> -+++ new/gcc/config/i386/i386.c 2011-01-05 12:12:18 +0000
>> -@@ -9308,13 +9308,13 @@
>> -
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 pro_epilogue_adjust_stack (stack_pointer_r=
tx, stack_pointer_rtx,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0popc, -1, true);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_return_indirect_intern=
al (ecx));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_simple_return_indirect=
_internal (ecx));
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 else
>> -- =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_return_pop_internal (popc));
>> -+ =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_simple_return_pop_internal (p=
opc));
>> - =C2=A0 =C2=A0 }
>> - =C2=A0 else
>> -- =C2=A0 =C2=A0emit_jump_insn (gen_return_internal ());
>> -+ =C2=A0 =C2=A0emit_jump_insn (gen_simple_return_internal ());
>> -
>> - =C2=A0 /* Restore the state back to the state from the prologue,
>> - =C2=A0 =C2=A0 =C2=A0so that it's correct for the next epilogue. =C2=A0=
*/
>> -@@ -26596,7 +26596,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 rtx prev;
>> - =C2=A0 =C2=A0 =C2=A0 bool replace =3D false;
>> -
>> -- =C2=A0 =C2=A0 =C2=A0if (!JUMP_P (ret) || GET_CODE (PATTERN (ret)) !=
=3D RETURN
>> -+ =C2=A0 =C2=A0 =C2=A0if (!JUMP_P (ret) || !ANY_RETURN_P (PATTERN (ret)=
)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || optimize_bb_for_size_p (bb))
>> - =C2=A0 =C2=A0 =C2=A0 continue;
>> - =C2=A0 =C2=A0 =C2=A0 for (prev =3D PREV_INSN (ret); prev; prev =3D PRE=
V_INSN (prev))
>> -@@ -26626,7 +26626,10 @@
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 if (replace)
>> - =C2=A0 =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn_before (gen_return_internal=
_long (), ret);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (PATTERN (ret) =3D=3D ret_rtx)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn_before (gen_return_i=
nternal_long (), ret);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn_before (gen_simple_r=
eturn_internal_long (),
>> ret);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete_insn (ret);
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 }
>> -
>> -=3D=3D=3D modified file 'gcc/config/i386/i386.md'
>> ---- old/gcc/config/i386/i386.md =C2=A0 =C2=A0 =C2=A0 =C2=A02010-11-27 1=
5:24:12 +0000
>> -+++ new/gcc/config/i386/i386.md =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 1=
2:12:18 +0000
>> -@@ -13797,24 +13797,29 @@
>> - =C2=A0 ""
>> - =C2=A0 [(set_attr "length" "0")])
>> -
>> -+(define_code_iterator returns [return simple_return])
>> -+(define_code_attr return_str [(return "") (simple_return "simple_")])
>> -+(define_code_attr return_cond [(return "ix86_can_use_return_insn_p ()"=
)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (simple_return "")])
>> -+
>> - ;; Insn emitted into the body of a function to return from a function.
>> - ;; This is only done if the function's epilogue is known to be simple.
>> - ;; See comments for ix86_can_use_return_insn_p in i386.c.
>> -
>> --(define_expand "return"
>> -- =C2=A0[(return)]
>> -- =C2=A0"ix86_can_use_return_insn_p ()"
>> -+(define_expand "<return_str>return"
>> -+ =C2=A0[(returns)]
>> -+ =C2=A0"<return_cond>"
>> - {
>> - =C2=A0 if (crtl->args.pops_args)
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 rtx popc =3D GEN_INT (crtl->args.pops_args);
>> -- =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_return_pop_internal (popc));
>> -+ =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_<return_str>return_pop_intern=
al (popc));
>> - =C2=A0 =C2=A0 =C2=A0 DONE;
>> - =C2=A0 =C2=A0 }
>> - })
>> -
>> --(define_insn "return_internal"
>> -- =C2=A0[(return)]
>> -+(define_insn "<return_str>return_internal"
>> -+ =C2=A0[(returns)]
>> - =C2=A0 "reload_completed"
>> - =C2=A0 "ret"
>> - =C2=A0 [(set_attr "length" "1")
>> -@@ -13825,8 +13830,8 @@
>> - ;; Used by x86_machine_dependent_reorg to avoid penalty on single byte
>> RET
>> - ;; instruction Athlon and K8 have.
>> -
>> --(define_insn "return_internal_long"
>> -- =C2=A0[(return)
>> -+(define_insn "<return_str>return_internal_long"
>> -+ =C2=A0[(returns)
>> - =C2=A0 =C2=A0(unspec [(const_int 0)] UNSPEC_REP)]
>> - =C2=A0 "reload_completed"
>> - =C2=A0 "rep\;ret"
>> -@@ -13836,8 +13841,8 @@
>> - =C2=A0 =C2=A0(set_attr "prefix_rep" "1")
>> - =C2=A0 =C2=A0(set_attr "modrm" "0")])
>> -
>> --(define_insn "return_pop_internal"
>> -- =C2=A0[(return)
>> -+(define_insn "<return_str>return_pop_internal"
>> -+ =C2=A0[(returns)
>> - =C2=A0 =C2=A0(use (match_operand:SI 0 "const_int_operand" ""))]
>> - =C2=A0 "reload_completed"
>> - =C2=A0 "ret\t%0"
>> -@@ -13846,8 +13851,8 @@
>> - =C2=A0 =C2=A0(set_attr "length_immediate" "2")
>> - =C2=A0 =C2=A0(set_attr "modrm" "0")])
>> -
>> --(define_insn "return_indirect_internal"
>> -- =C2=A0[(return)
>> -+(define_insn "<return_str>return_indirect_internal"
>> -+ =C2=A0[(returns)
>> - =C2=A0 =C2=A0(use (match_operand:SI 0 "register_operand" "r"))]
>> - =C2=A0 "reload_completed"
>> - =C2=A0 "jmp\t%A0"
>> -
>> -=3D=3D=3D modified file 'gcc/config/mips/mips.c'
>> ---- old/gcc/config/mips/mips.c 2010-11-21 10:38:43 +0000
>> -+++ new/gcc/config/mips/mips.c 2011-01-05 12:12:18 +0000
>> -@@ -10497,7 +10497,8 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regno =3D GP_REG_FIRST + 7;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regno =3D RETURN_ADDR_REGNUM;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_return_internal (gen_r=
tx_REG (Pmode,
>> regno)));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_jump_insn (gen_simple_return_internal=
 (gen_rtx_REG (Pmode,
>> -+
>> regno)));
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 }
>> -
>> -
>> -=3D=3D=3D modified file 'gcc/config/mips/mips.md'
>> ---- old/gcc/config/mips/mips.md =C2=A0 =C2=A0 =C2=A0 =C2=A02010-04-02 1=
8:54:46 +0000
>> -+++ new/gcc/config/mips/mips.md =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 1=
2:12:18 +0000
>> -@@ -5815,6 +5815,18 @@
>> - =C2=A0 [(set_attr "type" =C2=A0 "jump")
>> - =C2=A0 =C2=A0(set_attr "mode" =C2=A0 "none")])
>> -
>> -+(define_expand "simple_return"
>> -+ =C2=A0[(simple_return)]
>> -+ =C2=A0"!mips_can_use_return_insn ()"
>> -+ =C2=A0{ mips_expand_before_return (); })
>> -+
>> -+(define_insn "*simple_return"
>> -+ =C2=A0[(simple_return)]
>> -+ =C2=A0"!mips_can_use_return_insn ()"
>> -+ =C2=A0"%*j\t$31%/"
>> -+ =C2=A0[(set_attr "type" =C2=A0 "jump")
>> -+ =C2=A0 (set_attr "mode" =C2=A0 "none")])
>> -+
>> - ;; Normal return.
>> -
>> - (define_insn "return_internal"
>> -@@ -5825,6 +5837,14 @@
>> - =C2=A0 [(set_attr "type" =C2=A0 "jump")
>> - =C2=A0 =C2=A0(set_attr "mode" =C2=A0 "none")])
>> -
>> -+(define_insn "simple_return_internal"
>> -+ =C2=A0[(simple_return)
>> -+ =C2=A0 (use (match_operand 0 "pmode_register_operand" ""))]
>> -+ =C2=A0""
>> -+ =C2=A0"%*j\t%0%/"
>> -+ =C2=A0[(set_attr "type" =C2=A0 "jump")
>> -+ =C2=A0 (set_attr "mode" =C2=A0 "none")])
>> -+
>> - ;; Exception return.
>> - (define_insn "mips_eret"
>> - =C2=A0 [(return)
>> -
>> -=3D=3D=3D modified file 'gcc/config/sh/sh.c'
>> ---- old/gcc/config/sh/sh.c =C2=A0 =C2=A0 2010-12-10 15:34:19 +0000
>> -+++ new/gcc/config/sh/sh.c =C2=A0 =C2=A0 2011-01-05 12:12:18 +0000
>> -@@ -5252,7 +5252,8 @@
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 if (prev
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 && JUMP_P (prev)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0&& JUMP_LABEL (prev))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& JUMP_LABEL (prev)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !ANY_RETURN_P (JUMP_LABEL (prev)))
>> - =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtx x;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (jump_to_next
>> -@@ -5951,7 +5952,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 JUMP_LABEL (insn) =3D far_label;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 LABEL_NUSES (far_label)++;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
}
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirec=
t_jump (insn, NULL_RTX, 1);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirec=
t_jump (insn, ret_rtx, 1);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 far_lab=
el =3D 0;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> -
>> -=3D=3D=3D modified file 'gcc/df-scan.c'
>> ---- old/gcc/df-scan.c =C2=A02010-11-16 22:17:17 +0000
>> -+++ new/gcc/df-scan.c =C2=A02011-01-05 12:12:18 +0000
>> -@@ -3296,6 +3296,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> - =C2=A0 =C2=A0 case RETURN:
>> -+ =C2=A0 =C2=A0case SIMPLE_RETURN:
>> - =C2=A0 =C2=A0 =C2=A0 break;
>> -
>> - =C2=A0 =C2=A0 case ASM_OPERANDS:
>> -
>> -=3D=3D=3D modified file 'gcc/doc/invoke.texi'
>> ---- old/gcc/doc/invoke.texi =C2=A0 =C2=A02010-11-04 14:29:09 +0000
>> -+++ new/gcc/doc/invoke.texi =C2=A0 =C2=A02011-01-05 12:12:18 +0000
>> -@@ -5750,6 +5750,7 @@
>> - -fipa-pure-const @gol
>> - -fipa-reference @gol
>> - -fmerge-constants
>> -+-fshrink-wrap @gol
>> - -fsplit-wide-types @gol
>> - -ftree-builtin-call-dce @gol
>> - -ftree-ccp @gol
>> -@@ -6504,6 +6505,12 @@
>> - When pipelining loops during selective scheduling, also pipeline outer
>> loops.
>> - This option has no effect until @option{-fsel-sched-pipelining} is
>> turned on.
>> -
>> -+@item -fshrink-wrap
>> -+@opindex fshrink-wrap
>> -+Emit function prologues only before parts of the function that need it=
,
>> -+rather than at the top of the function. =C2=A0This flag is enabled by =
default
>> at
>> -+@option{-O} and higher.
>> -+
>> - @item -fcaller-saves
>> - @opindex fcaller-saves
>> - Enable values to be allocated in registers that will be clobbered by
>> -
>> -=3D=3D=3D modified file 'gcc/doc/md.texi'
>> ---- old/gcc/doc/md.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02009-12-15 18:36:44 =
+0000
>> -+++ new/gcc/doc/md.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 =
+0000
>> -@@ -4801,7 +4801,19 @@
>> - multiple instructions are usually needed to return from a function, bu=
t
>> - some class of functions only requires one instruction to implement a
>> - return. =C2=A0Normally, the applicable functions are those which do no=
t need
>> --to save any registers or allocate stack space.
>> -+to save any registers or allocate stack space, although some targets
>> -+have instructions that can perform both the epilogue and function retu=
rn
>> -+in one instruction.
>> -+
>> -+@cindex @code{simple_return} instruction pattern
>> -+@item @samp{simple_return}
>> -+Subroutine return instruction. =C2=A0This instruction pattern name sho=
uld be
>> -+defined only if a single instruction can do all the work of returning
>> -+from a function on a path where no epilogue is required. =C2=A0This pa=
ttern
>> -+is very similar to the @code{return} instruction pattern, but it is
>> emitted
>> -+only by the shrink-wrapping optimization on paths where the function
>> -+prologue has not been executed, and a function return should occur
>> without
>> -+any of the effects of the epilogue.
>> -
>> - @findex reload_completed
>> - @findex leaf_function_p
>> -
>> -=3D=3D=3D modified file 'gcc/doc/rtl.texi'
>> ---- old/gcc/doc/rtl.texi =C2=A0 =C2=A0 =C2=A0 2010-07-06 19:23:53 +0000
>> -+++ new/gcc/doc/rtl.texi =C2=A0 =C2=A0 =C2=A0 2011-01-05 12:12:18 +0000
>> -@@ -2888,6 +2888,13 @@
>> - Note that an insn pattern of @code{(return)} is logically equivalent t=
o
>> - @code{(set (pc) (return))}, but the latter form is never used.
>> -
>> -+@findex simple_return
>> -+@item (simple_return)
>> -+Like @code{(return)}, but truly represents only a function return, whi=
le
>> -+@code{(return)} may represent an insn that also performs other functio=
ns
>> -+of the function epilogue. =C2=A0Like @code{(return)}, this may also oc=
cur in
>> -+conditional jumps.
>> -+
>> - @findex call
>> - @item (call @var{function} @var{nargs})
>> - Represents a function call. =C2=A0@var{function} is a @code{mem} expre=
ssion
>> -@@ -3017,7 +3024,7 @@
>> - brackets stand for a vector; the operand of @code{parallel} is a
>> - vector of expressions. =C2=A0@var{x0}, @var{x1} and so on are individu=
al
>> - side effect expressions---expressions of code @code{set}, @code{call},
>> --@code{return}, @code{clobber} or @code{use}.
>> -+@code{return}, @code{simple_return}, @code{clobber} or @code{use}.
>> -
>> - ``In parallel'' means that first all the values used in the individual
>> - side-effects are computed, and second all the actual side-effects are
>> -@@ -3656,14 +3663,16 @@
>> - @table @code
>> - @findex PATTERN
>> - @item PATTERN (@var{i})
>> --An expression for the side effect performed by this insn. =C2=A0This m=
ust be
>> --one of the following codes: @code{set}, @code{call}, @code{use},
>> --@code{clobber}, @code{return}, @code{asm_input}, @code{asm_output},
>> --@code{addr_vec}, @code{addr_diff_vec}, @code{trap_if}, @code{unspec},
>> --@code{unspec_volatile}, @code{parallel}, @code{cond_exec}, or
>> @code{sequence}. =C2=A0If it is a @code{parallel},
>> --each element of the @code{parallel} must be one these codes, except th=
at
>> --@code{parallel} expressions cannot be nested and @code{addr_vec} and
>> --@code{addr_diff_vec} are not permitted inside a @code{parallel}
>> expression.
>> -+An expression for the side effect performed by this insn. =C2=A0This m=
ust
>> -+be one of the following codes: @code{set}, @code{call}, @code{use},
>> -+@code{clobber}, @code{return}, @code{simple_return}, @code{asm_input},
>> -+@code{asm_output}, @code{addr_vec}, @code{addr_diff_vec},
>> -+@code{trap_if}, @code{unspec}, @code{unspec_volatile},
>> -+@code{parallel}, @code{cond_exec}, or @code{sequence}. =C2=A0If it is =
a
>> -+@code{parallel}, each element of the @code{parallel} must be one these
>> -+codes, except that @code{parallel} expressions cannot be nested and
>> -+@code{addr_vec} and @code{addr_diff_vec} are not permitted inside a
>> -+@code{parallel} expression.
>> -
>> - @findex INSN_CODE
>> - @item INSN_CODE (@var{i})
>> -
>> -=3D=3D=3D modified file 'gcc/doc/tm.texi'
>> ---- old/gcc/doc/tm.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02010-09-01 13:29:58 =
+0000
>> -+++ new/gcc/doc/tm.texi =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 =
+0000
>> -@@ -3287,6 +3287,12 @@
>> - from the frame pointer of the previous stack frame.
>> - @end defmac
>> -
>> -+@defmac RETURN_ADDR_REGNUM
>> -+If defined, a C expression whose value is the register number of the
>> return
>> -+address for the current function. =C2=A0Targets that pass the return a=
ddress
>> on
>> -+the stack should not define this macro.
>> -+@end defmac
>> -+
>> - @defmac INCOMING_RETURN_ADDR_RTX
>> - A C expression whose value is RTL representing the location of the
>> - incoming return address at the beginning of any function, before the
>> -
>> -=3D=3D=3D modified file 'gcc/dwarf2out.c'
>> ---- old/gcc/dwarf2out.c =C2=A0 =C2=A0 =C2=A0 =C2=A02010-12-21 18:46:10 =
+0000
>> -+++ new/gcc/dwarf2out.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 =
+0000
>> -@@ -1396,7 +1396,7 @@
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 rtx dest =3D JUMP_LABEL (insn);
>> -
>> -- =C2=A0 =C2=A0 =C2=A0if (dest)
>> -+ =C2=A0 =C2=A0 =C2=A0if (dest && !ANY_RETURN_P (dest))
>> - =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (barrier_args_size [INSN_UID (dest)] < =
0)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>> -
>> -=3D=3D=3D modified file 'gcc/emit-rtl.c'
>> ---- old/gcc/emit-rtl.c 2010-10-04 00:50:43 +0000
>> -+++ new/gcc/emit-rtl.c 2011-01-05 12:12:18 +0000
>> -@@ -2432,6 +2432,8 @@
>> - =C2=A0 =C2=A0 case CODE_LABEL:
>> - =C2=A0 =C2=A0 case PC:
>> - =C2=A0 =C2=A0 case CC0:
>> -+ =C2=A0 =C2=A0case RETURN:
>> -+ =C2=A0 =C2=A0case SIMPLE_RETURN:
>> - =C2=A0 =C2=A0 case SCRATCH:
>> - =C2=A0 =C2=A0 =C2=A0 return;
>> - =C2=A0 =C2=A0 =C2=A0 /* SCRATCH must be shared because they represent =
distinct values.
>> =C2=A0*/
>> -@@ -3323,14 +3325,17 @@
>> - =C2=A0 return insn;
>> - }
>> -
>> --/* Return the last label to mark the same position as LABEL. =C2=A0Ret=
urn
>> null
>> -- =C2=A0 if LABEL itself is null. =C2=A0*/
>> -+/* Return the last label to mark the same position as LABEL. =C2=A0Ret=
urn
>> LABEL
>> -+ =C2=A0 itself if it is null or any return rtx. =C2=A0*/
>> -
>> - rtx
>> - skip_consecutive_labels (rtx label)
>> - {
>> - =C2=A0 rtx insn;
>> -
>> -+ =C2=A0if (label && ANY_RETURN_P (label))
>> -+ =C2=A0 =C2=A0return label;
>> -+
>> - =C2=A0 for (insn =3D label; insn !=3D 0 && !INSN_P (insn); insn =3D NE=
XT_INSN
>> (insn))
>> - =C2=A0 =C2=A0 if (LABEL_P (insn))
>> - =C2=A0 =C2=A0 =C2=A0 label =3D insn;
>> -@@ -5209,7 +5214,7 @@
>> - =C2=A0 =C2=A0 return CODE_LABEL;
>> - =C2=A0 if (GET_CODE (x) =3D=3D CALL)
>> - =C2=A0 =C2=A0 return CALL_INSN;
>> -- =C2=A0if (GET_CODE (x) =3D=3D RETURN)
>> -+ =C2=A0if (GET_CODE (x) =3D=3D RETURN || GET_CODE (x) =3D=3D SIMPLE_RE=
TURN)
>> - =C2=A0 =C2=A0 return JUMP_INSN;
>> - =C2=A0 if (GET_CODE (x) =3D=3D SET)
>> - =C2=A0 =C2=A0 {
>> -@@ -5715,8 +5720,10 @@
>> - =C2=A0 init_reg_modes_target ();
>> -
>> - =C2=A0 /* Assign register numbers to the globally defined register rtx=
. =C2=A0*/
>> -- =C2=A0pc_rtx =3D gen_rtx_PC (VOIDmode);
>> -- =C2=A0cc0_rtx =3D gen_rtx_CC0 (VOIDmode);
>> -+ =C2=A0pc_rtx =3D gen_rtx_fmt_ (PC, VOIDmode);
>> -+ =C2=A0ret_rtx =3D gen_rtx_fmt_ (RETURN, VOIDmode);
>> -+ =C2=A0simple_return_rtx =3D gen_rtx_fmt_ (SIMPLE_RETURN, VOIDmode);
>> -+ =C2=A0cc0_rtx =3D gen_rtx_fmt_ (CC0, VOIDmode);
>> - =C2=A0 stack_pointer_rtx =3D gen_raw_REG (Pmode, STACK_POINTER_REGNUM)=
;
>> - =C2=A0 frame_pointer_rtx =3D gen_raw_REG (Pmode, FRAME_POINTER_REGNUM)=
;
>> - =C2=A0 hard_frame_pointer_rtx =3D gen_raw_REG (Pmode,
>> HARD_FRAME_POINTER_REGNUM);
>> -
>> -=3D=3D=3D modified file 'gcc/final.c'
>> ---- old/gcc/final.c =C2=A0 =C2=A02010-03-26 16:18:51 +0000
>> -+++ new/gcc/final.c =C2=A0 =C2=A02011-01-05 12:12:18 +0000
>> -@@ -2428,7 +2428,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete_insn (insn);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (GET_CODE (SET_SRC (body)) =
=3D=3D RETURN)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (ANY_RETURN_P (SET_SRC (bod=
y)))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Replace (set (pc) (return=
)) with (return). =C2=A0*/
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PATTERN (insn) =3D body =3D =
SET_SRC (body);
>> -
>> -
>> -=3D=3D=3D modified file 'gcc/function.c'
>> ---- old/gcc/function.c 2010-08-16 19:18:08 +0000
>> -+++ new/gcc/function.c 2011-01-05 12:12:18 +0000
>> -@@ -147,9 +147,6 @@
>> - =C2=A0 =C2=A0can always export `prologue_epilogue_contains'. =C2=A0*/
>> - static void record_insns (rtx, rtx, htab_t *) ATTRIBUTE_UNUSED;
>> - static bool contains (const_rtx, htab_t);
>> --#ifdef HAVE_return
>> --static void emit_return_into_block (basic_block);
>> --#endif
>> - static void prepare_function_start (void);
>> - static void do_clobber_return_reg (rtx, void *);
>> - static void do_use_return_reg (rtx, void *);
>> -@@ -4987,35 +4984,189 @@
>> - =C2=A0 return 0;
>> - }
>> -
>> -+#ifdef HAVE_simple_return
>> -+/* This collects sets and clobbers of hard registers in a HARD_REG_SET=
,
>> -+ =C2=A0 which is pointed to by DATA. =C2=A0*/
>> -+static void
>> -+record_hard_reg_sets (rtx x, const_rtx pat ATTRIBUTE_UNUSED, void *dat=
a)
>> -+{
>> -+ =C2=A0HARD_REG_SET *pset =3D (HARD_REG_SET *)data;
>> -+ =C2=A0if (REG_P (x) && REGNO (x) < FIRST_PSEUDO_REGISTER)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0int nregs =3D hard_regno_nregs[REGNO (x)][GET_MOD=
E (x)];
>> -+ =C2=A0 =C2=A0 =C2=A0while (nregs-- > 0)
>> -+ =C2=A0 =C2=A0 =C2=A0SET_HARD_REG_BIT (*pset, REGNO (x) + nregs);
>> -+ =C2=A0 =C2=A0}
>> -+}
>> -+
>> -+/* A subroutine of requires_stack_frame_p, called via for_each_rtx.
>> -+ =C2=A0 If any change is made, set CHANGED
>> -+ =C2=A0 to true. =C2=A0*/
>> -+
>> -+static int
>> -+frame_required_for_rtx (rtx *loc, void *data ATTRIBUTE_UNUSED)
>> -+{
>> -+ =C2=A0rtx x =3D *loc;
>> -+ =C2=A0if (x =3D=3D stack_pointer_rtx || x =3D=3D hard_frame_pointer_r=
tx
>> -+ =C2=A0 =C2=A0 =C2=A0|| x =3D=3D arg_pointer_rtx || x =3D=3D pic_offse=
t_table_rtx
>> -+#ifdef RETURN_ADDR_REGNUM
>> -+ =C2=A0 =C2=A0 =C2=A0|| (REG_P (x) && REGNO (x) =3D=3D RETURN_ADDR_REG=
NUM)
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0)
>> -+ =C2=A0 =C2=A0return 1;
>> -+ =C2=A0return 0;
>> -+}
>> -+
>> -+static bool
>> -+requires_stack_frame_p (rtx insn)
>> -+{
>> -+ =C2=A0HARD_REG_SET hardregs;
>> -+ =C2=A0unsigned regno;
>> -+
>> -+ =C2=A0if (!INSN_P (insn) || DEBUG_INSN_P (insn))
>> -+ =C2=A0 =C2=A0return false;
>> -+ =C2=A0if (CALL_P (insn))
>> -+ =C2=A0 =C2=A0return !SIBLING_CALL_P (insn);
>> -+ =C2=A0if (for_each_rtx (&PATTERN (insn), frame_required_for_rtx, NULL=
))
>> -+ =C2=A0 =C2=A0return true;
>> -+ =C2=A0CLEAR_HARD_REG_SET (hardregs);
>> -+ =C2=A0note_stores (PATTERN (insn), record_hard_reg_sets, &hardregs);
>> -+ =C2=A0AND_COMPL_HARD_REG_SET (hardregs, call_used_reg_set);
>> -+ =C2=A0for (regno =3D 0; regno < FIRST_PSEUDO_REGISTER; regno++)
>> -+ =C2=A0 =C2=A0if (TEST_HARD_REG_BIT (hardregs, regno)
>> -+ =C2=A0 =C2=A0 =C2=A0&& df_regs_ever_live_p (regno))
>> -+ =C2=A0 =C2=A0 =C2=A0return true;
>> -+ =C2=A0return false;
>> -+}
>> -+#endif
>> -+
>> - #ifdef HAVE_return
>> --/* Insert gen_return at the end of block BB. =C2=A0This also means upd=
ating
>> -- =C2=A0 block_for_insn appropriately. =C2=A0*/
>> -+
>> -+static rtx
>> -+gen_return_pattern (bool simple_p)
>> -+{
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0return simple_p ? gen_simple_return () : gen_return ();
>> -+#else
>> -+ =C2=A0gcc_assert (!simple_p);
>> -+ =C2=A0return gen_return ();
>> -+#endif
>> -+}
>> -+
>> -+/* Insert an appropriate return pattern at the end of block BB. =C2=A0=
This
>> -+ =C2=A0 also means updating block_for_insn appropriately. =C2=A0*/
>> -
>> - static void
>> --emit_return_into_block (basic_block bb)
>> -+emit_return_into_block (bool simple_p, basic_block bb)
>> - {
>> -- =C2=A0emit_jump_insn_after (gen_return (), BB_END (bb));
>> -+ =C2=A0rtx jump;
>> -+ =C2=A0jump =3D emit_jump_insn_after (gen_return_pattern (simple_p), B=
B_END
>> (bb));
>> -+ =C2=A0JUMP_LABEL (jump) =3D simple_p ? simple_return_rtx : ret_rtx;
>> - }
>> --#endif /* HAVE_return */
>> -+#endif
>> -
>> - /* Generate the prologue and epilogue RTL if the machine supports it.
>> =C2=A0Thread
>> - =C2=A0 =C2=A0this into place with notes indicating where the prologue =
ends and
>> where
>> -- =C2=A0 the epilogue begins. =C2=A0Update the basic block information =
when
>> possible. =C2=A0*/
>> -+ =C2=A0 the epilogue begins. =C2=A0Update the basic block information =
when
>> possible.
>> -+
>> -+ =C2=A0 Notes on epilogue placement:
>> -+ =C2=A0 There are several kinds of edges to the exit block:
>> -+ =C2=A0 * a single fallthru edge from LAST_BB
>> -+ =C2=A0 * possibly, edges from blocks containing sibcalls
>> -+ =C2=A0 * possibly, fake edges from infinite loops
>> -+
>> -+ =C2=A0 The epilogue is always emitted on the fallthru edge from the l=
ast
>> basic
>> -+ =C2=A0 block in the function, LAST_BB, into the exit block.
>> -+
>> -+ =C2=A0 If LAST_BB is empty except for a label, it is the target of ev=
ery
>> -+ =C2=A0 other basic block in the function that ends in a return. =C2=
=A0If a
>> -+ =C2=A0 target has a return or simple_return pattern (possibly with
>> -+ =C2=A0 conditional variants), these basic blocks can be changed so th=
at a
>> -+ =C2=A0 return insn is emitted into them, and their target is adjusted=
 to
>> -+ =C2=A0 the real exit block.
>> -+
>> -+ =C2=A0 Notes on shrink wrapping: We implement a fairly conservative
>> -+ =C2=A0 version of shrink-wrapping rather than the textbook one. =C2=
=A0We only
>> -+ =C2=A0 generate a single prologue and a single epilogue. =C2=A0This i=
s
>> -+ =C2=A0 sufficient to catch a number of interesting cases involving ea=
rly
>> -+ =C2=A0 exits.
>> -+
>> -+ =C2=A0 First, we identify the blocks that require the prologue to occ=
ur
>> before
>> -+ =C2=A0 them. =C2=A0These are the ones that modify a call-saved regist=
er, or
>> reference
>> -+ =C2=A0 any of the stack or frame pointer registers. =C2=A0To simplify=
 things, we
>> then
>> -+ =C2=A0 mark everything reachable from these blocks as also requiring =
a
>> prologue.
>> -+ =C2=A0 This takes care of loops automatically, and avoids the need to
>> examine
>> -+ =C2=A0 whether MEMs reference the frame, since it is sufficient to ch=
eck for
>> -+ =C2=A0 occurrences of the stack or frame pointer.
>> -+
>> -+ =C2=A0 We then compute the set of blocks for which the need for a pro=
logue
>> -+ =C2=A0 is anticipatable (borrowing terminology from the shrink-wrappi=
ng
>> -+ =C2=A0 description in Muchnick's book). =C2=A0These are the blocks wh=
ich either
>> -+ =C2=A0 require a prologue themselves, or those that have only success=
ors
>> -+ =C2=A0 where the prologue is anticipatable. =C2=A0The prologue needs =
to be
>> -+ =C2=A0 inserted on all edges from BB1->BB2 where BB2 is in ANTIC and =
BB1
>> -+ =C2=A0 is not. =C2=A0For the moment, we ensure that only one such edg=
e exists.
>> -+
>> -+ =C2=A0 The epilogue is placed as described above, but we make a
>> -+ =C2=A0 distinction between inserting return and simple_return pattern=
s
>> -+ =C2=A0 when modifying other blocks that end in a return. =C2=A0Blocks=
 that end
>> -+ =C2=A0 in a sibcall omit the sibcall_epilogue if the block is not in
>> -+ =C2=A0 ANTIC. =C2=A0*/
>> -
>> - static void
>> - thread_prologue_and_epilogue_insns (void)
>> - {
>> - =C2=A0 int inserted =3D 0;
>> -+ =C2=A0basic_block last_bb;
>> -+ =C2=A0bool last_bb_active;
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0bool unconverted_simple_returns =3D false;
>> -+ =C2=A0basic_block simple_return_block =3D NULL;
>> -+#endif
>> -+ =C2=A0rtx returnjump ATTRIBUTE_UNUSED;
>> -+ =C2=A0rtx seq ATTRIBUTE_UNUSED, epilogue_end ATTRIBUTE_UNUSED;
>> -+ =C2=A0rtx prologue_seq ATTRIBUTE_UNUSED, split_prologue_seq
>> ATTRIBUTE_UNUSED;
>> -+ =C2=A0edge entry_edge, orig_entry_edge, exit_fallthru_edge;
>> - =C2=A0 edge e;
>> --#if defined (HAVE_sibcall_epilogue) || defined (HAVE_epilogue) ||
>> defined (HAVE_return) || defined (HAVE_prologue)
>> -- =C2=A0rtx seq;
>> --#endif
>> --#if defined (HAVE_epilogue) || defined(HAVE_return)
>> -- =C2=A0rtx epilogue_end =3D NULL_RTX;
>> --#endif
>> - =C2=A0 edge_iterator ei;
>> -+ =C2=A0bitmap_head bb_flags;
>> -+
>> -+ =C2=A0df_analyze ();
>> -
>> - =C2=A0 rtl_profile_for_bb (ENTRY_BLOCK_PTR);
>> -+
>> -+ =C2=A0epilogue_end =3D NULL_RTX;
>> -+
>> -+ =C2=A0/* Can't deal with multiple successors of the entry block at th=
e
>> -+ =C2=A0 =C2=A0 moment. =C2=A0Function should always have at least one =
entry
>> -+ =C2=A0 =C2=A0 point. =C2=A0*/
>> -+ =C2=A0gcc_assert (single_succ_p (ENTRY_BLOCK_PTR));
>> -+ =C2=A0entry_edge =3D single_succ_edge (ENTRY_BLOCK_PTR);
>> -+ =C2=A0orig_entry_edge =3D entry_edge;
>> -+
>> -+ =C2=A0exit_fallthru_edge =3D find_fallthru_edge (EXIT_BLOCK_PTR->pred=
s);
>> -+ =C2=A0if (exit_fallthru_edge !=3D NULL)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0rtx label;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0last_bb =3D exit_fallthru_edge->src;
>> -+ =C2=A0 =C2=A0 =C2=A0/* Test whether there are active instructions in =
the last block.
>> =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0label =3D BB_END (last_bb);
>> -+ =C2=A0 =C2=A0 =C2=A0while (label && !LABEL_P (label))
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (active_insn_p (label))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D PREV_INSN (label);
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0last_bb_active =3D BB_HEAD (last_bb) !=3D label |=
| !LABEL_P (label);
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0else
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0last_bb =3D NULL;
>> -+ =C2=A0 =C2=A0 =C2=A0last_bb_active =3D false;
>> -+ =C2=A0 =C2=A0}
>> -+
>> - #ifdef HAVE_prologue
>> - =C2=A0 if (HAVE_prologue)
>> - =C2=A0 =C2=A0 {
>> -@@ -5040,19 +5191,168 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 emit_insn (gen_blockage ());
>> - #endif
>> -
>> -- =C2=A0 =C2=A0 =C2=A0seq =3D get_insns ();
>> -+ =C2=A0 =C2=A0 =C2=A0prologue_seq =3D get_insns ();
>> - =C2=A0 =C2=A0 =C2=A0 end_sequence ();
>> - =C2=A0 =C2=A0 =C2=A0 set_insn_locators (seq, prologue_locator);
>> --
>> -- =C2=A0 =C2=A0 =C2=A0/* Can't deal with multiple successors of the ent=
ry block
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 at the moment. =C2=A0Function should alwa=
ys have at least one
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 entry point. =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0gcc_assert (single_succ_p (ENTRY_BLOCK_PTR));
>> --
>> -- =C2=A0 =C2=A0 =C2=A0insert_insn_on_edge (seq, single_succ_edge (ENTRY=
_BLOCK_PTR));
>> -- =C2=A0 =C2=A0 =C2=A0inserted =3D 1;
>> -- =C2=A0 =C2=A0}
>> --#endif
>> -+ =C2=A0 =C2=A0}
>> -+#endif
>> -+
>> -+ =C2=A0bitmap_initialize (&bb_flags, &bitmap_default_obstack);
>> -+
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0/* Try to perform a kind of shrink-wrapping, making sure the
>> -+ =C2=A0 =C2=A0 prologue/epilogue is emitted only around those parts of=
 the
>> -+ =C2=A0 =C2=A0 function that require it. =C2=A0*/
>> -+
>> -+ =C2=A0if (flag_shrink_wrap && HAVE_simple_return &&
>> !flag_non_call_exceptions
>> -+ =C2=A0 =C2=A0 =C2=A0&& HAVE_prologue && !crtl->calls_eh_return)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0HARD_REG_SET prologue_clobbered, live_on_edge;
>> -+ =C2=A0 =C2=A0 =C2=A0rtx p_insn;
>> -+ =C2=A0 =C2=A0 =C2=A0VEC(basic_block, heap) *vec;
>> -+ =C2=A0 =C2=A0 =C2=A0basic_block bb;
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_head bb_antic_flags;
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_head bb_on_list;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_initialize (&bb_antic_flags, &bitmap_defau=
lt_obstack);
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_initialize (&bb_on_list, &bitmap_default_o=
bstack);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0vec =3D VEC_alloc (basic_block, heap, n_basic_blo=
cks);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_EACH_BB (bb)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx insn;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_BB_INSNS (bb, insn)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (requires_stack_frame_p (=
insn))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_set_bit=
 (&bb_flags, bb->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VEC_quick_push=
 (basic_block, vec, bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0/* For every basic block that needs a prologue, m=
ark all blocks
>> -+ =C2=A0 =C2=A0 =C2=A0 reachable from it, so as to ensure they are also=
 seen as
>> -+ =C2=A0 =C2=A0 =C2=A0 requiring a prologue. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0while (!VEC_empty (basic_block, vec))
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block tmp_bb =3D VEC_pop (basic_bloc=
k, vec);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge e;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge_iterator ei;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, tmp_bb->succs)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (e->dest =3D=3D EXIT_BLOC=
K_PTR
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| bitmap_bit_=
p (&bb_flags, e->dest->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_set_bit (&bb_flags, e=
->dest->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VEC_quick_push (basic_block,=
 vec, e->dest);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0/* If the last basic block contains only a label,=
 we'll be able
>> -+ =C2=A0 =C2=A0 =C2=A0 to convert jumps to it to (potentially condition=
al) return
>> -+ =C2=A0 =C2=A0 =C2=A0 insns later. =C2=A0This means we don't necessari=
ly need a prologue
>> -+ =C2=A0 =C2=A0 =C2=A0 for paths reaching it. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0if (last_bb)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!last_bb_active)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_clear_bit (&bb_flags, last_b=
b->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!bitmap_bit_p (&bb_flags, last_bb=
->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto fail_shrinkwrap;
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0/* Now walk backwards from every block that is ma=
rked as needing
>> -+ =C2=A0 =C2=A0 =C2=A0 a prologue to compute the bb_antic_flags bitmap.=
 =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_copy (&bb_antic_flags, &bb_flags);
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_EACH_BB (bb)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge e;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge_iterator ei;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_flags, bb->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, bb->preds)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_antic_flags,=
 e->src->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VEC_quick_push (basic=
_block, vec, e->src);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_set_bit (&bb_o=
n_list, e->src->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0while (!VEC_empty (basic_block, vec))
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block tmp_bb =3D VEC_pop (basic_bloc=
k, vec);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge e;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge_iterator ei;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bool all_set =3D true;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_clear_bit (&bb_on_list, tmp_bb->ind=
ex);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, tmp_bb->succs)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_antic=
_flags, e->dest->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all_set =3D fa=
lse;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (all_set)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_set_bit (&bb_antic_fl=
ags, tmp_bb->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, tmp_bb=
->preds)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&b=
b_antic_flags, e->src->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VEC_qui=
ck_push (basic_block, vec, e->src);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bitmap_=
set_bit (&bb_on_list, e->src->index);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0/* Find exactly one edge that leads to a block in=
 ANTIC from
>> -+ =C2=A0 =C2=A0 =C2=A0 a block that isn't. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_antic_flags, entry_edge->d=
est->index))
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_EACH_BB (bb)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_antic_flags,=
 bb->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, bb->preds)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!bitmap_bit_p (&bb_antic=
_flags, e->src->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (entry_edge=
 !=3D orig_entry_edge)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
entry_edge =3D orig_entry_edge;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
goto fail_shrinkwrap;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entry_edge =3D=
 e;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0/* Test whether the prologue is known to clobber =
any register
>> -+ =C2=A0 =C2=A0 =C2=A0 (other than FP or SP) which are live on the edge=
. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0CLEAR_HARD_REG_SET (prologue_clobbered);
>> -+ =C2=A0 =C2=A0 =C2=A0for (p_insn =3D prologue_seq; p_insn; p_insn =3D =
NEXT_INSN (p_insn))
>> -+ =C2=A0 =C2=A0 =C2=A0if (NONDEBUG_INSN_P (p_insn))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0note_stores (PATTERN (p_insn), record_hard=
_reg_sets,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &prologue_clobbered);
>> -+ =C2=A0 =C2=A0 =C2=A0CLEAR_HARD_REG_BIT (prologue_clobbered, STACK_POI=
NTER_REGNUM);
>> -+ =C2=A0 =C2=A0 =C2=A0if (frame_pointer_needed)
>> -+ =C2=A0 =C2=A0 =C2=A0CLEAR_HARD_REG_BIT (prologue_clobbered,
>> HARD_FRAME_POINTER_REGNUM);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0CLEAR_HARD_REG_SET (live_on_edge);
>> -+ =C2=A0 =C2=A0 =C2=A0reg_set_to_hard_reg_set (&live_on_edge,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 df_get_live_in (entry_edge->dest));
>> -+ =C2=A0 =C2=A0 =C2=A0if (hard_reg_set_intersect_p (live_on_edge, prolo=
gue_clobbered))
>> -+ =C2=A0 =C2=A0 =C2=A0entry_edge =3D orig_entry_edge;
>> -+
>> -+ =C2=A0 =C2=A0fail_shrinkwrap:
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_clear (&bb_antic_flags);
>> -+ =C2=A0 =C2=A0 =C2=A0bitmap_clear (&bb_on_list);
>> -+ =C2=A0 =C2=A0 =C2=A0VEC_free (basic_block, heap, vec);
>> -+ =C2=A0 =C2=A0}
>> -+#endif
>> -+
>> -+ =C2=A0if (prologue_seq !=3D NULL_RTX)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0insert_insn_on_edge (prologue_seq, entry_edge);
>> -+ =C2=A0 =C2=A0 =C2=A0inserted =3D true;
>> -+ =C2=A0 =C2=A0}
>> -
>> - =C2=A0 /* If the exit block has no non-fake predecessors, we don't nee=
d
>> - =C2=A0 =C2=A0 =C2=A0an epilogue. =C2=A0*/
>> -@@ -5063,100 +5363,130 @@
>> - =C2=A0 =C2=A0 goto epilogue_done;
>> -
>> - =C2=A0 rtl_profile_for_bb (EXIT_BLOCK_PTR);
>> -+
>> - #ifdef HAVE_return
>> -- =C2=A0if (optimize && HAVE_return)
>> -+ =C2=A0/* If we're allowed to generate a simple return instruction, th=
en by
>> -+ =C2=A0 =C2=A0 definition we don't need a full epilogue. =C2=A0If the =
last basic
>> -+ =C2=A0 =C2=A0 block before the exit block does not contain active ins=
tructions,
>> -+ =C2=A0 =C2=A0 examine its predecessors and try to emit (conditional) =
return
>> -+ =C2=A0 =C2=A0 instructions. =C2=A0*/
>> -+ =C2=A0if (optimize && !last_bb_active
>> -+ =C2=A0 =C2=A0 =C2=A0&& (HAVE_return || entry_edge !=3D orig_entry_edg=
e))
>> - =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0/* If we're allowed to generate a simple return i=
nstruction,
>> -- =C2=A0 =C2=A0 =C2=A0 then by definition we don't need a full epilogue=
. =C2=A0Examine
>> -- =C2=A0 =C2=A0 =C2=A0 the block that falls through to EXIT. =C2=A0 If =
it does not
>> -- =C2=A0 =C2=A0 =C2=A0 contain any code, examine its predecessors and t=
ry to
>> -- =C2=A0 =C2=A0 =C2=A0 emit (conditional) return instructions. =C2=A0*/
>> --
>> -- =C2=A0 =C2=A0 =C2=A0basic_block last;
>> -+ =C2=A0 =C2=A0 =C2=A0edge_iterator ei2;
>> -+ =C2=A0 =C2=A0 =C2=A0int i;
>> -+ =C2=A0 =C2=A0 =C2=A0basic_block bb;
>> - =C2=A0 =C2=A0 =C2=A0 rtx label;
>> -+ =C2=A0 =C2=A0 =C2=A0VEC(basic_block,heap) *src_bbs;
>> -
>> -- =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei, EXIT_BLOCK_PTR->preds)
>> -- =C2=A0 =C2=A0 =C2=A0if (e->flags & EDGE_FALLTHRU)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -- =C2=A0 =C2=A0 =C2=A0if (e =3D=3D NULL)
>> -+ =C2=A0 =C2=A0 =C2=A0if (exit_fallthru_edge =3D=3D NULL)
>> - =C2=A0 =C2=A0 =C2=A0 goto epilogue_done;
>> -- =C2=A0 =C2=A0 =C2=A0last =3D e->src;
>> --
>> -- =C2=A0 =C2=A0 =C2=A0/* Verify that there are no active instructions i=
n the last block.
>> =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0label =3D BB_END (last);
>> -- =C2=A0 =C2=A0 =C2=A0while (label && !LABEL_P (label))
>> -+ =C2=A0 =C2=A0 =C2=A0label =3D BB_HEAD (last_bb);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0src_bbs =3D VEC_alloc (basic_block, heap, EDGE_CO=
UNT
>> (last_bb->preds));
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_EACH_EDGE (e, ei2, last_bb->preds)
>> -+ =C2=A0 =C2=A0 =C2=A0if (e->src !=3D ENTRY_BLOCK_PTR)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VEC_quick_push (basic_block, src_bbs, e->s=
rc);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0FOR_EACH_VEC_ELT (basic_block, src_bbs, i, bb)
>> - =C2=A0 =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (active_insn_p (label))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0label =3D PREV_INSN (label);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bool simple_p;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx jump;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D find_edge (bb, last_bb);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0jump =3D BB_END (bb);
>> -+
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_p =3D (entry_edge !=3D orig_entry_e=
dge
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
? !bitmap_bit_p (&bb_flags, bb->index) : false);
>> -+#else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_p =3D false;
>> -+#endif
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!simple_p
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& (!HAVE_return || !JUMP_P =
(jump)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| JUMP_LABEL =
(jump) !=3D label))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have an unconditional jump, we ca=
n replace that
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with a simple return instruction. =
=C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!JUMP_P (jump))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_barrier_after (BB_END (=
bb));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_into_block (simp=
le_p, bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (simplejump_p (jump))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_into_block (simp=
le_p, bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delete_insn (jump);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (condjump_p (jump) && JUMP_LABEL (=
jump) !=3D label)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block new_bb;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0edge new_e;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (simple_p);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_bb =3D split_edge (e);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_barrier_after (BB_END (=
new_bb));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_into_block (simp=
le_p, new_bb);
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_return_block =3D new_=
bb;
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0new_e =3D single_succ_edge (=
new_bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirect_edge_succ (new_e, E=
XIT_BLOCK_PTR);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have a conditional jump branching=
 to the last
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 block, we can try to replace that =
with a conditional
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return instruction. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (condjump_p (jump))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx dest;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (simple_p)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D simple_retur=
n_rtx;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dest =3D ret_rtx;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! redirect_jump (jump, d=
est, 0))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (simple_p)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unconve=
rted_simple_returns =3D true;
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this block has only on=
e successor, it both jumps
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and falls through to=
 the fallthru block, so we can't
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete the edge. =C2=
=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (single_succ_p (bb))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (simple_p)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unconverted_simple_re=
turns =3D true;
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fix up the CFG for the successful chang=
e we just made. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0redirect_edge_succ (e, EXIT_BLOCK_PTR);
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -+ =C2=A0 =C2=A0 =C2=A0VEC_free (basic_block, heap, src_bbs);
>> -
>> -- =C2=A0 =C2=A0 =C2=A0if (BB_HEAD (last) =3D=3D label && LABEL_P (label=
))
>> -+ =C2=A0 =C2=A0 =C2=A0if (HAVE_return)
>> - =C2=A0 =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0edge_iterator ei2;
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0for (ei2 =3D ei_start (last->preds); (e =
=3D ei_safe_edge (ei2)); )
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block bb =3D e->src;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx jump;
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bb =3D=3D ENTRY_BLOCK_PT=
R)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ei_next (&ei2)=
;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jump =3D BB_END (bb);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!JUMP_P (jump) || JUMP_L=
ABEL (jump) !=3D label)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ei_next (&ei2)=
;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have an uncondition=
al jump, we can replace that
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with a simple return=
 instruction. =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (simplejump_p (jump))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_in=
to_block (bb);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0delete_insn (j=
ump);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If we have a conditional =
jump, we can try to replace
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 that with a conditio=
nal return instruction. =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else if (condjump_p (jump))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (! redirect=
_jump (jump, 0, 0))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ei_next (&ei2);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
continue;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* If this blo=
ck has only one successor, it both jumps
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 and fa=
lls through to the fallthru block, so we can't
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 delete=
 the edge. =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (single_suc=
c_p (bb))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ei_next (&ei2);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
continue;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ei_next (&ei2)=
;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Fix up the CFG for the su=
ccessful change we just made.
>> =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirect_edge_succ (e, EXIT_=
BLOCK_PTR);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> --
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Emit a return insn for the exit fallthr=
u block. =C2=A0Whether
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this is still reachable will =
be determined later. =C2=A0*/
>> -
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_barrier_after (BB_END (last));
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_into_block (last);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0epilogue_end =3D BB_END (last);
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0single_succ_edge (last)->flags &=3D ~EDGE_=
FALLTHRU;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_barrier_after (BB_END (last_bb));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_return_into_block (false, last_bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0epilogue_end =3D BB_END (last_bb);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (JUMP_P (epilogue_end))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JUMP_LABEL (epilogue_end) =3D ret_r=
tx;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0single_succ_edge (last_bb)->flags &=3D ~ED=
GE_FALLTHRU;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto epilogue_done;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 }
>> -@@ -5193,15 +5523,10 @@
>> - =C2=A0 =C2=A0 }
>> - #endif
>> -
>> -- =C2=A0/* Find the edge that falls through to EXIT. =C2=A0Other edges =
may exist
>> -- =C2=A0 =C2=A0 due to RETURN instructions, but those don't need epilog=
ues.
>> -- =C2=A0 =C2=A0 There really shouldn't be a mixture -- either all shoul=
d have
>> -- =C2=A0 =C2=A0 been converted or none, however... =C2=A0*/
>> -+ =C2=A0/* If nothing falls through into the exit block, we don't need =
an
>> -+ =C2=A0 =C2=A0 epilogue. =C2=A0*/
>> -
>> -- =C2=A0FOR_EACH_EDGE (e, ei, EXIT_BLOCK_PTR->preds)
>> -- =C2=A0 =C2=A0if (e->flags & EDGE_FALLTHRU)
>> -- =C2=A0 =C2=A0 =C2=A0break;
>> -- =C2=A0if (e =3D=3D NULL)
>> -+ =C2=A0if (exit_fallthru_edge =3D=3D NULL)
>> - =C2=A0 =C2=A0 goto epilogue_done;
>> -
>> - #ifdef HAVE_epilogue
>> -@@ -5217,25 +5542,38 @@
>> - =C2=A0 =C2=A0 =C2=A0 set_insn_locators (seq, epilogue_locator);
>> -
>> - =C2=A0 =C2=A0 =C2=A0 seq =3D get_insns ();
>> -+ =C2=A0 =C2=A0 =C2=A0returnjump =3D get_last_insn ();
>> - =C2=A0 =C2=A0 =C2=A0 end_sequence ();
>> -
>> -- =C2=A0 =C2=A0 =C2=A0insert_insn_on_edge (seq, e);
>> -+ =C2=A0 =C2=A0 =C2=A0insert_insn_on_edge (seq, exit_fallthru_edge);
>> - =C2=A0 =C2=A0 =C2=A0 inserted =3D 1;
>> -+ =C2=A0 =C2=A0 =C2=A0if (JUMP_P (returnjump))
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx pat =3D PATTERN (returnjump);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (GET_CODE (pat) =3D=3D PARALLEL)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pat =3D XVECEXP (pat, 0, 0);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ANY_RETURN_P (pat))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JUMP_LABEL (returnjump) =3D pat;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0JUMP_LABEL (returnjump) =3D ret_rtx=
;
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0returnjump =3D NULL_RTX;
>> - =C2=A0 =C2=A0 }
>> - =C2=A0 else
>> - #endif
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 basic_block cur_bb;
>> -
>> -- =C2=A0 =C2=A0 =C2=A0if (! next_active_insn (BB_END (e->src)))
>> -+ =C2=A0 =C2=A0 =C2=A0if (! next_active_insn (BB_END (exit_fallthru_edg=
e->src)))
>> - =C2=A0 =C2=A0 =C2=A0 goto epilogue_done;
>> - =C2=A0 =C2=A0 =C2=A0 /* We have a fall-through edge to the exit block,=
 the source is
>> not
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 at the end of the function, and there wil=
l be an assembler
>> epilogue
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 at the end of the function.
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 We can't use force_nonfallthru here, beca=
use that would try to
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 use return. =C2=A0Inserting a jump 'by ha=
nd' is extremely messy, so
>> -+ =C2=A0 =C2=A0 =C2=A0 at the end of the function, and there will be an=
 assembler
>> epilogue
>> -+ =C2=A0 =C2=A0 =C2=A0 at the end of the function.
>> -+ =C2=A0 =C2=A0 =C2=A0 We can't use force_nonfallthru here, because tha=
t would try to
>> -+ =C2=A0 =C2=A0 =C2=A0 use return. =C2=A0Inserting a jump 'by hand' is =
extremely messy, so
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0we take advantage of cfg_layout_finalize us=
ing
>> -- =C2=A0 =C2=A0 =C2=A0fixup_fallthru_exit_predecessor. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 fixup_fallthru_exit_predecessor. =C2=A0*/
>> - =C2=A0 =C2=A0 =C2=A0 cfg_layout_initialize (0);
>> - =C2=A0 =C2=A0 =C2=A0 FOR_EACH_BB (cur_bb)
>> - =C2=A0 =C2=A0 =C2=A0 if (cur_bb->index >=3D NUM_FIXED_BLOCKS
>> -@@ -5244,6 +5582,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 cfg_layout_finalize ();
>> - =C2=A0 =C2=A0 }
>> - epilogue_done:
>> -+
>> - =C2=A0 default_rtl_profile ();
>> -
>> - =C2=A0 if (inserted)
>> -@@ -5260,33 +5599,93 @@
>> - =C2=A0 =C2=A0 =C2=A0 }
>> - =C2=A0 =C2=A0 }
>> -
>> -+#ifdef HAVE_simple_return
>> -+ =C2=A0/* If there were branches to an empty LAST_BB which we tried to
>> -+ =C2=A0 =C2=A0 convert to conditional simple_returns, but couldn't for=
 some
>> -+ =C2=A0 =C2=A0 reason, create a block to hold a simple_return insn and=
 redirect
>> -+ =C2=A0 =C2=A0 those remaining edges. =C2=A0*/
>> -+ =C2=A0if (unconverted_simple_returns)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0edge_iterator ei2;
>> -+ =C2=A0 =C2=A0 =C2=A0basic_block exit_pred =3D EXIT_BLOCK_PTR->prev_bb=
;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0gcc_assert (entry_edge !=3D orig_entry_edge);
>> -+
>> -+#ifdef HAVE_epilogue
>> -+ =C2=A0 =C2=A0 =C2=A0if (simple_return_block =3D=3D NULL && returnjump=
 !=3D NULL_RTX
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0&& JUMP_LABEL (returnjump) =3D=3D simple_r=
eturn_rtx)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0edge e =3D split_block (exit_fallthru_edge=
->src,
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PREV_INSN (returnjump));
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_return_block =3D e->dest;
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+#endif
>> -+ =C2=A0 =C2=A0 =C2=A0if (simple_return_block =3D=3D NULL)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block bb;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0rtx start;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bb =3D create_basic_block (NULL, NULL, exi=
t_pred);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0start =3D emit_jump_insn_after (gen_simple=
_return (),
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BB_END (bb))=
;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0JUMP_LABEL (start) =3D simple_return_rtx;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_barrier_after (start);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0simple_return_block =3D bb;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0make_edge (bb, EXIT_BLOCK_PTR, 0);
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+
>> -+ =C2=A0 =C2=A0restart_scan:
>> -+ =C2=A0 =C2=A0 =C2=A0for (ei2 =3D ei_start (last_bb->preds); (e =3D ei=
_safe_edge (ei2)); )
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_block bb =3D e->src;
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (bb !=3D ENTRY_BLOCK_PTR
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !bitmap_bit_p (&bb_flags,=
 bb->index))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0redirect_edge_and_branch_for=
ce (e, simple_return_block);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto restart_scan;
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ei_next (&ei2);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0}
>> -+#endif
>> -+
>> - #ifdef HAVE_sibcall_epilogue
>> - =C2=A0 /* Emit sibling epilogues before any sibling call sites. =C2=A0=
*/
>> - =C2=A0 for (ei =3D ei_start (EXIT_BLOCK_PTR->preds); (e =3D ei_safe_ed=
ge (ei)); )
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 basic_block bb =3D e->src;
>> - =C2=A0 =C2=A0 =C2=A0 rtx insn =3D BB_END (bb);
>> -+ =C2=A0 =C2=A0 =C2=A0rtx ep_seq;
>> -
>> - =C2=A0 =C2=A0 =C2=A0 if (!CALL_P (insn)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ! SIBLING_CALL_P (insn))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ! SIBLING_CALL_P (insn)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (entry_edge !=3D orig_entry_edge
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !bitmap_bit_p (&bb_flags,=
 bb->index)))
>> - =C2=A0 =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 ei_next (&ei);
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;
>> - =C2=A0 =C2=A0 =C2=A0 }
>> -
>> -- =C2=A0 =C2=A0 =C2=A0start_sequence ();
>> -- =C2=A0 =C2=A0 =C2=A0emit_note (NOTE_INSN_EPILOGUE_BEG);
>> -- =C2=A0 =C2=A0 =C2=A0emit_insn (gen_sibcall_epilogue ());
>> -- =C2=A0 =C2=A0 =C2=A0seq =3D get_insns ();
>> -- =C2=A0 =C2=A0 =C2=A0end_sequence ();
>> --
>> -- =C2=A0 =C2=A0 =C2=A0/* Retain a map of the epilogue insns. =C2=A0Used=
 in life analysis to
>> -- =C2=A0 =C2=A0 =C2=A0 avoid getting rid of sibcall epilogue insns. =C2=
=A0Do this before we
>> -- =C2=A0 =C2=A0 =C2=A0 actually emit the sequence. =C2=A0*/
>> -- =C2=A0 =C2=A0 =C2=A0record_insns (seq, NULL, &epilogue_insn_hash);
>> -- =C2=A0 =C2=A0 =C2=A0set_insn_locators (seq, epilogue_locator);
>> --
>> -- =C2=A0 =C2=A0 =C2=A0emit_insn_before (seq, insn);
>> -+ =C2=A0 =C2=A0 =C2=A0ep_seq =3D gen_sibcall_epilogue ();
>> -+ =C2=A0 =C2=A0 =C2=A0if (ep_seq)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0start_sequence ();
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_note (NOTE_INSN_EPILOGUE_BEG);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_insn (ep_seq);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0seq =3D get_insns ();
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0end_sequence ();
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Retain a map of the epilogue insns. =C2=
=A0Used in life analysis to
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 avoid getting rid of sibcall epilo=
gue insns. =C2=A0Do this before
>> we
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 actually emit the sequence. =C2=A0=
*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0record_insns (seq, NULL, &epilogue_insn_ha=
sh);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0set_insn_locators (seq, epilogue_locator);
>> -+
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit_insn_before (seq, insn);
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> - =C2=A0 =C2=A0 =C2=A0 ei_next (&ei);
>> - =C2=A0 =C2=A0 }
>> - #endif
>> -@@ -5311,6 +5710,8 @@
>> - =C2=A0 =C2=A0 }
>> - #endif
>> -
>> -+ =C2=A0bitmap_clear (&bb_flags);
>> -+
>> - =C2=A0 /* Threading the prologue and epilogue changes the artificial r=
efs
>> - =C2=A0 =C2=A0 =C2=A0in the entry and exit blocks. =C2=A0*/
>> - =C2=A0 epilogue_completed =3D 1;
>> -
>> -=3D=3D=3D modified file 'gcc/genemit.c'
>> ---- old/gcc/genemit.c =C2=A02009-11-27 11:37:06 +0000
>> -+++ new/gcc/genemit.c =C2=A02011-01-05 12:12:18 +0000
>> -@@ -222,6 +222,12 @@
>> - =C2=A0 =C2=A0 case PC:
>> - =C2=A0 =C2=A0 =C2=A0 printf ("pc_rtx");
>> - =C2=A0 =C2=A0 =C2=A0 return;
>> -+ =C2=A0 =C2=A0case RETURN:
>> -+ =C2=A0 =C2=A0 =C2=A0printf ("ret_rtx");
>> -+ =C2=A0 =C2=A0 =C2=A0return;
>> -+ =C2=A0 =C2=A0case SIMPLE_RETURN:
>> -+ =C2=A0 =C2=A0 =C2=A0printf ("simple_return_rtx");
>> -+ =C2=A0 =C2=A0 =C2=A0return;
>> - =C2=A0 =C2=A0 case CLOBBER:
>> - =C2=A0 =C2=A0 =C2=A0 if (REG_P (XEXP (x, 0)))
>> - =C2=A0 =C2=A0 =C2=A0 {
>> -@@ -544,8 +550,8 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (GET_CODE (next) =3D=3D PARALLEL
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && ((GET_CODE (XVECEXP (next=
, 0, 0)) =3D=3D SET
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& GET_C=
ODE (SET_DEST (XVECEXP (next, 0, 0))) =3D=3D PC)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (X=
VECEXP (next, 0, 0)) =3D=3D RETURN))
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (next) =3D=3D RETURN)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ANY_RETURN_=
P (XVECEXP (next, 0, 0))))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ANY_RETURN_P (next))
>> - =C2=A0 =C2=A0 =C2=A0 printf (" =C2=A0emit_jump_insn (");
>> - =C2=A0 =C2=A0 =C2=A0 else if ((GET_CODE (next) =3D=3D SET && GET_CODE =
(SET_SRC (next)) =3D=3D
>> CALL)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (next) =3D=
=3D CALL
>> -@@ -660,7 +666,7 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (GET_CODE (next) =3D=3D PARALLEL
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && GET_CODE (XVECEXP (next, =
0, 0)) =3D=3D SET
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && GET_CODE (SET_DEST (XVECE=
XP (next, 0, 0))) =3D=3D PC)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (next) =3D=3D RETURN)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| ANY_RETURN_P (next))
>> - =C2=A0 =C2=A0 =C2=A0 printf (" =C2=A0emit_jump_insn (");
>> - =C2=A0 =C2=A0 =C2=A0 else if ((GET_CODE (next) =3D=3D SET && GET_CODE =
(SET_SRC (next)) =3D=3D
>> CALL)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| GET_CODE (next) =3D=
=3D CALL
>> -
>> -=3D=3D=3D modified file 'gcc/gengenrtl.c'
>> ---- old/gcc/gengenrtl.c =C2=A0 =C2=A0 =C2=A0 =C2=A02007-08-22 23:30:39 =
+0000
>> -+++ new/gcc/gengenrtl.c =C2=A0 =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 =
+0000
>> -@@ -146,6 +146,10 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcmp (defs[idx].enumname, "REG") =3D=
=3D 0
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcmp (defs[idx].enumname, "SUBREG") =
=3D=3D 0
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcmp (defs[idx].enumname, "MEM") =3D=
=3D 0
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| strcmp (defs[idx].enumname, "PC") =3D=
=3D 0
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| strcmp (defs[idx].enumname, "CC0") =3D=
=3D 0
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| strcmp (defs[idx].enumname, "RETURN") =
=3D=3D 0
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0|| strcmp (defs[idx].enumname, "SIMPLE_RET=
URN") =3D=3D 0
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 || strcmp (defs[idx].enumname, "CONST_VECT=
OR") =3D=3D 0);
>> - }
>> -
>> -
>> -=3D=3D=3D modified file 'gcc/haifa-sched.c'
>> ---- old/gcc/haifa-sched.c =C2=A0 =C2=A0 =C2=A02010-08-12 08:14:47 +0000
>> -+++ new/gcc/haifa-sched.c =C2=A0 =C2=A0 =C2=A02011-01-05 12:12:18 +0000
>> -@@ -4231,7 +4231,7 @@
>> - /* Helper function.
>> - =C2=A0 =C2=A0Find fallthru edge from PRED. =C2=A0*/
>> - edge
>> --find_fallthru_edge (basic_block pred)
>> -+find_fallthru_edge_from (basic_block pred)
>> - {
>> - =C2=A0 edge e;
>> - =C2=A0 edge_iterator ei;
>> -@@ -4298,7 +4298,7 @@
>> - =C2=A0 edge e;
>> -
>> - =C2=A0 last =3D EXIT_BLOCK_PTR->prev_bb;
>> -- =C2=A0e =3D find_fallthru_edge (last);
>> -+ =C2=A0e =3D find_fallthru_edge_from (last);
>> -
>> - =C2=A0 if (e)
>> - =C2=A0 =C2=A0 {
>> -@@ -5234,6 +5234,11 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gcc_ass=
ert (/* Usual case. =C2=A0*/
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (EDGE_COUNT (bb->succs) > 1
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !BARRIER_P (NEXT_INSN (h=
ead)))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Special cases, see cfglayout.c:
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fixup_reorder_chain. =C2=A0*/
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| (EDGE_COUNT (bb->succs) =3D=3D 1
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& (!onlyjump_p (head)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| returnjum=
p_p (head)))
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Or jump to the next instructio=
n. =C2=A0*/
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || (EDGE_COUNT (bb->succs) =3D=3D=
 1
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 && (BB_HEAD (EDGE_I=
 (bb->succs,
>> 0)->dest)
>> -
>> -=3D=3D=3D modified file 'gcc/ifcvt.c'
>> ---- old/gcc/ifcvt.c =C2=A0 =C2=A02010-11-26 12:03:32 +0000
>> -+++ new/gcc/ifcvt.c =C2=A0 =C2=A02011-01-05 12:12:18 +0000
>> -@@ -105,7 +105,7 @@
>> - static int find_if_case_2 (basic_block, edge, edge);
>> - static int find_memory (rtx *, void *);
>> - static int dead_or_predicable (basic_block, basic_block, basic_block,
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 basic_block, int);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 edge, int);
>> - static void noce_emit_move_insn (rtx, rtx);
>> - static rtx block_has_only_trap (basic_block);
>> -
>> -@@ -3791,6 +3791,7 @@
>> - =C2=A0 basic_block then_bb =3D then_edge->dest;
>> - =C2=A0 basic_block else_bb =3D else_edge->dest;
>> - =C2=A0 basic_block new_bb;
>> -+ =C2=A0rtx else_target =3D NULL_RTX;
>> - =C2=A0 int then_bb_index;
>> -
>> - =C2=A0 /* If we are partitioning hot/cold basic blocks, we don't want =
to
>> -@@ -3840,9 +3841,16 @@
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 predictable_edge_p (then_e=
dge)))))
>> - =C2=A0 =C2=A0 return FALSE;
>> -
>> -+ =C2=A0if (else_bb =3D=3D EXIT_BLOCK_PTR)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0rtx jump =3D BB_END (else_edge->src);
>> -+ =C2=A0 =C2=A0 =C2=A0gcc_assert (JUMP_P (jump));
>> -+ =C2=A0 =C2=A0 =C2=A0else_target =3D JUMP_LABEL (jump);
>> -+ =C2=A0 =C2=A0}
>> -+
>> - =C2=A0 /* Registers set are dead, or are predicable. =C2=A0*/
>> - =C2=A0 if (! dead_or_predicable (test_bb, then_bb, else_bb,
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0single_succ (then_bb), 1))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0single_succ_edge (then_bb), 1))
>> - =C2=A0 =C2=A0 return FALSE;
>> -
>> - =C2=A0 /* Conversion went ok, including moving the insns and fixing up=
 the
>> -@@ -3859,6 +3867,9 @@
>> - =C2=A0 =C2=A0 =C2=A0 redirect_edge_succ (FALLTHRU_EDGE (test_bb), else=
_bb);
>> - =C2=A0 =C2=A0 =C2=A0 new_bb =3D 0;
>> - =C2=A0 =C2=A0 }
>> -+ =C2=A0else if (else_bb =3D=3D EXIT_BLOCK_PTR)
>> -+ =C2=A0 =C2=A0new_bb =3D force_nonfallthru_and_redirect (FALLTHRU_EDGE=
 (test_bb),
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 else_bb, else_target);
>> - =C2=A0 else
>> - =C2=A0 =C2=A0 new_bb =3D redirect_edge_and_branch_force (FALLTHRU_EDGE=
 (test_bb),
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0else_bb);
>> -@@ -3957,7 +3968,7 @@
>> - =C2=A0 =C2=A0 return FALSE;
>> -
>> - =C2=A0 /* Registers set are dead, or are predicable. =C2=A0*/
>> -- =C2=A0if (! dead_or_predicable (test_bb, else_bb, then_bb, else_succ-=
>dest,
>> 0))
>> -+ =C2=A0if (! dead_or_predicable (test_bb, else_bb, then_bb, else_succ,=
 0))
>> - =C2=A0 =C2=A0 return FALSE;
>> -
>> - =C2=A0 /* Conversion went ok, including moving the insns and fixing up=
 the
>> -@@ -3995,12 +4006,34 @@
>> -
>> - static int
>> - dead_or_predicable (basic_block test_bb, basic_block merge_bb,
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_b=
lock other_bb, basic_block new_dest, int
>> reversep)
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0basic_b=
lock other_bb, edge dest_edge, int reversep)
>> - {
>> -- =C2=A0rtx head, end, jump, earliest =3D NULL_RTX, old_dest, new_label=
 =3D
>> NULL_RTX;
>> -+ =C2=A0basic_block new_dest =3D dest_edge->dest;
>> -+ =C2=A0rtx head, end, jump, earliest =3D NULL_RTX, old_dest;
>> - =C2=A0 bitmap merge_set =3D NULL;
>> - =C2=A0 /* Number of pending changes. =C2=A0*/
>> - =C2=A0 int n_validated_changes =3D 0;
>> -+ =C2=A0rtx new_dest_label;
>> -+
>> -+ =C2=A0jump =3D BB_END (dest_edge->src);
>> -+ =C2=A0if (JUMP_P (jump))
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0new_dest_label =3D JUMP_LABEL (jump);
>> -+ =C2=A0 =C2=A0 =C2=A0if (new_dest_label =3D=3D NULL_RTX)
>> -+ =C2=A0 =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0new_dest_label =3D PATTERN (jump);
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (ANY_RETURN_P (new_dest_label))=
;
>> -+ =C2=A0 =C2=A0 =C2=A0}
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0else if (other_bb !=3D new_dest)
>> -+ =C2=A0 =C2=A0{
>> -+ =C2=A0 =C2=A0 =C2=A0if (new_dest =3D=3D EXIT_BLOCK_PTR)
>> -+ =C2=A0 =C2=A0 =C2=A0new_dest_label =3D ret_rtx;
>> -+ =C2=A0 =C2=A0 =C2=A0else
>> -+ =C2=A0 =C2=A0 =C2=A0new_dest_label =3D block_label (new_dest);
>> -+ =C2=A0 =C2=A0}
>> -+ =C2=A0else
>> -+ =C2=A0 =C2=A0new_dest_label =3D NULL_RTX;
>> -
>> - =C2=A0 jump =3D BB_END (test_bb);
>> -
>> -@@ -4220,10 +4253,9 @@
>> - =C2=A0 old_dest =3D JUMP_LABEL (jump);
>> - =C2=A0 if (other_bb !=3D new_dest)
>> - =C2=A0 =C2=A0 {
>> -- =C2=A0 =C2=A0 =C2=A0new_label =3D block_label (new_dest);
>> - =C2=A0 =C2=A0 =C2=A0 if (reversep
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0? ! invert_jump_1 (jump, new_label)
>> -- =C2=A0 =C2=A0 =C2=A0 =C2=A0: ! redirect_jump_1 (jump, new_label))
>> -+ =C2=A0 =C2=A0 =C2=A0 =C2=A0? ! invert_jump_1 (jump, new_dest_label)
>> -+
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.linuxtogo.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


