Return-Path: <ticotimo@gmail.com>
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
	[209.85.222.51])
	by mail.openembedded.org (Postfix) with ESMTP id 56D727D90E;
	Thu, 11 Apr 2019 18:15:00 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id b8so2347686uaq.7;
	Thu, 11 Apr 2019 11:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sxtCrpmF3Ou7betowsQWGBZ9BDUP2+bTKg2O0mX5VV4=;
	b=NelsnhyhjKmLoS9mgLVcBqyOGbxgooT9zMbP8t6H2z5+u09mPV8p13jvvHFuG4Vx5T
	rVX0tmaBf2wf5YJbe8dKqFNtJYaaj6984i/fENheUd+BFtZ6XT+W9wO6uotp708Mu0Tp
	b4QbEiBDnL3SG79PD+47925fV10qHCuoVwTLn5b8UFbY2VfnU5KQkfUYWAQxhnn1joXK
	iAWZbWPI6HUz9m95amdWgEAzR1YM7Edu9jwA2iK090BV3c8QYvM9POzWgw6XhJuuwsGq
	3gTWPj22JDALH0xVNdBsJFXc54dcbUoxDcnefha8jH4Fl9/v0BZI0aJXex6cMpT0BoIK
	h+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sxtCrpmF3Ou7betowsQWGBZ9BDUP2+bTKg2O0mX5VV4=;
	b=A2UuMdxrt9VpUvOZx1xiLsp8QkX7e699Jf8LpnUzTRkI/2XJa1VIsN3LCMRSwLG6ZN
	yLvop2NMyeHqAKy6NKtmn3wLjhXK6LMaSMGxbsxc2nCPswG++Ex1VpI2qDSPwiyf1L6j
	08i3X13IGV/P0cUBYqWvdNab/vnrG6p/hZ+p2q9lfeTBSBBnVzYitO7HCNKTgRHfuqpF
	7E2vSxXwGd6mAegW083gP7G3hQqmQ58/T0thm0TQTV3hvL9QlVcn/hKSLyIaXiIr96Ux
	cZHCsX+ei6PB2U1pYvFa67cqBPX0VOaIKn4JMSA27INpQ0vy2HNt5jPQFZ7mvpE9wNNz
	fI3w==
X-Gm-Message-State: APjAAAVp1nFox/Q0cQQBIMuQgryY2BoGml6qkSceE9a1l+obP7ZuKy0S
	7trvV8KFhQ//q/Mzikyhsh6BClQ2l0wRTr0mXgA=
X-Google-Smtp-Source: APXvYqxteMfjidT6+BFxZ17nOm3r569EGEtvW+VyYqNIOAoNGr9P2nF9PmFcLfO3Nb+brMdrBjA2qRwuW6CjKm4FLVs=
X-Received: by 2002:ab0:7493:: with SMTP id n19mr1443804uap.121.1555006500890; 
	Thu, 11 Apr 2019 11:15:00 -0700 (PDT)
MIME-Version: 1.0
References: <90d55754e9381759c8b70ebca0b880e6013f17f0.camel@linuxfoundation.org>
	<f8b3661d-a6cc-494e-de49-e462ba935535@gmail.com>
	<680dff761ebd04f8f240d12339b31569c70c48da.camel@linuxfoundation.org>
	<05dd3911-b195-1d1f-b218-e4b41d80ec72@gmail.com>
	<7c1d84b0957f2831a7add461f73e3d9108176e9b.camel@linuxfoundation.org>
	<CAFNP8OstwvzhdYvyiaJ4JFZqNPGK3zypTPVEG-u437hE83js1A@mail.gmail.com>
In-Reply-To: <CAFNP8OstwvzhdYvyiaJ4JFZqNPGK3zypTPVEG-u437hE83js1A@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 11 Apr 2019 11:14:48 -0700
Message-ID: <CANx9H-BpLmKOhhetW8AKnWw+UaeD5GHjjhQVpSn+BWL=M9_ziA@mail.gmail.com>
To: Scott Rifenbark <srifenbark@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
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
X-List-Received-Date: Thu, 11 Apr 2019 18:15:00 -0000
Content-Type: multipart/alternative; boundary="0000000000001bedb40586452a53"

--0000000000001bedb40586452a53
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 11, 2019 at 9:29 AM Scott Rifenbark <srifenbark@gmail.com>
wrote:

> Richard and Armin,
>
> I am going to start pulling Eclipse from the docs today.  The changes
> won't make the frozen rc build but the website docs will reflect reality.
>

Thank you, Scott.

>
> Scott
>
> On Thu, Apr 11, 2019 at 12:20 AM <richard.purdie@linuxfoundation.org>
> wrote:
>
>> On Thu, 2019-04-11 at 08:42 +0530, akuster808 wrote:
>> >
>> > On 4/10/19 3:11 PM, richard.purdie@linuxfoundation.org wrote:
>> > > On Wed, 2019-04-10 at 05:56 +0530, akuster808 wrote:
>> > > > On 4/9/19 8:52 PM, Richard Purdie wrote:
>> > > > > I'm sorry to have to say this but the project is terminating
>> > > > > its
>> > > > > official eclipse plugin support with immediate effect.
>> > > > Does this affect the stable branches as well?
>> > > Yes, I think we'll just be removing the target from the autobuilder
>> > > entirely.
>> >
>> > Have we every removed a feature from a release? Do we need to doc
>> > this ?
>>
>> Its not so much remove as not release. No, we haven't and yes, we do
>> need to document it in the release notes.
>>
>> Cheers,
>>
>> Richard
>>
>> _______________________________________________
>> Openembedded-architecture mailing list
>> Openembedded-architecture@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>>
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
>

--0000000000001bedb40586452a53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 11, 2019 at 9:29 AM Scott Rifenbark &lt;<a href=
=3D"mailto:srifenbark@gmail.com">srifenbark@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Richard and Armin, =
<br></div><div><br></div><div>I am going to start pulling Eclipse from the =
docs today.=C2=A0 The changes won&#39;t make the frozen rc build but the we=
bsite docs will reflect reality.</div></div><div dir=3D"ltr"><div></div></d=
iv></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Thank you, Sc=
ott.</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><d=
iv>Scott<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Apr 11, 2019 at 12:20 AM &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfou=
ndation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Thu, 2019-04-11 at 08:42 +0530, akuster808 wrote:<br>
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
_______________________________________________<br>
Openembedded-architecture mailing list<br>
<a href=3D"mailto:Openembedded-architecture@lists.openembedded.org" target=
=3D"_blank">Openembedded-architecture@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-arch=
itecture" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.or=
g/mailman/listinfo/openembedded-architecture</a><br>
</blockquote></div></div>

--0000000000001bedb40586452a53--
