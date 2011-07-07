Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QerHZ-0001rF-V7
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 18:18:30 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 07 Jul 2011 09:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,494,1304319600"; d="scan'208";a="24536843"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2011 09:14:26 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx604.amr.corp.intel.com ([10.250.113.17]) with mapi;
	Thu, 7 Jul 2011 09:14:26 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jul 2011 09:14:24 -0700
Thread-Topic: [OE-core] [PATCH 6/8] perl: fix for non /usr/lib libdir case
Thread-Index: Acw8sQbbd4ncRPCzQWCXJXhvF6io+AAD9zBQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE225C36@orsmsx504.amr.corp.intel.com>
References: <cover.1310047266.git.ke.yu@intel.com>
	<997e3b4b171cae48b81a47536a27cc81f4d620a6.1310047266.git.ke.yu@intel.com>
In-Reply-To: <997e3b4b171cae48b81a47536a27cc81f4d620a6.1310047266.git.ke.yu@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 6/8] perl: fix for non /usr/lib libdir case
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
X-List-Received-Date: Thu, 07 Jul 2011 16:18:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ke,=20
   Is this for multilib ?

Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Yu Ke
> Sent: Thursday, July 07, 2011 7:10 AM
> To: openembedded-core@lists.openembedded.org;
> richard.purdie@linuxfoundation.org
> Subject: [OE-core] [PATCH 6/8] perl: fix for non /usr/lib libdir case
>=20
> the config.sh is hardcoded to be /usr/lib, which does not work in non
> /usr/lib libdir case.
>=20
> This patch replace the hard code /usr/lib with ${libdir} to fix this
> issue
>=20
> Signed-off-by: Yu Ke <ke.yu@intel.com>
> ---
>  meta/recipes-devtools/perl/perl_5.12.3.bb |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/perl/perl_5.12.3.bb b/meta/recipes-
> devtools/perl/perl_5.12.3.bb
> index b053482..88dcfdd 100644
> --- a/meta/recipes-devtools/perl/perl_5.12.3.bb
> +++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
> @@ -8,7 +8,7 @@ PRIORITY =3D "optional"
>  # We need gnugrep (for -I)
>  DEPENDS =3D "virtual/db grep-native"
>  DEPENDS +=3D "gdbm zlib"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
>  # 5.10.1 has Module::Build built-in
>  PROVIDES +=3D "libmodule-build-perl"
> @@ -150,6 +150,7 @@ do_configure() {
>                 -e 's,@ARCH@-thread-multi,,g' \
>                 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>                 -e "s%/usr/include%${STAGING_INCDIR}%g" \
> +	       -e 's,/usr/lib/,${libdir}/,g' \
>  	       -e 's,/usr/,${exec_prefix}/,g' \
>  	       -e 's,/perl5,/perl,g' \
>              config.sh-${TARGET_ARCH}-${TARGET_OS}
> --
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


