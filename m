Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id A772571A31
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2016 16:04:16 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id x4so17460692oix.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Nov 2016 08:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=ly+V/sjxDc3n7tzQKmhw3ChzGqAgGeVX2+tILG5Pu4g=;
	b=kWgk5AuQkrb1t8C1zl/aLQFvr57smrdvLwCOr/wlu67W2LVAUTYrAtI0RmK1C45AuJ
	uTPgR2OWmqZL4xU6aoLwKK6YrceMNrx+DJfnps46Olr1BDfWvXvTpXF5tlL+9PeAoWQn
	okclklN7XIH1cBrVIwbaFuQKe44hLrT1DtkVsqsGxxk/ewzWTnG7SZfoDOKERN6dSdh1
	DlNDi4DQzgaWH5a027sm69KEE6T+Lk75yket6C9JCKkOuKTFIHG6B++2ujdGsYKAG40+
	ZzdPiVtfE+8fGwLvDU21SvgY3PrMN5ev//KZA7G2uGY6wE6yYoiMO89/xfjnFcaKw6cQ
	70IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=ly+V/sjxDc3n7tzQKmhw3ChzGqAgGeVX2+tILG5Pu4g=;
	b=IYwPZednVouiAYQq6YaFGV0P/IbOory+3DYkHAawzI8ONGsXdP0XOe/eWt7eRcdjHe
	1tgqbJ3SIlCInU3gEFG6PvpR76GBliN3FKr8HjsKxNAQcbmKhkseRABac44sAWkcHvo8
	vdUa0FMqdF8k/43UbzwlbF1xjWOlm6IAN5TKSoKrhKeYaO7uUSdYpPhiyOUAxgo1G1ox
	Mc2G0pnP0zo9dg5hZQGUSTbtz4byxdet67uB/qb+oMX/bmeQchaI7KoSmAg6rmldU3pw
	xFL/V/+qU70Idq0Af1pLjc9RUUFCXtX9kMPh4LTsvb0vm6LClDUviJO+CVd4uFzS0G6U
	jj3g==
X-Gm-Message-State: ABUngveo83fHr9fBdwZEyu8GJdlegyCXAEmLu3Ty2fwkjXrGwEnONnjnFRJHLp+jc6qVYKa55zVTm/qXlbO4pg==
X-Received: by 10.157.41.210 with SMTP id g18mr1455352otd.176.1478448257631;
	Sun, 06 Nov 2016 08:04:17 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sun, 6 Nov 2016 08:03:57 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
References: <alpine.LFD.2.20.1611060625550.19174@localhost.localdomain>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 6 Nov 2016 09:03:57 -0700
X-Google-Sender-Auth: ZU7zuh3GdrG-DO749_2y3ZOwXGU
Message-ID: <CABcZANneDWqsPA8HEDCes7uKvvBVPTKhzk8w78g5a38SgxWxGw@mail.gmail.com>
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
X-List-Received-Date: Sun, 06 Nov 2016 16:04:16 -0000
Content-Type: multipart/alternative; boundary=001a1141487c3709330540a40fa7

--001a1141487c3709330540a40fa7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 6, 2016 at 4:28 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>   currently writing my first batch of perl recipes, fairly mindlessly
> plagiarizing from existing recipes, first bunch worked fine, then i
> whipped together a recipe for SOAP::Lite from here:
>
>   https://metacpan.org/pod/SOAP::Lite
>
> built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm
> to my core-image-minimal build, i got:
>
>   Computing transaction...error: Can't install \
>     perl-soap-lite-1.20-r0@all: no package provides /bin/env
>
> sure enough, that rpm has that dependency:
>
>   $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm
>   /bin/env
>   /usr/bin/env
>   perl
>   $
>
> and when i fire up my "qemuppc" session for that core-image-minimal
> image, there is indeed no /bin/env file (hence the error), but there
> is:
>
>   /usr/bin/env -> /bin/busybox.nosuid
>
> so ... what is the proper solution for this? i suspect i'm going to
> run into this issue again in upcoming recipes, so i'd love to resolve
> it in a minimally hacky way.
>

Sounds like there=E2=80=99s a script in that package with a #!/bin/env, whi=
ch is
wrong.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141487c3709330540a40fa7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Nov 6, 2016 at 4:28 AM, Robert P. J. Day <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.c=
a</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":19d" =
class=3D"a3s aXjCH m158397f083ff3afe">=C2=A0 currently writing my first bat=
ch of perl recipes, fairly mindlessly<br>
plagiarizing from existing recipes, first bunch worked fine, then i<br>
whipped together a recipe for SOAP::Lite from here:<br>
<br>
=C2=A0 <a href=3D"https://metacpan.org/pod/SOAP::Lite" rel=3D"noreferrer" t=
arget=3D"_blank">https://metacpan.org/pod/SOAP:<wbr>:Lite</a><br>
<br>
built fine, but when i tried to add the perl-soap-lite-1.20-r0.all.rpm<br>
to my core-image-minimal build, i got:<br>
<br>
=C2=A0 Computing transaction...error: Can&#39;t install \<br>
=C2=A0 =C2=A0 perl-soap-lite-1.20-r0@all: no package provides /bin/env<br>
<br>
sure enough, that rpm has that dependency:<br>
<br>
=C2=A0 $ rpm -qpR perl-soap-lite-1.20-r0.all.rpm<br>
=C2=A0 /bin/env<br>
=C2=A0 /usr/bin/env<br>
=C2=A0 perl<br>
=C2=A0 $<br>
<br>
and when i fire up my &quot;qemuppc&quot; session for that core-image-minim=
al<br>
image, there is indeed no /bin/env file (hence the error), but there<br>
is:<br>
<br>
=C2=A0 /usr/bin/env -&gt; /bin/busybox.nosuid<br>
<br>
so ... what is the proper solution for this? i suspect i&#39;m going to<br>
run into this issue again in upcoming recipes, so i&#39;d love to resolve<b=
r>
it in a minimally hacky way.</div></blockquote></div><br>Sounds like there=
=E2=80=99s a script in that package with a #!/bin/env, which is wrong.<br>-=
- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Chr=
istopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmb=
edded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor=
 Graphics</div>
</div></div>

--001a1141487c3709330540a40fa7--
