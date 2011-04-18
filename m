Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QBm2v-0003aC-PJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 12:51:09 +0200
Received: by wye20 with SMTP id 20so4198133wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:48:49 -0700 (PDT)
Received: by 10.227.202.208 with SMTP id ff16mr4836049wbb.206.1303123729599;
	Mon, 18 Apr 2011 03:48:49 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	y29sm3177132wbd.21.2011.04.18.03.48.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:48:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1303120390.5518.88.camel@rex>
Date: Mon, 18 Apr 2011 12:48:48 +0200
Message-Id: <22E1FECB-BC83-4638-9555-6C5571C3C176@dominion.thruhere.net>
References: <cover.1302886579.git.paul.eggleton@linux.intel.com>
	<72ccbf03bcbec48a34d830c356e591a9139e3794.1302886579.git.paul.eggleton@linux.intel.com>
	<4DA88DE3.2050702@linux.intel.com>
	<201104181017.59589.paul.eggleton@linux.intel.com>
	<E3CCB8FD-559F-4700-B922-FC7C86033E40@dominion.thruhere.net>
	<1303120390.5518.88.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [poky] [PATCH 2/3] netbase: automatically bring up usb0 on beagleboard
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
X-List-Received-Date: Mon, 18 Apr 2011 10:51:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 apr 2011, om 11:53 heeft Richard Purdie het volgende geschreven:

> On Mon, 2011-04-18 at 11:30 +0200, Koen Kooi wrote:
>> Op 18 apr 2011, om 11:17 heeft Paul Eggleton het volgende geschreven:
>>=20
>>> On Friday 15 April 2011 19:26:43 Saul Wold wrote:
>>>> There was some initial discussion at ELC this last week about what =
goes
>>>> where and how layers are going to work moving forward.  I know that =
we
>>>> are committed to the qemu* machines in oe-core (meta), and that
>>>> currently meta-yocto contains a set of core HW (beagleboard among =
them),
>>>> so the question then is should the HW specific stuff, such as this =
patch
>>>> move to meta-yocto or some other layer?  There are a couple other
>>>> recipes such as x-load and formfactor that contain HW specific =
files.
>>>=20
>>> Ah, yes, you're right - we definitely don't want this file in =
oe-core. I should=20
>>> have pushed this particular patch to meta-yocto=20
>>=20
>> You mean meta-texasinstruments, right? Or do you yocto folks keep
>> going to deny that there's an upstream layer for beagleboard support?
>=20
> To quote my email from earlier today:
>=20
> """
>> It should live in the upstream beagleboard BSP layer, which currently
>> is meta-texasinstruments
>=20
> That is the goal, yes. It was agreed that until we sort out the layer
> tooling, there would be some code in meta-yocto which would be a copy =
of
> various upstream parts which includes beagleboard. Over time I'm =
hoping
> to see these pieces converge, then we when get the tooling right it =
will
> become automated.
> """
>=20
> which I'd hardly call denial. There is a plan indicated above which we
> agreed to and we intend to follow unless there is a problem?


This=20

>>>  I should=20
>>> have pushed this particular patch to meta-yocto=20

bit from Pauls email indicates a problem. Since that is not pushing to =
upstream first (implied by the use of 'copy'), but keeping fixes only in =
the yocto layer.=


