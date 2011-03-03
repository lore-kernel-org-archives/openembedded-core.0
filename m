Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Pv93N-0000zl-Uh
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 14:59:02 +0100
Received: by wyb38 with SMTP id 38so1038036wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 05:57:22 -0800 (PST)
Received: by 10.227.61.141 with SMTP id t13mr922714wbh.219.1299160642217;
	Thu, 03 Mar 2011 05:57:22 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id y29sm901449wbd.10.2011.03.03.05.57.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Mar 2011 05:57:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1299157757.2550.5.camel@scimitar>
Date: Thu, 3 Mar 2011 14:57:20 +0100
Message-Id: <E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 13:59:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mrt 2011, om 14:09 heeft Joshua Lock het volgende geschreven:

> On Thu, 2011-03-03 at 13:46 +0100, Koen Kooi wrote:
>> Op 2 mrt 2011, om 18:30 heeft Mark Hatle het volgende geschreven:
>>=20
>>> I finally got a chance to look at the oe-core and where it currently =
is..  Some
>>> suggestions below:
>>>=20
>>> LICENSE file, this may need to be cleaned up to only cover the =
components
>>> actually in the oe-core.
>>>=20
>>> README likely needs some revision
>>>=20
>>> README.hardware needs a lot of revision.  Anything outside of =
support for QEMU
>>> should be removed.
>>=20
>> Agreed on the above
>>=20
>>> The meta-demoapps
>>=20
>> That has a lot of GNOME bits I need, so I would suggest meta-oe, a =
seperate gnome layer or the easiest way, keep it as a seperate layer, =
but outside of yocto. I think a GNOME (2) layer would make a lot of =
sense, but I don't know how many people will be looking after it.
>> With my beagleboard.org hat on, a full GNOME desktop is one of our =
deliverables to go on the SD card included with the board at the =
factory, so sorting out the duplication between the layers for GNOME =
components would be nice.
>=20
> I'd be inclined to suggest the separate GNOME layer, though see below
> for some further thoughts.
>=20
>>=20
>>> and meta-rt components, will those be staying or going?
>>=20
>> I don't have a real opinion on that.
>>=20
>>> The meta/recipes.txt needs to be verified as still what we want -- I =
assume it
>>> is at this point..
>>=20
>> It looks OK to me
>>=20
>>> meta/recipes-...  sato, qt, gnome, I thought were going elsewhere?
>>=20
>> See above for GNOME layer, QT is likely a similar case. Layers would =
also benefit from having their own git repository, but I can see the =
combinatorial explosion that could bring.
>=20
> I agree with this in principle, but before we dive into this we need =
to
> decide where we draw the line. GNOME and Qt are not comparable. GNOME
> and KDE are, Gtk+ and Qt are.

You completely right on that!

> Where should Gtk+ and Qt live? E.g: if Gtk+ lives in meta-gnome does
> that mean someone creating a meta-xfce needs to either a) provide =
their
> own (copy of the) Gtk+ recipe OR b) depend on the meta-gnome's =
presence.
>=20
> I'll accept "We'll cross that bridge when we come to it" as an answer
> but I at least feel it's worth pointing this out.

I thought about that as well, but gtk+ is in core, as is glib-2.0 which =
both gtk+ and QT use. There shouldn't be any other overlay between xfce =
and gnome. If 2 layers really don't get along we can consider the =
following:

1) put the overlap in oe-core
2) put the overlap in meta-oe
3) put the overlap in yet another layer
4) duplicate

All these show that we need more and better tools to deal with layers. =
At the minimum bitbake should print out warnings about layer issues like =
bbappend a recipe that doesn't exist.

regards,

Koen=


