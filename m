Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF3779B5F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 21:16:28 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 206-v6so15323462wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Oct 2018 14:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q8yXE6RGk5ixM+a98zKMk5U98MX8Q1zTRvMaO3ugTOI=;
	b=aaXrrRMalR9k+E56VTj65vOHw2TwJqiSW01/QLoyngqLcWk5X13aNPYTgFjczU3WnL
	JPO7BZXGmRSCfSac/azzQrSB7RkY+8aAGxoqj3adScjedMWAKfoLYd4DHSxMFCV8RrDM
	s5YrtG+2tW9Z99nlX/C9/D7LV3yo5ik9z6/TQ+vVTfJhk1aq9EFDiNaTkKryt/vUoB1K
	thrnI6+/i5G+ztGDWQ0vcbCSxDn7od8dxmVZybgtmNTJxWbWuscfjk5JZvcVLxbLRuoe
	pa2L5Fy7KXVs/yWHMH3lBQqhygJn5USyr1rzIgR49/4I3vUOs80zZT96ArS8QdC9TNk1
	71YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q8yXE6RGk5ixM+a98zKMk5U98MX8Q1zTRvMaO3ugTOI=;
	b=aoGQTvzpMKsasc+Gm/YgIla82sv0f2MmLTfolZYNI70HCQav4OR+dF1Nb+sn7+c50X
	1KuGlvl9b1CkIGFxWRNfIBTHe9jXReCpxTpn9qqMuLVvDVc2JRyVyBYFLguRjK0ZZDZW
	RX7PeRnvIxdP8JUz/GWYMxX9EVeEhGztWXQ8YX/gi+8YqvQS6Eo64gvOKZJsMK5O1CWJ
	bxgTAWdfRefORxsQwMD28R46LEyyuBpGhlxl/NmpgdPNU3siXbkiXesHnFAJLUxa4i1x
	GiBmT9RQqqgR3vwU4K0E9XrhQRm1/yyl5IbjWaRdRwRWIusloJNXs6RNA5h0iyApnou5
	/TVw==
X-Gm-Message-State: ABuFfogisUVAAsgyLHv0FeEgj4aNthTvYiqNintHXu1hbtxpLAI1zeKp
	AFwlpopP442vfSlVim3f1+HaAp01dR/+ihQ5dxo=
X-Google-Smtp-Source: ACcGV63e1QEail1ZuUIQm+ktP5R8pUaGalYZJEGNpZGQnQRASkVk9GWaH9zR4VoF5dYGnX/CiraJyrV+OIZ9SLs4UzA=
X-Received: by 2002:a1c:7c07:: with SMTP id x7-v6mr7193609wmc.32.1539465389009;
	Sat, 13 Oct 2018 14:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
	<CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
	<CA+chaQfMOrF8NWwHww6zJDjL2KaJvn2uPa0Xbz2ipHLSG9ooTQ@mail.gmail.com>
	<f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
In-Reply-To: <f50185f96f49dd8e3e094549bcccdb9c100adbd0.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 13 Oct 2018 23:16:17 +0200
Message-ID: <CA+chaQcLQSmXABciMyrUvnVrBoqLqr+jYH+tXV8oOgCGhFrSFA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Sat, 13 Oct 2018 21:16:29 -0000
Content-Type: multipart/alternative; boundary="000000000000a7f241057822b723"

--000000000000a7f241057822b723
Content-Type: text/plain; charset="UTF-8"

I was checking my builds and here is what I've found.

The dependency on virtual/libc-locale is correctly shown in bitbake -e
glib-2.0.

The glibc-locale is selected as provider for these as expected:

bitbake -v -v -v glib-2.0
...
NOTE: selecting glibc-locale to satisfy virtual/libc-locale due to
PREFERRED_PROVIDERS
NOTE: selecting glibc to satisfy virtual/libc due to PREFERRED_PROVIDERS
NOTE: selecting pkgconfig-native to satisfy pkgconfig-native due to
PREFERRED_PROVIDERS
NOTE: selecting glibc-locale to satisfy runtime locale-base-es-es due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-fa-ir due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-de-de due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-iso8859-15 due
to PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime
glibc-localedata-translit-cjk-variants due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-cp1255 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-invariant due
to PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-utf-8 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-32 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-16 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-en-gb due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-cp1255 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-ru-ru due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-tr-tr due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-lt-lt due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-ja-jp.euc-jp
due to PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-hr-hr due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-fr-fr due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-7 due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-euc-jp due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime glibc-gconv-iso8859-1 due
to PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale
NOTE: selecting glibc-locale to satisfy runtime locale-base-el-gr due to
PREFERRED_PROVIDER_virtual/libc-locale = glibc-locale

But then insane.bbclass doesn't find rdep_data with "rdep_data =
oe.packagedata.read_subpkgdata(rdepend, d)", because there is locale-base-*
only for en-us in our build:

$ ls pkgdata/qemux86/runtime/locale-base-*
pkgdata/qemux86/runtime/locale-base-en-us
pkgdata/qemux86/runtime/locale-base-en-us.packaged

Which leads to:
GLIBC_GENERATE_LOCALES="en_US.UTF-8"
set in our builds.

I'm sorry for noise, I wish it would be more obvious, especially because
there was still one more mystery with bash recipe which has:
RDEPENDS_${PN}-ptest_append_libc-glibc = " locale-base-fr-fr
locale-base-de-de"
and doesn't trigger the QA errors in our builds, and I've discovered that
I've found about this long time ago and added work around in out bash
bbappend:

# We need to revert changes from
#
http://git.openembedded.org/openembedded-core/commit/?h=rocko&id=70e544452b6825686f06484d994936ded677825f
# because as described in:
#
http://lists.openembedded.org/pipermail/openembedded-commits/2017-November/215520.html
# it doesn't work when GLIBC_GENERATE_LOCALES are restricted like they are
in our builds:
#
meta-distro1/conf/distro/include/distro1-toolchain.inc:GLIBC_GENERATE_LOCALES
= "en_US.UTF-8"
#
meta-distro2/conf/distro/include/distro2-toolchain.inc:GLIBC_GENERATE_LOCALES
= "en_US.UTF-8"
RDEPENDS_${PN}-ptest_remove_libc-glibc = "locale-base-fr-fr
locale-base-de-de"

So clearly a year is too long for my memory to remember tweaks like this
especially when bitbake -e doesn't show them (more about that bellow).

Maybe we should improve the comment in meta/conf/local.conf.sample.extended
to explain possible issues with ptest when GLIBC_GENERATE_LOCALES doesn't
include certain locales? Now there is only this paragraph:

# Set GLIBC_GENERATE_LOCALES to the locales you wish to generate should you
not
# wish to perform the time-consuming step of generating all LIBC locales.
# NOTE: If removing en_US.UTF-8 you will also need to uncomment, and set
# appropriate value for IMAGE_LINGUAS.
# WARNING: this may break localisation!
#GLIBC_GENERATE_LOCALES = "en_GB.UTF-8 en_US.UTF-8"
#IMAGE_LINGUAS ?= "en-gb"

I'll send patch for that.

There is locale-base-fr-fr listed twice in glib.inc, I'll send patch for
that as well.

I wonder why locale-base isn't shown at all in bitbake -e bash with my
bbappend removing the dependency:

# $RDEPENDS_bash-ptest [3 operations]
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#     "make"
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native
data_smart.py:641 [renameVar]
#     ""
#   override[class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
#     ""
# pre-expansion value:
#   "make"
RDEPENDS_bash-ptest="make"

There isn't any history about RDEPENDS_${PN}-ptest before the rename.

$ grep RDEPENDS.*ptest env.bash
#   override[bash-ptest]:rename from RDEPENDS_${PN}-ptest data.py:116
[expandKeys]
#   override[bash-ptest_class-native]:rename from
RDEPENDS_${PN}-ptest_class-native data_smart.py:641 [renameVar]
#   override[bash-ptest_class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
# $RDEPENDS_bash-ptest [3 operations]
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native
data_smart.py:641 [renameVar]
#   override[class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
RDEPENDS_bash-ptest="make"
# $RDEPENDS_bash-ptest_class-native
#   rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641
[renameVar]
RDEPENDS_bash-ptest_class-native=""
# $RDEPENDS_bash-ptest_class-nativesdk
#   rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641
[renameVar]
RDEPENDS_bash-ptest_class-nativesdk=""

$ grep locale-base env.bash
$

And in the build without the bbappend:

# $RDEPENDS_bash-ptest [3 operations]
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#     " make"
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native
data_smart.py:641 [renameVar]
#     ""
#   override[class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
#     ""
# pre-expansion value:
#   " make locale-base-fr-fr locale-base-de-de"
RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"

but also without the RDEPENDS_${PN}-ptest history:

$ grep RDEPENDS.*ptest env.bash
#   override[bash-ptest]:rename from RDEPENDS_${PN}-ptest data.py:116
[expandKeys]
#   override[bash-ptest_class-native]:rename from
RDEPENDS_${PN}-ptest_class-native data_smart.py:641 [renameVar]
#   override[bash-ptest_class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
# $RDEPENDS_bash-ptest [3 operations]
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native
data_smart.py:641 [renameVar]
#   override[class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"
# $RDEPENDS_bash-ptest_class-native
#   rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641
[renameVar]
RDEPENDS_bash-ptest_class-native=""
# $RDEPENDS_bash-ptest_class-nativesdk
#   rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641
[renameVar]
RDEPENDS_bash-ptest_class-nativesdk=""

$ grep locale-base env.bash
#   " make locale-base-fr-fr locale-base-de-de"
RDEPENDS_bash-ptest=" make locale-base-fr-fr locale-base-de-de"

The same with glib-2.0:
# $RDEPENDS_glib-2.0-ptest [3 operations]
#   rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]
#     " gnome-desktop-testing             dbus
 gnome-desktop-testing             tzdata             tzdata-americas
       tzdata-asia             tzdata-europe             tzdata-posix
       shared-mime-info            "
#   override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native
data_smart.py:641 [renameVar]
#     ""
#   override[class-nativesdk]:rename from
RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]
#     ""
# pre-expansion value:
#   " gnome-desktop-testing             dbus
 gnome-desktop-testing             tzdata             tzdata-americas
       tzdata-asia             tzdata-europe             tzdata-posix
       shared-mime-info                        glibc-gconv-utf-16
   glibc-charmap-utf-8             glibc-gconv-cp1255
 glibc-charmap-cp1255             glibc-gconv-utf-32
 glibc-gconv-utf-7             glibc-gconv-euc-jp
 glibc-gconv-iso8859-1             glibc-gconv-iso8859-15
 glibc-charmap-invariant
 glibc-localedata-translit-cjk-variants             locale-base-tr-tr
       locale-base-lt-lt             locale-base-ja-jp.euc-jp
 locale-base-fa-ir             locale-base-ru-ru
 locale-base-de-de             locale-base-hr-hr
 locale-base-el-gr             locale-base-fr-fr
 locale-base-fr-fr             locale-base-es-es
 locale-base-en-gb            "
RDEPENDS_glib-2.0-ptest=" gnome-desktop-testing             dbus
 gnome-desktop-testing             tzdata             tzdata-americas
       tzdata-asia             tzdata-europe             tzdata-posix
       shared-mime-info                        glibc-gconv-utf-16
   glibc-charmap-utf-8             glibc-gconv-cp1255
 glibc-charmap-cp1255             glibc-gconv-utf-32
 glibc-gconv-utf-7             glibc-gconv-euc-jp
 glibc-gconv-iso8859-1             glibc-gconv-iso8859-15
 glibc-charmap-invariant
 glibc-localedata-translit-cjk-variants             locale-base-tr-tr
       locale-base-lt-lt             locale-base-ja-jp.euc-jp
 locale-base-fa-ir             locale-base-ru-ru
 locale-base-de-de             locale-base-hr-hr
 locale-base-el-gr             locale-base-fr-fr
 locale-base-fr-fr             locale-base-es-es
 locale-base-en-gb            "

It just magically appears in pre-expansion value.

Shouldn't bitbake -e show that "locale-base-fr-fr locale-base-de-de" were
appended (and in the build with bbappend that they were appended and then
removed)? That would help me to find out what's going on much faster.

Cheers,





On Sat, Oct 13, 2018 at 12:29 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2018-10-13 at 02:15 +0200, Martin Jansa wrote:
> > Hi,
> >
> > sorry for delay, I was first testing a bit more specific fix:
> > DEPENDS_append_libc-glibc = "${@bb.utils.contains('PTEST_ENABLED',
> > '1', '', ' virtual/libc-locale', d)}"
> >
> > but unfortunately this nor your shorter version work.
> >
> > and it's reproducible without the multilib enabled as well:
> >
> > ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-de-de, but it isn't a build dependency? [build-deps]
> > ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-el-gr, but it isn't a build dependency? [build-deps]
> > ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest
> rdepends on locale-base-en-gb, but it isn't a build dependency? [build-deps]
>
> What is also puzzling me is that we're not seeing this in OE-Core on
> the autobuilders. We recently merged much better warning summary code
> so we should see this quite clearly in its output and we're not...
>
> I'm not sure what that means but it suggests there is something going
> on here we're not quite seeing...
>
> Cheers,
>
> Richard
>
>
>

--000000000000a7f241057822b723
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div>I was checking my builds and here is what I&#39=
;ve found.</div><div><br></div>The dependency on=C2=A0virtual/libc-locale i=
s correctly shown in bitbake -e glib-2.0.</div><div dir=3D"ltr"><br></div><=
div>The glibc-locale is selected as provider for these as expected:</div><d=
iv><br></div><div>bitbake -v -v -v glib-2.0</div><div>...</div><div><div>NO=
TE: selecting glibc-locale to satisfy virtual/libc-locale due to PREFERRED_=
PROVIDERS</div><div>NOTE: selecting glibc to satisfy virtual/libc due to PR=
EFERRED_PROVIDERS</div><div>NOTE: selecting pkgconfig-native to satisfy pkg=
config-native due to PREFERRED_PROVIDERS</div><div>NOTE: selecting glibc-lo=
cale to satisfy runtime locale-base-es-es due to PREFERRED_PROVIDER_virtual=
/libc-locale =3D glibc-locale</div><div>NOTE: selecting glibc-locale to sat=
isfy runtime locale-base-fa-ir due to PREFERRED_PROVIDER_virtual/libc-local=
e =3D glibc-locale</div><div>NOTE: selecting glibc-locale to satisfy runtim=
e locale-base-de-de due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc=
-locale</div><div>NOTE: selecting glibc-locale to satisfy runtime glibc-gco=
nv-iso8859-15 due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-local=
e</div><div>NOTE: selecting glibc-locale to satisfy runtime glibc-localedat=
a-translit-cjk-variants due to PREFERRED_PROVIDER_virtual/libc-locale =3D g=
libc-locale</div><div>NOTE: selecting glibc-locale to satisfy runtime glibc=
-gconv-cp1255 due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-local=
e</div><div>NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-i=
nvariant due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale</di=
v><div>NOTE: selecting glibc-locale to satisfy runtime glibc-charmap-utf-8 =
due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale</div><div>NO=
TE: selecting glibc-locale to satisfy runtime glibc-gconv-utf-32 due to PRE=
FERRED_PROVIDER_virtual/libc-locale =3D glibc-locale</div><div>NOTE: select=
ing glibc-locale to satisfy runtime glibc-gconv-utf-16 due to PREFERRED_PRO=
VIDER_virtual/libc-locale =3D glibc-locale</div><div>NOTE: selecting glibc-=
locale to satisfy runtime locale-base-en-gb due to PREFERRED_PROVIDER_virtu=
al/libc-locale =3D glibc-locale</div><div>NOTE: selecting glibc-locale to s=
atisfy runtime glibc-charmap-cp1255 due to PREFERRED_PROVIDER_virtual/libc-=
locale =3D glibc-locale</div><div>NOTE: selecting glibc-locale to satisfy r=
untime locale-base-ru-ru due to PREFERRED_PROVIDER_virtual/libc-locale =3D =
glibc-locale</div><div>NOTE: selecting glibc-locale to satisfy runtime loca=
le-base-tr-tr due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-local=
e</div><div>NOTE: selecting glibc-locale to satisfy runtime locale-base-lt-=
lt due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale</div><div=
>NOTE: selecting glibc-locale to satisfy runtime locale-base-ja-jp.euc-jp d=
ue to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale</div><div>NOT=
E: selecting glibc-locale to satisfy runtime locale-base-hr-hr due to PREFE=
RRED_PROVIDER_virtual/libc-locale =3D glibc-locale</div><div>NOTE: selectin=
g glibc-locale to satisfy runtime locale-base-fr-fr due to PREFERRED_PROVID=
ER_virtual/libc-locale =3D glibc-locale</div><div>NOTE: selecting glibc-loc=
ale to satisfy runtime glibc-gconv-utf-7 due to PREFERRED_PROVIDER_virtual/=
libc-locale =3D glibc-locale</div><div>NOTE: selecting glibc-locale to sati=
sfy runtime glibc-gconv-euc-jp due to PREFERRED_PROVIDER_virtual/libc-local=
e =3D glibc-locale</div><div>NOTE: selecting glibc-locale to satisfy runtim=
e glibc-gconv-iso8859-1 due to PREFERRED_PROVIDER_virtual/libc-locale =3D g=
libc-locale</div><div>NOTE: selecting glibc-locale to satisfy runtime local=
e-base-el-gr due to PREFERRED_PROVIDER_virtual/libc-locale =3D glibc-locale=
</div></div><div><br></div><div>But then insane.bbclass doesn&#39;t find rd=
ep_data with &quot;rdep_data =3D oe.packagedata.read_subpkgdata(rdepend, d)=
&quot;, because there is locale-base-* only for en-us in our build:</div><d=
iv><br></div><div><div>$ ls pkgdata/qemux86/runtime/locale-base-*</div><div=
>pkgdata/qemux86/runtime/locale-base-en-us=C2=A0 pkgdata/qemux86/runtime/lo=
cale-base-en-us.packaged</div></div><div><br></div><div>Which leads to:</di=
v><div>GLIBC_GENERATE_LOCALES=3D&quot;en_US.UTF-8&quot;<br></div><div>set i=
n our builds.</div><div><br></div><div>I&#39;m sorry for noise, I wish it w=
ould be more obvious, especially because there was still one more mystery w=
ith bash recipe which has:</div><div>RDEPENDS_${PN}-ptest_append_libc-glibc=
 =3D &quot; locale-base-fr-fr locale-base-de-de&quot;<br></div><div>and doe=
sn&#39;t trigger the QA errors in our builds, and I&#39;ve discovered that =
I&#39;ve found about this long time ago and added work around in out bash b=
bappend:</div><div><br></div><div><div># We need to revert changes from</di=
v><div># <a href=3D"http://git.openembedded.org/openembedded-core/commit/?h=
=3Drocko&amp;id=3D70e544452b6825686f06484d994936ded677825f">http://git.open=
embedded.org/openembedded-core/commit/?h=3Drocko&amp;id=3D70e544452b6825686=
f06484d994936ded677825f</a></div><div># because as described in:</div><div>=
# <a href=3D"http://lists.openembedded.org/pipermail/openembedded-commits/2=
017-November/215520.html">http://lists.openembedded.org/pipermail/openembed=
ded-commits/2017-November/215520.html</a></div><div># it doesn&#39;t work w=
hen GLIBC_GENERATE_LOCALES are restricted like they are in our builds:</div=
><div># meta-distro1/conf/distro/include/distro1-toolchain.inc:GLIBC_GENERA=
TE_LOCALES =3D &quot;en_US.UTF-8&quot;</div><div># meta-distro2/conf/distro=
/include/distro2-toolchain.inc:GLIBC_GENERATE_LOCALES =3D &quot;en_US.UTF-8=
&quot;</div><div>RDEPENDS_${PN}-ptest_remove_libc-glibc =3D &quot;locale-ba=
se-fr-fr locale-base-de-de&quot;</div></div><div><br></div><div>So clearly =
a year is too long for my memory to remember tweaks like this especially wh=
en bitbake -e doesn&#39;t show them (more about that bellow).</div><div><br=
></div><div>Maybe we should improve the comment in=C2=A0meta/conf/local.con=
f.sample.extended to explain possible issues with ptest when GLIBC_GENERATE=
_LOCALES doesn&#39;t include certain locales? Now there is only this paragr=
aph:</div><div><br></div><div><div># Set GLIBC_GENERATE_LOCALES to the loca=
les you wish to generate should you not</div><div># wish to perform the tim=
e-consuming step of generating all LIBC locales.</div><div># NOTE: If remov=
ing en_US.UTF-8 you will also need to uncomment, and set</div><div># approp=
riate value for IMAGE_LINGUAS.</div><div># WARNING: this may break localisa=
tion!</div><div>#GLIBC_GENERATE_LOCALES =3D &quot;en_GB.UTF-8 en_US.UTF-8&q=
uot;</div><div>#IMAGE_LINGUAS ?=3D &quot;en-gb&quot;</div></div><div><br></=
div><div>I&#39;ll send patch for that.</div><div><br></div><div>There is=C2=
=A0locale-base-fr-fr listed twice in glib.inc, I&#39;ll send patch for that=
 as well.</div><div><br></div><div>I wonder why locale-base isn&#39;t shown=
 at all in bitbake -e bash with my bbappend removing the dependency:</div><=
div><br></div><div><div># $RDEPENDS_bash-ptest [3 operations]</div><div>#=
=C2=A0 =C2=A0rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]</div=
><div>#=C2=A0 =C2=A0 =C2=A0&quot;make&quot;</div><div>#=C2=A0 =C2=A0overrid=
e[class-native]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py=
:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;&quot;</div><div>#=C2=
=A0 =C2=A0override[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-=
nativesdk data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&quo=
t;&quot;</div><div># pre-expansion value:</div><div>#=C2=A0 =C2=A0&quot;mak=
e&quot;</div><div>RDEPENDS_bash-ptest=3D&quot;make&quot;</div></div><div><b=
r></div><div>There isn&#39;t any history about=C2=A0RDEPENDS_${PN}-ptest be=
fore the rename.</div><div><br></div><div><div>$ grep RDEPENDS.*ptest env.b=
ash</div><div>#=C2=A0 =C2=A0override[bash-ptest]:rename from RDEPENDS_${PN}=
-ptest data.py:116 [expandKeys]</div><div>#=C2=A0 =C2=A0override[bash-ptest=
_class-native]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:=
641 [renameVar]</div><div>#=C2=A0 =C2=A0override[bash-ptest_class-nativesdk=
]:rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renam=
eVar]</div><div># $RDEPENDS_bash-ptest [3 operations]</div><div>#=C2=A0 =C2=
=A0rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]</div><div>#=C2=
=A0 =C2=A0override[class-native]:rename from RDEPENDS_${PN}-ptest_class-nat=
ive data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0override[class-na=
tivesdk]:rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641=
 [renameVar]</div><div>RDEPENDS_bash-ptest=3D&quot;make&quot;</div><div># $=
RDEPENDS_bash-ptest_class-native</div><div>#=C2=A0 =C2=A0rename from RDEPEN=
DS_${PN}-ptest_class-native data_smart.py:641 [renameVar]</div><div>RDEPEND=
S_bash-ptest_class-native=3D&quot;&quot;</div><div># $RDEPENDS_bash-ptest_c=
lass-nativesdk</div><div>#=C2=A0 =C2=A0rename from RDEPENDS_${PN}-ptest_cla=
ss-nativesdk data_smart.py:641 [renameVar]</div><div>RDEPENDS_bash-ptest_cl=
ass-nativesdk=3D&quot;&quot;</div><div><br></div><div>$ grep locale-base en=
v.bash</div></div><div>$</div><div><br></div><div>And in the build without =
the bbappend:</div><div><br></div><div><div># $RDEPENDS_bash-ptest [3 opera=
tions]</div><div>#=C2=A0 =C2=A0rename from RDEPENDS_${PN}-ptest data.py:116=
 [expandKeys]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot; make&quot;</div><div>#=
=C2=A0 =C2=A0override[class-native]:rename from RDEPENDS_${PN}-ptest_class-=
native data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;&=
quot;</div><div>#=C2=A0 =C2=A0override[class-nativesdk]:rename from RDEPEND=
S_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar]</div><div>#=C2=
=A0 =C2=A0 =C2=A0&quot;&quot;</div><div># pre-expansion value:</div><div>#=
=C2=A0 =C2=A0&quot; make locale-base-fr-fr locale-base-de-de&quot;</div><di=
v>RDEPENDS_bash-ptest=3D&quot; make locale-base-fr-fr locale-base-de-de&quo=
t;</div></div><div><br></div><div>but also without the RDEPENDS_${PN}-ptest=
 history:</div><div><br></div><div>$ grep RDEPENDS.*ptest env.bash<br></div=
><div><div>#=C2=A0 =C2=A0override[bash-ptest]:rename from RDEPENDS_${PN}-pt=
est data.py:116 [expandKeys]</div><div>#=C2=A0 =C2=A0override[bash-ptest_cl=
ass-native]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641=
 [renameVar]</div><div>#=C2=A0 =C2=A0override[bash-ptest_class-nativesdk]:r=
ename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVa=
r]</div><div># $RDEPENDS_bash-ptest [3 operations]</div><div>#=C2=A0 =C2=A0=
rename from RDEPENDS_${PN}-ptest data.py:116 [expandKeys]</div><div>#=C2=A0=
 =C2=A0override[class-native]:rename from RDEPENDS_${PN}-ptest_class-native=
 data_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0override[class-nativ=
esdk]:rename from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [r=
enameVar]</div><div>RDEPENDS_bash-ptest=3D&quot; make locale-base-fr-fr loc=
ale-base-de-de&quot;</div><div># $RDEPENDS_bash-ptest_class-native</div><di=
v>#=C2=A0 =C2=A0rename from RDEPENDS_${PN}-ptest_class-native data_smart.py=
:641 [renameVar]</div><div>RDEPENDS_bash-ptest_class-native=3D&quot;&quot;<=
/div><div># $RDEPENDS_bash-ptest_class-nativesdk</div><div>#=C2=A0 =C2=A0re=
name from RDEPENDS_${PN}-ptest_class-nativesdk data_smart.py:641 [renameVar=
]</div><div>RDEPENDS_bash-ptest_class-nativesdk=3D&quot;&quot;</div></div><=
div><div><br></div><div>$ grep locale-base env.bash</div><div>#=C2=A0 =C2=
=A0&quot; make locale-base-fr-fr locale-base-de-de&quot;</div><div>RDEPENDS=
_bash-ptest=3D&quot; make locale-base-fr-fr locale-base-de-de&quot;</div></=
div><div><br></div><div>The same with glib-2.0:</div><div><div># $RDEPENDS_=
glib-2.0-ptest [3 operations]</div><div>#=C2=A0 =C2=A0rename from RDEPENDS_=
${PN}-ptest data.py:116 [expandKeys]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot; =
gnome-desktop-testing=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbus=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnome-desktop-testing=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0tzdata-americas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0tzdata-asia=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata=
-europe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata-posix=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared-mime-info=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div><div>#=C2=A0 =C2=A0override[class-nati=
ve]:rename from RDEPENDS_${PN}-ptest_class-native data_smart.py:641 [rename=
Var]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;&quot;</div><div>#=C2=A0 =C2=A0ov=
erride[class-nativesdk]:rename from RDEPENDS_${PN}-ptest_class-nativesdk da=
ta_smart.py:641 [renameVar]</div><div>#=C2=A0 =C2=A0 =C2=A0&quot;&quot;</di=
v><div># pre-expansion value:</div><div>#=C2=A0 =C2=A0&quot; gnome-desktop-=
testing=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dbus=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnome-desktop-testing=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0tzdata-americas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdat=
a-asia=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata-europe=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata-posix=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0shared-mime-info=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glibc-gconv-utf-16=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-utf-8=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-cp1255=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-cp1255=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-utf-32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0glibc-gconv-utf-7=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0glibc-gconv-euc-jp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gl=
ibc-gconv-iso8859-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gc=
onv-iso8859-15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap=
-invariant=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-localedata-=
translit-cjk-variants=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale=
-base-tr-tr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-lt-l=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-ja-jp.euc-jp=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-fa-ir=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-ru-ru=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-de-de=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0locale-base-hr-hr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0locale-base-el-gr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
locale-base-fr-fr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-bas=
e-fr-fr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-es-es=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-en-gb=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div><div>RDEPENDS_glib-2.0-ptest=3D&qu=
ot; gnome-desktop-testing=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0db=
us=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gnome-desktop-testing=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0tzdata-americas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0tzdata-asia=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzd=
ata-europe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tzdata-posix=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shared-mime-info=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 glibc=
-gconv-utf-16=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-=
utf-8=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-cp1255=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-charmap-cp1255=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-utf-32=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0glibc-gconv-utf-7=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0glibc-gconv-euc-jp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0glibc-gconv-iso8859-1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0glibc-gconv-iso8859-15=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0glibc-charmap-invariant=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g=
libc-localedata-translit-cjk-variants=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0locale-base-tr-tr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
locale-base-lt-lt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-bas=
e-ja-jp.euc-jp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-f=
a-ir=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-ru-ru=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-de-de=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-hr-hr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0locale-base-el-gr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0locale-base-fr-fr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0locale-base-fr-fr=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0loca=
le-base-es-es=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0locale-base-en=
-gb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;</div></div><div><br></d=
iv><div>It just magically appears in pre-expansion value.</div><div><br></d=
iv><div>Shouldn&#39;t bitbake -e show that &quot;locale-base-fr-fr locale-b=
ase-de-de&quot; were appended (and in the build with bbappend that they wer=
e appended and then removed)? That would help me to find out what&#39;s goi=
ng on much faster.</div><div><br></div><div>Cheers,</div><div><br></div><di=
v><br></div><div><br></div><div><br></div></div></div></div></div></div></d=
iv></div></div></div></div></div></div></div></div></div></div></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Oct 13, 2018 at 12:=
29 PM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Sat, 2018-10-13 at 02:15 +0200, Mar=
tin Jansa wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; sorry for delay, I was first testing a bit more specific fix:<br>
&gt; DEPENDS_append_libc-glibc =3D &quot;${@bb.utils.contains(&#39;PTEST_EN=
ABLED&#39;,<br>
&gt; &#39;1&#39;, &#39;&#39;, &#39; virtual/libc-locale&#39;, d)}&quot;<br>
&gt; <br>
&gt; but unfortunately this nor your shorter version work.<br>
&gt; <br>
&gt; and it&#39;s reproducible without the multilib enabled as well:<br>
&gt; <br>
&gt; ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rd=
epends on locale-base-de-de, but it isn&#39;t a build dependency? [build-de=
ps]<br>
&gt; ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rd=
epends on locale-base-el-gr, but it isn&#39;t a build dependency? [build-de=
ps]<br>
&gt; ERROR: glib-2.0-1_2.58.0-r0 do_package_qa: QA Issue: glib-2.0-ptest rd=
epends on locale-base-en-gb, but it isn&#39;t a build dependency? [build-de=
ps]<br>
<br>
What is also puzzling me is that we&#39;re not seeing this in OE-Core on<br=
>
the autobuilders. We recently merged much better warning summary code<br>
so we should see this quite clearly in its output and we&#39;re not...<br>
<br>
I&#39;m not sure what that means but it suggests there is something going<b=
r>
on here we&#39;re not quite seeing...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--000000000000a7f241057822b723--
