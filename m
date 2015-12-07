Return-Path: <Tom.Hochstein@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0133.outbound.protection.outlook.com [207.46.100.133])
	by mail.openembedded.org (Postfix) with ESMTP id F2D9F60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 13:35:05 +0000 (UTC)
Received: from BN3PR03MB1415.namprd03.prod.outlook.com (10.163.34.22) by
	BY2PR0301MB0728.namprd03.prod.outlook.com (10.160.63.18) with Microsoft
	SMTP Server (TLS) id 15.1.337.19; Mon, 7 Dec 2015 13:19:25 +0000
Received: from BN3PR03MB1415.namprd03.prod.outlook.com ([10.163.34.22]) by
	BN3PR03MB1415.namprd03.prod.outlook.com ([10.163.34.22]) with mapi id
	15.01.0337.015; Mon, 7 Dec 2015 13:19:24 +0000
From: Tom Hochstein <Tom.Hochstein@freescale.com>
To: "alexander.kanavin@linux.intel.com" <alexander.kanavin@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] weston-init: Use weston-launch for XWayland
Thread-Index: AQHRLIbHitan7sN+MEGWVSbXi9DD456/hjdg
Date: Mon, 7 Dec 2015 13:19:23 +0000
Message-ID: <BN3PR03MB1415F09661073294ECA6D2A2E8090@BN3PR03MB1415.namprd03.prod.outlook.com>
References: <1449001866-29286-1-git-send-email-tom.hochstein@freescale.com>
	<60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
In-Reply-To: <60070.10.252.17.232.1449008484.squirrel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Tom.Hochstein@freescale.com; 
x-originating-ip: [24.206.70.76]
x-microsoft-exchange-diagnostics: 1; BY2PR0301MB0728;
	5:FDh8+KplIqbARHAY41WhK641aqIzcYHJ0WXT+hVE0L0RgRTLDK9tc+aV7iP1uhhNKdlEJeLijU5s9j7C2QP43gy3Dm8KSAZVZd01eWu1R03W8pG9lypay+Dt7mRmItSM0GdIOnnUPaGXKgfPIuGJDg==;
	24:D6wlO+stAlFetF23EqzweGUzjDP7m9Wvw936fqaHT8fnJLm9Ir1PCd41P8b2RnlPUTTbtVT1din4DN0fNNm2Tz3zVcVXAkuX1P8+sD7gPZc=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0728;
x-microsoft-antispam-prvs: <BY2PR0301MB072866D3A9895C120BF2DB13E8090@BY2PR0301MB0728.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(101931422205132)(228905959029699);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(520078)(8121501046)(3002001)(10201501046);
	SRVR:BY2PR0301MB0728; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0728; 
x-forefront-prvs: 078310077C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(189002)(40764003)(13464003)(199003)(122556002)(99286002)(2950100001)(87936001)(106116001)(105586002)(189998001)(40100003)(33656002)(106356001)(2501003)(81156007)(76176999)(92566002)(5004730100002)(5002640100001)(101416001)(97736004)(2900100001)(10400500002)(50986999)(54356999)(110136002)(107886002)(77096005)(66066001)(5001960100002)(15975445007)(86362001)(102836003)(2351001)(586003)(3846002)(19580395003)(6116002)(74316001)(19580405001)(4001430100002)(5008740100001)(5003600100002)(1220700001)(1096002)(76576001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0728;
	H:BN3PR03MB1415.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2015 13:19:23.8654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0728
Cc: Sundararaj Prabhu <Prabhu.Sundararaj@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston-init: Use weston-launch for XWayland
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
X-List-Received-Date: Mon, 07 Dec 2015 13:35:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

We're wondering how best to fix this.

The Weston website seems to give the answer for a run-time solution, which =
is basically 'if $DISPLAY is set use weston, otherwise use weston-launch'.

http://wayland.freedesktop.org/building.html

Is that the right approach? Another possibility is to make it a build-time =
solution where the bsp layer sets a variable controlling the selection.

Thanks for your help.

Tom

-----Original Message-----
From: alexander.kanavin@linux.intel.com [mailto:alexander.kanavin@linux.int=
el.com]=20
Sent: Tuesday, December 01, 2015 4:21 PM
To: Hochstein Tom-R60874 <Tom.Hochstein@freescale.com>
Cc: openembedded-core@lists.openembedded.org; Sundararaj Prabhu-B36876 <Pra=
bhu.Sundararaj@freescale.com>
Subject: Re: [OE-core] [PATCH v2] weston-init: Use weston-launch for XWayla=
nd

> +        # If weston-launch exists, we're configured for XWayland.
> +        if [ -f /usr/bin/weston-launch ]; then
> +            echo "Starting Weston in XWayland"

Nope. XWayland support and weston-launch support are configured separately.=
 One may be present and the other one absent, both ways.

Alex

