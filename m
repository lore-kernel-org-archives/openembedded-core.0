Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SALEL-0003OC-Uk
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 14:05:34 +0100
Received: from eb-e6520 (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 4D248A61CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 13:56:37 +0100 (CET)
Date: Wed, 21 Mar 2012 13:56:36 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120321135636.16995ebc@eb-e6520>
In-Reply-To: <1332332772.9740.146.camel@ted>
References: <1332328101-22779-1-git-send-email-eric@eukrea.com>
	<1332332772.9740.146.camel@ted>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 21 Mar 2012 13:05:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 21 Mar 2012 12:26:12 +0000,
Richard Purdie <richard.purdie@linuxfoundation.org> a =E9crit :

> On Wed, 2012-03-21 at 12:08 +0100, Eric B=E9nard wrote:
> > @@ -24,5 +24,4 @@ EXTRA_OECONF =3D " --enable-fixed-point --with-ogg-li=
braries=3D${STAGING_LIBDIR} \
> > =20
> >  PACKAGES +=3D "${PN}-bin"
> >  FILES_${PN} =3D "${libdir}/lib*.so.*"
> > -FILES_${PN}-dev +=3D "${libdir}/lib*.so.*"
> >  FILES_${PN}-bin =3D "${bindir}"
>=20
> Doesn't this mean -dev files are ending up in the main package?
>=20
this seems to work fine as this (with no other layer than oe-core).

packages-split/speex
`-- usr
    `-- lib
        |-- libspeexdsp.so.1 -> libspeexdsp.so.1.5.0
        |-- libspeexdsp.so.1.5.0
        |-- libspeex.so.1 -> libspeex.so.1.5.0
        `-- libspeex.so.1.5.0

2 directories, 4 files

packages-split/speex-dev/
.../...
    |-- lib
    |   |-- libspeexdsp.la
    |   |-- libspeexdsp.so -> libspeexdsp.so.1.5.0
    |   |-- libspeex.la
    |   |-- libspeex.so -> libspeex.so.1.5.0
    |   `-- pkgconfig
    |       |-- speexdsp.pc
    |       `-- speex.pc
.../...

> Shouldn't this be:
>=20
> FILES_${PN} =3D "${libdir}/lib*${SOLIBS}"
> FILES_${PN}-dev =3D "${libdir}/lib*${SOLIBSDEV}"
>=20
> or better, remove these and add:
>=20
> inherit lib_package
>=20
> ?
>=20
no clear idea on that, you are the boss to tell me which one you
prefer ;-)

Eric
--=20
http://eukrea.com/en/news/104-2012


