Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web12.3078.1628245782373102956
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 03:29:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=ZFEBaIp6;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.26, mailfrom: paul@pbarker.dev)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 37EF35C0150;
	Fri,  6 Aug 2021 06:29:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 06 Aug 2021 06:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type; s=fm1; bh=WhHBzDqW7d5yR8FSAX6Nwc4djd
	mY3+bXxCizJ9j2r4A=; b=ZFEBaIp6EhU0QROeBNERSLq8XcyirUo4QRH86fBwrp
	0dTn2VuJ1KbsvtgaIhlR3wUzpKjeKvojtsSOkaRDRjIa1S3SaApvQUh1ZaAfFAP7
	hFFXXMk3r/QdXzvnrmgkxEffxfAsdbaEznrXNaU+lfEZ1B4eB2t05ROeRULTXqYi
	0Igx98KoxDDQvRS7UY9fl0x6yPHJ4umH8hdaHA9SpKkb/3gfr+NWMzFAzU5iOf9Y
	hQhowr9f9bg7WAz3IWMaiEn1tT82/sRjtF9sTdre6pf4GQOEkZd6sLG9c6vob3TC
	O+tRRUeXqZA+yAgA9Tg08/15pEPbMFUWqRaPAsw+86yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WhHBzD
	qW7d5yR8FSAX6Nwc4djdmY3+bXxCizJ9j2r4A=; b=Bwuja81V/edZfxXMWKkS0r
	EEPykS4WkeWWouDT3LuxY4fBb8sx7mBKsvxBExweHrIEG5bege/JgFYmMPUvyLhP
	ugYmSsApxYllIzuoLLgchbfspav/0UFa9TGt4Cm1WXNVRshek2Te1mBsfvbPfoRZ
	N0Upyf8/U6nfVacICeb2v6PByaKzgtzjJwveKUPbJT+40oGB2hwl3puE7hS7xC9+
	WA4T5mzEhT7iXOh/n2/8qYnGFllm3CGPbtQIOJ9gryTPHdqqrXFhGUfV0QU1fQHM
	K3BFlfkbsPMlrma4SBkzcqbcJJBqPE+EdYvyNm2ShmEIX2W2ufUkN4kR4JphsSFA
	==
X-ME-Sender: <xms:FA8NYf8Ia2BXN-ZOpgygjn0_VV7E0SHkc7VoYuvAShS_oU4rOl5ZEQ>
    <xme:FA8NYbsKsuw-68saeaMz1DuZtmLNOM5-7iVbtd460gjFQ0SWzVFVGXVPeKK5KUZ0N
    MZOuWfphxp5p3PsW3M>
X-ME-Received: <xmr:FA8NYdDrNsPoFDTCDNN_GVsc4qBeDsRYMEsaf23pCvgD4kPaMjSHjOpg_iI0L7vdsxZfvG0EVVBr0PoAgPbd9dXuWTk4YHQpZNLTYLTiky0qK6IU9IrpqxUQ0Uk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedugddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epheetjeeihfehleefhfejheeftedttdehueffieefjeefgedvvdeuueffieetuedvnecu
    ffhomhgrihhnpehpsggrrhhkvghrrdguvghvnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghv
X-ME-Proxy: <xmx:FA8NYbez4n7p3VFFLZRH0DLk3BV6aW20sabGMlC6Sc9aeVgM2WbKYw>
    <xmx:FA8NYUOz9E52dJmALuElwKlE0wSjt-BWAf-YFNGxkPuEU7k9cteWJw>
    <xmx:FA8NYdkh6VOyXqUFskETZgwYAfai3t2JRUNrWQgLVpTWRFRBI3p53w>
    <xmx:FQ8NYdbFW2sLyJBbbY55yrJQjEDkz5z1B69rV6kbxMEOP75p2UocwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Aug 2021 06:29:39 -0400 (EDT)
Date: Fri, 6 Aug 2021 11:29:24 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-core@lists.openembedded.org, dagmcr@gmail.com,
 richard.purdie@linuxfoundation.org
Subject: Re: [OE-core][RFC][PATCH][dunfell] wic: Add --use-stock-fstab option
Message-ID: <20210806112924.61ba4c80.paul@pbarker.dev>
In-Reply-To: <20210806092337.81924-1-daniel@qtec.com>
References: <f5204c03e3394a38e6663e56b0072d9d65bcc34d.camel@linuxfoundation.org>
	<20210806092337.81924-1-daniel@qtec.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Groupsio-MsgNum: 154545
Content-Type: multipart/signed; boundary="Sig_/XhYX0Z_ci3tW8J0He1AFZPB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/XhYX0Z_ci3tW8J0He1AFZPB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri,  6 Aug 2021 11:23:37 +0200
Daniel Gomez <daniel@qtec.com> wrote:

> When embeddding rootfs image (e.g. 'rootfs-dir') as a partition we
> might want to keep the stock fstab for that image. In such case, use
> this option to not update the fstab and use the stock one instead.
>=20
> This option allows to specify which partitions get the updated fstab
> and which get the stock fstab.
>=20
> Example:
>     part /export --source rootfs --rootfs-dir=3Dhockeycam-image
>     --fstype=3Dext4 --label export --align 1024 --use-stock-fstab
>=20
>     part / --source rootfs --fstype=3Dext4 --label rootfs --align 1024
>=20
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>=20
> The commit-id ce682a73b7447652f898ce1d1d0416a456df5416 reverted the
> functionality to restore the stock/original fstab file in a rootfs
> partition image (wic plugin).
>=20
> Add back such functionality with an option to the user to select which
> fstab will be used for each partition by adding the --use-stock-fstab.
> In this case, the user will select whether or not the stock fstab will
> be updated or kept.
>=20
> If you agree with the patch I'll adapt it to the master branch.
>=20
> Daniel
>=20
>  scripts/lib/wic/ksparser.py  | 1 +
>  scripts/lib/wic/partition.py | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 452a160232..64933e0a5b 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -184,6 +184,7 @@ class KickStart():
>          part.add_argument('--use-uuid', action=3D'store_true')
>          part.add_argument('--uuid')
>          part.add_argument('--fsuuid')
> +        part.add_argument('--use-stock-fstab', action=3D'store_true')
>=20
>          bootloader =3D subparsers.add_parser('bootloader')
>          bootloader.add_argument('--append')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 85f9847047..c9e45773de 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -54,6 +54,7 @@ class Partition():
>          self.uuid =3D args.uuid
>          self.fsuuid =3D args.fsuuid
>          self.type =3D args.type
> +        self.use_stock_fstab =3D args.use_stock_fstab
>          self.updated_fstab_path =3D None
>          self.has_fstab =3D False
>          self.update_fstab_in_rootfs =3D False
> @@ -286,7 +287,7 @@ class Partition():
>              (self.fstype, extraopts, rootfs, label_str, self.fsuuid, roo=
tfs_dir)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
>=20
> -        if self.updated_fstab_path and self.has_fstab:
> +        if self.updated_fstab_path and self.has_fstab and not self.use_s=
tock_fstab:
>              debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
>              with open(debugfs_script_path, "w") as f:
>                  f.write("cd etc\n")
> --
> 2.30.2
>=20

You're only addressing ext2/3/4 partitions here. The patch needs to be
extended to cover the msdos partition case and the
update_fstab_in_rootfs case in the rootfs source plugin.

I also recommend changing the option in ksparser to '--no-fstab-update'
to match the argument you can pass to wic itself. That way you can pass
'--no-fstab-update' to wic to set the option for all partitions, or
include it in the wks file to set the option per-partition.

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/XhYX0Z_ci3tW8J0He1AFZPB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYQ0PBAAKCRCrY1Tsnbr0
brffAP9fA8F/ZXypgQth87Z4FRriTPwm/DnJxu2MeXvBz0X8uwD9GCYvjRy2W8PC
6mL5mpZgWZ5iBqZf+ZpQBbxXjmtfQQg=
=QJCv
-----END PGP SIGNATURE-----

--Sig_/XhYX0Z_ci3tW8J0He1AFZPB--
