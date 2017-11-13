Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id B62BD78666
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:05:19 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id b189so7834228wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 04:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nmAJOPABxI2ZKC0DuEAH5VC66IlFBtcr32e56s70H7g=;
	b=AVzVvIOdflclhk+DeZ5O97NmyGkiu977KgfuskFgGzNF9Akjh0gFaSSFgw3z8HKHlP
	4t8DlfGVNRvgqvqUMg1b/5Osm0DsxDCzKBzhQPlOx46GbLj0cnzaYUudtkpq76qYjRCV
	pmGHWfIrO7SFKPGZTsELyGuRBQnmQMMnaGKatQzjlguAo7XrAAaKOZpQ/vl54nwbdoNy
	pmphjhJK3ynvjlvFrBFoEvb19Q8O4n0+pYGgo/29RYjlsc5SqOJuIlT0d58Il2S4xLGH
	4mkyMgYMY/N9r3d0woMmrdzZ+1kK51HRVfxGqVpnPial530e+4PDYNMC8M6wfxTjH/Xd
	zRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nmAJOPABxI2ZKC0DuEAH5VC66IlFBtcr32e56s70H7g=;
	b=stJgELvJQhrERQL6xnUb+QALvb7EEkk8l3z3RdFBVFEy19nxr346AnUnjH2ZKI5aTu
	6SOQV76DMNUiDw4oJLLXFAEA2Uk0JpkB/2CP93ga+VGuf9lyz9b6EbTBGTQE34aC1hDe
	+NEJIok52mG2P1XKlViAt88A2tV9iqfD7tV9c6eSKbUKXmsUJpibvAn48AKH+E7EUi1x
	ThBCVoB1CRMs4xOKDu9pPTUgkCcJbNc6KGJw0lIIFMdYswpYCU38KzkkNZqK4EOVDUWp
	mCZMYxbZ2oNgMLJfjIfjVrzC4jqDDJwym+eEIJRr/HN6wi58bOQ9WDw48rhCzbg37BoM
	fdLg==
X-Gm-Message-State: AJaThX7naM1fyGhib7oDvzZzR5fAUc1HDst463b2mbI5Ehj8aTfghbtV
	aFMD2MtotVO+hpyw61rRnSA7yCG0kTvTlpoaZrw=
X-Google-Smtp-Source: AGs4zMb2fazpyTW8w1wU834a0wOZCG4sdOmSg+/BiI3LJHwYAkoFq3H5RWb3mKJHVq+tXW5BW+BBGveKQPMQt5a7/Ms=
X-Received: by 10.28.235.18 with SMTP id j18mr6132386wmh.50.1510574720425;
	Mon, 13 Nov 2017 04:05:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.173.139 with HTTP; Mon, 13 Nov 2017 04:05:19 -0800 (PST)
In-Reply-To: <1510569268.4049.48.camel@andred.net>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<CA+chaQcS+pyDt4FVuu1tL-FPPDRx-_Jy6E+evC7SHQjkNgaTOg@mail.gmail.com>
	<1510569268.4049.48.camel@andred.net>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Nov 2017 13:05:19 +0100
Message-ID: <CA+chaQf1MUn7=-jJoRYQS8XL4rPLK+3_GF6aEysv6UNZaHBuCw@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: opkg --prefer-arch-to-version (was: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting)
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
X-List-Received-Date: Mon, 13 Nov 2017 12:05:19 -0000
Content-Type: multipart/alternative; boundary="089e082fe0049e230a055ddc15d6"

--089e082fe0049e230a055ddc15d6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't remember the details, but IIRC it was libdrm or something like that
for some MACHINE which was providing older version of libdrm with
MACHINE_ARCH with better support for that MACHINE.

So this controversial patch was implemented for opkg to support that
use-case and the default behavior was changed ignoring complains from me
and Koen that this behavior is wrong.

I've tried to find some e-mail threads about it, part of that discussion is
in:
https://patchwork.openembedded.org/patch/37461/

On Mon, Nov 13, 2017 at 11:34 AM, Andr=C3=A9 Draszik <git@andred.net> wrote=
:

> Only during do_rootfs indeed (I don't ever do upgrades on the target usin=
g
> opkg).
>
> Is there a reason to still specify prefer-arch-to-version? I'd actually
> expect the exact opposite compared to the original commit message's
> statement, unless the version numbers are identical.
>
> Also, I would argue that the defaults during do_rootfs and when using opk=
g
> on the target should be the same...
>
> Cheers,
> Andre'
>
>
> On Mon, 2017-11-13 at 11:12 +0100, Martin Jansa wrote:
> > Is this during do_rootfs or are you seeing this issue when upgrading on
> > the
> > target as well?
> >
> > I haven't found the bug for this but IIRC it's because do_rootfs is usi=
ng
> > --prefer-arch-to-version parameter.
> > meta/classes/package_ipk.bbclass:OPKG_ARGS +=3D "--force_postinstall
> > --prefer-arch-to-version"
> > which causes this undesired behavior.
> >
> > On Mon, Nov 13, 2017 at 9:54 AM, Andr=C3=A9 Draszik <git@andred.net> wr=
ote:
> >
> > > Hi,
> > >
> > > On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:
> > > > autoconf-archive is a set of common m4 macros, it should be allarch=
,
> > > > just like it is on other distros.
> > >
> > > I have found previously that when changing a recipe to produce more
> > > generic
> > > output, like in this case, and the old binary package is still in
> > > deploy/,
> > > then the package manager would always pick the more specific version,
> > > even
> > > if a more recent (by package version) exists in deploy. In my case I
> was
> > > moving from PACKAGE_ARCH=3D${MACHINE_ARCH} to
> > > PACKAGE_ARCH=3D${TUNE_PKGARCH},
> > > but I guess it'll be the same here.
> > >
> > > What is the correct way to deal with that other that cleansstate?
> > >
> > > Cheers,
> > > Andre'
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > >
>

--089e082fe0049e230a055ddc15d6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t remember the details, but IIRC it was libdrm o=
r something like that for some MACHINE which was providing older version of=
 libdrm with MACHINE_ARCH with better support for that MACHINE.<div><br></d=
iv><div>So this controversial patch was implemented for opkg to support tha=
t use-case and the default behavior was changed ignoring complains from me =
and Koen that this behavior is wrong.</div><div><br></div><div>I&#39;ve tri=
ed to find some e-mail threads about it, part of that discussion is in:</di=
v><div><a href=3D"https://patchwork.openembedded.org/patch/37461/">https://=
patchwork.openembedded.org/patch/37461/</a><br></div></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Mon, Nov 13, 2017 at 11:34 AM,=
 Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto:git@andred.net"=
 target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Only during do_rootfs indeed (I don&#39;t ever do upgrades o=
n the target using<br>
opkg).<br>
<br>
Is there a reason to still specify prefer-arch-to-version? I&#39;d actually=
<br>
expect the exact opposite compared to the original commit message&#39;s<br>
statement, unless the version numbers are identical.<br>
<br>
Also, I would argue that the defaults during do_rootfs and when using opkg<=
br>
on the target should be the same...<br>
<br>
Cheers,<br>
Andre&#39;<br>
<br>
<br>
On Mon, 2017-11-13 at 11:12 +0100, Martin Jansa wrote:<br>
&gt; Is this during do_rootfs or are you seeing this issue when upgrading o=
n<br>
&gt; the<br>
&gt; target as well?<br>
&gt;<br>
&gt; I haven&#39;t found the bug for this but IIRC it&#39;s because do_root=
fs is using<br>
&gt; --prefer-arch-to-version parameter.<br>
&gt; meta/classes/package_ipk.<wbr>bbclass:OPKG_ARGS +=3D &quot;--force_pos=
tinstall<br>
&gt; --prefer-arch-to-version&quot;<br>
&gt; which causes this undesired behavior.<br>
&gt;<br>
&gt; On Mon, Nov 13, 2017 at 9:54 AM, Andr=C3=A9 Draszik &lt;<a href=3D"mai=
lto:git@andred.net">git@andred.net</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 2017-11-13 at 13:26 +0800, Chen Qi wrote:<br>
&gt; &gt; &gt; autoconf-archive is a set of common m4 macros, it should be =
allarch,<br>
&gt; &gt; &gt; just like it is on other distros.<br>
&gt; &gt;<br>
&gt; &gt; I have found previously that when changing a recipe to produce mo=
re<br>
&gt; &gt; generic<br>
&gt; &gt; output, like in this case, and the old binary package is still in=
<br>
&gt; &gt; deploy/,<br>
&gt; &gt; then the package manager would always pick the more specific vers=
ion,<br>
&gt; &gt; even<br>
&gt; &gt; if a more recent (by package version) exists in deploy. In my cas=
e I was<br>
&gt; &gt; moving from PACKAGE_ARCH=3D${MACHINE_ARCH} to<br>
&gt; &gt; PACKAGE_ARCH=3D${TUNE_PKGARCH},<br>
&gt; &gt; but I guess it&#39;ll be the same here.<br>
&gt; &gt;<br>
&gt; &gt; What is the correct way to deal with that other that cleansstate?=
<br>
&gt; &gt;<br>
&gt; &gt; Cheers,<br>
&gt; &gt; Andre&#39;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; ______________________________<wbr>_________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Opene=
mbedded-core@lists.<wbr>openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt; &gt;<br>
</blockquote></div><br></div>

--089e082fe0049e230a055ddc15d6--
