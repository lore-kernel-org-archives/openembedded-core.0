Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11158.1793804824958819636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=gZacpPv4;
 spf=pass (domain: est.tech, ip: 40.107.162.59, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsEdEBtNn1ltWvaO7+U/V9yrT/Sx7ybT0aemuHtvyGCyDvImoCNTOH4RWHGqvp71Jgbt5kN4gVmzBwuK9XxAPNAm6iKOOcqRllBl7Ueh5bf/Ah310gOtQXtYUv4Vqo33cf4Ydo8WP13qICWU6ou3KsCBxTzL6hEy5bgH89ie/e2HXDlJSbEltZck0dEfkaaNj8S6HIiwqYy9d8b3M8v4UJ+6XJuwbU9eArLzkqqB2IAp+RfjY4PREb5khFAayc89ykZb5RCYMWyhjTvxG21IXu5fASNBn+scFdlq6dwOP8DsmM1z2kPdCON71CRdPPUsNRlkqYMejcaY2shCiUTZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PK8MOqKnCQfbyGcW77QX9/N3N1crNUaDzA0SWS3WoUs=;
 b=zWl5qdOptAwCTFx1k4jU/w47c14GXTAZGKFLum9V0XH96dkzgOvxcdamTazsPKbyPhp71QOuT3AckZ+E+i6qaIeIHWQhtJiFQXq20y60krGtqXbQfYTSKcBt/Rx6wdCzn/eOc4f3LyigDDgC8xHsz3tnsphSjZX+P+EHMMnVm4lVOtW9BB/KiVUZsr39lE8YmCOy1zQt+BGtTGMzvkEayfEjwmiDXxP1XDaagrY4XCjqRkzseSsJ2I3DCtEi5OHd/1wnMWTLT8pFqN+i48zdsIcAlFdAgRywoykor2wM5QQWe/uV+TwAgstsaztlM4bk3vvNAjM3iA2z81LjFSfE0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PK8MOqKnCQfbyGcW77QX9/N3N1crNUaDzA0SWS3WoUs=;
 b=gZacpPv4q7iP4rsq7YRYry8hRp0+Dil0dQnQ0UqqqfhIqFbhw728p4n2EhTvzkYNt5YMSIqTACmXAZcu0uZcEJ29ItIbrOQuxfzlnXBySMbRjnNdZM79MkL1Xzqy4a0zYnvhTC+4pWI5vTe1ta50tsBYzRF6px6GfD4peV09WNd24torhBjpvBeWEJFyHKJhr5fIeUzysa9frbZeBwJ8nbRiHnV00jMQqQ8QRCTh056tB58YgTgMe/liMiWjzOla+Ii/BH5rrN6rPpqiYrDVEROcZnWZrd4WzdRkfo0rR/5KozDOdTLLGtwNkRfyGieKSbsargepdoV9o1o/q+iB1w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2320.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 15:07:00 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 15:07:00 +0000
Message-ID: <6e736ed8-2f43-4c90-a9b8-a2b2c4d234bf@est.tech>
Date: Wed, 4 Nov 2026 16:06:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 3/3] python3: Upgrade 3.14.10 -> 3.15.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261012090030.95901-2-jaipaul.cheernam@est.tech>
 <20261102080823.31025-1-jaipaul.cheernam@est.tech>
 <20261102080823.31025-4-jaipaul.cheernam@est.tech>
 <DMLMR3WP1E5A.M59CDZB7EE06@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMLMR3WP1E5A.M59CDZB7EE06@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0012.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::17) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2320:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a1e23bc-350b-4995-de1d-08df3a8546bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|22082099003|18002099003|56012099006|261022075727099003|4143699003|11063799006|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: KPIyxhKocOVlN9Xu51eVfy6wui0Tue30ZYpztmq79Tn8dQcDyVPKzchytH+7zGraSxfLHQf0OOxaZgVZdgWaXtjmmeSTAIKVQv8vVJv+ARM9DZxPNgOxN+mmnxkMsvzpQmH2mIn/m/TREeCZQYcInmcq08X9cPasLcaXm0ndazDe4UpVr/6LOS6UT6kWYhMin3cCfCfJ+KYZW06JuKdTJp6+fk2db5HpO+IrpZ98UdxLTNNneDhFFLFJAlmf4P59o1Dr/xWWPD9Xn7eJ2NF4/WlnDzqa7T2Kc4kjryUIsFtU2HiRDF6N9eTzh2/jG6XIYH0Txq+94dFlYoQ+0DK7N2Sk3MxXSuFVDl761NqL6Sc/toOrWWkcUxW1s5Yv85VkF6vctj7arkPhIgSBz56fIbPBQkRpAUHTiiliv4aTtgn7IQ/P6e+4w+k4RdKrsZvddH+Zd60rhdfQ2P63ToWB9XP6U6HoPZyHYi/32hn1RVpg+3X2HSo55iRLlnoLHKGXzDatiPBalAjvk/XN4U01Jv4BYaIKXFcX3EdO37UFy0CdNwLsgZ8vPNelRF49Ud1/6ctnPCLC5AuMboGuUVPShufaq4p5Qidt48CXASEk55e9qE84jjWptI9hybxXAdLwqIddBEmvj32CEmcTMOmeKzQN+SeeThUFJ+IJrADXzqo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(22082099003)(18002099003)(56012099006)(261022075727099003)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjQ5SysvN2xGN2hOVlJiUlN3OHZjZWo4dEg0T3BUbWViM20vR0lQRkMycVVP?=
 =?utf-8?B?d2hjbGE1dWUwZktHQmd1SG04WUREYmY3aS8vQWx3WWtsWGVzT1VHOHc0eXBo?=
 =?utf-8?B?azJKUkpqVndBVkxaRUtaODdKNU5oS2R3cSt6bnozaGJYZUtHU3Zrd1NQS0tk?=
 =?utf-8?B?M2h4TmdJVnF1TzdGajhHVFBRcC9HOFl0WUkwMjZxNDhhUG9zL3NtTU5VUWlY?=
 =?utf-8?B?OVdyVmhxeExDRFRvYjU3aGVBWXlBSis3K041MERKTkl6VjgyUzBDWFpoa3dX?=
 =?utf-8?B?ekU1cDc1bFlCdFlCM1pROUh6MUh5Z3dkNVNmbG1MMjFvOWlEU3FuNDViYSt5?=
 =?utf-8?B?ZVp0SUQ0VnZCaUEvWHdOVmM1KzVMY0VCQzkwV056djZjYk00MG1sb0Z0Zll2?=
 =?utf-8?B?ekxoeWFNWENja3BmRmJ6ZGVpMWZqY0xqV3luZGROODYrNGpEZHorcm50c1Bq?=
 =?utf-8?B?YkprZVg0bjdUdERnMFRLTDRnRkFDcjd6aHJrbEJIdytyNERTQVh0b3haZ2Fy?=
 =?utf-8?B?U294OGwraGo4K0g1RmEzUkVPVGw5UmFOMFJvdkxldlNFT1VRQk5BNFIybURo?=
 =?utf-8?B?R3hPdS96alJOWUdpaEtQSVVyNjU4K3V0emdnalR4eWlUQW5ZajdhZEdzZGtv?=
 =?utf-8?B?K1FyY1hYQUJ6K29ETkdsR1YrREZjSGYyQ1d5U2E4SThCQnV0K1dyUUlzdFRl?=
 =?utf-8?B?b3lsZXQwRVBSNWdwejB4UStqeXV1SEZXZ3cvTG1BUDNXeW9QZFNNaWZpRXVy?=
 =?utf-8?B?YWhNSEtsbHg2SWI5c0d0RUxaaU1LV1NySlBaVHFYd1k1cCtLa2dFWjM1WWFL?=
 =?utf-8?B?ZkNXcGo0UG1PenNMOTRMQzlVUEw4MlE3U3VnSWJaNi8zbmdXOENlc1hiUzJI?=
 =?utf-8?B?ZVkranFybjdXaHVlOHpOeXZ1U01TNHZoK2d4bDNweFNHdXBLWWlleUlvbW1B?=
 =?utf-8?B?YUJrdnUwVWljZ3BNSGpDNklYOG8zQ1A3NDQyeDNBRGRXRndSWkRZd0s0Zk54?=
 =?utf-8?B?eU83WlNsMVRRdDRGa3RacEQ0YmpzSnVpSzN6L29CbHByRzFnT0xVQ0ozVGdt?=
 =?utf-8?B?eE0yQ0RQNUpycUNjREFzc2pKemRaazg1QTBnVkh0R0hTOGFvUVVRVy9COVBx?=
 =?utf-8?B?QzBjZWZPeEtxbVhxdllJenNGaFVoc3piUm9xSWRqUVlBVlBjeWs0b0VNYXdt?=
 =?utf-8?B?UlNkM2RWQ3Q3MTRZanp2SkpTSXZ2VnU4cjJ1MjFVQlJCbU1kUXFhb3ZLdWdY?=
 =?utf-8?B?MnJ1T3N5TkhhMERGR1NJTVdxUUdwQlhKUnNMS0dERFBVNmVLRmpsekRveE9M?=
 =?utf-8?B?bmVDS2I3MXl4MXgxazRIdDJQdk9pdmVyMVN4NndsN0JEMnlDMERMUHhycG9k?=
 =?utf-8?B?SzV5YW41aXB2M3p4STFhWWtrVVdteHZTUXB6TytFa2Q1d3FUNXpNRkFlZWNW?=
 =?utf-8?B?T3BZYUkvZlZlYWdVajJtaEpNUUF1aGlsTW40NWVWWEZQNUtjL01za2EzTUkr?=
 =?utf-8?B?YnVwZWt1UVd3dkpqY3VrS1hhQ01vUjRCQWVhU2pYUGdpdjZVQW1nK0kzNzJl?=
 =?utf-8?B?ZEI2S2RBNTgrcE4ySmQ2c0JrZ0FVOWlwYi9IaElxYmdnUGk2dm1DdVV4RTN2?=
 =?utf-8?B?bkNuMUZ2OTZEeEdueENYbmhoaWNUc01ZcE9ZRDN6SFNqcjlYTkttdGExcExj?=
 =?utf-8?B?LzVpMUY1Zm5lS2t6UEJPRVowVnlLKzV4QTh1eEp0K0lUQ1cydi9lT245QXRu?=
 =?utf-8?B?dVRFZnlKNXZPQXdyd3RRTmJjSVgvdkZxV3hVc0lEbHp5a0UrWFcrQ2xhUFNv?=
 =?utf-8?B?Zm5GbjhtL0tpbm13cVpLSE5GcVhUSFBHY2xBczlxdTlzN2NlR3k3SXpQN2s1?=
 =?utf-8?B?VVd4Y1Rwc3dqZkRvRUZnUkYzbEtlK3JNeDVGdklYWlpsSFh3T2lrcytHb0Vo?=
 =?utf-8?B?cWc4MEhpa1Jhekg0NFlyZ1phRGo5Mjk0Tkk2SXJwZ3A2eEVIb2xPY0xvamxI?=
 =?utf-8?B?M0dXczgzN2Nubmd2NXRqS1pxU2dkL0RjSjQxbzZ6UklxY3NJcmhXY2xuNmla?=
 =?utf-8?B?Z1ZHWENpdkYrOVdPV0lENG1nYVFQRkhnUysxTHI2TEk5WTlGZXNHK3BBNVpl?=
 =?utf-8?B?bHpDZjRHMjRscmJGdXBsQ0dyY0FWZEhudmROMENKWm1hZ3k4RTE0V21kV2E2?=
 =?utf-8?B?M2VvclFnajBKRUFHRnR2LzF0YUZ6TFczMWRQTHBNOTloajl0MVMveTFzUHVm?=
 =?utf-8?B?L2xoWmZwaklpTHk5bzh6V1UwUjFodXFtdHhvQnRBNFNpclhmbmZURnRXblQ2?=
 =?utf-8?B?bVNlN3B4Nlo0VFBOcGRFU1NTZStIQmdHY0dUaDFMOVdpR0NoMGU0Zz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1e23bc-350b-4995-de1d-08df3a8546bf
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 15:07:00.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whwx9fUEBYwem5Muew1m7i//IHxWz/WkMK+ikGEZDBPi3O3ha3f2VJcSxcoRZnWYvaRMtrpJ9qK/piXECVRImlIGR7NtYRVqGBkiekxTT10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2320
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249387


On 2026-11-03 15:03, Mathieu Dubois-Briand wrote:
> Another issue, sorry. With python3-wcwidth ptest:
>
> Failed ptests:
> {'python3-wcwidth': 'START: ptest-runner\n'
>                      '2026-11-03T11:04\n'

Hello Mathieu,

Found the reason and working on it and this time I will verify musl also 
unlike last time verified only on glibc.


Regards,

Jaipaul


