Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THitW-0001ff-SJ
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Sep 2012 00:18:50 +0200
Received: by wibhj13 with SMTP id hj13so303503wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 15:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i1WD1/p5TULgI4IujT9Eg8/co/tZuP3EReb3nVXDBcE=;
	b=EaGlbJlKZePAkWbLVZG4y5oQHmO97tI1+BgEYqiJ9fwY8m7orN3AFwFqQAnEtfaD1/
	PQNUSqk6C6e/fc3vdzmU9EMrQQEIiaL2bAf2g/B0QrjwB93nb5skEIdpaKsBEuA3Nxfi
	7xT1rclVmlezvIEOoKy2cXWLEyhZ91+AwMJt30DP7SEfws+wU/ki5zJJ3WwKIBVZh7J9
	3ZK2XNh/xJ8K02fBB+aIXRUSihY2o3y4n9Jtrza5xfYOsr7acJytZ8JgTMnu3cFJK6DH
	xGIs0vQFRnsVja4NYqUmzdHJwojLNbJwLuI48YadpsqSjA0yIby5M8hNDRK7Ejmy3khJ
	5Vug==
Received: by 10.216.194.148 with SMTP id m20mr4344086wen.51.1348869957360;
	Fri, 28 Sep 2012 15:05:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm1651762wib.2.2012.09.28.15.05.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 15:05:56 -0700 (PDT)
Date: Sat, 29 Sep 2012 00:06:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120928220608.GE3049@jama.jama.net>
References: <1348782166.15753.28.camel@ted>
	<20120928180251.GB3049@jama.jama.net>
	<1348867454.15753.84.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348867454.15753.84.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core Release Status
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
X-List-Received-Date: Fri, 28 Sep 2012 22:18:50 -0000
X-Groupsio-MsgNum: 30130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline

--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 10:24:14PM +0100, Richard Purdie wrote:
> On Fri, 2012-09-28 at 20:02 +0200, Martin Jansa wrote:
> > On Thu, Sep 27, 2012 at 10:42:46PM +0100, Richard Purdie wrote:
> > > We're now at -rc2 for the October release of OE-Core. I've noticed a
> > > sudden surge of patches on the list, several of which are things like
> > > version increments which are no longer really appropriate at this poi=
nt
> > > in the release cycle.
> > >=20
> > > Why haven't we branched?
> > >=20
> > > The plus side of branching now would be continued patches into master.
> > > The downside is that QA and autobuilder resources are concentrating on
> > > release and hence not on ensuring regressions are being added. I also
> > > really need my energy focused on the release rather than reviewing ot=
her
> > > code. I'm out of bandwidth so I'm putting off branching.
> > >=20
> > > There is also the risk that if we branch, people will continue with
> > > master development and ignore the release branch and I'd like to appl=
y a
> > > little pressure against this.
> > >=20
> > > So if patches are getting ignored its likely they've been deemed not
> > > suited to the state of the tree right now. I may start to queue things
> > > on master-next but no guarantees and I would ask people to try and he=
lp
> > > make the release a good one.
> > >=20
> > > If there are patches being ignored you think do qualify for -rcX, ple=
ase
> > > ping me as it is hard to keep track of everything.
> >=20
> > I don't know what to do with tune* and qt patchset.
> >=20
> > This one is not important, but if you like the idea then it would be
> > better to get it in this release already:
> > [PATCH] kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME
>=20
> The trouble is this close to release, this will likely break the
> autobuilder or qemu scripts or something like that. We can't just rename
> output like that without quite a bit of checking :(.

OK I would expect qemu-scripts to use KERNEL_IMAGE_SYMLINK_NAME link not
version specific KERNEL_IMAGE_BASE_NAME directly.

> > And I have 2 patches to remove time dependent variables from images
> > which I haven't sent to ML yet, because still testing if it has some bad
> > sideeffect and if it's enough to resolve the issue I was seeing.
> > I'll send them as RFC.
> >=20
> > commit 9c65f68dc380be34f06c4677d6867bbb874a75d1
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Wed Sep 26 15:56:05 2012 +0200
> >=20
> >     bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
> >    =20
> >     * resolves ERROR shown when bitbake -S is used for image:
> >       ERROR: Bitbake's cached basehash does not match the one we just g=
enerated
> >       (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-imag=
e-minimal.bb.do_rootfs)!
> >       ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8d=
c and b5d6e2e5952770557c48c5779ddb73fc
> >    =20
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Hmm, that might be ok...
>=20
> > commit 7173532f91a755911e4822a103c98e7b81b18cb6
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Wed Sep 26 00:57:21 2012 +0200
> >=20
> >     rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
> >    =20
> >     * I have kernel recipe which depends on other recipe to build tiny =
initramfs
> >       image, without this change it rebuilds not only that initramfs im=
age
> >       but also whole kernel when DATE or TIME is changed and OEBasicHas=
h enabled
> >     * also resolves ERROR shown when bitbake -S is used for image:
> >       ERROR: Bitbake's cached basehash does not match the one we just g=
enerated
> >       (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-imag=
e-minimal.bb.do_rootfs)!
> >       ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8d=
c and b5d6e2e5952770557c48c5779ddb73fc
> >    =20
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Doesn't the above fix obsolete this one?

No, rootfs is doing:
echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version

So patch above resolved 1 difference shown by bitbake-diffsigs, this is
2/2 to resolve other one. Now they have same hash in filename,=20
but still it sometimes shows that error about "Bitbake's cached basehash
does not match the one we just generated" but both sigdata files have
the same hash :/ (bitbake-diffsigs is still showing different
BUILDNAME).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBmH1AACgkQN1Ujt2V2gBxz8gCdEtu5FPukHDDRnxVL6at2YLQc
tvsAoLaIrllKkLLNM/t0ODyHx1ohmu84
=4iaC
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
