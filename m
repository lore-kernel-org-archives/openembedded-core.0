Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 62063 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Mar 2019 10:23:02 UTC
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710061.outbound.protection.outlook.com [40.107.71.61])
	by mail.openembedded.org (Postfix) with ESMTP id 41DE27CDC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wjqyMGXMS/LL6wpJ8IeBABDYKR7pjeH9exDm5W97NTA=;
	b=i9+nTnr3kkUW/Wzo1lcuqEtc187QZ1m5/be9uGRR+iFiFSJpltIZjCI7yknpPdcrBdJP4RdbLwLWtxpn/9n2h2csEORA1zvld1UrXNQqkovQhoPWzevYANSW7kOgIEp4AbeXeT0a4do3zvI9IWWsPH0WFmw/jvYMB2Pjiz9+/6U=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4215.namprd02.prod.outlook.com (20.176.249.160) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1709.13; Mon, 18 Mar 2019 16:53:38 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1dad:d1e3:42c7:e50c%4]) with mapi id 15.20.1709.015;
	Mon, 18 Mar 2019 16:53:38 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Robert Joslyn <robert.joslyn@redrectangle.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [thud][PATCH] yocto-uninative: Correct sha256sum for
	aarch64
Thread-Index: AQHU2VW8TYz/dzL110W++PraBRbQ/aYRo3EQ
Date: Mon, 18 Mar 2019 16:53:37 +0000
Message-ID: <BYAPR02MB6005A0C47997F4B9327F2EE0B9470@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <20190313040344.11803-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20190313040344.11803-1-robert.joslyn@redrectangle.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e982734b-2067-43f0-17ba-08d6abc24484
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4215; 
x-ms-traffictypediagnostic: BYAPR02MB4215:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BYAPR02MB4215EB66AF155DB2918F39E2B9470@BYAPR02MB4215.namprd02.prod.outlook.com>
x-forefront-prvs: 098076C36C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(366004)(199004)(189003)(13464003)(53546011)(66066001)(102836004)(97736004)(25786009)(186003)(26005)(6306002)(9686003)(6116002)(53936002)(2501003)(6246003)(6506007)(305945005)(99286004)(3846002)(5660300002)(7736002)(76176011)(6436002)(7696005)(74316002)(81166006)(476003)(2906002)(11346002)(316002)(14454004)(52536014)(486006)(68736007)(256004)(478600001)(14444005)(55016002)(86362001)(105586002)(8936002)(229853002)(81156014)(33656002)(966005)(446003)(106356001)(71200400001)(71190400001)(72206003)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4215;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FgrrsUzS1YgL3QkFD3mmPiyvkWDrH6jHfzO+i5hZohQALzBDMWJrfIN4Hdlo9yx2PLNnodf97og5NdArBwRC8hejtKB2CLYA1cL6Nih1B7Jxhyxe92xrOAQEY+1EJzaOii1f+6T5oECPieZKgRo9m4Lh7zC7AzBBNnCssiju84ViJCdi77ywCaXZ9kgU1gw4qKloiU4mxr4NEho/cGdcZtPS4c0UV7OxQuaCTjDeLHka8W12CcmPR1MVPTofPvYk8nhUek9uxTWLZc6DUbPcidSvNJUiwxd4gMxDSZDaJMOg/HFdIAWqZdN5klSa+PoCLKbpg6+Q5FOFD641VqE2xjZOMwZ8LTXY9uG6WGvSICjHFjB7w2BB3ay9GoUGvPGRYEiUrF5+hog1UZpq/SPJdUbBUbOTgLq7f1Nqq+n6t+k=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e982734b-2067-43f0-17ba-08d6abc24484
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2019 16:53:37.9395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4215
Subject: Re: [thud][PATCH] yocto-uninative: Correct sha256sum for	aarch64
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
X-List-Received-Date: Tue, 19 Mar 2019 10:23:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Joslyn
> Sent: Tuesday, March 12, 2019 9:04 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [thud][PATCH] yocto-uninative: Correct sha256sum for a=
arch64
>=20
> From: Michael Halstead <mhalstead@linuxfoundation.org>
>=20
> Avoid uninative checksum warnings when building on aarch64 hardware.
>=20

On what machines does it fail? Should be backport this to thud v2.6.1?

Thanks,
Manju


> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/yocto-uninative.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/yocto-uninative.inc
> b/meta/conf/distro/include/yocto-uninative.inc
> index c9d502ba4f..0d484f6c3c 100644
> --- a/meta/conf/distro/include/yocto-uninative.inc
> +++ b/meta/conf/distro/include/yocto-uninative.inc
> @@ -9,7 +9,7 @@
>  UNINATIVE_MAXGLIBCVERSION =3D "2.28"
>=20
>  UNINATIVE_URL ?=3D "http://downloads.yoctoproject.org/releases/uninative=
/2.3/"
> -UNINATIVE_CHECKSUM[aarch64] ?=3D
> "b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
> +UNINATIVE_CHECKSUM[aarch64] ?=3D
> "e495046969c796b7fbbaad1ec86d76eca84d83098f50525b8a4124cc8685eaed"
>  UNINATIVE_CHECKSUM[i686] ?=3D
> "44253cddbf629082568cea4fff59419106871a0cf81b4845b5d34e7014887b20"
>  UNINATIVE_CHECKSUM[x86_64] ?=3D
> "c6954563dad3c95608117c6fc328099036c832bbd924ebf5fdccb622fc0a8684"
>=20
> --
> 2.19.2
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

