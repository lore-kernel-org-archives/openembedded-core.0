Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E1D4B6FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 00:29:04 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so236809916pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2BXJe2dRYqE0QJL5fWnGFkWqGKNsvBaJEa46wOhCqBw=;
	b=EbZ6dC6SRHImhQl/OdW6/tyaAYUZ7LQhWI10Mj5v/FyQDvAt8fQb30Z8xJrgnMz6Ra
	k50KAyf6yNuWphPco44FcMc1JQF+621U+DXwx+6gXeReM7Rl++fqDHv3SZgpdDwKKHLH
	NW7WRH9YqUSy+mAf/XrCLFOGijtNqLO7euXmlc/O/iQ/Xw6gNVXgj6V2f2/A5bziQbP1
	UXnNYX1OS7ZmcYIAcaWVDgjmtnzJpXI6dM1CC9flhWItmZOd2cDXucbpxZETtx/PPRJO
	2Ynbq35XikEagUgZ5AW3mszSwCWEMYJLpJgG7Z33VtWSjvzaECATbU9QHi+LxgVjY4LU
	tN4Q==
X-Received: by 10.66.162.9 with SMTP id xw9mr184582416pab.46.1452558545318;
	Mon, 11 Jan 2016 16:29:05 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id 78sm4094543pfl.36.2016.01.11.16.29.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 16:29:04 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=V71XZfoY54VgBJP2=Ec6ycpi2YSF6FcR6tTuow4eBaVg@mail.gmail.com>
Date: Mon, 11 Jan 2016 16:29:04 -0800
Message-Id: <8C1C6409-C8B8-43EE-AE9A-8F376177AA00@gmail.com>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
	<1452199993-3885-2-git-send-email-armccurdy@gmail.com>
	<20160107210943.GH2512@jama>
	<CAJ86T=V71XZfoY54VgBJP2=Ec6ycpi2YSF6FcR6tTuow4eBaVg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] qemu.bbclass: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Tue, 12 Jan 2016 00:29:06 -0000
X-Groupsio-MsgNum: 75890
Content-Type: multipart/signed;
	boundary="Apple-Mail=_18CD76CD-9CC5-476D-8352-9DA543C27C2F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_18CD76CD-9CC5-476D-8352-9DA543C27C2F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 7, 2016, at 1:17 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>=20
> On Thu, Jan 7, 2016 at 1:09 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> On Thu, Jan 07, 2016 at 12:53:10PM -0800, Andre McCurdy wrote:
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/classes/qemu.bbclass | 1 +
>>> 1 file changed, 1 insertion(+)
>>>=20
>>> diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
>>> index 315c17f..4ec7657 100644
>>> --- a/meta/classes/qemu.bbclass
>>> +++ b/meta/classes/qemu.bbclass
>>> @@ -43,6 +43,7 @@ QEMU_OPTIONS[vardeps] +=3D =
"QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
>>> QEMU_EXTRAOPTIONS_iwmmxt    =3D " -cpu pxa270-c5"
>>> QEMU_EXTRAOPTIONS_armv6     =3D " -cpu arm1136"
>>> QEMU_EXTRAOPTIONS_armv7a    =3D " -cpu cortex-a8"
>>> +QEMU_EXTRAOPTIONS_armv7ve   =3D " -cpu cortex-a8"
>>=20
>> would it make sense to use cortex-a15 here? It's supported at least =
in qemu-2.5.0
>=20
> Yes, I think you're right. If qemu configured for cortex-a8 is going
> to barf on armv7ve integer division instructions then we should enable
> an armv7ve cpu such as cortex-a15.
>=20
> To avoid unnecessary diversity, should we then also use cortex-a15 for =
armv7a ?

I think yes.

>=20
>>> QEMU_EXTRAOPTIONS_ppce500v2 =3D " -cpu e500v2"
>>> QEMU_EXTRAOPTIONS_ppce500mc =3D " -cpu e500mc"
>>> QEMU_EXTRAOPTIONS_ppce5500 =3D " -cpu e5500"
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_18CD76CD-9CC5-476D-8352-9DA543C27C2F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUSNAACgkQuwUzVZGdMxTWlQCgjVARvf8r8D/YrcTdJCssLWcg
xPUAoIWOWeDGSNTL9yCoQpIjGwAetZBl
=sbLK
-----END PGP SIGNATURE-----

--Apple-Mail=_18CD76CD-9CC5-476D-8352-9DA543C27C2F--
