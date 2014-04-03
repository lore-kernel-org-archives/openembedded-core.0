Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0244.outbound.protection.outlook.com [207.46.163.244])
	by mail.openembedded.org (Postfix) with ESMTP id 6E9E76F6F4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 02:51:53 +0000 (UTC)
Received: from BY2PR03MB254.namprd03.prod.outlook.com (10.242.37.17) by
	BY2PR03MB159.namprd03.prod.outlook.com (10.242.36.18) with Microsoft
	SMTP Server (TLS) id 15.0.898.11; Thu, 3 Apr 2014 02:51:52 +0000
Received: from BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.84]) by
	BY2PR03MB254.namprd03.prod.outlook.com ([169.254.16.185]) with mapi id
	15.00.0898.005; Thu, 3 Apr 2014 02:51:51 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "B40290@freescale.com" <B40290@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] coreutils: fix search paths for libstdbuf.so
Thread-Index: AQHPSmJT8cVNB0w9OkaWZNcfZCYYapr/Omxg
Date: Thu, 3 Apr 2014 02:51:50 +0000
Message-ID: <2fdd71bf99db4cf38677faa3a16d1f83@BY2PR03MB254.namprd03.prod.outlook.com>
References: <1395996425-29821-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1395996425-29821-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [123.151.195.49]
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(6009001)(428001)(377454003)(189002)(13464003)(199002)(90146001)(47736001)(49866001)(56776001)(77096001)(4396001)(99286001)(76482001)(63696002)(76786001)(80022001)(46102001)(85852003)(51856001)(54316002)(80976001)(65816001)(97336001)(95416001)(66066001)(54356001)(83072002)(99396002)(95666003)(81542001)(53806001)(83322001)(74366001)(50986001)(575784001)(77982001)(76796001)(76576001)(98676001)(19580405001)(33646001)(87936001)(93136001)(86362001)(93516002)(56816005)(81342001)(94316002)(59766001)(47446002)(92566001)(79102001)(74502001)(74316001)(74662001)(74876001)(19580395003)(20776003)(81686001)(47976001)(74706001)(97186001)(87266001)(31966008)(2656002)(69226001)(85306002)(81816001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR03MB159;
	H:BY2PR03MB254.namprd03.prod.outlook.com;
	FPR:2D4E7E7C.212A542A.CDCE679D.8C68792B.2028A; MLV:sfv;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (: freescale.com does not designate permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2] coreutils: fix search paths for libstdbuf.so
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
X-List-Received-Date: Thu, 03 Apr 2014 02:51:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: Chunrong Guo [mailto:B40290@freescale.com]=20
Sent: Friday, March 28, 2014 4:47 PM
To: openembedded-core@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Guo Chunrong-=
B40290
Subject: [OE-core][PATCH v2] coreutils: fix search paths for libstdbuf.so

       *fix the following error:
        |stdbuf: failed to find 'libstdbuf.so'
        *PKGLIBEXECDIR is the search paths for libstdbuf.so
        |PKGLIBEXECDIR=3D'$(pkglibexecdir)'
        |pkglibexecdir=3D'${libexecdir}/${PACKAGE}'

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-core/coreutils/coreutils_8.22.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-c=
ore/coreutils/coreutils_8.22.bb
index a26aa02..ba3a0a0 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.22.bb
@@ -22,7 +22,7 @@ SRC_URI[md5sum] =3D "8fb0ae2267aa6e728958adc38f8163a2"
 SRC_URI[sha256sum] =3D "5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642=
cb9141f6ff1212"
=20
 EXTRA_OECONF_class-native =3D "--without-gmp"
-EXTRA_OECONF_class-target =3D "--enable-install-program=3Darch"
+EXTRA_OECONF_class-target =3D "--enable-install-program=3Darch --libexecdi=
r=3D${libdir}"
=20
 # acl is not a default feature
 #
@@ -71,8 +71,6 @@ do_install_append() {
 	# in update-alternatives to fail, therefore use lbracket - the name used
 	# for the actual source file.
 	mv ${D}${bindir}/[ ${D}${bindir}/lbracket.${BPN}
-	install -d ${D}${libdir}/coreutils
-	mv ${D}${libexecdir}/coreutils/libstdbuf.so ${D}${libdir}/coreutils
 }
=20
 inherit update-alternatives
--=20
1.8.3.2



