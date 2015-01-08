Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF2B706D9;
	Thu,  8 Jan 2015 12:01:51 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so2773605wid.5;
	Thu, 08 Jan 2015 04:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6/YEueF19GTVqbYxQNlksk+B16LRAUKpVH6lwDS7gFA=;
	b=GdWBfLMgWv6GYD7R13uHx//A+lIxjFVSadVfkUn2cAhHEFiHm0oOLtnigDnk7diTDg
	7v6Djp7NLNYTeOG3D/uVtBhJjnzSplCNW8pJcVm9VxFWH39WBIFEzH+qwawZ9EwHGMfd
	DjGdIWosHLuis5iLofiMthpanQJJoVN97RaX03BQ1IfK9SdB42d1OXwRxQuOqW5MTuOL
	Uw8DU+5XMRbxaS9j3l2eAlSsbDfwPQu4GrRKGx4qS6nHfRC3wzKfc5huho6zlnKb5fgE
	14I/ZlraiaymBL2QaEC6SbC5DfODfSj3JKE97nBK8Tht51b3vPhhF96MrrRaDZwoRHT1
	bZSg==
X-Received: by 10.181.8.66 with SMTP id di2mr58366521wid.49.1420718512319;
	Thu, 08 Jan 2015 04:01:52 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jr4sm5872379wjc.20.2015.01.08.04.01.51
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jan 2015 04:01:51 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 8 Jan 2015 13:01:55 +0100
To: openembedded-core@lists.openembedded.org,
	Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20150108120155.GH3972@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150107141256.GM29986@jama>
MIME-Version: 1.0
In-Reply-To: <20150107141256.GM29986@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Jan 2015 12:01:55 -0000
X-Groupsio-MsgNum: 61169
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PW0Eas8rCkcu1VkF"
Content-Disposition: inline

--PW0Eas8rCkcu1VkF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
> On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 89a29a3ad0742cd713e739d3d460be7711966679
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D89a29a3ad0742cd713e739d3d460be7711966679
> >=20
> > Author: Richard Tollerton <rich.tollerton@ni.com>
> > Date:   Fri Dec 12 13:34:00 2014 -0600
> >=20
> > font-util: Fix incorrect PKG_CONFIG_PATH
> >=20
> > PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> > /usr/lib/pkgconfig is always checked as a fallback; however,
> > PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config in
> > the sysroot, which doesn't exist. On host distros where the font
>=20
>=20
> > encoding maps are stored under a different path than OE, this will break
> > font builds, because ucs2any will attempt to read the sysroot's encoding
> > maps with the host paths.
>=20
> ^ Is this description of what the patch is supposed to fix or expected
> side-effect of this change?
>=20
> Because all font recipes and meta-oe are failing since this change with
> errors like this:
>=20
> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/u=
cs2any: Can't read mapping file
> '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/shar=
e/fonts/X11/util/map-ISO8859-1': No such file or directory!
>=20
> See http://www.openembedded.org/wiki/Bitbake_World_Status

I can confirm that reverting this patch fixes font-* recipes
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/1005=
23.html

>=20
> >=20
> > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> >=20
> > ---
> >=20
> >  meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/meta/=
recipes-graphics/xorg-font/font-util_1.3.0.bb
> > index 8b42991..cc4258a 100644
> > --- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > +++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > @@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native =3D "mkfontdir-native mkf=
ontscale-native"
> >  PR =3D "${INC_PR}.0"
> > =20
> >  do_configure_prepend() {
> > -        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG_C=
ONFIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/fon=
tutil.m4.in
> > +        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG_C=
ONFIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/font=
util.m4.in
> >  }
> > =20
> >  BBCLASSEXTEND =3D "native"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PW0Eas8rCkcu1VkF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlSucbMACgkQN1Ujt2V2gBynLwCfYYJuPlNMNTqz5FMJ4g9Oi8Fh
sekAn39h3vtUMg9EDgIwy155nf+JoAz3
=cNPl
-----END PGP SIGNATURE-----

--PW0Eas8rCkcu1VkF--
