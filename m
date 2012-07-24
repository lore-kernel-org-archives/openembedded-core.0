Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1StaB2-00041j-1T; Tue, 24 Jul 2012 10:09:08 +0200
Received: by weyr6 with SMTP id r6so4562225wey.6
	for <multiple recipients>; Tue, 24 Jul 2012 00:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1WY/Pxq+B7ILwrCCPB2CWcFXVqHgF30urCPfOG1w3fk=;
	b=nR+DoeqNYAv3HFOjGBr9wvSWRdgC64G7p3dV9r4hrWlc2mrqfczkVLAZlRH9rkjUx3
	xe6Sq8ubmMwo5MGubLFLSF37IPa5AJ/bjv22YYih/m0dsfK4qGzkcnD9d7Q/7YC3DMpa
	YWeltN4OU33wzwPEYYUh0r6wiQ4CJ7uwSGy2UDvqy0rBsvdd9AXSoM9Z/dO8yM+ZQSoY
	RLg/pjdN+85k4BEf9K9VpsMTafx2UGHwpuLMKD5vetGnk7KGFZzIQNzK1IOYGf7owJjM
	CflXDr54C/UYBfu3uEPqwu9QIo4Z96e30psJ/oeiji0oaErghM8nrO8iU83KrJV+Lt+p
	Apag==
Received: by 10.180.87.199 with SMTP id ba7mr4580197wib.10.1343116659914;
	Tue, 24 Jul 2012 00:57:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm4880217wid.1.2012.07.24.00.57.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jul 2012 00:57:38 -0700 (PDT)
Date: Tue, 24 Jul 2012 09:57:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120724075740.GG3271@jama.jama.net>
References: <20120722104358.0339C10217@opal>
	<20120723111829.GA20311@jama.jama.net>
	<1343043175.21788.91.camel@ted>
	<20120723113712.GE3271@jama.jama.net>
	<1343048532.21788.95.camel@ted>
	<20120723130612.GF3271@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120723130612.GF3271@jama.jama.net>
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
X-List-Received-Date: Tue, 24 Jul 2012 08:09:08 -0000
X-Groupsio-MsgNum: 26050
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QWpDgw58+k1mSFBj"
Content-Disposition: inline

--QWpDgw58+k1mSFBj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 23, 2012 at 03:06:12PM +0200, Martin Jansa wrote:
> On Mon, Jul 23, 2012 at 02:02:12PM +0100, Richard Purdie wrote:
> > On Mon, 2012-07-23 at 13:37 +0200, Martin Jansa wrote:
> > > On Mon, Jul 23, 2012 at 12:32:55PM +0100, Richard Purdie wrote:
> > > > On Mon, 2012-07-23 at 13:18 +0200, Martin Jansa wrote:
> > > > > On Sun, Jul 22, 2012 at 10:43:53AM +0000, git@git.openembedded.or=
g wrote:
> > > > > > Module: openembedded-core.git
> > > > > > Branch: master
> > > > > > Commit: 284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&=
a=3Dcommit;h=3D284a65d55f0ffad0f4f7f32d72da0f9410578643
> > > > > >=20
> > > > > > Author: Morgan Little <morgan.little@windriver.com>
> > > > > > Date:   Thu Jul 19 13:46:07 2012 -0400
> > > > > >=20
> > > > > > python: Update for python-native changes
> > > > > >=20
> > > > > > Add pythonnative onto the list of inherits and update the paths=
 to the binaries
> > > > > > referenced in the recipe to the new paths.
> > > > > >=20
> > > > > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.o=
rg>
> > > > > >=20
> > > > >=20
> > > > > Any idea why is opkg package-index now failing _sometimes_ ?
> > > > >=20
> > > > > | + '[' -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-=
eglibc/deploy/ipk/ ']'
> > > > > | + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/deploy/ipk/Packages
> > > > > | + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/deploy/ipk/Packages.flock -c 'opkg-make-index -r /var/lib/jenkins/job=
s/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/je=
nkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /v=
ar/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/'
> > > > > | Traceback (most recent call last):
> > > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 569, in <modul=
e>
> > > > > |     main()
> > > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 552, in main
> > > > > |     known_paths =3D addsitepackages(known_paths)
> > > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 329, in addsit=
epackages
> > > > > |     for sitedir in getsitepackages():
> > > > > |   File "/var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-e=
glibc/sysroots/x86_64-linux/usr/lib/python2.7/site.py", line 303, in getsit=
epackages
> > > > > |     sitepackages.append(os.path.join(prefix, sys.lib,
> > > > > | AttributeError: 'module' object has no attribute 'lib'
> > > > > | ERROR: Function failed: do_package_index (see /var/lib/jenkins/=
jobs/shr-core/workspace/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/pa=
ckage-index-1.0-r0/temp/log.do_package_index.17223 for further information)
> > > > > NOTE: package package-index-1.0-r0: task do_package_index: Failed
> > > >=20
> > > > What is the header of opkg-make-index? Is it a path to python or
> > > > a /usr/bin/env python?
> > >=20
> > > $ head -n1 jobs/shr-core/workspace/shr-core/tmp-eglibc/sysroots/x86_6=
4-linux/usr/bin/opkg-make-index
> > > #!/usr/bin/env python
> >=20
> > package-index doesn't inherit pythonnative. The python found from env
> > would therefore be the host system python but its using files from the
> > sysroot. Mixing the two is a bad idea.
> >=20
> > The question is how is it mixing these up, the host system python
> > shouldn't be looking there for modules.
> >=20
> > So I'm not sure why they're getting mixed up but its likely the problem.
> > Does anything jump out at you on the machine in question with the above
> > in mind?
>=20
> Not really and it happens only in some builds (all today - haven't seen
> this error before) and sofar it failed in 4/10 image/feed builds and
> worked in remaining 6.
>=20
> Even for the same combination of MACHINE and target it once worked and on=
ce
> failed without any metadata changes or host distro changes between.

env doesn't show anything interesting related to python

changing shebang to
path/tmp-eglibc/sysroots/x86_64-linux/usr/bin/python-native/python

made all currently failing builds to succeed again, but the issue is
still there..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QWpDgw58+k1mSFBj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAOVXQACgkQN1Ujt2V2gByu/QCgoIzIRiQgmrNzXxkelBAZO0iJ
7YEAoKbWKEDZjTmXc6UZ4B9cTJGCOcMO
=xi7E
-----END PGP SIGNATURE-----

--QWpDgw58+k1mSFBj--
