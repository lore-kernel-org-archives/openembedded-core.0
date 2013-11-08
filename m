Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 61A736D663;
	Fri,  8 Nov 2013 11:23:05 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so2002080wib.11
	for <multiple recipients>; Fri, 08 Nov 2013 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xyEXTUdTyvDwF2+J7NYr0rnEFifyj9OBq8tBFMhVEVQ=;
	b=IpafHyDBgLtjCymAfsGZ2ETugeJaH8ODTpCqA4ElKDVGkrDDbh1hC3qfmyy0JZZ/46
	KJ34hoRb4XjXK6Z4VREUmt04CFg3efJoURKXcdd9ouLa8xY5O9jqVgy9ISAwPU1p4fdF
	TpzrRhxcJcm+23AErAqph1hoTjerwlJb0oiFLh8pa2XNy0r9ArR+Psa9HGlSIecuYL2/
	dCRRnPHexJGP3N7hpkgmZvqPbceGcXZTbLe/W3hQ3AocOthb/n91fZ76C33ablcZ3asr
	l8HDR5ht2UHty838zh51aUDV34kgFuBhMKkoZlmsGvsH3ieWVAZZksfeFgN937sPrXfr
	A+cQ==
MIME-Version: 1.0
X-Received: by 10.180.72.238 with SMTP id g14mr1921355wiv.17.1383909786616;
	Fri, 08 Nov 2013 03:23:06 -0800 (PST)
Received: by 10.194.179.198 with HTTP; Fri, 8 Nov 2013 03:23:06 -0800 (PST)
In-Reply-To: <1383904061.6271.297.camel@ted>
References: <1383866326.6271.286.camel@ted>
	<CAJTo0LYq5PmQtBdwghmDGLs2ccTO6BBwJNGw7s37Yt+zjkWU6Q@mail.gmail.com>
	<CAAQYJAuMoE6gOMmM2trSN1MY7weCF+07JAJuhQu1K=p5KxO=Yg@mail.gmail.com>
	<1383904061.6271.297.camel@ted>
Date: Fri, 8 Nov 2013 12:23:06 +0100
Message-ID: <CA+chaQfB37mDfsiFreA3_7NBbeEitnk-xO07i0FKc55hPSZocg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Default DISTRO to nodistro
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
X-List-Received-Date: Fri, 08 Nov 2013 11:23:08 -0000
Content-Type: multipart/alternative; boundary=f46d043d67373b8b8e04eaa89bdd

--f46d043d67373b8b8e04eaa89bdd
Content-Type: text/plain; charset=UTF-8

I don't feel strongly about this, but I have heard people say "distroless"
and I'm using the same when refering to default oe-core setup.


On Fri, Nov 8, 2013 at 10:47 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:
> > On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > > On 7 November 2013 23:18, Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > >> +DISTRO ??= "nodistro"
> > >
> > > Wouldn't "oe-core" be a better name, considering that's what
> > > DISTROVERSION becomes if DISTRO is unset?
> > >
> > > Ross
> >
> >
> > Agreed, we already have DISTRO_VERSION = "oe-core.0"
> > This sounds also the right name for THE default distro.
>
> I disagree and I feel quite strongly about this. OE-Core is not a
> distro. The whole idea was that OE-Core should build with sane defaults
> without any distro set. This is a dummy placeholder value and it really
> does mean to say that no distro is set.
>
> We did put a value into the DISTRO_VERSION field so you could tell what
> was being used but again its a placeholder.
>
> So in my view "nodistro" is clearer about what is meant.
>
> Cheers,
>
> Richard
>
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f46d043d67373b8b8e04eaa89bdd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t feel strongly about this, but I have heard peo=
ple say &quot;distroless&quot; and I&#39;m using the same when refering to =
default oe-core setup.</div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">
On Fri, Nov 8, 2013 at 10:47 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<div class=3D"im">On Fri, 2013-11-08 at 10:33 +0100, Andrea Adami wrote:<br=
>
&gt; On Fri, Nov 8, 2013 at 10:25 AM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; &gt; On 7 November 2013 23:18, Richard Purdie<br>
&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt;&gt; +DISTRO ??=3D &quot;nodistro&quot;<br>
&gt; &gt;<br>
&gt; &gt; Wouldn&#39;t &quot;oe-core&quot; be a better name, considering th=
at&#39;s what<br>
&gt; &gt; DISTROVERSION becomes if DISTRO is unset?<br>
&gt; &gt;<br>
&gt; &gt; Ross<br>
&gt;<br>
&gt;<br>
&gt; Agreed, we already have DISTRO_VERSION =3D &quot;oe-core.0&quot;<br>
&gt; This sounds also the right name for THE default distro.<br>
<br>
</div>I disagree and I feel quite strongly about this. OE-Core is not a<br>
distro. The whole idea was that OE-Core should build with sane defaults<br>
without any distro set. This is a dummy placeholder value and it really<br>
does mean to say that no distro is set.<br>
<br>
We did put a value into the DISTRO_VERSION field so you could tell what<br>
was being used but again its a placeholder.<br>
<br>
So in my view &quot;nodistro&quot; is clearer about what is meant.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--f46d043d67373b8b8e04eaa89bdd--
