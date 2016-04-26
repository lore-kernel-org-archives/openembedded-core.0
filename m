Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id C79C771951
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 16:43:59 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id bt5so8395048pac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Apr 2016 09:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=88pjLx1XMlCU5dqZtoN1JruEQ7N1T5lRKs2m7hw8uUY=;
	b=z+m46tnI92dea6K1HOPPxp639UX9TT05HHgvB9uitZ0R45F47+WFRkTbL5AztaEoTF
	x2i3X8hq7ozRFWvJzJEpkmnf5AQm81hkmEsDRIQwWKhjVHZdqiJ8K/YETAyFsOEwctOu
	gByeOaRrk7Wdi2VtqnH6K4a/Rd8YlCzfM1+KxL9uUNgKV6EgtohoXOv21ZKV3mLVecQ1
	+3FSPzOfmhNE8S8HNx4h05FNrabciVIId/y14aDPhqniPcAG8n17mUgyZTcCSY1sg8Vf
	oXTSwp6/GKeprVViviX1voIREhRVtSSKdiEqIubxLar1F9/BvFdu7sJg3gzSVEiQUEPi
	ALHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=88pjLx1XMlCU5dqZtoN1JruEQ7N1T5lRKs2m7hw8uUY=;
	b=CsYPNPgF8YiV1Qx31ggLn+sGX4yhHMGCC9s5qY2Gv8jmJPZlQ8jDXmHDzQC0m8PSr7
	6ofsIeLI6NeSubcEnCEYZuE/eD9YclWrOSwBQ31NG39GSrGHmPEs9SO3Gcuz1ym6Offd
	lRS2PkmCl4yzL+aaaomc2GS7xEh9PN7ABRtPT0XCqxLR4v53x0Wth3OTb2zOq3Y1zoX9
	FJYUJrRE07PPi2H3M2qZD7gzPfYJc18bX2D0u1pOKRXhLOFi2dXipKagizqraM/sPAni
	vz1re71QhUc3lrVzjCCCeupn3CWt2U5Ui2164ubSiokE6KFw8JIfU8JDqUMYCyK6ge4t
	2llg==
X-Gm-Message-State: AOPr4FVp686QZ/nIaEAglSc9AFsSnhdEbQRBv8VLnC37kgPkqCbmDaEAg0UJR7QRPQJp4Q==
X-Received: by 10.66.248.163 with SMTP id yn3mr5072471pac.86.1461689040783;
	Tue, 26 Apr 2016 09:44:00 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:b93e:176b:d03b:ac8e?
	([2601:646:8800:5a9a:b93e:176b:d03b:ac8e])
	by smtp.gmail.com with ESMTPSA id
	y128sm6503473pfb.13.2016.04.26.09.43.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Apr 2016 09:44:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAPhnLPDJ3hfHJLRYPHQOz47A1oFrtuM_FevmvAtRpCTp5eChng@mail.gmail.com>
Date: Tue, 26 Apr 2016 09:43:59 -0700
Message-Id: <5F23E860-0BC7-4F5B-B4BD-E251F8DB0DD9@gmail.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
	<e76f32f4bb513453ffd80704adf19540b8f35d2a.1461592183.git.liezhi.yang@windriver.com>
	<CAJTo0LZgtTN+6M_Xvwm2zQAibJR0jBXB15eU12HfUtz2ERuYKA@mail.gmail.com>
	<571EB9F9.3060602@windriver.com>
	<CAJTo0LZN4Y1vFOJJrMxsapm9LL=KT05_KV2C63fH5QkEjZw3og@mail.gmail.com>
	<CAPhnLPDJ3hfHJLRYPHQOz47A1oFrtuM_FevmvAtRpCTp5eChng@mail.gmail.com>
To: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] libxsettings-client: fix LICENSE
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
X-List-Received-Date: Tue, 26 Apr 2016 16:44:00 -0000
X-Groupsio-MsgNum: 81274
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7CB67EC2-D27B-4D3A-9DF9-526D5F379F24";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7CB67EC2-D27B-4D3A-9DF9-526D5F379F24
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 26, 2016, at 6:57 AM, Flanagan, Elizabeth =
<elizabeth.flanagan@intel.com> wrote:
>=20
> On 26 April 2016 at 14:29, Burton, Ross <ross.burton@intel.com> wrote:
>>=20
>> On 26 April 2016 at 01:44, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>>>=20
>>> Thanks, did you mean the following text ? I can't find MIT license =
there.
>>>=20
>>> /*
>>> * Copyright =C2=A9 2001 Red Hat, Inc
>>> *
>>=20
>>=20
>> Yes, this one.  I've just had a chat with Beth and we both agree that =
it's
>> practically MIT, even if it's not worded traditionally.  My personal =
belief
>> is that this license is Red Hat's legal department's wording of MIT.
>> Pointing it at the MIT license is acceptable, but preferable would be =
adding
>> a new "RedHat-MIT" license to common-licenses and using that.
>>=20
>=20
> Yes, this is MIT enough that, in that, it doesn't really add any
> restrictions to MIT that looking at it again I think leaving it MIT is
> enough.

It may be good to send a query to concerned folks at redhat and clarify
so we don=E2=80=99t have to make assumptions.

>=20
>> Ross
>>=20
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20
>=20
>=20
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_7CB67EC2-D27B-4D3A-9DF9-526D5F379F24
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcfms8ACgkQuwUzVZGdMxSW5wCePo7Kej1ERumXoFsFGLtX67MG
GC8Anie0J1UL1LAFUlnp/z54BzZuJVue
=k1Vm
-----END PGP SIGNATURE-----

--Apple-Mail=_7CB67EC2-D27B-4D3A-9DF9-526D5F379F24--
