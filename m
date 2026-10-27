Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16433.1793099949521484381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 04:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=YMD0N2xX;
 spf=pass (domain: est.tech, ip: 52.101.66.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EA47X7arrJGhAKgNV/cEdBaRLI7i4ciLlY1cAoP5wvlDfHMDwtfFDK70rAvHAm3+GgLTAUcBtSNGs+GzMAL5WLh56VeuAWO0UOeQKU5XpQcbPobwst8B95fVysKfoIHUbI/eVGF0MOrLvfelLjKjBRRrJJh6Ags0ARc0xGYOtNp1A+Kx/DcWSDpJNLijdwhQHj3QX58l9TxEvSo1f2nmPclcpl1ahayBeEo8lrehabjuoY6ORP1n3vL2U6E9T+gCteuYiJ4I/siXBqIB/DpT0qq8pwMl3BIsF4SFxIQluQcito4xp2ALUD6EDJEeeP6sDe62AU+XiOaEHIgLMHs9Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0N+tZlZIYd9Qt7LQ3+m5tqIZV9RPUWvSLtYuy8HDUE=;
 b=N2qFeU9Vs33hbQtmPkxDwBKGAsnHsdj89YL1/HAZWTLDT7ZI9Y39dzzIs6F8+AmxUI5k29SWHXex57D9bWVyU9/JcSa5e0OksAZDmVgb8FERGFt25wT+oy5HayXIEr2mb4mXj/w1q48XvU1pE4OCgTNJ/ZG7RJlPyLrU8b3UGNg00wjDlhyJ5dVQLkQrKzQ+CIne5cWrLSQS8sBBq2apC7BFArU2nKIYcB1DSw5r+WjjKjMgjgDDdpnWTWOqMSBJDs7N9Lr/pX6WdvOWXQ2SEV2NtBIDFmThADfMrNp+/LePfXlCN90jdjdru3XvNuIZoSODPZQf71jaz3H7Z3if4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0N+tZlZIYd9Qt7LQ3+m5tqIZV9RPUWvSLtYuy8HDUE=;
 b=YMD0N2xX6HPNlcZuD9keONd7R+17UnDjXQxnDjTeGe5X+FjpSwntAkQfnXev4tyNhSgHcJRyrTqepkTcvwxnlfAu6rT9a+Ke1CfOe1ZfmCQQMIPDWD9Rtl1cDeQ4iuQGDOZ1AGBw36WCDbIns4lQsfOT6q408qWeGvo4SPltLZ5TL0juBtBfHWeogZbgOn3Rat8Wt8fCLxPkMTXd2tSl/1k9K9/jDF5M3rzMQ4gDlzLlh6T70E+7VXJ7W9Wlq8so7XG7xt/dBlWdRA2SWxP+v3+KYzOWCShTubRbpPd8yu5OGwPW8N7QZVHcxRiakmpjsttSwUWmAZOX4o18XZeOGw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GVQP189MB763646.EURP189.PROD.OUTLOOK.COM (2603:10a6:710:108::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 11:19:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 11:19:03 +0000
Message-ID: <c42edb00-81c7-4b12-b346-4f87d49c1348@est.tech>
Date: Tue, 27 Oct 2026 12:19:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 05/12] python3-cython: upgrade 3.2.9 -> 3.3.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>
References: <20261026103138.3137-1-jaipaul.cheernam@est.tech>
 <20261026103138.3137-5-jaipaul.cheernam@est.tech>
 <DMFGWCL8ELP8.1TA54FJ0CK9MO@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMFGWCL8ELP8.1TA54FJ0CK9MO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ff::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GVQP189MB763646:EE_
X-MS-Office365-Filtering-Correlation-Id: b999afb5-47a0-4068-0689-08df341c1b90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|22082099003|18002099003|261026140227099003|11063799006|56012099006|4143699003|10067099003|261022105027099003|261009223027099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: E36zeLOy03L2Hd0i3p/shzvM4VOrdKUXYzOUAhchSGA5LSqEUNVLeow9fjmV/uFAZJj1QrwKJpiONzhrd+U6CNiJGrrZuyIssWU6GV/BqmGsFXogVP3voJ0EHlKWsBAuMFUk/GzVGDhWCbEI7aom+4TAgMJxbQFsYFxw2exJ9GUhmBrRHHEtASqG5YjRqTYec4mLuepmE3z3KHv3Tt691mvA87calMBC/GtDo8I+wwQvt5KvWh6EhIfrArKwBpag7/hcpbDEi1OszX/oxKuXjKRG0z4a0J1IW9z8riG+TUrDlEAW+mtYDnmjv0P/Cyss75I7DsRqSuYYuNmaryRRZnmDlRppzmxBk2YxmYbPgn50BMsiGgdLBx985U9kgCYucQyJqN9iH3DGh192pEoLPSz1YXhCEN5l1LGSVIq9zmqXCrLnt5MTA7qHLp0+G/dYLmYlU+OHT2OWrCftJRIq0QS/pilbKgLjYV8MCuEovahzuE0wI7Rq6QeXJeUupXUu5Wce0jj8ZwP86jxEjmlxVmfArgxoAZVWDxE+p7lNWXNb7/e/tCr8rJeHhpnva++X4GlRedaXM7ZxQoRnHF6313u8D7VhfN1mfPa/dJ5Vmv+N/W5AKL5dKoHoXgsr9sGS
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(22082099003)(18002099003)(261026140227099003)(11063799006)(56012099006)(4143699003)(10067099003)(261022105027099003)(261009223027099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzVHOUVRTVczNTBoTnJFWWEzSFVPWDFNSERveG1IMEwvQ3FTdEZteGRNR01H?=
 =?utf-8?B?OE80Mm8waTdkNU1kTjlhZS9nQ2NZMVRPSTBpTC84V1VkY3ZGLzJUUXUxaFZI?=
 =?utf-8?B?dUdHNHdweDIyQkdZS3U2Z2tWMlVMRnBGRUpuVjNzaGZNd1g5MUxIWk0xUUMz?=
 =?utf-8?B?NVRyOUF6Z1dLWG4vZXRoWU5acEZETThacUxnc3pFZUExMWIzTXA5NFRTdkky?=
 =?utf-8?B?bXI0YUVlS290UnNua3hMY0czeWdMSEQyUUkrVk5PZTNUMks4OUc5K1Z3OEp1?=
 =?utf-8?B?SHMvTVk3VEZSa3hycDNzZXlaWG9CaTcvQmhkNXlHeDdJRm84c3E5bDVZanI3?=
 =?utf-8?B?ZGNUQm9oVmVKUTZsRVFjMkRtcWVMbUNBVVFRNVFzVElQMnlaUXBtWlRub3NV?=
 =?utf-8?B?QkhSdVlkVm14V28wYXlDV3lSb0cvcnMzSU1jZFB6V2xKODVWTXZwemdCbDRu?=
 =?utf-8?B?UXBrMVlWcEdPM0dPdlQ3RGgvY2IrSTVQanovbTh4UlorNTJvbG1zLyswWFhQ?=
 =?utf-8?B?SVdEOEdlUHhpVmQ0YkhQM1puOHJvYnJnckdjdE55ZW5oY1Q0Z1ZLVktCWHJD?=
 =?utf-8?B?bmFkUllvcnpRajhpR3JTYU9JSjhKbFM2V2NRcU9qelRxcGxwMHlINUVDbmx4?=
 =?utf-8?B?OSs0OHp5WkRkQWlsaTFnVkU5bDBzem5hWDJZc3hMYzgyYjVlKzl3L01VSHVr?=
 =?utf-8?B?Q2pBaWNEWUVQcEFxbkQ5T3JCaHhTTWErVVFlbVpGc2NDU0tKcXgrQVlGenVF?=
 =?utf-8?B?QnlKemhWWEpmZmgwU3pvbHcwaHZSeVlaZDAzYlZyMC9qWWxFKzVTSDdiZE9Q?=
 =?utf-8?B?djQ0Z1ZKcVJiRGdGYkd6eWVjY2tEL0J6VU9OUms5UkpFTWl0cVUzQzgrRjdz?=
 =?utf-8?B?UnM2MTk4QUdIbGJxYzFaQWR6VmN4Nkt3Y2htSUJhcUhUaEhQNDRpdVBtM2E1?=
 =?utf-8?B?UkdaR2p2QjdGRDRETG9EdnlBNjkzdWdSbEc5RVRZUWk3dmxlS2tmbDlwdTlL?=
 =?utf-8?B?a0x3TTcvdm5PR2dZOHJOem9qbGZUSjlGbDFlMlBrUUluU0loMW0wYjBWbVVz?=
 =?utf-8?B?ZkllNmZydEdnbUplNGlBeHVrR29iOTFYWjA5ZGE1eTA5NEY0czd0SnYrcy9k?=
 =?utf-8?B?WXZvbHZGOGJWckNvdjhzTGJramprYjVEUXNYMVQvQms2c3VMQXZ5d2NmbnMr?=
 =?utf-8?B?N2VIRFgrWDl1aWxYc2RGR3p3U3dmOTZtL0VOVEpDUWxuRTZoUUV2SUFkQXcv?=
 =?utf-8?B?ZnYrT0cya21laEpVM0c0aEZiNXJUTDhqQ3VSQ1QwQ3gvMURLdGd1aUJjTzBF?=
 =?utf-8?B?ZE5udHJyZnMxaXBoNkY0R0wrV215U0JFenZmM0tPM0tUd2E1TXBOdysyNkEr?=
 =?utf-8?B?Rm9QdWZRVzB4STVPWWx5dWFMaTVZQS81YS90QWt6YU9WVTYzVzNNbEFsSDdS?=
 =?utf-8?B?YnF3bHNGR3ZzczIwL0lvU3JBQ2R2YVYwSWZYQm9vUzE0VDJmVzVOajdMN2sy?=
 =?utf-8?B?RitRZEFOM0xOTHFYU25OQTk4MUlYcHpSNWFlZ1Bzc2ovVU1XdktoQmRoUWln?=
 =?utf-8?B?N0xLTkdEd1dGL1ZKSDQ2RDJhV1lWdWRpdnJiM1hFV1VqaklxUWNLdlZGTVRI?=
 =?utf-8?B?bmd3bzVNbk1wSnFDcFJHT3JjdXhCUGZ3UVEzWGRIUmVjYnlhUEgxb3VGQ04v?=
 =?utf-8?B?RzdQaUxKaVlGM0lpa25Rb0FsbVI5L3J4RHBDL3dwSWFUcTE5bUkxcmRjZjdT?=
 =?utf-8?B?VWRIY0Vxa2pPaUNPY2hzWTVrZDZ2ZkxYRUV0UzNDakp5eHZFazBIVnZ3dHlw?=
 =?utf-8?B?VmNjY1FQajJBbFlWRVl2N3p3VDlJQ1l1Rnpucyt6NGRhNmdremM0U0pqUlFR?=
 =?utf-8?B?aVVZVWk3TGNzTmoxeEpwbHNzSS9FOG5waWFmMk13Sm1wbTRIajVURFlTODVR?=
 =?utf-8?B?MjQ0N2R1QWZXZWk2akVKcGNkMDRPbDlVZnlkcHdxODNiM0VHN0t2MmlSc0tN?=
 =?utf-8?B?Y2NYM0pVaDVSL0gybm83SWJ1VlNZbGMzY05xYlRPOFZwSGlrOGFnZWJQUUNp?=
 =?utf-8?B?OHY4aXJML3YrbEhkaHQ2dVg4UEZzSEtiM0lrUGlISlhtOGlQT0FaVVAxUWI5?=
 =?utf-8?B?UDZzN0did25GR2V2Q200eDczVVpIa3lBWjFXaFFvSmNFZFZvRUVIcjVGSklo?=
 =?utf-8?B?Ly85MGU1YWpvTWhjdXQxUkdLOEg2d1UyN2JwdW9oS0VRV2MwZjdQenF4bEth?=
 =?utf-8?B?cHlSd2hZcVN1RlRqR2ZTYXRkYnhqbCt3Q0tIalRnTlRyODlyQXRIaTBtTndi?=
 =?utf-8?B?bi9oNkNUWjNJK2R0NEtKUlNsZzExdjV5a3RvdlNnZEMyUGtCS2dHdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b999afb5-47a0-4068-0689-08df341c1b90
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 11:19:03.7106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/IgTpck3nXI51Ifq1lVc6CMzU9Sh9f7EzFDXOTL7s1AnTJi16gZIWig2IeGD7UgJYEN6/g+m3mFtPiDQBK9T3lbK+Rx+ZaGsMMTKN4wvRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVQP189MB763646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 11:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248728


On 2026-10-27 09:11, Mathieu Dubois-Briand wrote:
> Ross sent another series a few days ago, It didn't show this error, but
> was showing some reproducibility error.
>
> https://lists.openembedded.org/g/openembedded-core/topic/121652235?msg=247619#msg247619
>
> You should probably synchronize, so you don't both work on the same
> issue.

Hi Mathieu,

Just checked the Ross's patch and Please drop mine as he is on it.


Regards,

Jaipaul

