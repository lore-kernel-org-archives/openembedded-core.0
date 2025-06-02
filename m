Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B15BC5B549
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 21:40:48 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.19])
 by mx.groups.io with SMTP id smtpd.web11.7193.1748900442108785379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Jun 2025 14:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=gg+hJ9R9;
 spf=pass (domain: axis.com, ip: 52.101.72.19, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYVOlBtdESDDa2nFgF0wVjQs7pSmpZrvxLUWrzrUBq1RYZ6SEcTKNh1iXmMAuzVs9yieEDmm448UznBGwQ1dYD8S3ET5bRhYcohhn5c/pA4nIsWJGNxwCPdm/uoJtVcz5enL1nJOeOhDpTw7oMtez8rcDNpBdUXlTGm/JnnHiyQgTGuRp8WoagjIZ+mAYoANZhvMfr5hsL4eqRrTg1culRrr95vC3X6afGbR0JLIBmoehtnyDicBdwMG2pX2VTg6ghVXpb+nHD1abIMyqlMoWFIiVUXy69C2eCjSkOhtN23kkJ0ioRh8Cwp/eE9bJh31y9fSyp7haimgfF3ehMsPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uTdGHmuQNzyziUas8US/pDBA4HCAVMendjFyZ7Z3JY=;
 b=EhwvxFETdJdNZrGmCYw9vTg4OjgmGAbOk0PgJHvBsXVcRy+cE+DdarUOhYf/T2J7v6XJOiCFC/RlwyoO1h9RUbd/TAk/H7pcWRhTUdP9IRX2Jd963q+fZ5L9EpqLXYIln9DLtdRO/fTPOoUD880U4RyyjYRV0nJ8oodZbxOX1GwHbO4ZDR67g/EIHnRnFkblxgpd2j3y2t8UKl1FoUQWxrCiYzAXKtOMHuWrM3ems9lunuudGZsa3BAK7/uNLrONCBvIhZpnNcQCh3/h1eSjDiZh39W+wmn0rDTii35ztLo79OlzVl5mFeNB4SZROxxu1V+a+7snFMA55gctlh4yUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uTdGHmuQNzyziUas8US/pDBA4HCAVMendjFyZ7Z3JY=;
 b=gg+hJ9R9IQxQYv6T8dshrhe+6uStSSmE5jO+X1irwYZep/gIfzrsLk6Q/AEFcoiVYw0AWS72GWQD2xBZvs4ecwS9SfIG8m29dKbrxaanpay2ThNwURSwclgrtDjt4Wl83sBzT973W8pfOeukcl2z1M4G767qwH0WlzxOzcxTIcg=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PAWPR02MB9807.eurprd02.prod.outlook.com (2603:10a6:102:2f2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Mon, 2 Jun
 2025 21:40:37 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%5]) with mapi id 15.20.8792.027; Mon, 2 Jun 2025
 21:40:37 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "samanfatimarehman@gmail.com" <samanfatimarehman@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/1] Rectified license file paths for final
 images
Thread-Topic: [OE-core] [PATCH 1/1] Rectified license file paths for final
 images
Thread-Index: AQHb06ozRqdDIO1oAEGvKAyUHnqP3LPwZLJg
Date: Mon, 2 Jun 2025 21:40:36 +0000
Message-ID: 
 <DB5PR02MB102139F997DC58A72B8361198EF62A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250602102917.2424749-1-samanfatimarehman@gmail.com>
 <20250602102917.2424749-2-samanfatimarehman@gmail.com>
In-Reply-To: <20250602102917.2424749-2-samanfatimarehman@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAWPR02MB9807:EE_
x-ms-office365-filtering-correlation-id: bad27298-2f20-4299-72bd-08dda21e1caf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?D2H+wwVfmknj6LhGfkMXRAPXP7WWNdBjnJMYB1SatQ5rfnRfoBa1j8MC9+0g?=
 =?us-ascii?Q?q4CmhdkerNBXtyABoIZ/FnaLGmgDXiFVZq/IHfhESpZd+f4ieli8iMMPhZWr?=
 =?us-ascii?Q?CUc5N5fRlo4LIKsI5z3PaKIweohNo6PzFYhDLkwfs4JAphteQiPsW/dlWdd+?=
 =?us-ascii?Q?8ik7mP7gUzg7YznndNcr7oWuN+gDVMTU8/pnbGCuaScc88Qb7eoi0lGQwuz4?=
 =?us-ascii?Q?liSqJv8YcU4aVIlBk5H8Msw9CH2k4SsEAe/NRO8/zloLZ9b1p2THtCZpd4M7?=
 =?us-ascii?Q?w2HuRXAWq2HR1ILKOy4iXBxoNMK9uIgo/oPaNUi8gyf8eza2/KfKjoBW+5D3?=
 =?us-ascii?Q?mrFoW7TsmbTIhumzzAypqEtesgnm3NkK5ZvHSOJbjOEvVPWxOaDdpNezV9Xx?=
 =?us-ascii?Q?LE2I0iM8ikJNSowu2ZCjTwuyHN7FjIFet9N/QOM37Du4BboEGAIRAI/0tcFk?=
 =?us-ascii?Q?oouka++8c+RhSygX4aCrPbLgLfawgc3zSYyXCK9IKWoY5wuS64Itu6O99aub?=
 =?us-ascii?Q?g6UShd7c4wo7FenDVHXzmorqMvqXL83yaV3NNS/9+i6g/RbxLDnPenG7STlb?=
 =?us-ascii?Q?cNUUaVVJsVBfupbkERmC6SRK60lzafwUuPT3sdC+3aawfXt++VVNNHHV2gMi?=
 =?us-ascii?Q?lzExe5Xv0kPS0yWsms3c4+lCVbPTs2Rhdsw19drLTPkEVaHaD2mMHc2tdywS?=
 =?us-ascii?Q?y2Gv5KOAUP+FCj5r0LJleg51JDrqtY1djYV5cByYzr0LlwuA/PUmtUVR27Li?=
 =?us-ascii?Q?QS7ToDD2a+fq9i0WF4kou9LO8vmiMDLtxVcvqItjgUnJLeYu/x+io75lmXVS?=
 =?us-ascii?Q?e0kscfAkfbeUAnHwHJN7CRewX3qf0HXHFIliKkgxyLU+y3+5VdvxEatDanRw?=
 =?us-ascii?Q?95mwlpMe4pL8VCk0P5fFBSPLbYPHW0aALoGSEiFyqYdpBsHlqOaZ7LeFHV9c?=
 =?us-ascii?Q?6K5bXHmNhboVfphCDGpF8Cxs9nfVVGzSmNGc7ZCNYSucylij7akPwENYQMuG?=
 =?us-ascii?Q?o3eE1OQt/8CG/8JaI70wLYBH/JeJ1Dj8UdFQz+qrJ6nVkk4IWfUvZnOBNx9T?=
 =?us-ascii?Q?1ZP5kFB838wdjuxQ9dyTvNNv8Lqlq4uKLc1jozCez77YGoVhxcHJStLeRLAE?=
 =?us-ascii?Q?925POD7XKuf7VX4AZi0Oh/PDn6T9L4HyE5pWWoSqoYbuy3rEB2uQituPb4nC?=
 =?us-ascii?Q?1t/fMmT+XXH1YwDfk4Z/7OIYs+GCRotJH1zU7JffMRgWOIPDQh0gRe7BPdvc?=
 =?us-ascii?Q?5SHLxQa6D8uPjJce4yIlZikYAinQdNmckFjEFTGs5/Vd953MjpKFAi0khQam?=
 =?us-ascii?Q?EAgU+uKCc5/QUalucOidjcu1d/E+BH1BY2rJPLWVr3FZtLme/N1R3ngeKpjS?=
 =?us-ascii?Q?7y7fSNUEgeOh9Jy+IF6FF8z0yocu7t9dmjc09e2uoMruse1HN9LgWbKzYle5?=
 =?us-ascii?Q?N91gyU8TLXiW44uLYu9QHFE+NEJY0pVDeaMHHuW47Tn8V3gfMTaS5g=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?p+98btQSG7J8K7FwEU4FwLajay8aFGjd/NZMHzJiJBklcabiBlkS/pHCSn1C?=
 =?us-ascii?Q?qXkkeRQultOzHvy8cw/S8NHqCHOWT/9J/fCVPY8PUoRzoIldZ4PZ6lXWNrm6?=
 =?us-ascii?Q?e3zTjoxpY2hzgd50ZVXHXGZDokqwyr5AccKnY+RXSakNY5ScFZkVVsmVbtZg?=
 =?us-ascii?Q?SQWZ7+mYjrsaGBuTfOmRozJ+PNtSI5JBf5IzuH5ET7v0SPSYnkss3fKIyPNC?=
 =?us-ascii?Q?SqcZHlOoOC4y7sJk0dCvL4FNDybJuerQS9CpWnWZXzcFJSkpCpGWflHFCICN?=
 =?us-ascii?Q?kthzUtEINSWLP5EA5rH2m75THQPMP1MDw8DKaFVHZVCmlFg4HcVjnDkN8tCr?=
 =?us-ascii?Q?osQ6obPuzSUbngcC7OIhYNfhoPMNbVdskQQk2W65M6Zbg+TaQ++nfzXqtGe8?=
 =?us-ascii?Q?ecO1VCOnFsQmmYCR+7g2nL3jV9QOuqWBtqq+rieguzk0qg9Yzm4p0ZZpQKCu?=
 =?us-ascii?Q?WComFGLTL093rct7TeQCWrNrbfJBWw/SSiq398h166Oe+lpSuXY44HTpd76e?=
 =?us-ascii?Q?duEUrXzCS4os6w4MeheKPhXcuFhW6tMUOHo4T7mzX33aANjVerHlgRS8Hrtd?=
 =?us-ascii?Q?Q6rrXtlXdzK67LfNIBWJp3ctjVp9VW6O03WIp+NAGTAJPE0dceS6hivwMn+4?=
 =?us-ascii?Q?7jN+QcR1hdKfpbSX2fpCPmU46E+DQfFqxhNDj0vfZSBBuF11MF/be1KYlMhX?=
 =?us-ascii?Q?cuKpBf4MrjnYDLR2LCQ5Fw03tzTf4DX1iAHED7jOI37V4VxLXH4EnQQJQ+s+?=
 =?us-ascii?Q?SCBzuLwW8qoV/alCHwkgPE6hVFWPQ6TKv4so0t2rk3zvndR66KixSy7rU5NI?=
 =?us-ascii?Q?BlwIWz3oANqPC7wB0TAaDbgqEP59LbJ/dR4oxNPuNof68KzY5DB6YfkrLzAj?=
 =?us-ascii?Q?vB3WA5nIrBQdmcGvpbmujwUnhA7MmlGmsmoVbxEyzJif5u6b6TZZ5kwqit2X?=
 =?us-ascii?Q?8ChAGKH+v4dKPECwfRK9Gn8Qk5+YHW39udfR/cAa4d8COZ9bzw5InWeKof7m?=
 =?us-ascii?Q?ExmotBWybafyk5V23HNeL8zhuhAHVsJflPYj0YqzvD4//VaJgQHEkzvprTaT?=
 =?us-ascii?Q?rOAJG/fYTN4tOMYgX5mVEpYB/+8Mhln5P4g1MuiTZCyW4p1oa0/FqhBQ+QxT?=
 =?us-ascii?Q?38j5GA7z6OAM1CetV0flquE3OAAUoE7KrjzVCQlgkREdfUv4d19IF8kzZLpc?=
 =?us-ascii?Q?vlYJ+odBh8WEUzzTFpaxq69O5zpL0kYLRM0lNED17a7hqp4OXUDYeIXpWqjY?=
 =?us-ascii?Q?Hdl6/rAZeqKePWqWLOaBwP6YuanjfrQIqhk53LI/+cPcgIJZ2QSzwoabc1iC?=
 =?us-ascii?Q?lf/BLOy0E1L6X8Nx3RkhP0DNW6yVHbSVed72OZ9SE5xWoOAILe/WF4PDyx7m?=
 =?us-ascii?Q?C0b9m0XTWFdXKgsgSxLIGAMK8EAiiWxBN+UHZXuKowXrg3/6Y9rLKjVqZb2k?=
 =?us-ascii?Q?0KJFUtRDBqBr6ADVxIqANNrC0MW7TSgpNXe9EIVw3Q4fHaNVOY6SVXXuYr6/?=
 =?us-ascii?Q?z+/I88ZXciTdzEehc6E5a2/Zc2ljtPxjoXoWBVQI463+GhDzZ9Ckfjb3Ya03?=
 =?us-ascii?Q?axGcMQr6mt+lZRlj/FI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bad27298-2f20-4299-72bd-08dda21e1caf
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 21:40:37.0106
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aK5uQjkOCsDZaSmrcEYY7GaCVZrEIKUJ6/dhuZ4x3dtzruitXI/nE2GSLWbXyOWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9807
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Jun 2025 21:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217738

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Khalil via lists.openembedded.org
> Sent: den 2 juni 2025 12:29
> To: openembedded-core@lists.openembedded.org
> Cc: samanfatimarehman@gmail.com
> Subject: [OE-core] [PATCH 1/1] Rectified license file paths for final ima=
ges

The subject shall always be prefixed by a relevant context, typically=20
the name of the recipe, bbclass, etc.

And of course we need an explanation of what the patch is actually=20
trying to achieve.

>=20
> Signed-off-by: Saman Fatima <samanfatimarehman@gmail.com>
> ---
>  meta/classes-recipe/license_image.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/license_image.bbclass b/meta/classes-rec=
ipe/license_image.bbclass
> index 19b3dc55ba..b5eb27fe3b 100644
> --- a/meta/classes-recipe/license_image.bbclass
> +++ b/meta/classes-recipe/license_image.bbclass
> @@ -219,7 +219,7 @@ def license_deployed_manifest(d):
>              " ".join(get_deployed_files(dep_dic[dep]))
>=20
>          for pkgarch in pkgarchs:
> -            licfile =3D os.path.join(lic_dir, pkgarch, dep, "recipeinfo"=
)
> +            licfile =3D os.path.join(lic_dir, dep, "recipeinfo")

The pkgarch level of the directory structure was added in commit=20
1a4ab9fc26659507e678e87312b514e8ea515673 (license/license_image: Fix=20
license file layout to avoid overlapping files) and removing it again=20
is not the correct thing to do. What problems are you actually trying=20
to solve?

>              if os.path.exists(licfile):
>                  break
>          if not os.path.exists(licfile):

//Peter

