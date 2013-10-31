Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B32B16AE37;
	Thu, 31 Oct 2013 09:53:47 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Oct 2013 02:53:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315151770"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2013 02:53:48 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 31 Oct 2013 09:52:40 +0000
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.75]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.197]) with mapi id
	14.03.0123.003; Thu, 31 Oct 2013 09:52:40 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-commits] Cristian Iorga : telepathy-mission-control:
	upgrade to 5.16.0
Thread-Index: AQHO1h6StETR1PJ0W0iLJ7v8ggKiLJoOkYNw
Date: Thu, 31 Oct 2013 09:52:39 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16CAFCA2@IRSMSX105.ger.corp.intel.com>
References: <20131030171857.47AA3504D1@opal> <20131031094910.GH32015@jama>
In-Reply-To: <20131031094910.GH32015@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Cristian Iorga : telepathy-mission-control: upgrade to 5.16.0
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
X-List-Received-Date: Thu, 31 Oct 2013 09:53:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

OK, will look into it, thanks.
/Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Thursday, October 31, 2013 11:49 AM
To: Iorga, Cristian; openembedded-core@lists.openembedded.org
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : telepathy-mission-control: upgra=
de to 5.16.0

On Wed, Oct 30, 2013 at 05:18:57PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6bae01a04a375906731555b997766d41f887b496
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6bae01a04a375906731555b997766d41f887b496
>=20
> Author: Cristian Iorga <cristian.iorga@intel.com>
> Date:   Wed Oct 30 10:53:11 2013 +0200
>=20
> telepathy-mission-control: upgrade to 5.16.0
>=20
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Please see Ross's comment in
http://patchwork.openembedded.org/patch/59289/

some PACKAGECONFIGs shouldn't be needed now

>=20
> ---
>=20
>  ...15.0.bb =3D> telepathy-mission-control_5.16.0.bb} |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git=20
> a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0
> .bb=20
> b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0
> .bb
> similarity index 93%
> rename from=20
> meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0.b
> b rename to=20
> meta/recipes-connectivity/telepathy/telepathy-mission-control_5.16.0.b
> b
> index f1a1320..bdab9c1 100644
> ---=20
> a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.15.0
> .bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.
> +++ 16.0.bb
> @@ -9,8 +9,8 @@ DEPENDS =3D "libtelepathy dbus-glib gconf libxslt-native"
>  SRC_URI =3D "http://telepathy.freedesktop.org/releases/telepathy-mission=
-control/telepathy-mission-control-${PV}.tar.gz \
>  	file://tmc-Makefile-fix-race.patch \
>  	"
> -SRC_URI[md5sum] =3D "0efd7d9043f6e189e8ed8111d043b52c"
> -SRC_URI[sha256sum] =3D "88800d1b5f385e94b34721319ff4fe65c493632954d7229b=
36e57af5b4a7e1b5"
> +SRC_URI[md5sum] =3D "736ae9d71028d8e6d95017433c07fa06"
> +SRC_URI[sha256sum] =3D "edc3c7265c291343d5d7d47c20add4d426e894068c66c796=
96795502a4e1c1d0"
> =20
>  inherit autotools pkgconfig pythonnative
> =20
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

