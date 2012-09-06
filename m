Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T9c5p-0005sn-EE; Thu, 06 Sep 2012 15:26:01 +0200
Received: by wgbdr1 with SMTP id dr1so1343555wgb.24
	for <multiple recipients>; Thu, 06 Sep 2012 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+FFDAEOjdjEvV2yQVDwjcUOJj6IQimmOiTRzHOI+E+c=;
	b=NVv3rV4zvkiZUarTguHhK4oaVC0p1ZN+dCBnilCfL+VXsKAw+Iehj04pKpdeCsna6Y
	MpUSWSlcad6Ox3KyT5Iw3atsJ0D4jhxIz926lIs+fCl2VpE1kPwXg5c9dQSvLQrWPrgB
	a3I/d0pI+6thxech1XJhyf4X8radyszkxkq5wMcBrvi8QpOmu7dIgDJh6t4Mnu2KjzXh
	IDUusL+OBC8rLAvWqD+uRZOvUoo21DE2NwssaIiY4g7dU+bXJqDzMs16HKnOGijhHxzt
	Y9NxPo5xxhMFvKgVUp/EU1bLjRNBa6E8SysIwOeqoCxpxLKXeXsOYYNcGRTMmATwK6bS
	teTA==
Received: by 10.180.86.3 with SMTP id l3mr45729808wiz.16.1346937216871;
	Thu, 06 Sep 2012 06:13:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hv8sm4095971wib.0.2012.09.06.06.13.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 06:13:35 -0700 (PDT)
Date: Thu, 6 Sep 2012 15:14:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <20120906131406.GA3487@jama.jama.net>
References: <20120904115104.46A5A10383@opal>
	<20120905140516.GQ3372@jama.jama.net> <504872CD.7040407@intel.com>
MIME-Version: 1.0
In-Reply-To: <504872CD.7040407@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: autoreconf: automake failed with exit status: 1 Was: [oe-commits] Constantin Musca : automake: upgrade to 1.12.3
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
X-List-Received-Date: Thu, 06 Sep 2012 13:26:01 -0000
X-Groupsio-MsgNum: 28789
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline

--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2012 at 12:54:21PM +0300, Constantin Musca wrote:
> On 09/05/2012 05:05 PM, Martin Jansa wrote:
> > On Tue, Sep 04, 2012 at 11:51:04AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 1110da87a2395e1d516f092553e6ed542bb34805
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D1110da87a2395e1d516f092553e6ed542bb34805
> >>
> >> Author: Constantin Musca <constantinx.musca@intel.com>
> >> Date:   Mon Sep  3 10:06:42 2012 +0300
> >>
> >> automake: upgrade to 1.12.3
> >>
> >> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>
> >> ---
> >>
> >>   .../{automake_1.12.1.bb =3D> automake_1.12.3.bb}     |    6 +++---
> >>   1 files changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/=
recipes-devtools/automake/automake_1.12.3.bb
> >> similarity index 92%
> >> rename from meta/recipes-devtools/automake/automake_1.12.1.bb
> >> rename to meta/recipes-devtools/automake/automake_1.12.3.bb
> >> index 700592c..25069d7 100644
> > Has anyone seen errors like this?
> >
> > | autoreconf: running: automake --foreign --add-missing --copy --force-=
missing --warnings=3Dcross
> > | automake: warning: unknown warning category 'cross'
> > | automake: warnings are treated as errors
> > | automake: warning: autoconf input should be named 'configure.ac', not=
 'configure.in'
> > | autoreconf: automake failed with exit status: 1
> > | ERROR: autoreconf execution failed.
> > | ERROR: Function failed: do_configure (see /OE/shr-core/tmp-eglibc/wor=
k/armv7a-vfp-neon-oe-linux-gnueabi/foxtrotgps-1.1.0-r1/temp/log.do_configur=
e.32412 for further information)
> > NOTE: recipe foxtrotgps-1.1.0-r1: task do_configure: Failed
> > ERROR: Task 886 (/OE/shr-core/meta-openembedded/meta-oe/recipes-navigat=
ion/foxtrotgps/foxtrotgps_1.1.0.bb, do_configure) failed with exit code '1'
> >
> > Failed like this for first time today.. so I suspect it's caused by aut=
omake upgrade.
> >
> > Cheers,
> >
> >> --- a/meta/recipes-devtools/automake/automake_1.12.1.bb
> >> +++ b/meta/recipes-devtools/automake/automake_1.12.3.bb
> >> @@ -39,10 +39,10 @@ SRC_URI +=3D "${PATHFIXPATCH} \
> >>   	    file://python-libdir.patch \
> >>               file://py-compile-compile-only-optimized-byte-code.patch"
> >>  =20
> >> -SRC_URI[md5sum] =3D "ec25c1855cacf47e4bdee76a776b96ba"
> >> -SRC_URI[sha256sum] =3D "24bf1640679ba4a9cbe2d36422f39a81eced7f556b576=
a7a2ccfc70ca85a1e2f"
> >> +SRC_URI[md5sum] =3D "d2af8484de94cdee16d89c50aaa1c729"
> >> +SRC_URI[sha256sum] =3D "095ffaa3ac887d1eb3511bf13d7f1fc9ec0503c6a06ae=
ae05c93730cdda9a5a0"
> >>  =20
> >> -PR =3D "r1"
> >> +PR =3D "r0"
> >>  =20
> >>   do_install () {
> >>       oe_runmake 'DESTDIR=3D${D}' install
> >>
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> I have sent a patch ([PATCH] automake 1.12.3: fix warnings) that=20
> eliminates the warnings.

FWIW: Yesterday I've sent patch to fix foxtrotgps
http://patchwork.openembedded.org/patch/35989/

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBIoZ4ACgkQN1Ujt2V2gBwZlgCfV11ZC3jzCcYpPxvxy96LZ73W
A8kAnAmqt5qYYgnESWrquqIBduEJFu2s
=LaBN
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--
