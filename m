Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qcasl-0007C8-KY
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 12:23:31 +0200
Received: by yib18 with SMTP id 18so1340211yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9+fvXV0fId66U/cNm4GAg1v4hjM2mlEprv1bk+K2zig=;
	b=U49BbYbkQeFacD269+N0sMgbWIpIcLzeuFLKmmkTVuK+hqy1QT3hoT1gPA5dRj1+7M
	HKRsBV8zWtkd9gjVc3xDHZsx22iK0aBRoIV7e5hMb7k4e2hCjhE+5Qr9St+OVyT4Li4m
	D1gTbUgqh7GPhd0siDIX2fNrSNUgGxuOL+TkM=
MIME-Version: 1.0
Received: by 10.91.202.38 with SMTP id e38mr2776400agq.196.1309515586677; Fri,
	01 Jul 2011 03:19:46 -0700 (PDT)
Received: by 10.90.183.14 with HTTP; Fri, 1 Jul 2011 03:19:46 -0700 (PDT)
In-Reply-To: <57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
	<BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
	<57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
Date: Fri, 1 Jul 2011 12:19:46 +0200
Message-ID: <BANLkTi=iS0wADj=2=vq9BtTSKt_bHWCw+Q@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Proposal: recipe feature switches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jul 2011 10:23:31 -0000
Content-Type: multipart/alternative; boundary=001636af03715f2d4104a6ff5bb7

--001636af03715f2d4104a6ff5bb7
Content-Type: text/plain; charset=ISO-8859-1

2011/7/1 Koen Kooi <koen@dominion.thruhere.net>

>
> Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende geschreven:
>
> >
> >
> > 2011/7/1 Koen Kooi <koen@dominion.thruhere.net>
> >
> > Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven:
> >
> > >
> > > Good idea.
> > > Personally I'd like to also bring footprint into the equation. If a
> feature drags in lots of additional packages, it is interesting to make it
> configurable.
> > > My favourite example: bluez dragging in all kind of rendering stuff
> (through DEPENDS) even though the hardware functionality might not be there
> (e.g. you have BT but not audio).
> >
> > Which is a great example, since that doesn't impact footprint at all,
> it's an alsa *plugin* that will get produced.
> >
> >
> > bluez.inc:DEPENDS = "gstreamer gst-plugins-base dbus glib-2.0"
> >
> > I don't think gstreamer is really needed or desired if you e.g. just want
> to do some tethering over bluetooth, or in my case, connect to a BT HID, and
> they do contribute to both the build time and the footprint.
>
> Again, a plugin, so no footprint issues.
>
> Well, as far as I know if it is in DEPENDS it will implicitly end up in
RDEPENDS and will become part of the image that contains bluez, unless
special precautions are taken, so it seems to me the image will grow as
plugins do consume space.

Anyway, my current project does not use or need bluez and I use a hand
crafted image picking only the things that I need so haven't really been
bitten by this recently.

Frans

--001636af03715f2d4104a6ff5bb7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/1 Koen Kooi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</=
a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt=
 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende geschreven:<b=
r>
<div><div></div><div class=3D"h5"><br>
&gt;<br>
&gt;<br>
&gt; 2011/7/1 Koen Kooi &lt;<a href=3D"mailto:koen@dominion.thruhere.net">k=
oen@dominion.thruhere.net</a>&gt;<br>
&gt;<br>
&gt; Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschrev=
en:<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Good idea.<br>
&gt; &gt; Personally I&#39;d like to also bring footprint into the equation=
. If a feature drags in lots of additional packages, it is interesting to m=
ake it configurable.<br>
&gt; &gt; My favourite example: bluez dragging in all kind of rendering stu=
ff (through DEPENDS) even though the hardware functionality might not be th=
ere (e.g. you have BT but not audio).<br>
&gt;<br>
&gt; Which is a great example, since that doesn&#39;t impact footprint at a=
ll, it&#39;s an alsa *plugin* that will get produced.<br>
&gt;<br>
&gt;<br>
&gt; bluez.inc:DEPENDS =3D &quot;gstreamer gst-plugins-base dbus glib-2.0&q=
uot;<br>
&gt;<br>
&gt; I don&#39;t think gstreamer is really needed or desired if you e.g. ju=
st want to do some tethering over bluetooth, or in my case, connect to a BT=
 HID, and they do contribute to both the build time and the footprint.<br>

<br>
</div></div>Again, a plugin, so no footprint issues.<br>
<div><div></div><div class=3D"h5"><br></div></div></blockquote><div>Well, a=
s far as I know if it is in DEPENDS it will implicitly end up in RDEPENDS a=
nd will become part of the image that contains bluez, unless special precau=
tions are taken, so it seems to me the image will grow as plugins do consum=
e space.<br>
<br>Anyway, my current project does not use or need bluez and I use a hand =
crafted image picking only the things that I need so haven&#39;t really bee=
n bitten by this recently.<br><br>Frans<br></div></div><br>

--001636af03715f2d4104a6ff5bb7--
