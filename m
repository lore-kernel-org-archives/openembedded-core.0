Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3DB72FB6;
	Wed, 22 Feb 2017 21:56:20 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Feb 2017 13:56:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,196,1484035200"; 
	d="asc'?scan'208";a="228562675"
Received: from mawhalen-mobl1.amr.corp.intel.com (HELO [10.254.91.150])
	([10.254.91.150])
	by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2017 13:56:20 -0800
To: Michael Halstead <mhalstead@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
	<20170222204736.GG3283@jama>
	<CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
From: Jose Lamego <jose.a.lamego@linux.intel.com>
Message-ID: <26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
Date: Wed, 22 Feb 2017 15:56:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
Cc: Derek Straka <derek@asterius.io>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>,
	openembedded-devel@lists.openembedded.org, "Lamego,
	Jose A" <jose.a.lamego@intel.com>
Subject: Re: Patchwork not picking changes from the ML Was: [oe] [meta-python][PATCH] python-paho-mqtt: update to version 1.2
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
X-List-Received-Date: Wed, 22 Feb 2017 21:56:20 -0000
X-Groupsio-MsgNum: 93862
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="smQRPAi8bH8dnhKICeTOtoa55BFUwQ49I"

--smQRPAi8bH8dnhKICeTOtoa55BFUwQ49I
Content-Type: multipart/mixed; boundary="OWsTHlFPJNL74PWAQqJTuRhG2koKCke0c";
 protected-headers="v1"
From: Jose Lamego <jose.a.lamego@linux.intel.com>
To: Michael Halstead <mhalstead@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Derek Straka <derek@asterius.io>, "Lamego, Jose A"
 <jose.a.lamego@intel.com>, openembedded-devel@lists.openembedded.org,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Message-ID: <26abf96d-d224-0795-4870-cdd496f541de@linux.intel.com>
Subject: Re: [OE-core] Patchwork not picking changes from the ML Was: [oe]
 [meta-python][PATCH] python-paho-mqtt: update to version 1.2
References: <1487785536-13777-1-git-send-email-derek@asterius.io>
 <20170222204736.GG3283@jama>
 <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>
In-Reply-To: <CADfgfobBp60s+GjqS3zRrO-z4HUhe8zFi51GPzceDFAKQVGf=Q@mail.gmail.com>

--OWsTHlFPJNL74PWAQqJTuRhG2koKCke0c
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 02/22/2017 02:55 PM, Michael Halstead wrote:
> I've seen several issues with hooks. I was working on them yesterday an=
d
> will continue today.
>=20
> These are currently managed by hand but we are moving them into
> configuration management which should help keep them working consistent=
ly.

Michael: one syntax error in patchwork code was pulled into production
yesterday. This is the cause for missing patches. The error is fixed in
the Yocto repo now, please perform a server code update ASAP.

Martin: I will look at the UI issue you are describing and file a bug if
needed.

>=20
> On Feb 22, 2017 12:47 PM, "Martin Jansa" <martin.jansa@gmail.com
> <mailto:martin.jansa@gmail.com>> wrote:
>=20
>     On Wed, Feb 22, 2017 at 12:45:36PM -0500, Derek Straka wrote:
>     > Signed-off-by: Derek Straka <derek@asterius.io
>     <mailto:derek@asterius.io>>
>=20
>     It's not your fault Derek, but most of the patches from today and b=
ased
>     on the pings from today also some earlier patches didn't make it in=
to
>     patchwork. This one is the only exception.
>=20
>     Michael, Jose: are you aware of some issues with patchwork? Could i=
t be
>     caused by the default Reply-to change from yesterday (or day before=

>     during OEDAM)?
>=20
>     I know only about issues processing merged changes:
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10967
>     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10967>
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759
>     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10759>
>=20
>     And also UI issue in patchwork that paging doesn't work, e.g.:
>     https://patchwork.openembedded.org/bundle/jama/master-next/?submitt=
er=3D&state=3D&q=3D&archive=3Dboth
>     <https://patchwork.openembedded.org/bundle/jama/master-next/?submit=
ter=3D&state=3D&q=3D&archive=3Dboth>
>     shows that there are 5 pages of changes (which should be in most ca=
ses
>     marked as accepted by the hook above), but clicking on 2nd page pro=
duces
>     link which drops the query parameters:
>     https://patchwork.openembedded.org/bundle/jama/master-next/?page=3D=
2
>     <https://patchwork.openembedded.org/bundle/jama/master-next/?page=3D=
2>
>     so it says "No patches to display"
>=20
>     Regards,
>=20
>     > ---
>     >  .../python/{python-paho-mqtt_1.1.bb
>     <http://python-paho-mqtt_1.1.bb> =3D> python-paho-mqtt_1.2.bb
>     <http://python-paho-mqtt_1.2.bb>}       | 4 ++--
>     >  1 file changed, 2 insertions(+), 2 deletions(-)
>     >  rename
>     meta-python/recipes-devtools/python/{python-paho-mqtt_1.1.bb
>     <http://python-paho-mqtt_1.1.bb> =3D> python-paho-mqtt_1.2.bb
>     <http://python-paho-mqtt_1.2.bb>} (68%)
>     >
>     > diff --git
>     a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>     <http://python-paho-mqtt_1.1.bb>
>     b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>     <http://python-paho-mqtt_1.2.bb>
>     > similarity index 68%
>     > rename from
>     meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb
>     <http://python-paho-mqtt_1.1.bb>
>     > rename to
>     meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb
>     <http://python-paho-mqtt_1.2.bb>
>     > index b8f5f3f..c8acfc5 100644
>     > --- a/meta-python/recipes-devtools/python/python-paho-mqtt_1.1.bb=

>     <http://python-paho-mqtt_1.1.bb>
>     > +++ b/meta-python/recipes-devtools/python/python-paho-mqtt_1.2.bb=

>     <http://python-paho-mqtt_1.2.bb>
>     > @@ -11,5 +11,5 @@ RDEPENDS_${PN} =3D "\
>     >                 python-threading \
>     >  "
>     >
>     > -SRC_URI[md5sum] =3D "a6407b74eb5e5411e157be1de5c11366"
>     > -SRC_URI[sha256sum] =3D
>     "0f7a629efe6e3a2c61b59d3550aa9f2c4529b5689a65fde45e6f1ac36b9a261e"
>     > +SRC_URI[md5sum] =3D "241150b3fcb920ddca4d33181f3238b1"
>     > +SRC_URI[sha256sum] =3D
>     "9100a6aa706ab699d414ec02705a21eb66f436184691d0bf1f2a85a6213c6c1f"
>     > --
>     > 2.7.4
>     >
>     > --
>     > _______________________________________________
>     > Openembedded-devel mailing list
>     > Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     > http://lists.openembedded.org/mailman/listinfo/openembedded-devel=

>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>=

>=20
>     --
>     Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>     <mailto:Martin.Jansa@gmail.com>
>=20
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>=20
>=20
>=20

--=20
Jose Lamego | OTC Embedded Platforms & Tools | GDC


--OWsTHlFPJNL74PWAQqJTuRhG2koKCke0c--

--smQRPAi8bH8dnhKICeTOtoa55BFUwQ49I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYrgkDAAoJEFJAtowlSEbnd6IH/0WWTkj6mtEvEjH318H1IQhf
BaLRzZ6Y8XLAM8qzphwvh2bUPVCeLUCDC8v5ZhxIkg2ckzDFI6gyeye+2WBLaGe7
aXA27LZ/8iv58sW+f7764Gari11uxPWWJBwPJ4+HzcQAoT36ND7oU3GirBN9IlfP
WZVNm9Pr148U+Og2Bh7/F82xJtzvbCUhit+kDQ6sOHVxgcNH3JaZdmvp0TuAW8Yh
lTwugOiJ5xxhWwIqlnLwQaDkKxdu1GwkaHzFhtnWq7PBuXbC///aDF8Z08GefFDy
EftMI1vuW+7GfkadprscLn+a8HLBAs0y1tSqf+7y7MYnv5SpyyvWwQMtg7yXEmg=
=n424
-----END PGP SIGNATURE-----

--smQRPAi8bH8dnhKICeTOtoa55BFUwQ49I--
