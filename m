Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.76])
 by mx.groups.io with SMTP id smtpd.web10.7156.1587332275897517026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 14:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=PDFP1kHw;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.223.76, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmQMzt0wNd/xt/LbVNR7wha60LLyUPOy1L5Mt9AR8kfnfqJsU3crJPfjmh400SyRpzeG75ttnhI/L7dLujWd6/hhu3bQl1aHUVXUODdSQrtqZOsZo3k+vFRkEHwjPHtR58gdZLxtlL97GcBduTCyDADiAlsGGE6/XTtkLJCI/Cp3cd4eCQUgApQmOCT6u1flSlDQGPsr6Hk+VYE0kkqLJyjYNZYmW6js2Rb1G09RAeDp8XaTgrP8Ruls05pt2sdmTKHWFjs2o6d+cWikcO36YNXyoDUUX8qIXlU1ByDyQyIFonp3NEd6j7/cUbvHBWE/XY9GQprU57dbyOYqejCv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD2pGh2lE9/yRqn4mYpHCEOxoNfcfMZ2qnNQotU0JtM=;
 b=GtJRfkajhf2f+370rJHe67x3y7BIaKf5leHrXn4rrg+l5eP/3FH134SQAEjQlvSzfWPlYn3eMep0OZyHn/a+sWAPyfn9LOf1jLApniPcnmV12jY1j+qeeIxObot+3Bd/t2uNxFDE0ueaOZmhiC7smJ+uOiSOIrm0kN72nquKNhtNmIYONcGCoHLqbMsHbFY81WDTFxGDSHoIh5lUzjG/dGXmC2aItiu2x1nRcFxM+1Ce63ESWqmim4IYMiRpiHVYCZAuerfmabOEcj7xdQhENR8zCLzBC8+AjMyZ3JF+yXd75AfpnAd1wRVXtr66y8UTD0FUiK30bFc6tsgTBFQvUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oD2pGh2lE9/yRqn4mYpHCEOxoNfcfMZ2qnNQotU0JtM=;
 b=PDFP1kHwHU4dcmTTwfrpCpxRSbLj6PQydCjbTPSz4ZWZd/AO1dky6tCUS0qGfAwrfnuWArk0xEk0TLGhfuPzaJpS04o9nCrIx3JWMwpRoYkGX8Ia37rzZ9oh/MexNfw65Blks2hAJG7QB6SVw4lFsdEQMp/+6Qdv+VELIzCV8yw=
Received: from DM5PR12MB2471.namprd12.prod.outlook.com (2603:10b6:4:b5::10) by
 DM5PR12MB1803.namprd12.prod.outlook.com (2603:10b6:3:10d::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.29; Sun, 19 Apr 2020 21:37:54 +0000
Received: from DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab]) by DM5PR12MB2471.namprd12.prod.outlook.com
 ([fe80::a135:cafb:783f:f1ab%5]) with mapi id 15.20.2921.027; Sun, 19 Apr 2020
 21:37:54 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Uninative for i386 native tool?
Thread-Topic: Uninative for i386 native tool?
Thread-Index: AdYWkVM2trCb21KjTGaQ4NZX8woV6A==
Date: Sun, 19 Apr 2020 21:37:54 +0000
Message-ID: 
 <DM5PR12MB24716958338957D20225905B8BD70@DM5PR12MB2471.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [71.225.127.147]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fdb0592-e6df-45d1-275c-08d7e4a9eb5e
x-ms-traffictypediagnostic: DM5PR12MB1803:
x-microsoft-antispam-prvs: 
 <DM5PR12MB180356B4190ECAD19E5173C28BD70@DM5PR12MB1803.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0378F1E47A
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2471.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(346002)(396003)(376002)(39860400002)(136003)(366004)(29502001)(52536014)(71200400001)(2906002)(8676002)(81156014)(8936002)(33656002)(7696005)(66946007)(66446008)(6506007)(5660300002)(26005)(76116006)(66476007)(66556008)(64756008)(6916009)(55016002)(9686003)(86362001)(478600001)(186003)(316002);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: agilent.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CX7gje13W+1DXQpPZO3a1Enm09UYcxoynWF2DMRqUu9N41QHdnnn4VW4BP7JhwM/N2jki8M/NGiLzmu6S0taxC/KS5x7TNNw9RJ3wY67smNNqjHUqSknnVK/9rDYbQcG+yoPrGPq0YUzlx2exugvK0+kO4GceN9Aux6L5RNA2jMsi+8P9s5vu7A8bOHzzn4TYM3qnTy3pbiCLzEvySo6Nt1Byob7ntudjR2z97sMAc65qS2zfRbWxMGQLqiazaLKcGShB+N8gdzztedYjIY+OXv4zrg9SoYQB7MEeqiytrvLfrEdrmOLNyrstoioJPassJVfrxYY9sTGYdaXYGYO3Lp1U/CplAGBJx3OPjqgd41+of2KG6lPZ2Mt7aEtz9yCtpLSbCg2HTJYrJzHD1OHdSHpLKsYlXo3KFQ2+01I14OqLfPuzmqSvIpQSwKQJU3ruv7O96WQTOKFlgly1tFnhazgZYrBovZ6VlPObV64CWPZigpNECSF+RgzWUOChOiY
x-ms-exchange-antispam-messagedata: 
 73hWN8Gt7ttOPVbmD9INa/wDGVe9tPSgYPEA/lvd91BnUksGkLZGLZmiTxlxnadPjjylfIWmYxJWDH161J2cSWn1yJ5MsZDrRwKVBcnxoK7hOEdKA7MRggczoX6Oess34IvLFijPLFeM/hlKgb3/IA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdb0592-e6df-45d1-275c-08d7e4a9eb5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2020 21:37:54.5117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lvTFkB42aN43SJ1c2f1dF3u018qPVnierwlL4EONsLSAT6/00GMIfNrIPb+5O2GFp80J8Wn2I7UDCPzG9jzcYNB1pc22gqESNVIyrDfpGRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1803
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We have a vendor-provided cross-compiler toolchain that is distributed as 3=
2-bit binaries. Naturally on my native system (outside of Yocto) I can run =
them by first adding the i386 architecture to dpkg, and then doing "apt-get=
 install -y libc6-dbg:i386 lib32stdc++6 libzstd1:i386 libncurses5:i386" or =
similar.

Outside of Yocto (a normal terminal):
____
ldd recipe-sysroot-native/usr/bin/my-tool:
	linux-gate.so.1 =3D>  (0xf7f03000)
	libstdc++.so.6 =3D> /usr/lib/i386-linux-gnu/libstdc++.so.6 (0xf7d48000)
	libm.so.6 =3D> /lib/i386-linux-gnu/libm.so.6 (0xf7cf3000)
	libgcc_s.so.1 =3D> /lib/i386-linux-gnu/libgcc_s.so.1 (0xf7cd6000)
	libc.so.6 =3D> /lib/i386-linux-gnu/libc.so.6 (0xf7b20000)
	/home/laplante/yocto/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linu=
x-x86-64.so.2 =3D> /lib/ld-linux.so.2 (0xf7f05000)
____



But in a Yocto devshell:
____
ldd recipe-sysroot-native/usr/bin/my-tool:
	not a dynamic executable
____

Is there a way to get this working in Yocto? I assume it has something to d=
o with uninative?

Thanks,
Chris
