Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
 by mx.groups.io with SMTP id smtpd.web09.249.1628601930797018707
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=uH6XGlCp;
 spf=pass (domain: pbarker.dev, ip: 64.147.123.20, mailfrom: paul@pbarker.dev)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id E6F683200312;
	Tue, 10 Aug 2021 09:25:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 10 Aug 2021 09:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type; s=fm1; bh=KRB02XuHkOUGblY01L3KL7Jh2Q
	sEmn3PYjIvMP34W0k=; b=uH6XGlCpVPSIfydRYoloEJ7DFsBh1QPvpbRYZP2aCS
	Qdef6LABBkgfviHDC7wspduqv3D6/lB3vu55+d9GT2ZBUU4gZJZDb8+8Ran6LbSf
	03TKX3vNG8KY4xOTRFsx8k3VKWoCyNnu8WnhE/Nzma/bPyyqcUt+LDZabg1K7UD0
	7xQCmAKnnAzJSn0T6M8VS1lbNaaxGLTkrZuBbu+pmO9awADvJui0zAGDVwPOpgko
	yfB9dMJBblmjf9Dhbkw5XcDE7KkyatzQaksm0Drt1iWe0n9qVHm7T+85wpskxcqQ
	bPpGRXirfTuVtdqJ6PDf5YT2LGX7WzBCBXh2mDV7y8KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KRB02X
	uHkOUGblY01L3KL7Jh2QsEmn3PYjIvMP34W0k=; b=JgMjVsjioTLrT4xZaaYCZD
	Ogm5Jiz0Pj4yZ8nGS9b0kTNaktX5IPhlApqOj6l7m6Rwq2vFa3nmuKqYkiDII10T
	i33OxrZwnzPodzGCZO1XK9J4kDjpJZ1hZDcoeZFAnjQdyATb9b4twRDfoqVzNCog
	BaEhBxs97SCvdv8osEM1TZEfGdhQC4a10exk3NqILC4ruSDKX4QZkDDdJsHbrU3F
	9a+ktAa/6zrdLueV034tVGjOir43MY75vCQYyVAfbC3WZtk39BLlSWCIO6pLxhp2
	4ZyCKYugOxRmr6wNLEa7lOXdhTi+9k8OZtZgmRhDad6svt7jYU6ZiJnmQn1KX8jg
	==
X-ME-Sender: <xms:SX4SYYs6OSon4N-qmCmasVEjFYYluBhcbceMRNM8cA0XxJWm1F4dzQ>
    <xme:SX4SYVfrEC-rnRLXbBC8t-R5U0A8t6beN5fziI4-RS4cEFI_HWEVda7VmnAM0iKeH
    HJ8u2ML4ezquCg48VM>
X-ME-Received: <xmr:SX4SYTy2OJvtxjIY56vCjrYQzrwXqHViVDaJw2xta3SXDMGYYhj1uxQgFU9vdQQbEWxSM-wLDABU0stVbxGTMc-K9yND8dkd4uyzf6AaqdotC31OW3JqMpXhAqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkjghfofggtgesghdtreerredtvdenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfelffekfeeigeeiuefgveeiffdtueegvdeltdelueekjeeugeffieekfedvfedtnecu
    ffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdprhhoohhtfhhsrdhphidpph
    gsrghrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:SX4SYbPrEleYFouXlyINJJTJnrygHgE1olYuFXafdpyzhTlycfHedg>
    <xmx:SX4SYY_xGNJWo7P2T6GaGGPNOn8XikMhtS8FQ6J3Ivmghnn-Ibziaw>
    <xmx:SX4SYTXwXxB0zn9bo5lVGHXoqmfLMwc5Vg6II-YQWTMOjetoEKkrxg>
    <xmx:SX4SYaIBtQoF3TQxF__birNRbbLlZeTqkwFtuFHIKB8PLOvJhdI_lw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Aug 2021 09:25:28 -0400 (EDT)
Date: Tue, 10 Aug 2021 14:25:14 +0100
From: "Paul Barker" <paul@pbarker.dev>
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-core@lists.openembedded.org, dagmcr@gmail.com,
 richard.purdie@linuxfoundation.org
Subject: Re: [OE-core][PATCH] 1/2] wic: Add --no-fstab-update part option
Message-ID: <20210810142514.69504dde.paul@pbarker.dev>
In-Reply-To: <20210810130603.245475-1-daniel@qtec.com>
References: <1698BAA2EADEB7F4.20643@lists.openembedded.org>
	<20210810130603.245475-1-daniel@qtec.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Groupsio-MsgNum: 154684
Content-Type: multipart/signed; boundary="Sig_/C.g+ZEtTvHOvU6NtVF2GUBp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/C.g+ZEtTvHOvU6NtVF2GUBp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 10 Aug 2021 15:06:02 +0200
Daniel Gomez <daniel@qtec.com> wrote:

> When embedding a rootfs image (e.g. 'rootfs-dir') as a partition we might
> want to keep the stock fstab for that image. In such case, use
> this option to not update the fstab and use the stock one instead.
>=20
> This option allows to specify which partitions get the fstab updated
> and which get the stock fstab.
>=20
> The option matches the argument you can pass to wic itself where the
> same action is performed but for all the partitions.
>=20
> Example:
>     part /export --source rootfs --rootfs-dir=3Dhockeycam-image --fstype=
=3Dext4
> --label export --align 1024 --no-fstab-update
>=20
>     part / --source rootfs --fstype=3Dext4 --label rootfs --align 1024
>=20
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  scripts/lib/wic/help.py      | 3 +++
>  scripts/lib/wic/ksparser.py  | 1 +
>  scripts/lib/wic/partition.py | 5 +++--
>  3 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 991e5094bb..5c3d278d4e 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -991,6 +991,9 @@ DESCRIPTION
>                               multiple partitions and we want to keep the=
 right
>                               permissions and usernames in all the partit=
ions.
> =20
> +         --no-fstab-update: This option is specific to wic. It does not =
update the
> +                            '/etc/fstab' stock file for the given partit=
ion.
> +
>           --extra-space: This option is specific to wic. It adds extra
>                          space after the space filled by the content
>                          of the partition. The final size can go
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 7a4cc83af5..0df9eb0d05 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -185,6 +185,7 @@ class KickStart():
>          part.add_argument('--use-uuid', action=3D'store_true')
>          part.add_argument('--uuid')
>          part.add_argument('--fsuuid')
> +        part.add_argument('--no-fstab-update', action=3D'store_true')
> =20
>          bootloader =3D subparsers.add_parser('bootloader')
>          bootloader.add_argument('--append')
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index e0b2c5bdf2..ab304f1b2a 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -54,6 +54,7 @@ class Partition():
>          self.uuid =3D args.uuid
>          self.fsuuid =3D args.fsuuid
>          self.type =3D args.type
> +        self.no_fstab_update =3D args.no_fstab_update
>          self.updated_fstab_path =3D None
>          self.has_fstab =3D False
>          self.update_fstab_in_rootfs =3D False
> @@ -286,7 +287,7 @@ class Partition():
>              (self.fstype, extraopts, rootfs, label_str, self.fsuuid, roo=
tfs_dir)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=3Dpseudo)
> =20
> -        if self.updated_fstab_path and self.has_fstab:
> +        if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
>              debugfs_script_path =3D os.path.join(cr_workdir, "debugfs_sc=
ript")
>              with open(debugfs_script_path, "w") as f:
>                  f.write("cd etc\n")
> @@ -350,7 +351,7 @@ class Partition():
>          mcopy_cmd =3D "mcopy -i %s -s %s/* ::/" % (rootfs, rootfs_dir)
>          exec_native_cmd(mcopy_cmd, native_sysroot)
> =20
> -        if self.updated_fstab_path and self.has_fstab:
> +        if self.updated_fstab_path and self.has_fstab and not self.no_fs=
tab_update:
>              mcopy_cmd =3D "mcopy -i %s %s ::/etc/fstab" % (rootfs, self.=
updated_fstab_path)
>              exec_native_cmd(mcopy_cmd, native_sysroot)
> =20

This looks like the right approach. However, you're still missing the
handling for filesystems other than ext2/3/4 & msdos. See
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/scripts/lib/wic/plugins=
/source/rootfs.py#n218
and grep to see if there are any other uses of updated_fstab_path.

Thanks,

--=20
Paul Barker
https://pbarker.dev/

--Sig_/C.g+ZEtTvHOvU6NtVF2GUBp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCYRJ+OgAKCRCrY1Tsnbr0
brFDAP9zw5FLu4h0d/1SjTxb1evFde+mjgNZ3R9l7lOkTx7l8AEAkjlgbVHFXT1A
hmQC7Sw8dT/FyBjloKPIazBuWs9IYAc=
=dbXG
-----END PGP SIGNATURE-----

--Sig_/C.g+ZEtTvHOvU6NtVF2GUBp--
