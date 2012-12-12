Received: from mail-ee0-f43.google.com ([74.125.83.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tiebr-0006b1-25
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 06:11:55 +0100
Received: by mail-ee0-f43.google.com with SMTP id e49so110372eek.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xGac8X+kZ6GdEH6MpHU3A5HFixhaf4/8Rqck97EnARA=;
	b=o0SRErzYJMavcTwXP10CvYT55JNT1ldWiHQWh7FT9rLq2X6M7+lZ4bwnxR/+A4fm4I
	2/1LiLARwBwEmrZjr90HtN3yx3C+SshbzI71Q9KfE7urg4Gvp+3yrGtsd3RsBy6wPtUP
	57s5BKswCbzA8hY3x3PctZtRCNEc+kJZG14J3hcflS/SgRU29KNkUWL6xESd/Zej/63A
	/WcjxJY3K5ZCzKogLaPTZFnDA8P3B+YFinKRr0bS2/UX/9qmgKBUex4WNfHktxWUpk/r
	/oSrYxYO24YIUVygmheFFTDZqk7CjsUgUZJXktGzUvv2O//1pQ+3xUUl9WINDBMfeCeN
	lEkg==
Received: by 10.14.214.132 with SMTP id c4mr1621679eep.18.1355288242063;
	Tue, 11 Dec 2012 20:57:22 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm47251113eep.15.2012.12.11.20.57.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 20:57:21 -0800 (PST)
Date: Wed, 12 Dec 2012 05:57:36 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20121212045736.GA23338@jama.jama.net>
References: <alpine.DEB.2.02.1212061253340.15222@oneiric>
	<50C0E055.4070105@windriver.com>
	<alpine.DEB.2.02.1212061316510.16942@oneiric>
	<20121210230353.GA11623@jama.jama.net>
	<alpine.DEB.2.02.1212111424130.29254@oneiric>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1212111424130.29254@oneiric>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: slightly confused about .bbappend file and FILESPATH
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
X-List-Received-Date: Wed, 12 Dec 2012 05:11:55 -0000
X-Groupsio-MsgNum: 32536
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 02:39:16PM -0500, Robert P. J. Day wrote:
> On Tue, 11 Dec 2012, Martin Jansa wrote:
>=20
> > On Thu, Dec 06, 2012 at 01:19:57PM -0500, Robert P. J. Day wrote:
> > > On Thu, 6 Dec 2012, Mark Hatle wrote:
> > >
> > > > On 12/6/12 12:03 PM, Robert P. J. Day wrote:
> > > > >
> > > > >    currently writing a tutorial page on how .bbappend files and
> > > > > FILESPATH work, and i wanted to use a live example, but now i'm
> > > > > confused.
> > > >
> > > > The way it works is the same way as PATH in the shell.  It's just a=
 set of
> > > > search paths.
> > > >
> > > > >    using meta-ti layer, i chose to build core-image-minimal for a
> > > > > beagleboard, for which the meta-ti layer has the following under
> > > > > recipes-core/netbase/ that i want to use as an example:
> > > > >
> > > > > $ find
> > > > > .
> > > > > ./netbase_5.0.bbappend
> > > > > ./netbase-5.0
> > > > > ./netbase-5.0/beagleboard
> > > > > ./netbase-5.0/beagleboard/interfaces
> > > > > $
> > > > >
> > > > > where the .bbappend file contains only:
> > > > >
> > > > > THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))=
}"
> > > >
> > > > I believe this is the default value of 'THISDIR' already, so there =
is no
> > > > reason to specify it in the .bbappend itself.
> > > >
> > > > > FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> > > >
> > > > In this example, it's incorrect.  As you have a directory named
> > > > "netbase-5.0", so your FILESPATH should be: ${THISDIR}/${PN}-${PV}
> > >
> > >   ok, so that's just a bug in the setting of FILESPATH in that one
> > > example?  whew.  i was seriously wondering how badly i misunderstood
> > > how this feature worked.
> > >
> > >   as soon as my beagle core-image-minimal finishes building, i should
> > > be able to trivially check that the interfaces file used to populate
> > > the rootfs image is the one from oe-core and not the one that should
> > > have come from meta-ti.
> >
> > See FILESEXTRAPATHS in other bbappends and
> >
> > meta/classes/base.bbclass:FILESPATH =3D "${@base_set_filespath(["${FILE=
_DIRNAME}/${BP}","${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
> >
> > + definition of fce base_set_filespath:
> > meta/classes/utils.bbclass:def base_set_filespath(path, d):
>=20
>   i'm still not sure what your point is here. =20

That all you need is 1 line:
FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BP}:"

> to be perfectly clear,
> if i'm pulling in the meta-ti layer and building a core-image-minimal
> for a beagleboard, it appears that the overriding network interfaces
> file from the meta-ti layer does *not* override the one from oe-core
> since this is the full value of FILESPATH being used:
>=20
> # FILESPATH=3D"${@base_set_filespath(["${THISDIR}/${PN}"], d)}
> ${@base_set_filespath(["${FILE_DIRNAME}/${BP}", "${FILE_DIRNAME}/${BPN}",=
 "${FILE_DIRNAME}/files"], d)}"
> FILESPATH=3D"/home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/net=
base/linux-gnueabi
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/arm
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/build-li=
nux
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/pn-netba=
se
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/dm814x-e=
vm
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/ti814x
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/armv7a
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/class-ta=
rget
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/forcevar=
iable
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/libc-gli=
bc
> /home/rpjday/OE/dist/layers/meta-ti/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/linux-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/build-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/pn-netbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/dm814x-evm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/ti814x
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/armv7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/class-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/forcevariable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0=
/libc-glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase-5.0/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/lin=
ux-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/bui=
ld-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/pn-=
netbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/dm8=
14x-evm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/ti8=
14x
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/arm=
v7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/cla=
ss-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/for=
cevariable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/lib=
c-glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/netbase/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/linux=
-gnueabi
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/arm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/build=
-linux
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/pn-ne=
tbase
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/dm814=
x-evm
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/ti814x
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/armv7a
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/class=
-target
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/force=
variable
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/libc-=
glibc
> /home/rpjday/OE/dist/layers/oe-core/meta/recipes-core/netbase/files/"
>=20
>   note that the directories from the meta-ti layer don't include the
> (correct) value of netbase/netbase-5.0, since (as i understand it) the
> line in base.bbclass you refer to:
>=20
> FILESPATH =3D "${@base_set_filespath(["${FILE_DIRNAME}/${BP}",  \
>   "${FILE_DIRNAME}/${BPN}", "${FILE_DIRNAME}/files"], d)}"
>=20
> only causes the expansion into the common variants of the directory
> name for the oe-core layer (as you can see above).  so under oe-core,
> you'll get the automatic directory name variants netbase, netbase-5.0
> and files (exactly what you see above).
>=20
>   but under the meta-ti layer for netbase, you *don't* get that since
> here's the netbase_5.0.bbappend file:
>=20
>   THISDIR :=3D "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
>   FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
>=20
> which (unless i'm cripplingly mistaken) will prepend the set of
> directories *only* under precisely that name "${THISDIR}/${PN}", which
> is exactly netbase/netbase, which is wrong.
>=20
>   am i completely misunderstanding what's happening here?  as i see
> it, the trivial fix is to simply tweak the .bbappend file to read:
>=20
> FILESPATH =3D. "${@base_set_filespath(["${THISDIR}/${PN}-${PV}}"], d)}:"
>=20
> i already submitted a patch for that to the meta-ti list, i just want
> to confirm that the above really is a bug in the netbase .bbappend
> file in that it won't pick up the overriding interfaces file.
>=20
> rday
>=20
> --=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>=20
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDIDsAACgkQN1Ujt2V2gBx5GACfbSnFzUXIQfStcR/Q/rIrdZEL
/1EAoJV1fJEIXQirG3pSZd6Qoy0q8Jbi
=hJaa
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
