Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D53856612D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 01:39:59 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x185so2331604qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jr6BIG6h9eZMZcBOLSORCqMubKmaNLarGgCKZjtoGbE=;
	b=U1Dqw7xX6UU+4r2y9OiffpH0qocJ/suGhL8/OJWxQAPXZr1COlTJck2Bf1Roq3/xh7
	33TCe+nYv0DCTITLCt69KN3B0EvIy0byjC/4uP2r+QWNqWoHe2aW39FWnOzNQcgfBRIB
	aR4MMvbcbpq2Ft2JHWWupYIpbLWxYzxs+FLFxyQRJbk5ap76/h01GFGvOZ6hV+WSbg89
	sgyT+hxN6434o5qZObbzpb8IfjvVSX25teblm8SQnlRWPA0kkSkAL84gSBACoe2CIAnR
	QYIsnvO1KOjq1R9uQkFcFJfsNhe59nt7ByCHw3ymvlzjGt0YFPf9IMN/JtVdt3+etPvY
	eFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jr6BIG6h9eZMZcBOLSORCqMubKmaNLarGgCKZjtoGbE=;
	b=Z/sDZmx/pDR7k0vZ5QGSPw7Kr+ZbTCo/REbQz3dfjG3miCfDxDSx2LO5oRw4a1j6HO
	iG+BqRu5z9cBZBKC91CLq7OKpeAE7h3c8gJLbvR3ewg5A9YxPCRnEj2GQ6a3T/WsW+fL
	GJ68W0jr4cNgsL5f6tmkmC0EH0anpcy+u8LqZ0GjQQzzkh1/FDYmnSz7Qv2tr++xbZxF
	KKokNQkV9vtkS1p9XnGMzTDxcj1HcuTuEfMHAsTSYToD/SwzDMjkIR/81Kzy1jPbVSJT
	LkRbn3r2VFppCX/gIQTY9AW/sbKGtE2SionRQZlWv1wO3a9xlpPfFEZGUIQ8iq3zN3Lm
	y2PA==
X-Gm-Message-State: AEkoousE//87/CHYLYApLfoFIfQ8NNw22tv8d6aPyLsM+aBSIE2w11EgPTsNBXN+dxM5KAXloOx4pE4uQ+LzHQ==
X-Received: by 10.55.139.4 with SMTP id n4mr3595097qkd.161.1470274799873; Wed,
	03 Aug 2016 18:39:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Wed, 3 Aug 2016 18:39:59 -0700 (PDT)
In-Reply-To: <20160803125336.GA24499@openSUSE-i7.site>
References: <20160801123253.9292-1-twoerner@gmail.com>
	<CADkTA4Pa0pjQ8HQwAFq6jZUW5TXjfYd=pkdaOoDgU5S7x2hhsQ@mail.gmail.com>
	<CAJTo0LaXhsr4xJwR05DP2F+mNjJOwGQ+xfGb=d2cTgn2DaTiKw@mail.gmail.com>
	<20160803125336.GA24499@openSUSE-i7.site>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Aug 2016 21:39:59 -0400
Message-ID: <CADkTA4NvDf+Wo8fSGiRGirE74z7Bi8EjmFeK-opz=sUzMJLsNw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add lzop dependency
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
X-List-Received-Date: Thu, 04 Aug 2016 01:40:02 -0000
Content-Type: multipart/alternative; boundary=001a114f83442b324a05393507fd

--001a114f83442b324a05393507fd
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 3, 2016 at 8:53 AM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Mon 2016-08-01 @ 03:08:36 PM, Burton, Ross wrote:
> > On 1 August 2016 at 15:07, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > > Not a large dependency, but it does bring to mind the question if this
> > > could be conditional on the type of image being built ? via  distro
> > > feature, some other mechanism ?
> > >
> >
> > Exactly this: image building adds dependencies automatically based on
> what
> > is actually being used, so can the kernel do this too?
>
> The way the build knows which image was built is to build the kernel then
> look
> in the output directory to see what extension was given to the artifact.
> iow,
> it only discovers the dependency partway through the build; it doesn't know
> the dependency when the build starts.
>
> Either bitbake will have to put together the kernel's config at the start
> of
> the build, then parse through it to try to determine which kernel will be
> built, or we need some sort of mechanism that allows us to add dependencies
> partway through a build, or we can add (yet another) build variable and
> hope
> people are able to keep it in sync.
>
>
I'm on vacation for the next two weeks, so sorry for the slow reply.

Wouldn't something like PACKAGECONFIG work here ? Something automatic
is going to be complex (like you describe), but something like this would
be an
easy way for a BSP (or other) layer to bbappend the kernel and add this as
a dependency.

... but then again, I suppose they could currently just bbappend the kernel
recipe
and add it directly to the DEPENDS.

Bruce


>
> ...or we could just add lzop-native as a static dependency in the
> off-chance that
> it's needed.
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f83442b324a05393507fd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 3, 2016 at 8:53 AM, Trevor Woerner <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:twoerner@gmail.com" target=3D"_blank">twoerner@gmail.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On M=
on 2016-08-01 @ 03:08:36 PM, Burton, Ross wrote:<br>
</span><span class=3D"">&gt; On 1 August 2016 at 15:07, Bruce Ashfield &lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; &gt; Not a large dependency, but it does bring to mind the question if=
 this<br>
&gt; &gt; could be conditional on the type of image being built ? via=C2=A0=
 distro<br>
&gt; &gt; feature, some other mechanism ?<br>
&gt; &gt;<br>
&gt;<br>
&gt; Exactly this: image building adds dependencies automatically based on =
what<br>
&gt; is actually being used, so can the kernel do this too?<br>
<br>
</span>The way the build knows which image was built is to build the kernel=
 then look<br>
in the output directory to see what extension was given to the artifact. io=
w,<br>
it only discovers the dependency partway through the build; it doesn&#39;t =
know<br>
the dependency when the build starts.<br>
<br>
Either bitbake will have to put together the kernel&#39;s config at the sta=
rt of<br>
the build, then parse through it to try to determine which kernel will be<b=
r>
built, or we need some sort of mechanism that allows us to add dependencies=
<br>
partway through a build, or we can add (yet another) build variable and hop=
e<br>
people are able to keep it in sync.<br><br></blockquote><div><br></div><div=
>I&#39;m on vacation for the next two weeks, so sorry for the slow reply. <=
br><br></div><div>Wouldn&#39;t something like PACKAGECONFIG work here ? Som=
ething automatic<br></div><div>is going to be complex (like you describe), =
but something like this would be an<br></div><div>easy way for a BSP (or ot=
her) layer to bbappend the kernel and add this as<br></div><div>a dependenc=
y.<br><br></div><div>... but then again, I suppose they could currently jus=
t bbappend the kernel recipe<br></div><div>and add it directly to the DEPEN=
DS.<br></div><div><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
...or we could just add lzop-native as a static dependency in the off-chanc=
e that<br>
it&#39;s needed.<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114f83442b324a05393507fd--
