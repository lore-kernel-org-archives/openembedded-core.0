Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 00B377DF13
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 12:20:01 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id q11so1284182ywb.0
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 05:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=H+nAnIxUlcLObcIanh1mLlNrayS5dOAJb/ORXbMLsPE=;
	b=Ke5ZTfzP7NGAVCNeWdzgLosUJzxteKFzCw2HUD0KMY97KZXGTRfKqckLypEk1XiLjh
	R1kS2cUk0UgzxidGA5fB2JTIndscnw9KS1hxwBhRsh4sFN+1n88smSMlcTWXpd9LtgKA
	kOPypnBhL2Xpfa6jRlUWclYcPQHzlQBiDGcHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=H+nAnIxUlcLObcIanh1mLlNrayS5dOAJb/ORXbMLsPE=;
	b=qBU8Q5XeUhdbkyz7rnd106TIQg6gcuB7rrSy+EKETtZAa9NlmpI4OvoSp5oohZ/pZ+
	mQyhDUoHNsynugirI2LrTKAxSd8LcAN8G8Wjyb7pzOeJ/2qFpuBrpo7n8NLE1qZc9kmL
	qAuIeaSDPo5JFSe7CKCPEuoG2gH9OlQ01VpWstJjbr3qec3YAIsak+Ckng+DKe4mo2L3
	UmeoR7ST1LQtik2q2cgYKANpeSV5NipibdUhe0uTLCT/fQPVWkB1o77NyOb2nEkKbLun
	NTRpUOass8csKarFqISk4tv7KyB7rTCEijEc9aUDmyUlamlJkmhZGcjLd6qF2I2CuCOj
	RAFQ==
X-Gm-Message-State: APjAAAVP/s9kUywhJ0m/oe6tbYue2W7QzBEjEOQitokrpTR3kTxkJc0q
	eleZpGH9m+58+XQtJ9a+0xNUTKpGCRWP6w==
X-Google-Smtp-Source: APXvYqwpDFgluzrEIMZtCeF1QXhi4IGeyw27aY8Qh6pOhxuj+fFiAfmalNC4cc+M3juWKDJ4Im7JtA==
X-Received: by 2002:a81:ac4f:: with SMTP id z15mr20418340ywj.324.1558009202436;
	Thu, 16 May 2019 05:20:02 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	v144sm1764056ywv.15.2019.05.16.05.20.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 05:20:01 -0700 (PDT)
Date: Thu, 16 May 2019 08:19:59 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Message-ID: <20190516121959.GT22232@bill-the-cat>
References: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
	<20190516023759.GP22232@bill-the-cat>
	<04877C8C-9026-4832-9B81-49E0B07DB163@intel.com>
MIME-Version: 1.0
In-Reply-To: <04877C8C-9026-4832-9B81-49E0B07DB163@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] add wic based image installer
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
X-List-Received-Date: Thu, 16 May 2019 12:20:02 -0000
X-Groupsio-MsgNum: 124514
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sKHNLc4rGJHGY5Sn"
Content-Disposition: inline

--sKHNLc4rGJHGY5Sn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 11:48:02AM +0000, Lee, Chee Yang wrote:

> I couldn=E2=80=99t figure out how to make it with sdimage-bootpart.wks, c=
an
> you tell me what did you set for IMAGE_BOOT_FILES ?
>=20
> To further explain the idea,  I'm trying to use the new source plugin
> and .wks.in to build a wic image that "mimic" a hddimg, where I can dd
> the wic image to an USB drive and use that usb drive to install image
> to my target machine (like hddimg did ).=20
> first partition allow to boot into initramfs and it will execute the
> install script. The script will then install system-boot
> configuration, efi, kernel, rootfs.img and initrd from second
> partition to target machine.=20
>=20
> My sample image here:=20
> https://drive.google.com/file/d/1c1FCJ2ghWNzsXK1zbOAVz1bz6G3H5zx5/view?us=
p=3Dsharing

OK, so some cleaned up snippets from the installer image recipe:
# List of external things we must have had complete.
do_rootfs[depends] +=3D "core-image-minimal-initramfs:do_image_complete"
do_rootfs[depends] +=3D "full-image-to-install:do_image_complete"
do_rootfs[depends] +=3D "grub-efi:do_deploy"
do_rootfs[depends] +=3D "virtual/kernel:do_deploy"

WKS_FILE =3D "sdimage-bootpart.wks"

IMAGE_BOOT_FILES_append =3D "\
    ${KERNEL_IMAGETYPE};EFI/BOOT/${KERNEL_IMAGETYPE} \
    core-image-minimal-initramfs-${MACHINE}.cpio.gz;EFI/BOOT/initrd \
    full-image-to-install-${MACHINE}.wic.xz;rootfs.img \
    grub-efi-bootx64.efi;EFI/BOOT/bootx64.efi \
    grub-installer.cfg;EFI/BOOT/grub.cfg \
    "

And note that I reworked the installer for our case to write then update
the real image's wic image rather than copy contents and then modify
files due to other constraints (this project is also why I was pushing
various changes to meta-secure-core).

>=20
>=20
> =EF=BB=BFOn 5/16/19, 10:38 AM, "Tom Rini" <trini@konsulko.com> wrote:
>=20
>     On Thu, May 16, 2019 at 02:23:05AM +0000, Lee, Chee Yang wrote:
>     > Hi Tom,=20
>     >=20
>     > Would you mind to share with me how you make the installer image us=
ing wic?=20
>    =20
>     I ended up using sdimage-bootpart.wks and IMAGE_BOOT_FILES to populate
>     the partition as needed.  I can't paste the exact image as it was done
>     for a customer.
>    =20
>     >=20
>     >     -------- Forwarded Message --------
>     >     From: Tom Rini <trini@konsulko.com>
>     >     To: chee.yang.lee@intel.com
>     >     Cc: openembedded-core@lists.openembedded.org
>     >     Subject: Re: [OE-core] [PATCH 0/4] add wic based image installer
>     >     Date: Wed, 15 May 2019 11:33:43 -0400
>     >    =20
>     >     On Wed, May 08, 2019 at 02:40:58PM +0800, chee.yang.lee@intel.c=
om
>     >     wrote:
>     >    =20
>     >     > From: Chee Yang Lee <chee.yang.lee@intel.com>
>     >     >=20
>     >     > Existing installable image (hddimg/ISO) has limit of 4GB size=
, so to
>     >     > build larger installable image, we can build it in wic based =
image.
>     >     >=20
>     >     > 2 partition needed for installable image
>     >     >  - first partition build using source plugin bootimg-efi and
>     >     > configure to run install
>     >     >  - second partition build with root.img, systemd-boot and ker=
nel to
>     >     > be install on target machine (this partition build using new =
source
>     >     > plugin installer-partition)
>     >     >=20
>     >     > These patches:
>     >     >  - add new source plugin for second partition
>     >     >  - add new .wks
>     >     >  - add new wic dependency and set default value for required =
variable
>     >     >  - allow source plugin bootimg-efi to configure to install
>     >     >=20
>     >     >=20
>     >     > To build the image, set WKS_FILE=3D"wic-installer.wks.in" in
>     >     > local.conf.
>     >    =20
>     >     I'm confused as to why we need most of these changes to support=
 the end
>     >     goal.  The enhancement to bootimg-efi makes conceptual sense.  =
I don't
>     >     see why we need a new plugin to do the rest, however.  What's b=
eing
>     >     done
>     >     here that we don't already do today?  I say this having made in=
staller
>     >     images for EFI machines using wic (in sumo, even).  Thanks!
>     >    =20
>     >     --=20
>     >     Tom
>     >     --=20
>     >     _______________________________________________
>     >     Openembedded-core mailing list
>     >     Openembedded-core@lists.openembedded.org
>     >     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     >    =20
>     >    =20
>     >=20
>    =20
>     --=20
>     Tom
>    =20
>=20

--=20
Tom

--sKHNLc4rGJHGY5Sn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc3VVvAAoJEIf59jXTHXZSHnkP/RHrFz220KejSopG7c8YZtr3
wDCq7MnYoFZ10aDuSov3stOnbQQk88FCl4peInssmWCmnzXQVmqchpsVlULDVAT3
ODz/sjhkuptgZLTxOMYKtz1DV56X8f3FBy8xKFismRv2KgJrpz91lh9FFOcqhL1o
QjQqQaxhz5Rsl8YD+PSgoK8Koc2ImJRkJWW/MC1qwJq1c8bL/HAngfvjOAlaoYk7
VF7vEAtlC9kKwGw+/H2zGFxmH2ZU44KXoKQX608t+LWj51EmqEDkYBGBNCswGc8m
XZEvYphtpJUrUAMYrbEl6KuHO9vXrK255YO737pe/TaEeLaZfzWwTt/dZa66Rc29
m0PEZr6ctlJi9GB9lzmwqh3fpEr7qz5yOuvWvEEFH5iOMORl28XQBAFmaPbrhZt4
nrh40ws26lbs/Pmwn7HLVrC88nhTG08zU192dzYfqQ4Uo01VduhsdKtjJiSyCegk
rjjejYrGuiavp3PPaVwhhibh9CxLkP3abdowfuM32fOCQBePLcVupUhH5LqqxECv
DWKTKsB9qF4uVRSysZ4eIHYyTNAUOVJsuLEV5kb+0npfrnhegnFU0y2VwslfPFfp
YrOqA0Ir45hxpdiMY2r7Fg0Fkg3hsMqcV81GLfNW6EHwPyqrgPYU6G95B0yfvvBd
oYvVYrgfJ/jHKrlupt4Q
=gH9R
-----END PGP SIGNATURE-----

--sKHNLc4rGJHGY5Sn--
