Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9A68B76FD5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 16:08:51 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so14520539pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 09:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Tawgg4emxN1ib1eo+F6Svx1Dx1wJr2C07c9pyiNroQU=;
	b=t9CnAukKu9g8hAzftWpXRfB8Teb1GB6hxMKtLwslrqkYX2swaGN3bRlyzxT3F4I5yj
	MPuxneoNHA2UM03Rcsst4fPpjx4+H4YQHIlMO5vFk8hjmLH/pzjO4jkShfZQ/PnVjaSI
	M6FdtY9uRBNkPIItPUG+2Xh6yodKnY09t2GLsfpQFskRjRD8DitUwlKlCzD5NuqGFUji
	UzF8lHoRKByN2j71iWdaIPQmylAY6pa92guuhQDAe7xvTBgEjh3c2NWmlE0TFW++MnPv
	n208PTOW8QK7bPNP04ku9AdszFIHzGl5xOMFKcR0D/lfVBUcbNSDpDShdFBVVw4yyVUI
	DEgA==
X-Received: by 10.68.203.66 with SMTP id ko2mr71460262pbc.81.1441814932335;
	Wed, 09 Sep 2015 09:08:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:a80f:97a4:8ac:b5c7?
	([2601:646:8601:4580:a80f:97a4:8ac:b5c7])
	by smtp.gmail.com with ESMTPSA id
	gw3sm7491723pbc.46.2015.09.09.09.08.50
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Sep 2015 09:08:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP71WjzWEfWq-7NL3Qu-HVCHFXCvrDK=H06qRcSkPZajO4ztUw@mail.gmail.com>
Date: Wed, 9 Sep 2015 09:08:45 -0700
Message-Id: <8FF572D7-97AF-4763-99E4-879EEC05FC62@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
	<c89abf81c424d620a687f0c7bda8f74fcc0f5faa.1441753511.git.raj.khem@gmail.com>
	<CAP71Wjw8W61iC_anLZCb2BFQxo0uxTRgKNnHpWYAJn-1xpizow@mail.gmail.com>
	<92D7A469-14E6-4E5F-835E-C90FF3300346@gmail.com>
	<CAP71WjzWEfWq-7NL3Qu-HVCHFXCvrDK=H06qRcSkPZajO4ztUw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
X-Mailer: Apple Mail (2.2104)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/16] xorg-driver: Fix logical && with bitwise and operation
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
X-List-Received-Date: Wed, 09 Sep 2015 16:08:54 -0000
X-Groupsio-MsgNum: 70922
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F6B8F87E-A9DC-4139-A711-361300C41742";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F6B8F87E-A9DC-4139-A711-361300C41742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 9, 2015, at 1:07 AM, Nicolas Dechesne =
<nicolas.dechesne@linaro.org> wrote:
>=20
> On Wed, Sep 9, 2015 at 9:52 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> why are you adding a patch sent to freedreno mailing list (so I =
would
>>> assume against xf86-video-freedreno), in the xf86-video-omap recipe,
>>> is that a typo?
>>=20
>> thats where it was sent to. since thats the same list omap driver is =
using as well.
>>=20
>>=20
>=20
> hmm. really? I can't find any info about that. how did you figure this =
out?

well I wanted to get Rob=E2=80=99s attention doesnt matter which mailing =
list goes :)

>=20
> Note: I saw your patch on the freedreno ML, and actually the patch
> also exists on the -freedreno driver as well... probably that file was
> just copy/pasted.. in any case, from your email sent to freedreno it's
> not obvious at all that you are targeting -omap driver. so if you can
> confirm that -omap patches need to be sent on the freedreno list, then
> at least you might want to resend with [omap] in subject to avoid
> confusion..  I will test/submit the same patch for -freedreno on my
> side.


--Apple-Mail=_F6B8F87E-A9DC-4139-A711-361300C41742
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXwWZEACgkQuwUzVZGdMxRdXACfQEljX0M4FNn19W4LyM4HTS2v
hUYAoI107c/megxLHwPVkWkdn9Pv7iD+
=ClPQ
-----END PGP SIGNATURE-----

--Apple-Mail=_F6B8F87E-A9DC-4139-A711-361300C41742--
