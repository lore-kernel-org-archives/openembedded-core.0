Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.88])
 by mx.groups.io with SMTP id smtpd.web11.4140.1610765413802488899
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 18:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hCZzC+j6;
 spf=pass (domain: windriver.com, ip: 40.107.92.88, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVOX4arfHIU001IzVSX/5v/nWkdocHxoBObq0sTAZq7b0f4M5aCjkX1nblrakPdX+mLcRSSFNRayTjdyQYVKgtoWWwwjf1tNVcQUx7EVvD7ekfCqgrRXrSFmSZRkXO7Ba5FsdT6kd4cN/6/R5OPINU2woyqQL3dzl1hx2uIcE0AjZQh57wBTE/DN5335apc0DaXjRDyn/uP3wLi8vSRDefTJMV5wcKSv7KrnHKDxaazqBIrA+n4hA7Oplh2++6+r7FLRlUiR9XjTUWOKjXgEzJcnIGHmQwTXv/rFMSAWBuHz+9NT6GD1geyI0FFvdwJ7fWz5S+LU5CLe+6FZ9bEpzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjZEdCNhcThLOgCyBsbwGWZRLrHr6mmnsG0rLQAOAHA=;
 b=H9YkVFGhT0TfyW6Itv17uDMHLDdSulHGTIL/kJ4IPVUNrahPahemB6WerIqHfMXx4qKtlD3AUswbxTuuuqQw4/gIOOXq/kmx+j4uvSvGJm3FXimF/hjyH3fm6i8oY5fFvFIltJlLz6M2ezKgMtXp4hQTC0xCxRyQ/pEX7JUVKaCKHaUv/MYc5EJgF/cYSvRB8gutckmNfK2KsfR0cNKuWlZXvcOmg/ujy8uONmAedJXD6Ko3YC2P1kFYDaRFgD2Xqd7eA59KtGe+fqzXiiZq6qbjU8S7NcHyghKgl5S9fgavc0VqDtj8BjyhZwVRHKcRsdCKBEJNsD1wVfJWDkvtvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjZEdCNhcThLOgCyBsbwGWZRLrHr6mmnsG0rLQAOAHA=;
 b=hCZzC+j67RxgMRhV6Lo437/EIeweloROM4g0nfqMEbwuzGMpTYkrByx6rX0BNkymLJWIYSnF6K08uTwkPI90tyUfBcywNRzFp+KH2weRlRqw2hh4RvC4kGi0mJsSdKOT+8XAaArwLYpVeAjk8MJjQ8uRny4jNDUtKFIyzXfxvUU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Sat, 16 Jan
 2021 02:50:12 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a816:b4fb:846e:9417%6]) with mapi id 15.20.3763.012; Sat, 16 Jan 2021
 02:50:12 +0000
Subject: Re: [OE-core] [PATCH 1/3] dpkg: add nativesdk support
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
 <4221b98b05e228a26d42acd2dc1db9e992e3b41b.camel@linuxfoundation.org>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <3338d8de-62bf-b428-152e-7f1d525fd528@windriver.com>
Date: Sat, 16 Jan 2021 10:50:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <4221b98b05e228a26d42acd2dc1db9e992e3b41b.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK0PR03CA0109.apcprd03.prod.outlook.com (2603:1096:203:b0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 02:50:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76563790-4086-43b2-4bdb-08d8b9c97210
X-MS-TrafficTypeDiagnostic: DM6PR11MB4705:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4705CDA077124C193A070BD794A60@DM6PR11MB4705.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3h+a4TxLqgOawoVjmbHtpfNRQZZvo1dxmb5KBftCQMpNdbIQ6IxtSI8bmhmO/5pDVv1dZGXHc2STl2V8GkSehPiw64+WqORQRE26jpVYSAmtrJYQ2AXoWVA6NUULdU+A6wPfsfxcCm9vn6tAiWwpFLZjVorBbYKWQoDcdrHUyZMkhQBAIONpaLft0ZlQRpNKrjO1GGWqsHtw5jUB6xgJuakppn+ua+Iu1Vhv0HNNWBn0gkZ/wPpXRlInQ7tvRx8WwW4QinxLSg8QqZ7ISsEtgY138rsfoiawkMfg3eg8ctVdOkeJR/8lHMMwZ7ucfwNtaIN29lQakyE/x4r62+Oh/2J8huxVUXpwLe2qaLu5IEZUJbCWw47CxQwQg1a3rZD+UFFQ5Boab3K/kw733HFLEsm6gZf1r2kiJXjMs+UvTGtHuyP5mociOWs3WTJ7KC9S4CdgAYIdAhSjZSqzE1+3EMxSAtKWHLX7hhwrXrnw5lR3csmuj6Ge9J2qTI/eZNbUXVeJtM5Ns40W7XOk4Jtm1MPTQEaepR4YXn6rJb7Q9rqgsSyv11ZVIXwcCT+NLJFqT4RmCldohSWd3Cgu0XkBjw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(4326008)(31696002)(6706004)(8676002)(83380400001)(86362001)(316002)(478600001)(956004)(26005)(2616005)(44832011)(53546011)(36756003)(966005)(52116002)(31686004)(6486002)(8936002)(5660300002)(2906002)(186003)(16576012)(66556008)(16526019)(66476007)(66946007)(6666004)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NkZzNU4xbXF6NjRLQm5yZnFxTnIxdUJWR1NqTHlSenFLQXlvT1R4bzFZUTgr?=
 =?utf-8?B?SGIxazJOVm1mbk4zZlR1ZWVEdmtKY0NBa051M09UTXRkQXdKcCtva0lmK1A1?=
 =?utf-8?B?bFdFZ2JqeHNRd25JdTZFQ09sSkQ0b2NiS1dkb05jZEpoa29lbkNWWm1qZVEx?=
 =?utf-8?B?QWx4VGVKNWNXdVRpTTV1aUpkOW5WYTY2ejVtUXJ1cWMraUpTa0EvSVVTYUoz?=
 =?utf-8?B?YWpoc2Fva2cwRUdXR05SQUNrSGFEb3U2ZEl5bE8yNHh6UWRTZ0dOQmxFek1u?=
 =?utf-8?B?OHhia0JhelpRbm9WMWE2eUladHoxbnhWOWdFbEFrR0lDYVN5RHZEMnZ4VkN6?=
 =?utf-8?B?Z3pKUXA4VzJjb0p6UzdnQTI4d2NVZE9xa0dhTlVRZVZpZTUzV3FrVDFMN01Y?=
 =?utf-8?B?R1dOYklsR0FDL0hHUVJwSzBRS3lnbHh3VHV6TzBUaE93UDFlMnpsUVJaenNu?=
 =?utf-8?B?MnYxRTdNSWpET3VNanVzQ3drY1BHeG42RFpXWngrRDJpdEd2MGxKTnVudm9y?=
 =?utf-8?B?bXhvRnY1cG5PQ2d0SFVUWHJjWVFWb0R0ZjAzZzBsbW1NakNEQmJ3c0JGZjRN?=
 =?utf-8?B?c3ZmcDFFdXZoSG81MGlHZGpyTnNHeWI4QmFuc0dLZktQbytabG5reWtaMHhR?=
 =?utf-8?B?Ulo5RTN1dUxsM0gzN3UweDMrN1VPUFRWVE1ncmZxOUFkMjRxV3dKcFJ2V1Qw?=
 =?utf-8?B?STUyL0V0UW4wa2U5ZzRITkk2dXNDd2p4WXpWOHM3NFdEYmtxQmZkcGJJNk84?=
 =?utf-8?B?RjNLZ1FWUDI1UERGa0M0bGlhazJzYjJUNGN0MFptZmVlYWQrUmo0R1ZEaTBZ?=
 =?utf-8?B?eTJSUGZ2SktPM0JuV2dXQUNYYWZhWGZCUGFtUGtuZVlkSjl0QTdsS1pNN29I?=
 =?utf-8?B?Sm96SCsxQTg3dG9nTE5weDJrcVgxREF0VERoaTNTS0ZBcFYvUWNWb243TUhC?=
 =?utf-8?B?ZWF0dmEzYjFVeklkUGNrQXhsUjJRdmZZeG8vTUF1NkF6VUtFZEgzYVNObWJn?=
 =?utf-8?B?NUxGZ0RPekR5Z2lucVRTT3p1MnlaNlBxZE45SGNKWE8xc2ZueXJraGVXemtK?=
 =?utf-8?B?dU9CK20vRjdtZEtMY1ZCZ25sRnZ3UFZSb2pObEhGY1EwMXRlck1VUW10Y0xO?=
 =?utf-8?B?ZCtGUTNTbUNsdHdsaDBWNkt2T3J3M2lHOU4yTDJXditPNUxibzZmZWpiZjJ1?=
 =?utf-8?B?alBLczdPUVhKRXkySldvK3V1QkFyeVgyaXE1clF5M1FlSTY2c1hDSGUzVjhZ?=
 =?utf-8?B?TDk4SmtDSk8wVzB1RXI1Uk5JRFNzdmdvbzJBUTlzRVpMV0ZvNmk4V2tjc25B?=
 =?utf-8?Q?4GHZJsuqR9RuHSn/OD/Qvzm5ESM1VU9Myx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76563790-4086-43b2-4bdb-08d8b9c97210
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 02:50:12.7350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3hRprQrIF9X3qD+MqZMrYs4cE9P+gdoPKvBXasdHmBSwWErQXtLefj9HXNlMkegbE9v79DczCieltW2IlmHfAztnXxvTSELZ/QsLRFA9dyc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 1/16/21 6:15 AM, Richard Purdie wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
>> - Add nativesdk support and override EXTRA_OECONF and PROV for
>> nativesdk
>>
>> - Replace ${bindir} with ${STAGING_BINDIR_NATIVE} for perl-native
>> shebang to fix QA error of shebang too long in nativesdk build
>>
>> - Add ldconfig to runtime depends to fix the following issue on target
>> [snip]
>> ...
>> dpkg: warning: 'ldconfig' not found in PATH or not executable
>> dpkg: error: 1 expected program not found in PATH or not executable
>> Note: root's PATH should usually contain /usr/local/sbin, /usr/sbin and/sbin
>> E: Sub-process /usr/bin/dpkg returned an error code (2)
>> [snip]
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/recipes-devtools/dpkg/dpkg.inc | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
> Seems to break poky-tiny:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3209
>
> (ldconfig may not be available with musl?)

I will try it in musl,

//Hongxu

> Cheers,
>
> Richard
>

