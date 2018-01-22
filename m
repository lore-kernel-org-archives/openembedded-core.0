Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 948 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 22 Jan 2018 22:56:18 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0042.outbound.protection.outlook.com [104.47.33.42])
	by mail.openembedded.org (Postfix) with ESMTP id 16DA57860E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 22:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=DOUtaJzSpo6vAsqau73su5WaP0wioDQsS44e3GAyvVo=;
	b=daeaqOs6HLZl6MuUILeXMhscKB1hlU1rxDDlPPXO11vVOqkYtuicCLEbQXdBuItcEN2kvnqoYF2CgKPP623lBYfjNFDhpWq5RMm4zians6+Gm4tobkJUqe46NV7ZdxeObweZrpBav1qr/8oc00vGiCukMrkLuhjRS5OTR/gOYBg=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB1736.namprd02.prod.outlook.com (10.163.27.146) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.428.17; Mon, 22 Jan 2018 22:40:28 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) by
	BY2PR02MB347.namprd02.prod.outlook.com ([10.141.140.149]) with mapi id
	15.20.0428.019; Mon, 22 Jan 2018 22:40:26 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "meta-xilinx@yoctoproject.org"
	<meta-xilinx@yoctoproject.org>
Thread-Topic: [meta-xilinx] liblzma: Memory allocation failed on do_package_rpm
Thread-Index: AdONyO7F0CbDbyZMTvmUCBS8jdjlFQAzpWQwAU6AxyA=
Date: Mon, 22 Jan 2018 22:40:26 +0000
Message-ID: <BY2PR02MB347FB0D073B441A3049A88BB9EC0@BY2PR02MB347.namprd02.prod.outlook.com>
References: <BY2PR02MB347697DA9F50BFD39015C3BB9EB0@BY2PR02MB347.namprd02.prod.outlook.com>
	<MWHPR0201MB34015DEC8B70EA929C25084EACEA0@MWHPR0201MB3401.namprd02.prod.outlook.com>
In-Reply-To: <MWHPR0201MB34015DEC8B70EA929C25084EACEA0@MWHPR0201MB3401.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB1736;
	7:EWJduuXMA88W7SQvyM7D2NGrIFf3LwEEBekpydsyDb4QnbJEpO9xqDwd7FG0NuAPBZcxcgTakTlakyONyXP8n5TbgCN+0jovdhW3DdAIlmKb/Eor55DPT9VxvoABIbHBS19MzuqtNsO3/Ba07C9GiHIvcVc8hX0elv8MOGuARPl56wa4WS4OCePtiMUj6V79+Jz0si3ppm3b2cdg29E3BpVe/f4B6do80QklXk/k14BKiFc60vYZY4Ahn2NdpJn+
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(376002)(366004)(346002)(39860400002)(396003)(39380400002)(53754006)(13464003)(189003)(199004)(9686003)(110136005)(7696005)(6506007)(3280700002)(7736002)(77096007)(8676002)(106356001)(76176011)(66066001)(2900100001)(74316002)(14454004)(102836004)(53936002)(26005)(305945005)(6436002)(8936002)(97736004)(229853002)(316002)(25786009)(81166006)(81156014)(55016002)(105586002)(86362001)(68736007)(6116002)(2950100002)(5660300001)(3846002)(6246003)(2906002)(478600001)(33656002)(2501003)(53546011)(72206003)(99286004)(3660700001)(2201001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1736;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-correlation-id: 089f12a5-16e2-468c-1adf-08d561e92213
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(3008032)(48565401081)(2017052603307)(7153060)(7193020);
	SRVR:BY2PR02MB1736; 
x-ms-traffictypediagnostic: BY2PR02MB1736:
x-microsoft-antispam-prvs: <BY2PR02MB17361FA3B9404C7C69F657C6B9EC0@BY2PR02MB1736.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863)(264703809997249)(192813158149592); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040501)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231023)(2400081)(944501161)(6055026)(6041288)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1736; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BY2PR02MB1736; 
x-forefront-prvs: 0560A2214D
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: dnycBvlvyQm7zh3zNdQEoGrrqaJNIpOpHHtQUnNAvB42uthOtsDlLb8oCdK0vifo3fckVSpabIh/3lNYPzMsSQ==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089f12a5-16e2-468c-1adf-08d561e92213
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2018 22:40:26.7401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1736
Subject: Re: [meta-xilinx] liblzma: Memory allocation failed on do_package_rpm
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
X-List-Received-Date: Mon, 22 Jan 2018 22:56:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

> -----Original Message-----
> From: Alejandro Enedino Hernandez Samaniego
> Sent: Monday, January 15, 2018 11:00 PM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; openembedded-
> core@lists.openembedded.org; yocto@yoctoproject.org; meta-
> xilinx@yoctoproject.org
> Subject: RE: [meta-xilinx] liblzma: Memory allocation failed on do_packag=
e_rpm
>=20
> Hey Manju,
>=20
> I'd like to see if I can reproduce this, could you please send the the st=
eps you
> followed?
>=20
> Thanks!
>=20
> Alejandro
>=20
> -----Original Message-----
> From: meta-xilinx-bounces@yoctoproject.org [mailto:meta-xilinx-
> bounces@yoctoproject.org] On Behalf Of Manjukumar Harthikote Matha
> Sent: Sunday, January 14, 2018 10:20 PM
> To: openembedded-core@lists.openembedded.org; yocto@yoctoproject.org;
> meta-xilinx@yoctoproject.org
> Subject: [meta-xilinx] liblzma: Memory allocation failed on do_package_rp=
m
>=20
> All,
>=20
> Has anybody seen this error?
>=20
> Finished binary package job, result 0, filename (null)
> error: create archive failed: cpio: write failed - Cannot allocate memory
> error: liblzma: Memory allocation failederror: liblzma: Memory allocation
> failedFinished binary package job, result 2,
>=20
> .......
>=20
> RPM build errors:
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     Deprecated external dependency generator is used!
> |     liblzma: Memory allocation failed    liblzma: Memory allocation fai=
led    liblzma:
> Memory allocation failed    liblzma: Memory allocation failed    liblzma:=
 Memory
> allocation failed    liblzma: Memory allocation failed
>=20
> This happens in do_package_rpm task on various recipes, coreutils/libgpg/=
diffutils
> etc.
>=20
> The host machine has good amount on memory, 256G to be exact. When I see =
the
> error and issue free -h command, I still see ~120G free memory available.
> This is a RHEL 7.2 machine and I am running rocko baseline.
>=20
> Any reason why this would happen? Where should I look to fix this issue?
>=20


This seems to happen if your server configuration has (not a standard confi=
guration)
vm.overcommit_memory =3D 2
vm.overcommit_ratio =3D 90

And probably this as well
kernel.unknown_nmi_panic =3D 1

Thanks,
Manju

