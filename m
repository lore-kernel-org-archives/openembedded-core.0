Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qzv2A-0004Z7-RK
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 20:33:38 +0200
Received: by wyf19 with SMTP id 19so3051251wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 11:28:41 -0700 (PDT)
Received: by 10.227.145.139 with SMTP id d11mr2207277wbv.60.1315074519996;
	Sat, 03 Sep 2011 11:28:39 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fp17sm2744692wbb.6.2011.09.03.11.28.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Sep 2011 11:28:39 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
Date: Sat, 3 Sep 2011 20:28:37 +0200
Message-Id: <DE9759A0-C638-4B4A-A6BC-6B61139D866A@dominion.thruhere.net>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 1/3] zaurusd: enable support for collie
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
X-List-Received-Date: Sat, 03 Sep 2011 18:33:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

shouldn't this move to meta-zaurus now that oe-core is qemu only?

Op 3 sep. 2011, om 20:22 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:

> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> .../0001-zaurusd-add-support-for-collie.patch      |   50 =
++++++++++++++++++++
> meta/recipes-bsp/zaurusd/zaurusd_git.bb            |    3 +-
> 2 files changed, 52 insertions(+), 1 deletions(-)
> create mode 100644 =
meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.patch=

>=20
> diff --git =
a/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.pat=
ch =
b/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.pat=
ch
> new file mode 100644
> index 0000000..36ded13
> --- /dev/null
> +++ =
b/meta/recipes-bsp/zaurusd/zaurusd/0001-zaurusd-add-support-for-collie.pat=
ch
> @@ -0,0 +1,50 @@
> +=46rom 85b94bed1feab70bc529a59fb80c26da825b9abe Mon Sep 17 00:00:00 =
2001
> +From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +Date: Fri, 5 Aug 2011 16:00:10 +0400
> +Subject: [PATCH] zaurusd: add support for collie
> +Upstream-Status: Pending
> +
> +Note: alsa mixer support is disabled, as collie doesn't support sound =
(yet).
> +
> +Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> +---
> + config/mach-config/mach-collie-functions |    4 ++++
> + config/mach-config/mach-collie-vars.in   |    3 +++
> + configure.ac                             |    1 +
> + 3 files changed, 8 insertions(+), 0 deletions(-)
> + create mode 100644 config/mach-config/mach-collie-functions
> + create mode 100644 config/mach-config/mach-collie-vars.in
> +
> +diff --git a/config/mach-config/mach-collie-functions =
b/config/mach-config/mach-collie-functions
> +new file mode 100644
> +index 0000000..4d77c53
> +--- /dev/null
> ++++ b/config/mach-config/mach-collie-functions
> +@@ -0,0 +1,4 @@
> ++HAVE_INPUT_SWITCHES=3D0
> ++HAVE_TSKEYS=3D0
> ++HAVE_ALSA_MIXER=3D0
> ++
> +diff --git a/config/mach-config/mach-collie-vars.in =
b/config/mach-config/mach-collie-vars.in
> +new file mode 100644
> +index 0000000..ec1bfb8
> +--- /dev/null
> ++++ b/config/mach-config/mach-collie-vars.in
> +@@ -0,0 +1,3 @@
> ++MACHINE=3Dcollie
> ++
> ++ALSA_MIXER_INIT=3D@appconfdir@/alsa/5500-default.state
> +diff --git a/configure.ac b/configure.ac
> +index 78ea2ae..5160fab 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -65,6 +65,7 @@ AC_CONFIG_FILES([
> +   config/config
> +   config/mach-config/mach-akita-vars
> +   config/mach-config/mach-borzoi-vars
> ++  config/mach-config/mach-collie-vars
> +   config/mach-config/mach-corgi-vars
> +   config/mach-config/mach-husky-vars
> +   config/mach-config/mach-poodle-vars
> +--
> +1.7.2.5
> diff --git a/meta/recipes-bsp/zaurusd/zaurusd_git.bb =
b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
> index 3b8cc43..ebc3c66 100644
> --- a/meta/recipes-bsp/zaurusd/zaurusd_git.bb
> +++ b/meta/recipes-bsp/zaurusd/zaurusd_git.bb
> @@ -7,9 +7,10 @@ RDEPENDS_${PN} =3D "xrandr"
>=20
> SRCREV =3D "82b30c7865f007fff81372c3cdc71b2ff6843ccc"
> PV =3D "0.1+git${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI =3D "git://git.yoctoproject.org/${BPN};protocol=3Dgit \
> +	file://0001-zaurusd-add-support-for-collie.patch \
> 	file://fix_makefile.patch"
>=20
> S =3D "${WORKDIR}/git"
> --=20
> 1.7.2.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



