Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe7nK-0007vM-Rq
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 17:44:14 +0200
Received: by wwi18 with SMTP id 18so5141224wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 08:40:21 -0700 (PDT)
Received: by 10.216.82.205 with SMTP id o55mr4488753wee.64.1309880421374;
	Tue, 05 Jul 2011 08:40:21 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.189])
	by mx.google.com with ESMTPS id w8sm3730336wec.24.2011.07.05.08.40.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 08:40:20 -0700 (PDT)
References: <cover.1307895912.git.koen@dominion.thruhere.net>
	<1703bd12b68b86a3d73fe39e9fd9369ac0b027ca.1307895912.git.koen@dominion.thruhere.net>
	<29375D62-544F-457B-8393-79BF9DDA54BA@dominion.thruhere.net>
	<4E0D0211.5040102@linux.intel.com>
	<5A258184-4045-4BAE-AE15-F5ADDBD62B77@dominion.thruhere.net>
	<1309875430.20015.717.camel@rex>
In-Reply-To: <1309875430.20015.717.camel@rex>
Mime-Version: 1.0 (iPhone Mail 8J2)
Message-Id: <5799BF16-8E62-4CDC-A12C-769A0C4DA5AD@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (8J2)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 5 Jul 2011 16:40:14 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemu.inc: append to IMAGE_FSTYPES instead of weakly assigning them
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
X-List-Received-Date: Tue, 05 Jul 2011 15:44:15 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 5 jul. 2011 om 15:17 heeft Richard Purdie <richard.purdie@linuxfoundation=
.org> het volgende geschreven:

> On Fri, 2011-07-01 at 08:50 +0200, Koen Kooi wrote:
>> Op 1 jul 2011, om 01:09 heeft Saul Wold het volgende geschreven:
>>=20
>>> On 06/30/2011 03:33 PM, Koen Kooi wrote:
>>> I believe that this has been discussed elsewhere.
>>=20
>> Let's post the outcome here then, since I still want this patch to go in.=

>>=20
>>>> Op 12 jun 2011, om 18:26 heeft Koen Kooi het volgende geschreven:
>>>>=20
>>>>> The ext3 format is pretty much mandatory for qemu usage, so always cre=
ate it.
>>>>>=20
>>>>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>>>>> ---
>>>>> meta/conf/machine/include/qemu.inc |    2 +-
>>>>> 1 files changed, 1 insertions(+), 1 deletions(-)
>>>>>=20
>>>>> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/in=
clude/qemu.inc
>>>>> index 9ef242f..e908f69 100644
>>>>> --- a/meta/conf/machine/include/qemu.inc
>>>>> +++ b/meta/conf/machine/include/qemu.inc
>>>>> @@ -3,7 +3,7 @@ PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-kdriv=
e"
>>>>>=20
>>>>> MACHINE_FEATURES =3D "kernel26 apm alsa pcmcia bluetooth irda usbgadge=
t screen"
>>>>>=20
>>>>> -IMAGE_FSTYPES ?=3D "tar.bz2 ext3"
>>>>> +IMAGE_FSTYPES +=3D "tar.bz2 ext3"
>>>>>=20
>>>>> ROOT_FLASH_SIZE =3D "280"
>>>>>=20
>=20
> Well, I've mentioned this once in a reply but for the record if we start
> using +=3D in machine files

+=3D is what we do in .dev fwiw

> this makes the values much harder to change
> and for anyone to exclude either tar.bz2 or ext3 from the variable.

how does the current exclusion work?


>=20
> I'm therefore concerned this change makes things less usable.
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


