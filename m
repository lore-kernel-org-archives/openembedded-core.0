Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SbYb0-0000go-Vk
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 16:49:27 +0200
Received: by eaal1 with SMTP id l1so1195903eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 07:39:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=UL4xc1qbUKRxazv/Zuog3sqOLtHy1EK0rBnruO5RVOo=;
	b=F0OnuNEDKfd0nCFBEyIsmbAMONlZMQU4pbn3c648Z54aZ+9hMaCJzThOm3QtsDthp+
	XbtyuJ3eAPGEGTrPm1BYxOiEkRFjNawOKvYggL3EIIQKE0VW5pvwUPO59b0P/ds1veZf
	AtYKyHEQrL/DSTb5+ZnAWhp2n34jmy1z5odbqfpSk6Qr9eyNjZg0HOBn4q6T3r70AYSV
	LdQigg1xIlqWgY1RgS/Z1mrVizW58OBSY41Qrx1YTOcYhr/QuVrdrV/NYSMKN1FfDNF0
	8hxddzoHEE/o82WzHNfZ2Io0Gnqa7QV5avBEtBsglcL3SpIJOBQ3k8N+2rOkUvHgM4Gg
	RZ5g==
Received: by 10.14.188.130 with SMTP id a2mr5352840een.86.1338820741979;
	Mon, 04 Jun 2012 07:39:01 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id s8sm37963291ees.16.2012.06.04.07.39.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Jun 2012 07:39:00 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120604103941.GY3138@jama.jama.net>
Date: Mon, 4 Jun 2012 16:38:57 +0200
Message-Id: <6F922F85-DB66-4218-8C58-910B738EFF8A@dominion.thruhere.net>
References: <cover.1338434706.git.liezhi.yang@windriver.com>
	<87ca0cf2285b018489bde046b0aa7e17a767c70a.1338434706.git.liezhi.yang@windriver.com>
	<D16CA58F-8D7A-4910-ACCA-84E01CEE6510@dominion.thruhere.net>
	<1338538650.20169.261.camel@ted>
	<D2B2A161-3B9C-49F3-B124-DE6CC9B1FFE0@dominion.thruhere.net>
	<1338544960.20169.267.camel@ted>
	<F47EBC71-EC1C-4E13-ABCD-82E8E364E187@dominion.thruhere.net>
	<4FCC806E.5070606@windriver.com>
	<20120604103941.GY3138@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlBoQDHPoABY+OMsbqS5pFVKFC2UnvJzPe36pkCSssa292YkGIhzu5CO/4Q+jsRQO7+sNk2
Subject: Re: [PATCH 1/1] opkg 0.1.8: respect to the arch when choose the alternatives
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
X-List-Received-Date: Mon, 04 Jun 2012 14:49:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 jun. 2012, om 12:39 heeft Martin Jansa het volgende geschreven:

> On Mon, Jun 04, 2012 at 05:31:26PM +0800, Robert Yang wrote:
>>=20
>>=20
>> On 06/01/2012 06:35 PM, Koen Kooi wrote:
>>>=20
>>> Op 1 jun. 2012, om 12:02 heeft Richard Purdie het volgende =
geschreven:
>>>=20
>>>> On Fri, 2012-06-01 at 11:04 +0200, Koen Kooi wrote:
>>>>> Op 1 jun. 2012, om 10:17 heeft Richard Purdie het volgende =
geschreven:
>>>>>=20
>>>>>> On Thu, 2012-05-31 at 17:01 +0200, Koen Kooi wrote:
>>>>>>> Op 31 mei 2012, om 16:13 heeft Robert Yang het volgende =
geschreven:
>>>>>>>=20
>>>>>>>> There is a bug if we:
>>>>>>>> 1) bitbake core-image-sato-sdk MACHINE=3Dqemux86
>>>>>>>> 2) bitbake core-image-sato with MACHINE=3Dcrownbay
>>>>>>>>=20
>>>>>>>> Then several pkgs in deploy/ipk/i586 would be installed to =
crownbay's
>>>>>>>> image even if there is one in deploy/ipk/core2 and we have set =
the
>>>>>>>> core2's priority higher than i586, when the version in =
deploy/ipk/i586 is
>>>>>>>> higher. This doesn't work for us, for example, what the =
crownbay need is
>>>>>>>> xserver-xorg-1.9.3, but it installs xserver-xorg-1.11.2.
>>>>>>>=20
>>>>>>> And this is working exactly as intended. Don't break opkg =
because your
>>>>>>> hardware driver situation sucks.
>>>>>>>=20
>>>>>>> So: NAK on this patch.
>>>>>>=20
>>>>>> I think we do have a problem here. For example, the system is =
ignoring a
>>>>>> PREFERRED_VERSION directive here
>>>>>=20
>>>>> A PREFERRED_VERSION set in a machine.conf, which is the wrong =
place.
>>>>=20
>>>> Its strongly not recommended. You can do it and if things are setup
>>>> correctly, we do support machine specific alterations however...
>>>>=20
>>>>> Let's change the above build sequence to this:
>>>>>=20
>>>>> 1) MACHINE=3Dqemux86 bitbake xserver-xorg
>>>>> 2) MACHINE=3Dothercore2machine bitbake xserver-xorg
>>>>> 3) MACHINE=3Dcrownbay bitbake xserver-xorg
>>>>>=20
>>>>> Oh look, I get 1.11.2 on crownbay regardless of this patch.
>>>>=20
>>>> I've been assuming this xserver is marked as machine specific. If =
its
>>>> not, that is a bug and we can fix that.
>>>=20
>>> the X server not machine specific and that is NOT a bug. The recipe =
for the DDX only works with a specific X version. The real problem here =
is that xf86-video-something (again, not machine specific, think pci =
cards) has a strict requirement on the x server version. This is now =
purely a DISTRO problem. A few possible solutions are:
>>>=20
>>> 1) Lock X to 1.9.3 for all compatible x86 archs in your DISTRO
>>> 2) Lock X to 1.11.2 for all compatible x86 archs in your DISTRO, =
live with the crownbay breakage
>>> 3) Only use a package manager with no notion of compatible archs =
(dpkg) or with strong version pinning (rpm)
>>> 4) Be really careful with the build sequence and structure your feed =
configs to not have compatible archs in their feed URIs
>>> 5) remove 'x11' from DISTRO_FEATURES
>>>=20
>>> This is a point where you cannot make everybody happy. But as you =
say below, let's decouple the above problem from the arch vs version =
discussion.
>>>=20
>>>>>> by building one thing and then
>>>>>> installing another. We're also inconsistent between the dpkg/rpm =
and
>>>>>> opkg backends. There is therefore definitely some kind of user
>>>>>> experience issue at stake here since this behaviour is not =
obvious,
>>>>>> expected or particularly correct.
>>>>>>=20
>>>>>> The fact the example is hardware related is not particularly =
relevant,
>>>>>> its the bigger picture I worry about
>>>>>=20
>>>>> I also worry about the bigger picture, especially about what =
Martin
>>>>> said about this breaking feeds.
>>>>=20
>>>> As far as I understood Martin's comments, this actually helps avoid =
some
>>>> of the issues he's been experiencing with feeds?
>>>=20
>>> No, it allows you to add a package-of-death. Example:
>>>=20
>>> broken-app_1.0_machine.ipk is in the feeds, being machine specific
>>> broken-apps author fixes the machine specific bits properly
>>> broken-app_2.0_i586.ipk hits the feeds and is not picked up.
>>=20
>> I think that the broken-app_2.0_i586.ipk came unexpectedly,
>> there was a broken-app_1.0_machine.ipk (maybe also =
broken-app_1.0_i586.ipk,
>> but it didn't matter), if it has been fixed to version 2.0, then =
there should
>> be also a broken-app_2.0_machine.ipk (and it would be picked up).
>=20
> If broken-app developers are now detecting machine capabilities (or
> whatever) since 2.0 in runtime, then we don't need to build broken-app
> for every single machine we support, so changing PACKAGE_ARCH from
> MACHINE_ARCH to TUNE_PKGARCH is right thing to do to save compile time
> and feed disk space.

Exactly

> Same use-case broken by this patch reported here:
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-May/023154.htm=
l

I borrowed heavily from your post since both Richard and Robert don't =
seem to see the damage this will do to feeds when a package/recipe =
changes archs.

regards,

Koen=


