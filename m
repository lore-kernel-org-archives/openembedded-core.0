Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RCXPa-0000QX-Oc
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Oct 2011 15:58:01 +0200
Received: (qmail invoked by alias); 08 Oct 2011 13:52:20 -0000
Received: from p4FDF0806.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.8.6]
	by mail.gmx.net (mp063) with SMTP; 08 Oct 2011 15:52:20 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18ty/Afg1kt+zYDk8CA5BcokRR83PJ0Nb2IRoiyjP
	M0q3FVm/GlMSEf
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 8 Oct 2011 15:56:38 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-97.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110081543.11799.schnitzeltony@gmx.de>
In-Reply-To: <201110081543.11799.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201110081556.38345.schnitzeltony@gmx.de>
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
X-List-Received-Date: Sat, 08 Oct 2011 13:58:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Saturday, October 08, 2011 03:43:11 PM Andreas M=FCller wrote:
> With latest git pull for oe-core/meta-oe... & clean build dir I get
>=20
> | arm-angstrom-linux-gnueabi-libtool: compile:  ccache arm-angstrom-linux=
=2Dgnueabi-g++ -march=3Darmv7-a -fno-tree-vectorize -mthumb-interwork -mflo=
at-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a8 -mthumb-interwork -mno-thum=
b --sysroot=3D/home/Superandy/tmp/oe-core-eglibc/sysroots/overo -DHAVE_CONF=
IG_H -I. -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibil=
ity-inlines-hidden -fvisibility-inlines-hidden -MT tif_stream.lo -MD -MP -M=
=46 .deps/tif_stream.Tpo -c tif_stream.cxx  -fPIC -DPIC -o .libs/tif_stream=
=2Eo
> | tif_stream.cxx:31:20: fatal error: iostream: No such file or directory
> | compilation terminated.
> | make[2]: *** [tif_stream.lo] Error 1
>=20
> I think it is not tiff to blame - but which one is it?
>=20
In tiff's config.log I find

Configured with: ... --with-gxx-include-dir=3D/usr/include/c++ ...

Hmm


