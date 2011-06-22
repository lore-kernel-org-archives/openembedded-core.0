Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZRQ6-0008R3-EF
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:40:54 +0200
Received: by wyb34 with SMTP id 34so851800wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:37:19 -0700 (PDT)
Received: by 10.217.7.3 with SMTP id z3mr959283wes.68.1308764238227;
	Wed, 22 Jun 2011 10:37:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n20sm438570weq.15.2011.06.22.10.37.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2011 10:37:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <8cd511d84bd86b911f464b14c84d9cb122f7f6b0.1308763995.git.mark.hatle@windriver.com>
Date: Wed, 22 Jun 2011 19:37:15 +0200
Message-Id: <1576E015-5BD6-4C83-A347-82FAE31906EF@dominion.thruhere.net>
References: <cover.1308763995.git.mark.hatle@windriver.com>
	<8cd511d84bd86b911f464b14c84d9cb122f7f6b0.1308763995.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 18/40] modutils: Add in missing -dbg package
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
X-List-Received-Date: Wed, 22 Jun 2011 17:40:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 jun 2011, om 19:36 heeft Mark Hatle het volgende geschreven:

> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/recipes-kernel/modutils/modutils_2.4.27.bb |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/modutils/modutils_2.4.27.bb =
b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> index 1ebc90c..9f2add3 100644
> --- a/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> +++ b/meta/recipes-kernel/modutils/modutils_2.4.27.bb
> @@ -5,7 +5,7 @@ manageable for all users, administrators and =
distribution maintainers."
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b"
> DEPENDS =3D "bison-native"
> -PR =3D "r9"
> +PR =3D "r10"
>=20
> SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/kernel/modutils/v2.4/modutils-${PV}.tar.b=
z2 \
>            file://lex.l.diff;patch=3D1 \
> @@ -86,7 +86,7 @@ pkg_prerm_modutils-modinfo() {
> update-alternatives --remove modinfo /sbin/modinfo.24
> }
>=20
> -PACKAGES =3D "modutils-depmod modutils-modinfo modutils-doc modutils"
> +PACKAGES =3D "${PN}-dbg modutils-depmod modutils-modinfo modutils-doc =
modutils"

PACKAGES =3D+ "modutils-depmod modutils-modinfo" would be nice more more =
futureproof=


