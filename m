Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 21B406FEFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 21:00:26 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id k142so225504182oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WGbeCExyjWd0fBMDAdJytDfdNuJwBopUm68Wb9GSD2U=;
	b=dYUher51PDaCNLq+eHge1SYr2RMkFbO4sNY5Lj5MacyX+Ms2bu/tdvfL4/FJqPpBdB
	hfLuMP0s5TZY4bz+/OrgSynie1fkiiw5N0iRY3YBOS6hBd2TdxOp0LLoQY970GOvaDD1
	oga8Y50Md2QOGN3VXbnwrfVmFXDIJDZkHa5eYFQIXbK11WQ0sePnT/7QrZ9Kx2466cMs
	IPdA9zVpsWeDsZOfvwfBw8TDaYPuVPQsf27sWrEamOe+i5QeCTwnf1aMaFpiRgRt7ilq
	VUedcUtNsmQ61f6HTBua9grWSHxDMBiCBO8S6zl5iTvA7BK+kyRP1a0KpT+TZ2x2eZCb
	bxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WGbeCExyjWd0fBMDAdJytDfdNuJwBopUm68Wb9GSD2U=;
	b=ltmLdL80XxsjZvfKlNb1m3nEISt8+p14Vdl+CIvNVJYm/mygZCBDuYyPhlsQMf5WGn
	cDp9RHd+Zkn8J/Bgw6ZbwCy5gtU2sY0IAluuCSLjobubCQylLhIJpgz00u2g8KQAFvAd
	WUlMRM3yVSWcw1f3Hp/Ip6sIuTgEFiF2p6/5Mo3QSXKQWco473IdiOtbANuv+5Ky/Z7l
	7UnOdAZAGOVC9TA1qgOzir3yoOpTYJ5E6pGbZnidLhawWCg9e10PurUO8sariwTcQdi8
	iyHi9ta1zDMjco+DFNBaYpK8Gbp/cz6MEHryLfjE+M5IP3TgTCsqSZBKIBpGyfiBuTT0
	T/Dw==
X-Gm-Message-State: AOPr4FXVulisJvxev0SgUouEgisxzsFOugiiwZM44DPKGHKjxt65wffZZ/PsgEM+5tsv3mlFxn3cNpZ8QmQwTA==
MIME-Version: 1.0
X-Received: by 10.157.37.45 with SMTP id k42mr1189766otb.119.1462827626957;
	Mon, 09 May 2016 14:00:26 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 14:00:26 -0700 (PDT)
In-Reply-To: <3267336.bjdYRHqI9p@peggleto-mobl.ger.corp.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
	<85ffd927c7834f4111ae1740b8aad5a9c444b7aa.1462768634.git.paul.eggleton@linux.intel.com>
	<CADkTA4MmTBTg+Wp-Cwp4eRNzbpp+Sp=5B1Yf4Lc_qUrDwsaaNA@mail.gmail.com>
	<3267336.bjdYRHqI9p@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 9 May 2016 17:00:26 -0400
Message-ID: <CADkTA4MbORD4RPb9dG9Fw-7T1pXLQBbjn+cyfaEJ=vVOw6UJLw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] classes/kernel-check: add a class to check kernel config options
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
X-List-Received-Date: Mon, 09 May 2016 21:00:29 -0000
Content-Type: multipart/alternative; boundary=001a11352e461296a305326f1910

--001a11352e461296a305326f1910
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 4:53 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> On Mon, 09 May 2016 07:59:43 Bruce Ashfield wrote:
> > On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
> > paul.eggleton@linux.intel.com> wrote:
> > > Some user-space software has specific requirements about the kernel
> > > configuration options selected. This class allows a recipe to
> explicitly
> > > state the kernel configuration options it needs (through a
> > > REQUIRED_KERNEL_OPTIONS variable). This is a space separated list,
> where
> > >
> > > each item is one of:
> > >   (a) an option name (e.g. CONFIG_FHANDLE, in which case CONFIG_FHANDLE
> > >
> > >       must be set to y or m to match)
> > >
> > >   (b) optionname=value (e.g. CONFIG_FHANDLE=y, in which case
> > >
> > >       CONFIG_FHANDLE must be set to y). If the specified value is n,
> > >       it will also match if the option is not present.
> > >
> > >   (c) optionname1|optionname2|... (e.g.
> > >
> > >       CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT23, meaning that either
> > >       CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_EXT23 must be set to y or
> > >       m to match).
> >
> > This duplicates code that is already in the kconf_check routines, which
> > I've already made generic (and added dependency information) for the 2.2
> > release ... so call me confused that I've never heard about this until
> now
> > :(
>
> I guess I didn't look hard enough, I'll have to take a look at that. This
> is
> why the series is RFC (and I included you on CC ;)
>

Noted :) I read the patches before the 0/N .. and it was Monday morning
before coffee.

Don't look TOO closely as your eyes will bleed, but the basics are there.
My recent
work has been to clean it up so I can apply it to an arbitrary kernel.

Bruce


>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11352e461296a305326f1910
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 4:53 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a =
href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egglet=
on@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On Mon, 09 May 2016 07:59:43 Bruce Ashfield wrote:<br>
&gt; On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton &lt;<br>
&gt; <a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@linux.i=
ntel.com</a>&gt; wrote:<br>
&gt; &gt; Some user-space software has specific requirements about the kern=
el<br>
&gt; &gt; configuration options selected. This class allows a recipe to exp=
licitly<br>
&gt; &gt; state the kernel configuration options it needs (through a<br>
&gt; &gt; REQUIRED_KERNEL_OPTIONS variable). This is a space separated list=
, where<br>
&gt; &gt;<br>
&gt; &gt; each item is one of:<br>
&gt; &gt;=C2=A0 =C2=A0(a) an option name (e.g. CONFIG_FHANDLE, in which cas=
e CONFIG_FHANDLE<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0must be set to y or m to match)<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0(b) optionname=3Dvalue (e.g. CONFIG_FHANDLE=3Dy, in w=
hich case<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_FHANDLE must be set to y). If th=
e specified value is n,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0it will also match if the option is not=
 present.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0(c) optionname1|optionname2|... (e.g.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_EXT2_FS|CONFIG_EXT4_USE_FOR_EXT2=
3, meaning that either<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_EXT2_FS or CONFIG_EXT4_USE_FOR_E=
XT23 must be set to y or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0m to match).<br>
&gt;<br>
&gt; This duplicates code that is already in the kconf_check routines, whic=
h<br>
&gt; I&#39;ve already made generic (and added dependency information) for t=
he 2.2<br>
&gt; release ... so call me confused that I&#39;ve never heard about this u=
ntil now<br>
&gt; :(<br>
<br>
</span>I guess I didn&#39;t look hard enough, I&#39;ll have to take a look =
at that. This is<br>
why the series is RFC (and I included you on CC ;)<br></blockquote><div><br=
></div><div>Noted :) I read the patches before the 0/N .. and it was Monday=
 morning before coffee.</div><div><br></div><div>Don&#39;t look TOO closely=
 as your eyes will bleed, but the basics are there. My recent</div><div>wor=
k has been to clean it up so I can apply it to an arbitrary kernel.</div><d=
iv><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a11352e461296a305326f1910--
