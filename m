Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TQwda-0002Ct-8q; Wed, 24 Oct 2012 10:48:30 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so178919wgb.24
	for <multiple recipients>; Wed, 24 Oct 2012 01:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eTAfYipMhn9iUYvTUrlLkl7lV15xEYtpRkSQFdULxcc=;
	b=AWQhGLIgcBDoO3PNomGtNd2L4oQfl1gqcs9glxVPhZvy/ivsrGFk+seQP7oAZ/1VCw
	P1N4JL1zj4EqS6df8UewhzYZD39BxlAtzHeBgvQ4U6QFAFRn/cb5k2zuw4BT5hy3jfhs
	iJRZkFeDV9+kosBL/W3RU7V61X96S4eZ+y135piErxWZIHIti94GOSQMrzDT4M06Y3SS
	TYHyR+N+wASAYSjuD0Ondm6CCXqVLvg3xVmZaZzYgCUT0jXN9CSDnmfdtdx3KGcrVYy/
	TWX4J26WLCVd01gjOm0JkZO3HVUQ64J1hmwqv4j6hoSjrRG1jA7n5lcSqotVn6CHK0FO
	O9Hw==
Received: by 10.180.75.161 with SMTP id d1mr736882wiw.1.1351067703159;
	Wed, 24 Oct 2012 01:35:03 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id az2sm3199022wib.10.2012.10.24.01.34.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 01:35:01 -0700 (PDT)
Date: Wed, 24 Oct 2012 10:35:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121024083515.GA3269@jama.jama.net>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
	<20121018205948.GE3087@jama.jama.net>
	<20121023185454.GS3269@jama.jama.net> <50879CC0.2030104@intel.com>
	<20121024080007.GZ3269@jama.jama.net> <5087A4E4.1010801@intel.com>
MIME-Version: 1.0
In-Reply-To: <5087A4E4.1010801@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
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
X-List-Received-Date: Wed, 24 Oct 2012 08:48:30 -0000
X-Groupsio-MsgNum: 30921
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="j+Rb494BzBd9643b"
Content-Disposition: inline

--j+Rb494BzBd9643b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 24, 2012 at 11:20:52AM +0300, Andrei Dinu wrote:
> The newer code points to :
>=20
> commit be8c9c382d2d1d37b51d29b0843045121ec90213
> Author: iain <iain@sleepfive.com>
> Date:   Tue Aug 28 12:31:42 2012 +0100
>=20
>      Configure automake to generate .gz and .bz2 archives
>=20
> This is the latest commit in the gypsy git master branch.
>=20
> Also, the lastest release is pointed here :
> http://gypsy.freedesktop.org/releases/
>=20
> and it is on the same date as the last commit in git.
>=20
> I don't really know how git recipes work, do you suggest updating the PV ?

Yes, now it says
PV =3D "0.8+git${SRCPV}"

but this commit you added to SRCREV has the same code as 0.9 release,
maybe more when someone changes SRCREV next time, so change PV to
PV =3D "0.9+git${SRCPV}"

But I don't understand why recipe for 0.9 release was removed, because=20
looking at it, it seems exactly the same as this SRCREV. Maybe it was=20
repackaged later?

Ah I see, Ross wrote that bug report when there wasn't 0.9 yet.

So fix PV in git recipe and return back 0.9 recipe.

martin@jama ~ $ diff -rq gypsy gypsy-0.9
Only in gypsy-0.9: aclocal.m4
Only in gypsy: autogen.sh
Only in gypsy-0.9: config.guess
Only in gypsy-0.9: config.h.in
Only in gypsy-0.9: config.sub
Only in gypsy-0.9: configure
Only in gypsy-0.9: .configure.ac.swp
Only in gypsy-0.9: depcomp
Only in gypsy-0.9/docs: Makefile.in
Only in gypsy-0.9/docs/reference: gypsy-overrides.txt
Only in gypsy-0.9/docs/reference: html
Only in gypsy-0.9/docs/reference: Makefile.in
Only in gypsy-0.9/docs/reference: ref-gypsy-client.xml
Only in gypsy-0.9/docs/reference: ref-gypsy-server.xml
Only in gypsy-0.9/docs/reference: tmpl
Only in gypsy-0.9/docs/reference: version.xml
Only in gypsy-0.9/docs/tools: Makefile.in
Only in gypsy/docs: why-not-gpsd.html
Only in gypsy-0.9/etc: Makefile.in
Only in gypsy-0.9/examples: Makefile.in
Only in gypsy: .git
Only in gypsy: .gitignore
Only in gypsy-0.9: gtk-doc.make
Only in gypsy-0.9/gypsy: gypsy-client-bindings.h
Only in gypsy-0.9/gypsy: gypsy-discovery-bindings.h
Only in gypsy-0.9/gypsy: gypsy-marshal.c
Only in gypsy-0.9/gypsy: gypsy-marshal.h
Only in gypsy-0.9/gypsy: gypsy-server-bindings.h
Only in gypsy-0.9/gypsy: Makefile.in
Only in gypsy-0.9: Gypsy.conf
Only in gypsy: HACKING
Only in gypsy-0.9: install-sh
Only in gypsy-0.9/interfaces: Makefile.in
Only in gypsy-0.9: ltmain.sh
Only in gypsy-0.9: m4
Only in gypsy-0.9: Makefile.in
Only in gypsy-0.9: missing
Only in gypsy-0.9/src: gypsy-client-glue.h
Only in gypsy-0.9/src: gypsy-discovery-glue.h
Only in gypsy-0.9/src: gypsy-marshal-internal.c
Only in gypsy-0.9/src: gypsy-marshal-internal.h
Only in gypsy-0.9/src: gypsy-server-glue.h
Only in gypsy-0.9/src: Makefile.in

> On 10/24/2012 11:00 AM, Martin Jansa wrote:
> > On Wed, Oct 24, 2012 at 10:46:08AM +0300, Andrei Dinu wrote:
> >> Hi Martin,
> >>
> >> This change was caused by the bug :
> >>
> >> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2797
> >>
> >> I removed the tarball and kept only the git package because that is wh=
at
> >> says in the bug.
> >>
> >> Secondly, i modified the SRCREV because i took the latest version in t=
he
> >> git repo.
> > Hi,
> >
> > So this SRCREV points to newer code then 0.9 now? Then you forgot to
> > update PV to say so.
> >
> > That's why there is error about downgrading it.
> >
> > Cheers,
> >  =20
> >> If there is anything more to add please send me an email.
> >>
> >> Thanks,
> >>
> >> Andrei Dinu
> >>
> >> On 10/23/2012 09:54 PM, Martin Jansa wrote:
> >>> On Thu, Oct 18, 2012 at 10:59:48PM +0200, Martin Jansa wrote:
> >>>> On Thu, Oct 18, 2012 at 08:59:19PM +0200, Martin Jansa wrote:
> >>>>> I know you've sent
> >>>>> http://patchwork.openembedded.org/patch/37763/
> >>>>> to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
> >>>>> and only older gypsy_git.bb was added back.
> >>>>>
> >>>>> Please fix that.
> >>>> There is also this diff which isn't mentioned in your commit.
> >>>>
> >>>> -SRCREV =3D "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
> >>>> +SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
> >>>>    PV =3D "0.8+git${SRCPV}"
> >>>>    PR =3D "r2"
> >>>>
> >>>> @@ -15,4 +15,5 @@
> >>>>                        file://gypsy/gypsy-time.h;beginline=3D1;endli=
ne=3D24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> >>>>
> >>>>    SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> >>>> -           file://fixups.patch"
> >>>> +           file://fixups.patch \
> >>>> +           file://0001-gypsy-m4-directory-missing-from-structure.pa=
tch"
> >>> ping
> >>>
> >>> meta-oe is still broken because of this
> >>>
> >>> Cheers,
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--j+Rb494BzBd9643b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCHqEMACgkQN1Ujt2V2gBzQHACfSBafOrI6W7AkGqOuNZczKbfy
fW4An2PVNG8oIX8r1KNNx/ORHhAYdjqn
=JPW9
-----END PGP SIGNATURE-----

--j+Rb494BzBd9643b--
