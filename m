Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 96CAB76E99;
	Mon, 31 Aug 2015 16:03:14 +0000 (UTC)
Received: by wiclp12 with SMTP id lp12so3967915wic.1;
	Mon, 31 Aug 2015 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qe7j4OammSraiZLNjg3uW98l0kxBMkYruNIozbrc6rQ=;
	b=XJxFMRrkKOXNmm4h8mkkhcEmhXLwTLE05i+kPCJyiUi3j2DEFQl8AlVbmBCKlfPTfb
	thMIFCnj/UhEyKx5WXoxr402me9u7Qkj0f0Qwk2GwsX+Q69ecXKSV2MesjceNb5SSFr3
	L0+2D/hpMYg04dOQv/FdRXNZJaZ+RAAGnwrOysiNUV/5ZW1VCu57YsbOrP4OlsGMY+L2
	q4+JPKirPmZOzxX88zzP+K/FfbSDW7dBap/xV9v1k1Lb14ONXv98kOLRzTqiUgHoaP0Q
	nLL4f9WzLSuiXVTZNej92O3kcisoq6np0TLnl2dqOZ2Ch6+K242E2TZ/h/vu3wegL8Si
	zOzw==
X-Received: by 10.194.133.73 with SMTP id pa9mr27791229wjb.148.1441036993484; 
	Mon, 31 Aug 2015 09:03:13 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	i3sm18621441wja.42.2015.08.31.09.03.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Aug 2015 09:03:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 31 Aug 2015 18:03:18 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150831160318.GC2465@jama>
References: <20150831125632.GA2465@jama>
	<CALbNGRTScmFfjhAU+PY3Y5ZKdpk0vK9f67Kdq+7BYvPdnVv-Fg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRTScmFfjhAU+PY3Y5ZKdpk0vK9f67Kdq+7BYvPdnVv-Fg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2015-08-30
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
X-List-Received-Date: Mon, 31 Aug 2015 16:03:18 -0000
X-Groupsio-MsgNum: 70359
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4jXrM3lyYWu4nBt5"
Content-Disposition: inline

--4jXrM3lyYWu4nBt5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2015 at 03:32:42PM +0200, Andreas M=FCller wrote:
> On Mon, Aug 31, 2015 at 2:56 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> >
> > =3D=3D Failed tasks 2015-08-30 =3D=3D
> >
> > INFO: jenkins-job.sh-1.3.1 Complete log available at http://logs.nslu2-=
linux.org/buildlogs/oe/world/log.report.20150830_101221.log
> >
> > =3D=3D=3D common (16) =3D=3D=3D
> >     * /meta-openembedded/meta-efl/recipes-efl/efl/epdf_svn.bb, do_compi=
le
> >     * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.3=
0.6.bb, do_fetch
> >     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome=
-bluetooth_2.32.0.bb, do_compile
> ^ patch sent
> >     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gn=
ome-disk-utility_2.32.0.bb, do_compile
> ^ patch sent
> >     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/g=
nome-power-manager_2.32.0.bb, do_compile
> >     * /meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon=
/gnome-settings-daemon_2.32.1.bb, do_compile
> >     * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.=
2.1.bb, do_fetch
> ^ how did this return to world?

The exclude was removed as requested in:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-August/1030=
45.html

> >     * /meta-openembedded/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtool=
nix_git.bb, do_compile
> >     * /meta-openembedded/meta-multimedia/recipes-multimedia/vlc/vlc_2.2=
=2E1.bb, do_compile
> >     * /meta-openembedded/meta-networking/recipes-connectivity/inetutils=
/inetutils_1.9.4.bb, do_patch
> >     * /meta-openembedded/meta-oe/recipes-support/gd/gd_2.1.1.bb, do_com=
pile
> >     * /meta-openembedded/meta-oe/recipes-support/libdbi/libdbi-drivers_=
0.8.3-1.bb, do_compile
> >     * /meta-openembedded/meta-python/recipes-devtools/python/python-pyo=
penssl_0.15.1.bb, do_populate_sysroot
> >     * /meta-openembedded/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-not=
ifyd_0.2.4.bb, do_compile
> ^ patch sent
> >     * /meta-openembedded/meta-xfce/recipes-art/xfce4-icon-theme/xfce4-i=
con-theme_4.4.3.bb, do_populate_sysroot
> ^ patch sent
> >     * /meta-webos-ports/meta-luneui/recipes-luneui/luna-next/luna-next.=
bb, do_compile
> >
>=20
> Regards
>=20
> Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4jXrM3lyYWu4nBt5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXkesYACgkQN1Ujt2V2gBz6sACgm2dnJwj6lNwPAr2T0zoDybhT
uv8AnAzpqSFXMi/7qLca50om0gr2PSMl
=w6Ue
-----END PGP SIGNATURE-----

--4jXrM3lyYWu4nBt5--
