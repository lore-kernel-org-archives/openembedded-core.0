Received: from 6.mo5.mail-out.ovh.net ([178.32.119.138]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ti4nE-0007DW-Ck
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 15:57:23 +0100
Received: from mail188.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 97A48104C0AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2012 14:33:07 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Dec 2012 15:24:37 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Dec 2012 15:24:35 +0200
Date: Mon, 10 Dec 2012 14:24:35 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Burton, Ross" <ross.burton@intel.com>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20121210142435.29c6a1db@eb-e6520>
In-Reply-To: <1351065917-14779-4-git-send-email-schnitzeltony@googlemail.com>
References: <1351065917-14779-1-git-send-email-schnitzeltony@googlemail.com>
	<1351065917-14779-4-git-send-email-schnitzeltony@googlemail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 16326393075100724674
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehiedrtdejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehpohhkhihlihhnuhigrdhorhhgpdhpvghrlhehrdgrthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehjedrtddtucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecunecuhfhrohhmpefgrhhitgcuueornhgrrhguuceovghrihgtsegvuhhkrhgvrgdrtghomheqnecuffhomhgrihhnpehpohhkhihlihhnuhigrdhorhhgpdhpvghrlhehrdgrthenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [V3 3/4] sato-icon-theme: fix build
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
X-List-Received-Date: Mon, 10 Dec 2012 14:57:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi Ross,

is it possible to get this patch into danny ?
commit ID : 61233b05ad299a34b5d3c06fe3c0162cba8fb273

Thanks
Eric

Le Wed, 24 Oct 2012 10:05:16 +0200,
Andreas M=FCller <schnitzeltony@googlemail.com> a =E9crit :

> | Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/per=
l5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/ven=
dor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-core-=
eglibc/sysroots/x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping li=
ne 12.
> | BEGIN failed--compilation aborted at /home/andreas/tmp/oe-core-eglibc/s=
ysroots/x86_64-linux/usr/lib/icon-naming-utils/icon-name-mapping line 12.
> | make[3]: *** [install-data-local] Error 2
> | make[3]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-a=
ngstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16/actions'
> | make[2]: *** [install-am] Error 2
> | make[2]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-a=
ngstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16/actions'
> | make[1]: *** [install-recursive] Error 1
> | make[1]: Leaving directory `/home/andreas/tmp/oe-core-eglibc/work/all-a=
ngstrom-linux/sato-icon-theme-0.4.1-r5/sato-icon-theme-0.4.1/16x16'
> | make: *** [install-recursive] Error 1
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (see /home/andreas/tmp/oe-core-eglib=
c/work/all-angstrom-linux/sato-icon-theme-0.4.1-r5/temp/log.do_install.2150=
2 for further information)
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../sato-icon-theme/sato-icon-theme.inc            |    2 +-
>  .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc b/meta=
/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> index 476e925..e014a7d 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D56a830bbe6e469=
7fe6cbbae01bb7c2b2"
>  SECTION =3D "x11"
>  DEPENDS =3D ""
> =20
> -inherit autotools pkgconfig allarch gtk-icon-cache
> +inherit autotools pkgconfig allarch gtk-icon-cache perlnative
> =20
>  FILES_${PN} +=3D "${datadir}"
> =20
> diff --git a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb b=
/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> index cd34cac..ead2f7d 100644
> --- a/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> +++ b/meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
> @@ -1,8 +1,8 @@
>  require sato-icon-theme.inc
> =20
> -DEPENDS +=3D "icon-naming-utils-native"
> +DEPENDS +=3D "icon-naming-utils-native libxml-simple-perl-native"
> =20
> -PR =3D "r5"
> +PR =3D "r6"
> =20
>  SRC_URI =3D "http://pokylinux.org/releases/sato/${BPN}-${PV}.tar.gz \
>             file://iconpath-option.patch \



