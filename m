Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PzRcM-0006EK-Px
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:36:46 +0100
Received: by wyb40 with SMTP id 40so355355wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:35:04 -0700 (PDT)
Received: by 10.216.56.65 with SMTP id l43mr3313403wec.113.1300185304680;
	Tue, 15 Mar 2011 03:35:04 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id n52sm4368753wer.24.2011.03.15.03.35.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:35:04 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1300183818.git.Martin.Jansa@gmail.com>
Date: Tue, 15 Mar 2011 11:35:03 +0100
Message-Id: <2B631255-94FC-49F8-B63B-5C769B156644@dominion.thruhere.net>
References: <cover.1300183818.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PULL][PATCH 0/3] util-linux: Cleanup of unused files
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
X-List-Received-Date: Tue, 15 Mar 2011 10:36:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Op 15 mrt 2011, om 11:12 heeft Martin Jansa het volgende geschreven:

> Remove files not used in SRC_URI
>=20
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>  Branch: jansa/util-linux
>  Browse: =
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dja=
nsa/util-linux

Martin,

Thanks for doing this, I just did some cleanup for util-linux in meta-oe =
and meta-angstrom to use only the one in oe-core.

regards,

Koen



>=20
> Thanks,
>    Martin Jansa <Martin.Jansa@gmail.com>
> ---
>=20
>=20
> Martin Jansa (3):
>  util-linux: remove unused files from files directory
>  util-linux: remove unused files from util-linux-2.17.2 directory
>  util-linux: move remaining files from files directory to
>    util-linux-2.17.2 for faster lookup
>=20
> .../util-linux/files/debian-bug392236.patch        |  203 =
--------------------
> .../util-linux/files/fdiskbsdlabel_thumb.diff      |   12 --
> .../recipes-core/util-linux/files/fix-make-c.patch |   41 ----
> meta/recipes-core/util-linux/files/gcc34.patch     |   23 ---
> meta/recipes-core/util-linux/files/glibc-fix.patch |   22 --
> .../util-linux/files/optional-uuid.patch           |   55 ------
> meta/recipes-core/util-linux/files/umount.diff     |   19 --
> meta/recipes-core/util-linux/files/uuid.patch      |   22 --
> .../{files =3D> util-linux-2.17.2}/MCONFIG           |    0
> .../{files =3D> util-linux-2.17.2}/defines.h         |    0
> .../{files =3D> util-linux-2.17.2}/make_include      |    0
> .../{files =3D> util-linux-2.17.2}/swapargs.h        |    0
> .../util-linux/util-linux-2.17.2/tls.patch         |   70 -------
> 13 files changed, 0 insertions(+), 467 deletions(-)
> delete mode 100644 =
meta/recipes-core/util-linux/files/debian-bug392236.patch
> delete mode 100644 =
meta/recipes-core/util-linux/files/fdiskbsdlabel_thumb.diff
> delete mode 100644 meta/recipes-core/util-linux/files/fix-make-c.patch
> delete mode 100644 meta/recipes-core/util-linux/files/gcc34.patch
> delete mode 100644 meta/recipes-core/util-linux/files/glibc-fix.patch
> delete mode 100644 =
meta/recipes-core/util-linux/files/optional-uuid.patch
> delete mode 100644 meta/recipes-core/util-linux/files/umount.diff
> delete mode 100644 meta/recipes-core/util-linux/files/uuid.patch
> rename meta/recipes-core/util-linux/{files =3D> =
util-linux-2.17.2}/MCONFIG (100%)
> rename meta/recipes-core/util-linux/{files =3D> =
util-linux-2.17.2}/defines.h (100%)
> rename meta/recipes-core/util-linux/{files =3D> =
util-linux-2.17.2}/make_include (100%)
> rename meta/recipes-core/util-linux/{files =3D> =
util-linux-2.17.2}/swapargs.h (100%)
> delete mode 100644 =
meta/recipes-core/util-linux/util-linux-2.17.2/tls.patch
>=20
> --=20
> 1.7.4.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



