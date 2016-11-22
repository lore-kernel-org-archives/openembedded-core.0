Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0B88E6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:45:39 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id c4so6334210pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=PrJiSoKxJka8lpb/d79ySSjNH5r6VSYV1mtHosvRnqg=;
	b=UYcCu0vVexPK8zMY5UOWMK8zISy4udIARjOSvF9sPeVBjGAs2YCxFlOcCL8SZmA47+
	pfKF0sx+3EKLtk+tH6XYZyZSUroDqRYME3vgCLbXZIjriw38TRpPlNEsPnUhr/MAV2aM
	ZZ5zs7XMd55X/1CqM1zFsvdL39yVZ7N1oGOvMfLzEAUfK4aQoZlaAVHXFbryJmdWC+TM
	9CW9djDDjkmoDAbkbMhVaOtzIzpP4tvOlnYRqxndu9MwII+5+UpD7dF88CSYKqapyKcy
	38uLVorCbn66PjIHJLi5v0VnasG3s+aDW8u1Bo4Y0fDBcFX9nha3muur7lcpTWsl13Rl
	LBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=PrJiSoKxJka8lpb/d79ySSjNH5r6VSYV1mtHosvRnqg=;
	b=HlXXJWUWK4xcLUDMeDroYWDt6dJ54Dr1WbaJJOIzCTR0hSTZmTjlL9du9+Kgi9L9i7
	C6nROvzTUW42ba9d6Qc94txUlkXk2z7gbwLKvBHcoc3Nnk+qoGSQCSNcjWxr9IGchEeG
	EM3BD9b5CKhsJEIeZK5PJglVjqzkTwJz8NJvcPqX4K+gHE+qNaFl1LP/MaB0tlZrva2D
	MOLlXYqyv5Df+P80DpBJ7SCAysNhXCZ4Q+zWu/ms2Ll7L6OL2W96HcXm9nsTPwSRHg+8
	EWscA3YqjM9TJJf6t7zp0f1gbZS6MLvkwwYgSuvX9YJSu1A6UDTp8NR1ZLlrQOv8b+KX
	p4Gw==
X-Gm-Message-State: AKaTC03XMT8F5RXuhhn8Rf330qP5QDZYZbazbbI/87jmvnv36u1tb5qNRs+76z6jEuDK1A==
X-Received: by 10.84.213.144 with SMTP id g16mr522563pli.134.1479858340987;
	Tue, 22 Nov 2016 15:45:40 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:d191:f445:6e57:1696])
	by smtp.gmail.com with ESMTPSA id
	d1sm47587581pfb.76.2016.11.22.15.45.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Nov 2016 15:45:40 -0800 (PST)
To: Kristian Amlie <kristian.amlie@mender.io>,
	openembedded-core@lists.openembedded.org
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
Date: Tue, 22 Nov 2016 15:45:34 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:50.0)
	Gecko/20100101 Thunderbird/50.0
MIME-Version: 1.0
In-Reply-To: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Tue, 22 Nov 2016 23:45:43 -0000
X-Groupsio-MsgNum: 89691
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="VNEReC1Wkx6UEXQc1tJfPFQ8pRUDMmRCj"

--VNEReC1Wkx6UEXQc1tJfPFQ8pRUDMmRCj
Content-Type: multipart/mixed; boundary="lTC7vhAW57Dut8GU0U1Ncl4pE9c3wDmkh";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>,
 openembedded-core@lists.openembedded.org
Message-ID: <1d5954ab-1a9a-b73d-7f72-fbe84c8e2250@gmail.com>
Subject: Re: [OE-core] Contents of non-rootfs partitions
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
In-Reply-To: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>

--lTC7vhAW57Dut8GU0U1Ncl4pE9c3wDmkh
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 11/22/16 1:05 AM, Kristian Amlie wrote:
> Hey
>=20
> In Mender we are using a dual rootfs partition layout (A/B layout) with=
 a persistent data partition on the side. We're using wic to do the actua=
l image building.
>=20
> However, putting files into this data partition is not a straightforwar=
d operation ATM. All recipes in OE put files into the rootfs only, and we=
'd like there to be a way to specify that files should go into the data p=
artition.
>=20
> I haven't seen any straightforward way to do this in OE. Some suggestio=
ns for how it could be done:
>=20
> * A "DATA_FILES" variable (like "IMAGE_BOOT_FILES"), where you can list=
 files you'd like to be included. This is very straightforward, but has t=
he disadvantage of being a bit hairy when paths are involved, and it does=
n't allow for much logic.
>=20
> * Keep a special "data" directory, something similar to sysroot, where =
recipes could install files into in order to have it included on the data=
 partition. We could potentially have a bbclass for use in recipes to mak=
e this more streamlined.
>=20

Firstly, it needs to be defined what the data partition is about.
1. is it some pre-initialized/seeded data that can then be modified durin=
g
subsequent boots ?
2. Is it read-only data which is then used to populate r/w data segments =
in
RAM during boot
3. is it data that does not change over the course of install and reboots=
 of
the device

> * Have a special recipe that users can bbappend, which specifically ins=
tall to the data partition (this might also need a "data" directory, like=
 above).
>=20
> It's also possible that this should be generalized further so that it d=
oesn't only apply to a data partition, but to any non-rootfs partition.
>=20
> I'm willing to invest some time in this, but I thought I'd gather some =
opinions first.
>=20
> Thoughts?
>=20


--lTC7vhAW57Dut8GU0U1Ncl4pE9c3wDmkh--

--VNEReC1Wkx6UEXQc1tJfPFQ8pRUDMmRCj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlg02KMACgkQuwUzVZGdMxQl4ACcDxjGAMWMM5vKaF4eMwL+m765
Ls4AniFYxdkrslOjJCK9bDgGOLUCPfdy
=Ser1
-----END PGP SIGNATURE-----

--VNEReC1Wkx6UEXQc1tJfPFQ8pRUDMmRCj--
