Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyOOv-0001Cq-6k
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 16:35:21 +0200
Received: by eaad12 with SMTP id d12so889728eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 07:23:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=n64BWYtlMp+29rPiW7RCnY0olM/i5b+bIHC2SAyezOk=;
	b=R+3pASdsUnQNWDPrgcoh+ryytrelqt/P3NpZZ1jSlh79M9mGiK6X3i5suh/uuVSQmP
	yUneWaGlhP5kH8HFgB+u61iqOJwtuTR+3h7zkaB03C1hBiHTJa8NQXTIuegGlvd6PGR+
	6M+Gw4vqs/hxcWZ3YkUbs3zh3pNK4ulsk+0w1S5LVxuq0sX+Kp03+nNdmYS8Pf7A5x+z
	LR1YHbiwg79w6+6m2Vv62xW/sZkuGX8drrGCFHnhFterfO57X/7A2BaKfTMcOWajHJW6
	up1kQGuk3PVvkcGBy/Wei4379YbEJsGuVqEIkkp1wfeF0XmRG5f3RJzFBHnt+nlcR1oM
	Sr9A==
Received: by 10.14.180.68 with SMTP id i44mr7715276eem.20.1344263016707;
	Mon, 06 Aug 2012 07:23:36 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h42sm48102914eem.5.2012.08.06.07.23.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 07:23:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1344261864.9756.164.camel@ted>
Date: Mon, 6 Aug 2012 16:24:18 +0200
Message-Id: <295AD156-B758-4A5A-AF08-4170FBD046EE@dominion.thruhere.net>
References: <cover.1343926021.git.ross.burton@intel.com>
	<94E6EEF2-BA2A-4B68-A9CB-98133061274E@dominion.thruhere.net>
	<8242048D6F2A4934B1D6E6CB30CF8C3A@intel.com>
	<C94E9933-5642-406C-ACBC-2F0A13E6AB41@dominion.thruhere.net>
	<EC2F754A1E854583B06C4E1BF18AB5F9@intel.com>
	<132C9DB1-9203-4938-A080-7496B592D723@dominion.thruhere.net>
	<1344257012.9756.143.camel@ted>
	<1D87F6F5-E962-4348-A240-97BFA89CB913@dominion.thruhere.net>
	<1344261864.9756.164.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQnjKkvvD6JNNSNfovsixXWs0J+N37sUmNyyXJaoYqGiAs+v8AbZPHjE+Nv1GG2WBaE3+VrP
Subject: Re: [PATCH V3 00/11] Mesa upgrade/improvements
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
X-List-Received-Date: Mon, 06 Aug 2012 14:35:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 aug. 2012, om 16:04 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Mon, 2012-08-06 at 15:24 +0200, Koen Kooi wrote:
>> Op 6 aug. 2012, om 14:43 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:
>>=20
>>> On Fri, 2012-08-03 at 17:46 +0200, Koen Kooi wrote:
>>>> Op 3 aug. 2012, om 15:19 heeft Ross Burton <ross.burton@intel.com> =
het
>>>> volgende geschreven:
>>>>=20
>>>>> On Friday, 3 August 2012 at 11:18, Koen Kooi wrote:
>>>>>> libegl and libgles aren't built nowadays, so the problem is
>>>> avoided. Noone has dared to touch this subject the past 2.5 years:
>>>> =
http://cgit.openembedded.org/openembedded/commit/recipes/mesa?id=3D3d96f8c=
b61225d515b5cb4fe863f0d50c3ced436
>>>>>>=20
>>>>>> The best solution[1] is to disable egl/gles in the mesa-recipes =
and
>>>> add a seperate recipe for them. That way you still get glu and =
other
>>>> useful mesa bits needed for gnome/efl/xfce/etc, but you can skip =
the
>>>> sysroot/shlib poisoning if needed.
>>>>> After much digging I see that the Beagle PVR drivers only provide
>>>> gles and egl, which is why you say that the problem was avoided.  =
Of
>>>> course that's just one specific driver, for example the Cedar Trail
>>>> EMGD driver does build libgl, libgles and libegl.
>>>>>=20
>>>>> If the solution is "put the egl/gles bits in another package"
>>>>=20
>>>> Recipe, not package. Big difference :)
>>>>=20
>>>>> then I'm totally confused as to what the actual problem is.
>>>> Considering there's numerous libegl libraries for the many variants =
of
>>>> PVR on ARM, I'm struggling to understand exactly what is new here.
>>>>>=20
>>>>> Can you explain clearly what the problem is, I'm obviously missing
>>>> something.  Once I understand the problem I can help with a =
solution.
>>>>=20
>>>> You need mesa for the !egl and !gles libs and evil vendor blob for =
egl
>>>> and gles libs. In the emgd case you can get gl from the evil vendor =
as
>>>> well. To build e.g. EFL I need mesa for the !egl and !gles bits, to
>>>> build EFL with gles support I need mesa (again !egl, !gles) in
>>>> addition to evil vendor blob for egl and gles.=20
>>>> We could make this work with MACHINE_FEATURES or something similar,
>>>> but that would mean that a very large chunk of userspace now =
becomes
>>>> machine specific. This is how clutter worked in the past and just =
look
>>>> at the fit the canonical/linaro people threw when they started =
doing
>>>> 'embedded' and clutter.
>>>>=20
>>>> To compress the above: you need to build both the mesa and the
>>>> evil-egl-binary *recipes* for things to work, so the egl bits =
should
>>>> be a different recipe, not a subpackage of the mesa recipe. This is
>>>> all assuming we care abou the binary blobs e.g. TI distributes for =
3d
>>>> support. If you don't, fine, merge this patchset.
>>>=20
>>> Let me test this a little bit more. The binary blobs shipped by TI =
would
>>> be machine specific
>>=20
>> They aren't machine specific, they contain multiple blobs to support =
a
>> wide range of SoCs. But even if they were machine specific it =
wouldn't
>> work like you want to.
>>=20
>>> and would be marked as such in the package feeds?
>>> The mesa pieces would be marked as architecture specific and more
>>> generic. In feeds, machine specific has priority so on the machines
>>> where there is hardware support, the hardware optimised versions =
would
>>> get installed?
>>=20
>> You're assuming all libraries are subpackaged into their own package
>> and renamed identically, they aren't (which is actually a feature in
>> the current situation).
>=20
> They don't have to be renamed identically, the would have to have
> RPROVIDES that cover what is needed in some standard namespace.
>=20
>>> If the above isn't the case, can we make it work like that?
>>=20
>> We can't. Even if we could, it would be a giant step backwards for
>> people using the output of the build (see below).
>>=20
>> The only solution that keeps the good things of the current situation
>> is to have the following recipes:
>>=20
>> 1) mesa (does not build libgl or libgles)
>> 2) mesa-gles (only builds libgl+libgles)
>> 3) evil-vendor-blob
>>=20
>> And you can specify per SoC something like
>> PREFERRED_PROVIDER_virtual/egl =3D "mesa-gles" or
>> PREFERRED_PROVIDER_virtual/egl =3D "evil-vendor-blob".
>>=20
>> That will cause problems if you are building for 2 SoCs in the same
>> architecture family that need different gl providers, the shlib code
>> might get a bit upset. I don't have a good solution for that, but we
>> have that problem right now as well.
>>=20
>> =46rom the build side we could make it a bit prettier by making all =
the
>> gl stuff machine specific, but that will be a giant pain in the ass
>> for the end user (distro maintainer,  $silicon_vendor customer,
>> $silicon_vendor SDK).
>>=20
>> If we end up doing it like that, we'll need buy-in from the silicon
>> vendors involved to change the way they distribute their blobs. That
>> is doable, I managed to get the TI blobs changed a few times in the
>> past, but it's a slow process.
>> And everything using GL would suddenly be machine specific, I hope =
the
>> yocto autobuilder can keep up with that.
>=20
> Everything does not have to become machine specific if the things in
> question have known good portable APIs. As I understand it we have GL =
so
> we can swap in the binary blobs in place of the generic ones without
> needing everything to be machine specific.
>=20
>> Executive summary: ARM SoCs with 3d suck, Intel parts with 3d sucks
>> less. It's a mess in oe-core.
>=20
> Ok, we need to do something about this mess, period. Its not going to
> get any better and we need to sort it out. I can't "force" changes in
> but on the other hand I'm not going to tie the hands of everyone just
> because the ARM world in particular is a total mess in this area.

I completely agree with that!

> As such, I'm likely going to allow architecture overrides in core mesa
> so for example, IA can enable gles and egl for everyone and cleanup
> their binary blobs to override them on platforms where it makes sense. =
I
> suspect someone will start sending patches to enable a generic arm =
core
> and I am going to have a *really* hard time refusing the patches due =
to
> any one silicon provider's binary blob issues.

Every GPU on arm has evil blobs, Mali, Adreno, SGX, etc. The RE efforts =
for Mali and Adreno are making good progress, though.

> IMO, the evil-vendor-blob recipes need to start generating packages
> which are machine or platform specific and those platforms need to
> correctly list those feeds as being compatible, providing a set of
> standard things which allow replacement of the core generic =
architecture
> providers.

There's no such thing as platform specific packages, yet.=20

> How does that sound?

Sounds pretty good.

regards,

Koen=


