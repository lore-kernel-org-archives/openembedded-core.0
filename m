Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 909 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Feb 2015 03:41:55 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0122.outbound.protection.outlook.com [65.55.169.122])
	by mail.openembedded.org (Postfix) with ESMTP id 8225C601DC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 03:41:55 +0000 (UTC)
Received: from CY1PR0301MB0715.namprd03.prod.outlook.com (25.160.159.145) by
	CY1PR0301MB0649.namprd03.prod.outlook.com (25.160.158.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.20; Tue, 3 Feb 2015 03:26:45 +0000
Received: from CY1PR0301MB0715.namprd03.prod.outlook.com ([25.160.159.145]) by
	CY1PR0301MB0715.namprd03.prod.outlook.com ([25.160.159.145]) with
	mapi id 15.01.0075.002; Tue, 3 Feb 2015 03:26:45 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: Raphael Philipe <rapphil@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>, "rohitarulraj@freescale.com"
	<rohitarulraj@freescale.com>
Thread-Topic: [OE-core] [PATCH 1/9] binutils: upgrade to 2.25
Thread-Index: AQHQM7f6ZR6uHMuPvkqPNdZo7G/g/pzMDrMAgA7p14CAA2DN0A==
Date: Tue, 3 Feb 2015 03:26:45 +0000
Message-ID: <CY1PR0301MB0715FD0E99D6A071153A39B6E43D0@CY1PR0301MB0715.namprd03.prod.outlook.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
	<c1e126ada5030706b289f4916e24f280f423d6f3.1421651689.git.liezhi.yang@windriver.com>
	<CAJTo0LZG97KQbY8mTwBpruADXJz+mJomGa1s2Q_KWVgAENB-hg@mail.gmail.com>
	<CAENGNhdPsd5NkL0B2Y91w_ointzgW3NRFhk-DvxhvQ8KFpyLQQ@mail.gmail.com>
In-Reply-To: <CAENGNhdPsd5NkL0B2Y91w_ointzgW3NRFhk-DvxhvQ8KFpyLQQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.211]
authentication-results: gmail.com; dkim=none (message not signed)
	header.d=none;
x-microsoft-antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0649;
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0649; 
x-forefront-prvs: 0476D4AB88
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(24454002)(51704005)(69234005)(13464003)(46102003)(99286002)(62966003)(92566002)(40100003)(15975445007)(74316001)(2950100001)(102836002)(2900100001)(77156002)(1720100001)(76576001)(93886004)(66066001)(19580405001)(19580395003)(33656002)(54206007)(87936001)(106116001)(2656002)(122556002)(86362001)(76176999)(50986999)(54356999)(54606007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0649;
	H:CY1PR0301MB0715.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2015 03:26:45.3514 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0649
Cc: Edmar Wienskoski <edmar@freescale.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] binutils: upgrade to 2.25
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
X-List-Received-Date: Tue, 03 Feb 2015 03:42:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We are working on the u-boot build issue now.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Raphael Philipe
> Sent: Sunday, February 01, 2015 7:45 AM
> To: Burton, Ross
> Cc: OE-core
> Subject: Re: [OE-core] [PATCH 1/9] binutils: upgrade to 2.25
>=20
> I've got the same outcome while testing this patch with meta-fsl-ppc;
>=20
> It seems to be a recorrent issue.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D754610
>=20
> Any clue on how to solve it?
>=20
>=20
> On Thu, Jan 22, 2015 at 10:00 AM, Burton, Ross <ross.burton@intel.com> wr=
ote:
> >
> > On 19 January 2015 at 07:16, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> >>
> >> * Remove the following patches since they are already in the new code:
> >>   binutils/fix-pr15815.patch
> >>   binutils/fix-pr16428.patch
> >>   binutils/fix-pr16476.patch
> >>   binutils/fix-pr2404.patch
> >>   binutils/replace_macros_with_static_inline.patch
> >>   binutils/binutils_CVE-2014-8484.patch
> >>   binutils/binutils_CVE-2014-8485.patch
> >>   binutils/binutils_CVE-2014-8501.patch
> >>   binutils/binutils_CVE-2014-8502.patch
> >>   binutils/binutils_CVE-2014-8502_1.patch
> >>   binutils/binutils_CVE-2014-8503.patch
> >>   binutils/binutils_CVE-2014-8504.patch
> >>   binutils/binutils_CVE-2014-8737.patch
> >>
> >> * The file src-release is gone.
> >>
> >> * Updated patches for the new code.
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >
> >
> > FYI, this is breaking u-boot on meta-fsl-ppc (#7145) so when Freescale
> > have fixed their u-boot fork we can merge this.
> >
> > Ross
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

