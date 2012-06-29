Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SkUQe-0005U9-2L; Fri, 29 Jun 2012 08:11:40 +0200
Received: by eaal1 with SMTP id l1so1162568eaa.6
	for <multiple recipients>; Thu, 28 Jun 2012 23:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AWZ1hXkHIAaZxGWhsfIvLYSTn0aT8jCBA4pMrmuYGPw=;
	b=JOuIowvEFXKsIv48YEZLEHaw5r2Hdu+4IQlorrg2IfUxgnSv9MbVtmXNuqerw6Rq+D
	VoseH2lJSkgRA773iLUdMgMPS8k57fY6nVoq76oJg1ht8kP2904QaApoLJDH6igGSstZ
	vXsgH6NeVtRgwII4YUtyDZjyXq/AXiQ+4SmYAAJnGIInXhEG/ilrIwiGtj3fyoTWDeZc
	fysgU+tdE4Ojfwghw7pPYKNXqhTQYVrtqLqLg0i9SF+CdlpLK458wrPwYjtRXnwL5y+N
	jCqne05lVBW9yvf7tp17lNbRpDnj++bo3Hx3bBUNBDVBbTwT3ETP/4mE3tv0oiF91i6S
	yEMQ==
Received: by 10.180.109.129 with SMTP id hs1mr2139862wib.0.1340949644256;
	Thu, 28 Jun 2012 23:00:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm4007332wiy.3.2012.06.28.23.00.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 23:00:43 -0700 (PDT)
Date: Fri, 29 Jun 2012 08:00:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120629060037.GD3961@jama.jama.net>
References: <20120628152441.4D5571032F@opal>
	<20120628213215.GC3961@jama.jama.net>
	<CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OKVFgLnSJMMVOZLuuMyfDZXMpriZR_q0O7PjzoJMij8Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Bruce Ashfield : kern-tools: add buildall and robustness fixes
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
X-List-Received-Date: Fri, 29 Jun 2012 06:11:40 -0000
X-Groupsio-MsgNum: 24297
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KdquIMZPjGJQvRdI"
Content-Disposition: inline

--KdquIMZPjGJQvRdI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 07:31:45PM -0400, Bruce Ashfield wrote:
> On Thu, Jun 28, 2012 at 5:32 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Jun 28, 2012 at 03:24:41PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: be3cff86d55db6255e036d68e943e527802b4f4c
> >> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dbe3cff86d55db6255e036d68e943e527802b4f4c
> >>
> >> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> >> Date: =A0 Fri Jun 15 15:26:44 2012 -0400
> >>
> >> kern-tools: add buildall and robustness fixes
> >>
> >> Updating the kern-tools SRCREV to pickup the following functionality:
> >>
> >> =A0- buildall: provides the ability to build all kernel branches
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0without a build system, only a cross compil=
er and configme
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0are required.
> >>
> >> =A0- robustness/cleanups: obselete/unused code removal and general rob=
ustness
> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fixes from Paul Gortma=
ker and Bruce Ashfield
> >
> > is this expected with latest kern-tools/linux-yocto and qemux86-64?
> >
> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a=
533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_config=
check: Start
> > ed
> > NOTE: validating kernel configuration
> > find: warning: -path /OE/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/l=
inux-yocto/linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_=
3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0/linux/ will not match anythin=
g because it ends with /.
> > This BSP sets 1 kernel options that are possibly non-hardware related.
> > The full list can be found in your kernel src dir at:
> > meta/cfg/standard/common-pc-64/specified_non_hdw.cfg
> >
> > There were 1 instances of config fragment errors.
> > The full list can be found in your kernel src dir at:
> > meta/cfg/standard/common-pc-64/fragment_errors.txt
> >
> > NOTE: package linux-yocto-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a=
533cd0_3+a1cdb60720c452c3965eaec3ec2cd10f06261cc5-r0: task do_kernel_config=
check: Succeeded
> >
> >
> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-y=
octo-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3=
965eaec3ec2c
> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/specified_no=
n_hdw.cfg
> > CONFIG_BLOCK
> > OE @ ~/shr-core/tmp-eglibc/work/qemux86_64-oe-linux/linux-yocto/linux-y=
octo-3.4.3+git3+d65afd9e42230a3ef4cc1f9ad62d0aa84a533cd0_3+a1cdb60720c452c3=
965eaec3ec2c
> > d10f06261cc5-r0/linux $ cat meta/cfg/standard/common-pc-64/fragment_err=
ors.txt
> > Warning: Value of CONFIG_NET_CLS_CGROUP is defined multiple times withi=
n fragment meta/cfg/kernel-cache/features/net_sched/net_sched.cfg:
> > CONFIG_NET_CLS_CGROUP=3Dy
> > CONFIG_NET_CLS_CGROUP=3Dy
>=20
> It is, only because I was waiting for my other queued changes to get pull=
ed
> before sending another batch:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/commit/?id=
=3D0329bbc053c97f9b250454ff6a60727f75973706

Ah OK, from those validation messages it wasn't very clear if it's
info/warning/error/fatal.

BTW: there is typo in this new commit 'dupicate'

Cheers,

>=20
> Cheers,
>=20
> Bruce
>=20
> >
> > Cheers,
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
>=20
>=20
> --=20
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KdquIMZPjGJQvRdI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/tRIUACgkQN1Ujt2V2gBxHCQCguGnF+Aq1+JCgJSj5a4iV6RQ0
YPQAn3V8xjnkhl1cTzMoYCji0Sg7d/Zl
=lcmu
-----END PGP SIGNATURE-----

--KdquIMZPjGJQvRdI--
