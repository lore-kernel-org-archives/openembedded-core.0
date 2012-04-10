Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SHc71-0005AA-Ma
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 16:32:03 +0200
Received: by wera1 with SMTP id a1so3246382wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 07:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=FU9nhG4i9M3t+67dn3ueQ2YpQ6ADGZQ4O6XzOWwVggU=;
	b=LVM+0MdenJS18VIGCM6plCFUqd/Zx1SrODgAufiIUhLjc5YmaNZECs6cl9DheWqzmL
	aFTkX6ePoKUYw5t+5KZmFt2c9L7GvnApHS0IdmcPdck7mU50hPdcmUHIH7X/5P8VSkIx
	4gX/nFUriJTQI91H3tk6swIHuZ1z6nvgeB1Dm8Hm3J52UBqNdwvxqhDFRU+3qJPldcVp
	oZVRu3sIBfGvgpFvepUDEVg4E/AXD8J6F/mqVSPYefs068FjpWy2WrFbcrQUkgRRjVvU
	zmvpYW3dnG7PEsD37cST23Ct0KXEC8P37OVPv0GEYA4XeyfT8axOtTTcYExgFYRXKSqa
	7D3A==
Received: by 10.216.137.74 with SMTP id x52mr6604998wei.77.1334067766028;
	Tue, 10 Apr 2012 07:22:46 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ev10sm17661749wid.10.2012.04.10.07.22.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 07:22:45 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F84415A.20104@herbrechtsmeier.net>
Date: Tue, 10 Apr 2012 16:22:43 +0200
Message-Id: <52751372-18B8-47AC-955C-BD3EB17FDD8D@dominion.thruhere.net>
References: <1333626507-32182-1-git-send-email-stefan@herbrechtsmeier.net>
	<4F7E607E.9050101@linux.intel.com>
	<1967D97F-63A7-49DA-930F-A0C6F1F4112F@dominion.thruhere.net>
	<1334065279.10826.14.camel@ted>
	<519A24BF-BBF0-4C58-8418-27F742D03D7F@dominion.thruhere.net>
	<4F84415A.20104@herbrechtsmeier.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnEXeIzktk9BQXxdAs+fGqx+1ZcIGynmj9ZD7WOmT7OllfOmFzjKC7paq6h7Y5jJkwhfx8x
Subject: Re: [PATCH] u-boot: add machine name to spl image name
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
X-List-Received-Date: Tue, 10 Apr 2012 14:32:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 16:19 heeft Stefan Herbrechtsmeier het volgende =
geschreven:

> Am 10.04.2012 15:56, schrieb Koen Kooi:
>> Op 10 apr. 2012, om 15:41 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Fri, 2012-04-06 at 06:29 -0700, Koen Kooi wrote:
>>>> Op 5 apr. 2012 om 20:18 heeft Saul Wold<sgw@linux.intel.com>  het =
volgende geschreven:
>>>>=20
>>>>> On 04/05/2012 04:48 AM, Stefan Herbrechtsmeier wrote:
>>>>>> Signed-off-by: Stefan Herbrechtsmeier<stefan@herbrechtsmeier.net>
>>>>>> ---
>>>>>> meta/recipes-bsp/u-boot/u-boot.inc        |    2 +-
>>>>>> meta/recipes-bsp/u-boot/u-boot_2011.03.bb |    2 +-
>>>>>> meta/recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
>>>>>> 3 files changed, 3 insertions(+), 3 deletions(-)
>>>>>>=20
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc =
b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> index 700d5d3..0445c34 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
>>>>>> @@ -32,7 +32,7 @@ UBOOT_MAKE_TARGET ?=3D "all"
>>>>>> # deploy directory.  For those versions they can set the =
following variables
>>>>>> # to allow packaging the SPL.
>>>>>> SPL_BINARY ?=3D ""
>>>>>> -SPL_IMAGE ?=3D "${SPL_BINARY}-${PV}-${PR}"
>>>>>> +SPL_IMAGE ?=3D "${SPL_BINARY}-${MACHINE}-${PV}-${PR}"
>>>>>> SPL_SYMLINK ?=3D "${SPL_BINARY}-${MACHINE}"
>>>>>>=20
>>>>>> do_compile () {
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> index 1ebdbea..e99bc2c 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.03.bb
>>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>>> SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
>>>>>>=20
>>>>>> PV =3D "v2011.03+git${SRCPV}"
>>>>>> -PR =3D "r5"
>>>>>> +PR =3D "r6"
>>>>>>=20
>>>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>>>=20
>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb =
b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> index 8ebdbff..680401f 100644
>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot_2011.06.bb
>>>>>> @@ -17,7 +17,7 @@ FILESDIR =3D =
"${@os.path.dirname(d.getVar('FILE',1))}/u-boot-git/${MACHINE}"
>>>>>> SRCREV =3D "b1af6f532e0d348b153d5c148369229d24af361a"
>>>>>>=20
>>>>>> PV =3D "v2011.06+git${SRCPV}"
>>>>>> -PR =3D "r0"
>>>>>> +PR =3D "r1"
>>>>>>=20
>>>>>> SRC_URI =3D =
"git://git.denx.de/u-boot.git;branch=3Dmaster;protocol=3Dgit"
>>>>>>=20
>>>>> Merged into OE-Core
>>>> wait a minute, why was this merged?
>>> In retrospect it shouldn't.
>> Can we back it out? It breaks a ton of buildscripts. SPL_SYMLINK =
already has the machine.
> But this means that your SPL_SYMLINK can point to a wrong SPL_IMAGE if =
you don't use machine in the tmpdir path and build more than one =
machine.

I guess I'll have a suggestion for the 1.3 release:

[koen@Angstrom-F16-vm-rpm meta-angstrom]$ git grep DEPLOY_DIR_IMAGE
conf/distro/include/angstrom.inc:DEPLOY_DIR_IMAGE =3D =
"${DEPLOY_DIR}/images/${MACHINE}"






