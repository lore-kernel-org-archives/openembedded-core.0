Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.94])
 by mx.groups.io with SMTP id smtpd.web10.11005.1600430040794534295
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 04:54:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sigmatek.at header.s=selector2 header.b=dIdGjOAO;
 spf=pass (domain: sigmatek.at, ip: 40.107.6.94, mailfrom: christian.perkonig@sigmatek.at)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSgZZlijWJ+9JfOSAkv+lRXJRRp0bBEb5H0GMRcfnTnOEHG166PCuGEGwxg7dOiAi6M8+EiWpZR9w/ZoRue6bCZ5YWAvBAIhjKtjwY8iYULJVamA0YKNq1wOjp9Gj0X/5G4Ufwa37cERMRHq2ZjX76+SF8Md6Mp6yrEE7lf2RkXydF+0qdIKMcTQSOdaf1P4iDRYu67RDx/seV1ryYd1aUDnplwJw1BRWQETq8UIVIinjEMmlBgUPNC8fxAhYH+cUuOPafns6ZEf/UH1N78dL/1aO6sGG2dMcFj/aHYq3dW/jZpT9Z5yFa1d339LY/FoX+NTRRSKlhCaMT29G4Z49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns1ZcmIA1CVxRfNx3GnYy/AlMN3OmxDQvJuY0TvXft0=;
 b=JH9AvYBqbcXDS9HpMsR3iOqSoK/ClB7IP4BHpnC5rF0UxYoWQjKukE8/sIuXTuxyg2tN/N3TfRUbKnAblsl16WRQcDl7NxlEJi1yrZ0cASlcLOJ8LD54qUhyp50Xzk67xrJy5Qnjvt36LDt2WRVmbcPS/6czLRxvHWEi6HL22bc24bbv5OsaE2IVcBIspR3aEUN73msXNCfQcgmX0VHTh9EWrXcQw0PsVewOSXrNIPmP4J4NiIl7PPQ2x7xzEI5MNlSsuinW30jGv6Z9elQeV0+1CGhVKb5wTLDUs5eIWzS7hmvRTQfC0JL+7pH3S++wYjWc0DqKVcr3qTbGigs6dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sigmatek.at; dmarc=pass action=none header.from=sigmatek.at;
 dkim=pass header.d=sigmatek.at; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigmatek.at;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ns1ZcmIA1CVxRfNx3GnYy/AlMN3OmxDQvJuY0TvXft0=;
 b=dIdGjOAOurVhMuCFLlmYdje4iLsyIVt5oYgL0LoGnnjDLXj6geRqFUU6AYTJqp3jyVTN0hp4sP9UUYe9PZNYC1BrMNLULQUStaQW+l/qOP6II9/NYiurvIUO938j8Xy6f6CoE/qvdnaVnxJ8IIXAEmAYBIx6vBVHRrTFV5SPXDU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=sigmatek.at;
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com (2603:10a6:208:d4::14)
 by AM0PR08MB3252.eurprd08.prod.outlook.com (2603:10a6:208:5e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Fri, 18 Sep
 2020 11:53:58 +0000
Received: from AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072]) by AM0PR08MB3443.eurprd08.prod.outlook.com
 ([fe80::2427:aa74:d67d:7072%5]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 11:53:58 +0000
Subject: Re: [OE-core] [PATCH 1/2] meson: remove shell wrapper for meson
To: Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200918095004.34894-1-christian.perkonig@sigmatek.at>
 <CAAnfSTuFBJ_-jKqkxzmDi-tpW+pVCvsZPGScxWqScJ7O6oqWVw@mail.gmail.com>
From: "Christian Perkonig" <christian.perkonig@sigmatek.at>
Message-ID: <58340a4b-ee68-1923-114e-e28d7bfef422@sigmatek.at>
Date: Fri, 18 Sep 2020 13:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAAnfSTuFBJ_-jKqkxzmDi-tpW+pVCvsZPGScxWqScJ7O6oqWVw@mail.gmail.com>
X-ClientProxiedBy: VE1PR08CA0036.eurprd08.prod.outlook.com
 (2603:10a6:803:104::49) To AM0PR08MB3443.eurprd08.prod.outlook.com
 (2603:10a6:208:d4::14)
Return-Path: christian.perkonig@sigmatek.at
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.53] (217.175.200.226) by VE1PR08CA0036.eurprd08.prod.outlook.com (2603:10a6:803:104::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14 via Frontend Transport; Fri, 18 Sep 2020 11:53:57 +0000
X-Originating-IP: [217.175.200.226]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5afb502-5caf-4b38-7b31-08d85bc98698
X-MS-TrafficTypeDiagnostic: AM0PR08MB3252:
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB32526FD615AC539401A0819B963F0@AM0PR08MB3252.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zAJK8iT2amPaXEHer1hTDf0HRgzNZJ4I0Qu2bRqD0J+DJoA1U6yqsO9p6iQonar+wkaMDJeDxlOXKYDei0resk16PedLXGdl9neJDN0V68BCHdl96cwCnfh81GdySO+yogFVc3GO54SHC55F6gMnC/nqHwpMgJ6yX3YHq7NZWcBxHY1EFFztO9NhI3V9ynHEy2sHvOSbNl86fy73cl4ysHGkT0mVRQWcq3PzOuemZUhr2SNJaxO/FSNE3DzZ4twyHUr48pdDENvFalSRHQ2IxubtzAfOrlQDw3SSuR7EM22iXvYY/mn8pH09/NCv0V2uCnI3LgRRrA+GoFrkFSg6gmBFQTBlsGGzVSjl+N1dHT480nk/o874z2y5YspAdkGjqOpKPrSnGXTK7ZjpxjfpvEGOAZnQRq7dm1GaDseGz2j6T+To10SaY66yLKWMxHdY
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3443.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39840400004)(376002)(346002)(31696002)(86362001)(2906002)(16526019)(26005)(186003)(5660300002)(8936002)(478600001)(6486002)(6916009)(956004)(4744005)(36756003)(66556008)(66476007)(66946007)(31686004)(4326008)(52116002)(316002)(16576012)(53546011)(2616005)(44832011)(8676002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	4uGOjVQucXsktAIQLfO9ZkawJs4FzaPSIdSVaRvnFMtEVn6mMX++S0mt8T0CCUEaApsCrmVy69vrwicyE4P72dB19znecMyJOeMJhYNhriIIf6Bc4KU2+teowKzqWANHtAlOuBlB5NHTLob7W19U7GaxzXjm173gtSfVDpuVgytklOas0SHL381vjj5ix0kw8oVfso3JLGHtwv9oFEr8MHpg6TXLcc81c0xhFckU8qD9Id7h7kcglQeXh096Td9M2HH8MPZ3Uj95/FV19Os0rYaxdHl6uzza7nKVGlb4BmIcrRX3Brv7VYpcC8AtfVi1mUEctVO+Rj/Jsit88BLzK4eUvM4ceqG5N9XVGeD81FMPFB+ARnamHPJlxDHPztUmRtw+A8AxJXkDOXfF+HeQ4zBBP6zMn2bD3Jsc1oYh1uQ03Ux8UWSTBP0/DGFCmypEbDv87Z1FH+X134Nq+6EiioAQD63m2MF61TJN5Q6Hep49hOxvnzcofvhDsQxAzbIRNc/pJXNadul1g98JWeh0XZdG23EhE05Ftt/8wXyRTumW5z5PLSozNsgPfkyY+FeYpShPl2EnzLHlMM+OiJ4zXvzeHxUJs2jUwS5wbSQHsGtKBykM8fU8FNoZryvRlZbQz/ul4v9xgbo8VaVau/1N1A==
X-OriginatorOrg: sigmatek.at
X-MS-Exchange-CrossTenant-Network-Message-Id: c5afb502-5caf-4b38-7b31-08d85bc98698
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3443.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2020 11:53:58.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bcb1d87a-d2bc-486e-a62b-9ac9c746bc1b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JYpdwpkV2bnxzQUgTCI4HCbicrptM0IgDA7QKovB7vkBV3yza9K8ly/3Fbj7FYbYzDNXPVCxttS7Gx3vIXE2xprm+D6Lkz7qkyMLqUqxm6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3252
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 18.09.20 12:32, Ross Burton wrote:
> On Fri, 18 Sep 2020 at 10:50, Christian Perkonig via
> lists.openembedded.org
> <christian.perkonig=sigmatek.at@lists.openembedded.org> wrote:
>>
>> The nativesdk-meson creates a shell wrapper which adds cross-file option to the meson command. This option causes problems because it is only uses for the setup command. If you use meson for testing like 'meson test' the cross-file option is discarded.
> 
> So why is this a problem for test if the option is discarded?

The problem is the syntax of the meson command. Meson is called like
   meson [COMMAND] [COMMAND_OPTIONS]
and the default command is setup. When you call 'meson test' or any 
other command it will be expanded to
   meson --cross-file=.... test
In this case the default command is used (setup) and test is interpreted 
as the build directory. It is not possible to use meson with any command 
when the wrapper is used.

Christian

> 
> Ross
> 
