Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Q5EZv-0003hO-0x
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 11:54:11 +0200
Received: by wwb17 with SMTP id 17so2230201wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 02:52:06 -0700 (PDT)
Received: by 10.216.11.205 with SMTP id 55mr1813532wex.72.1301565126474;
	Thu, 31 Mar 2011 02:52:06 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id z50sm418759weq.47.2011.03.31.02.52.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 02:52:05 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1301489300-9174-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 31 Mar 2011 11:52:05 +0200
Message-Id: <68DA01AC-A0C8-4632-B19D-4021CB4253C1@dominion.thruhere.net>
References: <1301489300-9174-1-git-send-email-koen@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH] qemu: there is no glflags.patch in the repo, so remove it from SRC_URI
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
X-List-Received-Date: Thu, 31 Mar 2011 09:54:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

ping

Op 30 mrt 2011, om 14:48 heeft koen@dominion.thruhere.net het volgende =
geschreven:

> From: Koen Kooi <koen@dominion.thruhere.net>
>=20
> Probably not the best solution, but I couldn't locate a matching =
glflags.patch
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-devtools/qemu/qemu.inc |    1 -
> 1 files changed, 0 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc =
b/meta/recipes-devtools/qemu/qemu.inc
> index f41b49c..83d7407 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -31,7 +31,6 @@ do_configure() {
>     chmod a+x ${S}/target-i386/beginend_funcs.sh
> }
>=20
> -SRC_URI_append_virtclass-nativesdk =3D " =
file://glflags.patch;patch=3D1"
> DEPENDS_virtclass-nativesdk =3D "zlib-nativesdk libsdl-nativesdk =
qemugl-nativesdk"
> RDEPENDS_virtclass-nativesdk =3D "libsdl-nativesdk"
> EXTRA_OECONF_virtclass-nativesdk =3D =
"--target-list=3Darm-linux-user,arm-softmmu,i386-softmmu,x86_64-softmmu,mi=
ps-linux-user,mipsel-linux-user,mips-softmmu,ppc-softmmu =
--disable-vnc-tls --cross-prefix=3D${TARGET_PREFIX}"
> --=20
> 1.6.6.1
>=20



