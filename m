Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.53])
 by mx.groups.io with SMTP id smtpd.web09.8511.1626358574195692394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:16:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=dIjwnAKS;
 spf=pass (domain: siemens.com, ip: 40.107.15.53, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAB/uU7p9K+a3D08yU/4vYaY5AooYKsBrxrFcselOMlpMozV1Gkq2R0SFt5IY0bm0uIn2q22bnlJOA405U/iV7CuX3/zH35taIVkPjTfDfGTt1hv44AOG5y6zLY90IMVa1f8hUarjAkwsUEqmwwbbCHPUENEiGQbiJTVcH8iEhO38TtJ+cceLLjeepOJUNvOz21Er6rjwSf6/O//96jPiWKvdxjMPWgCJ5UfKsNopWUizLTDevSPqJdaXqcZFSpYN+rcNaHMQ3ybgEYyTAKawnyd3d1BBPgrx/3DH2Tf5qy6PbLyd55ffhKED4e1KWeuMB8ZhPg0w0vkX/gc//NGdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhDver/dU0zL29QigfkzU4nD35q2sMAzaEdyT1xHGNc=;
 b=It4mJU6INM+Mb2afF0ZfWDQo3n9htAdOF5MBiGAmsC78rYipf2+SX5+pDoTukNwCFUjO4JsuXCGx1BC01MYmdWA2bFcVc7SG4hDowFDy9NEYeFZwxKTeay5ubU29qNbbCDae9AomfZQeIT/+crJEsA5VzMYdoUdc1pz4xG43sc+UwH5ahG4CsRaEYr2oZHFZakRKwuRj8EOYsZ3035xNQHLEjl/MaQZ1G4BhHIdOLwql/uWEEqITTMj+OsRHKo0e757NA0oWoOePMubY0J5XOHtgNpOHWHk7I6OE9YFMfxekOJS/0WV+Dr+M20XxnwDSlaQwZOaWM2EvYxaaWJ931A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YhDver/dU0zL29QigfkzU4nD35q2sMAzaEdyT1xHGNc=;
 b=dIjwnAKSdInIr7mWr197YFCCPDKgaGWKSBahvjoxNeVzIYWa1iJ4qVHFVTmGs3wS+PfvR1XYr3jes4iwLNKjWJh2QcvKtaAoYKJZq214QIw0ct3rLOBj81YA7iWd9nThPXY8lysTFNkc2/fjamIgRjXfqIbMI/U2+q2/G6OUNHI=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DBAPR10MB3996.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 14:16:11 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2ce8:8499:f719:8472%7]) with mapi id 15.20.4308.027; Thu, 15 Jul 2021
 14:16:11 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell 0/7] Patch review
Thread-Topic: [OE-core][dunfell 0/7] Patch review
Thread-Index: AQHXeYLmmd9OJd+OpEyEjqN2WJ0896tEFCkg
Date: Thu, 15 Jul 2021 14:16:11 +0000
Message-ID: 
 <DB8PR10MB39779213B08C56830ED27D3492129@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <cover.1626357703.git.steve@sakoman.com>
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-07-15T14:16:09Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=f0fd4ff4-b0f9-4c8f-95aa-b88a29213ce8;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81f08c5b-1c63-4554-8a00-08d9479b1947
x-ms-traffictypediagnostic: DBAPR10MB3996:
x-microsoft-antispam-prvs: 
 <DBAPR10MB399658E653B6A9439A76031E92129@DBAPR10MB3996.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:586;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 y+RcnuFqFbFHTvkihCrj5z9NH8JMKwuWm7bCDO6xyPJDuLGI5MEL6iJBVfM6GP1+A66Zj58LZ282M0FbmO7jc1aao6AfBbdrXxsC+U/+zrMdlREBZTUIiPyo9p3mK+cRhFBSAuaEdJZy2hJbmj5KaKTzN067ZPU5wO7wnSeI4k4GpcTp5+Kh/MxxwlZTUgWwncHB8oIu9YqoneduFuA12YHGhUmdcajRCnYR0yf08YzlvmKmgtey6cFWyVPQ0yXAJcJkBwyNBw4nW2VVbncIzaQvfPbC5oUDgT6Tk8oS8yBd5Py7VI1P/LeX2wZpRmzUeZhanjJE45o2zHX0jMSlskme/kqZ6WlOcK3JyVB7g+OGXh70n5fL1MO+sVZ3Vnukk7xm8X+rmcvQ27xfWCXT75PIVw4Dtl3Z0z74OUx/dLQfZnQsIsZxqVZu/XAH+mdEJmf9oDA83wF965Qe6LV0N83lsj8UMZSraRef2OacerkIdmFCtJ80X47d/V3rwJL8piTZ01tpKcgC7ZNHvuVoZftNPYomeODurMQf0jwuGkVMqL79jGvT/l1AfzkxoQ9B6nWDE4Yk/OTq3nIh3LNza8FEDfWCT4MH7GASAf5jZq5Lz3HDuPOrUJDiCwZOpp4ONaksivxJr9efrrdPTgZ6vw2ktvPAo3dWnXDHlmK2a8ww/uPQ51iHaUFXN6lLFK4ZuChrB+8Ds6cRebaj5KN2qhsegTijiM4yFu2g0vlhsCSRo57Ckm9mwXyb+fp38hKxR/QHmzTl616DGKlgg8wnVFn81kbP83h10WdzAwmduqI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39850400004)(66556008)(66476007)(66446008)(66946007)(64756008)(4326008)(83380400001)(478600001)(966005)(45080400002)(71200400001)(9686003)(26005)(7696005)(76116006)(6506007)(86362001)(8676002)(2906002)(52536014)(6916009)(186003)(55016002)(5660300002)(8936002)(33656002)(316002)(38100700002)(122000001)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OC1JRvA5I2lwcC14l0nI0buljWwpYRLNeheXsXN0S00tBAY9Fi21kdGOZv8f?=
 =?us-ascii?Q?cCr4pfG6rX61PL7SR6RQ3i0LDYqAwMSZsLSvX8288nNa3uSagu61GTWkOZ+c?=
 =?us-ascii?Q?ogxufSMHXvUUSaJegRYlk1WxxE4sN5xvrpjsX6dPG55xeK5z62E1Bg8wO3Ob?=
 =?us-ascii?Q?rcLNC4flBoBfK9+7RAVo7ahU0FbFbCbWF995RJd6yvXS9AFz36iM52MWd3JZ?=
 =?us-ascii?Q?tntRIEvlWgqATHd4SfvKOMzqrVFH94IxuVExnoMTEcFKK8NFm33pwYjCv8tH?=
 =?us-ascii?Q?tfGZxmj2dq6wUWvAV8BmWImPY/g39CdsxiZ7rLhtDhZny5fCL/g3lEll1OgI?=
 =?us-ascii?Q?qZRLskyZqFWqylOUbliwPdwrdSgoXXYi2thgmIX7Uad63bnIxYuYiiyBy6mY?=
 =?us-ascii?Q?gNAAlR9Q3o2Z/obsYNHqcjQNIUaGVGdbnCOUpmuTyyQCdbry49BdsRq5Y9m3?=
 =?us-ascii?Q?rlrN8KiV7izAenNNWYLeyMzUgZ/NOLxEc1W7j2IrWfXumFUS0Ja/XQ6NddnZ?=
 =?us-ascii?Q?+er8n/Uin1cJ4rLMt8MKTXBVK3cooMC1CkEUiGINkLsdmGPCMTPtivqQavjK?=
 =?us-ascii?Q?+SpML2aFycu1oRkZWWF0Yp7toHmnVOf6w9e2SyR4qRHha5+qhdk/PI7Ku+Z1?=
 =?us-ascii?Q?adGGU6ZX0sSNZYgjCDQXZSOZ2HOLhxLrtX1Np0Rv5nCXqIJOABamtKsqxvJb?=
 =?us-ascii?Q?H1I63l/QkSmlEwwhgvzOPDLrA3Mi9qSetgNrwVWaG8QVYpd8R1jciLK6wSBR?=
 =?us-ascii?Q?DWhiWnhTsIpyiEj0dbUp0j2N/6AKX62psU1YRQ/JLyFGo1IzKlHC4/y6/z7U?=
 =?us-ascii?Q?eL24P1AN2j9HaVVPkuIJ8Sk4eeEzyauM+So0DbXMYjR5WWuDSoNjZebVU3DM?=
 =?us-ascii?Q?MWxH57vHc3QxrePCIMVXkjplM9XbVlQ5vlikCERtn5RO92bTusp3I64CD5WR?=
 =?us-ascii?Q?DcbcuskHWZXnzG7EedfEFViDxR3dtEeSk7hdmtmcZk8zZsjHS5nEtjTCYiCu?=
 =?us-ascii?Q?xCWjwCORtjsP4mb8f1+4QeoYVp1+dP24ESq6J4I3gG/AfdH0MbhjH0v4WIFR?=
 =?us-ascii?Q?+QCVsmz0v+wQuAWktmQLf1ou68d8c/YFC27+jJw7tCnIxk0YRKpgVtY5TG4l?=
 =?us-ascii?Q?j9+133GUiO9+Zqh3li4/BLxGYjV2b/X5WVynuLwl1AqJ80IyaToXu/ftv0mA?=
 =?us-ascii?Q?EG+3nGt5PMYbmkFIGXl/tA7y8yiDV+KIwWmgIoffwLfXf3NjKD+yyTaHAIAl?=
 =?us-ascii?Q?/VdR6O+GonuYKFBVHdFX9TWKp6EwjFwq6OAUXkE4ggaPHomdikjEtUimDzrc?=
 =?us-ascii?Q?Krjup3e0JJgu3tpkc8j84wcs?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f08c5b-1c63-4554-8a00-08d9479b1947
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 14:16:11.7744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z90SPm6YNHkhYpZpi7amtQyrKHYpEvshbo3NeCVA1b67irzW55JipIIdT9eFDdkT370kkso4rP+t4jbJzYYrgK+hCA91eJfbTICdMJ/3Bto=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB3996
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Steve,

Busybox patch looks fine.

Cheers,
Andrej

> Please review this next set of patches for dunfell and have comments back=
 by end of day Monday.
>
> Passed a-full on autobuilder:
>
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fautob=
uilder.yoctoproject.org%2Ftyphoon%2F%23%2Fbuilders%2F83%2Fbuilds%2F2350&amp=
;data=3D04%7C01%7Candrej.valek%40siemens.com%> 7C0b3180079754416d5b4808d947=
9a07ea%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637619549152185601%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;sdata=3DlHIY6jrIIjgQrMFGZI5aGHjaqK4A5Y17uptGKbI%2ByX=
Q%3D&amp;reserved=3D0
>
> The following changes since commit cfd74f2bae51413d9c327e0f08ecf751325c2d=
74:
>
>   report-error: Drop pointless inherit (2021-07-11 06:19:43 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>   https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fcgit=
.openembedded.org%2Fopenembedded-core-contrib%2Flog%2F%3Fh%3Dstable%2Fdunfe=
ll-nut&amp;data=3D04%7C01%7Candrej.valek%40siemens.com%7C0b3180079754416d5b=
4808d9479a07ea%7C38ae3bcd95794fd4addab42e1495d55a%7C1%7C0%7C637619549152185=
601%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DRqxpOBjsL%2B6GJnZwWtQ7KHLi%2FAcp1A0K=
Zza9ow9p%2FPc%3D&amp;reserved=3D0

> Andrej Valek (1):
>   busybox: add tmpdir option into mktemp applet
>
> Richard Purdie (3):
>   pseudo: Add uninative configuration sanity check
>   pseudo: Update to latest version including statx fix
>   sstate: Drop pseudo exclusion
>
> Steve Sakoman (3):
>   bluez: fix CVE-2021-3588
>   gstreamer-plugins-base: ignore CVE-2021-3522 since it is fixed
>   gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are fixed
>
>  meta/classes/sstate.bbclass                   |  2 -
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
>  .../bluez5/bluez5/CVE-2021-3588.patch         | 34 ++++++++
>  .../0001-mktemp-add-tmpdir-option.patch       | 81 +++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
>  meta/recipes-devtools/pseudo/pseudo.inc       | 13 +++
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  2 +-
>  .../gstreamer1.0-plugins-base_1.16.3.bb       |  4 +
>  .../gstreamer1.0-plugins-good_1.16.3.bb       |  5 ++
>  9 files changed, 140 insertions(+), 3 deletions(-)  create mode 100644 m=
eta/recipes-connectivity/bluez5/bluez5/CVE-> 2021-3588.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-mktemp-add-tmp=
dir-option.patch
>
> --
> 2.25.1

