Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 47636783DC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 11:35:14 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x63so11849863ioe.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 03:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YR2WkmMV+Uj48rqQYuyUo8+jIyQPZ9IJwalsmokJEzw=;
	b=GvliK+MTeYbec2rVB1QsXKeuss9/K4+973z1mB9vYGhegv3I5FJWFJ9QkDEZqdKZ9g
	690rNTVErhVGVih8DluCdPdK+N1qjH0/5sJsTDxUJiC4U9XS4ivqxxQ6W178poI7+M1J
	6VzF4/MSdleRZb6Ep+WehBORf9w6Ry2zG1VhIn3T9Aw2/bbJVSEcxDxHDXJx/mffbqew
	m1zIWumnxBFw4HFN5p2S2xI38MliwNra0rnHZkk0SqEpRV1uJzal9Y1gAvN3uGx99Hms
	Fd8bFkd243hbxUdrWdoAFdoaX4Id97752GXxDdI3aSy8GXM5UDRkn5J6Irs4aPxLxw5Z
	6zAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YR2WkmMV+Uj48rqQYuyUo8+jIyQPZ9IJwalsmokJEzw=;
	b=az8oe2EGDLPSUF+mQM8saB2jbcaLb/HvGETt7VqdNpPbV59HiFjPhZ0NYrj9NRE1XY
	Gv1L+36TY0vmCon7bYlgnTuXVIVm2S7D5cPKcjpJf1piH3ysb7HuxovKNCUWvciMYBOd
	EUDE6TIQ7HGslBPum3ZfguuOiO4K72WOMT0YWGV/9+f6ynHWrA1dsxVre64F4o/DCcqy
	kNhndHhYjll+7b8hF+odozFrX2F8AG05HplBbg+VOdwvlpMI97FKeyqOEUlUb5S+1eym
	7aSib3Y49tdHGw6xphKhy50obb2vjbl+ITR+aTaEOanC1sr1AZDs3yIvtttypTX44afo
	Mqwg==
X-Gm-Message-State: AJaThX4KiYpg74yE1wiaBRJDBBwN3rsXWaGnetGj+ykzJxm8Ou+r+F55
	+I8GW3IY7QMl41aNirM9M42tI9wiGSFfXqanWZCGWw==
X-Google-Smtp-Source: AGs4zMaJhMsSIsGMkhSCfn0Yji5AMVjJAT6tNPMMR5HJ4/XMwWtRWhH2Nym4c2ORoMpLklmczEE7kjO2zE6Xs1ZQBiY=
X-Received: by 10.107.133.85 with SMTP id h82mr13312217iod.208.1510659315334; 
	Tue, 14 Nov 2017 03:35:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Tue, 14 Nov 2017 03:34:54 -0800 (PST)
In-Reply-To: <1510654568.4049.64.camel@andred.net>
References: <cover.1510550741.git.Qi.Chen@windriver.com>
	<62db9387c3ee71f4bed87a7a546afdf927ba5ac0.1510550741.git.Qi.Chen@windriver.com>
	<1510563249.4049.33.camel@andred.net>
	<a4f2cfac-2714-ef11-c4ff-308ce183f1e1@windriver.com>
	<1510654568.4049.64.camel@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Nov 2017 11:34:54 +0000
Message-ID: <CAJTo0LZFWFV-ZThaf0aNxC6r8+guutmNU68759hHND7zESmc6A@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] autoconf-archive: inherit allarch and fix package splitting
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
X-List-Received-Date: Tue, 14 Nov 2017 11:35:14 -0000
Content-Type: multipart/alternative; boundary="001a113fd83ade1dd3055defc7d9"

--001a113fd83ade1dd3055defc7d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

But don't we remove the old version from the feeds, or does that only
happen if the arch matches?

Ross

On 14 November 2017 at 10:16, Andr=C3=A9 Draszik <git@andred.net> wrote:

> On Mon, 2017-11-13 at 19:54 +0800, Robert Yang wrote:
> >
> > On 11/13/2017 04:54 PM, Andr=C3=A9 Draszik wrote:
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
> >
> > I think that it is because of the priority MACHINE_ARCH > TUNE_PKGARCH =
>
> > allarch,
> > which is the right behavior.
>
> I'd say this patch here is a good example why it's not the right behaviou=
r.
>
> This patch is making autoconf-archive allarch, i.e. lower priority than
> before. In other words, anybody who has the previous TUNE_PKGARCH version
> already will never get an update, even if the version number is bumped.
>
> Cheers,
> Andre'
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113fd83ade1dd3055defc7d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">But don&#39;t we remove the old version from the feeds, or=
 does that only happen if the arch matches?<div><br></div><div>Ross</div></=
div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 Novembe=
r 2017 at 10:16, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a href=3D"mailto=
:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On Mon, 2017-11-13 at 19:54=
 +0800, Robert Yang wrote:<br>
&gt;<br>
&gt; On 11/13/2017 04:54 PM, Andr=C3=A9 Draszik wrote:<br>
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
&gt;<br>
&gt; I think that it is because of the priority MACHINE_ARCH &gt; TUNE_PKGA=
RCH &gt;<br>
&gt; allarch,<br>
&gt; which is the right behavior.<br>
<br>
</span>I&#39;d say this patch here is a good example why it&#39;s not the r=
ight behaviour.<br>
<br>
This patch is making autoconf-archive allarch, i.e. lower priority than<br>
before. In other words, anybody who has the previous TUNE_PKGARCH version<b=
r>
already will never get an update, even if the version number is bumped.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
Cheers,<br>
Andre&#39;<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a113fd83ade1dd3055defc7d9--
