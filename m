Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3705.1795172524040549978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 03:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=PzDZRkfO;
 spf=pass (domain: prevas.dk, ip: 52.101.70.67, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiPQakqGmsb2//3xzxk07jOSqnJoFwB2FZPWH/y2eLTECx0HLc4y9JdCseqwoo5tErlONmGdw5ffjRAg7n7hkvsbvPDejUDeZOorDIaL+j9qjnxAVf0TK5NmfhwO9rZuCN6GFZ1DH9qws7QGQtlmuE1j6+np4ZdhkC3tbTJEndXeOzY3PjLzQ6aCMx3U1wt8oUnt+SewhJZBbc+tTxMn7Fpmsc80XApBIfhvRQbthbrSrypWiArlWY3yKpdySUh5NmqriuCIjeMvdj4F1Yy19sk7DIcpNkRxU/smwuwB4X0VV99ryeelAq15diHvqWgJ6D1BbM+i2oSvp5NDse2+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PoOYmb2TiiElvo6dPsARfLzYYR644Os3mo1zaYudtxg=;
 b=RpQHxsMcUQEVAVvyGOdmk896RF2eLqIMJ4s+1XYu7bHrvIPF3ZES/GZ2Fzu7cBzC6bx3O7covCbS4Nf1mppTwR/mZ65skiL2V7d3PwwVcvdengUFo2avTCejnkpqQsYVHMXN8NIa+WlDoxIg9Hd//MJDS7QVlyPiHkc4r4m1Acch+5wW5ob+YhtQoaKsvcaedyjxOEzoS7cG+iPPbsKo3yVzxvIM8pQkGgML+qlodrs2NKoY66PXTRip3obgXmGlopgDM6QDXQ6HH+0ACP9aIjZX71M6yca/C2XHJECel+Zc1ZFgetdJ9iY3JVavrXr195LvRns5HGsT3irWZhEQrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PoOYmb2TiiElvo6dPsARfLzYYR644Os3mo1zaYudtxg=;
 b=PzDZRkfO1zdKZcyeC3hkF63ykFSGSMQ1dyXe9G/AFJicGZ45wyo0W6xxHq5tdbfK2Y4umy/o8OIwa0zhF8mlLFsJ3B/eJ/1fhR/NkGReenShhZ0PMG3TxZl2FYfR+Onj1gO7m6Fi92IbOkEcW+p3XQ4a5Ug/Wi5HLOt44M1IVvk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by AS5PR10MB8080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:652::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 11:01:56 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.21.0662.000; Fri, 20 Nov 2026
 11:01:56 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,  Mathieu Dubois-Briand
 <mathieu.dubois-briand@bootlin.com>,  Richard Purdie
 <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [wrynose][PATCH] image-buildinfo.bbclass: add missing
 vardeps to buildinfo_target function
In-Reply-To: <18E6FCC35BB16260.822248@lists.openembedded.org>
Organization: Prevas
References: <18E6FCC35BB16260.822248@lists.openembedded.org>
Date: Fri, 20 Nov 2026 12:01:54 +0100
Message-ID: <877bi76a1p.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-ClientProxiedBy: CPCP307CA0005.DNKP307.PROD.OUTLOOK.COM (2603:10a6:380::14)
 To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|AS5PR10MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 78761107-af23-4e23-a064-08df46f5b0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|11063799006|261026121527099003|261026140227099003|56012099006|261022115727099003|261022105027099003|261028144727099003|261102123227099003|261021121427099003|261022075727099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: EMocH4NiMWxdwuj050SEdTMFXjWOszcSaomerYexCpve0+SmbaE4vtgHYP3t7mUydbCadTFLXl240BalCYOXVzI83R6WIfHizRAuDDfvZZWcJlNBzQerbQZmP39Lb5dv2iZ4hVgqji9v6CwfwbpdgJrcAe48Vn10ohQfMJVQSuf16j/0l3nlse00jkEQwB0f+cOuGC31vu8/cKlpM2YkVo09iInSX/11i75wTUvL1kNgYvkmP2QrgNf12LL2Sw4KwNtMORi8ORQGpvPJGtdSu8SZHaiMdzWjRAfLf7J1U9dth9N40Iic1z6BAQHaXP7Rm4eXHQRPMyJgpu/tuiseEhMoce65ibeAVU1XgRPr/Nhiv30k6o9Os6nmpzMzNn/uHHQT5teC5DezJtTnvZyxh+NPPysDT1WnQSW07+uapx47bpsQIOlPyocoFLud7IP0mRnupEMuMnAv/UuQBezvuCewb8VhVca2l3j2tpYBI0rmApJOqIFfcX3A1WnLUTUdrX2tG8wRcyYPo695YaQFwQjw8HhEcQQ3roUSgWMpnIpX/k9eHFQK7Uq9GfQWY94By5r6x6kE/vj1ZMRk4Ii7OgGRtoSFD95ZbCty5jQJJnP1uFMNuRymgWxMN9V8qO+xefaKO+ft2IpAqwI3EmiDxmmm57I+1peb/DePH4lqRrc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(261026121527099003)(261026140227099003)(56012099006)(261022115727099003)(261022105027099003)(261028144727099003)(261102123227099003)(261021121427099003)(261022075727099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eI55540pb7NG8DBx0/AQmsLhpjyx0BrTd3iL8z307ozEQ8j01Oo8syDiv2Fg?=
 =?us-ascii?Q?83IC4h8w/mjsTJBfNrvmexhFZBUvzT2YlsNJ1stJB0CGS/SRBUVqikGbTwdr?=
 =?us-ascii?Q?Ue4DtL6H6H85acOM/VccpClSj+ih1S8qK3AdHrkBf1JKcKs8B3YGF1RnIJgN?=
 =?us-ascii?Q?g6d0+rQwOlCPa140K3/IA2OTFyyEx19CgzYSwAdvjEWIRGlFz4iswhA7VndO?=
 =?us-ascii?Q?mKZO7wrUQF7KOWnysDMv6/+z8C6omUS6+/awDH6VPJ/MR7IVIScE4cqWjHo1?=
 =?us-ascii?Q?bzNNQyjtecx5tBaHvgkKlvNuekiYMaCVfPmS0X1lF8lOiPRVi6cxXsPfGcWd?=
 =?us-ascii?Q?HVqBQhgNh88OG2W07uHXk9lQ3Z5f5lRLV2deWhLs0PeIu+pbHRi2QDRqHrM/?=
 =?us-ascii?Q?W6F8DJtTV4p6QGZ65SGa1i9c/JDbmlgKFTqIAiUMPrM3YL2S+1ylQyCOlrn5?=
 =?us-ascii?Q?EN1F/Jls9MA4gdyn0D1dr3W8AiBPw2imr0+U8kMTitlxHXHBRrjTBbp8MDds?=
 =?us-ascii?Q?YJ/yEtsGh3OSGWmCBalfnMmIAGt1btaTMgoB+fQMHc3qqbrpotoAHY+8pRz4?=
 =?us-ascii?Q?MEwXoTs7vXF0m7qqob460BNW+pKK+R+sL2laBL7OST9oMEI89z4ohip3kiK3?=
 =?us-ascii?Q?EHozN7AB5uK7LX5Y7QF62E/HGPbizqByFyQUXaQ3dOtuHSLqLg1GK5CkpDEp?=
 =?us-ascii?Q?gtvR6ME1X133rDWXaydzBzLqzl7AhWhtCO7C4F7RlDzSOY4F2Gd/mYUU2P/3?=
 =?us-ascii?Q?YqrELjrd1IHjYbACPa/QWsxt4NCTWLautVYd/KsVTCvJ5jImJnvWsJJEeMsl?=
 =?us-ascii?Q?Lov+BfJyH8BGKQbx4SaCqOBdsLjKV5jv9/BcEHKZVPXkTS54BCAShgE0cMVx?=
 =?us-ascii?Q?Zi7YMFZ/oBYSAWiuVhBz8DveC5b+JmSyPuYyA3oXIOdRnaGg1vBBbNjR5FUs?=
 =?us-ascii?Q?AJQXLnYKNRcdfYrtjsMnXF/CyklaZkvZ15pv3AdvVGdrS0cJUy+pLyy+N3rh?=
 =?us-ascii?Q?/gjOmXlTBcDIjYKQof1LjJfdfzBCrlgne2IaknHsw62xiXbYkT63Cb0FtX6s?=
 =?us-ascii?Q?F1B9jK69JokpDqw6Hk0z2ytPFlhORQD1R/F5e/DCBIF5c5qvDBEp45kzvodX?=
 =?us-ascii?Q?J4jzliAJpE4ZZpmYa75+PP2uLdgzbRARhedkMmiHAg5skcwQu9OXwPFbFNju?=
 =?us-ascii?Q?F0ndyd7DFFk/3UeQQ2enq1Owd7eJlB2AnTHrhXsbmwIJzL7KDNslsxQV+KgF?=
 =?us-ascii?Q?VD48nKw7Yp4O95bNr1zMXbLQvAwPRFSPZIgzl3s2+vdZajlhiD99cbR04yL/?=
 =?us-ascii?Q?LyzPrIfo9g60SsxMOapnFKfuxFBvbmTDN4HPWDDtPFZ2dAYHV/w/xr9cdFKC?=
 =?us-ascii?Q?dJfF6fIpFiF/5aOnh7DaAkn+S4SUn76zRFN3EJYLHnFiZB4ioQXZ7H4TpFA2?=
 =?us-ascii?Q?3SF2+jI3rgrd+SZJ6i6tNDJkyityzYpXXtP1Pzon6PI2giLDPuRGzpjozpzz?=
 =?us-ascii?Q?hBA+EI3PBKL5f4+HymPziPZ0hoAlC86nd4l5CnKl+OwhbczCsQjXaBDLE3pm?=
 =?us-ascii?Q?B2LghPYOX0SkLtcgjGjCpLVj/HCl3Ym9vES3g3Oe3usAWuV3wRYNCdzX9Vej?=
 =?us-ascii?Q?sTv6VMejMu9dyzA7VjTWJEn5c6fUS6TjlJuoxuM4311b2poS6lm5i2QpII52?=
 =?us-ascii?Q?2WVI/Jdv5wrh9WRQ139VVhDMP5XU02EC/8stwcZzHqoels+5eD0Z+ie/H5ev?=
 =?us-ascii?Q?yinboo1X7h+Jj1NBD9WUtykogzFO5Zw=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 78761107-af23-4e23-a064-08df46f5b0d4
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 11:01:55.9644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ThKlwhOz6QRDwhgA0QIfmFlOEGuqbq5To90sd94HfzOUvlkzWttGOfWiEHXz8zPquCocC+LQYO2nBeYnTFhP1P3dLq0790TC2fHu1apQ7WM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8080
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 11:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250773
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, Nov 11 2026, "Rasmus Villemoes via openembedded-core" <rasmus.villemoes=prevas.dk@lists.openembedded.org> wrote:

> From: Rasmus Villemoes <ravi@prevas.dk>
>
> Bitbake does see that buildinfo_target depends on the value of
> ${IMAGE_BUILDINFO_VARS} itself. So adding an element to that list does
> cause do_rootfs to run again.
>
> But bitbake does not know that the value is a list of variable names
> whose values are fetched, so changing one of the mentioned variables
> does not guarantee that do_rootfs gets re-run.
>
> Fix that by adding all the ${IMAGE_BUILDINFO_VARS} as [vardeps] for
> buildinfo_target.
>
> Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 69543bcbcebef81e2797a0cf5662602876998ca4)

Hi Yoann

Please consider adding this one to the wrynose queue, it is quite
similar to 99cab65285 so I believe it should be eligible.

Thanks,
Rasmus
