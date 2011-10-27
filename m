Received: from smtp21.4emm.com ([69.18.222.6])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RJH6u-0005jm-6A
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 05:58:32 +0200
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB21.4emm.local ([::1]) with mapi id 14.01.0289.001; Wed, 26 Oct 2011
	23:52:33 -0400
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot	to
	correct location
Thread-Index: AQHMlCGCuYwL9IA/JkSPHU2XuwiRo5WPjufw
Date: Thu, 27 Oct 2011 03:52:33 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF1AA886@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
	<CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8959@MBX20.4emm.local>
	<1319662464.12054.1.camel@ted>
In-Reply-To: <1319662464.12054.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot	to	correct location
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
X-List-Received-Date: Thu, 27 Oct 2011 03:58:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: Thursday, 27 October 2011 4:54 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to co=
rrect
> location
>=20
> On Fri, 2011-10-21 at 05:23 +0000, James Limbouris wrote:
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> > > Khem Raj
> > > Sent: Friday, 21 October 2011 1:16 PM
> > > To: Patches and discussions about the oe-core layer
> > > Subject: Re: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot t=
o
> correct
> > > location
> > >
> > > On Thu, Oct 20, 2011 at 10:12 PM, James Limbouris
> > > <james@digitalmatter.com.au> wrote:
> > > >> -----Original Message-----
> > > >> From: openembedded-core-bounces@lists.openembedded.org
> > > >> [mailto:openembedded-core-bounces@lists.openembedded.org] On
> Behalf
> > > Of
> > > >> Khem Raj
> > > >> Sent: Friday, 21 October 2011 1:03 PM
> > > >> To: openembedded-core@lists.openembedded.org
> > > >> Subject: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to
> correct
> > > >> location
> > > >>
> > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> ---
> > > >>  meta/recipes-devtools/gcc/gcc-configure-sdk.inc |    2 +-
> > > >>  1 files changed, 1 insertions(+), 1 deletions(-)
> > > >>
> > > >> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> b/meta/recipes-
> > > >> devtools/gcc/gcc-configure-sdk.inc
> > > >> index de80870..98fd4c1 100644
> > > >> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> > > >> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
> > > >> @@ -7,7 +7,7 @@ USE_NLS =3D '${@base_conditional( "TARGET_OS",
> "linux-
> > > >> uclibceabi", "no", "", d )}'
> > > >>  EXTRA_OECONF_PATHS =3D "--with-local-
> > > >> prefix=3D${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
> > > >>                        --with-gxx-include-dir=3D${target_includedi=
r}/c++ \
> > > >>                        --with-build-time-
> > > >> tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
> > > >> -                      --with-sysroot=3D${SDKPATH}/sysroots/${TARG=
ET_SYS} \
> > > >> +                      --with-
> > > >> sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-
> > > >> ${TARGET_OS} \
> > > >>                        --with-build-sysroot=3D${STAGING_DIR_TARGET=
}"
> > > >>
> > > >>  #
> > > >> --
> > > >> 1.7.5.4
> > > >>
> > > >
> > > > Shouldn't --with-local-prefix be changed too? I am testing with bot=
h
> > > ${TARGET_SYS}'s replaced. Will post results shortly.
> > >
> > > yes I think both places it should change
> > >
> >
> > Ok, I've tested with both changed, and the corresponding binutils patch=
, and
> both Qt and kernel compiles are working.
>=20
> I took these patches but I would like to stress that we shouldn't need
> to rely on the hardcoded path in the compiler, it should be picking up
> any alternative sysroot paths from the environment. If this isn't
> happening, we should be figuring out why not. This change therefore
> hides issues and does not fix the problem entirely :(.
>=20
> Cheers,
>=20
> Richard

I'm not sure there was a problem apart from the hardcoded paths being wrong=
 - in the use cases this fixed, the environment setup script was not being =
sourced.

James



