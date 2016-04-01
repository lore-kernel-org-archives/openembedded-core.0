Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 45BAE6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 22:13:43 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id n5so99796804pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=QZO5GeGfEZI8j2jnnYdm7zl56sUUkMh2v/4Xit8HvfM=;
	b=zVFFVwys4WL0Tr3EDufDbosWlyQVk39yeUc1/WeBaFofPVslFwzDMEpD1U7hgWrt+B
	kHDl76jflvsns4I4PhiBALu8WEJM2BgNK+7lUuOjrJ5pggRP8hPEAAVLA70JzLM+6Y5f
	fcniBkQ8us6DfEU8ab9TqOwhavQ79s9vAkbgE1r5VpWPlKNsOWEEpOujNRGJhLN5Qp6L
	5itwDRSY/kSfsE7KxOxzohBWHJHfpVAxzrAjtboQG0A9wgRqlqWJmS4DRiIsROz1ro89
	aDjyjUSrq5hA0CbtksdHRRRMiYyMbZiFJGzJCvqHy7xGmNENgFfOMawgNZdjq/g/zlLp
	CiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QZO5GeGfEZI8j2jnnYdm7zl56sUUkMh2v/4Xit8HvfM=;
	b=Mty3Hf5GiGdmPieYQXg9qBDmc/+lCfIKG7ve57Wh9uFByI8jS1LGu23BAx5cwuaF80
	BLiq2OQJ2Ic4FIMc1nRx4SZ0Gja6ytTU7YBhYRYtOP2u6z/OSGeIgWrXomCrY+L88qNC
	nlILBt0Eu5SaL/Iko3mEqxz+Q1aDy89dEojwxQ7lZkqO/C9YEPuNpZn4Vhgg/ucS/USq
	gXGi2LKiVqhUf4u3BkEDcOQ5elS+0VpKfDQt8NM3ydsF1n8EFLeRVmc9H3QbMg0jtF2b
	QluVfK7I7mO6Y3vhXiTX8Jr6VDWH6imrMsddV0CNdf42hmAAcNEWA4nUPWgf5ZPHDbC4
	eZSQ==
X-Gm-Message-State: AD7BkJLqNAGkQEtXB3g8eFW6J+nSVCMKT0xJu4szW0eTJRrNyjLSOVJXiTunJ0Z3ZYOSIQ==
X-Received: by 10.98.64.4 with SMTP id n4mr1891153pfa.58.1459548824360;
	Fri, 01 Apr 2016 15:13:44 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	xs10sm24309919pab.4.2016.04.01.15.13.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 01 Apr 2016 15:13:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=VQxvgYomwYScxG3Ht__bnJT5nysJeAiKVKWSeJ_6=NDw@mail.gmail.com>
Date: Fri, 1 Apr 2016 15:13:37 -0700
Message-Id: <8449A2E1-2165-408E-9E45-CE99F1D26BBD@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
	<CAJ86T=XShqiCRiZan9s4kimpBdejqjRYCHei7aXfv5xfbcpUmA@mail.gmail.com>
	<CAP9ODKpWv6eEGqnnAoqog822avKJLWLErh0aaJfZ1uhBy4d8SA@mail.gmail.com>
	<CAJ86T=VQxvgYomwYScxG3Ht__bnJT5nysJeAiKVKWSeJ_6=NDw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Fri, 01 Apr 2016 22:13:49 -0000
X-Groupsio-MsgNum: 80412
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4D0B36B5-18D8-4493-B9C0-3A0A7196BDFB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4D0B36B5-18D8-4493-B9C0-3A0A7196BDFB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 1, 2016, at 3:03 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Fri, Apr 1, 2016 at 12:13 PM, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> Hello folks,
>>=20
>> On Wed, Mar 30, 2016 at 8:59 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>> On Wed, Mar 30, 2016 at 3:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>> On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
>>>>> Either way it shouldn't be a concern for the CPU tuning files.
>>>>> Building Thumb2 for an armv8a CPU is really just an extension of
>>>>> "optimise for size" and we don't include -Os, -O2, etc options in =
the
>>>>> CPU tuning files.
>>>>=20
>>>> Yes, agreed.  In principle there's no reason that the compiler =
couldn't
>>>> choose between A32 and T32 instruction sets dynamically for each
>>>> compilation unit (or each function) according to which it thinks =
would
>>>> give the better result.  And from the user's point of view, the =
outcome
>>>> should be equivalent apart from minor performance differences.
>>>>=20
>>>>>>> For most cores from Cortex A9 onwards NEON and VFP are optional, =
so
>>>>>>> hardcoded assumptions won't work.
>>>>=20
>>>>> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s =
Guide for
>>>>> ARMv8-A mentions:
>>>>>=20
>>>>> "Both floating-point and NEON are required in all standard ARMv8
>>>>> implementations. However, implementations targeting specialized
>>>>> markets may support the following combinations:
>>>>>=20
>>>>> - No NEON or floating-point.
>>>>> - Full floating-point and SIMD support with exception trapping.
>>>>> - Full floating-point and SIMD support without exception trapping.
>>>>=20
>>>> Is there any evidence that anyone is actually building ARMv8-A (as
>>>> opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there =
is a
>>>> fairly clear indication that such cores do exist and are likely to =
be
>>>> used with OE, I think we should not complicate the tuning files =
with
>>>> support for such things.  Anybody who wants them can always add
>>>> appropriate tunes later, either in oe-core or in their own layer.
>>>=20
>>> I can't find any evidence of real ARMv8-A cores without NEON or VFP,
>>> so if any "new approach" to ARM CPU tuning files is limited to =
armv8a
>>> then hardcoding support for NEON and VFP is probably going to work =
out
>>> OK (at least until someone wants support for the half-precision
>>> floating point extensions added in ARMv8.2-A).
>>>=20
>>> Personally though, I'd like to see a comprehensive cleanup and
>>> restructuring which could be applied to all ARM tuning files,
>>> including armv7a where NEON certainly is optional in the real world.
>>=20
>> Could you, Phil and Khem summarize the remarks in a succinct way? To
>> be honest I am a little lost on what changes you all are expecting on
>> top of the last patch version.
>=20
> I think the last comment from Richard was:
>=20
> "I'm planning to drop the patch triggering this from -next and
> defer it until 2.2. The discussions can happen in the meantime to get =
a
> patchset we're all happy with."
>=20
> So I don't think anything is expected for 2.1.
>=20
> The floor is still open for discussion for 2.2. One initial question
> seems to be whether we're aiming for a point solution for armv8a or a
> wider ranging cleanup?

I would support the latter. Andre, since you have mentioned it earlier
would you mind opening a bugzilla entry for cleanup for 2.2 ?

--Apple-Mail=_4D0B36B5-18D8-4493-B9C0-3A0A7196BDFB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb+8pUACgkQuwUzVZGdMxR18QCcCjGR0V2Suo7U8R2WLHsdL+ot
tW0Anirz6Lenfzy+pdOpIhUYCJgnwno8
=3PVc
-----END PGP SIGNATURE-----

--Apple-Mail=_4D0B36B5-18D8-4493-B9C0-3A0A7196BDFB--
