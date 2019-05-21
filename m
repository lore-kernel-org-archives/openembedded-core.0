Return-Path: <trini@konsulko.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id A56A27E274
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 14:13:59 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id x24so381019ion.5
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=85dYIxXs+adUypACCO+419CAB0YfgZhkQ3pOhRlKDvs=;
	b=KSp0qhNWIdOiE9TmWhbfQU8kVDd+dC/I/jd8hWQZZMZpeP0ZG+Wf9VO41OyfHK7Yd+
	NhTClXWe2ExH6JXbUozRK9xtHAnVjjLSIBaA/SCbl8tW4LAfoN+ZUJEIITb6Vqk5oXDu
	Xm35h6v25aG/tTWSe4m7HEOeRQvSE5+y16D5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=85dYIxXs+adUypACCO+419CAB0YfgZhkQ3pOhRlKDvs=;
	b=eXKZP8EfGLVEgd0u1pvmdQNmcxB7xFMx30GPa93mYIO915h9DKWmfHmQJOg1YL9HMm
	0oCKdWGBO/sDxqewtx6aIic8KGTn269J3djeI5vumZC6Qjn1FM6hNYYIarkNzaIFVf86
	OaH/mwejRXyoc56opTlK8/OJWjvVFEL3cCXQg6hIkmuTXH+iKobTLqHQYtmiLqu6DFQT
	sYhtUVfHsv60p+cMMUwVEykQ4CWFO7JAfub1eeNnKzSbKHy4YjezXFeHm/O2w4sbaS/+
	CLgENqoc8q6KJK3mNA04K9AcVaCg6MD8VsWb0+QkM0s6wXkMvRuADsBMOPnPXySkn6T+
	gk9A==
X-Gm-Message-State: APjAAAXOEEfr9YVAdzeYU8tJoqZXuJW2eQ3CMLskejCsSRV2ClU45PPS
	4bxaF0OGys5PaN0nEUYkLAJV9Q==
X-Google-Smtp-Source: APXvYqx4hZ5mmAkgL905rrZImi+ZvyRBp0/a3CBd5YEaF8h42F0HrzVLTQs44gW8tUZTG/oiIWIZog==
X-Received: by 2002:a5e:990f:: with SMTP id t15mr8163850ioj.182.1558448040339; 
	Tue, 21 May 2019 07:14:00 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147])
	by smtp.gmail.com with ESMTPSA id j5sm1300274ita.16.2019.05.21.07.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 07:13:59 -0700 (PDT)
Date: Tue, 21 May 2019 10:13:56 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lee, Chee Yang" <chee.yang.lee@intel.com>
Message-ID: <20190521141356.GH22232@bill-the-cat>
References: <F8C782DB-A692-407F-A6DF-AFAC51D14854@intel.com>
	<20190516023759.GP22232@bill-the-cat>
	<04877C8C-9026-4832-9B81-49E0B07DB163@intel.com>
	<20190516121959.GT22232@bill-the-cat>
	<D9DC9B27-ED05-4463-BCD6-F389587C7985@intel.com>
MIME-Version: 1.0
In-Reply-To: <D9DC9B27-ED05-4463-BCD6-F389587C7985@intel.com>
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
X-List-Received-Date: Tue, 21 May 2019 14:13:59 -0000
X-Groupsio-MsgNum: 124792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2A9w/LA8eksItR+6"
Content-Disposition: inline

--2A9w/LA8eksItR+6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks!  FWIW, I really think an installer improvement would be go to
=66rom "copy image contents to install media, update slightly" to
"write compressed image to disk (use bmaptool to handle decomp), update
a few things like UUIDs".  This would buy us a lot of space as a .xz
compressed image is going to tend to be a lot smaller than 4GB, even
with a ton of things in it.

On Tue, May 21, 2019 at 07:46:52AM +0000, Lee, Chee Yang wrote:
> Tom, Thanks for the sharing
> I try out this method and it works=20
> however I notice that sdimage-bootpart.wks format bootimg-partition with =
vfat still limit the rootfs.img size to 4GB.
> Anyway, with the similar trick and using a new .wks with combination of 2=
 partition below could build the installer image for image greater than 4GB.
> - bootimg-efi with "wic: bootimg-efi: add label source parameter" patch=
=20
> - bootimg-partition ( format in ext4 )=20
> so I think it would be great to keep the enhancement for bootimg-efi whil=
e ignore the other 3 patches.=20
>=20
>=20
> =EF=BB=BFOn 5/16/19, 8:20 PM, "Tom Rini" <trini@konsulko.com> wrote:
>=20
>     On Thu, May 16, 2019 at 11:48:02AM +0000, Lee, Chee Yang wrote:
>    =20
>     > I couldn=E2=80=99t figure out how to make it with sdimage-bootpart.=
wks, can
>     > you tell me what did you set for IMAGE_BOOT_FILES ?
>     >=20
>     > To further explain the idea,  I'm trying to use the new source plug=
in
>     > and .wks.in to build a wic image that "mimic" a hddimg, where I can=
 dd
>     > the wic image to an USB drive and use that usb drive to install ima=
ge
>     > to my target machine (like hddimg did ).=20
>     > first partition allow to boot into initramfs and it will execute the
>     > install script. The script will then install system-boot
>     > configuration, efi, kernel, rootfs.img and initrd from second
>     > partition to target machine.=20
>     >=20
>     > My sample image here:=20
>     > https://drive.google.com/file/d/1c1FCJ2ghWNzsXK1zbOAVz1bz6G3H5zx5/v=
iew?usp=3Dsharing
>    =20
>     OK, so some cleaned up snippets from the installer image recipe:
>     # List of external things we must have had complete.
>     do_rootfs[depends] +=3D "core-image-minimal-initramfs:do_image_comple=
te"
>     do_rootfs[depends] +=3D "full-image-to-install:do_image_complete"
>     do_rootfs[depends] +=3D "grub-efi:do_deploy"
>     do_rootfs[depends] +=3D "virtual/kernel:do_deploy"
>    =20
>     WKS_FILE =3D "sdimage-bootpart.wks"
>    =20
>     IMAGE_BOOT_FILES_append =3D "\
>         ${KERNEL_IMAGETYPE};EFI/BOOT/${KERNEL_IMAGETYPE} \
>         core-image-minimal-initramfs-${MACHINE}.cpio.gz;EFI/BOOT/initrd \
>         full-image-to-install-${MACHINE}.wic.xz;rootfs.img \
>         grub-efi-bootx64.efi;EFI/BOOT/bootx64.efi \
>         grub-installer.cfg;EFI/BOOT/grub.cfg \
>         "
>    =20
>     And note that I reworked the installer for our case to write then upd=
ate
>     the real image's wic image rather than copy contents and then modify
>     files due to other constraints (this project is also why I was pushing
>     various changes to meta-secure-core).
>    =20
>     >=20
>     >=20
>     > =EF=BB=BFOn 5/16/19, 10:38 AM, "Tom Rini" <trini@konsulko.com> wrot=
e:
>     >=20
>     >     On Thu, May 16, 2019 at 02:23:05AM +0000, Lee, Chee Yang wrote:
>     >     > Hi Tom,=20
>     >     >=20
>     >     > Would you mind to share with me how you make the installer im=
age using wic?=20
>     >    =20
>     >     I ended up using sdimage-bootpart.wks and IMAGE_BOOT_FILES to p=
opulate
>     >     the partition as needed.  I can't paste the exact image as it w=
as done
>     >     for a customer.
>     >    =20
>     >     >=20
>     >     >     -------- Forwarded Message --------
>     >     >     From: Tom Rini <trini@konsulko.com>
>     >     >     To: chee.yang.lee@intel.com
>     >     >     Cc: openembedded-core@lists.openembedded.org
>     >     >     Subject: Re: [OE-core] [PATCH 0/4] add wic based image in=
staller
>     >     >     Date: Wed, 15 May 2019 11:33:43 -0400
>     >     >    =20
>     >     >     On Wed, May 08, 2019 at 02:40:58PM +0800, chee.yang.lee@i=
ntel.com
>     >     >     wrote:
>     >     >    =20
>     >     >     > From: Chee Yang Lee <chee.yang.lee@intel.com>
>     >     >     >=20
>     >     >     > Existing installable image (hddimg/ISO) has limit of 4G=
B size, so to
>     >     >     > build larger installable image, we can build it in wic =
based image.
>     >     >     >=20
>     >     >     > 2 partition needed for installable image
>     >     >     >  - first partition build using source plugin bootimg-ef=
i and
>     >     >     > configure to run install
>     >     >     >  - second partition build with root.img, systemd-boot a=
nd kernel to
>     >     >     > be install on target machine (this partition build usin=
g new source
>     >     >     > plugin installer-partition)
>     >     >     >=20
>     >     >     > These patches:
>     >     >     >  - add new source plugin for second partition
>     >     >     >  - add new .wks
>     >     >     >  - add new wic dependency and set default value for req=
uired variable
>     >     >     >  - allow source plugin bootimg-efi to configure to inst=
all
>     >     >     >=20
>     >     >     >=20
>     >     >     > To build the image, set WKS_FILE=3D"wic-installer.wks.i=
n" in
>     >     >     > local.conf.
>     >     >    =20
>     >     >     I'm confused as to why we need most of these changes to s=
upport the end
>     >     >     goal.  The enhancement to bootimg-efi makes conceptual se=
nse.  I don't
>     >     >     see why we need a new plugin to do the rest, however.  Wh=
at's being
>     >     >     done
>     >     >     here that we don't already do today?  I say this having m=
ade installer
>     >     >     images for EFI machines using wic (in sumo, even).  Thank=
s!
>     >     >    =20
>     >     >     --=20
>     >     >     Tom
>     >     >     --=20
>     >     >     _______________________________________________
>     >     >     Openembedded-core mailing list
>     >     >     Openembedded-core@lists.openembedded.org
>     >     >     http://lists.openembedded.org/mailman/listinfo/openembedd=
ed-core
>     >     >    =20
>     >     >    =20
>     >     >=20
>     >    =20
>     >     --=20
>     >     Tom
>     >    =20
>     >=20
>    =20
>     --=20
>     Tom
>    =20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Tom

--2A9w/LA8eksItR+6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc5AekAAoJEIf59jXTHXZSGTkQAKABYqvpJW5wbDZMvnfhWG5J
gsrNZqM4GbIHBxxed8RlZZ9uMLeA59uFwWiQu1IzIc4xTMd6jZk2HTLPNyh1X/Kg
exeeLMCfMx+SeP50RjiyHslFxz3Ml0gLZowEidkoCwWDwsjyaE15qTXMO7JpGtMp
huUof9SfRWE30EprqDGMcyHjWcebhtyX3xkOsdosWEZGgxr3RCbdsUUhxpGoq9+P
EShEpjZ4URP01D5yYyzsGPt2QbrwY+8j+2bjAUQis8hye4G59p7djeYbTboDqw9e
H1SzDq+tZ0rwdaVkwyouZlGhXVkDWsmZ5O7KRi1/0vovKlZKW8wwuh+2zMzdd2Fw
/Gob6i24lMD/+HXVMbdiQ2U8O2SSrj6B5zmtiCUFCwMplgBc+QdGY4L1wZrnfFzy
ri20GlXs4xIgQI/lfLbsg0DyAAruDb8DQQ/iftgJRWvbLWVotXxjGIZ/2gXIbhcy
GEJDZubFPzXGyf8YHVEZ1B1IU3/HZguEDfsfgtrcJSFTiyedZu83mvwtE/luw/bq
is7ALU65b40+0Zm38pmw0wOeKy3TMs0MPqJfeFrayLrEULIMqSxVXe8GAkqqY9jw
aBKbtGcqiMfyc6N9DKbitIT9rvqIEMNF6RWAZC9r2TKLf7h4j4onjOTyzndaPwTK
D3Sgiyggbmv+j/JgmueZ
=wW48
-----END PGP SIGNATURE-----

--2A9w/LA8eksItR+6--
