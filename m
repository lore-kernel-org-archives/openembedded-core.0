Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0085.outbound.protection.outlook.com
	[104.47.37.85])
	by mail.openembedded.org (Postfix) with ESMTP id B441578544
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 18:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QRj11dhhr0TAp+i/hBlh3GlGw3lCz5GYGlWFRbN4Bis=;
	b=gZL4RtL1J08S4oQFdGuZY4JpwPK+WY5IfltMAe11b/1sFkvV1eEYrgWXTQWxOrj/FtpQ9nUN5kg+zF+sRhrApWX4/9ATVuDSxfSF/H2zzk4dUOrVKq6oRbZasI1dYP3190FgH68BRDyEafa5W229Ym7FmIVrOYurYGimkxb6r8g=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB2117.namprd02.prod.outlook.com (10.166.110.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.444.14; Mon, 29 Jan 2018 18:04:37 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0428.026; Mon, 29 Jan 2018 18:04:37 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Niko Mauno <niko.mauno@vaisala.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
Thread-Index: AQHTmSlH5k1h2zZ6sU+NF2lo4LVknKOLJFUw
Date: Mon, 29 Jan 2018 18:04:37 +0000
Message-ID: <BY2PR02MB34738EDF842CDBEF98D6A59B9E50@BY2PR02MB347.namprd02.prod.outlook.com>
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
In-Reply-To: <20180129174724.26768-1-niko.mauno@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB2117;
	7:JP0Xrcuavn5/Pu9X0LCYyI13vWP3YOgkZuK9xAo3BIAdgJ6bGkX+/4jX4PuUT2QSvhsDnBSFzIG3WeRMI3z+eITuCOJe+v2UGSH22Z+rioYSPn5LNbD9b/8WNkYshhk2AEb72pPCGZLnEBQQYk3YsiWQqC7dNGsAdTwSzaTUK0OrSnii6pCdx1qEGEL46sRYi5hi67I3Zi/pFHjNhKZhiztb1uPYqBJMDCJDqIrsPxny8EhPwWOGKwMt8sB6LaUb
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4e0497b2-2c36-497c-a1e3-08d56742c2ff
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(48565401081)(5600026)(4604075)(3008032)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB2117; 
x-ms-traffictypediagnostic: BY2PR02MB2117:
x-microsoft-antispam-prvs: <BY2PR02MB21170D21D19447B77090BB57B9E50@BY2PR02MB2117.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(150554046322364)(264703809997249)(192813158149592); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93001095)(3231101)(944501161)(6055026)(6041288)(20161123562045)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR02MB2117; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB2117; 
x-forefront-prvs: 0567A15835
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(39380400002)(396003)(346002)(376002)(189003)(199004)(13464003)(26005)(105586002)(33656002)(2950100002)(102836004)(14454004)(2501003)(186003)(25786009)(478600001)(77096007)(6506007)(966005)(59450400001)(6246003)(53546011)(72206003)(5660300001)(106356001)(2906002)(76176011)(7696005)(66066001)(1720100001)(97736004)(68736007)(9686003)(6436002)(3280700002)(7736002)(3660700001)(229853002)(53936002)(74316002)(6306002)(3846002)(8676002)(2900100001)(305945005)(6116002)(81166006)(81156014)(110136005)(55016002)(316002)(86362001)(99286004)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB2117;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 822coJCMovNmxbTZ9LKTL2v82fRJp1AedkpZAluKawKybS4xDFTdo4VV4Fkk0Tc6tlemOE7JBlcekDzXD1OPHw==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0497b2-2c36-497c-a1e3-08d56742c2ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2018 18:04:37.8734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB2117
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
X-List-Received-Date: Mon, 29 Jan 2018 18:04:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ni=
ko
> Mauno
> Sent: Monday, January 29, 2018 9:47 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Niko Mauno <niko.mauno@vaisala.com>
> Subject: [OE-core] [PATCH] bitbake.conf: Add comm to HOSTTOOLS
>=20
> This mitigates following issues during u-boot do_compile() step -- otherw=
ise, if
> comm is not available, they are quietly ignored:
>=20
>   .../scripts/check-config.sh: line 33: comm: command not found
>   .../scripts/check-config.sh: line 39: comm: command not found
>=20
> Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS was
> considered a lower impact fix compared to adding coreutils-native buildti=
me
> dependency to u-boot recipe.
>=20

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf index
> 93afb13166..e1d2f3c3e2 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -473,7 +473,7 @@ HOSTTOOLS_DIR =3D "${TMPDIR}/hosttools"
>=20
>  # Tools needed to run builds with OE-Core  HOSTTOOLS +=3D " \
> -    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp=
 cpio \
> +    [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp
> + comm cp cpio \
>      cpp cut date dd diff diffstat dirname du echo egrep env expand expr =
false \
>      fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gz=
ip \
>      head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mkn=
od \
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

