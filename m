Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE91665CC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 21:20:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id k19so25941686qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 13:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Gmid7q2WLo1zn1jH4v6vQgSEkzJVC3w3UyoFoMF9fJk=;
	b=h6p3rrcSejuRDBnNxV9GeHUGok56NmbYepaz1HLT3ivlswbPSTnsLgFphjsMPgbUbE
	wzRdSgBZZGDepIbUh7WTAVEl2h43aRYB1felyFJRgveDWXmRJGihy/ubuGtAc/YVeU9Z
	nDSUtGUZVs3cPE6qS3R4GX9BkE9qbQhjW6/84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Gmid7q2WLo1zn1jH4v6vQgSEkzJVC3w3UyoFoMF9fJk=;
	b=fMod8aBErp1s/Z8QNoUoI9InWsTeWVqHnTyBR+8nuL3tYp8s9VoZ/a+SAqquWOV9oz
	C4wW+YO4+bIligK/Og+ON3H1NasKLih0XlOgKZzyNDxKmLFEGL1eOVfU63nEhw3pajWv
	7XvsQA0fGnZXjSQt2R/Lelp0xKctyFGXguZAdh2COD3CaCQzYVDt7xiCDtjkmV8xfHQm
	VLHDZJ/y4f0QOtZq1KFrqcBfm148W1NYUdruub7faKD+rXYOsmGIWTNT4TX09SBZXtwa
	fVIaMmRHQlR4wJGWHfGL26VoJCF4RODQtiwMuERAxUDeIHOZiGc/bW9rGWtT9KIiv+Q4
	E1qg==
X-Gm-Message-State: AKGB3mKWcBCPjnxLlmH8/grxW8G+fQcSA/H6ittoKdC7XML2dXyh8ix8
	XCC6QznNWjmkZ394YpIx+V7Sog==
X-Google-Smtp-Source: ACJfBovKHdTOiaTx8afDpUiG0Y32zUdAgoqyOFvu6gSAA6F1rQqwkKosmLJjc20PP+AryWwf9W6f6Q==
X-Received: by 10.200.45.36 with SMTP id n33mr7482832qta.335.1513718453403;
	Tue, 19 Dec 2017 13:20:53 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	o24sm10311151qkl.22.2017.12.19.13.20.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Dec 2017 13:20:52 -0800 (PST)
Date: Tue, 19 Dec 2017 16:20:50 -0500
From: Tom Rini <trini@konsulko.com>
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20171219212050.GP14220@bill-the-cat>
References: <20171219201148.19828-1-sgw@linux.intel.com>
	<20171219205438.GN14220@bill-the-cat>
	<CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Vkj_5FEWTheHJrH_N0nucHo9yW0MANMoevgUFwnswQ-w@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: preserve rootfs if mkext234fs() fails
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
X-List-Received-Date: Tue, 19 Dec 2017 21:20:52 -0000
X-Groupsio-MsgNum: 106394
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bNOIqPvWVsuhXMpy"
Content-Disposition: inline

--bNOIqPvWVsuhXMpy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 19, 2017 at 01:19:09PM -0800, Andre McCurdy wrote:
> On Tue, Dec 19, 2017 at 12:54 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Tue, Dec 19, 2017 at 12:11:48PM -0800, Saul Wold wrote:
> >> We have seen more failures, but have not been able to directly reprodu=
ce
> >> it maybe svaing the rootfs and it contains some content that is trippi=
ng
> >> up the e2fsprogs mkfs.ext4 populate_rootfs() function
> >>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >> ---
> >>  meta/classes/image_types.bbclass | 7 ++++++-
> >>  1 file changed, 6 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_typ=
es.bbclass
> >> index 9188bed4197..6b4f39ed274 100644
> >> --- a/meta/classes/image_types.bbclass
> >> +++ b/meta/classes/image_types.bbclass
> >> @@ -86,9 +86,14 @@ oe_mkext234fs () {
> >>       bbdebug 1 Executing "dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IM=
AGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=
=3D1024"
> >>       dd if=3D/dev/zero of=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME=
_SUFFIX}.$fstype seek=3D$ROOTFS_SIZE count=3D$COUNT bs=3D1024
> >>       bbdebug 1 "Actual Rootfs size:  `du -s ${IMAGE_ROOTFS}`"
> >> -     bbdebug 1 "Actual Partion size: `ls -s ${IMGDEPLOYDIR}/${IMAGE_N=
AME}${IMAGE_NAME_SUFFIX}.$fstype`"
> >> +     bbdebug 1 "Actual Partion size: `ls -l ${IMGDEPLOYDIR}/${IMAGE_N=
AME}${IMAGE_NAME_SUFFIX}.$fstype`"
> >>       bbdebug 1 Executing "mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOY=
DIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}"
> >>       mkfs.$fstype -F $extra_imagecmd ${IMGDEPLOYDIR}/${IMAGE_NAME}${I=
MAGE_NAME_SUFFIX}.$fstype -d ${IMAGE_ROOTFS}
> >> +     if [ $? -ne 0 ]; then
> >> +             tmp_saved_rootfs=3D`mktemp -d -p /tmp saved_rootfs.XXXXX`
> >> +             cp -r ${IMAGE_ROOTFS} $tmp_saved_rootfs
> >> +     fi
> >
> > Wouldn't it be better to just fail on error here, rather than dump stuff
> > to /tmp ?
>=20
> It already does fail with an error. Saving the state is temporary
> additional debug to help understand why.
>=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12304

So the problem is with the autobuilder where everything else gets blown
away.  That's fine, this is an autobuilder specific work-around, not a
general purpose patch and shouldn't be in mainline, would be my point.

--=20
Tom

--bNOIqPvWVsuhXMpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaOYKyAAoJEIf59jXTHXZSM8cQAK6VnYqPSnIwhchGJ+iTbxEW
gusQ3M0kb9p4o/7OXI4hVlf30+oBf4fU50pP8rHGaBiWTyEIYAdefQiwsrxkE2ww
q0zh0wte8+zaNjOewvTzwCdONfUvxUTtYXDRk80y1ox27KFTKD+ei3vKjS7j7BUZ
MsZjzHql7vBtNZmaE2w20IvuOiC3a1lG9jC1vgyLlKHzHUvGksx6mpsGFXKbOjuV
iDvylke84YenA+SmowEfhGWj4g6EyxGMkmhC16oVI2rlUhLPfthrSSLwMwiALqDv
KdSEiWARmVcoJAuQTCtij8pUqUgeDNBHw6rLW6CZEMtZmDaQ1ZichA8XDyp2LFNC
DZxhTlcne5aUmQGj4c13mb//NJfeLaKlvU5Lk8novR+3umC8V/q15RhE5chX7Yy+
dTHKYtojUox0BU9F+dqceQeoof7NWH8tkIWiqkcfVM3aCzU6RUo/zA6KbUP8Cp+r
JIIkibZzEySf12qU36cibqDe0DAKpf78KDDSToaNKTxR8P1MwHPLNfFMc8go1ssl
hkwA3Mu5KoHf5SqxLrRPy6bqCPH0eHw7gRFq1InsY7D5BNFQVCXImnKOgNhbVTpA
AYp7sAbIjYLpJBgSjQiNaKNw70nrGm+iFYWzA3REG5oNtIXQblvk+Lgxp+H2HZyJ
AjjQMvMeBfMjJ5SviYaN
=wZzL
-----END PGP SIGNATURE-----

--bNOIqPvWVsuhXMpy--
