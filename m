Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF1Zg-0007Ih-33
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 12:34:40 +0200
Received: by bkat8 with SMTP id t8so3119782bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 03:28:54 -0700 (PDT)
Received: by 10.223.76.135 with SMTP id c7mr8901357fak.16.1318674533212;
	Sat, 15 Oct 2011 03:28:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u6sm9500484faf.3.2011.10.15.03.28.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 03:28:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
Date: Sat, 15 Oct 2011 12:28:50 +0200
Message-Id: <D00A742C-29A5-41B0-9869-84B485F431FF@dominion.thruhere.net>
References: <1318672491-31826-1-git-send-email-Martin.Jansa@gmail.com>
	<1318672491-31826-2-git-send-email-Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 2/2] mesa-common: install internal GL headers to libgl-dev
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
X-List-Received-Date: Sat, 15 Oct 2011 10:34:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 okt. 2011, om 11:54 heeft Martin Jansa het volgende geschreven:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <k-kooi@ti.com>

> ---
> meta/recipes-graphics/mesa/mesa-common.inc |    5 +++++
> 1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-common.inc =
b/meta/recipes-graphics/mesa/mesa-common.inc
> index b8f2289..ca2d931 100644
> --- a/meta/recipes-graphics/mesa/mesa-common.inc
> +++ b/meta/recipes-graphics/mesa/mesa-common.inc
> @@ -51,3 +51,8 @@ FILES_libosmesa-dev =3D "${libdir}/libOSMesa.* =
${includedir}/osmesa.h"
>=20
> FILES_${PN}-dbg +=3D "${libdir}/dri/.debug/*"
> FILES_libegl-dbg +=3D "${libdir}/egl/.debug/*"
> +
> +do_install_append () {
> +    install -d ${D}/${includedir}/GL
> +    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
> +}
> --=20
> 1.7.7
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



