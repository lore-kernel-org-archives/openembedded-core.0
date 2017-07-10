Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f177.google.com (mail-yw0-f177.google.com
	[209.85.161.177])
	by mail.openembedded.org (Postfix) with ESMTP id B0C4F77D16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:11:21 +0000 (UTC)
Received: by mail-yw0-f177.google.com with SMTP id l21so39847395ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 12:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lC0zg69vuGbnTAJmaJWxrG0vevxcwaaveal45+Il3eg=;
	b=XAF29xU26wULjO4xndtuTbE8bkXQqhjwITQKfGHUEBLGn1CUvW0u0EShfhYMIzXefl
	YqsJce2F0zg0lAZ8djiQtcZ2pe3e8CHEOCkEIeTVk5W52rMOwHAs4LboYTC+9/Ntijh+
	ImBAwSEGHJHtWUVahX/ZcGqUfqrlNWsnmPo/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lC0zg69vuGbnTAJmaJWxrG0vevxcwaaveal45+Il3eg=;
	b=FVWwtR3fE9X9OXcYjzwI1fWUMHPeVPGh+GWxQhASilKb0e++vtJWoSva+BifOzNE/R
	mZd1m1KZTXf7O0uhuLUsKWbfu/bYg7NvQyZria1d1VzxeuariQT4ZLJ4SCvBtaoyqOmE
	EAX+C4rPiU1xC4cdZK/+YZHNof/wiQHQS3L1+n6tR7oM4aS3UeC8xzknAK/DosIkCjye
	mg27zaOvmUbaJK+KTc3JrudTZTYrE/hSVyR/i7JFOsT0FxcrKAeKtuSOcbpf8fn9NGlP
	WH9kcNScoiT0MpfiuFRUKjRt7+fx+FCOsS+ouBFGtcJDDrSHHPQd5BOsZ16n0L3rYihG
	fNiA==
X-Gm-Message-State: AIVw111kVKaEquc87xb/4s3GBCfrJomRhIYvkWNZVpAXdmWRjlUDmQSX
	5ysq2CM/touyNchn
X-Received: by 10.129.121.200 with SMTP id u191mr2006615ywc.76.1499713882600; 
	Mon, 10 Jul 2017 12:11:22 -0700 (PDT)
Received: from bill-the-cat (cpe-75-180-228-133.ec.res.rr.com.
	[75.180.228.133])
	by smtp.gmail.com with ESMTPSA id v3sm5272095ywg.37.2017.07.10.12.11.21
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Mon, 10 Jul 2017 12:11:22 -0700 (PDT)
Date: Mon, 10 Jul 2017 15:12:19 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170710191219.GG22707@bill-the-cat>
References: <20170710183657.12885-1-otavio@ossystems.com.br>
	<1d8dd351-0d96-0766-1beb-6ac621a6bfe4@denx.de>
	<CAP9ODKpJTG3siy9Qo+EFm3QTnQYhn0Q2dc-pq6gq3Wq=hpscXA@mail.gmail.com>
	<7e5cb452-d500-f57d-9830-f936db12418b@denx.de>
	<20170710190128.GE22707@bill-the-cat>
	<ce1cd8f5-1c41-87c0-57b4-d92abb3c177e@denx.de>
	<20170710190621.GF22707@bill-the-cat>
	<02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
MIME-Version: 1.0
In-Reply-To: <02ee9f46-27db-0bb9-7506-009d46351437@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Marek Vasut <marex@denx.de>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
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
X-List-Received-Date: Mon, 10 Jul 2017 19:11:30 -0000
X-Groupsio-MsgNum: 99921
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wvwNF9s1zUfZzNh9"
Content-Disposition: inline

--wvwNF9s1zUfZzNh9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2017 at 12:08:41PM -0700, Khem Raj wrote:
> On 7/10/17 12:06 PM, Tom Rini wrote:
> > On Mon, Jul 10, 2017 at 09:02:39PM +0200, Marek Vasut wrote:
> >> On 07/10/2017 09:01 PM, Tom Rini wrote:
> >>> On Mon, Jul 10, 2017 at 08:57:19PM +0200, Marek Vasut wrote:
> >>>> On 07/10/2017 08:51 PM, Otavio Salvador wrote:
> >>>>> On Mon, Jul 10, 2017 at 3:47 PM, Marek Vasut <marex@denx.de> wrote:
> >>>>>> On 07/10/2017 08:36 PM, Otavio Salvador wrote:
> >>>>>>> This patch upgrades the U-Boot to the 2017.07 release.
> >>>>>>>
> >>>>>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >>>>>>> ---
> >>>>>>>
> >>>>>>>  .../u-boot/{u-boot-common_2017.05.inc =3D> u-boot-common_2017.07=
=2Einc}     | 2 +-
> >>>>>>>  .../u-boot/{u-boot-fw-utils_2017.05.bb =3D> u-boot-fw-utils_2017=
=2E07.bb}   | 0
> >>>>>>>  .../u-boot/{u-boot-mkimage_2017.05.bb =3D> u-boot-mkimage_2017.0=
7.bb}     | 0
> >>>>>>>  meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_2017.07.b=
b}        | 0
> >>>>>>>  4 files changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-common_2017.05.inc =3D> u=
-boot-common_2017.07.inc} (88%)
> >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2017.05.bb =3D> =
u-boot-fw-utils_2017.07.bb} (100%)
> >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2017.05.bb =3D> u=
-boot-mkimage_2017.07.bb} (100%)
> >>>>>>>  rename meta/recipes-bsp/u-boot/{u-boot_2017.05.bb =3D> u-boot_20=
17.07.bb} (100%)
> >>>>>>>
> >>>>>>> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/=
meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>>>> similarity index 88%
> >>>>>>> rename from meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>>>>>> rename to meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>>>> index 0e52f27df8..f27989daa1 100644
> >>>>>>> --- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
> >>>>>>> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.07.inc
> >>>>>>> @@ -7,7 +7,7 @@ PE =3D "1"
> >>>>>>>
> >>>>>>>  # We use the revision in order to avoid having to fetch it from =
the
> >>>>>>>  # repo during parse
> >>>>>>> -SRCREV =3D "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
> >>>>>>> +SRCREV =3D "d85ca029f257b53a96da6c2fb421e78a003a9943"
> >>>>>>
> >>>>>> Where did you get this hash from, it's not in the U-Boot repo ...
> >>>>>
> >>>>> From the tag used by Tom. You can check it on his github repository.
> >>>>
> >>>> I cannot, that is NOT where the U-Boot recipe points to nor is it in=
 any
> >>>> way an official U-Boot source git tree .
> >>>
> >>> It's also on the official github mirror.  I'll go see why the DENX git
> >>> is lagging behind.
> >>
> >> Hm that's weird. How can it be a mirror if it contains objects not in
> >> the mirrored repo ? ;-)
> >=20
> > git supports multiple push URIs.  So I update all 3 locations with a
> > single push.  However, git.denx.de works differently than github.com
> > does.
>=20
> may be pushing to upstream and then pulling before populating the
> mirrors could solve such issues. but I think we should use github.com
> in OE src_uri's for speed reasons.

On the back end, things are a bit more complex than that, but I'm
working to resolve the current error now.  FWIW, changing the OE recipe
to fetch from https://github.com/u-boot/u-boot.git would be fine with
me, it's owned by myself, Wolfgang and the person that helped us out and
got that project created to start with, so it will only have official
changes in it.

--=20
Tom

--wvwNF9s1zUfZzNh9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZY9GTAAoJEIf59jXTHXZS5gcP/iXWwaibJJKxA9gOVXUYFPcY
QdPwZnW0muIQTm6SNEIWISHxLRmpLREtnpmgaIcIF5GAhvgoQinfbN6B2F7ASXek
+KgBdRtZWnjpeMeSgSeFgR7YR9c0kzluev4rkYkv0MY38arzHdOi5SVVDZIUoU9s
QvAjOAxBMtQsQL4duUExvYQy0tW6C5ATdJzeJW2j0c34FtT4TAJVWohXFu3VJPT9
mk6DjlKjdw7HYUHnvRCiXnjNrne20AdJ1QY17/EdUFtOLEkh3O7UwE2oQNWThWbz
+lEZz1b12qFFg2sEihWMhzoPEMaiq7CsQ7Wr1giJXN+q8B612jeFE5SdGcLAEhVk
uob+W1YsK3q87N6KxiAL2NwneNKRk7frlbQjDy899giyNGqsKZhkNuBbW+cNePIA
Bm8RLTf17gH5I9AWylYycMqDPUpKdlAYEuDAt+hwBQbfMV0jOKpOrXBND1mTqPxU
ucO7szQaW7k4sg1iX8QnGqjQ74gOKMFn/vED/D/ivfuBurXXTA0OecTwsyTF0DE5
IP6f+FdcwoN9ByACsb476pQ8906kOz05Aywe34pNrB0ta0iciamrdv2slt+PIFII
bRecsa5YeoDEbBcYglBGI98/Bnf5d/AEOViMbTODx7wCO/2EXbybyDw5d/R5ItqJ
PocDObu1V2Jmr3opMHW4
=d4/W
-----END PGP SIGNATURE-----

--wvwNF9s1zUfZzNh9--
