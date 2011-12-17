Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbwaV-00084Y-OJ
	for openembedded-core@lists.openembedded.org;
	Sat, 17 Dec 2011 16:54:16 +0100
Received: by eeit10 with SMTP id t10so535532eei.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2011 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=dHV+I3LHjGyoSi7FmEVjYVUW0ls2C1x/B8M8pj/b/0M=;
	b=BO/8nSbESrG8bIYf4+8YI2L+5i2n0jASsAspboHcwOjzDLknNX//eTPI2GrumC9jVL
	ajrZ/9wy1SoPyb25DpwlxK32fx5S3Gj69FMPV5AEhChWnKonzThiuuBH4LjKfW9V2Xsq
	TLRZQQB06dIRQc+8Rfw8YomL/zTe3wJKtdFHs=
Received: by 10.14.32.15 with SMTP id n15mr1323308eea.116.1324136834985;
	Sat, 17 Dec 2011 07:47:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 54sm16671551eeo.10.2011.12.17.07.47.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 17 Dec 2011 07:47:14 -0800 (PST)
Date: Sat, 17 Dec 2011 16:47:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111217154701.GH3997@jama.jama.net>
References: <1323983329.4568.63.camel@ted>
	<20111217011658.GE3997@jama.jama.net>
	<1324085548.4568.121.camel@ted>
	<20111217092041.GF3997@jama.jama.net>
	<1324117321.4568.128.camel@ted>
	<20111217103429.GG3997@jama.jama.net>
	<1324122745.4568.136.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1324122745.4568.136.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Graham Gower <graham.gower@gmail.com>
Subject: Re: opkg: Update svn 625 -> 633 and fix preinst issues
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
X-List-Received-Date: Sat, 17 Dec 2011 15:54:16 -0000
X-Groupsio-MsgNum: 14386
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aF3LVLvitz/VQU3c"
Content-Disposition: inline

--aF3LVLvitz/VQU3c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 17, 2011 at 11:52:25AM +0000, Richard Purdie wrote:
> On Sat, 2011-12-17 at 11:34 +0100, Martin Jansa wrote:
> > On Sat, Dec 17, 2011 at 10:22:01AM +0000, Richard Purdie wrote:
> > > On Sat, 2011-12-17 at 10:20 +0100, Martin Jansa wrote:
> > > > On Sat, Dec 17, 2011 at 01:32:28AM +0000, Richard Purdie wrote:
> > > > I've tried to build image with SRCREV=3D633 and it built image fine
> > > > then I tried to apply your patch but without installorder.patch to
> > > > confirm that the issue with circular depending packages is really c=
ause
> > > > by that only and then try to fix installorder.patch to work even wi=
th
> > > > such packages, but I got many postinst errors :(.=20
> > > >=20
> > > > From your description I understood that postinst execution should be
> > > > almost the same only more logic is moved from rootfs_ipk.bbclass to=
 opkg
> > > > itself.
> > > >=20
> > > > | Collected errors:
> > > > |  * pkg_run_script: package "pam-plugin-unix" postinst script retu=
rned status 1.
> > > > |  * opkg_configure: pam-plugin-unix.postinst returned 1.
> > > > |  * pkg_run_script: package "pango-module-basic-x" postinst script=
 returned status 1.
> > > > |  * opkg_configure: pango-module-basic-x.postinst returned 1.
> > > > |  * pkg_run_script: package "pango-module-basic-fc" postinst scrip=
t returned status 1.
> > > > |  * opkg_configure: pango-module-basic-fc.postinst returned 1.
> > > > |  * pkg_run_script: package "update-modules" postinst script retur=
ned status 1.
> > > > |  * opkg_configure: update-modules.postinst returned 1.
> > > > |  * pkg_run_script: package "gdk-pixbuf-loader-png" postinst scrip=
t returned status 1.
> > > > |  * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
> > > > |  * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst scri=
pt returned status 1.
> > > > |  * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
> > > > |  * pkg_run_script: package "liberation-fonts" postinst script ret=
urned status 1.
> > > > |  * opkg_configure: liberation-fonts.postinst returned 1.
> > > > |  * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst scrip=
t returned status 1.
> > > > |  * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
> > > > |  * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst scrip=
t returned status 1.
> > > > |  * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
> > > > |  * pkg_run_script: package "ppp" postinst script returned status =
1.
> > > > |  * opkg_configure: ppp.postinst returned 1.
> > > > |  * pkg_run_script: package "ttf-dejavu-common" postinst script re=
turned status 127.
> > > > |  * opkg_configure: ttf-dejavu-common.postinst returned 127.
> > > > |  * pkg_run_script: package "ttf-dejavu-sans" postinst script retu=
rned status 127.
> > > > |  * opkg_configure: ttf-dejavu-sans.postinst returned 127.
> > > > |  * pkg_run_script: package "ffalarms" postinst script returned st=
atus 127.
> > > > |  * opkg_configure: ffalarms.postinst returned 127.
> > > > |  * pkg_run_script: package "rsyslog" postinst script returned sta=
tus 1.
> > > > |  * opkg_configure: rsyslog.postinst returned 1.
> > > > |  * pkg_run_script: package "ttf-dejavu-sans-mono" postinst script=
 returned status 127.
> > > > |  * opkg_configure: ttf-dejavu-sans-mono.postinst returned 127.
> > > > |  * pkg_run_script: package "matchbox-keyboard-im" postinst script=
 returned status 1.
> > > > |  * opkg_configure: matchbox-keyboard-im.postinst returned 1.
> > > > |  * pkg_run_script: package "hicolor-icon-theme" postinst script r=
eturned status 1.
> > > > |  * opkg_configure: hicolor-icon-theme.postinst returned 1.
> > > > |  * pkg_run_script: packaERROR: Function 'do_rootfs' failed (see /=
OE/shr-core/tmp-eglibc/work/qemuarm-oe-linux-gnueabi/shr-l
> > > > ite-image/2.0-r20/temp/log.do_rootfs.10063 for further information)
> > > > | ge "ttf-liberation-mono" postinst script returned status 127.
> > > > |  * opkg_configure: ttf-liberation-mono.postinst returned 127.
> > > > |  * pkg_run_script: package "gtk-immodule-xim" postinst script ret=
urned status 1.
> > > > |  * opkg_configure: gtk-immodule-xim.postinst returned 1.
> > > > |  * pkg_run_script: package "ca-certificates" postinst script retu=
rned status 1.
> > > > |  * opkg_configure: ca-certificates.postinst returned 1.
> > > > NOTE: package shr-lite-image-2.0-r20: task do_rootfs: Failed
> > > > ERROR: Task 9 (/OE/shr-core/meta-smartphone/meta-shr/recipes-shr/im=
ages/shr-lite-image.bb, do_rootfs) failed with exit code '
> > > > 1'
> > >=20
> > > This looks like you don't have the offline_postinstall patch applied?
> >=20
> > I have
>=20
> Please double check. That patch does things like:
>=20
> Index: trunk/libopkg/pkg.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- trunk.orig/libopkg/pkg.c	2011-12-15 15:58:39.000000000 +0000
> +++ trunk/libopkg/pkg.c	2011-12-15 20:04:50.109992736 +0000
> @@ -1297,8 +1297,9 @@
>       free(cmd);
> =20
>       if (err) {
> -	  opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n",=20
> -               pkg->name, script, err);
> +          if (!conf->offline_root)
> +	       opkg_msg(ERROR, "package \"%s\" %s script returned status %d.\n"=
,=20
> +                    pkg->name, script, err);
>  	  return err;
>       }
> =20
> and these are clearly showing up as ERRORs above. This means that:
>=20
> a) offline_root isn't set (extremely unlikely for do_rootfs to work)
> b) the patch isn't applied
>=20
> > > opkg revision 633 will not build correct metadata without the patches
> > > included.
> >=20
> > Only patch not included in my opkg build was the installorder one.
>=20
> I have my doubts about this, sorry...
> =20
> > > > > The question is whether circular depends are something opkg should
> > > > > support or not? What's debian's behaviour in that regard?
> > > >=20
> > > > Well, it did work before and from quick search it looks that such c=
ircular dependencies are=20
> > > > quite common in our metadata.
> > >=20
> > > Do you have some examples? I couldn't find any in OE-Core?
> >=20
> > I'll try.
> >=20
> > > >  So I agree that this patch is really needed to fix dbus owner,
> > > > but in case there is circular dependency we shouldn't be so strict =
about order of installs.
> > >=20
> > > So how you you handle A depends on B which depends on A and be strict
> > > about dependency order?
> >=20
> > The problem with dbus/base-passwd can be fixed by this patch, but for
> > fsogsmd* modules the order is not so important, so I think that when th=
ere
> > is circular dependency detected the order _shouldn't_ be so strict and
> > maybe warning can be shown, but it shouldn't be fatal.
>=20
> Looking at fsogsmd, that specific packages split doesn't really make
> sense. fsogsmd depends on fsogsmd-connman and fsogsmd-connman depends on
> fsogsmd. This means that both or neither can be installed but never
> either of them singly so the split is just a waste of space.
>=20
> I agree we need to improve that patch to detect loops but I'm not sure a
> warning makes sense as we can't tell the difference between a case where
> we don't care and a case where the resulting image is corrupt...

You're right, it doesn't make much sense in this case (maybe fsogsmd-connma=
n=20
wasn't linked to libfsogsmd before so it didn't had circular dependency bef=
ore),
but for example fsogsmd-config is machine specific and pulls only right set
of modules for each device. So it cannot be merged together as easy as this.

I'm changing RDEPENDS to RRECOMMENDS to break this hard dependency and buil=
d image.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aF3LVLvitz/VQU3c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7suXUACgkQN1Ujt2V2gByROQCfSvsU2yk7R1qJBFwelJRDvGzv
VDkAnRCeo8VpkZAQez1cd4ppysjZ2DLQ
=L75R
-----END PGP SIGNATURE-----

--aF3LVLvitz/VQU3c--
