Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKA69-0004PG-Jj
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:18:14 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so4234702pbc.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 09:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RYu3OGKg+fdktVo4QvHIEsCCisy9+Q2c3SAj4JwutG0=;
	b=vbkw/yuHGAFvgOIiJsgub2BEW96SR+lwgP8bNrafzwMyZZ/fEeGHSIL5OvxP4vismq
	h9kfDMYGAEPkIHSAYmU7GiBDWaUXpIqoZockXvyP170z2Q68fw8qmXgBAUKTepsdkwHH
	KxcipFG989j+BeXnSMsaAL2ffHcEE/bTpFSZxrxDErzxVvapAtCeOxXUYtarRnmt7pm+
	8x63pORJAt3ICvB2N2bHj1MR8yUV9mJfzHJPd3iE3KU7WtPshzHvJkHMH5+PZLHExXSK
	PvdsXaxu7PFC/+VFkKBTc1I8pLap7qPnjsEEHHQVjo237luo4LcA4pJr6A6VZs1w6Zje
	DSUA==
X-Received: by 10.66.216.198 with SMTP id os6mr18610641pac.145.1364227274564; 
	Mon, 25 Mar 2013 09:01:14 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id tf8sm9309470pbc.42.2013.03.25.09.01.11
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 25 Mar 2013 09:01:12 -0700 (PDT)
Date: Mon, 25 Mar 2013 17:01:05 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130325160105.GC7539@jama>
References: <20130322170539.C5237504C8@opal> <20130325140816.GA7539@jama>
	<51505C56.8040508@intel.com> <20130325145230.GB7539@jama>
	<1364224967.3097.54.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1364224967.3097.54.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : mesa: rename mesa-dri recipe to just mesa
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
X-List-Received-Date: Mon, 25 Mar 2013 16:18:17 -0000
X-Groupsio-MsgNum: 37015
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline

--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2013 at 03:22:47PM +0000, Richard Purdie wrote:
> On Mon, 2013-03-25 at 15:52 +0100, Martin Jansa wrote:
> > On Mon, Mar 25, 2013 at 04:16:54PM +0200, Laurentiu Palcu wrote:
> > >=20
> > >=20
> > > On 03/25/2013 04:08 PM, Martin Jansa wrote:
> > > > On Fri, Mar 22, 2013 at 05:05:39PM +0000, git@git.openembedded.org =
wrote:
> > > >> Module: openembedded-core.git
> > > >> Branch: master
> > > >> Commit: c8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> > > >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dc8bbb9983bcc7cfc5332e89c3e8148505b4ca83f
> > > >>
> > > >> Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
> > > >> Date:   Tue Mar 19 18:23:56 2013 +0200
> > > >>
> > > >> mesa: rename mesa-dri recipe to just mesa
> > > >>
> > > >> Rename mesa-dri recipes to just mesa. Also, replace all references=
 to
> > > >> mesa-dri in all recipes/configs.
> > > >>
> > > >> The reason for this renaming (quote from bugzilla):
> > > >>
> > > >> "mesa-dri is a artefact of mesa-xlib existing, which doesn't anymo=
re.
> > > >> mesa-dri should be renamed to mesa."
> > > >>
> > > >> [YOCTO #3385]
> > > >=20
> > > > How is this supposed to work with incremental builds?
> > > >=20
> > > > WARNING: The recipe mesa is trying to install files into a shared a=
rea
> > > > when those files already exist. Those files and their manifest loca=
tion
> > > > are:
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so
> > > >    Matched in manifest-qemux86-64-mesa-dri
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.la
> > > >    Matched in manifest-qemux86-64-mesa-dri
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgbm.so.1.=
0.0
> > > >    Matched in manifest-qemux86-64-mesa-dri
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv2.so=
=2E2.0.0
> > > >    Matched in manifest-qemux86-64-mesa-dri
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM=
=2Eso.1.1.0
> > > >    Matched in manifest-qemux86-64-mesa-dri
> > > >    /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libGLESv1_CM=
=2Ela
> > > > .. and lot more ..
> > > >=20
> > > > from what I remember this means, that old mesa-dri files will be ke=
pt in
> > > > sysroot until I do build from scratch (or sstate-cache). That can be
> > > > pretty bad when mesa is upgraded to some new version required by ot=
her
> > > > components and my incremental sysroot will still keep old mesa-dri
> > > > instead.
> > > >=20
> > > > Yes, I can cleansstate mesa-dri before updating oe-core to include =
this
> > > > commit or revert this commit to cleansstate and then remove revert..
> > > > but that's not something average OE user will understand and do.
> > >=20
> > > I understand your point here but, frankly, I have no clue how this co=
uld
> > > have been avoided... Are there any means in oe-core that would allow
> > > removing the old files from the sysroot?
> >=20
> > I don't think there is something for that now, but the same problem is
> > for PACKAGE_ARCH changes :/. I'm not sure if such renames and arch
> > changes are worth it without proper support in OE.
> >=20
> > Maybe we should introduce something like:
> > REPLACES =3D "${TUNE_PKGARCH}:mesa-dri"
> >=20
> > and use it for PACKAGE_ARCH changes too (e.g. from TUNE_PKGARCH to
> > allarch)
> > REPLACES =3D "${TUNE_PKGARCH}:foo"
> > This can be a bit more complicated because it would create variable
> > dependency from new allarch recipe to old PKGARCH (to know which files
> > need to be removed) :/.
>=20
> I agree there is a problem in this area and at the moment I'm struggling
> to see how we can fix it. We probably do need some extra information to
> hint to sstate what should be removed as currently it can't figure it
> out.
>=20
> Can you file an enhancement request with the above idea and a general
> description of the problem cases we've seen so far?

done
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFQdMEACgkQN1Ujt2V2gBzFVQCcCo89XdYAzKVXBeZuhPUPHEWz
QREAoK34woSQsF77FSVcSnGbbDdnD13W
=fqqw
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
