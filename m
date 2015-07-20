Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0131.outbound.protection.outlook.com [157.56.111.131])
	by mail.openembedded.org (Postfix) with ESMTP id 523FB65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 11:02:30 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1366.namprd03.prod.outlook.com (10.163.34.152) with Microsoft
	SMTP Server (TLS) id 15.1.219.17; Mon, 20 Jul 2015 10:48:15 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0219.018; Mon, 20 Jul 2015 10:48:15 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [OE-core] Query about the toolchian version of Yocto 1.9
Thread-Index: AdC+r6iszC4uIAiVR9SVHhXYmbSO3QACkF0AAAH6CwAAXJ3y4AAB5wKAAKdp7QA=
Date: Mon, 20 Jul 2015 10:48:15 +0000
Message-ID: <BN3PR03MB13679A7D83BD46093689F869E4850@BN3PR03MB1367.namprd03.prod.outlook.com>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
	<55A5E6D2.6050108@windriver.com>
	<A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
	<BN3PR03MB13678DEF0BBBD2424E666A30E4980@BN3PR03MB1367.namprd03.prod.outlook.com>
	<697F916E-445F-4AB5-B10B-C40E83C05828@gmail.com>
In-Reply-To: <697F916E-445F-4AB5-B10B-C40E83C05828@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [192.158.241.86]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1366;
	5:Tu6vlVHMwlKnXsuCGk+zj4t1xQY2cRPh1i3BAVfPXAO1+ic1aGnfCd/9fv0dtMY9THj8Y3riS3eMYjybF+lLx0/cd31jO4PP/PMSmbENaXBJfgOmH9HQm1zE3Mz2mc6YMhIs+krtU9PwdpKUapdeHw==;
	24:uTbI4+DKKh5VVMvjhllzNcFQLbcdlrVs65jqkQ8aR0ajZ34Yf33FiQjhbEV3WXfINa29dVFiDNmyZfwuMe4HUoTe7kef/J68rEeuFoHhFyM=;
	20:DwePJVI2MalJ/4XiIDHhsIforR845mMS2STGbHvHH+3ZkYz8cXHtirL+e9y8hwjxe+VmjWScfeWxcT1bTu+YNQ==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1366;
bn3pr03mb1366: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR03MB136664D34A5ED029C6454F22E4850@BN3PR03MB1366.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR03MB1366; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR03MB1366; 
x-forefront-prvs: 0643BDA83C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(13464003)(479174004)(24454002)(92566002)(5002640100001)(19580405001)(2656002)(102836002)(77096005)(62966003)(74316001)(122556002)(77156002)(54356999)(50986999)(2900100001)(76176999)(2950100001)(40100003)(5003600100002)(86362001)(46102003)(99286002)(66066001)(93886004)(5001960100002)(19580395003)(76576001)(110136002)(189998001)(33656002)(87936001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1366;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2015 10:48:15.3109 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1366
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
X-List-Received-Date: Mon, 20 Jul 2015 11:02:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot.=20

> -----Original Message-----
> From: Khem Raj [mailto:raj.khem@gmail.com]
> Sent: Friday, July 17, 2015 10:54 AM
> To: Luo Zhenhua-B19537
> Cc: Robert Yang; OE-core
> Subject: Re: [OE-core] Query about the toolchian version of Yocto 1.9
>=20
> > On Jul 16, 2015, at 7:00 PM, Luo Zhenhua <zhenhua.luo@freescale.com>
> wrote:
> >
> > May I know the glibc, binutils and gdb version of Yocto 1.9?
> >
> >
>=20
> glibc-2.22 (releasing end of July), binutils 2.25, gcc 5.1 and 4.9.3
>=20
>=20
> > Best Regards,
> >
> > Zhenhua
> >
> >> -----Original Message-----
> >> From: Khem Raj [mailto:raj.khem@gmail.com]
> >> Sent: Wednesday, July 15, 2015 1:48 PM
> >> To: Robert Yang
> >> Cc: Luo Zhenhua-B19537; OE-core
> >> Subject: Re: [OE-core] Query about the toolchian version of Yocto 1.9
> >>
> >>
> >>> On Jul 14, 2015, at 9:51 PM, Robert Yang <liezhi.yang@windriver.com>
> wrote:
> >>>
> >>>
> >>>
> >>> On 07/15/2015 11:41 AM, Luo Zhenhua wrote:
> >>>> Hi,
> >>>>
> >>>> I can see that there are recipes of 3 gcc version(4.8, 4.9, 5.1) in
> >>>> master branch of Yocto, may I know which one will be officially
> >>>> supported by Yocto 1.9 release? Will the other versions be tested
> >>>> and
> >> supported?
> >>>
> >>> What I know is, gcc 4.8 is a backup, 4.9 is the default one atm, 5.1
> >>> is on going, and when switch to gcc 5.1, the 4.8 would be removed.
> >>> Both
> >>> 4.9 and 5.1 will be kept and supported if there isn't more upgrades.
> >>
> >> We will shift gcc-4.8 to toolchain-layer under meta-openembedded in
> >> case we remove it from OE-Core, it still will be available if absolute=
ly needed.


