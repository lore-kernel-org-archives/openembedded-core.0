Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ4uD-0001CV-Rv
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 19:38:29 +0200
Received: by wwg12 with SMTP id 12so3292808wwg.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 10:34:56 -0700 (PDT)
Received: by 10.227.133.147 with SMTP id f19mr3832061wbt.27.1308677696114;
	Tue, 21 Jun 2011 10:34:56 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fl19sm4176319wbb.15.2011.06.21.10.34.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 10:34:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
Date: Tue, 21 Jun 2011 19:34:54 +0200
Message-Id: <D1BE4C62-7336-430E-9072-F827A2513CAD@dominion.thruhere.net>
References: <cover.1308677220.git.paul.eggleton@linux.intel.com>
	<1046625816b98aaab44b810e2376ed3689a2af5f.1308677220.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] u-boot: set SRCREV to a git revision instead of a tag reference
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
X-List-Received-Date: Tue, 21 Jun 2011 17:38:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun 2011, om 19:29 heeft Paul Eggleton het volgende geschreven:

> If we use a tag here then bitbake has to connect to the repository to =
find
> out the corresponding revision (so it can expand SRCPV which is part =
of PV,
> which amongst other things is needed to determine whether or not the
> package has to be rebuilt.) This occurs at parse time; on machines =
behind a
> firewall or with no network access this can be a problem.
>=20
> We wish to avoid unnecessary network accesses and network access in =
our
> default configuration during parse time is even worse. Substituting =
the
> git revision corresponding to the tag prevents bitbake from having to
> contact the remote repository in order to expand PV.
>=20
> Addresses [YOCTO #1186]
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/recipes-bsp/uboot/u-boot_2011.03.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/uboot/u-boot_2011.03.bb =
b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> index 07f0609..25af69b 100644
> --- a/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> +++ b/meta/recipes-bsp/uboot/u-boot_2011.03.bb
> @@ -12,9 +12,9 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb \
>=20
> FILESDIR =3D =
"${@os.path.dirname(bb.data.getVar('FILE',d,1))}/u-boot-git/${MACHINE}"
>=20
> -SRCREV =3D "v2011.03"
> +SRCREV =3D "19b54a701811220221fc4d5089a2bb18892018ca"
> PV =3D "v2011.03+git${SRCPV}"
> -PR=3D"r4"
> +PR =3D "r5"


Can you add a comment above the rev in the lines of "bitbake sucks, we =
need to use a rev instead of a tag, this one maps to 2011.03"?=


