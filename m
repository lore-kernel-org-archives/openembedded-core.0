Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7C881751AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 02:26:11 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id m62-v6so725193ywd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 19:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=L3TgyehSowPcg7lo1EacKE7bH4dvBRuHEiI6DBBgII0=;
	b=hL2QvB8Syn3PxVCx9R5pHWG1o6hv8Dq9ylORXvNcSir/x2yjYuFEqhspBwbLZLmiRx
	Qbc1GzjDofGlfULKhN2oYyL0LRIuD3wj4ATK2Tj7tBOHXGFZ48+RyQypge1GoukoXy23
	6E6XA8stpG0Hvg8J3Xuzza0euqE2yHzCzT6Zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=L3TgyehSowPcg7lo1EacKE7bH4dvBRuHEiI6DBBgII0=;
	b=LEf+kxjQ8T1UjIfqvm3CpgsiS2kLnY1Zx7iGBXWSAd+7u3BiRolre/W+fJdyCjI0Fv
	3sMOlX4HEKr15tbSCvXcr/fLSAxhQb2ZNutLc80fDtuoqkDrVYB+IDgaMJox8LBWzbcq
	ZhdtXMyPfIhuoYvxtd7jdvVtYP6szz7pvo0n8SSL3TGyCpVSt9FjxLA2StVdaZxjOahk
	Cn/oFQgKUHLTPYTEJ+sibWdQF1S6x7MQ1rT65VX/PeJ0MuMqOzcdOg7mqPMo0yfJ5LnB
	v7x+JB4qaSg7Fr9tvbjmqVGcjzxq0Zi2g94BDGT4ZSXu/WRaAf1Qkj0iJ/K85zphp9n+
	gn5g==
X-Gm-Message-State: APzg51BPxz2pOqGJ6lvt2yXnsRsG6zGqR2HH7RYLowhlxU5y8BxZiad6
	/Gf3I3VGT94Wxe0/K3pPWEiKtg==
X-Google-Smtp-Source: ANB0VdZ61SEoVTR+8i2kdQapTPgAat9Ct5w8YHCIbhDkdLghz+L8YfPpjReJRl2Xav9J6WNPFgBqpA==
X-Received: by 2002:a0d:dcc1:: with SMTP id
	f184-v6mr16784035ywe.26.1536027972190; 
	Mon, 03 Sep 2018 19:26:12 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	u196-v6sm7107288ywg.68.2018.09.03.19.26.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Sep 2018 19:26:11 -0700 (PDT)
Date: Mon, 3 Sep 2018 22:26:09 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180904022609.GL26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<1535681710-29461-7-git-send-email-lu.jiang@windriver.com>
	<20180831135228.GN26633@bill-the-cat>
	<3b8b5b68-5cdc-eddf-59c4-4ff70d00c551@windriver.com>
	<ea8d1d09-85f9-503a-49c7-8e21bcaafe5b@windriver.com>
MIME-Version: 1.0
In-Reply-To: <ea8d1d09-85f9-503a-49c7-8e21bcaafe5b@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/7] wic:bootimg-efi:try other place for efi
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
X-List-Received-Date: Tue, 04 Sep 2018 02:26:11 -0000
X-Groupsio-MsgNum: 115761
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+8XPytYapRN8cRkF"
Content-Disposition: inline

--+8XPytYapRN8cRkF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 04, 2018 at 10:15:44AM +0800, Lu.Jiang wrote:
>=20
> =E5=9C=A8 2018=E5=B9=B409=E6=9C=8803=E6=97=A5 10:01, Lu.Jiang =E5=86=99=
=E9=81=93:
> >=E5=9C=A8 2018=E5=B9=B408=E6=9C=8831=E6=97=A5 21:52, Tom Rini =E5=86=99=
=E9=81=93:
> >>On Fri, Aug 31, 2018 at 10:15:09AM +0800, Jiang Lu wrote:
> >>
> >>>When there is no useful efi in $kerneldir, try copy
> >>>all efi from EFI/BOOT into boot image.
> >>>
> >>>Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
> >>>---
> >>>=C2=A0 .../wic/files/wic/plugins/source/bootimg-efi.py | 12 ++++++++++=
++
> >>>=C2=A0 1 file changed, 12 insertions(+)
> >>>
> >>>diff --git
> >>>a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>index 0eb86a0..d435268 100644
> >>>--- a/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>+++ b/meta/recipes-support/wic/files/wic/plugins/source/bootimg-efi.py
> >>>@@ -231,6 +231,18 @@ class BootimgEFIPlugin(SourcePlugin):
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else:
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 raise WicError("unrecognized bootimg-efi =
loader: %s"
> >>>%
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 source_params['loader'])
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os=
=2Elistdir("%s/EFI/BOOT/" % hdddir)
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
und_efi =3D False
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fo=
r x in os.listdir("%s/EFI/BOOT/" % hdddir) :
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if x.endswith(".efi"):
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 found_efi =3D True
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 not found_efi:
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 cp_cmd =3D "cp %s/EFI/BOOT/*.efi %s/EFI/BOOT/" %
> >>>(kernel_dir, hdddir)
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 try:
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec_cmd(cp_cmd, True)
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 except:
> >>>+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pass
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 except KeyError:
> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 raise WicError("bootimg-efi requires a loader, none
> >>>specified")
> >>I'm not sure this is the right approach.=C2=A0 If you don't have things=
 set
> >>up for automagic finding you should use bootimg-partition and
> >>IMAGE_BOOT_FILES.=C2=A0 I'm doing this right now for some EFI projects
> >>because it's also bad form to dump everything into EFI/BOOT and some
> >>things should end up in EFI/vendorname or similar.
> >>
>=20
> Hi Tom,
>=20
> By indicating IMAGE_BOOT_FILES for bootimg-partition, can perform copy fi=
le
> work. While we still need the code in bootimg-efi to re-generate grub.cfg.
>=20
> I prefer use bootimg-efi for this case, but we can add a new parameter to
> distinguish kernel dir & bootloader dir(for efi files)

I'm still not seeing why we need this, sorry.

If we need files in the ESP in EFI/BOOT/ then in our root filesystem
they're already in as /boot/efi/EFI/BOOT and we say that we populate
things from /boot/efi and this also gets us things like
/boot/efi/EFI/vendor and so forth populated and matches other Linux
distributions.

If we need something more complex, we have IMAGE_BOOT_FILES available
and can and should be populating the deploy directory like other
architectures and loaders do.

--=20
Tom

--+8XPytYapRN8cRkF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbje1BAAoJEIf59jXTHXZSLs8P/ikmIa5Bjes8j7Y78eZluX5l
l/idBKMcZEiwW6KwgUoo8M75f7ZaZDSSjOaXbhqhdzk6vNXiqyDkKWpWkOZ7UMk7
GpM1LRyT3JR0vLH3iCt2bVllLNG7zcogIti/SLCcd86oqlPoJm+SO9js8nj7yV1n
xPhJfxJvsLHYi8XnKz2qFkQcu3QtHja0S2aqHjYPxgHaPdqX3eorOzL7LcuZhC9G
R+ZFgeF91FqaQf/KsRSOurNw5mAPIptWF4/Fjcd8pPMtEy+y1sYyB1ID1Gntdgbe
giQBc+xHVvvBvvNsswdm6qb5GUOF2q60c2vnX6lyRIhob/wkmNqz3cZnBCbjH7CV
/+Hu3/vubzwTTPyBEjqE1pUnEHUL/PEc+bbvqmplVqhaRyUvlgEYYZw+25U5OUBh
hXbbiaAn4/gBMKhidnjqV6vOAn2tQHLZJt8c2dl8QC2Q1gttF2siNPpNNfOq7e4x
HbtMpvd/ijLqXhKWIDf9ykcYhDguAu2BjfSr8QjEeEkHqXioOQ3XMpUPHgaPCwLo
wiI4g0jb32Xwr1xIH/ZyH7omGZP+Gy4qAVCzXdtnl5pMJCRpNWXasrO3G2eP5zUv
770SfHpy13O0EETMvoG751kD0m55b5p6Iay3lEkJIKerJcMv2tGsQLO81iicnhv/
pnSbqbpmDCRIX5f9Jbi4
=rG8i
-----END PGP SIGNATURE-----

--+8XPytYapRN8cRkF--
