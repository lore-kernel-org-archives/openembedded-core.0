Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QM5qT-0004HA-N7
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:00:57 +0200
Received: by wwi18 with SMTP id 18so2998322wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 14:58:05 -0700 (PDT)
Received: by 10.227.2.142 with SMTP id 14mr4717385wbj.43.1305583085184;
	Mon, 16 May 2011 14:58:05 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h11sm3413845wbc.9.2011.05.16.14.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 May 2011 14:58:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cfd8d3c9ec48872a2d64ad13fa8b4b0a671c35a0.1305580484.git.sgw@linux.intel.com>
Date: Mon, 16 May 2011 23:58:02 +0200
Message-Id: <0AB11EBC-9856-4447-AD47-E33C0D21C1C4@dominion.thruhere.net>
References: <cover.1305580484.git.sgw@linux.intel.com>
	<cfd8d3c9ec48872a2d64ad13fa8b4b0a671c35a0.1305580484.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 03/14] e2fsprogs_1.41.14.bb: Package libraries into separate packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 22:00:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 mei 2011, om 23:44 heeft Saul Wold het volgende geschreven:

> From: Khem Raj <raj.khem@gmail.com>
>=20
> add libcomerr libss libe2p libext2fs packages
> helps in reducing the root file system size
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    6 ++++++
> 1 files changed, 6 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb =
b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
> index d493f6f..91a783d 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.41.14.bb
> @@ -39,11 +39,17 @@ do_install () {
> RDEPENDS_e2fsprogs =3D "e2fsprogs-blkid e2fsprogs-badblocks"
>=20
> PACKAGES =3D+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs =
e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
> +PACKAGES =3D+ "libcomerr libss libe2p libext2fs"
> +
> FILES_e2fsprogs-blkid =3D "${base_sbindir}/blkid"
> FILES_e2fsprogs-fsck =3D "${base_sbindir}/fsck"
> FILES_e2fsprogs-e2fsck =3D "${base_sbindir}/e2fsck =
${base_sbindir}/fsck.ext*"
> FILES_e2fsprogs-mke2fs =3D "${base_sbindir}/mke2fs =
${base_sbindir}/mkfs.ext*"
> FILES_e2fsprogs-tune2fs =3D "${base_sbindir}/tune2fs =
${base_sbindir}/e2label ${base_sbindir}/findfs"
> FILES_e2fsprogs-badblocks =3D "${base_sbindir}/badblocks"
> +FILES_libcomerr =3D "${libdir}/libcom_err.so.*"
> +FILES_libss =3D "${libdir}/libss.so.*"
> +FILES_libe2p =3D "${libdir}/libe2p.so.*"
> +FILES_libext2fs =3D "${libdir}/e2initrd_helper =
${libdir}/libext2fs.so.*"

That's missing a PR bump=


