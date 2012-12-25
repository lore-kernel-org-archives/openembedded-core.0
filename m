Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TnPxc-0000wv-OL
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Dec 2012 09:34:04 +0100
Received: by mail-wi0-f172.google.com with SMTP id o1so6635195wic.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2012 00:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=USzGYYkmghC3XtzcIRii+gN4553dLTF7hlQB9xOiMyw=;
	b=HYkjLx+oekFYIbNpkOB1tI3zDBt+G4/lEjeNmj0jpjxIvgnBkJ4MZVtcyDGDc1BeA9
	EZDHTX51+gK90XRhUAfRicE7ml50Ix3GYP4UJrUGlghKyiCu2Moc1UHjpc/ZiBP6mmdS
	ggD1irRcv1I0ra4RrxQT9IXvvoaXDyXDFvlIysNOqFaN/t38RzF1wLbJz+0lkWw7qzR7
	KeZxAnr5XEvDdtbP5G/x8/Yfb4FowemfYT40CCxPI5Tn9rBi42UPr/k5Z3S5YjgJXukZ
	fVlDydAloM5ss9aZcRfVnL4vsz6GEOiU4kMvohBLnul9QJXUynDswuk+W6ewqqeiUGEG
	jTAQ==
X-Received: by 10.194.238.5 with SMTP id vg5mr38731751wjc.40.1356423553731;
	Tue, 25 Dec 2012 00:19:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fv2sm46631665wib.4.2012.12.25.00.19.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Dec 2012 00:19:13 -0800 (PST)
Date: Tue, 25 Dec 2012 09:19:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Qi.Chen@windriver.com
Message-ID: <20121225081912.GU8988@jama.palm1.palmone.com>
References: <cover.1356335387.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1356335387.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 0/2] read-only rootfs support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Dec 2012 08:34:05 -0000
X-Groupsio-MsgNum: 33084
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gn1ylXQ+YRNuZICZ"
Content-Disposition: inline

--gn1ylXQ+YRNuZICZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 25, 2012 at 10:55:03AM +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add read-only rootfs support to sysvinit startup system.
> The main changes are:
> 1) Let rootfs_xxx.bbclass support 'read-only-rootfs' image feature.
>    If IMAGE_FEATURES contains 'read-only-rootfs', then the populate-volat=
ile.sh
>    script is run at rootfs time to set up basic directories and files.
> 2) Improve the populate-volatile.sh init script.
> 3) Add two config files specific to read-only-rootfs image, which are to =
be used
>    by the populate-volatile.sh script.
> 4) Automatically adjust the mount options in fstab when 'read-only-rootfs=
' is in
>    IMAGE_FEATURES.
>=20
> Version 2 fixes a problem version one has, that is, if we build an image =
without
> 'read-only-rootfs' image feature after we built one that has this feature=
, the
> mount options in fstab is wrong.=20

initscripts recipe still have that issue.

Cheers,

> The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc0=
2a:
>=20
>   rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3DChenQi/readonly=
-rootfs
>=20
> Chen Qi (2):
>   initscripts: support read-only rootfs
>   rootfs_xxx.bbclass: support read-only-rootfs image feature
>=20
>  meta/classes/rootfs_deb.bbclass                    |   14 +
>  meta/classes/rootfs_ipk.bbclass                    |   15 ++
>  meta/classes/rootfs_rpm.bbclass                    |   20 +-
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |    8 +-
>  .../initscripts/initscripts-1.0/bootmisc.sh        |    9 +-
>  .../initscripts-1.0/populate-volatile.sh           |  285 ++++++++++----=
------
>  .../initscripts/initscripts-1.0/volatiles          |    1 +
>  .../initscripts-1.0/volatiles-readonly-minimal     |   23 ++
>  .../initscripts-1.0/volatiles-readonly-sato        |   30 +++
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |   15 +-
>  10 files changed, 265 insertions(+), 155 deletions(-)
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatil=
es-readonly-minimal
>  create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/volatil=
es-readonly-sato
>=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gn1ylXQ+YRNuZICZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDZYYAACgkQN1Ujt2V2gBzEdgCfU/q7IPH/K3lYMQ96zYjI3e8Y
fQ4An1UslrIEPXxH2ksFvjE8ktVuumrf
=tG+5
-----END PGP SIGNATURE-----

--gn1ylXQ+YRNuZICZ--
