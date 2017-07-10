Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f179.google.com (mail-yb0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 746BE77CF6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:05:23 +0000 (UTC)
Received: by mail-yb0-f179.google.com with SMTP id 84so31186664ybe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k+KSEGmo4yFvqtEbLytUgihTvcxvyhQajf0FbbuvBuw=;
	b=qf7YbenOUEt005PcF7XqwMxU2pdCofVGN23AQ6mhTlTfhYO3rZUPtRBTsvi+vBO35D
	Cjf9yaVoA10wt30SGSa3v3x2Us1rHqY+dAGLIwjH6TGOcx7BJr8ZviTIqHwBJUsCEnh5
	FFpL8Qqu4spuE8/N4vTgZ2zJr9Yi14nUjrcbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k+KSEGmo4yFvqtEbLytUgihTvcxvyhQajf0FbbuvBuw=;
	b=HYwh0iczTIHPDCUahvm+oSMvC9bCQVf6mcDOEV19rIM7H6MsKbSA26wUB9mQrdN+rj
	ll7Cmtvz8jiNhtD1GeHKfIUPtDTGoYJCG1aIeNrQqymTA1Rtes6+0iynye+vWAM6Vvkq
	rWIr4odF7LEf+Eq8R29SHQ6cLgx3rvuyrjChq+3EOeaQ/o0WIK4LQbRlOAIiSBXNUI61
	tvzUdMPmHSgFMCzm32SU3qWasJI960nJntSYi6X6fhcfN4PmruoDWuEWEHfWRz8m9YyO
	i3GDm1kIhjA/zzfPNwOSjadXA8Mg2ghfadZ8xzxhHzJi2Aag9nW53PaEKtynY0QTolj4
	4fVA==
X-Gm-Message-State: AIVw1128qnknC7WFfiZ9BVFrf4oDGux33vUWDlr0lUK7a0V6iwBZbpvt
	L0O/gxGAXNjE6ZlYSxUBxw==
X-Received: by 10.37.175.204 with SMTP id d12mr16196767ybj.18.1499713524444;
	Mon, 10 Jul 2017 12:05:24 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id s64sm5022234ywg.4.2017.07.10.12.05.23
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 10 Jul 2017 12:05:23 -0700 (PDT)
Date: Mon, 10 Jul 2017 15:06:21 -0400
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170710190621.GF22707@bill-the-cat>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
MIME-Version: 1.0
In-Reply-To: <ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.07 release (WIP)
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
X-List-Received-Date: Mon, 10 Jul 2017 19:05:23 -0000
X-Groupsio-MsgNum: 99918
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ms60FkNooP0wig9X"
Content-Disposition: inline

--ms60FkNooP0wig9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
> On 07/10/2017 09:01 PM, Tom Rini wrote:
> > On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
> >> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> >>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
> >>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> >>>>> This patch upgrades the U-Boot to the 2017.07 release.
> >>>>>
> >>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>>>> ---
> >>>>>
> >>>>>  .../u-boot/{u-boot-common_2017.05.inc =3D> u-boot-common_2017.07.i=
nc}     | 2 +-
> >>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-boot-fw-utils_2017.0=
7.bb}   | 0
> >>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boot-mkimage_2017.07.=
bb}     | 0
> >>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.07.bb}=
        | 0
> >>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc =3D> u-b=
oot-common_2017.07.inc} (88%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-=
boot-fw-utils_2017.07.bb} (100%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb =3D> u-b=
oot-mkimage_2017.07.bb} (100%)
> >>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017=
=2E07.bb} (100%)
> >>>>>
> >>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/me=
ta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>> similarity index 88%
> >>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>> index 0e52f27df8..f27989daa1 100644
> >>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>> @@ -7,7 +7,7 @@ PE =3D "1"
> >>>>>
> >>>>>  # We use the revision in order to avoid having to fetch it from the
> >>>>>  # repo during parse
> >>>>> -SRCREV =3D "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> >>>>> +SRCREV =3D "d85ca029f257b53a96da6c2fb421e78a003a9943"
> >>>>
> >>>> Where did you get this hash from, it's not in the U-Boot repo ...
> >>>
> >>> From the tag used by Tom. You can check it on his github repository.
> >>
> >> I cannot, that is NOT where the U-Boot recipe points to nor is it in a=
ny
> >> way an official U-Boot source git tree .
> >=20
> > It's also on the official github mirror.  I'll go see why the DENX git
> > is lagging behind.
>=20
> Hm that's weird. How can it be a mirror if it contains objects not in
> the mirrored repo ? ;-)

git supports multiple push URIs.  So I update all 3 locations with a
single push.  However, git.denx.de works differently than github.com
does.

--=20
Tom

--ms60FkNooP0wig9X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY9AtAAoJEIf59jXTHXZSyEwQALnhw5Fal4OGKkNCgoKIXp5g
SiEx4U8Pf6WHDfiy5GKRPDUzC5Rs5i90xGlZzInHtRUNhwOCWgXsijIxEkYkax5G
YXR8FOozjLU5hjl85TJ4T0virFVOUwxdl5hqOtvPnEeEqeDETKtRskWhaR3CF0K0
Nd+zDdBegGeryk8tuOhmKwSdjab9YVqU7SZUhbqdS/x12uXBMZ/D2fgvtavggYQO
takG7WV0uzBu6xRLbnsI1nq3nRCxY6NZZ8tbwQhG+Y/7U53FRQKR+7YdqA/7QjZ3
9TQIWR7Zz7UjF50jP3xNFqvg+pfbfibTr9R/7zDRXGpaoShNAJEXfXMaTeOj9I8R
1sFhEr2omCIO1PpOA+H6hkIg8O3dtgxf6ZFygNLHXUm+3ETiRGNjzMDdLwaN663n
AtdPOtdImi6BRD3nZdZEiZYdlwtsYSUDOuqmsqwyANo1/qGvEoIiBsja7aTaCYEz
u84xu2odPRXY6vjmiuzwhS4fOwex/yYWGPbxcroMvyb+kBrRdp8mrMKit6VLgKAF
IDn3+f61F3l7pLAYTRzUiqUMLDZl3TrbtUhA0evhAvGRHeBEGih8L67CigsWtbOO
+gXMj40e0oCn44tixb1T4qCVXlzoI2DGmfLU1BZcRqaP0QRgJtjoAQsxGNfpGMGC
kwSice1P64mFBDOg8kxJ
=BTsa
-----END PGP SIGNATURE-----

--ms60FkNooP0wig9X--
