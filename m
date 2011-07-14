Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QhA0c-0000GY-Ag
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 02:42:30 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2011 17:38:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,527,1304319600"; d="scan'208";a="26982605"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by azsmga001.ch.intel.com with ESMTP; 13 Jul 2011 17:38:28 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.226.128) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 13 Jul 2011 17:38:28 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx606.amr.corp.intel.com ([10.22.226.128]) with mapi;
	Wed, 13 Jul 2011 17:38:28 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 17:38:28 -0700
Thread-Topic: [OE-core] [PATCH] gcc-4.6: update to 4.6.1 release
Thread-Index: AcxBe7iGQIJNFEwHT5SG5eO7u2k3CwAQiAeQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DE3749A7@orsmsx504.amr.corp.intel.com>
References: <1310575274.2378.32.camel@phil-desktop>
In-Reply-To: <1310575274.2378.32.camel@phil-desktop>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] gcc-4.6: update to 4.6.1 release
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
X-List-Received-Date: Thu, 14 Jul 2011 00:42:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Has anybody tried building all arches with commit? If it has worked well th=
en the upgrade to 4.6.1 is good. Otherwise it may affect too many people.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Phil Blundell
> Sent: Wednesday, July 13, 2011 9:41 AM
> To: oe-core
> Subject: [OE-core] [PATCH] gcc-4.6: update to 4.6.1 release
>=20
> Set SRCREV to match the point at which 4.6.1 was released, update PV
> appropriately.
>=20
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  meta/recipes-devtools/gcc/gcc-4.6.inc |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-
> devtools/gcc/gcc-4.6.inc
> index 56064b5..8af5369 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
> @@ -1,6 +1,6 @@
>  require gcc-common.inc
>=20
> -PR =3D "r8"
> +PR =3D "r0"
>=20
>  # Third digit in PV should be incremented after a minor release
>  # happens from this branch on gcc e.g. currently its 4.6.0
> @@ -8,7 +8,7 @@ PR =3D "r8"
>  # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
>  # to reflect that change
>=20
> -PV =3D "4.6.0+svnr${SRCPV}"
> +PV =3D "4.6.1+svnr${SRCPV}"
>=20
>  # BINV should be incremented after updating to a revision
>  # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
> @@ -18,7 +18,7 @@ PV =3D "4.6.0+svnr${SRCPV}"
>=20
>  BINV =3D "4.6.1"
>=20
> -SRCREV =3D 175150
> +SRCREV =3D 175454
>  BRANCH =3D "gcc-4_6-branch"
>  FILESPATH =3D "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
>=20
> --
> 1.7.4.1
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


