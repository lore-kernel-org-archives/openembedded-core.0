Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RCZAz-0002f4-Fb
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 17:51:01 +0200
Received: (qmail invoked by alias); 08 Oct 2011 15:45:19 -0000
Received: from p4FDF0806.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.8.6]
	by mail.gmx.net (mp013) with SMTP; 08 Oct 2011 17:45:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/BBOADembBfF2WRoYr1w6NW64UpUhV37jZwGAgpM
	4tl8/RUwOA+ywc
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 8 Oct 2011 17:49:34 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110081543.11799.schnitzeltony@gmx.de>
	<201110081556.38345.schnitzeltony@gmx.de>
	<CAMKF1spn7bCDxwtV_r4pi34V_q0gcum6P+4sbfHQPs76CuXegg@mail.gmail.com>
In-Reply-To: <CAMKF1spn7bCDxwtV_r4pi34V_q0gcum6P+4sbfHQPs76CuXegg@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201110081749.35141.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: tiff compile fails
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
X-List-Received-Date: Sat, 08 Oct 2011 15:51:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 08, 2011 05:00:33 PM Khem Raj wrote:
> On Saturday, October 8, 2011, Andreas M=FCller <schnitzeltony@gmx.de> wro=
te:
> > On Saturday, October 08, 2011 03:43:11 PM Andreas M=FCller wrote:
> >> With latest git pull for oe-core/meta-oe... & clean build dir I get
> >>
> >> | arm-angstrom-linux-gnueabi-libtool: compile:  ccache
> arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -fno-tree-vectorize
> -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8
> -mthumb-interwork -mno-thumb
> --sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -DHAVE_CONF=
IG_H
> -I. -O2 -pipe -g -feliminate-unused-debug-types -fpermissive
> -fvisibility-inlines-hidden -fvisibility-inlines-hidden -MT tif_stream.lo
> -MD -MP -MF .deps/tif_stream.Tpo -c tif_stream.cxx  -fPIC -DPIC -o
> .libs/tif_stream.o
> >> | tif_stream.cxx:31:20: fatal error: iostream: No such file or directo=
ry
> >> | compilation terminated.
> >> | make[2]: *** [tif_stream.lo] Error 1
> >>
> >> I think it is not tiff to blame - but which one is it?
> >>
> > In tiff's config.log I find
> >
> > Configured with: ... --with-gxx-include-dir=3D/usr/include/c++ ...
> >
>=20
> Seems that libstdc++ headers are not installed or compiler is not finding
> then
> Try a small hello.cc example and include iostream see if that compiles fi=
ne
> with
> Your g++
>=20
Thanks for the hints: there was a file iostream in sysroots/overo/usr/inclu=
de/c++ and on host libstdc++ headers are installed.=20

Before your response I was already running a rebuild on fresh tmp dir. This=
 time it worked...?! The only difference to the previous run is that I now =
did not try to build my full image but I ran 'bitbake tiff'..

Strange - but it seems I can continue

Andreas


