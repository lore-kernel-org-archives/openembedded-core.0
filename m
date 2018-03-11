Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9DE9C788F2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Mar 2018 00:56:17 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id o8so12328347wra.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2018 16:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8vE/wwr5VIW4X9PlxB1IRkADsPPdZasO2p7W+Y+ya3Q=;
	b=UnTYpliXYjiAlXbBcrojg/z1jcFSKMJlT+0jk8pxHBMCARcDH+P/g1bYfxiuY1Wb2u
	nwE/4OFzvcWLdhfzpkATn8JKdiT8rjU+ac9jnfALYKxhBz4r2NItCPmX7doUtQUTRDjE
	KEP8NFtyAxeO/KLZrdEiCXmk9g3wS85uzeWz/tFXLXBn/6Ue4zT8oJwcBaiGruzjVpKG
	wvgqVc4stWVOhjIm1GpOCQHeUv13uySquJmx+mMw0ce44McLd3DLKZgF8xl4TracDe6i
	Q0+ZLlLTx5BBmc6hFda4PUlIskXiHmUsdGaouVGGSDJU0plcIlqq289xMd0NqTU7peLz
	kGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8vE/wwr5VIW4X9PlxB1IRkADsPPdZasO2p7W+Y+ya3Q=;
	b=O6bcDqHk/QdMlqQ2Vrxt6rTo5ojCxqOUQc/ZXKlX4WgXGu6FCrDRV7jtHjbCAEg/C0
	P6SDQ0RJ8HOWbvPzPMHQsno1lDG+xPRBYTyhwjFsDB4jpAGsuPqLb2IYvKwHpvEkZdS/
	2974QYCqOrJoYBiLFj1jzalXSHO4rDMuLICWx/KeJ7ZZ/zqGg/lnVQLpeQlsYXRI22ve
	z4MrEVekjqbdtSk0YvX4rKCUF/70UJNbO8QSuqlwxMchynpS8pOh4/sUxQ5jWFYmJcQQ
	KmRd3LM4Ys5Zj0saCbjroK65CdWZQwP1TeTJKmh4LUR1aBv7Pm8bFBAQWpPq1kXldRgm
	kctQ==
X-Gm-Message-State: AElRT7Go1LROsFL9JvAMc4g6nULsybLtLAGKF+VgY5CoXv9ffCQ6hnYF
	ESlfs0RkH/D9GcMfJRwp64jHhwgFtbyUDDApz9k=
X-Google-Smtp-Source: AG47ELuTjydvT4g/+TfqAZaPSuFx7mAhI69YTewNbuGEgn8qa3hNx9L2+qa4C57WSTrDv4C3ly6rgiPi/0ufPdFrGBE=
X-Received: by 10.223.147.36 with SMTP id 33mr2382573wro.133.1520729778027;
	Sat, 10 Mar 2018 16:56:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sat, 10 Mar 2018 16:56:17 -0800 (PST)
In-Reply-To: <1520717657.10851.169.camel@linuxfoundation.org>
References: <1520639372-12916-1-git-send-email-juro.bystricky@intel.com>
	<6E51916E4A1F32428260031F4C7CD2B64C66B245@ORSMSX112.amr.corp.intel.com>
	<20180310074659.GA7868@jama>
	<1520706468.10851.164.camel@linuxfoundation.org>
	<CA+chaQfpguoc3aumUZbo-3V1n2wyGyHdzwyJ2EeXFemFUOd-7Q@mail.gmail.com>
	<1520717657.10851.169.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Mar 2018 01:56:17 +0100
Message-ID: <CA+chaQejU2YsEFWMydDJgbhtFP5r-e_45k7YqkUo3UdLRvbxVw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH v2] gcc6.4 upgrade
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
X-List-Received-Date: Sun, 11 Mar 2018 00:56:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c0df0283802bd0567187eb3"

--94eb2c0df0283802bd0567187eb3
Content-Type: text/plain; charset="UTF-8"

I've sent the pull requests for all 3 release branches.

I'll let some builders doing more tests over night, but it's very close to
what was merged in master (and also to what is currently in morty-next) so
it should be relatively safe.

The "significant" diffs between gcc-6.4 in various branches:

1) 84d6be8ceb14b418b059212108c5a71a5950e6c3 (last master commits before 6.4
was removed)

master doesn't
have 0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch which
were backported to rocko from gcc-7.1 later
and it doesn't have new backports from Juro
and 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patc fix from Andre

diff -rq meta/recipes-devtools/gcc-rocko
meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4:
0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
Only in
meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/gcc-6.4:
0041-ssp_nonshared.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0001-i386-Move-struct-ix86_frame-to-machine_function.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0004-x86-Add-mindirect-branch.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0005-x86-Add-mfunction-return.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0006-x86-Add-mindirect-branch-register.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0007-x86-Add-V-register-operand-modifier.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0011-i386-Update-mfunction-return-for-return-with-pop.patch
Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:
0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch
Files meta/recipes-devtools/gcc-rocko/gcc-6.4.inc and
meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/gcc-6.4.inc
differ

docker-shr @ ~/openembedded-core $ diff
meta/recipes-devtools/gcc-rocko/gcc-6.4.inc
meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/gcc-6.4.inc
68c68
<
file://0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
---
>            file://0041-ssp_nonshared.patch \
84,96d83
<            file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
<
file://0001-i386-Move-struct-ix86_frame-to-machine_function.patch \
<
file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch \
<
file://0003-i386-Use-const-reference-of-struct-ix86_frame-to-avo.patch \
<            file://0004-x86-Add-mindirect-branch.patch \
<            file://0005-x86-Add-mfunction-return.patch \
<            file://0006-x86-Add-mindirect-branch-register.patch \
<            file://0007-x86-Add-V-register-operand-modifier.patch \
<
file://0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch \
<
file://0009-Use-INVALID_REGNUM-in-indirect-thunk-processing.patch \
<
file://0010-i386-Pass-INVALID_REGNUM-as-invalid-register-number.patch \
<
file://0011-i386-Update-mfunction-return-for-return-with-pop.patch \
<            file://0012-i386-Add-TARGET_INDIRECT_BRANCH_REGISTER.patch \
98d84
<

2) rocko to pyro:
rocko doesn't have uclibc changes anymore and 5.4 (with "gcc: Fix
CVE-2016-6131 in libiberty")

docker-shr @ ~/openembedded-core $ diff -rq meta/recipes-devtools/gcc-pyro
meta/recipes-devtools/gcc-rocko
Only in meta/recipes-devtools/gcc-pyro: gcc-5.4
Only in meta/recipes-devtools/gcc-pyro: gcc-5.4.inc
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4: 0002-uclibc-conf.patch
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4:
0003-gcc-uclibc-locale-ctype_touplow_t.patch
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4: 0004-uclibc-locale.patch
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4:
0005-uclibc-locale-no__x.patch
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4:
0006-uclibc-locale-wchar_fix.patch
Only in meta/recipes-devtools/gcc-pyro/gcc-6.4:
0007-uclibc-locale-update.patch
Files meta/recipes-devtools/gcc-pyro/gcc-6.4.inc and
meta/recipes-devtools/gcc-rocko/gcc-6.4.inc differ

docker-shr @ ~/openembedded-core $ diff -uNr
meta/recipes-devtools/gcc-pyro/gcc-6.4.inc
meta/recipes-devtools/gcc-rocko/gcc-6.4.inc
--- meta/recipes-devtools/gcc-pyro/gcc-6.4.inc  2018-03-11
00:31:45.474829982 +0000
+++ meta/recipes-devtools/gcc-rocko/gcc-6.4.inc 2018-03-11
00:36:58.421852950 +0000
@@ -32,12 +32,6 @@
 SRC_URI = "\
            ${BASEURI} \
            file://0001-gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
-           file://0002-uclibc-conf.patch \
-           file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \
-           file://0004-uclibc-locale.patch \
-           file://0005-uclibc-locale-no__x.patch \
-           file://0006-uclibc-locale-wchar_fix.patch \
-           file://0007-uclibc-locale-update.patch \
            file://0008-missing-execinfo_h.patch \
            file://0009-c99-snprintf.patch \
            file://0010-gcc-poison-system-directories.patch \
@@ -144,8 +138,6 @@
     gcc_cv_libc_provides_ssp=yes \
 "

-EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
-
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \

3) morty to pyro
no changes in patches

4) morty to morty-next (from Juro)

5.4 now also have a backport of CVE-2016-6131.patch
0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch changes
were backported
0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
Upstream-Status fix was included in 6.4 upgrade
0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch was
backported
duplicate 0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
wasn't added to backport folder (it's already in gcc-6.4 as it it was
backported from master)

docker-shr @ ~/openembedded-core $ git diff origin/morty-next
contrib/jansa/morty-backports --stat
 meta/recipes-devtools/gcc/gcc-5.4.inc
                                |   1 +
 meta/recipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch
                                | 251
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.4.inc
                                |   4 ++-
 meta/recipes-devtools/gcc/gcc-6.4/0041-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch
        |  87 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.4/0041-ssp_nonshared.patch
                                 |  28 -----------------
 meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch
        |   2 +-
 meta/recipes-devtools/gcc/gcc-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch
        |  51 +++++++++++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
| 194
-------------------------------------------------------------------------------------------------------------------
 meta/recipes-devtools/gcc/gcc-runtime.inc
                                |   2 ++
 9 files changed, 396 insertions(+), 224 deletions(-)

On Sat, Mar 10, 2018 at 10:34 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2018-03-10 at 22:04 +0100, Martin Jansa wrote:
> > Feel free to ignore my feedback.
> >
> > I didn't mean it as strong objection to get this merged as-is.
> >
> > It was rather an advice for next time or in case another version is
> > sent (e.g. with that missing patch from Khem) and Juro decides to
> > rework it in order to save himself some time later when preparing the
> > changes for pyro and rocko (as he said in the e-mail that he plans to
> > prepare). It shouldn't be too difficult to rework anyway, because
> > Andre already has the cherry-picks for morty and Juro can do just
> > rebase of his change on top of that to get those new patches in
> > separate commit.
>
> Juro's mail reply was a bit messed up with formatting but that missing
> arm patch appeared to cause an internal compiler error when compiling
> valgrind for x86-64 and I suspect that is why its missing. If we do
> want to consider that one I'd probably make it a separate issue.
>
> I can't really merge anything due to our backports policy until we have
> at least the pyro patches sorted. I'm still torn on which way to go but
> if someone can pull together a good set of patches for the various
> branches I would take it. I'm also pretty sure Juro will be fine if
> someone wants to break that patch up.
>
> Cheers,
>
> Richard
>
>
>

--94eb2c0df0283802bd0567187eb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve sent the pull requests for all 3 release branches=
.<div><br></div><div>I&#39;ll let some builders doing more tests over night=
, but it&#39;s very close to what was merged in master (and also to what is=
 currently in morty-next) so it should be relatively safe.</div><div><br></=
div><div>The &quot;significant&quot; diffs between gcc-6.4 in various branc=
hes:</div><div><br></div><div>1)=C2=A0<span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-l=
igatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:nor=
mal;text-align:start;text-indent:0px;text-transform:none;white-space:normal=
;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:i=
nitial;text-decoration-color:initial;float:none;display:inline">84d6be8ceb1=
4b418b059212108c5a71a5950e6c3 (last master commits before 6.4 was removed)<=
/span></div><div><br></div><div>master doesn&#39;t have=C2=A00041-Add-ssp_n=
onshared-to-link-commandline-for-musl-targe.patch which were backported to =
rocko from gcc-7.1 later</div><div>and it doesn&#39;t have new backports fr=
om Juro and=C2=A00001-enable-FL_LPAE-flag-for-armv7ve-cores.patc fix from A=
ndre</div><div><br></div><div><div>diff -rq meta/recipes-devtools/gcc-rocko=
 meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/=
</div><div>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4: 0041-Add-ssp_no=
nshared-to-link-commandline-for-musl-targe.patch</div><div>Only in meta/rec=
ipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5950e6c3/gcc-6.4: =
0041-ssp_nonshared.patch</div><div>Only in meta/recipes-devtools/gcc-rocko/=
gcc-6.4/backport: 0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch</div><di=
v>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport: 0001-i386-Move-=
struct-ix86_frame-to-machine_function.patch</div><div>Only in meta/recipes-=
devtools/gcc-rocko/gcc-6.4/backport: 0002-i386-Use-reference-of-struct-ix86=
_frame-to-avoid-cop.patch</div><div>Only in meta/recipes-devtools/gcc-rocko=
/gcc-6.4/backport: 0003-i386-Use-const-reference-of-struct-ix86_frame-to-av=
o.patch</div><div>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport:=
 0004-x86-Add-mindirect-branch.patch</div><div>Only in meta/recipes-devtool=
s/gcc-rocko/gcc-6.4/backport: 0005-x86-Add-mfunction-return.patch</div><div=
>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport: 0006-x86-Add-min=
direct-branch-register.patch</div><div>Only in meta/recipes-devtools/gcc-ro=
cko/gcc-6.4/backport: 0007-x86-Add-V-register-operand-modifier.patch</div><=
div>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport: 0008-x86-Disa=
llow-mindirect-branch-mfunction-return-with-.patch</div><div>Only in meta/r=
ecipes-devtools/gcc-rocko/gcc-6.4/backport: 0009-Use-INVALID_REGNUM-in-indi=
rect-thunk-processing.patch</div><div>Only in meta/recipes-devtools/gcc-roc=
ko/gcc-6.4/backport: 0010-i386-Pass-INVALID_REGNUM-as-invalid-register-numb=
er.patch</div><div>Only in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport=
: 0011-i386-Update-mfunction-return-for-return-with-pop.patch</div><div>Onl=
y in meta/recipes-devtools/gcc-rocko/gcc-6.4/backport: 0012-i386-Add-TARGET=
_INDIRECT_BRANCH_REGISTER.patch</div><div>Files meta/recipes-devtools/gcc-r=
ocko/gcc-6.4.inc and meta/recipes-devtools/gcc-master-84d6be8ceb14b418b0592=
12108c5a71a5950e6c3/gcc-6.4.inc differ</div></div><div><br></div><div><div>=
docker-shr @ ~/openembedded-core $ diff meta/recipes-devtools/gcc-rocko/gcc=
-6.4.inc meta/recipes-devtools/gcc-master-84d6be8ceb14b418b059212108c5a71a5=
950e6c3/gcc-6.4.inc</div><div>68c68</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 file://0041-Add-ssp_nonshared-to-link-commandline-for-mus=
l-targe.patch \</div><div>---</div><div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://0041-ssp_nonshared.patch \</div><div>84,96d83</div><div>&=
lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-enable-FL_LPAE-fla=
g-for-armv7ve-cores.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 file://0001-i386-Move-struct-ix86_frame-to-machine_function.patc=
h \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-i38=
6-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch \</div><div>&lt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-i386-Use-const-reference=
-of-struct-ix86_frame-to-avo.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 file://0004-x86-Add-mindirect-branch.patch \</div><div>&l=
t;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-x86-Add-mfunction-r=
eturn.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:=
//0006-x86-Add-mindirect-branch-register.patch \</div><div>&lt;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-x86-Add-V-register-operand-modi=
fier.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file:/=
/0008-x86-Disallow-mindirect-branch-mfunction-return-with-.patch \</div><di=
v>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-Use-INVALID_REG=
NUM-in-indirect-thunk-processing.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 file://0010-i386-Pass-INVALID_REGNUM-as-invalid-regis=
ter-number.patch \</div><div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
file://0011-i386-Update-mfunction-return-for-return-with-pop.patch \</div><=
div>&lt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0012-i386-Add-TARG=
ET_INDIRECT_BRANCH_REGISTER.patch \</div><div>98d84</div><div>&lt;=C2=A0</d=
iv></div><div><br></div><div>2) rocko to pyro:</div><div>rocko doesn&#39;t =
have uclibc changes anymore and 5.4 (with &quot;gcc: Fix CVE-2016-6131 in l=
ibiberty&quot;)</div><div><br></div><div><div>docker-shr @ ~/openembedded-c=
ore $ diff -rq meta/recipes-devtools/gcc-pyro meta/recipes-devtools/gcc-roc=
ko=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0</div><div>Only in meta/recipes-devtools/gcc-pyro: gcc-5.4</div><div>=
Only in meta/recipes-devtools/gcc-pyro: gcc-5.4.inc</div><div>Only in meta/=
recipes-devtools/gcc-pyro/gcc-6.4: 0002-uclibc-conf.patch</div><div>Only in=
 meta/recipes-devtools/gcc-pyro/gcc-6.4: 0003-gcc-uclibc-locale-ctype_toupl=
ow_t.patch</div><div>Only in meta/recipes-devtools/gcc-pyro/gcc-6.4: 0004-u=
clibc-locale.patch</div><div>Only in meta/recipes-devtools/gcc-pyro/gcc-6.4=
: 0005-uclibc-locale-no__x.patch</div><div>Only in meta/recipes-devtools/gc=
c-pyro/gcc-6.4: 0006-uclibc-locale-wchar_fix.patch</div><div>Only in meta/r=
ecipes-devtools/gcc-pyro/gcc-6.4: 0007-uclibc-locale-update.patch</div><div=
>Files meta/recipes-devtools/gcc-pyro/gcc-6.4.inc and meta/recipes-devtools=
/gcc-rocko/gcc-6.4.inc differ</div><div><br></div></div><div><div>docker-sh=
r @ ~/openembedded-core $ diff -uNr meta/recipes-devtools/gcc-pyro/gcc-6.4.=
inc meta/recipes-devtools/gcc-rocko/gcc-6.4.inc</div><div>--- meta/recipes-=
devtools/gcc-pyro/gcc-6.4.inc=C2=A0 2018-03-11 00:31:45.474829982 +0000</di=
v><div>+++ meta/recipes-devtools/gcc-rocko/gcc-6.4.inc 2018-03-11 00:36:58.=
421852950 +0000</div><div>@@ -32,12 +32,6 @@</div><div>=C2=A0SRC_URI =3D &q=
uot;\</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${BASEURI} \</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gcc-4.3.1-ARCH_=
FLAGS_FOR_TARGET.patch \</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://0002-uclibc-conf.patch \</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0file://0003-gcc-uclibc-locale-ctype_touplow_t.patch \</div><di=
v>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-uclibc-locale.patch=
 \</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-uclibc-l=
ocale-no__x.patch \</div><div>-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fil=
e://0006-uclibc-locale-wchar_fix.patch \</div><div>-=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0file://0007-uclibc-locale-update.patch \</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-missing-execinfo_h.patch=
 \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-c99-snpr=
intf.patch \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://001=
0-gcc-poison-system-directories.patch \</div><div>@@ -144,8 +138,6 @@</div>=
<div>=C2=A0 =C2=A0 =C2=A0gcc_cv_libc_provides_ssp=3Dyes \</div><div>=C2=A0&=
quot;</div><div>=C2=A0</div><div>-EXTRA_OECONF_append_libc-uclibc =3D &quot=
; --disable-decimal-float &quot;</div><div>-</div><div>=C2=A0EXTRA_OECONF_P=
ATHS =3D &quot;\</div><div>=C2=A0 =C2=A0 =C2=A0--with-gxx-include-dir=3D/no=
t/exist{target_includedir}/c++/${BINV} \</div><div>=C2=A0 =C2=A0 =C2=A0--wi=
th-sysroot=3D/not/exist \</div></div><div><br></div><div>3) morty to pyro</=
div><div>no changes in patches</div><div><br></div><div>4) morty to morty-n=
ext (from Juro)</div><div><br></div><div>5.4 now also have a backport of=C2=
=A0CVE-2016-6131.patch</div><div><span style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">0041-Add-ssp_non=
shared-to-link-commandline-for-musl-targe.patch changes were backported</sp=
an><br></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline"><span style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-s=
tyle:initial;text-decoration-color:initial;float:none;display:inline">0047-=
libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch Upstream-Status =
fix was included in 6.4 upgrade</span><br></span></div><div><span style=3D"=
text-align:start;text-indent:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne"><span style=3D"text-align:start;text-indent:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">0056-LRA-PR70904-relax-the-restriction-on-subreg-rel=
oad-f.patch was backported<br></span></span></div><div><span style=3D"text-=
align:start;text-indent:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline"><=
span style=3D"text-align:start;text-indent:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">duplicate 0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-=
strd-peeph.patch wasn&#39;t added to backport folder (it&#39;s already in g=
cc-6.4 as it it was backported from master)<br></span></span></div><div><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:smal=
l;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline"><span style=3D"color:rgb(34,34,34);font-family:arial=
,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline"><br></span></span></div><d=
iv><div>docker-shr @ ~/openembedded-core $ git diff origin/morty-next contr=
ib/jansa/morty-backports --stat</div><div>=C2=A0meta/recipes-devtools/gcc/g=
cc-5.4.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +</div><div>=C2=A0meta/r=
ecipes-devtools/gcc/gcc-5.4/CVE-2016-6131.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 251 +++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++</div><div>=C2=A0meta/recipes-devtools/gcc/gcc-6.4.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 ++-</div><div>=C2=A0meta/recipes-d=
evtools/gcc/gcc-6.4/0041-Add-ssp_nonshared-to-link-commandline-for-musl-tar=
ge.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 87 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++</div><div>=C2=A0meta/recipes-devtools/gcc/g=
cc-6.4/0041-ssp_nonshared.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 28 -----=
------------</div><div>=C2=A0meta/recipes-devtools/gcc/gcc-6.4/0047-libgcc_=
s-Use-alias-for-__cpu_indicator_init-instead-.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-</div><div>=C2=A0meta/recipes-devtools/gcc/gcc=
-6.4/0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 51 +++++++++++++++++++++++++++++++</div=
><div>=C2=A0meta/recipes-devtools/gcc/gcc-6.4/backport/0057-ARM-PR-82445-su=
ppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 -------------------------=
---------------------------------------------------------------------------=
---------------</div><div>=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 ++</div><div>=C2=A09 files changed, 396 insertio=
ns(+), 224 deletions(-)</div></div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">On Sat, Mar 10, 2018 at 10:34 PM, Richard Purdie <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, 2018-03-10 at 22:=
04 +0100, Martin Jansa wrote:<br>
&gt; Feel free to ignore my feedback.<br>
&gt;<br>
&gt; I didn&#39;t mean it as strong objection to get this merged as-is.<br>
&gt;<br>
&gt; It was rather an advice for next time or in case another version is<br=
>
&gt; sent (e.g. with that missing patch from Khem) and Juro decides to<br>
&gt; rework it in order to save himself some time later when preparing the<=
br>
&gt; changes for pyro and rocko (as he said in the e-mail that he plans to<=
br>
&gt; prepare). It shouldn&#39;t be too difficult to rework anyway, because<=
br>
&gt; Andre already has the cherry-picks for morty and Juro can do just<br>
&gt; rebase of his change on top of that to get those new patches in<br>
&gt; separate commit.<br>
<br>
</span>Juro&#39;s mail reply was a bit messed up with formatting but that m=
issing<br>
arm patch appeared to cause an internal compiler error when compiling<br>
valgrind for x86-64 and I suspect that is why its missing. If we do<br>
want to consider that one I&#39;d probably make it a separate issue.<br>
<br>
I can&#39;t really merge anything due to our backports policy until we have=
<br>
at least the pyro patches sorted. I&#39;m still torn on which way to go but=
<br>
if someone can pull together a good set of patches for the various<br>
branches I would take it. I&#39;m also pretty sure Juro will be fine if<br>
someone wants to break that patch up.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--94eb2c0df0283802bd0567187eb3--
