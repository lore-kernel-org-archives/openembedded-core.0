Return-Path: <B54851@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0104.outbound.protection.outlook.com [157.56.110.104])
	by mail.openembedded.org (Postfix) with ESMTP id 8944F73D27
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 08:02:52 +0000 (UTC)
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) by
	BN3PR0301MB1172.namprd03.prod.outlook.com (10.160.156.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.262.15; Tue, 8 Sep 2015 08:02:50 +0000
Received: from BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) by
	BN3PR0301MB1172.namprd03.prod.outlook.com ([10.160.156.146]) with
	mapi id 15.01.0262.011; Tue, 8 Sep 2015 08:02:50 +0000
From: Zhu Carol <B54851@freescale.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [poky][PATCH v4 0/2] gstreamer1.0: Add patches for
	Gstreamer 1.4.5
Thread-Index: AQHQ3B3izbWruPpruka3ABE16B3uI54XAIYAgBtfD4A=
Date: Tue, 8 Sep 2015 08:02:50 +0000
Message-ID: <BN3PR0301MB1172F54D78A3B74A137514C786530@BN3PR0301MB1172.namprd03.prod.outlook.com>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
	<55D79ECC.9070308@pseudoterminal.org>
In-Reply-To: <55D79ECC.9070308@pseudoterminal.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=B54851@freescale.com; 
x-originating-ip: [199.59.230.102]
x-microsoft-exchange-diagnostics: 1; BN3PR0301MB1172;
	5:fehQwG3GiDOppNVLH0YQKPKPSC67SkKMu/Xzf2pF8YUTl0zv9VYZfpBXoD1eVLkVnS8crfIpmcu3KI5QZz5zszpsx+v0/Er16gf42elZEUk7Z5IPo5oWbAY9f2MkeubOLBZgZtg8qpK4F0D2Ll2Kaw==;
	24:uv6k3ZRNCP5UzOuZZmDjPgnk92gWDLHgbS5+POz7ndkeSOcg4g8r2HZp16CmY/up8ji2xEiZjjbyVsUtl2AaFJt3yBzPF8CMsCHB2HCzIE4=;
	20:LCJ33B8yzer2lYpA8CTNb7N3+87akGlSN7DubwhAor3JbV04ZeCSxloNUiujF+JL/O43dbUTmQGwy0h9y43WZw==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB1172;
x-microsoft-antispam-prvs: <BN3PR0301MB117263BF55AB37D72E0FBA1886530@BN3PR0301MB1172.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(8121501046)(3002001);
	SRVR:BN3PR0301MB1172; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1172; 
x-forefront-prvs: 069373DFB6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(377424004)(377454003)(13464003)(86362001)(66066001)(5003600100002)(5002640100001)(92566002)(64706001)(46102003)(10400500002)(5001960100002)(101416001)(2501003)(107886002)(5001830100001)(33656002)(5001860100001)(189998001)(106356001)(106116001)(2900100001)(2950100001)(99286002)(105586002)(87936001)(50986999)(54356999)(4001540100001)(76176999)(81156007)(122556002)(5001770100001)(40100003)(76576001)(62966003)(97736004)(77156002)(74316001)(19580405001)(5007970100001)(19580395003)(68736005)(102836002)(15975445007)(77096005)(5004730100002)(1720100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1172;
	H:BN3PR0301MB1172.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2015 08:02:50.3516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1172
Subject: Re: [poky][PATCH v4 0/2] gstreamer1.0: Add patches for Gstreamer 1.4.5
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
X-List-Received-Date: Tue, 08 Sep 2015 08:02:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Carlos,
   If I didn't misunderstand, you meant it's ok for you because they are ba=
ckports.=20
   So community will accept these two patches if no other problem. Am I rig=
ht?
   The patches are still not being applied to master branch, I am waiting f=
or your feedback.
=20
B.R.
Yuqing Zhu


-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Carlos Rafael Giani
Sent: Saturday, August 22, 2015 5:58 AM
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [poky][PATCH v4 0/2] gstreamer1.0: Add patches for G=
streamer 1.4.5

These are backports, so I do not see a problem with them. However, keep in =
mind that GStreamer 1.6 will be out in a few days, so I recommend hold off =
any patches that are not backports. I have recipes prepared for
1.5.90 (=3D 1.6 release candidate) that I will then send to the mailing lis=
t. New patches should be applied on top of that, not 1.4.5.


Am 2015-08-21 um 16:29 schrieb Yuqing Zhu:
> Fix sticky events haven't been sent out when active track reach EOS
>
> Fix QoS/lateness checking if subclass implements prepare/prepare_list=20
> vfuncs
>
>
> Yuqing Zhu (2):
>    gstreamer1.0: Fix ticky events haven't been sent out when active track
>      reach EOS
>    gstreamer1.0: Fix QoS/lateness checking if subclass implements
>      prepare/prepare_list vfuncs
>
>   ...x-QoS-lateness-checking-if-subclass-imple.patch |  70 +++++++++
>   ...cky-events-haven-t-send-out-when-ac-1-4-1.patch | 167 ++++++++++++++=
+++++++
>   .../gstreamer/gstreamer1.0_1.4.5.bb                |   2 +
>   3 files changed, 239 insertions(+)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-=
basesink-Fix-QoS-lateness-checking-if-subclass-imple.patch
>   create mode 100755=20
> meta/recipes-multimedia/gstreamer/gstreamer1.0/inputselector-sticky-ev
> ents-haven-t-send-out-when-ac-1-4-1.patch
>

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

