Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StIW4-0005KF-Vg; Mon, 23 Jul 2012 15:17:41 +0200
Received: by wgbdr1 with SMTP id dr1so5389771wgb.24
	for <multiple recipients>; Mon, 23 Jul 2012 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=DfMY5vli3p8ngNBOKoLCfw69NdxFIKjmxx244Fstln0=;
	b=xvVE9M8FVvmJSLytPbYp61o8rQK21rYp1FzSi8FWpE7hm14Yzaj9LVcyRl1aOLoKRP
	kcXw9QVMpFoXvgTyMbcL6edYSGi1fS08qh+T8wnYWD4nh5unparDIGrF2YhjJWo77J8i
	eiT1OBvtSlUTWCS6INERD8aDcmxwb6paB1gLcePJ9H+DF5mTcclvIBAkRKAZ5oQTr4X2
	7VcsHKevojwp3eloDDqp/UA0wglxayZVNXy2iDdm2t2/Q/lFRBjC3XQSU0E2C7e6eEoZ
	cIN3CmTO7AENy4fMrOhP2Gclj+P4OGgDM8wNyhsd2fUN0IC8VRJ1I+OhKfWGByao84WG
	UOnQ==
Received: by 10.180.78.2 with SMTP id x2mr37408644wiw.10.1343048773850;
	Mon, 23 Jul 2012 06:06:13 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm22558732wid.0.2012.07.23.06.06.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 06:06:12 -0700 (PDT)
Date: Mon, 23 Jul 2012 15:06:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120723130612.GF3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net>
	<1343043175.21788.91.camel@ted>
	<20120723113712.GE3271@jama.jama.net>
	<1343048532.21788.95.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343048532.21788.95.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Morgan Little : python: Update for python-native changes
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
X-List-Received-Date: Mon, 23 Jul 2012 13:17:41 -0000
X-Groupsio-MsgNum: 25999
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QNDPHrPUIc00TOLW"
Content-Disposition: inline

--QNDPHrPUIc00TOLW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 02:02:12PM +0100, Richard Purdie wrote:
> On Mon, 2012-07-23 at 13:37 +0200, Martin Jansa wrote:
> > On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> > > On Mon, 2012-07-23 at 13:18 +0200, Martin Jansa wrote:
> > > > On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.org =
wrote:
> > > > > Module: openembedded-core.git
> > > > > Branch: master
> > > > > Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > >=20
> > > > > Author: Morgan Little <morgan.little@windriver.com>
> > > > > Date:   Thu Jul 19 13:46:07 2012 -0400
> > > > >=20
> > > > > python: Update for python-native changes
> > > > >=20
> > > > > Add pythonnative onto the list of inherits and update the paths t=
o the binaries
> > > > > referenced in the recipe to the new paths.
> > > > >=20
> > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > > >=20
> > > >=20
> > > > Any idea why is opkg package-index now failing _sometimes_ ?
> > > >=20
> > > > | + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eg=
libc/deploy/ipk/ ']'
> > > > | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/deploy/ipk/Packages
> > > > | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/deploy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/jobs/=
shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenk=
ins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var=
/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
> > > > | Traceback (most recent call last):
> > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <module>
> > > > |     main()
> > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
> > > > |     known_paths =3D addsitepackages(known_paths)
> > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsitep=
ackages
> > > > |     for sitedir in getsitepackages():
> > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-egl=
ibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsitep=
ackages
> > > > |     sitepackages.append(os.path.join(prefix, sys.lib,
> > > > | AttributeError: 'module' object has no attribute 'lib'
> > > > | ERROR: Function failed: do_package_index (see /var/lib/jenkins/jo=
bs/shr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/pack=
age-index-1.0-r0/temp/log.do_package_index.17223 for further information)
> > > > NOTE: package package-index-1.0-r0: task do_package_index: Failed
> > >=20
> > > What is the header of opkg-make-index? Is it a path to python or
> > > a /usr/bin/env python?
> >=20
> > $ head -n1 jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_64-=
linux/usr/bin/opkg-make-index
> > #!/usr/bin/env python
>=20
> package-index doesn't inherit pythonnative. The python found from env
> would therefore be the host system python but its using files from the
> sysroot. Mixing the two is a bad idea.
>=20
> The question is how is it mixing these up, the host system python
> shouldn't be looking there for modules.
>=20
> So I'm not sure why they're getting mixed up but its likely the problem.
> Does anything jump out at you on the machine in question with the above
> in mind?

Not really and it happens only in some builds (all today - haven't seen
this error before) and sofar it failed in 4/10 image/feed builds and
worked in remaining 6.

Even for the same combination of MACHINE and target it once worked and once
failed without any metadata changes or host distro changes between.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QNDPHrPUIc00TOLW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlANTEQACgkQN1Ujt2V2gBwjigCfT6GcF4jItqejBx4xyEnzUhVF
c1gAnRQJFrazdJxM039P5nBx1h9B5bMI
=0Pm6
-----END PGP SIGNATURE-----

--QNDPHrPUIc00TOLW--
