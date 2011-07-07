Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qeiuu-0004gw-Cx
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 09:22:32 +0200
Received: by bwf20 with SMTP id 20so773163bwf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 00:18:41 -0700 (PDT)
Received: by 10.204.10.75 with SMTP id o11mr388502bko.124.1310023121092;
	Thu, 07 Jul 2011 00:18:41 -0700 (PDT)
Received: from [10.105.55.40] (62-50-199-254.client.stsn.net [62.50.199.254])
	by mx.google.com with ESMTPS id o27sm2454707fag.0.2011.07.07.00.18.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jul 2011 00:18:39 -0700 (PDT)
References: <1309453832.7987.33.camel@desktop.home>
	<1309472051.20015.465.camel@rex>
	<BANLkTimzg79tkU+=-AgwgYhJSC52jJVT6Q@mail.gmail.com>
	<1299A20C-0494-4434-84C4-E1503FAE0CFC@dominion.thruhere.net>
	<BANLkTimqAhtqPWbhvnA4KdzYO2oJw63bvQ@mail.gmail.com>
	<57C7DA2B-0811-40F1-AACA-9F710955A4D1@dominion.thruhere.net>
	<4E14A132.9090003@mentor.com>
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E14A132.9090003@mentor.com>
Message-Id: <64C8BFD7-461C-4C47-8A1B-C527AA843505@dominion.thruhere.net>
Date: Thu, 7 Jul 2011 07:42:42 +0100
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8J2)
X-Mailer: iPhone Mail (8J2)
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
X-List-Received-Date: Thu, 07 Jul 2011 07:22:32 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=us-ascii



Op 6 jul. 2011 om 18:53 heeft Tom Rini <tom_rini@mentor.com> het volgende ge=
schreven:

> On 07/01/2011 02:41 AM, Koen Kooi wrote:
>>=20
>> Op 1 jul 2011, om 11:26 heeft Frans Meulenbroeks het volgende geschreven:=

>>=20
>>>=20
>>>=20
>>> 2011/7/1 Koen Kooi <koen@dominion.thruhere.net>
>>>=20
>>> Op 1 jul 2011, om 10:55 heeft Frans Meulenbroeks het volgende geschreven=
:
>>>=20
>>>>=20
>>>> Good idea.
>>>> Personally I'd like to also bring footprint into the equation. If a fea=
ture drags in lots of additional packages, it is interesting to make it conf=
igurable.
>>>> My favourite example: bluez dragging in all kind of rendering stuff (th=
rough DEPENDS) even though the hardware functionality might not be there (e.=
g. you have BT but not audio).
>>>=20
>>> Which is a great example, since that doesn't impact footprint at all, it=
's an alsa *plugin* that will get produced.
>>>=20
>>>=20
>>> bluez.inc:DEPENDS =3D "gstreamer gst-plugins-base dbus glib-2.0"
>>>=20
>>> I don't think gstreamer is really needed or desired if you e.g. just wan=
t to do some tethering over bluetooth, or in my case, connect to a BT HID, a=
nd they do contribute to both the build time and the footprint.
>>=20
>> Again, a plugin, so no footprint issues.
>=20
> I disagree.  I care about the footprint of sstate/packaged-staging
> files.  And build time is still a concern without
> sstate/packaged-staging being used/found.

I was talking about target footprint, not build footprint


>=20
> --=20
> Tom Rini
> Mentor Graphics Corporation
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


