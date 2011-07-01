Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qca2y-00053e-8T
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 11:30:00 +0200
Received: by yib18 with SMTP id 18so1326834yib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 02:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=x2+h0sPD1Lmo7AJF9XJhWTkV97nDf9Es5Op5Jk/mwgw=;
	b=Qc3oyIBgLKlS/YsCGt/5h37nv55QDGChs6qh0/I3P7tRMx/XKRUlfHN0SiivCfnkzg
	YmUHTHuFKmJK+00wS80Hp9BaTkJgztKVDSkgsk4mrHe2b3Knycn5jWZy+BwfyYgueDYI
	QFMzbP8XT7Y+ge4bHvjsKbHjIYe7MOBmSfeWk=
MIME-Version: 1.0
Received: by 10.91.68.30 with SMTP id v30mr2912300agk.117.1309512375257; Fri,
	01 Jul 2011 02:26:15 -0700 (PDT)
Received: by 10.90.183.14 with HTTP; Fri, 1 Jul 2011 02:26:15 -0700 (PDT)
In-Reply-To: <1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
Date: Fri, 1 Jul 2011 11:26:15 +0200
Message-ID: <BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 01 Jul 2011 09:30:00 -0000
Content-Type: multipart/alternative; boundary=001485f90caaf4ca4204a6fe9b40

--001485f90caaf4ca4204a6fe9b40
Content-Type: text/plain; charset=ISO-8859-1

2011/7/1 Koen Kooi <koen@dominion.thruhere.net>

>
> Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven:
>
> >
> > Good idea.
> > Personally I'd like to also bring footprint into the equation. If a
> feature drags in lots of additional packages, it is interesting to make it
> configurable.
> > My favourite example: bluez dragging in all kind of rendering stuff
> (through DEPENDS) even though the hardware functionality might not be there
> (e.g. you have BT but not audio).
>
> Which is a great example, since that doesn't impact footprint at all, it's
> an alsa *plugin* that will get produced.
>
>
> bluez.inc:DEPENDS = "gstreamer gst-plugins-base dbus glib-2.0"

I don't think gstreamer is really needed or desired if you e.g. just want to
do some tethering over bluetooth, or in my case, connect to a BT HID, and
they do contribute to both the build time and the footprint.

Frans.

--001485f90caaf4ca4204a6fe9b40
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/1 Koen Kooi <span dir=3D"ltr">&lt=
;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.thruhere.net</=
a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt=
 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven:<b=
r>
<div><div></div><div class=3D"h5"><br>
&gt;<br>
&gt; Good idea.<br>
&gt; Personally I&#39;d like to also bring footprint into the equation. If =
a feature drags in lots of additional packages, it is interesting to make i=
t configurable.<br>
&gt; My favourite example: bluez dragging in all kind of rendering stuff (t=
hrough DEPENDS) even though the hardware functionality might not be there (=
e.g. you have BT but not audio).<br>
<br>
</div></div>Which is a great example, since that doesn&#39;t impact footpri=
nt at all, it&#39;s an alsa *plugin* that will get produced.<br>
<div><div></div><div class=3D"h5"><br>
<br></div></div></blockquote><div>bluez.inc:DEPENDS =3D &quot;gstreamer gst=
-plugins-base dbus glib-2.0&quot;<br><br>I don&#39;t think gstreamer is rea=
lly needed or desired if you e.g. just want to do some tethering over bluet=
ooth, or in my case, connect to a BT HID, and they do contribute to both th=
e build time and the footprint.<br>
<br>Frans.<br></div></div><br>

--001485f90caaf4ca4204a6fe9b40--
