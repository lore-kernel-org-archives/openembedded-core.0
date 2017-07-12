Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 463E377FF9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:54:45 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id x125so4395982ywa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 19:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=FgpmlXxTEn6zWI4AlBnbFVcfTXEkGRtE8Gdz6cUkfl0=;
	b=Z7DViJHMsH+EjyeD+6JDxav16HcGBY994lbJZXtPJMFq2ILENxBDIWC0MS8b624Gqm
	p5+6OUJ5jDA2F5g8k48LfN7A+bKhsICAe3hBg0ArOGKBxCqdSNnHSMDRf51R1b+uz10q
	8Ddn0Fbrdx14MEGRtovr4K3znqAuBgNvU7FyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=FgpmlXxTEn6zWI4AlBnbFVcfTXEkGRtE8Gdz6cUkfl0=;
	b=FEE4n6SVd7Pdq/PrdCs0tn4iW14mT36cKmc9kuUjJOv0Ev2Uc1ON1Vuwe4muBm9R7B
	pHoovS3R3jw7ov91uRWdN3ratjlHVwCJoUK+dFS3CIqh5WD7yjEqUGs3OItwHwtRWz3A
	YiySfuYlBaXVWMuXUwN3MXle+Yoeim2FqUcv7HAfh9F67EIUSBQqumoHq1VaFlYfI7hR
	5/n5HzQ6JgsVxkAjm7nGRVY1Tr3kRVhAjzNsqe6CahxhGTsDuMN8c6X/12/OA3UiyRwS
	XSxhs4R63a3G1HhgKwDBEFtsf99xzXNMRoH6VGTFytZTvTHS05sPrygb3HYZEkgh2zah
	z/ig==
X-Gm-Message-State: AIVw113hT4UIeMiakYwV8uOh0OqRTesp+27p85EdTexhicR6WJf6wB2a
	i4nHCldzBr2apURr
X-Received: by 10.129.97.10 with SMTP id v10mr943307ywb.80.1499828087099;
	Tue, 11 Jul 2017 19:54:47 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id g35sm456772ywk.41.2017.07.11.19.54.45
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 11 Jul 2017 19:54:46 -0700 (PDT)
Date: Tue, 11 Jul 2017 22:55:45 -0400
From: Tom Rini <trini@konsulko.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170712025545.GE14320@bill-the-cat>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
	<02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
	<20170710191219.GG22707@bill-the-cat>
	<20170712010947.GH26405@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170712010947.GH26405@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Vasut <marex@denx.de>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Wed, 12 Jul 2017 02:54:46 -0000
X-Groupsio-MsgNum: 100060
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 11, 2017 at 09:09:47PM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 10, 2017 at 03:12:19PM -0400, Tom Rini wrote:
> > On Mon, Jul 10, 2017 at 12:08:41PM -0700, Khem Raj wrote:
> > > On 7/10/17 12:06 PM, Tom Rini wrote:
> > > > On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
> > > >> On 07/10/2017 09:01 PM, Tom Rini wrote:
> > > >>> On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
> > > >>>> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> > > >>>>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wr=
ote:
> > > >>>>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> > > >>>>>>> This patch upgrades the U-Boot to the 2017.07 release.
> > > >>>>>>>
> > > >>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > >>>>>>> ---
> > > >>>>>>>
> > > >>>>>>>  .../u-boot/{u-boot-common_2017.05.inc =3D> u-boot-common_201=
7.07.inc}     | 2 +-
> > > >>>>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-boot-fw-utils_=
2017.07.bb}   | 0
> > > >>>>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boot-mkimage_20=
17.07.bb}     | 0
> > > >>>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.=
07.bb}        | 0
> > > >>>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
> > > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc =
=3D> u-boot-common_2017.07.inc} (88%)
> > > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb =
=3D> u-boot-fw-utils_2017.07.bb} (100%)
> > > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb =
=3D> u-boot-mkimage_2017.07.bb} (100%)
> > > >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boo=
t_2017.07.bb} (100%)
> > > >>>>>>>
> > > >>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.in=
c b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > > >>>>>>> similarity index 88%
> > > >>>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > > >>>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > > >>>>>>> index 0e52f27df8..f27989daa1 100644
> > > >>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> > > >>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> > > >>>>>>> @@ -7,7 +7,7 @@ PE =3D "1"
> > > >>>>>>>
> > > >>>>>>>  # We use the revision in order to avoid having to fetch it f=
rom the
> > > >>>>>>>  # repo during parse
> > > >>>>>>> -SRCREV =3D "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> > > >>>>>>> +SRCREV =3D "d85ca029f257b53a96da6c2fb421e78a003a9943"
> > > >>>>>>
> > > >>>>>> Where did you get this hash from, it's not in the U-Boot repo =
=2E..
> > > >>>>>
> > > >>>>> From the tag used by Tom. You can check it on his github reposi=
tory.
> > > >>>>
> > > >>>> I cannot, that is NOT where the U-Boot recipe points to nor is i=
t in any
> > > >>>> way an official U-Boot source git tree .
> > > >>>
> > > >>> It's also on the official github mirror.  I'll go see why the DEN=
X git
> > > >>> is lagging behind.
> > > >>
> > > >> Hm that's weird. How can it be a mirror if it contains objects not=
 in
> > > >> the mirrored repo ? ;-)
> > > >=20
> > > > git supports multiple push URIs.  So I update all 3 locations with a
> > > > single push.  However, git.denx.de works differently than github.com
> > > > does.
> > >=20
> > > may be pushing to upstream and then pulling before populating the
> > > mirrors could solve such issues. but I think we should use github.com
> > > in OE src_uri's for speed reasons.
> >=20
> > On the back end, things are a bit more complex than that, but I'm
> > working to resolve the current error now.  FWIW, changing the OE recipe
> > to fetch from https://github.com/u-boot/u-boot.git would be fine with
> > me, it's owned by myself, Wolfgang and the person that helped us out and
> > got that project created to start with, so it will only have official
> > changes in it.
>=20
> FWIW, I'd be against such change, as long as denx.de remains the official=
=20
> home of U-boot. We don't pull kernel from https://github.com/torvalds/lin=
ux

No, but you do pull it from ${KERNELORG_MIRROR}.  At the end of the day,
I don't have a preference either way.  git.denx.de is the official home,
github has an official mirror.  We've actually put in some time making
sure that git.denx.de is in-sync and up to date (this recent issue was
that incrond has an inode leak).  It should be considered a reliable
source.

--=20
Tom

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZZY+wAAoJEIf59jXTHXZS7eQQAL94ZSgDJ6Vx1Flw43Tsx6Sa
SdyRaHy3UbtHHaJBWdp08eaX0ooDtJ4Vnsi9qKRSmdbLlPCDbbqK54X0dmJeAOsG
kcv5rV+ZzBM4uxYg8VR8AQ/Q8y986rl/v3lERR6ihJWFj2fSgzk9xJUAsdUnX6AG
NX/S7YQzjdeuKqo35yY85eTgwkZFOzkygHzlnb+bG4tRyrlhyIN3JTOOYgfd57nG
1azQ9shw3irB80dH9t09uWiiAjv0dvOxHI3SsK5o9FkqeejcJPMoeK63DHcXZnvI
aUx4av/EYiYqOtVSX65M1JT57fvxFJYhFIncdnF4/qwpEhLsJ4qXKHB1/j5G38y3
iIRQYKVI9PT6OTsGEokUBdYnRpX7cMB2EdxOUi+TtxdB56jzFfRMSww9GUZr+9vI
ankONpnUO0RkG3CQ0nB+1IOoTEwnixLAmxBTcAY0dUMqXBSRAzt/uOYojy5b5uEJ
NtETNq8pdPdOy0brd9ohxHZVHaNc8mYmsfWcsoZu6EsT3GyGAT+RTRpjMIHSb2+G
Y5vp9Cgz8Ogb9opaR6ogcEw1p8/30Jxrt/xICIIsN8Rb6/axCnNzV/Qf5Mc7dyTe
JFd66dYOzBWFQ272jleg91bBL4ZKGgoP/WHl7mgNwIdGslyDaWXvvduNcZmYmsTi
9XA/grXXhU6HzpEI1uM5
=3eAG
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
