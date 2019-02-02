Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id D498560234
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 21:48:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id a62so9501727wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 13:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=2u6T//B5SzgoObWF7TYv2SR8fjbPT3RhQ25D5FayFm4=;
	b=cNmClYCvsstY38Bu9SXrOpBoLflfT7OSSeFLNg3fL5w/TfiowVw/0eUIsQ862ACJc+
	vmXeyOXycpqk8Bs2ITJL1F0P7Snl+Z/gC07sNY/jFqrsFvYZdEnlhu80RIr08D/jsz1b
	s5jVPXagOHGgkkYZ6C2NNi7oT4AcwETJFNYj1dq1lTotiaDxhmL116mqY6u8chkc+esf
	wUc6GgKp+X7pPu73bW2VBB/IdFqzmpsZeb8jio4plHj25sTWKTM5iHZod9rVnV7lU2lI
	HsDd4gn7JioMlwD/r8pq3tAxGLcnJPYKLBWutTyg9gbOBShG+7UDEAqL9iY1mnI73bIY
	s+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=2u6T//B5SzgoObWF7TYv2SR8fjbPT3RhQ25D5FayFm4=;
	b=aQlCVeBvRC/l207u7NwYwtix1eAXJ8kwuiQo6ESL+otp4Mc4vz1LB2Jb8TRygEaSLr
	Na2cXtBEhvBrQxlkzj8FIF/1ScjJHcw8l2hczzQZlunDTwVYnUIsFkuBXewGHAujg9XQ
	30eLSvA/ZLaE5/9yIyxOeO9shFA8CrPnzAmx189m6eLnh/Tplj8A0QcW2c/g+eurJWI+
	KZGgVFxtOKaaQGGnaBGKVOghJjagFWIXfa9zVo27rJa16RCaeP0Nd0lOMOHzG/Teumdr
	zjnjeSSl2Mut35CHSvOveFxRfemN3vIkkETR03NIJ4Y96VVzj8PjJIpLYFGBWFlu5j8P
	mQ1Q==
X-Gm-Message-State: AHQUAuYQbB7/8AIXcDYJmmSiT4k7JE4lxJtvG+V9ksY0nY94wdq0XV6T
	zWuLrLg6rFOIKJ6CcB7BMM4=
X-Google-Smtp-Source: AHgI3IZKtarCXQA27NDBwNATf1u99Z9KkCs5Nz5TwjXz00jb1nGNuuAhMpXWzMQDUD8Ioabgr9dvOg==
X-Received: by 2002:a1c:e18a:: with SMTP id y132mr7996162wmg.48.1549144135393; 
	Sat, 02 Feb 2019 13:48:55 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	g129sm9526364wmf.39.2019.02.02.13.48.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 13:48:53 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <558DE6F2-8AE0-470E-BE38-A9C777F6042D@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Sat, 2 Feb 2019 22:48:52 +0100
In-Reply-To: <CANNYZj_AuWu6OxfUpXnsAhSyJ8AOPtJbOYv3K0wE8yt0m4yNvA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <0912A04B-78C4-4788-B6A0-FDE2E061F0B9@netbsd.org>
	<CANNYZj_AuWu6OxfUpXnsAhSyJ8AOPtJbOYv3K0wE8yt0m4yNvA@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by both perl-native and extutils-makemaker-perl-native, aborting
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
X-List-Received-Date: Sat, 02 Feb 2019 21:48:55 -0000
X-Groupsio-MsgNum: 120804
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3ACDF9F8-2FA6-412E-82F0-48C65BA5A0C4";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_3ACDF9F8-2FA6-412E-82F0-48C65BA5A0C4
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_DE1DA6F4-BE0C-49BE-9A72-FDAE22367676"

--Apple-Mail=_DE1DA6F4-BE0C-49BE-9A72-FDAE22367676
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

That's more or less quite easy:

perl has a bundled extutils-makemaker which installs the script and the =
standalone extutils-makemaker wants to install the updated script.
Even if it's now the same - the cpan module is updated more often and =
bring changes before they're merged into core (likely).

So I'd prefer - even if both files are the same - that cpan > core =
(poky).

Jens

> Am 02.02.2019 um 20:30 schrieb Alexander Kanavin =
<alex.kanavin@gmail.com>:
>=20
> In cases like this I would dig deeper and find out *why* these two
> components want to install binaries with the same name, how the
> binaries differ (if they do), and what do desktop distros do about the
> situation. I typically view patches that add 'blind' use of
> update-alternatives as treating symptoms rather than the issue, but I
> prefer not to fight against it :)
>=20
> Alex
>=20
> On Sat, 2 Feb 2019 at 18:38, Jens Rehsack <sno@netbsd.org> wrote:
>>=20
>> Hi,
>>=20
>> I'm trying to get some recipes building after perl-update, but I'm =
struggeling for:
>>=20
>> ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by =
both perl-native and extutils-makemaker-perl-native, aborting
>> ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: Function failed: extend_recipe_sysroot
>> ERROR: Logfile of failure stored in: =
/home/sno/gpw-community-bsp/gpw-yocto-platform/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/plack-middleware-fixmissingbodyinredirect-perl/0.12-r0/te=
mp/log.do_prepare_recipe_sysroot.23078
>>=20
>> Logfile contains:
>> DEBUG: Executing python function do_prepare_recipe_sysroot
>> DEBUG: Executing python function extend_recipe_sysroot
>> NOTE: Direct dependencies are =
['virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-dev=
tools/qemu/qemu_3.1.0.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/perl-sanit=
y/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-cr=
oss_8.2.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-deve=
l/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb:do_populate_sysr=
oot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-ru=
ntime_8.2.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-core/glibc/glibc_2.=
29.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devt=
ools/perl-sanity/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/qemu/qemu-=
helper-native_1.0.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-www/=
http-message-perl/http-message-perl_6.18.bb:do_populate_sysroot']
>> ERROR: The file /usr/bin/instmodsh is installed by both perl-native =
and extutils-makemaker-perl-native, aborting
>> DEBUG: Python function extend_recipe_sysroot finished
>> DEBUG: Python function do_prepare_recipe_sysroot finished
>> ERROR: Function failed: extend_recipe_sysroot
>>=20
>> Typically such an issue is fixed by:
>>=20
>> poky:
>>=20
>> diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb =
b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
>> index 71653feb53..f66f96919e 100644
>> --- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
>> +++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
>> @@ -168,6 +168,39 @@ perl_package_preprocess () {
>>             ${PKGD}${libdir}/perl5/config.sh
>> }
>>=20
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE_PRIORITY =3D "100"
>> +
>> +ALTERNATIVE_${PN} =3D "corelist cpan enc2xs encguess h2ph h2xs =
instmodsh json_pp libnetcfg \
>> +                     piconv pl2pm pod2html pod2man pod2text =
pod2usage podchecker podselect \
>> +                     prove ptar ptardiff ptargrep shasum splain =
xsubpp zipdetails"
>> +ALTERNATIVE_LINK_NAME[corelist] =3D "${bindir}/corelist"
>> +ALTERNATIVE_LINK_NAME[cpan] =3D "${bindir}/cpan"
>> +ALTERNATIVE_LINK_NAME[enc2xs] =3D "${bindir}/enc2xs"
>> +ALTERNATIVE_LINK_NAME[encguess] =3D "${bindir}/encguess"
>> +ALTERNATIVE_LINK_NAME[h2ph] =3D "${bindir}/h2ph"
>> +ALTERNATIVE_LINK_NAME[h2xs] =3D "${bindir}/h2xs"
>> +ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
>> +ALTERNATIVE_LINK_NAME[json_pp] =3D "${bindir}/json_pp"
>> +ALTERNATIVE_LINK_NAME[libnetcfg] =3D "${bindir}/libnetcfg"
>> +ALTERNATIVE_LINK_NAME[piconv] =3D "${bindir}/piconv"
>> +ALTERNATIVE_LINK_NAME[pl2pm] =3D "${bindir}/pl2pm"
>> +ALTERNATIVE_LINK_NAME[pod2html] =3D "${bindir}/pod2html"
>> +ALTERNATIVE_LINK_NAME[pod2man] =3D "${bindir}/pod2man"
>> +ALTERNATIVE_LINK_NAME[pod2text] =3D "${bindir}/pod2text"
>> +ALTERNATIVE_LINK_NAME[pod2usage] =3D "${bindir}/pod2usage"
>> +ALTERNATIVE_LINK_NAME[podchecker] =3D "${bindir}/podchecker"
>> +ALTERNATIVE_LINK_NAME[podselect] =3D "${bindir}/podselect"
>> +ALTERNATIVE_LINK_NAME[prove] =3D "${bindir}/prove"
>> +ALTERNATIVE_LINK_NAME[ptar] =3D "${bindir}/ptar"
>> +ALTERNATIVE_LINK_NAME[ptardiff] =3D "${bindir}/ptardiff"
>> +ALTERNATIVE_LINK_NAME[ptargrep] =3D "${bindir}/ptargrep"
>> +ALTERNATIVE_LINK_NAME[shasum] =3D "${bindir}/shasum"
>> +ALTERNATIVE_LINK_NAME[splain] =3D "${bindir}/splain"
>> +ALTERNATIVE_LINK_NAME[xsubpp] =3D "${bindir}/xsubpp"
>> +ALTERNATIVE_LINK_NAME[zipdetails] =3D "${bindir}/zipdetails"
>> +
>> require perl-ptest.inc
>>=20
>> FILES_${PN} =3D "${bindir}/perl ${bindir}/perl.real =
${bindir}/perl${PV} ${libdir}/libperl.so* \
>>=20
>> meta-cpan:
>>=20
>> diff --git =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
>> index a9d21b1..7a958ed 100644
>> --- =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
>> +++ =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb
>> @@ -41,4 +41,11 @@ do_install_prepend_class-native() {
>>        export PERL5LIB=3D"${PERL_ARCHLIB}"
>> }
>>=20
>> +inherit update-alternatives
>> +
>> +ALTERNATIVE_PRIORITY =3D "90"
>> +
>> +ALTERNATIVE_${PN} =3D "instmodsh"
>> +ALTERNATIVE_LINK_NAME[instmodsh] =3D "${bindir}/instmodsh"
>> +
>> BBCLASSEXTEND =3D "native"
>>=20
>> But unfortunately it doesn't show any effect.
>>=20
>> Any ideas?
>>=20
>> Best regards
>> --
>> Jens Rehsack - rehsack@gmail.com
>>=20

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_DE1DA6F4-BE0C-49BE-9A72-FDAE22367676
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">That's more or less quite easy:<div class=3D""><br =
class=3D""></div><div class=3D"">perl has a bundled extutils-makemaker =
which installs the script and the standalone extutils-makemaker wants to =
install the updated script.</div><div class=3D"">Even if it's now the =
same - the cpan module is updated more often and bring changes before =
they're merged into core (likely).</div><div class=3D""><br =
class=3D""></div><div class=3D"">So I'd prefer - even if both files are =
the same - that cpan &gt; core (poky).</div><div class=3D""><br =
class=3D""></div><div class=3D"">Jens<br class=3D""><div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">Am =
02.02.2019 um 20:30 schrieb Alexander Kanavin &lt;<a =
href=3D"mailto:alex.kanavin@gmail.com" =
class=3D"">alex.kanavin@gmail.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">In =
cases like this I would dig deeper and find out *why* these two<br =
class=3D"">components want to install binaries with the same name, how =
the<br class=3D"">binaries differ (if they do), and what do desktop =
distros do about the<br class=3D"">situation. I typically view patches =
that add 'blind' use of<br class=3D"">update-alternatives as treating =
symptoms rather than the issue, but I<br class=3D"">prefer not to fight =
against it :)<br class=3D""><br class=3D"">Alex<br class=3D""><br =
class=3D"">On Sat, 2 Feb 2019 at 18:38, Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D""><br =
class=3D"">Hi,<br class=3D""><br class=3D"">I'm trying to get some =
recipes building after perl-update, but I'm struggeling for:<br =
class=3D""><br class=3D"">ERROR: =
plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: The file /usr/bin/instmodsh is installed by =
both perl-native and extutils-makemaker-perl-native, aborting<br =
class=3D"">ERROR: plack-middleware-fixmissingbodyinredirect-perl-0.12-r0 =
do_prepare_recipe_sysroot: Function failed: extend_recipe_sysroot<br =
class=3D"">ERROR: Logfile of failure stored in: =
/home/sno/gpw-community-bsp/gpw-yocto-platform/tmp/work/cortexa8hf-neon-po=
ky-linux-gnueabi/plack-middleware-fixmissingbodyinredirect-perl/0.12-r0/te=
mp/log.do_prepare_recipe_sysroot.23078<br class=3D""><br =
class=3D"">Logfile contains:<br class=3D"">DEBUG: Executing python =
function do_prepare_recipe_sysroot<br class=3D"">DEBUG: Executing python =
function extend_recipe_sysroot<br class=3D"">NOTE: Direct dependencies =
are =
['virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-dev=
tools/qemu/qemu_3.1.0.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/perl-sanit=
y/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-cr=
oss_8.2.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-deve=
l/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb:do_populate_sysr=
oot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/gcc/gcc-ru=
ntime_8.2.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-core/glibc/glibc_2.=
29.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devt=
ools/perl-sanity/perl_5.28.1.bb:do_populate_sysroot', =
'/home/sno/gpw-community-bsp/sources/poky/meta/recipes-devtools/qemu/qemu-=
helper-native_1.0.bb:do_populate_sysroot', =
'virtual:native:/home/sno/gpw-community-bsp/sources/meta-cpan/recipes-www/=
http-message-perl/http-message-perl_6.18.bb:do_populate_sysroot']<br =
class=3D"">ERROR: The file /usr/bin/instmodsh is installed by both =
perl-native and extutils-makemaker-perl-native, aborting<br =
class=3D"">DEBUG: Python function extend_recipe_sysroot finished<br =
class=3D"">DEBUG: Python function do_prepare_recipe_sysroot finished<br =
class=3D"">ERROR: Function failed: extend_recipe_sysroot<br class=3D""><br=
 class=3D"">Typically such an issue is fixed by:<br class=3D""><br =
class=3D"">poky:<br class=3D""><br class=3D"">diff --git =
a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb =
b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb<br class=3D"">index =
71653feb53..f66f96919e 100644<br class=3D"">--- =
a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb<br class=3D"">+++ =
b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb<br class=3D"">@@ =
-168,6 +168,39 @@ perl_package_preprocess () {<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${=
PKGD}${libdir}/perl5/config.sh<br class=3D""> }<br class=3D""><br =
class=3D"">+inherit update-alternatives<br class=3D"">+<br =
class=3D"">+ALTERNATIVE_PRIORITY =3D "100"<br class=3D"">+<br =
class=3D"">+ALTERNATIVE_${PN} =3D "corelist cpan enc2xs encguess h2ph =
h2xs instmodsh json_pp libnetcfg \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;piconv pl2pm pod2html =
pod2man pod2text pod2usage podchecker podselect \<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;prove ptar ptardiff =
ptargrep shasum splain xsubpp zipdetails"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[corelist] =3D "${bindir}/corelist"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[cpan] =3D "${bindir}/cpan"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[enc2xs] =3D "${bindir}/enc2xs"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[encguess] =3D "${bindir}/encguess"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[h2ph] =3D "${bindir}/h2ph"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[h2xs] =3D "${bindir}/h2xs"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[instmodsh] =3D =
"${bindir}/instmodsh"<br class=3D"">+ALTERNATIVE_LINK_NAME[json_pp] =3D =
"${bindir}/json_pp"<br class=3D"">+ALTERNATIVE_LINK_NAME[libnetcfg] =3D =
"${bindir}/libnetcfg"<br class=3D"">+ALTERNATIVE_LINK_NAME[piconv] =3D =
"${bindir}/piconv"<br class=3D"">+ALTERNATIVE_LINK_NAME[pl2pm] =3D =
"${bindir}/pl2pm"<br class=3D"">+ALTERNATIVE_LINK_NAME[pod2html] =3D =
"${bindir}/pod2html"<br class=3D"">+ALTERNATIVE_LINK_NAME[pod2man] =3D =
"${bindir}/pod2man"<br class=3D"">+ALTERNATIVE_LINK_NAME[pod2text] =3D =
"${bindir}/pod2text"<br class=3D"">+ALTERNATIVE_LINK_NAME[pod2usage] =3D =
"${bindir}/pod2usage"<br class=3D"">+ALTERNATIVE_LINK_NAME[podchecker] =3D=
 "${bindir}/podchecker"<br class=3D"">+ALTERNATIVE_LINK_NAME[podselect] =
=3D "${bindir}/podselect"<br class=3D"">+ALTERNATIVE_LINK_NAME[prove] =3D =
"${bindir}/prove"<br class=3D"">+ALTERNATIVE_LINK_NAME[ptar] =3D =
"${bindir}/ptar"<br class=3D"">+ALTERNATIVE_LINK_NAME[ptardiff] =3D =
"${bindir}/ptardiff"<br class=3D"">+ALTERNATIVE_LINK_NAME[ptargrep] =3D =
"${bindir}/ptargrep"<br class=3D"">+ALTERNATIVE_LINK_NAME[shasum] =3D =
"${bindir}/shasum"<br class=3D"">+ALTERNATIVE_LINK_NAME[splain] =3D =
"${bindir}/splain"<br class=3D"">+ALTERNATIVE_LINK_NAME[xsubpp] =3D =
"${bindir}/xsubpp"<br class=3D"">+ALTERNATIVE_LINK_NAME[zipdetails] =3D =
"${bindir}/zipdetails"<br class=3D"">+<br class=3D""> require =
perl-ptest.inc<br class=3D""><br class=3D""> FILES_${PN} =3D =
"${bindir}/perl ${bindir}/perl.real ${bindir}/perl${PV} =
${libdir}/libperl.so* \<br class=3D""><br class=3D"">meta-cpan:<br =
class=3D""><br class=3D"">diff --git =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb<br=
 class=3D"">index a9d21b1..7a958ed 100644<br class=3D"">--- =
a/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb<br=
 class=3D"">+++ =
b/recipes-devel/extutils-makemaker-perl/extutils-makemaker-perl_7.34.bb<br=
 class=3D"">@@ -41,4 +41,11 @@ do_install_prepend_class-native() {<br =
class=3D""> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;export =
PERL5LIB=3D"${PERL_ARCHLIB}"<br class=3D""> }<br class=3D""><br =
class=3D"">+inherit update-alternatives<br class=3D"">+<br =
class=3D"">+ALTERNATIVE_PRIORITY =3D "90"<br class=3D"">+<br =
class=3D"">+ALTERNATIVE_${PN} =3D "instmodsh"<br =
class=3D"">+ALTERNATIVE_LINK_NAME[instmodsh] =3D =
"${bindir}/instmodsh"<br class=3D"">+<br class=3D""> BBCLASSEXTEND =3D =
"native"<br class=3D""><br class=3D"">But unfortunately it doesn't show =
any effect.<br class=3D""><br class=3D"">Any ideas?<br class=3D""><br =
class=3D"">Best regards<br class=3D"">--<br class=3D"">Jens Rehsack - <a =
href=3D"mailto:rehsack@gmail.com" class=3D"">rehsack@gmail.com</a><br =
class=3D""><br class=3D""></blockquote></div></div></blockquote></div><br =
class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></div></body></html>=

--Apple-Mail=_DE1DA6F4-BE0C-49BE-9A72-FDAE22367676--

--Apple-Mail=_3ACDF9F8-2FA6-412E-82F0-48C65BA5A0C4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlxWEEQACgkQRJmWrtzl
Cp3ZqQ//Y06gThhw6PAG0C3488qqIaK8RZf1N4ltXNRb6sKKnl+sTSFJpX9BTQvF
ewDCA2WBSlWvc549N0bfnccPK7fi2jIB3NlNBWVlF+t4Wdpf9JRQCg+HD7ZFiYRc
WfYOQM8hlQ0Wft2PpAxeJah6guHarcNOQl1yyuV9ARWmRo9cGpKUDxOR9EMXIsj5
WR5KP8ehhhJg5RG1Dkp/rhl/oORGRBkZjHRLPuuguJE3DPaHOoSVni8TtRgF8sZ6
5NhZIZYMWT0h9NuGHeotm1SlM336y6geEdXpLHnYoOg979pR+SA64zMRrFgiLsdu
4MUcCcKTKUFXrfjqHrqIj0GytJnCXp8zmuDCSKZxecsK54jy9ZZrqy0vpyqVpD2p
QkcuoQsC9wKfpq8ht5zX239N6Tve8npt4jo5AHDfVjDFvqG3YI8cnfdKc53uej6N
9tEburSkkENqrKd2/hyfRU5DEMtybHytRqllttt7D+gZPu09jNwM3tWwHb4D8WPs
VKIQxLNLUZvlbXjnfM4ZgPhedStLwZhTuMGtl6AD9qYG3Fi8igepUFFgH+/cA3WA
8QznnOrr0j5E3OvZ8YtdM9ZvJR6lXsRSv5A8RQka5KchEWZV57k4t6BAgwsHdbBI
46DhRefZcHyxKzBJQ7UGWNrM0qEsSiZS8f6efbQQ2odLdvZ04wA=
=39pp
-----END PGP SIGNATURE-----

--Apple-Mail=_3ACDF9F8-2FA6-412E-82F0-48C65BA5A0C4--
