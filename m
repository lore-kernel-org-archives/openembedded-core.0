Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id C4A6B6FFF7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 12:28:12 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id n10so5413315obb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=dc7MRJ8n6P+IfWBdzdoCQ2SbIbKjryeDbybxR7W8Pi4=;
	b=z+tFE8SgYiERDbeW10u0T3v/L1/0JpJFJeQxQej557ZEFV4uucavJlQDs1OJf4EZVG
	e2QVUXIE9LNolfBwnBWSLWpvcdax71WKZskA1daXJIOK/oXRVmMLN10yirWozVZ2k0uY
	glzNfECSO4bFLtq6N3jU6b0VJx6KVdmGL+RdBA0qeHvaW71Dy0QVgglO/fmP20XSn7ZM
	AMvmowItfxOIgZ9ADxIun5ThQFQLeqnfYjreGilKyIXlCUIHELaq9vMO27+tjyMz6J/e
	fexcOb4SY29k8O3Xaf0APcUVt/IaP/4WGGugK1Uud+vAkoZIyvT0IWc6CMR0r0n7y4y3
	JF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=dc7MRJ8n6P+IfWBdzdoCQ2SbIbKjryeDbybxR7W8Pi4=;
	b=Rhi6CDVEBz/nR4MVHEEKoj/+nG2LAio6DKlk17+KMdyu1NHT9isTY1m48szfriiF9/
	wlbAuB8cYiGHPTmtsDBnx9mRhyM0HIwA2b8ByDlNm1hruT/KyKQuTo0V8y7+3aoO1nXH
	8Hc0BXCpIrQJE+rHYjqJThlI6OOGcz/7n40gGlljDRvDo6mq7oR8FzErrOsQYUGYDM3R
	n7fXMjDeu6Os0pRER0YKE3H3Jey/kDazLi9dNDzBuxCtsIQb90ULrbN5zs/AW/RhsnKK
	bAUKo1TnZ0MJOi/tV61xB5itV7w8sohTIjm+nORgAcMoEsgWv6ctoaH/7AaOty6IeoQM
	NKLA==
X-Gm-Message-State: AOPr4FUx402pac3gc6SOeDRXdUfMZEaBV3s78caQlP2QA73ERIbChZXaBA1giSOiTzeK73eZ3xuZd8tu2AYAJQ==
MIME-Version: 1.0
X-Received: by 10.182.174.10 with SMTP id bo10mr1035947obc.38.1462278493208;
	Tue, 03 May 2016 05:28:13 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 05:28:13 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
References: <alpine.LFD.2.20.1605030649490.20066@localhost.localdomain>
Date: Tue, 3 May 2016 08:28:13 -0400
Message-ID: <CADkTA4OwEaX6pCpuuiXxuMqY_++NLS+W6pnH0siNvXD0SwhWOg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i tell which default kernel config OE started with?
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
X-List-Received-Date: Tue, 03 May 2016 12:28:12 -0000
Content-Type: multipart/alternative; boundary=e89a8f643e3c268be80531ef3e0b

--e89a8f643e3c268be80531ef3e0b
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 6:53 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   (actually, working in wind river linux but i suspect the answer will
> be the same.)
>
>   i've defined a target board and, rather than supplying a full
> "defconfig" file as a starting point for kernel configuration, my BSP
> layer starts by applying a "kernel_baseline.cfg" file which contains
> only a couple hundred settings that i am particularly interested in.
>
>   so, given that, how can i tell what OE chose as a starting point for
> a .config file before beginning to apply my kernel config fragments?
> i'm poking around in the log files of the build, but i can't seem to
> see where the "configme" process selects a starting point. am i just
> missing the obvious? i want to see the .config file *before* any of my
> fragments are applied.
>

If you haven't specified a defconfig (in-tree, or in your layer), and are
only using fragments, then it will
be the first fragment. There's no logic to go out and find a baseline,
since it would almost always not
be what someone wanted.

Cheers,

Bruce


>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f643e3c268be80531ef3e0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 6:53 AM, Robert P. J. Day <span dir=3D"ltr">&lt;=
<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcour=
se.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 (actually, working in wind river linux but i suspect the answer will=
<br>
be the same.)<br>
<br>
=C2=A0 i&#39;ve defined a target board and, rather than supplying a full<br=
>
&quot;defconfig&quot; file as a starting point for kernel configuration, my=
 BSP<br>
layer starts by applying a &quot;kernel_baseline.cfg&quot; file which conta=
ins<br>
only a couple hundred settings that i am particularly interested in.<br>
<br>
=C2=A0 so, given that, how can i tell what OE chose as a starting point for=
<br>
a .config file before beginning to apply my kernel config fragments?<br>
i&#39;m poking around in the log files of the build, but i can&#39;t seem t=
o<br>
see where the &quot;configme&quot; process selects a starting point. am i j=
ust<br>
missing the obvious? i want to see the .config file *before* any of my<br>
fragments are applied.<br></blockquote><div><br></div><div>If you haven&#39=
;t specified a defconfig (in-tree, or in your layer), and are only using fr=
agments, then it will</div><div>be the first fragment. There&#39;s no logic=
 to go out and find a baseline, since it would almost always not</div><div>=
be what someone wanted.</div><div><br></div><div>Cheers,</div><div><br></di=
v><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
rday<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
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
in/rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--e89a8f643e3c268be80531ef3e0b--
