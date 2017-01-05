Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id E532660602
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 01:14:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f201so77146974oib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 17:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JZ3Crg/rtrM/hFxiFXJ12+n50XmLreOxJ2ZMy0+61h8=;
	b=IoYCs/zC6LqwEeym/qvMMf7apynd0vPTUorW6qCxn8laf3Yd3LI913gmDJVt/0p/6B
	UAo4/1lK8r7kH0CEEd3x2ua5roxuote12KKMn8gnrUvgQRQJDzeogwDCu0Xo6goVZymA
	GThLijbcXUOFn2QAvQTw0dACVf8EWdWYqIMUrgIBssq8f1X57sfwIJBMVkeks5y/f5No
	trC94lEt0dERCfmexyl+Q4ZywNSwPmoYZ7Hw4X00OzztcieySlpoMa1sLtO66INRF7eF
	xOID+jdou0PD9iDGfz9g7J0ezOOvQEFIuvq5MhMAdAtypHwDUT0I0CYz1MBhmSBx+217
	Tc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JZ3Crg/rtrM/hFxiFXJ12+n50XmLreOxJ2ZMy0+61h8=;
	b=qIuzcYuWSzCZf8wvkzVyJ5eaiiyM4WoWwZPLISDfHReTdAa2vHos8gE3jOqAMu7562
	IlYd+8IDwg1TTjl6gR8xoWPMWLGn2+01gbqHA9N6CniVgtAathk6rupSo9HSItZniI4J
	4Dec0FtY8Fcduptwum1cCSq5qb6yQ2gqCCbzNu6ZbN2/so5Vn5yIPOAIwFOTgnB0dGm0
	WNqV5EHoeXhtw795HmbXpStSdgJfceuUQQhMJV5rr27WsKCYxgAzklNp4qY8xY4FQIAJ
	asCE/61vNQprjzMbl2AKWTSg6N1k02OoUByyMFywb9ai54tD95ep68I9RORifQsqhLfY
	2ZZA==
X-Gm-Message-State: AIkVDXKYE2R6/heluJNNBE9ppvCKoOKaWGWlk5CwyWamFGfsjRERwO7ovR9EehQ9ocaOw8HGBnArWdmfCCODoQ==
X-Received: by 10.202.79.208 with SMTP id d199mr1952174oib.199.1483578850699; 
	Wed, 04 Jan 2017 17:14:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.19.10 with HTTP; Wed, 4 Jan 2017 17:13:50 -0800 (PST)
In-Reply-To: <CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 4 Jan 2017 18:13:50 -0700
Message-ID: <CABcZAN=yV3qbbQVVcSeWjdEBpf9uSd-f93LDFs-HsEYDjb6tDQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Thu, 05 Jan 2017 01:14:11 -0000
Content-Type: multipart/alternative; boundary=001a113d6768646e0c05454e9efa

--001a113d6768646e0c05454e9efa
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2017 at 4:49 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com> wrote:
>
>> These aren't buildable without it, and adding it fixes oe-core world
>> builds
>> with nodistro (which does not have the opengl feature by default).
>>
>
> Am I still the only person who thinks skipping of recipes should be
> recursive, so if say libx11 throws a SkipRecipe then everything else that
> depends on it is also magically skipped?


I=E2=80=99d agree with that. It=E2=80=99d be a nice improvement. The user w=
ould see an
explicit error if they try to build it, as is always the case with skipped
recipes, but it=E2=80=99d be silently excluded from world the way skipped r=
ecipes
usually are.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a113d6768646e0c05454e9efa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jan 4, 2017 at 4:49 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""><di=
v class=3D"gmail_quote">On 4 January 2017 at 22:57, Christopher Larson <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">ke=
rgoth@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D"m_-2295859622401412287:419" class=3D"m_-2295859622401412287a3s m_-2=
295859622401412287aXjCH m_-2295859622401412287m1596bb4613b3de8d">These aren=
&#39;t buildable without it, and adding it fixes oe-core world builds<br>
with nodistro (which does not have the opengl feature by default).<br></div=
></blockquote></div><br></span>Am I still the only person who thinks skippi=
ng of recipes should be recursive, so if say libx11 throws a SkipRecipe the=
n everything else that depends on it is also magically skipped?</blockquote=
></div><br>I=E2=80=99d agree with that. It=E2=80=99d be a nice improvement.=
 The user would see an explicit error if they try to build it, as is always=
 the case with skipped recipes, but it=E2=80=99d be silently excluded from =
world the way skipped recipes usually are.<br>-- <br><div class=3D"gmail_si=
gnature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=
=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Senior Software Engineer, Mentor Graphics</d=
iv></div></div></div>
</div></div>

--001a113d6768646e0c05454e9efa--
