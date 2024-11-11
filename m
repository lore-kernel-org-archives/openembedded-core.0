Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D0ED2E9D1
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 09:56:28 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.45])
 by mx.groups.io with SMTP id smtpd.web10.55887.1731318981015452797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 01:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=iYY6LWmY;
 spf=pass (domain: axis.com, ip: 40.107.21.45, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FlNI7lW3cSnqWRnGNo7QYTA9MfklLa5KMbmOA+4kjThhEt0XbnbfM930qbtwSEOYTNdl60DZjd0/v3DmvhST2bg6nPxtd/wXJ64yOiNixbzkLAduYEOwn/X0lNwpji6FRw32SxJ4lPqD8D0CJUfCct4BtIoFBbPjGqb3h2zvxl0XgedXL+5DNgLP5nQaCAXe7pw2EfvIiUvdB/XNYnKM65vOv2k7655vSdZSvnKDWWlmlpiiyJKImny3FR99R4zqCL5HeIwbY10ylBW3LUlqcO2MB27QYR1vTly2M70HOavAKTHO0yIiOdBUE7LPkEiIq5DyorQXV3ksplQX/8Wd3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYyQWoUY4x2bBoEZihT74/znnD3aXVHZup6laZW5YfU=;
 b=e5DMGmH4P3Xeih87G2BEoa2Nz5yx2F8GMlq3kEKcnR2IYgVMK1pEPbBTKfQh14NtkrimFVjLBYBbRgFDQ76QG3lXQvV0vYJVi4amWrsDT1xHq2X/fU6EFBVEt6s2Dp951V/svVgOA5VqzAdSMVilCFxcTr/zfxcTcYNieRawL9YbM85wV5wLJPJ1Zk55v8+ubiiV1ydk8UBcHgO838pnIcN95XKpisjuAYHIVJXWXn8xNa1MuNj7EUu42CPHE1A0Yse7vbH7hKK9ZQhpbyDPNOK2p0yrHQTfRD88G209DCScMPUdK46K3TYpWHSN8eU6lL356QWAQK6jfuvKII8kZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HYyQWoUY4x2bBoEZihT74/znnD3aXVHZup6laZW5YfU=;
 b=iYY6LWmYadnPIojKbdQd0QW6y8fAaNboLpJba9BPUDa3n/AS8Y4jT0u3RC47FSmf6+iYtuWoxQrGmAxmoa8ur9ykm+l+TQ/fWTPiElZD1yX3eQ6G5zjTOHVpD/z/9VTcDhh5HmIAe2WeOO/ztonX+A4iDl62UXX1gaDIlrt8p20=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA1PR02MB10959.eurprd02.prod.outlook.com (2603:10a6:102:48d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 09:56:17 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 09:56:17 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Trevor Gamblin <tgamblin@baylibre.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ola x Nilsson <Ola.x.Nilsson@axis.com>
Subject: Patchtest?
Thread-Topic: Patchtest?
Thread-Index: Ads0H48/EOJfjEc9RMeKWU+kuyeVLA==
Date: Mon, 11 Nov 2024 09:56:17 +0000
Message-ID: 
 <DB5PR02MB102134FA3962BC6E299ED305BEF582@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA1PR02MB10959:EE_
x-ms-office365-filtering-correlation-id: ebcba13e-ce25-4a4a-35de-08dd02371626
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gWmNdQLRyK0+CAetU1LhbFsDcjuqQTOVslROKwWQn8DTZttin8VopbvgWJxj?=
 =?us-ascii?Q?vY3Rn7Cu2bmaXEWOCHG5lK1kXKW2GbBh9Dgep9jRc8b4RxrNj/7IGHF/rg1b?=
 =?us-ascii?Q?yIrIXghPmf9m3vwL1NdJn0bdWsOQw79zbbLIoj+H2MJWqZCFU0WJV4JITAs5?=
 =?us-ascii?Q?Z4PYI+h5+yaZAjkFHP5ZhI1ecZ7GqzJ4JcWSyzMNgmwladeULPfEuVBi6R8U?=
 =?us-ascii?Q?jkoASLD/QlWN5U8IFNsuEUOjoLHOxD5GcDbEJX6BNWUFKLXZ6zvrVqUZbJrS?=
 =?us-ascii?Q?36spJY5WgPS6k1PL0RBzAFPO2ofNG28yxiPYR8XB+0+RFr96LbT5/58siwR2?=
 =?us-ascii?Q?MTVlgPGZrajcHm5FE2jygRNJj6gLm4ui83QLfSorxK9xM1Q4DnYjpV5Mx6AD?=
 =?us-ascii?Q?bJVBuA/Wsrpw41hZhDtY6VQDltYDHyEbtrLriMFjUalEFdqDSElPr4dTTWIe?=
 =?us-ascii?Q?uDiiZnbXQiu+xV/v21apbUGDWpK3pnsv/L1RhUxelQdSOq4BKJiYy/09gjw2?=
 =?us-ascii?Q?9vZ6rOOrxDVYYIZMxgydLjc12hDwbSE1VW0/FORCiRKb4cqO9brHJ0V3JfZe?=
 =?us-ascii?Q?mfwYx1kuWcTGBnolwupssvTzNgCdeOlyV5Gqz4DogRmh6sWYlJ6BrlgUx4IZ?=
 =?us-ascii?Q?/+r9zawI1SU+hY16KhvZ3vayUoq3SWQmZffSbEyThQUyxHc3O+Y2s0f7un4o?=
 =?us-ascii?Q?RvfYcL3r0sfjN3SFGroFgWQ9AcdY0t1+jK6X8XfdY/hhBmjDLoOhWpXsudhX?=
 =?us-ascii?Q?DhkxZpDyA9cL/gMalNd8ZiwexIST9sd5qZtmNr0/7Av3+9shSFxQnGUeWDPM?=
 =?us-ascii?Q?+UlgCXYc8ZGjTJpEvEZ+0iJcsOfnILXXPe0wCRtRYPxWFS+8lChlEq0Hr22m?=
 =?us-ascii?Q?hWYSCjpzscrNyy+geazsBJNHJdMpVFbzvv68zrBGuE/JAw9Gd3hHQDcIVl0z?=
 =?us-ascii?Q?gVDG5z9vNaLn9Tw1/PcrrgJdo7rJYs3xPc5sSAK+RQn5MIBXcJ7wfH1iSE0W?=
 =?us-ascii?Q?BpeOHsdgNKu8mD9AMObHlpGGB3mryXXepdGNLAGeyA2PzAE7BuruL07W+b9I?=
 =?us-ascii?Q?9By9GdlLarEIeeAKaZlmlvdGmDxfIvKCesD2v8um+2+QbcJCcgcUHiX7KSb0?=
 =?us-ascii?Q?QZ1DW5dTPZVinmW4H7eWOeYvHN4gutfo0v2cjZFHhCAsbaJGOl1W1WhTZvzk?=
 =?us-ascii?Q?cFaTzPQXpxnFiDr+lNvGQiD3s0XarkhzELaw2Ujq+YkD4lvdRayD4X0Qu6kv?=
 =?us-ascii?Q?IeGz/NHH5yxwrA6q5nSyAAojCxXu3agHb12DNxYQgY4gwNLHj6zuBoM+U1dM?=
 =?us-ascii?Q?/hMmLF5wKdM320Fhs8abS6trOnR0UndrFJO7SbS9UinS+gSB89MqTO/1mpEe?=
 =?us-ascii?Q?tVzL8Yw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?1nLu+ntiKY8q2HVIQ7eOZ7D+KXaypnKL7K8nPRoWuF4fMAdE+rtYQ8IeN7YH?=
 =?us-ascii?Q?aBoViqeq2bxSApfXHDuSEYNSn/v/swrU08kMk5x6JlEF9/BTM0/wDdni4KIW?=
 =?us-ascii?Q?CAVm2sQt4rPvqOkczz8VtsPBscb/gHtGtMYvm80C3moOuhGeuYNsPezIyQPS?=
 =?us-ascii?Q?soWKHWndXTH99d5L6Hv5lm0wjBfyXtvmxcP023/dZ1Tm7yRgJGLY9dI25Kto?=
 =?us-ascii?Q?yTquQJM1emkZ1i0B/GUZ2OyGDw4G8+MHiG65yKuLyT8GcVcnNp4HAzZBcJaf?=
 =?us-ascii?Q?GqcOeIMACjeAIJVjzzXIfIoLbA7o8F1BsAcqd60GPmg/la/ULk9hGxjHQbRd?=
 =?us-ascii?Q?zhHnkdfvGXlOitziAFnik7rKDFNA2C9jn1WwxOcYeaTPkD/T4bVRH6iUe5V3?=
 =?us-ascii?Q?017qRiyChh22/FPIGdNeaeLzOh1+vm+03zcoblnDI6zuenvdkOL64PLIT/X/?=
 =?us-ascii?Q?OKHbFHSQS6z2JeNN0F9aViqKWd3zXiu8Ft1ki810sWnpqMYAeUD3LhfdpvwO?=
 =?us-ascii?Q?5Is77PgmIiIFM43OuShVc5ll4MV9uB6LksEtcw9t0vzxgkaSOAg/yUCqOm7k?=
 =?us-ascii?Q?navOBh8JvpgJaR2biV1iI6OwT/sSTxCWSvtofjya5POr2OYJaM9mdpSubJWn?=
 =?us-ascii?Q?KF0ZOEcAUkvWnJKiimBv0D461U0TUyhCvPFMmYJ7H28m8laHljL8V220dj4e?=
 =?us-ascii?Q?kPhYEokOQZmjeXKeYugh7XIn2XUqmikt9nDeP8KAWkONnW0Ny6D8h7SwAAJU?=
 =?us-ascii?Q?Aize5olYYbYzdvgHWaKKrtYHvyGa4AE1c7lEQ239atQGWeUzpdjbJN5qeLIK?=
 =?us-ascii?Q?ulmnq6IiCThi8OvSqnwNTzwQY7E3h+b52QSUMmvq5H4KODub0AB2w/Z5GjEP?=
 =?us-ascii?Q?OIGxozH4ZF0Qn94mnN38FJcncO7VbCGsiSX7mb+ccAA/94tb0NwTh5V00hTF?=
 =?us-ascii?Q?tq9FVznVq9E7AoA5xd2zLWgOXU11F+VpxCiboaiUyt+DGJfABltuMkZN7YQm?=
 =?us-ascii?Q?emlCzL/8KTJBj97cxiDkbvrZ2UVfAYnkunt2AKCnawVdIjeD2h4vdd/U5HhS?=
 =?us-ascii?Q?hi4XpLk0CK69kfY0oUtzk5iUshlxlie7XTKY1nSxPg7s8Jvdw2dVRx5wi5SW?=
 =?us-ascii?Q?fY65yhDgqOSCAjCf5Voo7oD84xGC3zyh4IxXzfE76Oh4prTVNO6fEEiEij7/?=
 =?us-ascii?Q?GGYW39bjc65OTNqkMhhRn66dudGSD2XOQwlE1F0dXTs3xKDxCsZZobSHS6fO?=
 =?us-ascii?Q?EdOQlrEULZP2BIK3YWpscUC0sENEvt1q87vosa/qvneTMdyTPZEsWBo835/Q?=
 =?us-ascii?Q?lx5XHEd7T0kE0jAk3mIkse5LPMJz21mWiP1aQNw0E5sKGpH+VBP7nwwsTmdo?=
 =?us-ascii?Q?ouPzqJyUA6ZA5GM2rLs2WNM1dfB2il6sVNcMN++8BPvazUi3L1EO9teVrtej?=
 =?us-ascii?Q?kpvbTyIP0R1n/MlG45hZ7da+fNNY6CRR/tXTPTBhxroX/7s5W8a8PSxNcj0R?=
 =?us-ascii?Q?LSsp2u4CcXqtSsNwn2QfwwWlCyTFK8Yut7J9WCnks+mDNWBzgkQikR41MdrN?=
 =?us-ascii?Q?lGIVJaaqzYyN1ZCRW9o=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebcba13e-ce25-4a4a-35de-08dd02371626
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 09:56:17.4354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qyS8ARo+DO2s7hSbIDakggve8C+UyeBDakU7ENw0mOgL2L9pyo9nPcA56piNPIv6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR02MB10959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 09:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206942

Is there some problem with Patchtest? It seems it has not reported=20
on anything for almost three weeks. I would, e.g., have expected it=20
to report on Ola's patch series from an hour ago as the patches are=20
lacking the Signed-off-by trailer.

//Peter


