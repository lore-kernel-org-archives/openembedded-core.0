Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 99172605D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 15:09:08 +0000 (UTC)
Received: by qkx62 with SMTP id 62so31640685qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 08:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=bOHEQas1+O66aOls3GG5igp9q4NEHoph4+y93M3YOY8=;
	b=S8eH7uABPkB6K3uRjciwG0iOIvzmnC9hQQGwUg0+om+dsf8VESxw/RR86JfWbaVjaN
	73y1StCmGa/1z9fPZki3G43qHxN9t/62eyEp8iLb7elJoDnl4c6sstp8KAXjXmCavjp5
	QICb8kPbNYr/O/9d7VnjK3/sur5hS8ShNWTXWORdAtIfPNtNs3bygDAJY9fPOnYtxfUA
	h1G5DH9S/tovDtqoVtro75fv7h9PRtQ6inSV9ENn2ecQ+8Og7u7ZId/ojnyb6fxwfvSF
	u5aDRx0cKYMXrnBkYOw5H/UDRDDrLNzTiwgnkofu3ZLMNcUW81c+UH1t9D+EGzn+zo1R
	EUcQ==
X-Received: by 10.55.50.20 with SMTP id y20mr16290108qky.58.1429888149319;
	Fri, 24 Apr 2015 08:09:09 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.34 with HTTP; Fri, 24 Apr 2015 08:08:49 -0700 (PDT)
In-Reply-To: <d98a4f63e65361f1356643863632fa26324d5b93.1429865892.git.Qi.Chen@windriver.com>
References: <cover.1429865892.git.Qi.Chen@windriver.com>
	<d98a4f63e65361f1356643863632fa26324d5b93.1429865892.git.Qi.Chen@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 24 Apr 2015 08:08:49 -0700
X-Google-Sender-Auth: zYov-wEMBGOKYv5CUSmMpnrWFxI
Message-ID: <CABcZAN=ARLjs+tw_A73q43TP3-9Ya1F67aZsJ0wdMxSe7FuGAw@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/2] populate_sdk_base: avoid executing empty function
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
X-List-Received-Date: Fri, 24 Apr 2015 15:09:08 -0000
Content-Type: multipart/alternative; boundary=001a11471392357720051479c776

--001a11471392357720051479c776
Content-Type: text/plain; charset=UTF-8

On Fri, Apr 24, 2015 at 1:59 AM, Chen Qi <Qi.Chen@windriver.com> wrote:

> -    bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
> +    sdk_packaging_func = d.getVar("SDK_PACKAGING_FUNC", True) or ""
> +    if sdk_packaging_func.strip():
> +        bb.build.exec_func(d.getVar("SDK_PACKAGING_FUNC", True), d)
>  }
>

You just put the value in a variable, why are you doing a second getvar
instead of using it?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11471392357720051479c776
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Apr 24, 2015 at 1:59 AM, Chen Qi <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2lh" class=3D=
"a3s" style=3D"overflow:hidden">-=C2=A0 =C2=A0 bb.build.exec_func(d.getVar(=
&quot;SDK_PACKAGING_FUNC&quot;, True), d)<br>
+=C2=A0 =C2=A0 sdk_packaging_func =3D d.getVar(&quot;SDK_PACKAGING_FUNC&quo=
t;, True) or &quot;&quot;<br>
+=C2=A0 =C2=A0 if sdk_packaging_func.strip():<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(d.getVar(&quot;SDK_PACKAGIN=
G_FUNC&quot;, True), d)<br>
=C2=A0}</div></blockquote></div><br>You just put the value in a variable, w=
hy are you doing a second getvar instead of using it?<br>-- <br><div class=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a11471392357720051479c776--
