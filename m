Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0067.outbound.protection.outlook.com [104.47.40.67])
	by mail.openembedded.org (Postfix) with ESMTP id 48835784F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 21:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=sz6P3iEXvqpZi6fmhg0CxEH67M+smPgLQu4Zk4e7eoM=;
	b=mRlN+qIu7G/h/SMisw4VfkFwVcWotW/hR9OB6c8bfBNqw3sL45mLgo5ue7KxL+Q4zCSt68QnSkHLHMbuLDytxOHNnehGMLw0ErTM/+2Jb2sBzgSVgYapSZhGPBLfQr/v2r7DPl88y8TUn4gWe3sA3BpCpqwaGrjHrYN953k/aqU=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2164.namprd02.prod.outlook.com (10.167.97.26) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Tue, 19 Dec 2017 21:34:01 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::753a:6ea6:a5e0:c73]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::753a:6ea6:a5e0:c73%14]) with mapi id 15.20.0323.018;
	Tue, 19 Dec 2017 21:34:00 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] kernel-fitimage: Fix bad image type replacement
	for aarch64
Thread-Index: AQHTdD/2uKZSP8gddUqMmcr5IeJDEKNLOR9Q
Date: Tue, 19 Dec 2017 21:34:00 +0000
Message-ID: <BL2PR02MB21635E15F53E8D190D70AD01B90F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1513189598-9420-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
In-Reply-To: <1513189598-9420-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2164;
	6:sWPhb3+LzN/kbyFDjzXHNEHJrNHf3Z0hIlMYkXtCj8Xc8JnaVU6NFGT5wWQ+voCNRDKMTULeSxkzl+hEAv5S445ksP7mYPcPnqPwSk6jZem0nafLont3PqQ0SuPwJMNhYvg5bGqt5vaQkR4i6PauSZlWcMjPzyBM/LzlqNFLYJ1Kv8vnKokuU2XiB/SGzm1EEDifOq4H2vpOo1p+FLvsC+xQxmiZ8wjXUsmoAeencTXDxrnCClOsPMwo2SD5nD1nU9h5pao9iDLYPAtRLbno+yZ112Q1ZtiIsdFVQioaItvma9C6dSmlGU0LeEnrYgZlffEE9iKjBwT8onOQERC5Ax31kDmTG5i9FKKzC84Ay5o=;
	5:BOOGEl+h7LNjS/zgn84d2N3vxsfecSnVEDMtyPNUNouumo0d7BvwVRl8N8fiuzFU3N07X9h4u1maL9NMCC+wGn31qP+EZJzeK83Vj4pDGnC8sSit+qCv0hsXMyYdtwx9AEMFclgqUK2UEyIBK4HCmcx3x1qb3/xcFjfVGPWSIOc=;
	24:IWqNlexj74oEcYnaJVyrMXykKDrhB04cfBf41w8IuOrSVznfDxHBGyUt0vSw2IT/YATyOtjUPSrzcCykVWhzMt+FrlKhpr0Zlw4//this+c=;
	7:2yOJelmv9foKGb8CDMkMe0hVHOL2hWREn3RC0rsHehBXTNoU4nro0SHbkV51xuJkDG5c+J106kWwfbs7iGR7UvC5wN2U9WnVXGqMIN8kxppaSgxt5/rCiE6E/vfOupYbKQ+NjO01Ohyt7kgHhqm9cGIkFbU2KRXHydaoBoPD0Ewhoj8HE54iydAWICvhymCV9wjMuLq1+KR24cM1wym2pX4kj1m3U4XBzdxJ7grSpyk3/d7iN5/JMWsm0rdytw9i
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39860400002)(396003)(366004)(189003)(199004)(13464003)(99286004)(25786009)(74316002)(55016002)(106356001)(9686003)(105586002)(478600001)(2501003)(81166006)(72206003)(76176011)(53546011)(66066001)(6506007)(59450400001)(33656002)(7696005)(5250100002)(2900100001)(14454004)(7736002)(8676002)(81156014)(3846002)(2950100002)(5660300001)(6116002)(2906002)(305945005)(3660700001)(229853002)(6246003)(6436002)(102836003)(4326008)(68736007)(8936002)(3280700002)(53936002)(97736004)(110136005)(86362001)(316002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2164;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a58dced9-be26-4900-e2dc-08d5472837c0
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(48565401081)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(2017052603307)(7153060);
	SRVR:BL2PR02MB2164; 
x-ms-traffictypediagnostic: BL2PR02MB2164:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-microsoft-antispam-prvs: <BL2PR02MB21643451DAA890951321ECA6B90F0@BL2PR02MB2164.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(10201501046)(93006095)(93001095)(3231023)(3002001)(6055026)(6041248)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(6072148)(201708071742011);
	SRVR:BL2PR02MB2164; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BL2PR02MB2164; 
x-forefront-prvs: 052670E5A4
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a58dced9-be26-4900-e2dc-08d5472837c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2017 21:34:00.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2164
Subject: Re: [PATCH] kernel-fitimage: Fix bad image type replacement for aarch64
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
X-List-Received-Date: Tue, 19 Dec 2017 21:48:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping?

Any reason for this being in pending status? Please let me know

Thanks,
Manju

> -----Original Message-----
> From: Manjukumar Matha [mailto:manjukumar.harthikote-matha@xilinx.com]
> Sent: Wednesday, December 13, 2017 10:27 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Thomas Perrot <thomas.perrot@tupi.fr>; Manjukumar Harthikote Matha
> <MANJUKUM@xilinx.com>
> Subject: [OE-core][PATCH] kernel-fitimage: Fix bad image type replacement=
 for
> aarch64
>=20
> From: Thomas Perrot <thomas.perrot@tupi.fr>
>=20
> When using kernel-fitimage class with aarch64, the image type has to be I=
mage not
> zImage.  This patch fixes the bad image type replacement for
> aarch64
>=20
> Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 179185b..9baf399 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -7,9 +7,12 @@ python __anonymous () {
>          depends =3D "%s u-boot-mkimage-native dtc-native" % depends
>          d.setVar("DEPENDS", depends)
>=20
> -        if d.getVar("UBOOT_ARCH") =3D=3D "mips":
> +        uarch =3D d.getVar("UBOOT_ARCH")
> +        if uarch =3D=3D "arm64":
> +            replacementtype =3D "Image"
> +        elif uarch =3D=3D "mips":
>              replacementtype =3D "vmlinuz.bin"
> -        elif d.getVar("UBOOT_ARCH") =3D=3D "x86":
> +        elif uarch =3D=3D "x86":
>              replacementtype =3D "bzImage"
>          else:
>              replacementtype =3D "zImage"
> --
> 2.7.4


