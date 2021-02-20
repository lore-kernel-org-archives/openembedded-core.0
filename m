Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.49])
 by mx.groups.io with SMTP id smtpd.web12.4615.1613811166721540472
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Feb 2021 00:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Sd4AreSo;
 spf=pass (domain: windriver.com, ip: 40.107.94.49, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R4cxqQ3Yfzob7t4VehedEe6oSkV+rpgtxt906ld6l3e6Puw9I2xQzyS9hLEQoYP2gKyJrUWRpGEp9a/9r00hYmFM8yaygnFGEEkElE7Kiip041kQF71H6UAEZ5kkerd220JrXfchsKYJXr/XhUXFrahiWjzosNKi8Zl5OG9BByBw0MuJyRIS/DTidRWbad37kKtKJDHIofmtARodkQExlr8LhoG0ls7+4cDAYyxyIq1HXpI6nw7V302uGdQKXlAZLA/QW8vRYZo9LWlZUJSRRkWBqGlJbyVpZuQ4LgtMv+oOO3hdSNFWpOur9Ur3G5v+YgtdDKxoJqeTR2pJgidCGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/WZpd2LoiWgkooH6Edp2BlSvcXMvGsy9H6bkbrsNrY=;
 b=lOXrtuFofoDds4MfaFfNG9l74ADNUn+nwYrdVCPVL8aBlKf0YKwC1u6MU3VJiNFIGRE/9kqkZR4RcwoxF7MTmSS4UeNJTX4vrr9nRUx6cSdhUCWmfRATokn0xOxUOWtEtxXufzXmQLB2KiGzbAywvE73sLgY8yqeEcAILlGW9LjjBd3K98gII6dFDUWndkoVqz77lecyjfuiY6SM3CBXiCmSVCDrKD2HdMu4Kr/FJlCmWLlhTlGTEGFIhULGLWKAgzT9C7ksxXVfgcWGAR9nFb1/FMPd1pyzOmaSbuAIVFnLErQ/XHXE2DsJtVi+lJnf0OUwtdDZ0nkiEm9ymG7KZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/WZpd2LoiWgkooH6Edp2BlSvcXMvGsy9H6bkbrsNrY=;
 b=Sd4AreSo+XNYX9S0IBS1PtMHOVxDjCl6vmaWB7nwcn1N0xhTmujzlbJSBris+GKXZ6kzhUIOWcn5XNJjqzNEo3lRVUdlVDsHd0f37hpg2wkjDXz6JBCa95Q01AKZ0jfJQB2IOtXlP0Cv7UMD52Gc3PjI8eiuCyIVjDVlVkpRMdU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BYAPR11MB3174.namprd11.prod.outlook.com (2603:10b6:a03:76::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.26; Sat, 20 Feb
 2021 08:52:44 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3846.041; Sat, 20 Feb 2021
 08:52:44 +0000
Subject: Re: [OE-core] [RFC PATCH 0/2] replace qemuboot.conf by qemuboot.json
To: Ross Burton <ross@burtonini.com>,
 Guillaume Champagne <champagne.guillaume.c@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210212045335.16612-1-champagne.guillaume.c@gmail.com>
 <CAAnfSTvUJvqH0ZNde7VpqTFdLrMC022+T1HPKigUYKDhDZc=WQ@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <6a2d81ce-79f6-fba8-f8b7-b135c7032243@windriver.com>
Date: Sat, 20 Feb 2021 16:51:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAAnfSTvUJvqH0ZNde7VpqTFdLrMC022+T1HPKigUYKDhDZc=WQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0214.apcprd02.prod.outlook.com
 (2603:1096:201:20::26) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by HK2PR02CA0214.apcprd02.prod.outlook.com (2603:1096:201:20::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.28 via Frontend Transport; Sat, 20 Feb 2021 08:52:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b79f3bb4-79a3-4b36-7581-08d8d57ce392
X-MS-TrafficTypeDiagnostic: BYAPR11MB3174:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3174C5D3119E031A5BBBACB6FF839@BYAPR11MB3174.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dpiJj9IHINDKzcC8faJ9FOm1b9GspmYGQruBaXQe3FrV7PYMs75GmX7K0ZAZhfxD/Ed8Liyqu4gPmXuVzy7HB2omoZ9lkWUa9ZZosrcKaMb5Mb1Hi5lAqmCMinb1aZublDX3Wv5bfvaV9YKAyvnRXHKONc2tnCaIIF+r1qF0nsuP1/GAU1iKbbW3ejfyo2n4/dKPoVlQYcnsNdqMKTw78KDneGx87N+Nu+5E9AesPuYDCON+zHycCi9nsAfi2F/3xUwC/66YH14DREP2JJm2GLx3NmwKlxx7mhW3gVK7x2yidKPrqKHzHbXbtzJM+TqArk8kidJ2WLugNQmcvVazW8lL88T30/Y5FrWszL89QGqNO98saqKkdt/JvxvgtJYmXL5NbaO0kynxfuOCyzS0cXERxiTH3vS+s6Mh3ZfmsFcUD77McKfT2KC/X5p7NMELbRQrtPS0H6qufloRFXg8zFURCaFQGW/YVvsHXKlFA0DL6eXnh/8XU5FDyqA8IVcWLGRXWoT9r3tLbTgV6VradBXjQ3uynMLcv2r4okMi3A8tYYj9vBix5E3joGNrDuZaTYIfGVQp8S9LAlr76sMfd1atTCoq9KnKrl7yrgRS6WZ9HwiOCLJ4ZgJ8sEWEJ+9M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(366004)(8676002)(66476007)(66556008)(31696002)(478600001)(36756003)(83380400001)(316002)(6486002)(4326008)(66946007)(186003)(6666004)(86362001)(53546011)(6706004)(2616005)(52116002)(31686004)(26005)(110136005)(16576012)(8936002)(4744005)(16526019)(956004)(5660300002)(2906002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y2ZIZXRrWWR0ZXNzMjZaSVpPbjlzN0s0SGJ2Ulh0ZWtCQlZ5KzEwZXlSK21h?=
 =?utf-8?B?Y1pYcVZ3SEl5Y25ObjhndVB4dlM5citmZ0JmZXRvc1VzcWpiYzJ4VWhUSC9l?=
 =?utf-8?B?VmFIMTlwYzVoRUdTalFob2Z0VzVUV2FLYlJ5SzlKRzVsSmtXM21aNldWSzhz?=
 =?utf-8?B?STh0eXBlNmo0VUlBVGJZOWRwVk4zN2xKZ095cm1CeEl4QStOWi9iWEtHek5y?=
 =?utf-8?B?UWhNQ1dTOWhNNmxPa0tDYWxJSG5lVVFSdzFHMGxnei9WdHExUTdQZ1BFQ2Vs?=
 =?utf-8?B?a0pwQUp0dko1Z3Y2WjRUZ2x1bndveW9uQVozNkY2UDFUeGQvV2c1eWV0bEt3?=
 =?utf-8?B?REJzV3Yva0lOUFBMTGIwQjhiQnN3Ullia3U3QXJVd1hxK0dMK0dzT01Wb2o0?=
 =?utf-8?B?OHpOZ2JTVjdGc0xHcTdlY3BqUjBnbW43ZFRsNGRGaEJiNnRvMHVtZnNlSS95?=
 =?utf-8?B?U3ZaRnMrejJWbkp1bCtOWEUrK3kyWTlOZGxkeTE3c1JHUmVYdkJ4bzdvb0FG?=
 =?utf-8?B?R3h1TlhXRzNGWi9mZGZ0TVozZVdyTXBNaXRYZTErR05WcjNNSnRDdjIyZ0M3?=
 =?utf-8?B?Q1dKcW1mdHBsMEdsK1doOEdrUVVjdDRIRTN6ell1cXJpaDI3T00vMmFmRm5H?=
 =?utf-8?B?S2FjdnRBaGpiRVBnYVpWSko2S0tRcWxBMklDQ3J2UnNrellrcEpQR1dZRmZB?=
 =?utf-8?B?dk5DRlB6QmV6ZWhxaE1mbGtNdmRXdE1jekpMTEJ6akx3YlJnUlUzYitIVTFu?=
 =?utf-8?B?dlJHeVhwYzM0RUNoQ2NLblNDbkU3aGRJR2ljelhKck1lbi9wb1RvTDVsN3JV?=
 =?utf-8?B?ZTRyWTdtMVBhdUNVbWtWMFU1OGx0MW1nR25tN2tHTk9DNzJxTmt2YWIxSkJ0?=
 =?utf-8?B?REE4ZGg1NVVBMDQreFIxL0JmaUZ5SEhKNGt3dDBxR24wald6Y3NwTHF4anJW?=
 =?utf-8?B?c1plbWtMdGpDcklJOVU3d2ZsNk1rY1IrTWVHaTBtTU0ybzhXbUdpK0t4eUF5?=
 =?utf-8?B?OXBsOHN0eVJDK3QvMDJNUWk4Qk5GWTdUR3dPNXp0cGk3YTNId0dFNTFtQVly?=
 =?utf-8?B?OUljaUVSMjMxalVpUzhQUHo4S09wbGdFbE05NjlJL2tsT2hXMytPenZnd2Qz?=
 =?utf-8?B?L2M5SW02bGFQNnF0VmxWa0d6NCtyMlk5YzczSUt2TmhycHZXRnNrOExxRUJQ?=
 =?utf-8?B?VWU3aDRrdTkxejZJM0pYRXAycnFRQ0hBMnBLRDRabHRDeFRJWkk2QzFmb1Zj?=
 =?utf-8?B?RHdsZXNvLzV5WjloNjNNQzJoL1VsdGlhTlRVSVdEeEVLemNXMWFxbnFya0xk?=
 =?utf-8?B?Z092VXEvb0F1ekc2TnIrMDVMU0wvb0JzZGV4ZHhnT3MzVC9WWnp2VW51b2cy?=
 =?utf-8?B?Vks4Z3pSak4zZ0ZmdnpNSWlGdS9rdFRaYUlaT1dBVGFIbHNHQ0ZPMkZVNUY4?=
 =?utf-8?B?SkU3QjNIbmRtSEZMUFFXb29LTXNaall0U1N1Mk1tMCtucmdINTN6STFnOXdz?=
 =?utf-8?B?c1F4bmdLc0VKTDV0TjBRcVUzbkxtT1hGWnM3SDZpdUxJOTdwaEFQNHpHMDZp?=
 =?utf-8?B?OWxmQ2diTG5HaFFoTlVGdjJ4Mmo5a0Q1bm9ueFNaQ3J5ZitXUGMwbEpPSmZG?=
 =?utf-8?B?K1JhcDRyK0pBczl1dGJzT2FZdGNwTDEvdi9SVmtRd1ExSlFQSDYwVU02MmRQ?=
 =?utf-8?B?ZTVhZDkyeDE2Ujg5L2hocEUrbkxXdWVWYmRXVldyNW5wM012M2N6MXZMU0xV?=
 =?utf-8?Q?o5VwcQst+6sJcH5+c8bIptpnODu3nX5f0Nk/b3A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b79f3bb4-79a3-4b36-7581-08d8d57ce392
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2021 08:52:44.5691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JFaInZpDk/1ZEw41IFka+kbxMvGD+1ghxJIi4gachgyXYIR+zz1RlgmWn7Z4hU85etm1JdyYcBVPkZIVwj6qE6gYtmEC3KnCGjrUll5A3FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3174
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 2/12/21 7:48 PM, Ross Burton wrote:
> On Fri, 12 Feb 2021 at 04:54, Guillaume Champagne
> <champagne.guillaume.c@gmail.com> wrote:
>> This fixes bug #12503. Sending this as an RFC since I'm not sure what to
>> do with autobuilder-worker-prereq-tests. It fetches a qemuboot.conf from
>> yoctoproject.org, but this cannot be changed yet to qemuboot.json since
>> it doesn't exist on there.
> 
> I understand that you're simply fixing a newcomer bug but I just don't
> see the rationale behind the bug in the first place.  Copying in
> Robert for his opinion.
> 
> I'm unaware of any real world limitations of INI files that are a
> problem for runqemu.  We either break compatibility with existing
> builds, or have two separate parsing codepaths in runqemu which
> complicates things more (as the ini path won't get tested).

I'm fine to replace the configparser with json since json is widely used now.

// Robert

> 
> Ross
> 
