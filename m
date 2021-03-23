Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.82])
 by mx.groups.io with SMTP id smtpd.web10.274.1616543747035743884
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 16:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gZ4kVVU8;
 spf=pass (domain: windriver.com, ip: 40.107.237.82, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VVIygtzxhHua0R5rggVfptio2p4mPqEbj0FEVBtCAqGdFZ93w1fSuO5uFwVkjUh5m452q9soHD/ngTcIrhpAF83LIhWbPm540ckbrLTmITBn79FlGmunntpHiEuiT8aN9R84HsslJ+J7DCCWvJrTokuC2JgBxZSlZzxm5FiKzlKVnv/FJHT80nXuqXl4SadOwuAKx6wEFCjomNzfGOvov82eLXmGP7jwJdYWcjSjYc4mOTKMOIWZm8EmRhQ3bPauW/CRhwA6IEhGGLUgzJpF8QjsOWlpe4sbcbWUsG/D0g4FI8Jna59o9y5W/dIsUTDVW4Tf93Y+5JYGpGthVbbU/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD7/NWGgWnu84Di1S0nRsyQ80i5n971AYl8iahbHOpo=;
 b=e8Izaar7uo5/vg+yLMuPgVzJVUkVOf6GdM7KNLblx6IrAkGUbhCgg+VoTDVrsf3DwWjbZ8+ocP0GJfOpm60O3RUkz0k1LEYpQ03CX9JOiDKvb/9I7we0WNDdTravMmUfzXRSj76RrBlddnxCnGOKf/re9EnYYuibWDrf9mvOGRHY/GpJKaE7iVq2me+w6oUz3ewjD1uC7D8JWl5IITrqJ2Ly7Cvu6ldC8L2P0Vjk3Ennd/2TybreUzKDsigokfFcIWxCPpZ/DWYuKFa3a/bUClA2LSsy+8+wqP4QNlaL61IlZBThGiFBxWmIXwtnkuoWwkLMvScpA/tStqDRXZfC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RD7/NWGgWnu84Di1S0nRsyQ80i5n971AYl8iahbHOpo=;
 b=gZ4kVVU88K7YgfDoolLBCgsDVddpTBsCXrfM6B/MfRoow5R4UulstvYLYjZUw7Uprm9zLDV36zMWqPM4XtIam52g269LYBZaLWRE+FvRQBskORN0rWxYsl3nJTvuQKISzvA+Hv+kNhnWoHV3PIx9Gcr9MMgwmFhEZJTO/ySHpcw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB2601.namprd11.prod.outlook.com (2603:10b6:5:ce::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 23:55:45 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3977.024; Tue, 23 Mar 2021
 23:55:45 +0000
Subject: Re: [oe-core][PATCH 2/2] valgrind: Disable ptest swapcontext.vgtest
To: Yi Fan Yu <yifan.yu@windriver.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20210323205029.87251-1-yifan.yu@windriver.com>
 <20210323205029.87251-2-yifan.yu@windriver.com>
 <CANNYZj-V8feRiiYvEEGKRrOKgFd-392PZa8XWRMs7Qmmm8+dgg@mail.gmail.com>
 <835b0b66-1f28-ced5-c52b-7fb4516e8cc5@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <083932b6-c2c0-841b-8c34-868aaf3b64ee@windriver.com>
Date: Tue, 23 Mar 2021 19:55:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <835b0b66-1f28-ced5-c52b-7fb4516e8cc5@windriver.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BY5PR20CA0027.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::40) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BY5PR20CA0027.namprd20.prod.outlook.com (2603:10b6:a03:1f4::40) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 23:55:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dff1a704-2bc5-4818-79ca-08d8ee572c97
X-MS-TrafficTypeDiagnostic: DM6PR11MB2601:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB26017C05B5371505CA355AAEF8649@DM6PR11MB2601.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nCzjG2v7/Oy+5VE0YAOi7HTnDThdiOZFha+utxds3uhguk+yhfbJy/B8fMgf7s88JpiVivWBL3dnGVKVV3xEt2tcvMPHqDq93X5CnpmE3zn6W+L8ICYsg8BG4WpOV/pLOXned1134rxcDwZeJiVAjziTeQ5y+vyFx/nXJXqeKSgNDzqD7qFOYxAJBz3oNJveghz4OcT6xTBbQMpNs8dw/iNriacASOH2t07r7gftxnLHBa6rwb6bNSCDJI9ETkUsb0E7aHkmUnSaphpJppXCLSKORuMAK/WF9jG4PyxzQcZFaKjrAIjzVjiiKPwBX8A19FLwS94IiQDaU+pgLuqpa0GA7mDUiilmR30j15qmdL8VNr450pZ/14cdxJo2ONvvnGvGMid/urzRm1gKtbeAtnPTuzWax9ccxhQohx0mj7b+KBtkcv3eHA09bVF1UbPkEP+9dvW4RUL0eYmef0Xv/mR9rI5xQ0p2CGAVW7JZ6SecwkVX/mtpK7VLDzIOmOzxwwgxJfRdtzQz2OoQjrFM/LUCVuUi1Px7ACfWfZwEWRH7e7kQhqyMbdg7olP6LuWZUkYUC20W+tPu8U16/a1xVuTy8ZIO3uBXSg6AtcxfCw59ABZ5SnBrkSy8o4N2hPiLhHsdkAaqbpe61GqeuCO1Pdv05Vbl3MaW8tzr3axBQuiSnrZ/J+/l1YGRc/iirQLQNgTwxR8ao5DJpx4O8j7N4i0rZ++zBIgPJzgZiM/9lejn08I5LXGAdaZDoehfSYEtrRkBpBRO2Wgpk4oq42NcoR7BqnwSfo/l8Ea3JjjO61IXFi7yF5dzd1rC+3208Uhe
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(366004)(396003)(136003)(6666004)(16526019)(86362001)(956004)(66556008)(66476007)(8936002)(966005)(26005)(66946007)(186003)(110136005)(16576012)(478600001)(2616005)(316002)(5660300002)(2906002)(52116002)(83380400001)(38100700001)(31696002)(4326008)(53546011)(36756003)(6486002)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?QXpQS1JJYVBGY1VZNEkwYXEyekIveTlXeWpjUWIrbWN0WHExdFl5RjZoTFg5?=
 =?utf-8?B?YXNHK3VHaWo0UHBubGUyZEhPaGl2SmJqZmFFclRpZ0Z1bXZta0xjNGdROVhK?=
 =?utf-8?B?VW9yVU5oYXVDMjN1V3ZjN2tVK0M3MVVoKytjZ2UyVVBzWml2TW94WWc2YjZG?=
 =?utf-8?B?WjVUaWZ6NXpYblU3dWlVUHdJaVhHMUQwR2xXUUg3SURYRnZmZ0xzK1dJdklF?=
 =?utf-8?B?WEpmejMwMTdkQjJKVVJBOSsrWGxrTzlKVlQxT056aTZqYlhkSHlmczYvdVN6?=
 =?utf-8?B?V1R0ZTlWNEtJZHk1dEMyQVlrZXdWNGhJam5Cem5VK3JlUHJHelE2M2FwYlA4?=
 =?utf-8?B?a1c0RGhuS1pXMkcrYS9ZUG5mbXlZNndSTHlJbnYxcUlXQnJqd2V5Uk5SYlQ0?=
 =?utf-8?B?bk11RUJOYURNQ0toTmFEQzluM2FLU0xCaExLT2NhS3dNcjZCbjVSc1V6MHJJ?=
 =?utf-8?B?R0t3bHZwRlJPR3RyTi9kd2E3Yk01VUZCeGMvYzRPNDU4N1AzR1dXOGJ6S1gy?=
 =?utf-8?B?VlhtTzRYLzF5WERBRkxsRDQrSVBwSEtGL1V3L2o5UitZUURKeEtORE9zZGNi?=
 =?utf-8?B?WUZ4RkR6S2pGOUVLV3dkVlpydThVb1RROEhiYkpnQ2JnVm5SWmJ4QzdrTXpL?=
 =?utf-8?B?WjBYWVNBc0Q3VVlSVG16eWJPQzQwQUtRNlpQOWtBUkxJWTRIazIzNWRHTHAx?=
 =?utf-8?B?blRDa3NkZHVkbC9QTkthTHZGaFZ2YnBuaC8xcW4rUGtIMnlYOFN5WUhUNE8x?=
 =?utf-8?B?ZlNKSjNwM3VKc3dzbFFFVVRxRU1UUE5PWTVwOEtXcGNBaE9lVFVwOHVjUXZX?=
 =?utf-8?B?bGFLMjU3OEttN2V0MG9LMEJwbHhZRzV3aTNVV0xGZXdicnpCb25YakorcEVB?=
 =?utf-8?B?dXU0Ri9OdFAwOHF5TUw3WXo2RUJ4czJ1Z3JnYzRRci84S2pKeHNZQjg2b0Vo?=
 =?utf-8?B?NDRsRWUxWVpsOGFLTUdVS1U3Sm94R25YTktaVlYwS2x2VGxsWnlnT1U3RmV1?=
 =?utf-8?B?clFCdm8wOGlpNXZRT2xjb3lyZjNxdnUzaUhYZ3hTV1hzNHlZcFpodGRVTTVz?=
 =?utf-8?B?TkhxRG9hbHZsT2dzQ1padG1tdVBPMG4wRXpPbS8xdStwZGMyWjRBQ3hrUzU5?=
 =?utf-8?B?UmVLcS9NQ3NIR1FxSWdaeWMrdnI1R083YmJIdnJ6UHNqYnIyODR6YnZDUk5E?=
 =?utf-8?B?OVRkTGZRRVBvZEhQMVJuZkJpWXI4MnI0S1E2QnlBbFpvMmdvd0lzUzFqajBJ?=
 =?utf-8?B?S0R4bGhWSS9NWGpDM2FUZXVRbkw3d25BRnY5clIvWG1jTUhXUE9UaEtEYnZV?=
 =?utf-8?B?c1JoOVQyYVA2cVZSdk05eldyenJwSmxmc2VhampPQnBVbm00YS9sY2FuanhK?=
 =?utf-8?B?NUJ0eVRXdlg0blNaaHRDSjRlRVF0b0tPclUxKzJkRnVSUS9iZDRwRS94S2RC?=
 =?utf-8?B?Nmc4ZkZOU2hrVGtZT3BDWmExS0dEQVE3KzR5OFBlVndsdkh1d1I4cFE1OS9G?=
 =?utf-8?B?M0JWbHYrek92M2ZhUjg3L1pKMGFhNlY5bDJlQmtQOUplalh2RDhUZEttRFdF?=
 =?utf-8?B?MzlXQmp3a0htWU9iVnlDcUoyMWpoZ1p6UFVmdFpXRzBiOWxmN0hHRmpKUDdn?=
 =?utf-8?B?bUlUVGN2ekJEQjgyZ25iUDFOWlNQMVp6QWlibCtNTHNZaU5wWW54UnlPdzFh?=
 =?utf-8?B?TXBidzFBOHoyZUtUUEJnK1lIZGFWYmRZQTZaK1NIamlUWEVKMzByNUhCUDly?=
 =?utf-8?Q?0UkwqCeS8ULFaj/IO6zmE5HkISV5J9pYq3yPO8z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff1a704-2bc5-4818-79ca-08d8ee572c97
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 23:55:45.1714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ElSEUkIlgSLC3ghtVccFVvm2Emn9QXUowz66ms19fnImfeDz06EPg0EJvhl4E40gzTP+PHU5dclfNlOtNwGDq3Cij3wY6alRd9oZcDDjU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2601
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-23 5:17 p.m., Yi Fan Yu wrote:
> On 3/23/21 5:07 PM, Alexander Kanavin wrote:
>> [Please note: This e-mail is from an EXTERNAL e-mail address]
>> On Tue, 23 Mar 2021 at 21:50, Yi Fan Yu 
>> <yifan.yu@windriver.com<mailto:yifan.yu@windriver.com>> wrote:
>> New test introduced in valgrind 3.17.0.
>> Test fails on both qemuarm64 and qemux64.
>>
>> Fails how? Did you try to build valgrind on the host and run the test 
>> there? I am somewhat concerned that we should not be simply disabling 
>> failing tests too quickly like this; the very point of ptest is to 
>> catch and address regressions, including newly added tests that don't 
>> work.
>>
> 
> it passes on the host (relatively recent archlinux build x86-64)
> 
> I just checked on qemu and it miraculously passes.
> (it seems to be load dependent)
> 
> My recommendation now would be just take the first patch and throw it on 
> the autobuilder to see if this particular failure can be reproduced

I had asked Yi to disable the one failing test until we understood more
about it and had a fix. If people prefer to drop the patch that
removes the test, that's fine.

We'll fix the new test over the coming days/week regardless.

The changes look good to me.
The test results look good to me.

Yi, if you have it, can you reply with the buildall-qemu output
for this update?

Good work!

Thanks,

../Randy

> 
> 
> 
> 


-- 
# Randy MacLeod
# Wind River Linux
