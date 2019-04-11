Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 058F37D242;
	Thu, 11 Apr 2019 16:29:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id d46so966433eda.7;
	Thu, 11 Apr 2019 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sgdAeX/dJmpbdTeigKIry8OZPihxpgyDrawpp/agPPM=;
	b=Rtt8EBjZlh6vDn1eq64YGq4dPZ4tcKBrtNdaYqWfUkh1DsoR+v5qHkj4uOULZfYaxI
	ltuzquZI6z4atvthQ3UVMGd8AyTk+DPemSj9ClfT6s/RvtSd8GVMlk/mGt2Fjk93ld4p
	bBp4GViIHYc6o4EH7oV8H9TDAq29Zla4EJNYdu4gCRGvGC2yHbKt7hU5voRD7ufDwmX4
	ngyHZirVDwbL1OPx2F1smn14LUaAhxwji9AauDzU06zJB0EiL7Wfam9Nj899xDNHDSpi
	AdiMo8+kcVynHQYU1Znt1xcexJDxUlthM7qYZ5kQFxgqhxVW6Y1o3h6Yqf7DLvIVPFdf
	gmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sgdAeX/dJmpbdTeigKIry8OZPihxpgyDrawpp/agPPM=;
	b=i/YLNAHjOmrGsXAa5EUo61CqJSwfjFSravhmyuz41GPKx1CGSWlXKtifio3JjP0A/u
	IRjlfT0DeAf73yZGWiIgXrL/yjQANNDcKu+JlbmLMnmArd5zW+HIqpS9+NLN3oCUm/tr
	NU9Oe3hjbP/jVtYjVIf5zs4q828XaS79iNWyF32XVaJO3O2wwZSxcsvUfF7Oot+HBG8y
	iXwCXX3PRInwGgEiOE+CxP3V66P0L5H+xpHTdDha5BeJxnv3tHDJwO81EkBDDg4yL0N9
	0bbTT8MlwAQvKIFKFrRepwwTQJGIrmvo7S4YDEYxrB78LiGjQvN3GamRsXGHSz1OYppJ
	iyaw==
X-Gm-Message-State: APjAAAUNIrRVRy1paeZGLpD7UgEM69bPXBUOC2CeRRhR29OpHpOFDp9J
	WN2MOHNiQpJmdtjnuvbtggc9rCpIlHqRiQILnPE=
X-Google-Smtp-Source: APXvYqzK10hJ8EUzPZP68Xpfr71gtYoPamhWLpp7FuAemWfjG7bo3ZWQJuOsKDw4KYcrEnSWYwNES5kBZOshdskZwx0=
X-Received: by 2002:a17:906:a945:: with SMTP id
	hh5mr28194242ejb.108.1555000162487; 
	Thu, 11 Apr 2019 09:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <90d55754e9381759c8b70ebca0b880e6013f17f0.camel@linuxfoundation.org>
	<f8b3661d-a6cc-494e-de49-e462ba935535@gmail.com>
	<680dff761ebd04f8f240d12339b31569c70c48da.camel@linuxfoundation.org>
	<05dd3911-b195-1d1f-b218-e4b41d80ec72@gmail.com>
	<7c1d84b0957f2831a7add461f73e3d9108176e9b.camel@linuxfoundation.org>
In-Reply-To: <7c1d84b0957f2831a7add461f73e3d9108176e9b.camel@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Thu, 11 Apr 2019 09:29:11 -0700
Message-ID: <CAFNP8OstwvzhdYvyiaJ4JFZqNPGK3zypTPVEG-u437hE83js1A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Yocto discussion list <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [yocto] Eclipse support dropped with immediate effect
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
X-List-Received-Date: Thu, 11 Apr 2019 16:29:22 -0000
Content-Type: multipart/alternative; boundary="0000000000004f948a058643b0af"

--0000000000004f948a058643b0af
Content-Type: text/plain; charset="UTF-8"

Richard and Armin,

I am going to start pulling Eclipse from the docs today.  The changes won't
make the frozen rc build but the website docs will reflect reality.

Scott

On Thu, Apr 11, 2019 at 12:20 AM <richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-04-11 at 08:42 +0530, akuster808 wrote:
> >
> > On 4/10/19 3:11 PM, richard.purdie@linuxfoundation.org wrote:
> > > On Wed, 2019-04-10 at 05:56 +0530, akuster808 wrote:
> > > > On 4/9/19 8:52 PM, Richard Purdie wrote:
> > > > > I'm sorry to have to say this but the project is terminating
> > > > > its
> > > > > official eclipse plugin support with immediate effect.
> > > > Does this affect the stable branches as well?
> > > Yes, I think we'll just be removing the target from the autobuilder
> > > entirely.
> >
> > Have we every removed a feature from a release? Do we need to doc
> > this ?
>
> Its not so much remove as not release. No, we haven't and yes, we do
> need to document it in the release notes.
>
> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>

--0000000000004f948a058643b0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Richard and Armin, <br></div><div><br></div><div>I am=
 going to start pulling Eclipse from the docs today.=C2=A0 The changes won&=
#39;t make the frozen rc build but the website docs will reflect reality.</=
div><div><br></div><div>Scott<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 11, 2019 at 12:20 AM &lt=
;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Thu, 2019-04-11 at 08:42 +0530, akuster808 wrote:<br>
&gt; <br>
&gt; On 4/10/19 3:11 PM, <a href=3D"mailto:richard.purdie@linuxfoundation.o=
rg" target=3D"_blank">richard.purdie@linuxfoundation.org</a> wrote:<br>
&gt; &gt; On Wed, 2019-04-10 at 05:56 +0530, akuster808 wrote:<br>
&gt; &gt; &gt; On 4/9/19 8:52 PM, Richard Purdie wrote:<br>
&gt; &gt; &gt; &gt; I&#39;m sorry to have to say this but the project is te=
rminating<br>
&gt; &gt; &gt; &gt; its<br>
&gt; &gt; &gt; &gt; official eclipse plugin support with immediate effect.<=
br>
&gt; &gt; &gt; Does this affect the stable branches as well?<br>
&gt; &gt; Yes, I think we&#39;ll just be removing the target from the autob=
uilder<br>
&gt; &gt; entirely.<br>
&gt; <br>
&gt; Have we every removed a feature from a release? Do we need to doc<br>
&gt; this ?<br>
<br>
Its not so much remove as not release. No, we haven&#39;t and yes, we do<br=
>
need to document it in the release notes.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
_______________________________________________<br>
Openembedded-architecture mailing list<br>
<a href=3D"mailto:Openembedded-architecture@lists.openembedded.org" target=
=3D"_blank">Openembedded-architecture@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-arch=
itecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.or=
g/mailman/listinfo/openembedded-architecture</a><br>
</blockquote></div>

--0000000000004f948a058643b0af--
