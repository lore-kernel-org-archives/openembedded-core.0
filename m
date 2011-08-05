Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp8zI-0001u5-R7
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 03:14:09 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 04 Aug 2011 18:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,320,1309762800"; d="scan'208";a="35333449"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 04 Aug 2011 18:09:43 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 4 Aug 2011 18:09:42 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Thu, 4 Aug 2011 18:09:42 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 4 Aug 2011 18:09:42 -0700
Thread-Topic: [OE-core] [PATCH 04/10] glibc: bring back the needed support
	for glibc recipes
Thread-Index: AcxS/OqW5S90+px6RrK4Y2I49oKdXAADvK8w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE85F698@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<03d062a7104f31d03893833485ec3836c07e8f90.1312469790.git.nitin.a.kamble@intel.com>
	<4E3B28D7.8030208@gmail.com>
In-Reply-To: <4E3B28D7.8030208@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 04/10] glibc: bring back the needed support for glibc recipes
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
X-List-Received-Date: Fri, 05 Aug 2011 01:14:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Thursday, August 04, 2011 4:19 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 04/10] glibc: bring back the needed
> support for glibc recipes
>=20
> On 08/04/2011 08:01 AM, nitin.a.kamble@intel.com wrote:
> > From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >
> > Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> > ---
> >   meta/conf/distro/include/tclibc-glibc.inc   |   32
> +++++++++++++++++++++++++++
> >   meta/conf/distro/include/tcmode-default.inc |    5 ++++
> >   2 files changed, 37 insertions(+), 0 deletions(-)
> >   create mode 100644 meta/conf/distro/include/tclibc-glibc.inc
> >
> > diff --git a/meta/conf/distro/include/tclibc-glibc.inc
> b/meta/conf/distro/include/tclibc-glibc.inc
> > new file mode 100644
> > index 0000000..823195c
> > --- /dev/null
> > +++ b/meta/conf/distro/include/tclibc-glibc.inc
> > @@ -0,0 +1,32 @@
> > +#
> > +# glibc specific configuration
> > +#
> > +
> > +LIBCEXTENSION =3D "${@['', '-gnu'][(d.getVar('ABIEXTENSION', True) or
> '') !=3D '']}"
>=20
> why is this specific to glibc and not eglibc ?

I think that is for multilib. I did not do any changes to the tclibc-glibc.=
inc files. I just got back the last version before deletion.

> since glibc is deleted from metadata this file should go away too
> if its for external toolchains then they could use tclibc-eglibc.inc
> or tclibc-uclibc.inc as needed.


>=20
> I am in favour of generally using linux-gnu extention for eglibc/glibc
> based systems.
>=20
> > +
> > +# Add glibc to the overrides.
> > +OVERRIDES =3D. "libc-glibc:"
> > +
> > +PREFERRED_PROVIDER_virtual/libiconv ?=3D "glibc"
> > +PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?=3D "glibc-nativesdk"
> > +PREFERRED_PROVIDER_virtual/libintl ?=3D "glibc"
> > +PREFERRED_PROVIDER_virtual/libc ?=3D "glibc"
> > +PREFERRED_PROVIDER_virtual/libc-nativesdk ?=3D "glibc-nativesdk"
> > +PREFERRED_PROVIDER_virtual/libc-locale ?=3D "glibc-locale"
> > +
> > +CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> > +
> > +LIBC_DEPENDENCIES =3D "\
> > +    libsegfault \
> > +    glibc \
> > +    glibc-dbg \
> > +    glibc-dev \
> > +    glibc-utils \
> > +    glibc-thread-db \
> > +    glibc-localedata-i18n \
> > +    glibc-gconv-ibm850 \
> > +    glibc-gconv-cp1252 \
> > +    glibc-gconv-iso8859-1 \
> > +    glibc-gconv-iso8859-15 \
> > +    locale-base-en-gb \
> > +    "
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 0d0af38..5f66c9e 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -48,6 +48,11 @@ PREFERRED_VERSION_binutils-crosssdk ?=3D
> "${BINUVERSION}"
> >   PREFERRED_VERSION_binutils-cross-canadian ?=3D "${BINUVERSION}"
> >   PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
> >   PREFERRED_VERSION_linux-libc-headers-nativesdk ?=3D
> "${LINUXLIBCVERSION}"
> > +PREFERRED_VERSION_glibc ?=3D "${GLIBCVERSION}"
> > +PREFERRED_VERSION_glibc-locale ?=3D "${GLIBCVERSION}"
> > +PREFERRED_VERSION_glibc-nativesdk ?=3D "${GLIBCVERSION}"
> > +PREFERRED_VERSION_glibc-initial ?=3D "${GLIBCVERSION}"
> > +PREFERRED_VERSION_glibc-initial-nativesdk ?=3D "${GLIBCVERSION}"
> >   PREFERRED_VERSION_eglibc                   ?=3D "${EGLIBCVERSION}"
> >   PREFERRED_VERSION_eglibc-locale            ?=3D "${EGLIBCVERSION}"
> >   PREFERRED_VERSION_eglibc-nativesdk         ?=3D "${EGLIBCVERSION}"
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


