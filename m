Return-Path: <gshastri@juniper.net>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0118.outbound.protection.outlook.com [65.55.169.118])
	by mail.openembedded.org (Postfix) with ESMTP id 69EC673C63
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 19:08:57 +0000 (UTC)
Received: from BN3PR0501MB1427.namprd05.prod.outlook.com (25.160.117.149) by
	BN3PR0501MB1426.namprd05.prod.outlook.com (25.160.117.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.130.23; Wed, 1 Apr 2015 19:08:57 +0000
Received: from BN3PR0501MB1427.namprd05.prod.outlook.com ([25.160.117.149]) by
	BN3PR0501MB1427.namprd05.prod.outlook.com ([25.160.117.149]) with
	mapi id 15.01.0125.002; Wed, 1 Apr 2015 19:08:57 +0000
From: Gaurang Shastri <gshastri@juniper.net>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [yocto] [Add xorriso recipe] Add xorriso tool support
Thread-Index: AQHQbHh1MBr1NVvXUUitfHlBd2h8eJ04dKGAgAAQ2QA=
Date: Wed, 1 Apr 2015 19:08:56 +0000
Message-ID: <BN3PR0501MB1427DB11489B9F3179CE4B30D5F30@BN3PR0501MB1427.namprd05.prod.outlook.com>
References: <1427891938-17616-1-git-send-email-gshastri@juniper.net>
	<78A1EDDC-309F-4E74-8339-D10C1FD5EC3B@gmail.com>
In-Reply-To: <78A1EDDC-309F-4E74-8339-D10C1FD5EC3B@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [116.197.184.13]
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0501MB1426;
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(51704005)(13464003)(110136001)(46102003)(2950100001)(2900100001)(122556002)(40100003)(54356999)(77156002)(50986999)(62966003)(76176999)(15975445007)(102836002)(106116001)(87936001)(66066001)(99286002)(2656002)(76576001)(19580405001)(19580395003)(74316001)(86362001)(575784001)(33656002)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1426;
	H:BN3PR0501MB1427.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1426218D4DB3DEBBAA7BBB7BD5F30@BN3PR0501MB1426.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1426; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1426; 
x-forefront-prvs: 053315510E
MIME-Version: 1.0
X-OriginatorOrg: juniper.net
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2015 19:08:56.7371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bea78b3c-4cdb-4130-854a-1d193232e5f4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1426
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [Add xorriso recipe] Add xorriso tool support
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
X-List-Received-Date: Wed, 01 Apr 2015 19:09:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> we have meta-filesystems in meta-openembedded repo, this belongs there f=
or now

OK, sending the patch to meta-filesystems maintainer.

-----Original Message-----
From: Khem Raj [mailto:raj.khem@gmail.com]=20
Sent: Wednesday, April 01, 2015 11:38 PM
To: Gaurang Shastri
Cc: yocto@yoctoproject.org; openembedded-core@lists.openembedded.org
Subject: Re: [yocto] [Add xorriso recipe] Add xorriso tool support


> On Apr 1, 2015, at 5:38 AM, Gaurang Shastri <gshastri@juniper.net> wrote:
>=20
> xorriso copies file objects from POSIX compliant filesystems into Rock=20
> Ridge enhanced ISO 9660 filesystems and allows session-wise=20
> manipulation of such filesystems.
>=20

we have meta-filesystems in meta-openembedded repo, this belongs there for =
now

> Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
> ---
> meta/recipes-support/xorriso/xorriso_1.3.8.bb |   17 +++++++++++++++++
> 1 file changed, 17 insertions(+)
> create mode 100644 meta/recipes-support/xorriso/xorriso_1.3.8.bb
>=20
> diff --git a/meta/recipes-support/xorriso/xorriso_1.3.8.bb=20
> b/meta/recipes-support/xorriso/xorriso_1.3.8.bb
> new file mode 100644
> index 0000000..93914b4
> --- /dev/null
> +++ b/meta/recipes-support/xorriso/xorriso_1.3.8.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTIONS =3D "xorriso copies file objects from POSIX compliant files=
ystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wis=
e manipulation of such filesystems"
> +
> +inherit autotools
> +
> +DEPENDS +=3D "attr zlib"
> +
> +SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] =3D "a0fc534ef8f9589282a189f0e6cdf952"
> +SRC_URI[sha256sum] =3D "901204634651533f7cbd105eab560534702458258529aac4=
b2f0fc946992107e"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
> +LICENSE =3D "GPLv3"
> +
> +EXTRA_OECONF =3D "--disable-libacl"
> +
> +BBCLASSEXTEND =3D "nativesdk"
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto


