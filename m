Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SRKva-0004ST-Nn
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 12:12:26 +0200
Received: by werb13 with SMTP id b13so634854wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 03:02:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PzO9gSE3U3qo4zWBbxmH2DNmyeU77fnt/UQDXfChGAg=;
	b=XrDgCW7wu0V5TFCslELPQTCjCr+jyvRh3nv44nMc78YQfifIkSZSa/nhyHwyV0p18f
	3bjg45jRIygMEqqP6QVwtiN7H3/TkiC4u0/TW9y8odDofKExJVxr4nzbW/YYEdM5iEpI
	i/GUfx6fSaI7SzG8falc0g0GkbMDoYyvSgZ7j83Y0r26+HR7Ki9atwRj4Xuqlj0dugeD
	UZx9hPan1BGmTpYrhEOCQ39Ztq2EyCOwOLNm60dGSft/hkFNUJWto1sa4VnzA+NV5dVO
	TZ17aJrtHzIY3MLh4/Y1De1MwScbKvWmTuqovgOk6EDT/WChctcUbxl+lA6j2mtSieFC
	hPSA==
Received: by 10.216.143.200 with SMTP id l50mr7528021wej.58.1336384956587;
	Mon, 07 May 2012 03:02:36 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm32537657wib.2.2012.05.07.03.02.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 03:02:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1336383872.23777.69.camel@ted>
Date: Mon, 7 May 2012 12:02:32 +0200
Message-Id: <C6370765-E629-4AC5-8C19-76E9554EFCBA@dominion.thruhere.net>
References: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
	<1336295833.23777.60.camel@ted>
	<7CF44BA9-7303-42A9-90AD-B9FAE7ADE00B@dominion.thruhere.net>
	<1336383872.23777.69.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk7bno9dmGJbu9fD5eVlRQgCvcTW9rlestOLmaZBR4d0WaD4r1PLlONr7YRfhFZruADZUDt
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
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
X-List-Received-Date: Mon, 07 May 2012 10:12:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 mei 2012, om 11:44 heeft Richard Purdie het volgende geschreven:

> On Sun, 2012-05-06 at 14:32 +0200, Koen Kooi wrote:
>> Op 6 mei 2012, om 11:17 heeft Richard Purdie het volgende geschreven:
>>=20
>>> On Fri, 2012-05-04 at 09:54 +0200, Koen Kooi wrote:
>>>> This plugin manages the firmware loading for the TI wl12xx series =
of bluetooth/wifi/fm chips.
>>>>=20
>>>> The double --enable-tist when both bluetooth and wireless are =
enabled is ugly, but harmless
>>>>=20
>>>> The background on the plugin: =
https://bugs.meego.com/show_bug.cgi?id=3D8418
>>>>=20
>>>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>>>> ---
>>>>=20
>>>> If accepted into master I'd like to have this in the 'denzil' =
branch as well.
>>>>=20
>>>> meta/recipes-connectivity/connman/connman.inc     |    4 ++--
>>>> meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
>>>> 2 files changed, 3 insertions(+), 3 deletions(-)
>>>>=20
>>>> diff --git a/meta/recipes-connectivity/connman/connman.inc =
b/meta/recipes-connectivity/connman/connman.inc
>>>> index bfe6620..8b27cfb 100644
>>>> --- a/meta/recipes-connectivity/connman/connman.inc
>>>> +++ b/meta/recipes-connectivity/connman/connman.inc
>>>> @@ -28,8 +28,8 @@ EXTRA_OECONF +=3D "\
>>>>    --enable-threads \
>>>>    --enable-loopback \
>>>>    --enable-ethernet \
>>>> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', =
'--disable-wifi', d)} \
>>>> -    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
>>>> +    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi =
--enable-tist', '--disable-wifi', d)} \
>>>> +    ${@base_contains('DISTRO_FEATURES', =
'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', =
d)} \
>>>>    --enable-dnsproxy \
>>>>    --enable-ofono \
>>>>    --enable-tools \
>>>> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb =
b/meta/recipes-connectivity/connman/connman_0.79.bb
>>>> index 4c57dab..d7f22b9 100644
>>>> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
>>>> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
>>>> @@ -11,4 +11,4 @@ SRC_URI  =3D =
"git://git.kernel.org/pub/scm/network/connman/connman.git \
>>>>            file://test-set-ipv6-method-api-fix.patch \
>>>>            file://connman"
>>>> S =3D "${WORKDIR}/git"
>>>> -PR =3D "r3"
>>>> +PR =3D "r4"
>>>=20
>>> This appears to have broken the build on qemuppc:
>>>=20
>>> =
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/369/s=
teps/shell_19/logs/stdio
>>=20
>> That is really weird, since that's defined in ioctl.h in asm-generic/
>> by the kernel. Does qemuppc have some options for serial ports
>> disabled in the kernel headers? Since the wl12xx is a regular wifi
>> chip it should work on ppc, like it does on arm and x86.
>=20
> Its defined in ioctls.h which is a key difference.
>=20
> ioctls.h is a set of default ioctl options which most architectures =
use
> but architectures have their own custom definitions. PowerPC is one =
such
> architecture, using "t" instead of "T" for tty operations.
>=20
> It seems the powerpc version never needed a version2 so in theory
>=20
> #ifndef TCGETS2
> #define TCGETS2 TCGETS
> #define termios2 termios
> #endif
>=20
> would work but google suggests some potential issues which I don't
> really want to dig into/understand.
>=20
> I'm tempted to disable this plugin on powerpc

That's fine by me.

> unless anyone wants to
> step up with a patch? Using the libc API for this would probably be =
more
> portable.

I can look into that after the next angstrom point release, which is ~2 =
weeks away.

regards,

koen=


