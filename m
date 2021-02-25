Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.61])
 by mx.groups.io with SMTP id smtpd.web09.4676.1614212624222678956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YLnYkX4I;
 spf=pass (domain: windriver.com, ip: 40.107.236.61, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O2lQ6V2gDutMWV+4zCUs8aJ86EdMSZYHuqAD4i7Ym+hCdNh41o01Zj/+RagrZFMGMcWGZCbSLh9qRXKxT4CMk9MzNBST3iHgelJT85rxks6NIXLymabGHInPpl/I9DuW2/eiY+cG+m9uyG3/a7yC3aOHehXUKOoKleMOoyhWwRCfgWNGfjn86sKs/CbvHAkBlZYFTMoLlg1tDDPa+57pRJArx+eMLDk6OQQRElz0F7Vt2YWdn3wWGTU1adknwvRnOpsNZd1RkLgYwfwksYZn5s8JTZGf4jqbn0qUKxcweWrbGDqn2jdAUv0gdkSet9sZEi7uA5Ft2FPOs/UcD2tEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnWaCr1v76XlYFsqb9Rruex+CIQsJ92DhaDY/UP7y9M=;
 b=ZaYEQt4dUBpQPTvTXQacTCA+P/ctBS6SSaCiwPFqeC2pNqLiBfTVqC5WK4sS4DUseOYzK3r11JYx0gsW03JCCuMR6qX0I2j2g/vtjNjNhCggL5VNT6tK/yLTKR6ePASCNPMpCJbgVTd4TJgjnhxR3+1Elf02/C1fZNYPfjTh3DtSdBRQWfJJCfxO0cqrt+1J/eybBQWmXzDJ8fQ5+i8LXiWdkQUSUurZ5iOo26619g75SehG3NmSK8n+h07f6fecAZSKHq36IphwkRQsTlsfkdLTPMN+1S+lsiaChWm0085TiJITwyW2/3Q/r2vrwjDZX8CsbZEmdstf+QbNdRROTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnWaCr1v76XlYFsqb9Rruex+CIQsJ92DhaDY/UP7y9M=;
 b=YLnYkX4InpK9MauJ/ix70dOFUI0R8A9YIt+l1BBPQCV+PSn8HcEwBbvC7J7yTy16oSSgOOst+MG56V9rD+SPaDpNXYiqZszGOhxYFFaJ4rEnduA/e0atDIIAAMNi2HaKtpHK4SaKP9dyXkbj3hofpqTIlGdq60k96PwQLBLXsg0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4155.namprd11.prod.outlook.com (2603:10b6:5:19a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.39; Thu, 25 Feb
 2021 00:23:42 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::8e2:471a:7b63:1a0e%7]) with mapi id 15.20.3868.034; Thu, 25 Feb 2021
 00:23:41 +0000
Subject: Re: [OE-core] Current native SDK glibc compat
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Anatol Belski <anbelski@linux.microsoft.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
 <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
 <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
 <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
 <ce2c3ea0-891b-8c7d-e89a-590fcd7ab12c@linux.microsoft.com>
 <2961052af2e2429d0a8e2a5a26f8a0c929033794.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com>
Date: Wed, 24 Feb 2021 19:23:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <2961052af2e2429d0a8e2a5a26f8a0c929033794.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR13CA0205.namprd13.prod.outlook.com (2603:10b6:a03:2c3::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.11 via Frontend Transport; Thu, 25 Feb 2021 00:23:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3de6ce99-10f5-4736-8cbc-08d8d9239abb
X-MS-TrafficTypeDiagnostic: DM6PR11MB4155:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB41556071082E32E8312B7DDDF89E9@DM6PR11MB4155.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D2rQJJx/GRvg9muEEvRR/OfOPfvKUkVaaRB74Brtz7WfZdfIr48IqiNBp6MWnCRLpXPoe6NutHXCw6iFrefxI05c2KcJKfQBrAEVRIM9dAOcQPUy0pjTCGB+4VuqnOn2UB7U9421LIwTN379mHQXhJB2ctD2Onlu/o8nbIR2M62MUc5KyyHqiIqMwQ7DF7oeLs5U/ZX1HtUDLjrIaFEy3wKyf9DrQ3Hd5pSQ50YoFXx/LPpTST3PDxOBbhE2LLjcamnc3TjPgNHWIiZbd23vLWnugFqwPLoh/co8gaPuVcCtrw12DzvmeaEFtnDBXv3p/+8uwxuYqhW8vrOlbhEVkcaJMRHNkO0XnSD5bupDz8lyx/aAOVI4yAhYr5w7khmJ2hH2ijTTh67IruInroLt98cp5xEL6cyWbmanX/d8o1/aBZfUFENMK5kaXi0etiq/yOv1KMyTpcUILkrnrcClfDcaYLwVjggi3+UllJnA+gi/RWwf+vjK/qvybHtpJsWOUpAwxgjDmmD46Of1qHXgd9gCydkmqSAvixK4dq6HrGnihe4cxitLwTR1xxzyLU1/5odWdVKaPBlKqClGzomk8TDej/1deIkHwzluYd3AcZg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(366004)(396003)(39850400004)(16526019)(186003)(6486002)(2906002)(86362001)(26005)(110136005)(83380400001)(66556008)(5660300002)(52116002)(2616005)(53546011)(8936002)(66476007)(31686004)(8676002)(316002)(6666004)(66946007)(956004)(16576012)(478600001)(36756003)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?bElQdWNwN2VpQWFsKzNrWU0xdzIrK2tUNWxvbVArY3VQUHlwTVplUjJHdDBz?=
 =?utf-8?B?UWVONm5WVkpTZGFHdEtjZ3Jkck96MzF6RlFUU2NuQ1BtTnpxeWg0eEtIVTBa?=
 =?utf-8?B?dy9zZ0czVW9nQTZFOXRGaDF3TG5zbkh0T0RUZXUwcFpROGl6aUduRGpOdE5E?=
 =?utf-8?B?amZDanVYT2F5TEh6T0tTMm1aUEhZc0FjWjdlOS9tMnpCcjlmOExwamJ4T1FZ?=
 =?utf-8?B?YWZ2K2JzckZVU0pzNWdZNTdHaEZrT3lLZFVnd0pCMlFLeDg3cUxiUWRFdXdq?=
 =?utf-8?B?cDdQSitFcm9FaDBoZTFWWmRzSVFGWlpyakl2WTV2SFNGZ0RPY2xUZzF6cTl4?=
 =?utf-8?B?aEM1eUJIRXFXcDdDRjIrSVl5bVh0ZkJoaloyV1Q5bkVibzVkRjVFaTJHZ01Q?=
 =?utf-8?B?RGE4K1hlTEZaUVdOYmFZZk5HM1JHbmxRdXBtR1NyMEV0YWg0N0xUbWJxeXpU?=
 =?utf-8?B?YkhkOE5Dcml5Mk9BdHVYR3QzemxJeDRQTEpMRjFzVEZLbmNtWFBGc2ZyZm5S?=
 =?utf-8?B?cVllMUVxVTdEa2FpK29FN0JIWDM0ZEJaMThKTWtHT2RkYUpVQ3NWYnJYSFhv?=
 =?utf-8?B?WjFrUlZUM2xNNkRSdnAxUGswbVpwYWhBSlNYNG5UL2JFbEFwTTVNaXp3QnJ5?=
 =?utf-8?B?ZUhSYVY2Mm5VSGs4ZFVadUxSaWFIK1FpUWQ2cmVFRDdDalpoaitBcnVFdFVF?=
 =?utf-8?B?OTN1blNKUytJWHJXc3dlaTFmWU9ZZyt5UUVPQTBuZ25TWWtEbGpYanpVNWhk?=
 =?utf-8?B?YjFLZ01xQmR6Z3RiR0w5WEErWEZ1RmxXZTB5K3pETkFIR0lSUkZEbkVtcmlG?=
 =?utf-8?B?QWEwaWRUWVFBaWs3MXNqL09vaExCNGxzTGNKalliQ2dLdlVENnJveTdMZnAw?=
 =?utf-8?B?VVdQU21IdVFKbVRPTmRZMFpaSUlPRThSV2RtbmkzRzh6SGRVbkFqcDgxODhl?=
 =?utf-8?B?WjNlRDg3WEN5UzIySWI4YWJXVzRsMUhodksyZUF5aTlHT080RGdobUtIRHNO?=
 =?utf-8?B?RGhib0hBRzNZWk5Jc1YwWXIraUJ3MjUwaTY5dmE4ckI2VDk1TlRBRTgvOFNj?=
 =?utf-8?B?TE9GTUJhenBYZjZpNm1TbE9xYmhFOExxblJBS2VSN3IrWjFDdnRYQnV4cDJx?=
 =?utf-8?B?Mm5BNWJCVXB3dHI4RlVlMENxMENtQ3lBeFRlMnBnT3NKN0psNjNRM0gxaGkz?=
 =?utf-8?B?NnpaS0VkVEE0VVA3VGNsRkV1WmNtcEpGQzBvSVR4RVhxNjFwZGxHZTRPOHcz?=
 =?utf-8?B?UlhzdGIyZGxGUlJsVHFkaDJocHFCNytYQlltOHZkY21vTkNLSEpkdmRqYW5x?=
 =?utf-8?B?TThnM3pXQk9PaklNUnpQSGJ0cTFGcWhibXgrVk4wdjBDNDI1RWUwQ1pqNGxp?=
 =?utf-8?B?NkNJRkI1Tk91MFFkeDFJVExIYThKbE5KMjBSZ0tJdWI1YTVSY05COEdtSzNn?=
 =?utf-8?B?eXdEY3FEOXJDR2N3MGdubit3Wm5BVVh4ZG1CcmZtN3R2cWJXeHZ3WFY2SHFi?=
 =?utf-8?B?d3FJL0x1eHROZ3pkd2lDSXBvOXNrRzNHQjI1NEFoVVlBcGFYa1o4VVlQWEZB?=
 =?utf-8?B?VkhuRFJUMGRiZUJXcC9YaDVLUTIzUVZ3TXdnSjR1LzMyL3phZ1kyK05Wdkcx?=
 =?utf-8?B?QlF3N3pnUUhXRlZVU2crVGN3Nk5sTHg0Z3RBQ0h2Mjc5ZUZUOWFSWVR2Yzkz?=
 =?utf-8?B?dFkycW5CU3RRa1dWTk1sZFFwR0QyVFpCY2dCUWtxbGZoZTRyZHZ1YWVwZldh?=
 =?utf-8?Q?YboO7lDdtY6iUV7MJsHO7CIMozkn/9pLRYy7dTc?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de6ce99-10f5-4736-8cbc-08d8d9239abb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2021 00:23:41.7159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpHfqo8/UjV/JaSoCbji9YDA0dDpNjDx58f4YRLY9MRhql2OYVqVnA7j1lAUA3ST+oXfbGxV1r5oiDCcwEz3og/HZnNaHPzflspptH35yIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4155
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-02-24 6:57 p.m., Richard Purdie wrote:
> On Wed, 2021-02-24 at 21:16 +0100, Anatol Belski wrote:
>> On 2/24/2021 5:49 PM, Richard Purdie wrote:
>>> No, I mean the dynamic loader pointer.
>>>
>>> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative python3-native/python3.9 --print-interpreter
>>> [...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>>>
>>> Above I'm showing that a native binary in the build (python3-native)
>>> has the interpreter (dynamic loader) set to our uninative ld.so.
>>> The SDK is similar.
>>>
>>>> As the binary where the issue was sighted has this
>>>>
>>>> $ chrpath $(which cargo)
>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo:
>>>> RUNPATH=$ORIGIN/../lib
>>>>
>>>>
>>>> but then, the DSOs have no rpath set, eg.
>>>>
>>>> $ chrpath
>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1
>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcrypto.so.1.1:
>>>> no rpath or runpath tag found.
>>>>
>>>>
>>>> so it might lead to the interferrence with the host. Does it perhaps
>>>> need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries are in /usr ?
>>> Our dynamic loader knows how to use the specific sysroot and then
>>> fall back to /usr and /lib.
>>
>> Thanks a lot for explaining this.
>>
>> Getting back to the initial case led to the question, i'm now able to
>> check what is the correct dynamic loader:
>>
>> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative
>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo
>> --print-interpreter
>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
>>
>> and also could use --print-needed which would be similar to "readelf -d
>> ", but it'd be still not possible to check things at the runtime? OFC
>> knowing what i know now, it's possible to locate the DSO and check
>> symbols like this:
>>
>> $ x86_64-poky-linux-objdump -T
>> ./sysroots/x86_64-pokysdk-linux/lib/libc.so.6 | grep GLIBC_2.33
>>
>> just seems the catch points are quite subtle :) Perhaps there could be a
>> recommendation on a good way validating the binaries in the SDK HOST part?
> 
> If you what to know what a partiular command is doing for symbols at runtime,
> you can run it as:
> 
> LD_DEBUG=all <command>
> 
> which will have the loader spew out a lot of information about how it is
> resolving the symbols.


I had other things to do today but for 'fun', in the background, I took:
   poky/master + meta-oe/master + meta-rust with Anatol's SDK commits
and bisected poky back to:

   7b8df042d0 (HEAD, refs/bisect/bad) glibc: Upgrade to 2.33
        (From OE-Core rev: aa87638cf4f2bef66df92f961c7814f6b482fd3d)

This is when I expected problems with the SDK to start but
I thought it was worth confirming mechanically.

Note that the two last bisected commits after the uprev of glibc fail
to even complete the populate_sdk due to the error:

    ERROR: core-image-minimal-1.0-r0 do_populate_sdk:
    The postinstall intercept hook 'update_gio_module_cache' failed,

Once Richard is happy with the basic meta-rust merge, I can spend more
time and actually look at the linking and debug what's going wrong
if Anatol has not figure it out before that.

../Randy


$ git bisect log

git bisect start
# bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
     diffoscope: Ensure rpm is configured correctly

git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
# bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
     diffoscope: Ensure rpm is configured correctly

git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
# good: [77d9b5f02aec991540926fe144076e122c17f64d]
     pseudo: Update to work with glibc 2.33

git bisect good 77d9b5f02aec991540926fe144076e122c17f64d
# bad: [b6018a1625c22393c1f94e9d23d84f7842b95f24]
     acpica: Fix reproducibility issues

git bisect bad b6018a1625c22393c1f94e9d23d84f7842b95f24
# bad: [7283a0b3b6ca49d0d2e13593333a580ef10439a8]
     bitbake: bblayers/action: When adding layers,
        catch BBHandledException

git bisect bad 7283a0b3b6ca49d0d2e13593333a580ef10439a8
# bad: [c5d80f154de30a6f59f28d4d9d05edcd78469765]
     selftest/reproducible: remove spirv-tools-dev from exclusion list

git bisect bad c5d80f154de30a6f59f28d4d9d05edcd78469765
# bad: [adcd9608a725d99e2e6ca74d4a31e6edb353af0c]
     bitbake: hashserv: client: Fix handling of null responses

git bisect bad adcd9608a725d99e2e6ca74d4a31e6edb353af0c
# bad: [071f23ad79ac37743d97928f92ded0da61ba9e63]
     bash: Disable bracketed input by default

git bisect bad 071f23ad79ac37743d97928f92ded0da61ba9e63
# bad: [8e3b42f44217c9f868d6b8bd52808d357b516a2b]
     glibc: Require full ISA support for x86-64 level marker

git bisect bad 8e3b42f44217c9f868d6b8bd52808d357b516a2b
# bad: [51cf44884971d6fc919f2a799fb08ee61acf7518]
     glibc: Enable cet

git bisect bad 51cf44884971d6fc919f2a799fb08ee61acf7518
# bad: [7b8df042d0c175388d6230f008b1c83d5c5cd5da]
     glibc: Upgrade to 2.33

git bisect bad 7b8df042d0c175388d6230f008b1c83d5c5cd5da
# first bad commit: [7b8df042d0c175388d6230f008b1c83d5c5cd5da] glibc: 
Upgrade to 2.33


---
> 
> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux
