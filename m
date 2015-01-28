Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE85872608;
	Wed, 28 Jan 2015 13:40:41 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id k48so20870971wev.12;
	Wed, 28 Jan 2015 05:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LgporEVcPBvte/ZVIGEPWHQq0neBvIKvv15O++QYnsk=;
	b=uUlFP5p1PqoIB0DNxHCQUmNPg1Wn+RgXjm4cmt7ULuDZ04wnH49+XBp4CkmA1MwIXt
	CqnzW3Q+05cIgojTc9/hLHFt8gbvgJBBhqH2hlVa7F76TwdwAhkyHWuuFZIsZ7JrYQJz
	LEGB1NfvlntPMVd+jX2b8+DvVj2rKiM1xloFtw2SwvG9V8s34SZsmH3asy2JutxJUG9N
	U7UYZ4is6mfjbpEdPhxXHiQvzRTRGnGomV0e31HriBJJDjNy6nbejNNYmBbwypwLVD4f
	j2U0bOsrKUam/024Tqzeji3lP1xEVyJCT3UuINIYo5cqbm7nGRo/CY7NGJjk/QMD2rxt
	HtTQ==
X-Received: by 10.194.143.12 with SMTP id sa12mr7473987wjb.101.1422452441805; 
	Wed, 28 Jan 2015 05:40:41 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kp10sm5921847wjc.45.2015.01.28.05.40.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 05:40:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 28 Jan 2015 14:40:42 +0100
To: openembedded-core@lists.openembedded.org,
	Richard Tollerton <rich.tollerton@ni.com>
Message-ID: <20150128134042.GI2477@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150107141256.GM29986@jama> <20150108120155.GH3972@jama>
MIME-Version: 1.0
In-Reply-To: <20150108120155.GH3972@jama>
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
X-List-Received-Date: Wed, 28 Jan 2015 13:40:49 -0000
X-Groupsio-MsgNum: 61778
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nEsDIrWrg+hrB7l1"
Content-Disposition: inline

--nEsDIrWrg+hrB7l1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 08, 2015 at 01:01:55PM +0100, Martin Jansa wrote:
> On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
> > On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 89a29a3ad0742cd713e739d3d460be7711966679
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D89a29a3ad0742cd713e739d3d460be7711966679
> > >=20
> > > Author: Richard Tollerton <rich.tollerton@ni.com>
> > > Date:   Fri Dec 12 13:34:00 2014 -0600
> > >=20
> > > font-util: Fix incorrect PKG_CONFIG_PATH
> > >=20
> > > PKG_CONFIG_PATH always defaults to /usr/lib/pkgconfig, and the host
> > > /usr/lib/pkgconfig is always checked as a fallback; however,
> > > PKG_CONFIG_PATH is currently (incorrectly) set to /usr/lib/pkg-config=
 in
> > > the sysroot, which doesn't exist. On host distros where the font
> >=20
> >=20
> > > encoding maps are stored under a different path than OE, this will br=
eak
> > > font builds, because ucs2any will attempt to read the sysroot's encod=
ing
> > > maps with the host paths.
> >=20
> > ^ Is this description of what the patch is supposed to fix or expected
> > side-effect of this change?
> >=20
> > Because all font recipes and meta-oe are failing since this change with
> > errors like this:
> >=20
> > /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin=
/ucs2any: Can't read mapping file
> > '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/sh=
are/fonts/X11/util/map-ISO8859-1': No such file or directory!
> >=20
> > See http://www.openembedded.org/wiki/Bitbake_World_Status
>=20
> I can confirm that reverting this patch fixes font-* recipes
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/10=
0523.html

Ping

> > > Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> > > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > >=20
> > > ---
> > >=20
> > >  meta/recipes-graphics/xorg-font/font-util_1.3.0.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb b/met=
a/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > index 8b42991..cc4258a 100644
> > > --- a/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > +++ b/meta/recipes-graphics/xorg-font/font-util_1.3.0.bb
> > > @@ -17,7 +17,7 @@ RDEPENDS_${PN}_class-native =3D "mkfontdir-native m=
kfontscale-native"
> > >  PR =3D "${INC_PR}.0"
> > > =20
> > >  do_configure_prepend() {
> > > -        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG=
_CONFIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkg-config\" pkg-config#g" ${S}/f=
ontutil.m4.in
> > > +        sed -i "s#MAPFILES_PATH=3D\`pkg-config#MAPFILES_PATH=3D\`PKG=
_CONFIG_PATH=3D\"${STAGING_LIBDIR_NATIVE}/pkgconfig\" pkg-config#g" ${S}/fo=
ntutil.m4.in
> > >  }
> > > =20
> > >  BBCLASSEXTEND =3D "native"
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-commits mailing list
> > > Openembedded-commits@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nEsDIrWrg+hrB7l1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTI5toACgkQN1Ujt2V2gBxvLwCghpQ143e24iqdY3AYGjIycOUR
kFAAn1Ot5k+7k7YMpAMrUHkd/0E0UUUS
=tWgs
-----END PGP SIGNATURE-----

--nEsDIrWrg+hrB7l1--
