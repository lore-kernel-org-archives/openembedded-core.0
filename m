Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.50])
 by mx.groups.io with SMTP id smtpd.web09.5325.1616480832823519083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 23:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TLeu5Juv;
 spf=pass (domain: windriver.com, ip: 40.107.223.50, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k15kXvt/Dj6QhrTCUquV1hRsgdOOAnduWVCw9XwPLbqjWldB8jS6IRKzZ+jGxH8J3cSZ/S14wCYyjtzOWaXzwnQf3RYDaaoCX2eU5XABcTuMotMTzn4mfUPHl1USP9GRUZk21GlLgpB4TAH+nkxPwSpKpSyHdkv2ZI8A2fzKY39aE8bwMz16vqwjfIcdPT5T05CfBmsHhk404b347fVSjM7Jc3UxPeeh8f5o1eT1QKlEVOpGw7U2nnB7DHNzzc5yc0BLVOOirk2U4dk64vYTZjf1/OSNY2tS9Ea7Hp//ou7en7mXSax1EN2N4OL0cO6M1M+am8PUjE8u7E5Qk1qKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZTK9xhzlT8t7QqYNa5SZZ52cxxeU1LesuFZ7vmA4RE=;
 b=WWG2zIrR9Utr02O7veraNpJpCo5z87KTdFH1G6KOVV0iZGk2MH0YBIEHQCie/jSV/Hhm3CTELWaRo1URReREmP0QFgIapaLgStYQzE5aw+9eaR91Zk6bBJEXrDm+QFsywjngim9OJOdSpSHFUDxI2AkezAhPs0m30ZcWEJQn+GjeX2BORhnvNPpM2TAIkwcBFOWERDDDD91Dmy/qqxBS/oomO1V+LAHBNmuHxD52MDvfNFHsW3VsG3/KD79DHLmWC+yfCUaLj6wYRvNChU6ZhayAYV6kytqHnSIfvu6el8+866gOP4WLYqwGD1ZfBEzMqsz1xpctYz7zIQjvZTno2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZTK9xhzlT8t7QqYNa5SZZ52cxxeU1LesuFZ7vmA4RE=;
 b=TLeu5Juv96poqL4PLmwfotEdjAs8c6Jt542Q4jAti3WwaK4zFa4YZ71G6Z769TrrKlmltsdrDBTdDHvuTaJXEvMzDv6MHeTZYSXgIf/7+D7uwUyisJRN0XgWIuHGqLgzk9SZ905ZJhmEL8SOB/DY5j4zHd5GSoGfyvWna5N51Mc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1534.namprd11.prod.outlook.com (2603:10b6:301:c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 06:27:10 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 06:27:10 +0000
Subject: Re: [OE-core] [PATCH v3 1/2] gettext-minimal: Disable the unnecessary check in iconv.m4
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org
References: <166D65C2E097270E.28077@lists.openembedded.org>
 <20210322075103.9694-1-mingli.yu@windriver.com>
 <CANNYZj-7gQg41Qpue1ZR3HCBHKQ8veD3TOwbvRYcD5=wv0Pj6A@mail.gmail.com>
 <d083f9194f73872623f20f81c697e0bff914764a.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <32564b97-5911-f9f4-43cf-1189c3b778ff@windriver.com>
Date: Tue, 23 Mar 2021 14:25:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <d083f9194f73872623f20f81c697e0bff914764a.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0146.apcprd02.prod.outlook.com
 (2603:1096:202:16::30) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.139] (60.247.85.82) by HK2PR02CA0146.apcprd02.prod.outlook.com (2603:1096:202:16::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 06:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb9a78fc-d8cd-4f8a-9846-08d8edc4b032
X-MS-TrafficTypeDiagnostic: MWHPR11MB1534:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1534D59AC86D65B3032FD7A1F1649@MWHPR11MB1534.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	1SwznjztN3LdotnZzPRRSGZIN2J3YPJhB2enaAADbt/mbfRnLPBLLxlANvSSI2E0tErvqmJdvUawL0KDh25/eOcEsMgYOqHwc2mhOnwlWlLlYrkc4RB+bFWfFrO0hd1NWILKLO5Ebqms7qg+ht7ludDJNuUycAYRtX27P00LYwElZkWDhkzL/NgrKU2Kgc9oVlnJ6NZjf+i4QxSzHyc8vcEjdYP4kAdMA8GLkJxNnP5ugRNtkotnP8uTSv9fEV+cwZy8GpetkqMGHvqYYOu0jo1tyUM8uYc/RGyRVSPwkeNC+gB8OWsSAQ93dCB3NZ5VjC/3/RDDupQ13FE46NOgi9MlZqxS/JKN5ZzeHuTwoRqOE6iJhEnBn5xQkGeFkxPcAbVXDO1nEUmnRJibgPGb2WN7xfLYA562n0/s2Ex4J3C2Gsla3qGhFFh4OKRIVVkJlmhD4oVGHOfzdXZi4LCQNJ1SCSbKsSYfKWw8gD8fApf69E4hWrqlaiNwjwWUSHkGaVqNX8uiT1n7gniOjB9VpZioWvXxDJ7nQfO9X04Hj5XGeF3l5RTYiif6Dc9aGo5Xwd6GiKhc2Ku/q4ptsi3S9nHNjeXjYxyamTElIGtKDrzqlDlYLcw9gc0LXnlcjTlnwsc0QrW2AOIvCnGVMHJ+Rk45TGMhmJxwybnxIhHXHUzmderlyAHOSpdnNG7STz1yHHCKTVJEFTNUx/DVx0fCeHEzh5PbS/W+Yqchg1BoW+g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(366004)(39850400004)(346002)(4744005)(6706004)(6486002)(26005)(8676002)(316002)(2906002)(53546011)(5660300002)(83380400001)(110136005)(8936002)(38100700001)(16576012)(31696002)(31686004)(86362001)(478600001)(66556008)(66476007)(66946007)(36756003)(4326008)(16526019)(956004)(186003)(52116002)(2616005)(6666004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?Gq/2APqLBu9eHIQa13Frvxno+fDnSOQ9+avBRwMbkavakz6hpWxtgmeaQrK7?=
 =?us-ascii?Q?tpR9/Pv+ewlnIqcQW1K/nOR/UbsNsh3iEaJDqkzWwtn2F11QTCk8TNrZyo8t?=
 =?us-ascii?Q?+9EW1qMS9JITZPt7kn1vg4F9ddmEJAsrTQye+yeqN2kd3yfl+BCStAVYy6Bb?=
 =?us-ascii?Q?RbrvhyR3YUOJNHuLAYGZlmvakacqEV2AyzYXbDWDcpOEgiTGPCxLdjR5c5qf?=
 =?us-ascii?Q?3os/4dddW/N2W/7RpOmV7k8PG61UcGWqo5LhA2NoxQ/9z6ZuXbcc25TaNUqA?=
 =?us-ascii?Q?MJx5AQe6HbP4e3tDtu9LxWlvj0H4nrPXIb5c1Ox3ygox11XoRW9Qlrp4dAXv?=
 =?us-ascii?Q?gj5P2FSuhasW8Xg96JL62AdWqoUBmvuJFOCJ1k3MY8ymofv8eJ6ePbgh9RHB?=
 =?us-ascii?Q?BU8ik/lr/FWNp0QapLCSLZ2Uulz9Gsvo4BpVua1kroxUv008mRlMj7upeLia?=
 =?us-ascii?Q?d8LiRoMojqYSRD+iY0P9YlxY8Qj07d0hCziTPWZqIL8uHWYGgykIIQCs3wZo?=
 =?us-ascii?Q?x8U54SM6l/CKgo2amYoxy2eP2RTUYPnnrMIsbotVoKXiabXLHx11u27dsZCr?=
 =?us-ascii?Q?E0xzwbq3/RWwwy+/NEmo9AJBrDCHd1NzUfLI/kRUPTURcJPZ/uCPbc4Gbav4?=
 =?us-ascii?Q?LKxZ+LF43h37dcebys+KXT7rsMoRisLayEiKzbwc/d4jS5o7A97U7qUdCsv8?=
 =?us-ascii?Q?g9wgCwMglsc5Y5sTNU9DoXgPNCMZ5FcM+uSBtkKlPVnOWVQSW03QpKP8dEvd?=
 =?us-ascii?Q?Ns11ts5rWJq0nqkYJK8PAiyr2hwVj3sBwz8fHV0RkfKqbkiqwi487tGTrzKA?=
 =?us-ascii?Q?iNsmTCGFBZlpZYYhj9TCPMG9eCD91WJPOlYQ15/Lvlha14vXP1LW2e4cYYhn?=
 =?us-ascii?Q?XPKUX/C8CIvQuXO1m/nOCKhrI0oGCECnH2G25i8LPimWk2eC3jUNACfd0la2?=
 =?us-ascii?Q?1l2mB+HHilCICP5WbwmkCgn7q3IXI/2KjArperHlYf/t3DZpmiKDKZQ0O8dP?=
 =?us-ascii?Q?hnZclH9FjcZ5fviFOrBgwOzLSm5pu5Ol6Hp5wYnhK/h4YCLqhwb3dXPQrG65?=
 =?us-ascii?Q?LpPfYzFQ273VzLgdQm5ovIH8+NlbOumtjoRrQUpSjnSwkSobhfwwodllOwjF?=
 =?us-ascii?Q?VE2ZRB4weJcsGdSQ9b6dUxNAb2Ap3K15rzp4mEIRliMHfmZV4gZvjQPlXNm3?=
 =?us-ascii?Q?My/qiWrUoNPnq/xM1f+hMOHV7O8Jqzo6LgHuTdcodZQ+4fmoV8TEK/ZVv1qe?=
 =?us-ascii?Q?vJIK6cNxOvhtRK8Fh0FdsWnXr1JV7tlAyYK0s+jGvJWENrpBAZ5qXZpA1gM4?=
 =?us-ascii?Q?p+HJF9WiUwLrVWQmPZ9gvrPG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9a78fc-d8cd-4f8a-9846-08d8edc4b032
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 06:27:10.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iyMPRRMDrXz6aSJ7UEJZvlP6jiUugavE2emOy/9qkYsNE2HPJSv46UpMd89sTgKb/EIuNRfWbe1SppkLR+Y6lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1534
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 3/22/21 11:24 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>=20
> On Mon, 2021-03-22 at 11:29 +0300, Alexander Kanavin wrote:
>> Note that this m4 file is copied verbatim from upstream gettext, and wil=
l
>> be again overwritten on next gettext upgrade. You should figure out what=
=E2=80=99s
>> wrong specifically in elfutils tree, and work with elfutils upstream to
>> resolve it.
>=20
> It's more that there is a silly/pointless macro that breaks native builds=
 for
> us, the issue is in gettext.
>=20
> How about we set the cache value globally for this macro and drop the pat=
ch?

Hi Richard,

Do you mean define a cached value for the marco AM_ICONV_LINK which we=20
patch against?

Seems the definition of the macro AM_ICONV_LINK we want to patch is too=20
long and I have searched via "grep -Rn CACHED_CONFIGUREVARS *" in
openembedded-core layer, didn't find this kind of usage. Not sure if=20
it's appropriate.

Thanks,

>=20
> Cheers,
>=20
> Richard
>=20
