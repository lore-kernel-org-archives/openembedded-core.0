Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id B0E416FFEF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 19:11:38 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id w194so105612599vkw.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 11:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZiEEEzcx9sEaiJDRo8WYgAk+syl2ufxpVFKppKwMAHw=;
	b=IZ9koJwVUCk03ZIdoGJmSCB+cy83hTAOsP6rZ9d5auFivU0QVZVvI9IfuzsHX1wSXR
	78fVQJZrAqvAE7OSeNdLTg6wNaS5cZ+Zdrdle+fgBCdoC7ATXy6QVWzwATy4PJp8EuX5
	dfWPltrBkbjAzIhXSBueYmvdAwUnGm1+/tpO/aA7RO7KzxqTk7T12j8EQ4xsqD4uS9KT
	KqBOFh0VjLIJPQvoRpSKDaJ7ua9SbJlanzOIamLcsr/y4XjdiivO/1nC8OnRMh7JawIj
	oxybzwY4HsciiceQ58kwAMn27i441OJ8czNXJbgC+2jS5rnRuZif62oKGVyYo2tk82v/
	a+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZiEEEzcx9sEaiJDRo8WYgAk+syl2ufxpVFKppKwMAHw=;
	b=fVlxQ3YtCExejuKmdhcStxdMipdNKsFlEStOYYmSPlTds4SumebSr1mhMZ7OOQx+c6
	APXA/3DtE0dgcnSq/rZVCml2dZsYpOLXU9OAFmI42CJXaboYx9p1WB1tipTJ0Me9+kFc
	AfiSOb7rOLiH53AlkTZ1s3ZadzCqRjZqjZATb3R5Vo/HZ+SMkMJhAyD9isreDmFORBEc
	I/7hs8KxFylMPbodFVmeiRGeYFIFYUCZALeTUk/EdQKBNfe+ISM55QoX1PLnWg3/Naqp
	Jz6FZnsQ/2VGV3UkkQHo+XfdhcrH2jqimEp29UvlJUkHW9qyrdbGXDA3XaAask0gxjop
	nC+g==
X-Gm-Message-State: ABUngvddS70ZoaEmZ5vLq2AEWMG4Bm1ldALhd7XX4Ws3YR0NZNeqY6CJn6bnYfUP6/0tBMc46dIybpWjhMEXnw==
X-Received: by 10.31.8.146 with SMTP id 140mr1744261vki.173.1478459500140;
	Sun, 06 Nov 2016 11:11:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.107.142 with HTTP; Sun, 6 Nov 2016 11:11:39 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611061315380.20227@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
	<CANx9H-DKBM9qaLr9+d0pa7YgoBs6qz6SqoJrG8L_hN0ua0xQDQ@mail.gmail.com>
	<alpine.LFD.2.20.1611061315380.20227@localhost.localdomain>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 6 Nov 2016 11:11:39 -0800
Message-ID: <CANx9H-BWEGfzMn-dyhUf+hBg7Jn2dH-nTPY3w2_CVjMUaX-rNg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: "Can't install perl-soap-lite-1.20-r0@all: no package provides /bin/env" ??
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
X-List-Received-Date: Sun, 06 Nov 2016 19:11:40 -0000
Content-Type: multipart/alternative; boundary=001a1144fa12521d0c0540a6ad09

--001a1144fa12521d0c0540a6ad09
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I created a ticket https://rt.cpan.org/Ticket/Display.html?id=3D118654
And sent a pull request https://github.com/redhotpenguin/soaplite/pull/28

Should be merged/released shortly as maintainer is already in contact.

Cheers.

--Tim

On Sun, Nov 6, 2016 at 10:16 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Sun, 6 Nov 2016, Tim Orling wrote:
>
> > https://github.com/redhotpenguin/soaplite/search?utf8=3D=E2=9C=93&q=3D%=
2Fbin%2Fenv
> <https://github.com/redhotpenguin/soaplite/search?utf8=3D%E2%9C%93&q=3D%2=
Fbin%2Fenv>
> >
> > It's only for the tests (in the ${S}/t directory by convention for
> > perl modules). I would try just doing sed to /usr/bin/env on all
> > those.
>
>   that's what i did, fixed the problem.
>
> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>

--001a1144fa12521d0c0540a6ad09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I created a ticket=C2=A0<a href=3D"https://rt.cpan.org/Tic=
ket/Display.html?id=3D118654">https://rt.cpan.org/Ticket/Display.html?id=3D=
118654</a><div>And sent a pull request=C2=A0<a href=3D"https://github.com/r=
edhotpenguin/soaplite/pull/28">https://github.com/redhotpenguin/soaplite/pu=
ll/28</a></div><div><br></div><div>Should be merged/released shortly as mai=
ntainer is already in contact.</div><div><br></div><div>Cheers.</div><div><=
br></div><div>--Tim</div></div><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On Sun, Nov 6, 2016 at 10:16 AM, Robert P. J. Day <span dir=
=3D"ltr">&lt;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpj=
day@crashcourse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On Sun, 6 Nov 2016, Tim Orling wrote:<br>
<br>
&gt; <a href=3D"https://github.com/redhotpenguin/soaplite/search?utf8=3D%E2=
%9C%93&amp;q=3D%2Fbin%2Fenv" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/<wbr>redhotpenguin/soaplite/search?<wbr>utf8=3D=E2=9C=93&amp;q=3D=
%2Fbin%2Fenv</a><br>
&gt;<br>
&gt; It&#39;s only for the tests (in the ${S}/t directory by convention for=
<br>
&gt; perl modules). I would try just doing sed to /usr/bin/env on all<br>
&gt; those.<br>
<br>
</span>=C2=A0 that&#39;s what i did, fixed the problem.<br>
<br>
rday<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div></div></blockquote></div><br></div>

--001a1144fa12521d0c0540a6ad09--
