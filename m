Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
	by mail.openembedded.org (Postfix) with ESMTP id D55CE7F8B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2019 03:21:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=QsdUu9ntRG7McCDpQBWfdD/pDyqH1C1KjPhUTZHMqaUZ/AWUZieX8iewDtAb0NXvtD/p+JOec+CZdWmCqqSQCbXEDotWFjLStWsgtVOMDXrbP4lnWdZdixlpXCk6uCElrnoz9d8aZkTZCLp9NQn2dO/Hse++QMNAOR5fCLeMygJg1uy1LqE+r9xwg0/OsyzPhwpajK+wk6/VCQOpQUNoJbphLXZt6wCLxkwn5MRAQB+Nsv1EDnVKNLwqZYlassewVZscB8WcdPfTx5yaSTkXRtcvaE9sxrWtq6KGTpSMtvLM/IeTmKtvd1zuZ3ZLMLLedm2qFZ5+Bgc3xNcCmNxEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uBEJ/ZXVvEGP2rMUS8XxZ+zXjr3OkS3SHb12QdU38ko=;
	b=C/GFxLMm17o4bT+wifJqw7HCiSMNH30a5/OohutrQSqsRwKeDNAfXuAZx/WfVj6omxNf1wK7e41gmk5wd73MEdyvGBFQz80dATsDxpLILboFFMbfKUHhVuubJTS9AoejbMRxpFCIvFwcAbz4gcqQAofxjmtzZUm8N9W5b+JP31el7Vfj6qs0jy7qLRMt3Lg7htxaqBKG5vqICyRoK4qurdSrsYbtfHSC/dERiDfAKK5GprLG5zSEBO0chtXB8dG8k4e8jsYmsesalxsI0XetwoZfaY5R3pAmyCysC8Dha0HF7gBbElgB6hFsAjzvFhO6i5rUHZ1oDtO9elD701bg5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
	dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uBEJ/ZXVvEGP2rMUS8XxZ+zXjr3OkS3SHb12QdU38ko=;
	b=P79Zr+534jGYGrkCWzuXNhdlKOwezryDmYNSiNOU5zIX6KGnQQLjd+ONl7T59LeTAg1+aUJsjFNoyXvpVgwsT5FH0Awd/81nTa31SgCGLWCwe7rl4XuRW2eCsWp3DhcXRokk+ufv18GJywh6udNcnie6McVqRcFoo4gS92c57BI=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.62.146) by
	BYAPR02MB4966.namprd02.prod.outlook.com (52.135.235.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11; Mon, 30 Dec 2019 03:21:07 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1899:3979:6040:ab99]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::1899:3979:6040:ab99%4]) with mapi id 15.20.2581.007;
	Mon, 30 Dec 2019 03:21:07 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] feature-microblaze-versions.inc: Update MB to
	v11.0
Thread-Index: AQHVuWAxCWmFeiN53EeMzsFrH0qe2KfSDYtQ
Date: Mon, 30 Dec 2019 03:21:07 +0000
Message-ID: <BYAPR02MB6005C78C740A07E0942846FFB9270@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1577085080-11425-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
In-Reply-To: <1577085080-11425-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [124.123.107.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 70a3d072-f3ce-4748-600c-08d78cd74f97
x-ms-traffictypediagnostic: BYAPR02MB4966:|BYAPR02MB4966:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB496692DE4EA82A3C2AE0E453B9270@BYAPR02MB4966.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:989;
x-forefront-prvs: 0267E514F9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(346002)(136003)(39850400004)(396003)(366004)(199004)(189003)(13464003)(2906002)(33656002)(8936002)(26005)(15650500001)(6506007)(71200400001)(53546011)(110136005)(52536014)(81156014)(86362001)(8676002)(316002)(81166006)(478600001)(66446008)(7696005)(66946007)(9686003)(55016002)(66556008)(66476007)(76116006)(64756008)(5660300002)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4966;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NzqidsZncU/icMbKLweg6gl0VmHbW0IWrJCe0jcEI8OojJQRAQu58kMTi3kEgjwyquoEZlNUrSqdrUF/2K4fD9NW64hkaQrEV/Pput+NyLA5IXdDCgDLHjPuIzo7PtvVNo+PJEd9tMBxyk4vwSkhworEQl+oW3pq8PwWveG0i7WjqGW+/hgkb5UAptwoyPrwook2u1a7bbJZ8Atw3hd6tDk5wVg904+oqsa0bb+dslAUVgkKP1wAtdUoGr5v+MJNrIMul1nDTifVm1x3eQN3H6bqsOSBILJSiBtKM59ps7hp8LWPRSyUEb8/zbA6At0NE8RhGvVmN2zliphXCvMyR0Cfb3L8fw7TJY4IxHlPiZDusVWHWX8Cx5yFRrELXJhJUHI13QC151jrRZsNk3wvAHWs39n0XB6U0bXNWA1DgGkikKa69ks1u5nhZGRiiLbHEvcsroYrUlMN7FbOzRmbuOflE0oK3JRhuFkRk3HKZ50nQqdhD+HLQY0F/91KUcfX
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a3d072-f3ce-4748-600c-08d78cd74f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2019 03:21:07.6033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUMZzKqf3UHAwoSln2LGd3rCju0aL4EBT8WAGpJUU8QtHtSJclzvLccyhN5r2tznNsu9hATldQxOqRpvUpxOEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4966
Subject: Re: [PATCH] feature-microblaze-versions.inc: Update MB to v11.0
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
X-List-Received-Date: Mon, 30 Dec 2019 03:21:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> Sent: Sunday, December 22, 2019 11:11 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Subject: [OE-core][PATCH] feature-microblaze-versions.inc: Update MB to v=
11.0
>=20
> Update the Microblaze to v11.0
>=20

Ping

> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-
> matha@xilinx.com>
> ---
>  meta/conf/machine/include/microblaze/feature-microblaze-versions.inc | 2=
 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/machine/include/microblaze/feature-microblaze-
> versions.inc b/meta/conf/machine/include/microblaze/feature-microblaze-
> versions.inc
> index 955674f..3221e2a 100644
> --- a/meta/conf/machine/include/microblaze/feature-microblaze-versions.in=
c
> +++ b/meta/conf/machine/include/microblaze/feature-microblaze-versions.in=
c
> @@ -44,6 +44,7 @@ TUNEVALID[v9.4]  =3D "MicroBlaze version 9.4"
>  TUNEVALID[v9.5]  =3D "MicroBlaze version 9.5"
>  TUNEVALID[v9.6]  =3D "MicroBlaze version 9.6"
>  TUNEVALID[v10.0] =3D "MicroBlaze version 10.0"
> +TUNEVALID[v11.0] =3D "MicroBlaze version 11.0"
>=20
>  # Version conflict matrix
>  TUNECONFLICTS[v8.00] =3D ""
> @@ -60,6 +61,7 @@ TUNECONFLICTS[v9.4]  =3D "v8.00 v8.10 v8.20 v8.30 v8.40
> v8.50 v9.0 v9.1 v9.2 v9.3"
>  TUNECONFLICTS[v9.5]  =3D "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 =
v9.2
> v9.3 v9.4"
>  TUNECONFLICTS[v9.6]  =3D "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 =
v9.2
> v9.3 v9.4 v9.5"
>  TUNECONFLICTS[v10.0] =3D "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 =
v9.2
> v9.3 v9.4 v9.5 v9.6"
> +TUNECONFLICTS[v11.0] =3D "v8.00 v8.10 v8.20 v8.30 v8.40 v8.50 v9.0 v9.1 =
v9.2
> v9.3 v9.4 v9.5 v9.6 v10.0"
>=20
>  # Version flags
>  TUNE_CCARGS +=3D "-mcpu=3D${@microblaze_current_version(d, True)}"
> --
> 2.7.4


