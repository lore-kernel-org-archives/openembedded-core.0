Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TZnl4-0007YK-B0
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Nov 2012 20:08:50 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa11so2322809pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2012 10:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=EV24X/zt4O1PJKgCgT5n0ygDgnwYgM78gsLKBQNoWNo=;
	b=eZUpLlM4bmkbrg4dvwWZ5bzWCckfq4cHZrfMQVvyf6MGz0ZnTsontZMxRGcxxcdiGc
	aS1qSVPCOr58EbaGytlK74zqhKTmheAOWrwKWnqsFXLghYUjuT5suJfohEVyAlsWxn3D
	Wu5Vi82kl2qOdVaQJiJHjDilw8ticshWMUU+78fRHv68wQg2W3ovn0Re+1gEXv2Vwdu7
	TKG670HjAFSJ3n/xD7GEh6kmUMOIYv6JqGxUEdznU7WrhGj6ZHUBEiFfW6/OHFcrIEQY
	DR/seJed6L01LR65agrS0xzuYRW5fBV3BKX5fxw7jWeUZvT3JiKouj33malp6T8sjlSl
	DSGw==
MIME-Version: 1.0
Received: by 10.68.204.103 with SMTP id kx7mr20525260pbc.33.1353178489831;
	Sat, 17 Nov 2012 10:54:49 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Sat, 17 Nov 2012 10:54:49 -0800 (PST)
In-Reply-To: <CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
References: <1353096699-19130-1-git-send-email-dromede@gmail.com>
	<20121116213636.GC3411@jama.jama.net>
	<CAHod+GfAof60ycR5EXosair15O87dvZhnxWSouhdF49x8sZQqQ@mail.gmail.com>
	<20121116222855.GD3411@jama.jama.net>
	<CABcZANnSgJYUvwPFzcHaD-W7aBK+7Q=uh785-sQzbokSrq2UoQ@mail.gmail.com>
	<CAHod+GeYEUMW6z25i0xOEqGvRHfKrWV3TNHyEO8B9ZjFeDEBOA@mail.gmail.com>
	<CABcZANksE98pw4N6hGntTGtm4__gSO1cy4GSx6ULsqkg_yUAZQ@mail.gmail.com>
Date: Sat, 17 Nov 2012 16:54:49 -0200
X-Google-Sender-Auth: 9utJUbD73MENRQ8Z0FIDrBjst2U
Message-ID: <CAP9ODKrzkB0qje_8zcXOfRGcf+T=4yMR2kJJ0Lb2eCa2e9FrJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] udev: Remove deprecated binaries from packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Nov 2012 19:08:50 -0000
Content-Type: multipart/alternative; boundary=047d7b10d18534413204ceb56b05

--047d7b10d18534413204ceb56b05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 17, 2012 at 4:38 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Sat, Nov 17, 2012 at 11:02 AM, Marko Kati=C4=87 <dromede@gmail.com> wr=
ote:
>
>> A proper solution might be to:
>>
>> a) Leave udevtest and udevinfo in udev-utils to properly support older
>> versions of udev that have these packages.
>> b) Move udevadm into the main udev package. This makes a lot of sense
>> since udevadm is crucial for proper udev operation.
>> c) Remove udev-utils from RRECOMMENDS.
>>
>
> This sounds like a clean, solid route to me. Hopefully someone else will
> chime in with input on it as well.
>

I see no value in having the others and deprecated tools available. Having
udevadm available in udev-utils allows for it use with mdev for trigger the
events in kernel, for example. I like to have this possibility.

--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b10d18534413204ceb56b05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sat, Nov 17, 2012 at 4:38 PM, Chris L=
arson <span dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=
=3D"_blank">clarson@kergoth.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<div class=3D"gmail_extra"><div class=3D"im">On Sat, Nov 17, 2012 at 11:02 =
AM, Marko Kati=C4=87 <span dir=3D"ltr">&lt;<a href=3D"mailto:dromede@gmail.=
com" target=3D"_blank">dromede@gmail.com</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">

<div>A proper solution might be to:<br>
<br>
a) Leave udevtest and udevinfo in udev-utils to properly support older<br>
versions of udev that have these packages.<br>
b) Move udevadm into the main udev package. This makes a lot of sense<br>
since udevadm is crucial for proper udev operation.<br>
c) Remove udev-utils from RRECOMMENDS.</div></blockquote></div><br></div>Th=
is sounds like a clean, solid route to me. Hopefully someone else will chim=
e in with input on it as well.</div></blockquote><div><br></div><div>I see =
no value in having the others and deprecated tools available. Having udevad=
m available in udev-utils allows for it use with mdev for trigger the event=
s in kernel, for example. I like to have this possibility.</div>
<div>=C2=A0</div></div>-- <br>Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=C2=A0 <a href=3D"http://www.ossyst=
ems.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0<a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://pr=
ojetos.ossystems.com.br</a><br><br>

--047d7b10d18534413204ceb56b05--
