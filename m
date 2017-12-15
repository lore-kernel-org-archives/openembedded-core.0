Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0053.outbound.protection.outlook.com
	[104.47.37.53])
	by mail.openembedded.org (Postfix) with ESMTP id 98F6B71B31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Dec 2017 00:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=XPx8T+APYecte3z6yhLQcLEnMcwdP7ABKkD8z2EHhe8=;
	b=YTXUQVXw0AfXr4vN+MqU/taYSD1ppyad2H271aGJZZjmMtL8m8bvsd2c4q4T4uWtKUwxDFWucmRHmIrQ7WX+S8/W0kymSlMR458e4dHNHxQYV9ycCJlnnpvuqhERMFGNzIagEx/+SfWjX67osNRQ3bPGlV1C7/ttGuR4cfjeAFI=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2161.namprd02.prod.outlook.com (10.167.97.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.302.9; Fri, 15 Dec 2017 00:56:03 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::e417:e1b7:7fde:f5dc]) by
	BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::e417:e1b7:7fde:f5dc%13]) with mapi id 15.20.0302.017;
	Fri, 15 Dec 2017 00:56:03 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Denys Dmytriyenko <denis@denix.org>, =?iso-8859-1?Q?Andr=E9_Draszik?=
	<git@andred.net>
Thread-Topic: [OE-core] [PATCH 0/2] Fix build issues with fitimage
Thread-Index: AQHTdM1LuA7e4HHZtU+2UL+IPdZ6UKNDisKAgAAJSoA=
Date: Fri, 15 Dec 2017 00:56:03 +0000
Message-ID: <BL2PR02MB216331BD46CFE7E332C0354CB90B0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1513218231-12626-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1513250295.30397.73.camel@andred.net>
	<20171215001807.GH9221@denix.org>
In-Reply-To: <20171215001807.GH9221@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2161;
	6:S+eplT29G2k5pN7mpL1G9LqfxdnuWwhdNblJiM3daEuGLtv6C6GMvDkrlPNRPp6zQkif1kKoGGDDv6J+DUE0zc5i4/W9loUiie2BfUoDIUhXmoQQOKzJPfCM8gopn6JhjoLanE0U7XHasNGFkzpI+wxBPdviS4yCTqEu6a0RkSh0mXbBTBdUWK+7fSzgfH809WswYojrSHZqMwBeL/IbxdKy+fICtpid3r3nvyhX6zu4n9oHwwlm0wU56T3zq8JUohsYULYdEIDKgVq8cDEazXx/4FCU6lO/7FtLw/SgGalpHq69x58/IaNVKQTIY+KaowVLDvA6i7PTb9t6xhu9ko9nLdtuPptC3s0cdF7HgIo=;
	5:ATH3UXJYLviI/o+jaukQJYhM1g1yTzfLDhRqRB7We9zHHgSo9/evJxifzWl1u413smzKVHF3FXvfQ1VzlDGkApNE5XRCTzYFTHoQEK+vBmUOf+IMQ4+B903DnpOxMup6BGV2prsBgGypbp0bRql6o5Phi4lm3p3hywd56YNBP2Y=;
	24:75BTh+XuVoWkTpbwJ1i8AjZDoVqiAa6K8JdgqooKTGfIo1NNdp29bqyIjy7EyI9eJftr8F3Prr3OPBW+fxqCZVx71YCoctXmnZcoVyX6eUE=;
	7:Z8kMHP7QHJrXJe+7jk2RcW8DgmIS12sD6Ypan2mMBpzUwRQmTNPXExVJhPoisM7bSyzbBa/GWxT0kRFZ5YBiSjC8KtqhTnSi8SbGb4l7YhzHgg+P2dtOC27YTIwBTje+iBVyfcJ7f/CbfPdyXBnKbsdmhZ3WmbxOFwl06VralSXnvP0Jul21Xe90yR9pv7IEsWGRvbd/djbo/Q+hj4s9d0fhZGd6dKMhJkzQ9EwwrLF8arA/1cPHfKROsVyZ0fEb
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: ec3dbcd0-c4d0-4db0-66f2-08d543569de8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603307);
	SRVR:BL2PR02MB2161; 
x-ms-traffictypediagnostic: BL2PR02MB2161:
x-microsoft-antispam-prvs: <BL2PR02MB2161C9E8529F84F00B6934D9B90B0@BL2PR02MB2161.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(5005006)(8121501046)(3231023)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041248)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123560025)(20161123555025)(6072148)(201708071742011);
	SRVR:BL2PR02MB2161; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BL2PR02MB2161; 
x-forefront-prvs: 05220145DE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(346002)(376002)(396003)(39860400002)(13464003)(377424004)(189003)(199004)(24454002)(66066001)(110136005)(3660700001)(76176011)(5660300001)(33656002)(8936002)(7696005)(81166006)(68736007)(2950100002)(8676002)(99286004)(7736002)(6246003)(3280700002)(81156014)(4001150100001)(6436002)(74316002)(105586002)(86362001)(229853002)(305945005)(316002)(106356001)(2906002)(25786009)(53936002)(97736004)(4326008)(478600001)(3846002)(6506007)(55016002)(9686003)(2900100001)(5250100002)(53546011)(102836003)(72206003)(6116002)(14454004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2161;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3dbcd0-c4d0-4db0-66f2-08d543569de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2017 00:56:03.7357 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2161
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix build issues with fitimage
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
X-List-Received-Date: Fri, 15 Dec 2017 00:56:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Denys Dmytriyenko
> Sent: Thursday, December 14, 2017 4:18 PM
> To: Andr=E9 Draszik <git@andred.net>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/2] Fix build issues with fitimage
>=20
> On Thu, Dec 14, 2017 at 11:18:15AM +0000, Andr=E9 Draszik wrote:
> > On Wed, 2017-12-13 at 18:23 -0800, Manjukumar Matha wrote:
> > > While building fitimage with initramfs bundle using INITRAMFS_IMAGE
> > > and INITRAMFS_IMAGE_BUNDLE =3D "1", we have few failures
> >
> > Nothing against these patches, but what is the use-case to do that?
> > Why don't you just disable INITRAMFS_IMAGE_BUNDLE?
>=20
> +1 here

Use case is to deploy fitimage (kernel image + rootfs +dtb) and (kernel ima=
ge + rootfs) to meet backward compatibility of tools we distribute.

>=20
> Also, I don't think this is the first revision of the patch here, so plea=
se specify [PATCH
> vX] accordingly, with log of changes between revisions.
>=20

Will do, there was no change in patch. Will add v2 on applicable patch

Thanks,
Manju

