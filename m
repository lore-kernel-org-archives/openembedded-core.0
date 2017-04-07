Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 868F877D83
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Apr 2017 13:09:46 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o21so14829502wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Apr 2017 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7+KgNjm7fFzMGb1M6ZpVqFdn7ec+bu8Iu20RPHH0KKQ=;
	b=KAIxYIv+0jGNPWEePyn/VjTb1SHVjlDbgP2KO40Naydo+I3ao9XSAAFcVznO5MEXoJ
	JVnCmdeOELp5t6hiPczAlV5rEqdMMzj0/rcY6Bw+F9Rfg1nfN8Qf3Iv5oYSn2NseOTkG
	e6OFMc3TMz8muJHGTwatkWkxQuup4Kpb9t0so0wMBItW8AgILa2wue02E8iUMn7L2xNC
	kiqxC0YfNJE0PuI6lZyIl5WJBf8VQM1Kgx2EN46To6H+uQs4pDOh14+zSwyL8mF/gTAv
	iRobk1q2JpCVGf9sLCcEnNX0HCOfTMfBXQ5Wn5rocEjeXKUrBkpNgWaBdSPLMDk9B6AM
	+omg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7+KgNjm7fFzMGb1M6ZpVqFdn7ec+bu8Iu20RPHH0KKQ=;
	b=L5flxpVqbTiViFaDfi5ZZi1LOgpA3rOv8dBy4CXyZPhbEyfpm/RjQvoUBjvRA8z9A2
	L1l7Uta5ZZDlTztpMIRIrf2VM6TmPI1S0oPrwUOsHoLXj6xVZKjoI2W+WwFlYrZuOOHD
	/12AzOTCJbDUlVFPINSKpnho4IzBuhYr4lE1dN34/mzqVT29wRVAfLx/iP+QyeNdUkUA
	2vx7l9h9PV+RoBw7PjATIfbWxKImIW3d8ByD9Cs7z8Z8TLhJIjRrtqDtRVrQwSqozjG7
	koRdtLWljlQyYxiimLUnWYP8IukjrCE3+/TcbLOD2VYVuNGRz7PkIsfohEo6bYaQlj7R
	fyaw==
X-Gm-Message-State: AN3rC/5OEHU1YNZlQjvNXTw6eJkn4mXNmKd3fqsrkjv2wO97fM3roYgW
	KqCzMR+3GfzsTQ==
X-Received: by 10.28.22.1 with SMTP id 1mr9024740wmw.127.1491570587183;
	Fri, 07 Apr 2017 06:09:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	l41sm5968575wrl.59.2017.04.07.06.09.45
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 07 Apr 2017 06:09:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 7 Apr 2017 15:09:46 +0200
To: David Vincent <freesilicon@gmail.com>
Message-ID: <20170407130946.GA3022@jama>
References: <20170123135916.4618-1-freesilicon@gmail.com>
	<CAHiDW_FWnBo8vsQ_OTwHYDJmMDXfH1b+6UkTjWf1=qK9QiYWLg@mail.gmail.com>
	<CA+chaQdGcpevoyue494P0FkYp_C8dt4fbZ3CLoza7sVHoRSWjg@mail.gmail.com>
	<3319701.6ygbhHyYrO@crde-port-20.cahors.local>
MIME-Version: 1.0
In-Reply-To: <3319701.6ygbhHyYrO@crde-port-20.cahors.local>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Fix symlink creation
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
X-List-Received-Date: Fri, 07 Apr 2017 13:09:46 -0000
X-Groupsio-MsgNum: 95981
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 07, 2017 at 02:27:45PM +0200, David Vincent wrote:
> On jeudi 6 avril 2017 15:03:36 CEST Martin Jansa wrote:
> > I still don't understand why not use standard update-alternatives and
> > install another package with your favorite openssl.conf which has higher
> > ALTERNATIVE_PRIORITY.
>=20
> Why not, but maybe this https://bugzilla.yoctoproject.org/show_bug.cgi?
> id=3D10777 can be a stopper since libcrypto RRECOMMENDS openssl-conf

Why would it be a stopper? With u-a you can have any number of the u-a
alternative providers installed in the image at the same time.

> > This way u-a will switch to new config even when you just install the
> > package which require it on the target later and will switch back to
> > default openssl.conf when the alternative package with config file is
> > uninstalled.
> >=20
> > On Thu, Apr 6, 2017 at 12:55 PM, Jussi Kukkonen <jussi.kukkonen@intel.c=
om>
> >> So previously openssl-conf package included etc/ssl/openssl.cnf and the
> >> symlink ${libdir}/ssl/openssl.conf.
>=20
> The symlink is not inside openssl-conf package but rather inside openssl.
>=20
> >> Nothing RDEPENDS on this package (but
> >> libcrypto RRECOMMENDS it).
> >>=20
> >> After your patch the actual configuration file is still installed. In a
> >> postinst
> >>=20
> >>   * ${libdir}/ssl/openssl.conf is removed if it exists (why? If it's f=
or
> >> upgrading, then this should happen in a prerm or postrm)
> >>   * the symlink ${libdir}/ssl/openssl.conf is created
> >>=20
> >> My confusion is this: how does the above solve the problem you describ=
e?
> >> If you've managed to use RCONFLICTS to prevent the configuration packa=
ge
> >> from getting included in the image, why are changes to the package nee=
ded?
> >>=20
>=20
> To avoid creation of the symlink inside openssl package. But I agree for =
the=20
> postrm/prerm tasks instead of postinst.
>=20
> >>=20
> >> Some alternative solutions to your problem I think might work:
> >> * openssl_%.bbappend with a do_install_append() that simply copies your
> >> conf file over the one from upstream recipe. No extra packages needed
> >> * BAD_RECOMMENDATIONS or PACKAGE_EXCLUDE to prevent openssl-conf from
> >> getting included in your image, then adding your own package with your
> >> configuration (does not work for dpkg I think)
> >>=20
>=20
> I could consider this if the patch gets reverted, but I still prefer usin=
g=20
> extra packages. It's easier this way to know which configuration has been=
=20
> applied (but update-alternatives could work too).
>=20
> TBH, I say that because I've submitted a similar series of patches for op=
enssh=20
> based on the same principle. I think my main problem is the handling of=
=20
> configuration files at build time. This holds especially true for read-on=
ly=20
> rootfs where these files must be available at build time. Is there guidel=
ines=20
> for that ?
>=20
> >> Jussi
> >>=20
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> David

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWOePmgAKCRA3VSO3ZXaA
HL94AJoCit/9EAmLZNXh497JHm5YCOggggCdHbZz2ATKpgy5Z/68JCgsrnNlNb4=
=ixeL
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--
