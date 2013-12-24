Return-Path: <zhenhua.luo@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0243.outbound.protection.outlook.com [207.46.163.243])
	by mail.openembedded.org (Postfix) with ESMTP id 86EA660E33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Dec 2013 06:25:07 +0000 (UTC)
Received: from DM2PR03MB400.namprd03.prod.outlook.com (10.141.84.153) by
	DM2PR03MB416.namprd03.prod.outlook.com (10.141.84.152) with Microsoft
	SMTP Server (TLS) id 15.0.842.7; Tue, 24 Dec 2013 06:25:07 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com (10.141.84.148) by
	DM2PR03MB400.namprd03.prod.outlook.com (10.141.84.153) with Microsoft
	SMTP Server (TLS) id 15.0.842.7; Tue, 24 Dec 2013 06:25:06 +0000
Received: from DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) by
	DM2PR03MB399.namprd03.prod.outlook.com ([10.141.84.148]) with mapi id
	15.00.0842.003; Tue, 24 Dec 2013 06:25:05 +0000
From: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] Why to make branch info is mandatory for non-master
	commit with latest bitbake
Thread-Index: Ac7/qf91LoUh/rs8SPifClus9Hu3aQAIbh+AACLOl1A=
Date: Tue, 24 Dec 2013 06:25:05 +0000
Message-ID: <a0048a66355d44c184a8072e1e1480d2@DM2PR03MB399.namprd03.prod.outlook.com>
References: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
	<1387795367.11527.1.camel@ted>
In-Reply-To: <1387795367.11527.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.88.158.212]
x-forefront-prvs: 0070A8666B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009001)(199002)(189002)(377454003)(377424004)(51704005)(24454002)(13464003)(85306002)(15202345003)(81542001)(63696002)(77982001)(59766001)(74502001)(47446002)(79102001)(76576001)(76796001)(76786001)(81342001)(85852003)(53806001)(51856001)(76482001)(87266001)(54356001)(87936001)(69226001)(2656002)(46102001)(83072002)(74366001)(74316001)(50986001)(47976001)(4396001)(47736001)(49866001)(56776001)(54316002)(83322001)(19580405001)(19580395003)(66066001)(81816001)(81686001)(56816005)(80976001)(74662001)(33646001)(74706001)(31966008)(90146001)(15975445006)(65816001)(80022001)(74876001)(24736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR03MB400;
	H:DM2PR03MB399.namprd03.prod.outlook.com; CLIP:192.88.158.212;
	FPR:; RD:InfoNoRecords; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Tue, 24 Dec 2013 06:25:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,=20

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Ri=
chard Purdie
> Sent: Monday, December 23, 2013 6:43 PM
>=20
> On Mon, 2013-12-23 at 06:41 +0000, zhenhua.luo@freescale.com wrote:
> > Previously the branch name doesn't need to be defined when a
> > non-master branch commit is referred in recipe, this has been changed
> > in latest bitbake.
> >
> > Is this an intentional change? May I know the reason of the change if
> it is intentional?
>=20
> It was intentional and was triggered by this change:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Df19546e02d3318ee69=
fd
> 0c34e21aa97b74c987ec
>=20
> which is a sanity test added to fix certain failure cases where a given
> revision wasn't on a specified branch.
>=20
> The bug was nasty since the fetcher was hitting the network in cases it
> shouldn't have been when a branch wasn't specified.
[Luo Zhenhua-B19537] I see, can bitbake be enhanced to support tag as well?=
 Sometimes a commit might be contained by a tag rather than branch, e.g. ta=
g created for rebased git tree.=20


Best Regards,

Zhenhua

