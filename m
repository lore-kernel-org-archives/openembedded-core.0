Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.131])
 by mx.groups.io with SMTP id smtpd.web10.425.1598303136156024674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 14:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=TAFWqUWI;
 spf=pass (domain: prevas.dk, ip: 40.107.6.131, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1jWfjx+hVToMv40iPItQpCslM2LpNOEeKTn3jYIWvf5xdr/Be74dmL6dsGDBnRHITldOJsTLZDIBAYzRSTdYifZqYxjvmzKVd21WsEzxDD9fiKTwbb+HGi4marToTZg+HkSJ2keaV0IbCHsiB8CteShXO1HaJq2xOe54zZCJ8Xbo87/zrvuY18yvrE/NikrQvlYGBpQelUc/C23ImdEkW9Wii7YSaVeAiZYcWfhURz7zehhKDcYWiFoKeMWVijF7n+pueoNtvuVW+KsxM4hPN1GGMc1jyWEVQHFQjqZuIG4lCOTq3HUn9LGGf12pXiUFBvUzaMMs79Wr6/LjRkXwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcxevLI6qhzqq80ufGY1fPX14QA6qi7V+XGSNP5yyOg=;
 b=alGIJzyEW6Vt8YheEf/LiLY8PAjQvaNkqQMIFs/yNhKKDJpUo6JsJxIZwpgHVBR2aQ4qfa4QhOi17X7GBQEQWunvYBoQEgaNgaGsKiuJoEpdzNBeMyjFkoHJ+ysjJHyqulDghT9chxROjcVYIi8H3b9pCMv2HHfq/UUY53+vHXSEFw0Gw+4/+qowXDTWSwJycYTWZGrNjv1k03NyceHER9puDYcQFgaqvWMB9SGrVqeLYTT1Qn1KbAwAgikD9vUStw/j5u55X5UVBMhGg+v3qGuCoWqRK0V2VTpEHyvT/ry3KeHOwzlzx72fu61jt/8B7GK6cwB0dOcbJur019hfPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcxevLI6qhzqq80ufGY1fPX14QA6qi7V+XGSNP5yyOg=;
 b=TAFWqUWIAtOWaLjCqfK88OTvt/XNUvEe7crjmi4uP33NZwLno/Oj+wsX9Cuk098N3OrBKWNX+WYnthWCyRfBz1oyuUS9JH4OmSdUitRkYJT8gxbEyXdapEW1vBqt+qh/S7ey/8I8u/sS5+2SHA2A+vjXtHhH2CqKCZvAO+I37eM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:3f::10)
 by AM4PR1001MB1249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:200:98::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 21:05:33 +0000
Received: from AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec]) by AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3cfb:a3e6:dfc0:37ec%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 21:05:33 +0000
Subject: Re: [OE-core] cleansstate
To: richard.purdie@linuxfoundation.org, Tom King <ka6sox@gmail.com>
Cc: Joe Slater <joe.slater@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
 <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
 <CAHQecY4KmaTb6W_r88fRaqTVCsGDmiQMqk5pZvckAraHBLu+_A@mail.gmail.com>
 <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <fb0fa58a-cf84-9a5f-5b5e-489bd154b257@prevas.dk>
Date: Mon, 24 Aug 2020 23:05:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4e07ca8b282abc62ede7969bc7c7dd6bd34014fb.camel@linuxfoundation.org>
X-ClientProxiedBy: AM6P193CA0082.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::23) To AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:3f::10)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.112.31) by AM6P193CA0082.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Mon, 24 Aug 2020 21:05:33 +0000
X-Originating-IP: [5.186.112.31]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed678daa-859e-4dd1-d6d9-08d8487170af
X-MS-TrafficTypeDiagnostic: AM4PR1001MB1249:
X-Microsoft-Antispam-PRVS: 
	<AM4PR1001MB12491465FBC90FF85E49852B93560@AM4PR1001MB1249.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UFDyYMd4/+6Uq6zSrY1wNuzFIG1ZIAB6DJB+DLqEWvHY8gphRX1knXIKNb+3vfEGfRwReTT5p/Bcqb2+eaiUIP128xbcj2L9HRDK4ISGxrfyZPJ+aTFVYQJvlCMkEZ/M/doRTtkxPHAVcvVErvEKN89vUqvpqVGY9FVxXgF4wTqkkASHxfTYwOmiBPSgxhVA1iBVRxdMTarWwkarTijCIeT10owzYUiAcagm3IJzY/sH1Uk7bVxPrqZnAdvbQXUwDGmiXMTrjvhA4twr52hE2+8ldrTMRBirHQBCOpZXNycuy01UeVt2cURuBrKFULk9+iTIrx+l1LacVCKwfuj4zSiTizsxQLuMbZb0j66bl3JV/E2W28DLeKB4p8KdrK9vkil7eZz40HA+TsBThIRdTi9glpekPB9sAwA22IntN04gE990RSYjn3/QNvdbJWpDySsXIp30PXBOwb4YrLzckQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(16526019)(6486002)(966005)(4326008)(52116002)(86362001)(2616005)(478600001)(31686004)(6916009)(186003)(26005)(36756003)(5660300002)(956004)(66946007)(66556008)(44832011)(8936002)(316002)(31696002)(8976002)(16576012)(54906003)(8676002)(2906002)(66476007)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	rrzOsyXBSjxX/ncwJjMDO73GbpajiaYyg20AQRKDd488VQu5wRy2FFRZ6qoFG4elsDMzbSOhPkx4G2IkLvWqJzyPbHcphnB3rOxe3LrFzcLtVS3/vq7DlMB6blkyOj0R20xyUikK92mbYMDv1UdOUAxT4Rpa3B40y1Ddkhcaazfbm4iF4cwOph3fsHL0CeU0gIi3B2dEjUkJb3hOgAv7K+5001h81mRCbZXANDcbZ8wHlCK/m61GNyvf8/yt4ZRdCCq5SrRDa1k1Mo8QSbdVqqKulIxRE8QJgUoEbnK8Qy5+CEC02tNT0SFBFoTVRHmDGqtcsVJ+4Dlq1kGn3wd0ED1+G3s3SwRah98yBsazjMSiOIa1/S5PK/+5+a4BaG2lHnciwCsnLtIDKhjd3P/v5wnNvSgruwwu/tiyy0C0gWBfrsfz97nnq6kJjA0qk1uIl/L/iwHuWvVcMULBr3Z3e987TwFsagPUvp/dt0TB2fuE8G3k3RJgj47Hqub1rAjJyIehnHv0aJh7diiEYeN4YUibsYhh+Gxo3Rfw6FDn0+wtHAk54rGVWabJwlFAZR7TXm1D/cxHo5InHa7O7HWWeOXJHDecaUakbedVI02t0gg8OtzpfHLTfskpUKhuLhZCGaIBN5BKuc4n1hnqGdqTMw==
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ed678daa-859e-4dd1-d6d9-08d8487170af
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB1874.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2020 21:05:33.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NLefmFSAkXo9MdGlpgkHGY59IQt3CYbroguuL6vZEOwdal9VnDZllQtkvYFGlKzZHZsINVcAMSMWuy9ON0QgIgfZDDVFhyPea9aG4uDvRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR1001MB1249
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/08/2020 09.27, Richard Purdie via lists.openembedded.org wrote:
> On Fri, 2020-08-21 at 17:32 -0700, Tom King wrote:
>> What would be a use case for cleanstate?
> 
> I never really wanted to add it at all. There is/was some case for
> wanting to remove sstate objects and ensure something really does
> rebuild from source. When sstate was new and had more issues, people
> really wanted it and I was pushed into having it exist.
> 
> I understand why people want it although it should never really need to
> be used.

Well, except when you discover that your sstate is effectively
corrupted/polluted by objects that happen to have the same hashes as
those computed from current recipes, but the build artifacts
would/should be different. Such as when using a file://foo/* glob
pattern in SRC_URI.

Richard, I'm still hoping you'd respond in the
https://lists.openembedded.org/g/openembedded-core/topic/75235594
thread. As I see it, half-way supporting glob patterns in file:// URIs
is a giant footgun.

Rasmus
