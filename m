Received: from EUR02-VE1-obe.outbound.protection.outlook.com (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.58])
 by mx.groups.io with SMTP id smtpd.web11.5336.1612511365183682853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:49:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topicbv.onmicrosoft.com header.s=selector2-topicbv-onmicrosoft-com header.b=t+OH69+s;
 spf=pass (domain: topicproducts.com, ip: 40.107.2.58, mailfrom: mike.looijmans@topicproducts.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8qvNZ+XV657b7aJgV7T1c/AWCIjYzruV6AKjV0kU1E=;
 b=t+OH69+s8K75h7V49i/gdMP6CGTsXULp9LZpKsZ6a+MOWYlOS4Bo0BiXZtui3rv/IlItSxfrq+r0DkR+aRHqGXdkpX5BTALPgA4GSc4uZRny0f/kagK+XI8y5Ou62uSa+RP8CD9NBsXZn5/aV0HhcWYBvjTAHWRvs8d+eFF7qHY=
Received: from AM5PR0701CA0053.eurprd07.prod.outlook.com (2603:10a6:203:2::15)
 by DB7PR04MB4282.eurprd04.prod.outlook.com (2603:10a6:5:19::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Fri, 5 Feb
 2021 07:49:21 +0000
Received: from VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:203:2:cafe::c4) by AM5PR0701CA0053.outlook.office365.com
 (2603:10a6:203:2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Fri, 5 Feb 2021 07:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.68.112.65)
 smtp.mailfrom=topicproducts.com; lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
 designates 40.68.112.65 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.68.112.65; helo=westeu12-emailsignatures-cloud.codetwo.com;
Received: from westeu12-emailsignatures-cloud.codetwo.com (40.68.112.65) by
 VE1EUR01FT063.mail.protection.outlook.com (10.152.2.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 5 Feb 2021 07:49:21 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (104.47.0.57) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 05 Feb 2021 07:49:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWeP3rCOvfTwO1lCeRNJYr9dytbN4tp8+THFlm9d3Bb5wfOY23jlqVnZ8VIfBZSjQ3hNl5pNHsnw4o9zIx5PIXFMt7k+gsH0NtXWBV0rlZE89QjAxYD8klIzP7Sa1aO1lcQi2vng2MYpCynXHAQb7i0reu9iHSjRE6mC/EmencnlTJZN2cr+xUtET/NfuaZ9AFaFbY4LkS0n7xt8xnpEaGHNEA9JAOxS8TeZsCYRD4wtQ5/R1H/Hp5V6ozHxjShxy1Tbd97I+J3YnTcmN93hG2aQyOFwsAoVn5hhnycHD/FvgNmR0xJlTUvGRY0EeyVpcj9jXDbtg2KxHt19WzL7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atxncfnIsuFySMtKEJZGTzWZofe0SRGdWCDd1/djGvI=;
 b=lN2BHj5PvXcC/xTPLyX1WCug0xb9WfuM6r4ucP/WPPI45ElAygd1agiPf7PlGswJyN6NaqqXCIJdzF54AHu48iMME/lmOgLXhAW/SbAeHDFtbvIfZq76/pAlln92CEYnxmdTC76Y7L7PeawIEsZRLGGXAYaE+RZUi3RcrRNctSg1VmFmn8FOd8PgMj3WFACCuYkXeuIz1HgtqrkwIYz/km+X831vuTfXRWDZThdpuGUpi8n9SociuBXq3l/Q9pBlu3Q/i80w9oBUUSFG4DUUoZPXzAI23bfDDZyRqOQHTdCpgUKKjTNiUsgtV0Z92OFiUCDTsaC+C6IDtTXClHRrPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topicproducts.com; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=topic.nl;
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com (2603:10a6:10:10f::26)
 by DB8PR04MB7083.eurprd04.prod.outlook.com (2603:10a6:10:121::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 07:49:17 +0000
Received: from DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2]) by DB8PR04MB6523.eurprd04.prod.outlook.com
 ([fe80::792a:b2ef:ed50:a1a2%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 07:49:17 +0000
Subject: Re: [OE-core] GCC crashes on aarch64 since gatesgarth
To: openembedded-core@lists.openembedded.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.443c6779-935d-4b0c-bd2a-e7ccda1d0c4a@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1d651819-d3eb-4e73-bb7d-d97ad0bed5fe@emailsignatures365.codetwo.com>
 <165E1F647C435468.32571@lists.openembedded.org>
From: "Mike Looijmans" <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <cf285d04-d8e1-e3a2-25de-9c3f02ad0678@topic.nl>
Date: Fri, 5 Feb 2021 08:49:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <165E1F647C435468.32571@lists.openembedded.org>
X-Originating-IP: [83.128.90.119]
X-ClientProxiedBy: AM0PR05CA0096.eurprd05.prod.outlook.com
 (2603:10a6:208:136::36) To DB8PR04MB6523.eurprd04.prod.outlook.com
 (2603:10a6:10:10f::26)
Return-Path: mike.looijmans@topicproducts.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by AM0PR05CA0096.eurprd05.prod.outlook.com (2603:10a6:208:136::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.21 via Frontend Transport; Fri, 5 Feb 2021 07:49:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0469b3b2-bd3a-4826-5dee-08d8c9aa8cad
X-MS-TrafficTypeDiagnostic: DB8PR04MB7083:|DB7PR04MB4282:
X-Microsoft-Antispam-PRVS: 
	<DB7PR04MB42824C035B3044BA2A406C6896B29@DB7PR04MB4282.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 x6Q9ncGBnlOXmtwGIQdJnSTKp1ZaAKHfwqtz5myrizwhUXKXT2jj0WAsJcDU4ZIyubYZABOgeCqtIwUFnOiFnMMr64PY6lkheBIOAYWjiborQniiYUkWeQ+yKZhp0wDgEAgh2cQHc7kIrMikuxcx1dwTXrkkcQ30c2rtv/rQWp163YBS172rpFNE7VGVk7ARMamORLmIjd4Jd3hGOEZ4BSOCX9USq1pI2cc/d0N929PKADqvrXF8FpdxGXN3W0slzTR4PJyfBHzd9INU5YEA+DrC3t6612xzC+1TlezWU23dO8wdfN9H0W/TkUoLiSxOc/Ct2PlMr+cID4D4uzx1nARo+rLvnEnrGTotLAInXmjow2qH0mhSo7LcdoZ8AQ45fiE7uz50BRRs/aPXTQrp4RXvSEa7j9xpcS1d6alEtp6LDdPCEhIRgI63digVtgFASdBDkoavpBS+trfBdO2Vkbo7HxDrfmi59Jg1c6bTis6HHSA3trwdeFghSXmhNQ+r04gMc76EugwWnsfmQD6V8cQcYuviqcerbR9/pU9LNWwDuc1KIVN6FiVtKXzjN6dEbdMz6V6FU236iiUZ0wOPDqcfzoit+dVj65jSvYJzByI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(44832011)(6916009)(2616005)(508600001)(66476007)(42882007)(186003)(66556008)(83380400001)(66946007)(16576012)(956004)(36756003)(16526019)(26005)(8936002)(31686004)(36916002)(52116002)(53546011)(8676002)(31696002)(5660300002)(83170400001)(2906002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aG1GRDFrNFJQb1BRYVkxNEJFQ2NVTUVBRU5TUWc5SzdKci9MWWRDQjU4aHkv?=
 =?utf-8?B?R29Cc3dJTnhucFlRampVdnFHME55QUJCUFd3MEhkaHBraG5wRzY5WUg3ZXE5?=
 =?utf-8?B?SncveUdHTGdnd0d0SjFIKy9xbUlXOXZwZFFMUjdDZ3JUdS9YekJFUzk3NUdv?=
 =?utf-8?B?MTkvcjlkcm4zWktjVVVyR0FQd0QrUWVIVFU5cUVvc2lHeHJJOEN2L0pEbEl0?=
 =?utf-8?B?VmtUL2ZnK0RGa3NSOUp0Lzh5ak9pa1RjK3pKZ0hjaG12QWVEcWhTU2VBZk1K?=
 =?utf-8?B?cXZyVE9acjErOXFXN3hqYjhTamhGNDhTZ3hkRE9sRkt4WVo1T0VrSVRKbm12?=
 =?utf-8?B?Q2Fua2FPNzZVdmxTa0hLUE1yNk1ha0YrMWZicWczUStCQnk1OU5qV3pNRHRN?=
 =?utf-8?B?cnNVZ1RpUWxNTlk4bzc1MlNuM0lvRWs0M2s3UWtoQnRJYXhhUFQ2V3lWTkdS?=
 =?utf-8?B?cThMekQvYjRvckdBZHhibzR2d2VBUlpnL3FnNFkyTHRtMUFvMkRKZXV3NTIx?=
 =?utf-8?B?dmUyWUdOUlhSL0UzbXIyLzRoai85YTBoaVJkYnZUNWpwOTBHUE9lRXNKcTBC?=
 =?utf-8?B?WkRTYmQxTXVZcy9HNXEva0FLR2JTTnMzOUQ3WmJ1Z2hidDhsNGRsZXE2TEho?=
 =?utf-8?B?Z2ZvekptTTlBN0FOUXdFdjdmMlVnZ2pEaHRTYzZqaFJnSi9LdllDM3NGT3I3?=
 =?utf-8?B?YkdlSnB1YU9EcjNtS0NuR2hJRkRNRmRKVXZEWnlEdCtQc09RdWNwS1Aybndq?=
 =?utf-8?B?bldMc0ltNkZ6Y3pkS0ZIb0tFMXhGeWtKd3VmYnFzL0J6TnJ5SUNsL21DemFS?=
 =?utf-8?B?ckRTSlhBQVVJNWR5Y1N6cTNKb1JpQ3pacEo1VTlFOVJKZXcweWg4b3lSUEVD?=
 =?utf-8?B?WlUxekQyaUdZbzB6NFk0S3h4akhPTzFFZEFyNW04MjFTM1R6bHN2T1hKQTg1?=
 =?utf-8?B?QnBjVFF6dnA4d3JPQkthVVBsS08vWU9GbEhROUUvUm1qbzBheU9CeVRKdzQx?=
 =?utf-8?B?cndjbS9SSWxGZ0c0SkhjaElwRnM5WWdXc2RwZ21wdWJ1TUc3eTNBSDJWVEtu?=
 =?utf-8?B?TStXVXBvU0xhRTdWNmx4Sk40dmhSZTh2MmRnNTFEWG9Ga1gxWGJiOFJoMTdN?=
 =?utf-8?B?OXY4ZkU5RDZEOGJoV3JJZVE4ZDVaSUFlbkFVd1d6ZVlCYVM5WUZOSE5PMThN?=
 =?utf-8?B?NmZpQ2lUYWZuRXc0RzVaY1o2TmlZTENNdXlvQUFWS3hLSjI0SkFWTWhySmlw?=
 =?utf-8?B?YlZXZGlWRVNDaDdQS1Uyb01Pc0JxWUVWbUpXdFNwdTBxSXhXUlNkQ1Y5SzdX?=
 =?utf-8?B?L2plYzNnaEQ1L3VhU21jSkdTUVM5YXFEalQxanMwNjNvME5VODBaRWVlbUdn?=
 =?utf-8?B?WW8xT2I4V01OaEdEVm5BRFJIWGhGaDBTeGFuZkFId0d5WHhEMjFSUnFmZlMz?=
 =?utf-8?B?U1VjYzVuVE9UaXI1ekUyd2J0L2VsWFhFNkFtVlViM1E2dzdhUTd2a04yWU52?=
 =?utf-8?B?L3lWakVyVU9lcldpUHlVaS85M2JxRmwwc05hWlBxbUdaNWp4WlpKZm9EVUhW?=
 =?utf-8?B?SzBveE52Nm8xNVdzZUtiRjZxMy9LSWNGK3ZhejBZaVc4cS9JczZFTzc2Q3Bi?=
 =?utf-8?B?bWQva1FCRjNxb3FmZThXa3VLaXFZcjA1Vm5IeGlxWTkzclFPcW5jamFxbHJq?=
 =?utf-8?B?a0syNUwrU1RlamxDQ1dpSWdaMEdoVDd2bHVDaUdpR0pyUEZZci9YeDNHK2RJ?=
 =?utf-8?Q?IxYEhAsLm9dd4BetrUC1aNcPgjLrDlPJ6db9HSe?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7083
X-CodeTwo-MessageID: e87b8564-40f0-49c5-a81e-7a4aa8b75765.20210205074919@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	44389f38-1a2e-4793-7d35-08d8c9aa8a40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kw66XIl91sk/Yf2gt2OBbHeiqgsw/cd8VruWkInNceQV4tgXGkXSmY7eN28ruxt62xyvfPoytqF5WBM9cGHqSs5L07PStMOTww+QuTS4mc/egeZXOjNVkge3tgj3pNcsC6wrqRde3d0lvGSHNyiEtUPp5DxaO+HztUl7Ms+iENkkUFrExCV3/qzwDwWD76nDXx66vPeT/q5cyKILGW2eq/rA8iG0wCH8Z0qEbDMfNeQRK1lmKuLiYTk3CK+XuwXYxs+6vqyyejtaBeIOvKuqm/8cZ+mH9FWNEPbTjCf3jUz2w7iK9oZ4a9ccG4dN4HTdI+WeP7I5uPfjh+CowjTiCST2UloxE5/jel6i+NGuBVEG26+15UR8x8HMg+OO34l5MuwkO6yW2Q4O/MO0Bbh5QDE2v0R6R/Yy80h2s4pktN+ExtSdw+jrwIDcLjWhHPaGRXY02EefbAksVRFOHSsieYZKaWUyRf+orjy8EotK8+DRZ6UKmKJHk/vTL1wOClzLrdb5ml+M7JEb0yRCUw/PUMNdNMEHmwYMNEoW6hykpx9pV/MogmEbeT13ZZgFAzHoeKX0y9WGLW/okDG6YDy9b8LgbzdpIF2GbttVtMZq68vTSeoFaLPNuNaB2AyVuTxDbpZXj7x8cAAKIOipIp+NbMC+npmmPO9VuZ491m1kLtrlqnC4ZynEHDvSGF+ocTE2CeMETRSHNnytw96KF4wJBbA1sgfTzH8xvX+A3esJNmRqndnTyIBtF0L/giN5AErbXkWeEezQA3MsAXrphUBpfA==
X-Forefront-Antispam-Report: 
	CIP:40.68.112.65;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(346002)(36840700001)(46966006)(356005)(7636003)(83170400001)(16526019)(82310400003)(6486002)(6916009)(36756003)(47076005)(15974865002)(83380400001)(8936002)(186003)(8676002)(53546011)(26005)(336012)(956004)(7596003)(508600001)(36916002)(31696002)(5660300002)(42882007)(36860700001)(44832011)(31686004)(70206006)(2906002)(2616005)(16576012)(70586007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:49:21.3601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0469b3b2-bd3a-4826-5dee-08d8c9aa8cad
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.68.112.65];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT063.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4282
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

I've been doing quite some tests and things last week, my conclusion so=20
far is that the latest gcc seems to trigger a bug particular to this=20
CPU. Maybe even this particular batch.

Hours of testing found no issues with RAM.

I've also done huge amounts of builds with zeus, no problems.

Then googling for "illegal instruction gcc ryzen 1700" reveals quite a=20
few threads on something that sounds suspiciously similar. Though it=20
makes me wonder why I never encountered it before, since these are all=20
many years old. I did try a bunch of the suggestions done there, but so=20
far no luck.



Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topicproducts.com=0A=
W: www.topicproducts.com=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 27-01-2021 16:10, Mike Looijmans via lists.openembedded.org wrote:
> When doing large builds, the GCC compiler tends to crash on random=20
> spots in the code. There are a few common denominators though.
>
> It only happens when compiling for aarch64 (cortex-A53), not for=20
> 32-bit arm (cortex-A9)
>
> It's random and usually happens on "big" sets like kernel, openssl,=20
> boost, u-boot etc.
>
> It always reports "during GIMPLE pass: ealias" in the error, for example:
>
> | during GIMPLE pass: ealias
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c: In function 'do_x509_check':
> | ../openssl-1.1.1i/crypto/x509v3/v3_utl.c:1239:1: internal compiler=20
> error: Illegal instruction
> | 1239 | }
>
> Compiling the same thing again usually goes fine.
>
> I've never experienced this with the zeus and older branches of OE.
>
>
> I've already tried upgrading to the latest gatesgarth status, and=20
> cleaning out everything and start from scratch. I've also run "mprime"=20
> test on my machine (over one hour) just to be confident that the=20
> system itself is really okay.
>
>
> Ideas to diagnose, fix or reliably reprodruce are more than welcome.=20

--=20
Mike Looijmans

