Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0115.outbound.protection.outlook.com [157.56.111.115])
	by mail.openembedded.org (Postfix) with ESMTP id 78EF173E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:00:51 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) with Microsoft
	SMTP Server (TLS) id 15.1.213.14; Fri, 17 Jul 2015 02:00:49 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0213.021; Fri, 17 Jul 2015 02:00:49 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: Khem Raj <raj.khem@gmail.com>, Robert Yang <liezhi.yang@windriver.com>
Thread-Topic: [OE-core] Query about the toolchian version of Yocto 1.9
Thread-Index: AdC+r6iszC4uIAiVR9SVHhXYmbSO3QACkF0AAAH6CwAAXJ3y4A==
Date: Fri, 17 Jul 2015 02:00:49 +0000
Message-ID: <BN3PR03MB13678DEF0BBBD2424E666A30E4980@BN3PR03MB1367.namprd03.prod.outlook.com>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
	<55A5E6D2.6050108@windriver.com>
	<A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
In-Reply-To: <A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [199.59.231.64]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1367;
	5:2YmV0dfTC/vKmIwNmXuUN9sDzjfn9Acv6x4/N3sAQCreiOXqr/TZH2Z3kI8PE2HTsGWWMKbEAF8la6XMkx3ELrDwFlaf1FLpo/7JWSKL7yhEz68JzizlDZ2j1kS7o/N3LUB8hc1yZoRoHceMc3wLKg==;
	24:wM5bcIBEHNExSR/dIWyp4hGRCYm6JhbWB6WlK8bI46rH/AQVdn74FJ/iS7wyS2jdbRrvQY7Mi8We1BmrPKdzMAWKmZWDG49/pvaMXt8G8j4=;
	20:WFoMQexI+ariSSiOalwOrIASZj6miihgm/tlRpdvHgTi/Mb97LvgsqSG9Pu+mX1IGI3nSywfdPntm/HjCL3mmg==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1367;
bn3pr03mb1367: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR03MB1367984963869EFBCFAD131BE4980@BN3PR03MB1367.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR03MB1367; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR03MB1367; 
x-forefront-prvs: 06400060E1
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(24454002)(377454003)(479174004)(13464003)(77156002)(62966003)(2900100001)(2950100001)(74316001)(19580395003)(87936001)(19580405001)(86362001)(77096005)(102836002)(5003600100002)(2656002)(5001960100002)(33656002)(99286002)(189998001)(5002640100001)(122556002)(54356999)(50986999)(76176999)(46102003)(66066001)(76576001)(92566002)(5001770100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1367;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2015 02:00:49.4091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1367
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Query about the toolchian version of Yocto 1.9
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
X-List-Received-Date: Fri, 17 Jul 2015 02:00:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

May I know the glibc, binutils and gdb version of Yocto 1.9?


Best Regards,

Zhenhua

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Wednesday, July 15, 2015 1:48 PM
> To: Robert Yang
> Cc: Luo Zhenhua-B19537; OE-core
> Subject: Re: [OE-core] Query about the toolchian version of Yocto 1.9
>=20
>=20
> > On Jul 14, 2015, at 9:51 PM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> >
> >
> >
> > On 07/15/2015 11:41 AM, Luo Zhenhua wrote:
> >> Hi,
> >>
> >> I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in
> >> master branch of Yocto, may I know which one will be officially
> >> supported by Yocto 1.9 release? Will the other versions be tested and
> supported?
> >
> > What I know is, gcc 4.8 is a backup, 4.9 is the default one atm, 5.1
> > is on going, and when switch to gcc 5.1, the 4.8 would be removed.
> > Both
> > 4.9 and 5.1 will be kept and supported if there isn't more upgrades.
>=20
> We will shift gcc-4.8 to toolchain-layer under meta-openembedded in case =
we
> remove it from OE-Core, it still will be available if absolutely needed.

