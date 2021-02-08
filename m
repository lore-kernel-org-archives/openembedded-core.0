Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.33])
 by mx.groups.io with SMTP id smtpd.web08.93.1612806954229111912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 09:55:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=oGaSkthw;
 spf=pass (domain: outlook.com, ip: 40.92.64.33, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLlBbpgBVQXRRzUC2ODzH2fuyrO7RHtB9uH6kJvn/wynTA5jcIoE10QD+3wWiSjevWywP1TgpZx+PaO+VrmNMg+bQPvzutvYV5bRXp9mQlbfWfQ/gdxPowCkoh90v83lLPf/8QihuW3/5KwKLm/FV/3pMRkhhyAOb5AiPjbwSwk0LNITkXLL0lc3SoYZsQA9yxpnKGatd0ujelVTMH/sgOTGrEGNbQQwXWgt5P/SIqi+F57/hnY9DFUS8X4VISwEKzozCnRo/uUchFAH8KTUCT6flXNTy5n5hJVYRihLydyAmfC6tYfW5VBVOnJrE1aE/bJFfGsZBXYFzSgwiV3Pjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smBes4CzBAAvpdvznVIByY3FITrnbYDW8DwZVvbwtCw=;
 b=fBmOhY+cVZd9i2NKxfvaMeUhTJzAUiwKr7Bs/SBLQZ5x1W9eapQF6TO7+CLr2mA/VN/DPDja4yvxYdyLZmse7B5GnDStswUxl+zgAzinPuLqbauwLbypAjPMhVyPvueVgFSZ0Q+ksFU3qOAfYF9OtDof1W/yyVcS5sNnWww9sZFiIOSpHHc+18gURR1g0Liamdu0bE3h3yWovzTFM6DGMZI/Xl/vEZGk1t8jBoWRaeCu3x6nY6o47/1qHyN7PChwgZuNMpxJilWLcK9nuVMZS9iS+BKxVgTc1OKZwKy/myAF1xD+i4JrGUSLUF/lt/VP4dKwftYEXuw0HLpef2BOdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smBes4CzBAAvpdvznVIByY3FITrnbYDW8DwZVvbwtCw=;
 b=oGaSkthwrF5h2LNbdeWuIHgPsUJ+QeykY+fTQ+Sbjn6tXMZCIDf1+5QzVGZJ5A11szmXoxWDm0mLaWm0WOq4aqXd6nH5uI2LklY15sTBbL0gUMBS3JGPcDRgr6fcGkGGRvCNeUKgT+/GhdvDz2QTs5iF15TvmpkfT4jZpSYCI7AJ1xaKnPX27tc44sLlS3Tjy1pbFgEoyGSeaJDi47ZGXDl0Gq0TLfASw2IswtG5UEFZZB/k+xPKUyfPo455wAQix7ig6BYZjK+54fRGivNEgrRx/tUwap1cWKQi+T+e7q/4u5ZJmBrNXy6+7J5hrvDaMUZNE/vaK4y40b3phUOfoA==
Received: from HE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e18::47) by
 HE1EUR01HT217.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e18::149)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Mon, 8 Feb
 2021 17:55:52 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:7e18::50) by HE1EUR01FT041.mail.protection.outlook.com
 (2a01:111:e400:7e18::259) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Mon, 8 Feb 2021 17:55:52 +0000
X-IncomingTopHeaderMarker: 
 OriginalChecksum:D59D2D8C5A1A244DA9EFB6651C07453C7E4FDD1F00122EA9A5255E3A18972E2A;UpperCasedChecksum:8F8F0F057F8B6E06B773AC3CCF58F1787EA2E82FB645B0E1799DE42C1D03A69B;SizeAsReceived:8680;Count:47
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::5d88:562c:471c:9560%6]) with mapi id 15.20.3805.038; Mon, 8 Feb 2021
 17:55:52 +0000
Subject: Re: [OE-core] [meta][PATCH] npm.bbclass: avoid building target nodejs for native npm recipes
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
References: <20210208175226.4081-1-yoann.congal@smile.fr>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB464216503C5A3768E2779FF6A88F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Mon, 8 Feb 2021 18:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210208175226.4081-1-yoann.congal@smile.fr>
X-TMN: [QjKYUaTUSjAFN9rNFd4IPRZ2/cgzdOiY]
X-ClientProxiedBy: AM6P191CA0062.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::39) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: 
 <4b009438-7a90-1b95-e9fb-c49b557126f8@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.90.163) by AM6P191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:7f::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Mon, 8 Feb 2021 17:55:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b4b10e45-d37e-4caa-2cb0-08d8cc5ac656
X-MS-TrafficTypeDiagnostic: HE1EUR01HT217:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/mqtnIpj5BYQ+u0OdyHfCYE9OZ+Y5/sFCkv86Igf8qy+tr54dCtKrJMjh9S7u/G/NtYumLkFtNO8ta/aCRNtF5s4Bq5KGv6kvGVcnEA0H0JUnPhQFZ+6ZQ2kwJ2il6TCFJDnjalA+fvkuqQSh8W1Wg3ZwhWTf3AjceYquR4DIjNP46U5bFihLtjhfho0j2k/9q+sxWSer+MDFlVvykx6pHvJO/A3N9HfbupqtZn08Y0NVJr8FMAeRYKhDmHjpjl+Cdz21Q8GtVlEtVp62MC7c2q0+S5EHj4XqLaocf/+DmEFV0yH0EoBxpK+cveMQ/wnHvl1cbkWKDhj4fxVh13Duh33WDlYbGh8wZME1A/X7RGteT3+f43GnfA13hYsaaGD+tuc3jzUDVuVQceUYvwSqED2xfKo+iR1uOA17Sq9IrI=
X-MS-Exchange-AntiSpam-MessageData: 
	LP26XyjeRC8u09HZTo7uBs4sE4ZUgrf+TB9kMqrh8Qme1Ji8yj/wYhI21rdbj/eRm6c3sZ2OgHl7elhlIszw9c/8czIzXKjwcp534HbojLMjJ5HohVrKvRgnMt5bKYjtBFrcNm1l3ZjqdNWATCCjHw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b10e45-d37e-4caa-2cb0-08d8cc5ac656
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 17:55:52.1386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT041.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1EUR01HT217
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 08.02.21 18:52, Yoann Congal wrote:
> The current recipe unconditionally RDEPENDS on nodejs (the target one).
> When building on the "-native recipe" of "BBCLASSEXTEND native" recipe,
> the target nodejs is unnecessarily built.
> 
> This patch fixes this by only RDEPENDS on nodejs when building for the target.
> 
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>   meta/classes/npm.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index 79f55febcc..61d16cf23d 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -20,7 +20,7 @@
>   inherit python3native
>   
>   DEPENDS_prepend = "nodejs-native "
> -RDEPENDS_${PN}_prepend = "nodejs "
> +RDEPENDS_${PN}_class-target_prepend += "nodejs"

This doesn't look right. Either

RDEPENDS_${PN}_class-target_prepend = "nodejs "
  or
RDEPENDS_${PN}_class-target += "nodejs"

but not both. plus prepend does require a trailing blank iirc

>   
>   NPM_INSTALL_DEV ?= "0"
>   
> 
> 
> 
> 
> 
