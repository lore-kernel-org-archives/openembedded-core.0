Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TQcm5-0007Y2-Kj for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 13:35:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9NBMUDX015912;
	Tue, 23 Oct 2012 12:22:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15629-02; Tue, 23 Oct 2012 12:22:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9NBMM7R015906
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 23 Oct 2012 12:22:24 +0100
Message-ID: <1350991343.22340.43.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Tue, 23 Oct 2012 12:22:23 +0100
In-Reply-To: <1350975871-26719-2-git-send-email-schnitzeltony@googlemail.com>
References: <1350975871-26719-1-git-send-email-schnitzeltony@googlemail.com>
	<1350975871-26719-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q9NBMUDX015912
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] gnome-icon-theme: fix icon mapping
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
X-List-Received-Date: Tue, 23 Oct 2012 11:35:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2012-10-23 at 09:04 +0200, Andreas M=C3=BCller wrote:
> Multiple errors in log.do_install as:
> Can't locate XML/Simple.pm in @INC (@INC contains: /usr/local/lib64/per=
l5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/v=
endor_perl /usr/lib64/perl5 /usr/share/perl5 .) at /home/andreas/tmp/oe-c=
ore-eglibc/sysroots/x86_64-linux/usr/lib/../libexec/icon-name-mapping lin=
e 12.
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb b/meta=
/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> index 8e7995b..f017b56 100644
> --- a/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> +++ b/meta/recipes-gnome/gnome/gnome-icon-theme_2.31.0.bb
> @@ -9,7 +9,7 @@ SECTION =3D "x11/gnome"
>  DEPENDS =3D "icon-naming-utils-native glib-2.0 intltool-native"
>  RDEPENDS_${PN} =3D "hicolor-icon-theme"
>  RRECOMMENDS_${PN} =3D "librsvg-gtk"
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  FILES_${PN} +=3D "${datadir}/*"
> =20
> @@ -22,5 +22,4 @@ SRC_URI[sha256sum] =3D "ea7e05b77ead159379392b3b275ca=
0c9cbacd7d936014e447cc7c5e27a
>  EXTRA_OECONF =3D "--disable-hicolor-check"
>  EXTRA_OECONF +=3D "--with-iconmap=3D${@d.getVar('STAGING_LIBEXECDIR_NA=
TIVE', True).replace('gnome-icon-theme', 'icon-naming-utils')}/icon-name-=
mapping"
> =20
> -
> -inherit autotools
> +inherit autotools perlnative

Doesn't this need a DEPENDS +=3D "libxml-simple-perl-native" or whatever
the correct name for the module is?

Cheers,

Richard



