Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 987096D230
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 13:25:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id o189so9955851wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 May 2019 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e6B6jYBdw38Pzdmz7vdfLf46MXKzdzRn/pclth0AqwY=;
	b=TXtMpLRpa+LVqeaWpn8b9i788r481U1hR36QYsGOZ7m8APIOpBV8izAh6703742QtE
	h08U9odFteZpCU+bqU+XvCXBcUi89lhfHhNZ2cnW5IQA53z7EEkQgL2MWJNfLMSwR/ie
	hibeRIDj/H2YNcUL0Suf2ctHyU/LKHkgih6ZatTi1U+ptoEoLH5Tx3pW6QyHxFgCse4V
	z7w/iwzIYt6WcAij207mPsTxjWIGCstMgPHbfUJWSUYykSB599pmKZVr9laWkk5NdPSa
	+36lpwAmfX7NrI8ZJSItloLw8vND5SKvm2fbK2XSQrY6oJR/R+juRr06gFy2rnrXvVVz
	2ceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e6B6jYBdw38Pzdmz7vdfLf46MXKzdzRn/pclth0AqwY=;
	b=Zo3DQoBVG0oahu/34MIAebbKXXgHgbXqE6+ACL7jprlq8tfaQyqAd18INjoP+tTlnY
	C33SB5k0jlqeLa2lHKItSOTjKsP+V5c4jGIleUItkVlUBQjjM7XJNwhmo/mv6sUt0WHl
	QLxDZRyk9fa0wpNz1+TG6Pc96Jbv/YQBbjwRIRWUA0QiQwP5+j67Wn8lTVsHw4HvQkvJ
	jzsbgX84NOzrYXPf/DCX+3ZG/AFGC849K41YatJ89TK0IJ6E6nsRyoevne9JuhlXytbb
	jVUmnBBheRaoBYTRHNTEoGMJH+d7nysvKRxB6LeVHTS0xoL6w7BeOmXu74hLB0JkcEvV
	53Og==
X-Gm-Message-State: APjAAAVvLodJD5gqJViSgBIJ/DSUxuaKd25oUD5TWyb0oPMlQq5dWxO2
	QmzQzu2F9DHH3YthjIMJGQjCXtabbVJ0qT/NOKk=
X-Google-Smtp-Source: APXvYqyg1ivYdnL0r3skP7ACk83Aw+470Fws0d2mel/OYH3IDMv3c5TWxLFAwkk0KmrVUTpYMJkt9TOL0/nJZNAqTRo=
X-Received: by 2002:a1c:20c9:: with SMTP id g192mr10041241wmg.76.1557581117654;
	Sat, 11 May 2019 06:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190510215500.18914-1-Martin.Jansa@gmail.com>
	<283277a6-b6d3-a1c8-b0dc-cd4e37232fc5@gmail.com>
	<5f672760-135c-2ebc-aef1-65af6b1e9d4f@gmail.com>
	<CAJ86T=V98Sv8re5sTq8w8KHAvHJKi2uSvDs4itO69SgXbi1JGQ@mail.gmail.com>
	<3b7d605c-ac73-6edf-7b39-598d451a4453@gmail.com>
	<20190511010421.GA1523@jama>
	<CAJdd5GYVfHO8Hs21P0Ohun12nEEqcgwBeWdYtsUPdtLGLi6MXQ@mail.gmail.com>
	<20190511072048.GB24494@localhost>
In-Reply-To: <20190511072048.GB24494@localhost>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 11 May 2019 08:25:04 -0500
Message-ID: <CAJdd5Ga2T17udpj8L9Jm7wSZPywheK+bDVX0zNrd21OGMgiF1g@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glib-networking: add PACKAGECONFIG for openssl
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
X-List-Received-Date: Sat, 11 May 2019 13:25:18 -0000
Content-Type: multipart/alternative; boundary="0000000000003a094605889c9d4b"

--0000000000003a094605889c9d4b
Content-Type: text/plain; charset="UTF-8"

On Sat, May 11, 2019, 2:20 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Fri, May 10, 2019 at 08:17:50PM -0500, Joshua Watt wrote:
> > On Fri, May 10, 2019, 8:04 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > > On Fri, May 10, 2019 at 04:54:57PM -0700, Khem Raj wrote:
> > > >
> > > >
> > > > On 5/10/19 4:00 PM, Andre McCurdy wrote:
> > > > > On Fri, May 10, 2019 at 3:16 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > >>
> > > > >> On 5/10/19 3:13 PM, akuster808 wrote:
> > > > >>> should we change the default to openssl ?
> > > > >>
> > > > >> I dont think so. Since newer versions of gnuTLS works okay.
> > > > >
> > > > > Isn't one of the goals for OE 2.8 to replace dependencies on
> [L]GPLv3
> > > > > components with non-[L]GPLv3 alternatives so that meta-gplv2 can be
> > > > > deprecated? This would seem to fit that goal exactly.
> > > >
> > > > Is that stated somewhere ? while I like the goal probably I missed
> the
> > > > memo, my suggestion was just to give openssl backend some time to
> mature
> > > > since its relatively new, and maybe give it some soak time
> > > >
> > > > >
> > > > > It wasn't possible to build glib-networking with openssl until very
> > > > > recently but now that it's supported upstream I think we should
> > > > > switch.
> > > > >
> > > > >    https://github.com/GNOME/glib-networking/blob/master/NEWS
> > >
> > > I don't have strong opinion either way.
> > >
> > > I didn't want to change the default, because my only motivation was the
> > > license issue with the newer gnutls, with the PACKAGECONFIG available
> > > it's easy to change the TLS backend and that's all I need.
> > >
> > > Will send v2 if there is some consensus from glib-networking users that
> > > it should be changed and someone provides me the reasoning for the
> > > commit message.
> > >
> >
> > FWIW, moving away from GPLv3 and/or meta-gplv2 has been discussed in the
> > 2.8 planning meetings:
> >
> https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/edit?usp=drivesdk
> >
> > Not that it needs to be done right now. It is nice to at least have the
> > option.
>
> It doesn't read as if "replace dependencies on [L]GPLv3 components" or
> "moving away from GPLv3" would charcterize it correctly.
>
> It says to create a *configuration* for the small subset of Yocto users
> who do not want to have GPLv3 code on their target.
>
> For these users it is clear that they want to use openssl if they use
> glib-networking,[1] and that they want to stick with busybox applets
> instead of bash and all the GNU utilities.
>

Right, I was a little too strong there; I didn't mean to imply that anyone
is proposing to completely remove GPLv3, just provide alternatives that
aren't meta-gplv2.


> For everyone else nothing has to change.
>
> cu
> Adrian
>
> [1] Which BTW creates its own licence headaches due to OpenSSL having
>     a GPL-incompatible licence.
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--0000000000003a094605889c9d4b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, May 11, 2019, 2:20 AM Adrian Bunk &lt;<a href=
=3D"mailto:bunk@stusta.de" target=3D"_blank" rel=3D"noreferrer">bunk@stusta=
.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, May 10, =
2019 at 08:17:50PM -0500, Joshua Watt wrote:<br>
&gt; On Fri, May 10, 2019, 8:04 PM Martin Jansa &lt;<a href=3D"mailto:marti=
n.jansa@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">martin.j=
ansa@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Fri, May 10, 2019 at 04:54:57PM -0700, Khem Raj wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 5/10/19 4:00 PM, Andre McCurdy wrote:<br>
&gt; &gt; &gt; &gt; On Fri, May 10, 2019 at 3:16 PM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; On 5/10/19 3:13 PM, akuster808 wrote:<br>
&gt; &gt; &gt; &gt;&gt;&gt; should we change the default to openssl ?<br>
&gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt;&gt; I dont think so. Since newer versions of gnuTLS wor=
ks okay.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Isn&#39;t one of the goals for OE 2.8 to replace depend=
encies on [L]GPLv3<br>
&gt; &gt; &gt; &gt; components with non-[L]GPLv3 alternatives so that meta-=
gplv2 can be<br>
&gt; &gt; &gt; &gt; deprecated? This would seem to fit that goal exactly.<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Is that stated somewhere ? while I like the goal probably I =
missed the<br>
&gt; &gt; &gt; memo, my suggestion was just to give openssl backend some ti=
me to mature<br>
&gt; &gt; &gt; since its relatively new, and maybe give it some soak time<b=
r>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It wasn&#39;t possible to build glib-networking with op=
enssl until very<br>
&gt; &gt; &gt; &gt; recently but now that it&#39;s supported upstream I thi=
nk we should<br>
&gt; &gt; &gt; &gt; switch.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/GNOME/glib-n=
etworking/blob/master/NEWS" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">https://github.com/GNOME/glib-networking/blob/master/NEWS</a><b=
r>
&gt; &gt;<br>
&gt; &gt; I don&#39;t have strong opinion either way.<br>
&gt; &gt;<br>
&gt; &gt; I didn&#39;t want to change the default, because my only motivati=
on was the<br>
&gt; &gt; license issue with the newer gnutls, with the PACKAGECONFIG avail=
able<br>
&gt; &gt; it&#39;s easy to change the TLS backend and that&#39;s all I need=
.<br>
&gt; &gt;<br>
&gt; &gt; Will send v2 if there is some consensus from glib-networking user=
s that<br>
&gt; &gt; it should be changed and someone provides me the reasoning for th=
e<br>
&gt; &gt; commit message.<br>
&gt; &gt;<br>
&gt; <br>
&gt; FWIW, moving away from GPLv3 and/or meta-gplv2 has been discussed in t=
he<br>
&gt; 2.8 planning meetings:<br>
&gt; <a href=3D"https://docs.google.com/document/d/1CNEKA4d0eT6-e0hnS2pwi7x=
dZ5_t6smpZO2HbaJGXbU/edit?usp=3Ddrivesdk" rel=3D"noreferrer noreferrer nore=
ferrer" target=3D"_blank">https://docs.google.com/document/d/1CNEKA4d0eT6-e=
0hnS2pwi7xdZ5_t6smpZO2HbaJGXbU/edit?usp=3Ddrivesdk</a><br>
&gt; <br>
&gt; Not that it needs to be done right now. It is nice to at least have th=
e<br>
&gt; option.<br>
<br>
It doesn&#39;t read as if &quot;replace dependencies on [L]GPLv3 components=
&quot; or<br>
&quot;moving away from GPLv3&quot; would charcterize it correctly.<br>
<br>
It says to create a *configuration* for the small subset of Yocto users <br=
>
who do not want to have GPLv3 code on their target.<br>
<br>
For these users it is clear that they want to use openssl if they use<br>
glib-networking,[1] and that they want to stick with busybox applets<br>
instead of bash and all the GNU utilities.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Right, I was a little too strong =
there; I didn&#39;t mean to imply that anyone is proposing to completely re=
move GPLv3, just provide alternatives that aren&#39;t meta-gplv2.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
<br>
For everyone else nothing has to change.<br>
<br>
cu<br>
Adrian<br>
<br>
[1] Which BTW creates its own licence headaches due to OpenSSL having<br>
=C2=A0 =C2=A0 a GPL-incompatible licence.<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div></div>

--0000000000003a094605889c9d4b--
