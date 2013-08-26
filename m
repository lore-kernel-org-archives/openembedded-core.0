Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8FE376BA1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 21:15:55 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ld10so3913965pab.22
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 14:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EM2Dt3xoEWsFmf0n2fCw9NP4Z4YTsnIf59WRFylJzx4=;
	b=xK7Ii10rjyd8n3oxPeYaKBy0Cb7Gi8jotHfnKnAp9O2GhQQrjU5jHeXzlQCJD3lShm
	ftqt3b2G7ljdmUYxS0Otqw6b1A7M/OoZ6GGFAxf0s7qEVDCkAVuz+u+JVN2KHPOiYi9l
	1JESZ0va9Ml67jWCculFs4MWUJKdB446B+NKfozfbFHSz+ZYYuH6a9kZ2T7V2bxqDisK
	YNfx1prrvQCpvlmr0+NeBBtkJ31c/9W4/MZQOrykjn2irVyvznEDme8Fm8t/OqfaHHTr
	XNBTxAL+SICQ8C+g74AZDOaYU1cL/adFWBFF5aAdNXVzvUXIMqfBWq1o4YKWX8c5DYzf
	fRLQ==
X-Received: by 10.66.242.17 with SMTP id wm17mr16883510pac.102.1377551756366; 
	Mon, 26 Aug 2013 14:15:56 -0700 (PDT)
Received: from edchang-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id bt1sm20069691pbb.2.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 14:15:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADkTA4NFqrBD=y7LqjgRXJyYvd5RiwD0_ab8ZLE1gkTUsCMVhw@mail.gmail.com>
Date: Mon, 26 Aug 2013 14:16:08 -0700
Message-Id: <4A7D66DA-78E2-418A-8E86-8D7504B3193D@gmail.com>
References: <cover.1377405083.git.bruce.ashfield@windriver.com>
	<c2d44f9ff8d416b7f984bc4027de7acecbec0986.1377405083.git.bruce.ashfield@windriver.com>
	<CAMKF1sr+z-f7KW6BqMLbs0RuFu4fhz_crhBVM_++nOqVb=OtnQ@mail.gmail.com>
	<521AA761.4000605@windriver.com> <521ABA1C.9010105@windriver.com>
	<CADkTA4OFMOyAUi5njjFXb1NnTh4ONp4vHT3JZxuL4tiG3OqOiw@mail.gmail.com>
	<CADkTA4Pit1BhOxw5C1gFobrj-m00CpS-n=WNtCkgdRdCDRymhg@mail.gmail.com>
	<8DA5FFBA-9580-444A-AC2F-53C97EF6D105@gmail.com>
	<CADkTA4NFqrBD=y7LqjgRXJyYvd5RiwD0_ab8ZLE1gkTUsCMVhw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] eglibc: ptrace: protect ptrace_peeksiginfo_args from redefintion
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Aug 2013 21:15:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 26, 2013, at 10:59 AM, Bruce Ashfield <bruce.ashfield@gmail.com> =
wrote:

> On Mon, Aug 26, 2013 at 1:28 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>> On Aug 25, 2013, at 7:46 PM, Bruce Ashfield =
<bruce.ashfield@gmail.com> wrote:
>>=20
>>> A final (maybe .. hopefully!?) thought on this. Do drop this change,
>>> but give me a
>>> few minutes to remove the offending structure from =
linux-libc-headers_3.10. That
>>> will also protect all users of yocto, regardless of the kernel =
unless
>>> they provide
>>> their own libc-headers .. and then they are on their own :)
>>>=20
>>> That leaves the c library alone, and should buy us time to fix the
>>> offending apps.
>>=20
>> this is not again the correct place to fix it. since you will back =
this out say later
>> when all apps are fixed anyway. If we need to keep it I would rather =
have the app
>> builds failing and keep it enabled and it should not be the guy who =
is doing the kernel
>> headers upgrade to fix the whole ecosystem either. So add the headers =
by all means
>> and leave the old headers in there until the apps work correctly with =
new headers.
>=20
> Whether or not to allow the apps to break, that's a call for Saul and
> Richard. For
> now, this fix works in all cases, and I'm able to build and boot with =
the 3.10
> kernel and matching headers.
>=20
> Given that we are about to hit the M4 freeze, I'd prefer this in now,
> and the apps
> fixed later. We need to get mileage with the matching headers and =
kernel.
>=20
> I think this is a good compromise for the time being, we've had far
> nastier hacks in
> the libc-headers in the past.

It would make it harder to fix this problem in the app if we work is =
around this way :)
while I see the your urgency of making 3.10 defaults. I don't think we =
should rush it but  thats
just me


>=20
> Bruce
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


