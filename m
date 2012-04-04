Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SFLjL-0001Wh-94
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 10:38:15 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 9F5A24B00A1;
	Wed,  4 Apr 2012 10:29:02 +0200 (CEST)
Date: Wed, 4 Apr 2012 10:29:01 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120404102901.59872c25@eb-e6520>
In-Reply-To: <4F7B629D.3010906@linux.intel.com>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
	<4F7B629D.3010906@linux.intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] speex: fix FILES variables
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
X-List-Received-Date: Wed, 04 Apr 2012 08:38:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Saul,

Le Tue, 03 Apr 2012 13:50:37 -0700,
Saul Wold <sgw@linux.intel.com> a =E9crit :

> On 03/21/2012 04:08 AM, Eric B=E9nard wrote:
> > actually FILES_${PN} and FILES_${PN}-dev match the same files.
> > these files are supposed to go into ${PN} so remove the other entry.
> >
> > Signed-off-by: Eric B=E9nard<eric@eukrea.com>
> > ---
> >   meta/recipes-multimedia/speex/speex_1.2rc1.bb |    3 +--
> >   1 files changed, 1 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/speex/speex_1.2rc1.bb b/meta/recip=
es-multimedia/speex/speex_1.2rc1.bb
> > index fe46a00..7370134 100644
> > --- a/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> > +++ b/meta/recipes-multimedia/speex/speex_1.2rc1.bb
> > @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D314649d8ba9d=
d7045dfb6683f298d0a8 \
> >                       file://include/speex/speex.h;beginline=3D1;endlin=
e=3D34;md5=3Da68129f78d7fe66e07163f73aba143b3"
> >   DEPENDS =3D "libogg"
> >
> > -PR =3D "r0"
> > +PR =3D "r1"
> >
> >   SRC_URI =3D "http://downloads.us.xiph.org/releases/speex/speex-1.2rc1=
.tar.gz"
> >
> > @@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point --with-ogg-li=
braries=3D${STAGING_LIBDIR} \
> >
> >   PACKAGES +=3D "${PN}-bin"
> >   FILES_${PN} =3D "${libdir}/lib*.so.*"
> > -FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
> >   FILES_${PN}-bin =3D "${bindir}"
>=20
> Merged into OE-Core
>=20
it was already applied as 4fc0f65e7d6e6fc6775a9a7e54510b629c9786d9

Eric


