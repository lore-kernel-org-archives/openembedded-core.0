Return-Path: <DEVARSHT@xilinx.com>
X-Greylist: delayed 9774 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Jun 2018 14:12:34 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0054.outbound.protection.outlook.com [104.47.34.54])
	by mail.openembedded.org (Postfix) with ESMTP id C5AC978B9C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sp7hN8hopKKu/5SEWvxBSw3GQgBT5FgtLr5rIt0Tko4=;
	b=U3jRrfo9j/sFamxgf5EC/Br6sezRt5+YJkrMHuxu5kzVcx9qULConu9TXmC23fOcxupWhxWsTiVSuN1/XCj6hEdEoPsqdHe0EIY+LRZeGJgP3fkWoifakH83MuxNUt9SaZ/Uy4LPk9YcoK3u5ufXyrSuubgOfaq3JNYAG+G+RbQ=
Received: from CO1PR02MB094.namprd02.prod.outlook.com (10.242.163.26) by
	CO1PR02MB112.namprd02.prod.outlook.com (10.242.164.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.841.18; Mon, 11 Jun 2018 12:39:21 +0000
Received: from CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d]) by CO1PR02MB094.namprd02.prod.outlook.com
	([fe80::f873:613:595:f43d%13]) with mapi id 15.20.0841.019;
	Mon, 11 Jun 2018 12:39:20 +0000
From: Devarsh Thakkar <DEVARSHT@xilinx.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH] matchbox-terminal: Update commitID
Thread-Index: AdQBgTcvBLDnKmNSQAGQwemeUacM5g==
Date: Mon, 11 Jun 2018 12:39:20 +0000
Message-ID: <CO1PR02MB0944771307967F828960631BC780@CO1PR02MB094.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=DEVARSHT@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; CO1PR02MB112;
	7:Ms+9vGuWL80HjLH+Gfd8S4D3iRfNZUY8QFbhBQByhPFe5L8mymxCcFE4nfnFU06EWvPXLbRhShmxIbjEP3+DxE4XqhkghSszMvQtj/j05/pVCx9U3Jbi1I6bsjeYeovAEv27Tlfhu9PkUIuB2lWhbKWEhyqgzpjsAMQOOLqfaE2tUlO3leh6vumUrTpif9BUlnGPPTFPENNFqvZqIcxXUouHGhMmyZQBgkuNtP3Tl6DrmejHtHjO74VOSZWJQ7+x
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(396003)(39860400002)(39380400002)(346002)(366004)(376002)(189003)(199004)(51914003)(54906003)(81156014)(14454004)(486006)(2900100001)(15650500001)(2420400007)(3660700001)(72206003)(3846002)(8936002)(6116002)(110136005)(68736007)(316002)(2501003)(33656002)(2906002)(5250100002)(10710500007)(229853002)(55016002)(6306002)(966005)(6436002)(305945005)(9686003)(5660300001)(3280700002)(476003)(7736002)(8676002)(74316002)(81166006)(575784001)(106356001)(7110500001)(97736004)(4326008)(107886003)(99286004)(86362001)(26005)(478600001)(53936002)(66066001)(6246003)(25786009)(102836004)(186003)(105586002)(59450400001)(7696005)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO1PR02MB112;
	H:CO1PR02MB094.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:CO1PR02MB112; 
x-ms-traffictypediagnostic: CO1PR02MB112:
x-microsoft-antispam-prvs: <CO1PR02MB112F256E0FBBF5895EEED83BC780@CO1PR02MB112.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:CO1PR02MB112; BCL:0; PCL:0; RULEID:; SRVR:CO1PR02MB112; 
x-forefront-prvs: 070092A9D3
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: OObvXAriEwXYhxfaV6+PdW2fIutIM3GHcVB5zOgQW1zMY1Jejmh/9JD0cX7HM8iA1Kjb129wo+mNg+YnTqxsv+iwFrYJRPHkaaGTu0euI4PuACJ6R3EKjJrT/kI5b9mOzF4HhkZzL9700TZ0RscB4/JbiVwN71KhQ6v2GX9wqlO8q14dXLNsF7Bvh0ICrdF0
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 0d14cfa8-aa02-4211-1a11-08d5cf985a7d
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d14cfa8-aa02-4211-1a11-08d5cf985a7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2018 12:39:20.1513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR02MB112
Cc: Maulik Desai <maulikd@xilinx.com>,
	Varunkumar Allagadapa <VARUNKUM@xilinx.com>
Subject: Re: [PATCH] matchbox-terminal: Update commitID
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
X-List-Received-Date: Mon, 11 Jun 2018 14:12:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for the quick review.=20
Replies inline.
=20
> Message: 5
> Date: Sun, 10 Jun 2018 09:29:14 +0100
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
> To: Devarsh Thakkar <devarsh.thakkar@xilinx.com>,
> 	openembedded-core@lists.openembedded.org
> Cc: maulikd@xilinx.com, varunkum@xilinx.com, JAEWON@xilinx.com,
> 	Devarsh Thakkar <devarsht@xilinx.com>
> Subject: Re: [OE-core] [PATCH] matchbox-terminal: Update commitID
> Message-ID:
> 	<56788cd154d9af0b6c9ea2ef78de23b1909fd7ee.camel@linuxfoundati
> on.org>
> Content-Type: text/plain; charset=3D"UTF-8"
>=20
> On Sat, 2018-06-09 at 04:59 -0700, Devarsh Thakkar wrote:
> > Pull in change which adds support for command line
> > options (-e and --command) which can be used for
> > launching programs or running commands in matchbox-terminal
> > via command line.
> >
> > Signed-off-by: Devarsh Thakkar <devarsht@xilinx.com>
> > ---
> >  meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-sato/matchbox-terminal/matchbox-
> > terminal_0.1.bb b/meta/recipes-sato/matchbox-terminal/matchbox-
> > terminal_0.1.bb
> > index 4488191..b7fbee7 100644
> > --- a/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> > +++ b/meta/recipes-sato/matchbox-terminal/matchbox-terminal_0.1.bb
> > @@ -10,7 +10,7 @@ DEPENDS =3D "gtk+3 vte"
> >  SECTION =3D "x11/utils"
> >
> >  #SRCREV tagged 0.1
>=20
> I'm guessing the above comment is no longer valid, nor is the value of
> PV?
Yes the comment is no longer valid I will remove that in V2.
But the PV is still valid as matchbox-terminal package version is still 0.1=
 ( as set in AC_INIT at http://git.yoctoproject.org/cgit.cgi/matchbox-termi=
nal/tree/configure.ac) even after this commit.

>=20
> > -SRCREV =3D "3ad357db2302760b8a8817b5f4478dd87479442f"
> > +SRCREV =3D "ccbc3c70946b04313c6166ab0dfef21e5e83c289"
> >  SRC_URI =3D "git://git.yoctoproject.org/${BPN}"
> >  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
> >
>=20
> Cheers,
>=20
> Richard
>=20
Thanks,
Devarsh

