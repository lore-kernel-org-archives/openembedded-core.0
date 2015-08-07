Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC196E5D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:30:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2015 05:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="778827511"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
	by fmsmga002.fm.intel.com with ESMTP; 07 Aug 2015 05:29:48 -0700
Received: from irsmsx101.ger.corp.intel.com ([169.254.1.216]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.137]) with mapi id
	14.03.0224.002; Fri, 7 Aug 2015 13:29:47 +0100
From: "Constantin, Costin C" <costin.c.constantin@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] selftest/buildoptions.py: correct small
	mistake cleanupworkdir ---> cleanup-workdir
Thread-Index: AQHQ0QEcbbpc/r6s4ka79eHvB6Mv3J4AVmKAgAAg9nA=
Date: Fri, 7 Aug 2015 12:29:46 +0000
Message-ID: <2B8B4B6BB45F5242AFEC714E022A4B4A3DF91F23@IRSMSX101.ger.corp.intel.com>
References: <1438946222-3447-1-git-send-email-costin.c.constantin@intel.com>
	<1970887.P8p8M1ymWY@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1970887.P8p8M1ymWY@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/buildoptions.py: correct small mistake cleanupworkdir ---> cleanup-workdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Aug 2015 12:30:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

appologies for this one Paul. I'll wipe out the workdir clean

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Friday, August 07, 2015 2:31 PM
To: Constantin, Costin C
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] selftest/buildoptions.py: correct small mist=
ake cleanupworkdir ---> cleanup-workdir

Hi Costin,

On Friday 07 August 2015 14:17:02 Costin Constantin wrote:
> Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
> ---
>  meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/buildoptions.py
> b/meta/lib/oeqa/selftest/buildoptions.py index 483803b..655b5da 100644
> --- a/meta/lib/oeqa/selftest/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/buildoptions.py
> @@ -128,7 +128,7 @@ class BuildImagesTest(oeSelfTest):
>          This method is used to test the build of directfb image for=20
> arm arch. In essence we build a coreimagedirectfb and test the=20
> exitcode of bitbake that in case of success is 0. """
> -        self.add_command_to_tearDown('cleanupworkdir')
> +        self.add_command_to_tearDown('cleanup-workdir')
>          self.write_config("DISTRO_FEATURES_remove =3D=20
> \"x11\"\nDISTRO_FEATURES_append =3D \" directfb\"\nMACHINE ??=3D=20
> \"qemuarm\"") res =3D bitbake("core-image-directfb", ignore_status=3DTrue=
)
>          self.assertEqual(res.status, 0, "\ncoreimagedirectfb failed=20
> to build. Please check logs for further details.\nbitbake output %s" %
> res.output) @@ -139,7 +139,7 @@ class ArchiverTest(oeSelfTest):
>          """
>          Test for archiving the work directory and exporting the=20
> source files. """
> -        self.add_command_to_tearDown('cleanupworkdir')
> +        self.add_command_to_tearDown('cleanup-workdir')
>          self.write_config("INHERIT =3D \"archiver\"\nARCHIVER_MODE[src]=
=20
> =3D \"original\"\nARCHIVER_MODE[srpm] =3D \"1\"") res =3D=20
> bitbake("xcursor-transparent-theme", ignore_status=3DTrue)=20
> self.assertEqual(res.status, 0, "\nCouldn't build=20
> xcursortransparenttheme.\nbitbake output %s" % res.output)

I think we talked about this in another test - we shouldn't be calling clea=
nup-workdir as part of any of our tests. If we need to clean specific recip=
es that were built by the tests that's fine, but cleanup-workdir blasts eve=
rything away which isn't really appropriate.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

