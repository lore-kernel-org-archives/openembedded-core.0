Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 1057 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 15 Jul 2015 15:05:12 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0143.outbound.protection.outlook.com [65.55.169.143])
	by mail.openembedded.org (Postfix) with ESMTP id 10CDA6AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 15:05:12 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1368.namprd03.prod.outlook.com (10.163.34.154) with Microsoft
	SMTP Server (TLS) id 15.1.219.17; Wed, 15 Jul 2015 14:32:33 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0213.000; Wed, 15 Jul 2015 14:32:33 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: Khem Raj <raj.khem@gmail.com>, Robert Yang <liezhi.yang@windriver.com>
Thread-Topic: [OE-core] Query about the toolchian version of Yocto 1.9
Thread-Index: AdC+r6iszC4uIAiVR9SVHhXYmbSO3QACkF0AAAH6CwAAEk51AA==
Date: Wed, 15 Jul 2015 14:32:33 +0000
Message-ID: <BN3PR03MB13671B3CFBDCAF4275900B68E49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
References: <BN3PR03MB1367ABE95BBD2A48796FF31FE49A0@BN3PR03MB1367.namprd03.prod.outlook.com>
	<55A5E6D2.6050108@windriver.com>
	<A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
In-Reply-To: <A0733748-C753-4201-A2F7-FA771C65B63B@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [199.59.226.141]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1368;
	5:1VLfsL9XurEkq+wvcKpcJIhFh20EJcJ0c3hfVUSMGloE+G3tulu7IwYntZJJy2S0TifxS3V7D4wDvb/K1lu2w6PE3m+nScSkAgAVzkwd8K3CiKspFZg6IIhKDatOt/zYjDrmkhX+W5yUtVptqLYFEA==;
	24:0BF0hZSkpPEwSDaOK6iXPcD/4+iI58JAwKwOoKEIeNVQJ1HoCVb/JEGHPRKTRBNpTfx91FwNBwYMEzfrc2SNF8SGYQqxoJX9zY2faoyh2F0=;
	20:moh4rDbKJsb/nt4Ew57zTfAtDWRxgJ+rx6FRD7/p2th4vDYgFBtabbTt5yjZY1TnADs2hNYjIUXjrT3ONJmoSQ==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1368;
bn3pr03mb1368: X-MS-Exchange-Organization-RulesExecuted
x-microsoft-antispam-prvs: <BN3PR03MB1368023F8B99B8303E7BDDEFE49A0@BN3PR03MB1368.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BN3PR03MB1368; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR03MB1368; 
x-forefront-prvs: 0638FD5066
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(13464003)(479174004)(5001960100002)(5001920100001)(189998001)(19580405001)(76576001)(66066001)(5002640100001)(77096005)(19580395003)(102836002)(74316001)(76176999)(5001770100001)(54356999)(2950100001)(50986999)(2900100001)(40100003)(92566002)(46102003)(62966003)(2656002)(99286002)(5003600100002)(33656002)(86362001)(87936001)(122556002)(77156002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1368;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2015 14:32:33.7236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1368
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
X-List-Received-Date: Wed, 15 Jul 2015 15:05:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot.=20

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

