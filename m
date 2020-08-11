Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.62])
 by mx.groups.io with SMTP id smtpd.web11.10584.1597134063745472576
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 01:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=opDgJAWI;
 spf=pass (domain: windriver.com, ip: 40.107.220.62, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh0CqIZelI6OyWedF/sZGGSuyCKHrRSi4KoCItCI0+d/AVZxBsXyJvFkh+tA9qpxeBXc7B+KbYjXlnInPMqm/JE0xqu1iHwpIiTIRVBLhIZ/jQKn6FnnYYpikvbWm+uzr1AhhllHlUDljnS1PK5s/0l2IzR6jFPLHHBYSS7ft17CS/o8aOML0wTVlOK3OaGh3kkHn/bGZ4MJ+afV89+JK4Hds8tvF0+ufTJWWmg77ihS8981xG4n0LCuX9yJtp4UjVjeGLik5Anem5NTRn+M5Pp1QIbH1+pLfHYEb3MORruZlUQY3g7gZVtxSrOm8/T7ya6D6nF11BDkTekaWNsw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMgKC2BdNbR3vziapZDaIRAmcnDuQcCdvv3ZQAmqZ70=;
 b=CyWDCzGk+fd/+qXOU2luWtr6ZM5xHs72pfVUvNrbjNZHC5qPUmjDa0wDuqt/5VGwRh1CKuI5uU+zz1PtdoFkLPBSiIAmvZUklKfx5F5lJQ3jilmvIQ1fJxjZcXJvyf/7mDYIEVxCwvJyXiftGYbgClcVgbamikPs2dy2ys3YKpRejr/73FUIYJzHlD5d2ECcmaM6TC83Ws+22hpD6WMZcLSBV88qgAK6UfCjjJRWsEqzl6I5Ygfuc54iBGVLKEAqQCXTR0XkoSVaSx7y5yFm9fo6eC5nN/vWgOeKYRfmQbTj22mOEcfyfRYVdyFJY7iGgtv07kVuZXcF73/rv+yieg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMgKC2BdNbR3vziapZDaIRAmcnDuQcCdvv3ZQAmqZ70=;
 b=opDgJAWIBDscrLc20fsfSvMespqtwbI6hfYK6j1uq5EWA0Ny4Cq65ssPk6yJIH3TWSAq6YkCYAlCTA6W/o/ouYnvOP7hz5bzBpTIR3xbsaZ/Zic9XlFDHh79MMaCbda2ReGAExYzOwyGul2dgKy9HbMvivmYOBfN+BcQP2NKp00=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 11 Aug
 2020 08:21:00 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::19f6:49b4:700d:c360%3]) with mapi id 15.20.3261.024; Tue, 11 Aug 2020
 08:21:00 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: set the default pigz thread
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20200811072258.4074290-1-mingli.yu@windriver.com>
 <2803933a96d0b791c8cad542bbfec3c3dd67eefd.camel@linuxfoundation.org>
 <ae3b1594-1a8a-4a77-e777-03d7c6d6060f@windriver.com>
 <95b06a10d29546555e1a0064cd5644018bb90006.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <34eb245d-d69e-44e8-8563-630cecd94b10@windriver.com>
Date: Tue, 11 Aug 2020 16:19:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <95b06a10d29546555e1a0064cd5644018bb90006.camel@linuxfoundation.org>
X-ClientProxiedBy: HK2PR02CA0222.apcprd02.prod.outlook.com
 (2603:1096:201:20::34) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK2PR02CA0222.apcprd02.prod.outlook.com (2603:1096:201:20::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend Transport; Tue, 11 Aug 2020 08:20:58 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45e0506b-05e8-422e-5814-08d83dcf7aef
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3816303DDED7D7C90679BAE2F1450@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cVg5u8lf6xG0lBb0+zLDu8AwXbdkbZVHCMR1MVPmL7Gy74+RFgzpiyL+o8IEKJQ+1EMMt02lWQQux1wxqtrniEc4Tvpwin2qxiylQ6zA1K5Fpii1yFLqviOkB+3DOGM429d/mxZPyBjUNe9OiClyZpxhgfFGPPgMI8FWU/SY7lmTMlYKSNxcNBN4KubdHcHUnlCs1PZdS8szLCV/sP0xe3cBbZ5DQDVwUMajlx1aDIzOfKzBGsDYPPjsFKSTaAjzzEb6hGiLoP74q7+SjWRpWsBO+LF2iBToYLRvIWGgNNGk8KaGZSNYRw9bN/fR8DOo2RaeovZtreoC6laxm8Y2n8DZUYloi6sgIDZly+z1gOzgeqj/OqMGduU44qBw8Hui1RAnJ6U3/JrLTBYT+1JYl2KB7X6NNwZyxwuQNf0isvw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(376002)(39850400004)(396003)(366004)(31696002)(2906002)(53546011)(26005)(186003)(16526019)(6666004)(6706004)(36756003)(66946007)(66476007)(66556008)(86362001)(2616005)(31686004)(478600001)(5660300002)(956004)(316002)(83380400001)(8936002)(16576012)(52116002)(8676002)(6486002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	rXpjLuW+tTEtumbtvMj5mbGVyI2OxXO6yZaNJN2zhAue4+Rb+mxwRR1lZykJibaD0vo1h6Uq9uSZTbDi3S49jrO6EMJ08DN35qVu/49cV/8G2FqAj8eGdmJBtRQEUgCarSdWHPwV03Ku7eGYXxDpdsplIoi+HuR2EN+g/SHbo7xnsK1P2zwWECuiPQ1qtiaY+4XIXFGONLbT4wH9CAcLmiN/2kTSDTLhXNyJxIr2TwiMrZ+uE0SoHhCiLmma6dQ75RywlZc2wP5jClZHy7krOlEvYx5pTWeSW8LGrvb5rbFgdawGRmhNTf0QNIlkEMFyHU/y4/LLkNWfaGAY+0V0qFNjSvLA1ZufqKGRlZOJbttzhMxvU+fPF33aJzntR9f1uAa2nLmCmdJoYE8dzV1FG86ojlU+aEGFYQ4HecFWarJAb4gkirEgvTpH6gdK8SJuv1px1FQKIocJ6uME7sklbja/TG0atAUCgahinVVLAZuMpWzp2oskCm1x1mzX6zpzx4HBEwfVSKOs7o/1laA3w5ZMBUpFiKQ+YDBSNDmUGFu1/j/sHgeN3WsmlzfLbkWPxVTSYCvoT5eDW4DtsOxhAAhYi86QKAdJe/KOq97gwAUNzSp8MSuI8R3MHDK+E1C+S+yZD7IX1kyXS4yi8jAaeg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e0506b-05e8-422e-5814-08d83dcf7aef
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2020 08:21:00.4534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o6Ga/FHUc+vgm6IIZ1e1GkuBKHQOyUvnAt79jfW76JDg/LIoT7JJQvQ8sO+hWuB75wlRJrj7s9/2Y0dRSC1/0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/11/20 4:19 PM, Richard Purdie wrote:
> On Tue, 2020-08-11 at 16:09 +0800, Yu, Mingli wrote:
>> Hi RP,
>>
>> On 8/11/20 3:57 PM, Richard Purdie wrote:
>>> On Tue, 2020-08-11 at 15:22 +0800, Yu, Mingli wrote:
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> pigz, which stands for parallel implementation of gzip, is a
>>>> fully functional replacement for gzip that exploits multiple
>>>> processors and multiple cores to the hilt when compressing data.
>>>>
>>>> do_package uses pigz to compress data to speed up the time
>>>> if there is pigz available on the build server.
>>>>
>>>> But for some big package such as clang, there comes below
>>>> error during do_package.
>>>> gzip: stdout: Cannot allocate memory
>>>> tar: TOPDIR/sstate-cache/20/80/sstate:clang:cortexa57-wrs-
>>>> linux:10.0.1:r0:cortexa57:3:20808f8a746b00ec9470a81057c8595d878cf
>>>> e8c565cfbcbbaa3ea870528ee34_package.tgz.QF5dss8M: Wrote only 8192
>>>> of 10240 bytes
>>>> tar: Child returned status 1
>>>> tar: Error is not recoverable: exiting now
>>>>
>>>> So set the default pigz thread and the user also can customize
>>>> the pigz thread such as via PIGZ = "-p 3" or PIGZ_pn-clang = "-p
>>>> 3"
>>>> for the individual package in local.conf to avoid eating so much
>>>> memory.
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    meta/conf/bitbake.conf | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>> index 353caacef9..bc87e78d78 100644
>>>> --- a/meta/conf/bitbake.conf
>>>> +++ b/meta/conf/bitbake.conf
>>>> @@ -804,6 +804,9 @@ XZ_THREADS ?= "${@oe.utils.cpu_count(at_least
>>>> =2)}"
>>>>    XZ_DEFAULTS ?= "--memlimit=${XZ_MEMLIMIT} --
>>>> threads=${XZ_THREADS}"
>>>>    XZ_DEFAULTS[vardepsexclude] += "XZ_MEMLIMIT XZ_THREADS"
>>>>    
>>>> +# Default parallelism and resource usage for pigz
>>>> +export PIGZ = "-p ${@oe.utils.cpu_count(at_least=2)}"
>>>
>>> Why not just set this in the cases you need it in and leave the
>>> defaults alone? You can just export it in the tasks which need it
>>> too.
>>
>> Actually I just want to use this logic in this patch altogether
>> PIGZ_pn-clang = "-p 3" in local.conf to limit the pigz thread number
>> for clang.
>>
>> Without this patch, I think PIGZ_pn-clang = "-p 3" doesn't take
>> effect.
> 
> You'll have to use something like:
> 
> PIGZEXPORT = "0"
> PIGZEXPORT_pn-clang = "1"
> PIGZ[export] = "${PIGZEXPORT}"
> 
>>> This change actually makes the sstate number of cpus specific which
>>> we
>>> definitely don't want.
>>
>>   From my understanding, the default behavior for pigz is to take all
>> online cores, it should be the same with  export PIGZ = "-p
>> ${@oe.utils.cpu_count(at_least=2)}".
> 
> I understand why you want to do it and what it does. It breaks sstate
> signatures for everyone else though so it is not acceptable.

Got it!

Thanks,

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
