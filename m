Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QWnX8-0001Ni-BH
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 12:41:14 +0200
Received: by wwb17 with SMTP id 17so254025wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 03:37:48 -0700 (PDT)
Received: by 10.227.205.14 with SMTP id fo14mr398456wbb.79.1308134268160;
	Wed, 15 Jun 2011 03:37:48 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ej7sm238607wbb.36.2011.06.15.03.37.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Jun 2011 03:37:47 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308133322.15712.395.camel@rex>
Date: Wed, 15 Jun 2011 12:37:45 +0200
Message-Id: <0566033F-1AB8-4E16-A064-A3EB3A5CA143@dominion.thruhere.net>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
	<CFF0ECE5-F738-4233-8214-9E57A6616C5B@dominion.thruhere.net>
	<1308132426.15712.387.camel@rex>
	<9B8FDB01-CFAA-497E-BD0E-93D421E6C4F8@dominion.thruhere.net>
	<1308133322.15712.395.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Wed, 15 Jun 2011 10:41:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 jun 2011, om 12:22 heeft Richard Purdie het volgende geschreven:

> On Wed, 2011-06-15 at 12:15 +0200, Koen Kooi wrote:
>> Op 15 jun 2011, om 12:07 heeft Richard Purdie het volgende =
geschreven:
>>> Well, I was trying to provide some hints as to how we might be able =
to
>>> improve this situation, not write the whole roadmap. =46rom what I
>>> remember and the quick discussion we had offlist there are two =
things
>>> FEED_ARCH tries to do:
>>>=20
>>> a) Provide an addition to overrides that represents the
>>> optimisation/tune profile being used (like armv7a).
>>>=20
>>> b) Provide some info in BASE_PACKAGE_ARCH so that when PACKAGE_ARCH =
is
>>> overwritten, you can still find out what it would have been set to.
>>>=20
>>> For a), we could update the common include files for the omap/armv7a
>>> platforms and append to MACHINEOVERRIDES there with the appropriate
>>> entries
>>=20
>> It's not omap specific, you really need have access to the arch in
>> overrides for *all* platforms. I'm using armv7a is an example since
>> angstrom does TARGET_FPU_armv7a =3D "hard", but it also does that for
>> various powerpc architectures.
>=20
> I'm also using omap as an example. I'd imagine the powerpc bits would
> also work from a common small set of tune include files though? I
> suspect the Intel guys would love some way to say "x86" instead of
> "i386|i486|i586|i686" etc. so this is a general problem.
>>=20
>> And any change like this would need to get propagated to all the
>> machine layers out there as well, unlike .dev where everything was in
>> one place.
>=20
> I know, but we have two choices:
>=20
> a) Continue this spiral of confusing variable names, conflict and =
wacky=20
>   bugs
>=20
> b) Come up with a plan to address it and roll it out
>=20
> I'm favouring b), particularly since this would help several different
> architectures with a variety of issues. If we need to better document
> that and have a process fine, but that is not a good argument for not
> doing it at all.

I agree on that, put previous efforts in the yocto universe were rushed =
through (like the machine-name -> machine_name change I keep going on =
about), so I have a knee jerk reaction to such things nowadays. For =
various reasons yocto and later oe-core have not been friendly to =
distros having package feeds out there. Sometimes the changes made =
things better, but they were still painfull. It seems to be getting =
better nowadays, which is good, but everyone still needs to be carefull. =
Pet peeve: missing PR bumps.

What I need for angstrom is a variable that:For=20

1) *never* changes its value
2) holds the base arch (armv7a, ppc603e, etc)
3) Is set in *all* the tune include files
4) must be set to complete parsing when MACHINE is set

I don't care if it's in overrides by default or not since that's easy =
enough to do in distro configs.

regards,

Koen=


