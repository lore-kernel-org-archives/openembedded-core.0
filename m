Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qlh4o-0003RQ-0s
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:49:34 +0200
Received: by wwi14 with SMTP id 14so2140287wwi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 05:45:21 -0700 (PDT)
Received: by 10.227.11.6 with SMTP id r6mr4921388wbr.99.1311684320841;
	Tue, 26 Jul 2011 05:45:20 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fn12sm403941wbb.4.2011.07.26.05.45.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jul 2011 05:45:19 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1311581339-6009-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 26 Jul 2011 14:45:13 +0200
Message-Id: <154E8E94-CB34-4B40-937D-E7605C0E7973@dominion.thruhere.net>
References: <1311581339-6009-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH] dropbear: don't override DISTRO_TYPE if it is already set
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
X-List-Received-Date: Tue, 26 Jul 2011 12:49:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 25 jul. 2011, om 10:08 heeft Koen Kooi het volgende geschreven:

> The long term solution is to remove the IMAGE_FEATURE check since =
images are not allowed to influence recipe compile options.
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-core/dropbear/dropbear.inc     |    2 +-
> meta/recipes-core/dropbear/dropbear_0.52.bb |    2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/dropbear/dropbear.inc =
b/meta/recipes-core/dropbear/dropbear.inc
> index 1b51e1a..526a5a0 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -29,7 +29,7 @@ SBINCOMMANDS =3D "dropbear dropbearkey =
dropbearconvert"
> BINCOMMANDS =3D "dbclient ssh scp"
> EXTRA_OEMAKE =3D 'MULTI=3D1 SCPPROGRESS=3D1 PROGRAMS=3D"${SBINCOMMANDS} =
${BINCOMMANDS}"'
>=20
> -DISTRO_TYPE =3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", =
"debug", "",d)}"
> +DISTRO_TYPE ?=3D "${@base_contains("IMAGE_FEATURES", "debug-tweaks", =
"debug", "",d)}"
>=20
> do_debug_patch() {
> 	if [ "${DISTRO_TYPE}" =3D "debug" ]; then
> diff --git a/meta/recipes-core/dropbear/dropbear_0.52.bb =
b/meta/recipes-core/dropbear/dropbear_0.52.bb
> index 78d6cf1..4013c65 100644
> --- a/meta/recipes-core/dropbear/dropbear_0.52.bb
> +++ b/meta/recipes-core/dropbear/dropbear_0.52.bb
> @@ -3,4 +3,4 @@ require dropbear.inc
> SRC_URI[md5sum] =3D "1c69ec674481d7745452f68f2ea5597e"
> SRC_URI[sha256sum] =3D =
"e3a2ca49ed85ce562240c0ac06e2f72826d7e52a83e80d91c067c8b97bf5c108"
>=20
> -PR =3D "r2"
> +PR =3D "r3"
> --=20
> 1.6.6.1
>=20



