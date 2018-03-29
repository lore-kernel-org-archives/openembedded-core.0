Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0043.outbound.protection.outlook.com [104.47.33.43])
	by mail.openembedded.org (Postfix) with ESMTP id E84EF744EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=EJIsSZeWt/N1OrgcVTPEM7zUJYl2gzXY9c20I701ffY=;
	b=04Q3GAQnnV8V69PnARTJJKh2WGhDMgMxBGWhLCIT+OFd8GScv6dujm677r1qZ4xghwPp6yMmTC0wT4dobc/WNeSvNV+kbNnQ9gPRtAawB1aLXSZ3EcE60NxTGdSgsVbpg30pV09fhdC7f3jCfatMWsWnAzWnPugwYvZc6gw14hc=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB218.namprd02.prod.outlook.com (10.242.232.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.609.10; Thu, 29 Mar 2018 22:55:29 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com
	([fe80::fd3f:ad38:375:17af]) by BY2PR02MB347.namprd02.prod.outlook.com
	([fe80::fd3f:ad38:375:17af%13]) with mapi id 15.20.0609.012;
	Thu, 29 Mar 2018 22:55:29 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Denys Dmytriyenko <denis@denix.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
Thread-Index: AQHTmSlH5k1h2zZ6sU+NF2lo4LVknKOLJFUwgF0DH4CAAAgAkA==
Date: Thu, 29 Mar 2018 22:55:29 +0000
Message-ID: <BY2PR02MB34735CA095494E19660424AB9A20@BY2PR02MB347.namprd02.prod.outlook.com>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<BY2PR02MB34738EDF842CDBEF98D6A59B9E50@BY2PR02MB347.namprd02.prod.outlook.com>
	<20180329222549.GH2786@denix.org>
In-Reply-To: <20180329222549.GH2786@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB218;
	7:AU5wDsKVYYq1UIJJ6Je+9Qy3Yi03Razo3yefI1818glMwwiSceoYPWAQyu0sVNG8fnjNDfuAph8vF2hHHwvQ/k0ksl+CnUNsTOsXJO/crirxa/yhWMeLJJI/7RYoRcprWax+pSKnPJBbztjs9QP8lOgXu7MgkxVrzbfL7f/di/UZdM4NOA2UfIJrBUuPHx3i4UwuoQjjG1NzgLhjjioxzY58I1p2s2B7N1FojW5DoVKkCpNj7xsyuDQ7YZL3rTU8
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 60679c44-ee8e-45b6-3dd0-08d595c82b2c
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:BY2PR02MB218; 
x-ms-traffictypediagnostic: BY2PR02MB218:
x-microsoft-antispam-prvs: <BY2PR02MB218048D26E1DE3A72045F89B9A20@BY2PR02MB218.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(150554046322364)(264703809997249)(192813158149592); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231221)(944501327)(52105095)(6055026)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011);
	SRVR:BY2PR02MB218; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB218; 
x-forefront-prvs: 0626C21B10
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(396003)(39380400002)(376002)(366004)(199004)(189003)(13464003)(8676002)(11346002)(478600001)(66066001)(54906003)(53546011)(81166006)(2906002)(5660300001)(59450400001)(5250100002)(6506007)(76176011)(476003)(81156014)(102836004)(105586002)(3280700002)(33656002)(229853002)(6246003)(6916009)(446003)(6116002)(97736004)(3846002)(99286004)(7696005)(68736007)(7736002)(6306002)(72206003)(305945005)(55016002)(86362001)(9686003)(14454004)(966005)(53936002)(8936002)(6436002)(2900100001)(316002)(106356001)(74316002)(1720100001)(186003)(26005)(486005)(486005)(25786009)(3660700001)(4326008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB218;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: iYDsHcIYstC7Dcr+QD9LU7rYqUhO7PBE5GBLa45PS/EGcR/oxENjHQxeT6pg0ixrz6SN9KFElesphVBCEwcToJEIV+ptTupbSaTeSTPjkdtNt3mcdyNDNwkMzNrVeIsp4GnyqI+DDoBzM95pzrMoZlutgELjDkYMYKbjI5ACa1xPSyaGhJBtJ+S8CC/E1WHyOONaIlYYKq4yH0+qGy0lK8+XHvMK2onVu0ks0SzrXkLP/gXpUs1UX9jkQKlNuljGnDWj9z7pEjnsoxnkd0Ijo2groreKJudHYcE8xrkcqYlO1s0JaSE1Z953duzXUQpsho1UygoJlU8sSK+gKQHvffZIfVY/x++X18+zCdcq5tUG/eyjrBQC9/RgOFK8yAsKTy8guAPSGP97ZnNK3XzQWpHvIG0mc1JSy15GFwLEt7A=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60679c44-ee8e-45b6-3dd0-08d595c82b2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2018 22:55:29.2016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB218
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Thu, 29 Mar 2018 23:29:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, March 29, 2018 3:26 PM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Cc: Niko Mauno <niko.mauno@vaisala.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
>=20
> On Mon, Jan 29, 2018 at 06:04:37PM +0000, Manjukumar Harthikote Matha
> wrote:
> >
> >
> > > -----Original Message-----
> > > From: openembedded-core-bounces@lists.openembedded.org
> > > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf O=
f
> Niko
> > > Mauno
> > > Sent: Monday, January 29, 2018 9:47 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Niko Mauno <niko.mauno@vaisala.com>
> > > Subject: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
> > >
> > > This mitigates following issues during u-boot do_compile() step -- ot=
herwise, if
> > > comm is not available, they are quietly ignored:
> > >
> > >   .../scripts/check-config.sh: line 33: comm: command not found
> > >   .../scripts/check-config.sh: line 39: comm: command not found
> > >
> > > Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS=
 was
> > > considered a lower impact fix compared to adding coreutils-native bui=
ldtime
> > > dependency to u-boot recipe.
> > >
> >
> > Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com=
>
>=20
> ????????
> https://lists.x.org/archives/xorg-devel/2009-October/003036.html
>=20

Sorry my bad, intention was Tested-by


>=20
> > > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > > ---
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
> > > 93afb13166..e1d2f3c3e2 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -473,7 +473,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
> > >
> > >  # Tools needed to run builds with OE-Core  HOSTTOOLS +=3D " \
> > > -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cm=
p cp
> cpio \
> > > +    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cm=
p
> > > + comm cp cpio \
> > >      cpp cut date dd diff diffstat dirname du echo egrep env expand e=
xpr false \
> > >      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzi=
p gzip \
> > >      head hostname id install ld ldd ln ls make makeinfo md5sum mkdir=
 mknod \
> > > --
> > > 2.11.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

