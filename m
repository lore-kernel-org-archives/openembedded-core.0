Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOobZ-0004Vw-Pj
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 13:17:21 +0200
Received: by wera1 with SMTP id a1so1933450wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 04:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sH8Tu8B64HgZAvIQMyl2VBELJOM4iKIhvSaqCbu8xxg=;
	b=Tpz2oX2HePDf3vMGVF5R7xwjZgTPLyHqdchnDy6A+tmZBueKfCnscpoEW/+0svtZQB
	LTnMl76CJp022ruGa2+fwcOlwzW7kRDPBqHmGcoM5kD7rsi0bYOxEnnH9v27gW6qyo6U
	GGk9rTlEzUdw5umJFQQk+3ETkDv1Dna7KpIMn0tV4uqWCNvILG4vvljGgXnDlZ439Mbn
	srdAONBYXMkU4RRWhHGjFhrcvI3IxH2em6FSoiejU3CQaHVPZUs3/HJzfCRVrgQeeJ00
	tOuwt6BSwXSPj+zveRbvJpExL0gQTULE/1CMiU/fjU/LfWnIWC0NgyPbC8ZiWDCuyeXm
	7Vyg==
Received: by 10.216.135.131 with SMTP id u3mr12450788wei.46.1335784058841;
	Mon, 30 Apr 2012 04:07:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h8sm44058973wix.4.2012.04.30.04.07.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 04:07:37 -0700 (PDT)
Date: Mon, 30 Apr 2012 13:07:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430110737.GD3664@jama.jama.net>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<20120429091230.GB350@jama.jama.net>
	<CAMKF1soP1RTPBz6agsVvYFvQKdcnd2pyXyHSm3m8313SRjp6jQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soP1RTPBz6agsVvYFvQKdcnd2pyXyHSm3m8313SRjp6jQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 11:17:21 -0000
X-Groupsio-MsgNum: 21324
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VMt1DrMGOVs3KQwf"
Content-Disposition: inline

--VMt1DrMGOVs3KQwf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 29, 2012 at 08:36:05AM -0700, Khem Raj wrote:
> On Sun, Apr 29, 2012 at 2:12 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Wed, Apr 25, 2012 at 04:31:53PM -0700, Khem Raj wrote:
> >> Hello
> >>
> >> Now that release is almost out of door. I would like some eyes on the
> >> gcc-4.7 work
> >> and mips64 architecture support that I have done meanwhile
> >>
> >> I have made sure that gcc-4.6 still keeps working and I have patches
> >> for gcc-4.5 too
> >> for meta-oe too. I have repeatedly built core-image-sato and
> >> core-image-minimal for uclibc/eglibc
> >> but more coverage would be nicer.
> >>
> >> The patches are posted here
> >>
> >> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/mi=
sc
> >>
> >> I would appreciate any feedback or testing on this
> >
> > I got some errors while building gcc* recipes (overwriting header
> > files in work-shared or something like that) but that's not new, gcc-4.6
> > was failing the same - restarting build few times and it will succeed
> > once.
>=20
> hmm more details on this one would be better. May be its a bug in gcc
> build system

I'll include log of our discussion on #yocto from yesterday:

20:56 < JaMa> khem: those gcc build issues are always about different const=
ant or invalid file (expected } or something) so as I said before I believe=
 it's some sort of race condition with parallel build in gcc or with parall=
el build of all those *gcc* recipes, but hard to reproduce because with sec=
ond run it's usually gone
20:57 < khem> hmmm
20:57 < khem> JaMa: so the build fails saying what ?
20:57 < khem> first time
20:58 < JaMa> thanks to RP's fix I can at least rebuilt just the one which =
was failing instead of all *gcc* again
20:58 < JaMa> undeclared constant or expected } or something, I think each =
time the error is a bit different
20:58 < khem> JaMa: I have changed gcc-4.7 to avoid some overlappings which=
 should help too
20:59 < khem> oh I see
20:59 < khem> that means a .h file is not generated yet and is being refere=
nced or included
20:59 < khem> and you said its looking in srcdir ?
21:00 < JaMa> last time we talked about it, I've blamed do_headerfix becaus=
e it was running in parallel with do_compile in some other *gcc* recipe
=2E..
21:32 < JaMa> khem: I've found couple of old build logs with gcc failing ht=
tp://build.shr-project.org/tests/jama/gcc-upgrade-issue/

Cheers,

>=20
> >
> > My minimal shr-lite-image compiles now fine and works on om-gta02
> > (armv4t) sofar without segfaults.. so looks good.
>=20
> nice
>=20
> >
> > For normal image and feeds I've few more recipes which are failing with=
 gcc-4.7:
> >
> > meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb
> > =A0| Unknown parameter a interfaceName for tags/attrs
> > =A0| make[2]: *** [DerivedSources/WebCore/HTMLNames.cpp] Error 255
> > =A0http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-s=
hr-image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/webkit-efl-1.7=
=2E3+svnr105069-r1/
> > =A0I'm upgrading this one instead of fixing it, because we had some
> > =A0issues in runtime with current version, but new version needs newer
> > =A0libsoup-2.4->glib-2.0->gobject-introspection->etc and fails with
> > =A0different compilation issues.. so maybe if you know how to easily fix
> > =A0it in current, we can, otherwise I'll continue to work on upgrade
>=20
> I can surely provide you a fix once I look at sources. But seems  you
> have more than one problems that may not be fixed. So upgrading has a
> slight chance of fixing both of your issues and introducing many more
> :) but lets try upgrade route and if then
> we need 4.7 patch ping me.
>=20
> >
> > =A0BTW: similar fix as you did for webkit-gtk is in upstream r109509
> >
>=20
> Nice as long as the things are fixed I am happy.
>=20
>=20
> > meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
> > =A0../../../src/frontend/common/TemplateBuilder.hh:54:42: error: redecl=
aration of 'SmartPtr<typename ElementBuilder::type> elem'
> > =A0../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'Smart=
Ptr<typename ElementBuilder::type> elem' previously declared here
> > =A0http://norman-schleicher.de/jenkins/job/shr-core-branches-om-gta02-s=
hr-image/ws/shr-core/tmp-eglibc/work/armv4t-oe-linux-gnueabi/gtkmathview-0.=
8.0-r1/
> >
> > meta-smartphone/meta-shr/recipes-shr/3rdparty/numptyphysics_svn.bb
> > =A0fixed in shr branch
>=20
> good
>=20
>=20
> >
> > meta-mozilla/recipes-mozilla/firefox/firefox_10.0.2.bb
> > =A0| /var/lib/jenkins/jobs/shr-core-branches/workspace/shr-core/tmp-egl=
ibc/work/armv7a-vfp-neon-oe-linux-gnueabi/firefox-10.0.2-r1/mozilla-release=
/ipc/chromium/src/base/file_util.cc:228:35: error: 'ftruncate' was not decl=
ared in this scope
> > =A0probably easy to fix, adding Otavio to CC (maybe he has upgrade or f=
ix
> > =A0ready)
> >
>=20
> just #include <unistd.h> in ipc/chromium/src/base/file_util.cc should fix=
 it
>=20
> > Cheers,
> >
> > --
> > Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VMt1DrMGOVs3KQwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+ecnkACgkQN1Ujt2V2gBwIuQCfRnoOm0ubYuM6/csn+XhaClvM
j2UAnjH4BIuW265vwhcX5w7nWjZReh6h
=qkrY
-----END PGP SIGNATURE-----

--VMt1DrMGOVs3KQwf--
