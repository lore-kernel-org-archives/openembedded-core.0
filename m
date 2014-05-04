Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id C58FA6098C;
	Sun,  4 May 2014 14:50:07 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id b8so4045759lan.40
	for <multiple recipients>; Sun, 04 May 2014 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Lt63Nn09DtjjeHnkTGe6zcxQ8TjaW15hVWt/eTr4Fpg=;
	b=KcLsTepDXF8R4C2GYe6YTABLyOGv7Bo5d4jCyM2cz99IGUDwu/Pr7g9Y2J7xABB+w3
	QIZ13JTDidVzz3UOghh1N5AxGKu3LGDzbFCp+/ylxJpda7u3Z/M0IX1RV8vTJSq8gTZU
	nIa8f1QblP8neCQFOPmSRVW5Hns0/XdQRmHud4lbY42ewcg2JxBzRoBp/5TSodE2MHWG
	NlWapPxVk27OoVygHJoQQj9sPLwGRYGHu0YMUiOSuxu5DnNHsOLZ3mmJ8aIdXP5dWKTf
	gHQddrPYC08Xd6GdJqCmNnMF5U6ZtH8edLmmvxOlEDPs5lpAJlMfE9/+hW5mettvj4hv
	VBiQ==
X-Received: by 10.112.137.39 with SMTP id qf7mr21213098lbb.18.1399215007369;
	Sun, 04 May 2014 07:50:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d8sm5315565lah.12.2014.05.04.07.50.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 May 2014 07:50:05 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 May 2014 16:50:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Message-ID: <20140504145024.GD2486@jama>
References: <20140504111629.5E32A504E8@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140504111629.5E32A504E8@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Khem Raj : lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
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
X-List-Received-Date: Sun, 04 May 2014 14:50:13 -0000
X-Groupsio-MsgNum: 52786
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q2LtEObxj4fS/vxA"
Content-Disposition: inline

--Q2LtEObxj4fS/vxA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 04, 2014 at 11:16:29AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master-next
> Commit: 09d3d8f97d6c60707b8dfb3fa5b04fa2efe6f6f6
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D09d3d8f97d6c60707b8dfb3fa5b04fa2efe6f6f6
>=20
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Fri May  2 22:32:58 2014 -0700
>=20
> lttng-modules_2.3.3.bb: Fix build on ARM/gcc-4.9
>=20
> Update the structure to work with immutable bio_vecs

Is this really 4.9 specific? It's failing with the same error message in
every qemuarm world build (even with daisy).

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>=20
> ---
>=20
>  .../lttng/lttng-modules/fixup_block_driver.patch   | 122 +++++++++++++++=
++++++
>  meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb   |   4 +-
>  2 files changed, 125 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.p=
atch b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
> new file mode 100644
> index 0000000..3644a47
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-modules/fixup_block_driver.patch
> @@ -0,0 +1,122 @@
> +Fix errors like
> +
> +block.h:344:24: error: 'struct bio' has no member named 'bi_sector'
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +Upstream-Status: Pending
> +
> +Index: git/instrumentation/events/lttng-module/block.h
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/instrumentation/events/lttng-module/block.h	2014-05-02 22:2=
0:01.814125429 -0700
> ++++ git/instrumentation/events/lttng-module/block.h	2014-05-02 22:28:48.=
927455709 -0700
> +@@ -341,9 +341,9 @@
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev ?
> + 					  bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -385,14 +385,14 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> + #if (LINUX_VERSION_CODE >=3D KERNEL_VERSION(2,6,38))
> + 		tp_assign(error, error)
> + #else
> + 		tp_assign(error, 0)
> + #endif
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 	),
> +=20
> + 	TP_printk("%d,%d %s %llu + %u [%d]",
> +@@ -419,9 +419,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -485,9 +485,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -513,9 +513,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev ? bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -587,10 +587,10 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio ? bio->bi_bdev->bd_dev : 0)
> +-		tp_assign(sector, bio ? bio->bi_sector : 0)
> +-		tp_assign(nr_sector, bio ? bio->bi_size >> 9 : 0)
> ++		tp_assign(sector, bio ? bio->bi_iter.bi_sector : 0)
> ++		tp_assign(nr_sector, bio ? bio->bi_iter.bi_size >> 9 : 0)
> + 		blk_fill_rwbs(rwbs, bio ? bio->bi_rw : 0,
> +-			      bio ? bio->bi_size >> 9 : 0)
> ++			      bio ? bio->bi_iter.bi_size >> 9 : 0)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> +         ),
> +=20
> +@@ -759,9 +759,9 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> + 		tp_assign(new_sector, new_sector)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 		tp_memcpy(comm, current->comm, TASK_COMM_LEN)
> + 	),
> +=20
> +@@ -805,11 +805,11 @@
> +=20
> + 	TP_fast_assign(
> + 		tp_assign(dev, bio->bi_bdev->bd_dev)
> +-		tp_assign(sector, bio->bi_sector)
> +-		tp_assign(nr_sector, bio->bi_size >> 9)
> ++		tp_assign(sector, bio->bi_iter.bi_sector)
> ++		tp_assign(nr_sector, bio->bi_iter.bi_size >> 9)
> + 		tp_assign(old_dev, dev)
> + 		tp_assign(old_sector, from)
> +-		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_size)
> ++		blk_fill_rwbs(rwbs, bio->bi_rw, bio->bi_iter.bi_size)
> + 	),
> +=20
> + 	TP_printk("%d,%d %s %llu + %u <- (%d,%d) %llu",
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb b/meta/reci=
pes-kernel/lttng/lttng-modules_2.3.3.bb
> index dd06546..94e18b2 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.3.3.bb
> @@ -14,7 +14,9 @@ SRCREV =3D "eef112db0e63feff6cbf0a98cda9af607cefb377"
>  PV =3D "2.3.3"
> =20
>  SRC_URI =3D "git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.3 \
> -           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
> +           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
> +           file://fixup_block_driver.patch \
> +          "
> =20
>  export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>  export KERNEL_SRC=3D"${STAGING_KERNEL_DIR}"
>=20
> --=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Q2LtEObxj4fS/vxA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNmU7AACgkQN1Ujt2V2gBz88QCeOdLfQwZ7tcagNoD84XLCoO16
5mEAnjN6TcKZtKb2VBziAL/2voMsdnyY
=mlUy
-----END PGP SIGNATURE-----

--Q2LtEObxj4fS/vxA--
