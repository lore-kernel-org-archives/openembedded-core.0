Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1T7rif-0000Qd-GU
	for openembedded-core@lists.openembedded.org;
	Sat, 01 Sep 2012 19:42:53 +0200
Received: by wibhq4 with SMTP id hq4so2318340wib.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Sep 2012 10:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to;
	bh=wn5ziXxbB7Hi5iUIA8LGtankFlyaUxRRkmwrsc6CtPM=;
	b=u2eo9TYaUDEttHv82JZ4h8IfBl444OLfwdXRj3ZEuqz7I3OqbVnbM5LXfKRNEfeDYv
	aFIyHpzXV8UgmHqkKzloeHbC4BHKYBDrZJ4sb//HhmNC3FWcPdE7u3wZ6mCm+FJGvWBg
	8gE+xItoUc/LF9WbNXTYotUzlHCIRFAl/YtynlS0R4vjoVkOIfCXRlWjedDqJPVKAQ2W
	3oOZ4RL84Z4ztQD2uQiuDysg6BmiHAlBMtRoArRabBcoBiemE/jdzEYN+AOejJ4uzejx
	awFjHTeDHy9gt819nFgGQgRteze9MUWcisdRdOOzVc8wKpN/OB9+wUYut9hB3KAwLK2V
	gVHQ==
Received: by 10.216.214.208 with SMTP id c58mr6754419wep.148.1346520635415;
	Sat, 01 Sep 2012 10:30:35 -0700 (PDT)
Received: from [109.117.44.77] ([109.117.44.77])
	by mx.google.com with ESMTPS id bc2sm11997510wib.0.2012.09.01.10.30.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 10:30:30 -0700 (PDT)
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<FF931F2C-6ABE-4F72-8FEE-90CFCE69121C@dominion.thruhere.net>
	<CAJTo0LZa4odP83UOT=1U+nan-wcOEKuRMXW3iHRv9wzD8pspDA@mail.gmail.com>
	<4976204.OdG2Ohk3KU@helios>
	<CAJTo0LbGH3HV1yQOMyoYDVR_z=34qy3riZnASGYdFtkK_XkOmw@mail.gmail.com>
	<1346267538.4396.38.camel@x121e.pbcl.net>
	<CAJTo0La-tMW+LVLqRGBTSE36x0BYXBJkiwh2B5_8_-SjaAzR5Q@mail.gmail.com>
	<CAMKF1srQO53m2zv91LLs8WFjEt=UKNA=w4OqxdVfJpyWPHG8jg@mail.gmail.com>
	<CAJTo0LZGcZHwM5cZgjFrQ9tuhw6RLN_g732wBitVgHKo8UigNQ@mail.gmail.com>
	<1346278937.4396.57.camel@x121e.pbcl.net>
	<1346423384.2673.102.camel@phil-desktop>
	<1346428885.16485.29.camel@ted>
	<CAMKF1soyonS_-QFV3XKaz1=i_Krguy4i2Nnt1Ep8O9mkTR-3Jg@mail.gmail.com>
	<CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
In-Reply-To: <CAMKF1sqqWJEwsvng_BHbqACJWhUBDRfW4Nixd2t2O1eADmCE5w@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <43FF08E0-8A1F-4B64-9552-D5C68A207D0C@gmail.com>
X-Mailer: iPhone Mail (9B206)
From: Andrea Adami <andrea.adami@gmail.com>
Date: Sat, 1 Sep 2012 19:30:11 +0200
To: Khem Raj <raj.khem@gmail.com>
Cc: Phil Blundell <philb@gnu.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Sep 2012 17:42:53 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Fri, Aug 31, 2012 at 9:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Aug 31, 2012 at 9:01 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> I don't think dropping support for / and ${prefix} makes sense as long
>>> as it doesn't excessively hurt us
>>=20
>> we already have, done special things to support it look how many
>> libraries appear in /lib now a days despite their original build
>> system wanting it in /usr and I still get atleast 50 warnings on it
>> wanting more in /lib and I am sure someone will send patches
>> for it because they hate the warning and then we will have this
>> growing pile of patches
>> to maintain. So IMO it has already started to hurt us.
>=20
> just to quantify it. I have 11 warnings reported about it.
>=20
> WARNING: QA Issue: .... installed in the base_prefix, requires a
> shared library under exec_prefix (/usr)
>=20
> this is very custom image but very much similar to core-image-minimal
> now if I fix this 11 warnings. For the sake of it I fixed these 11 warning=
s
> by hacking patches for packages or recipes to move these files into
> base_prefix and it now gives me 16 more warnings about same but
> different files it wants to bring along into base_prefix
>=20
> its quite slimy :/

As Khem says, leading distros are even going one step further:

http:\\fedoraproject.org/wiki/Features/UsrMove

Seems it's time to consider alternative rootfs layouts, like this F17 unifie=
d filesystem.

Andrea

> __________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


