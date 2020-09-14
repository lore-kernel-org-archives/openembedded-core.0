Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.84])
 by mx.groups.io with SMTP id smtpd.web11.55053.1600062491631600302
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 22:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ohkioZbZ;
 spf=pass (domain: windriver.com, ip: 40.107.220.84, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY/rHaR04GJkiafJltZ9xjBAC19SpKVbrjr7CoCPqcTFp9XUBsXxWLfILMPkqdlNKA+D56aItJEB6KUCWEJUm3E9dAmXu2wChlfOncn7xNMdGwV7zPADQXR3u4xEC+/uZQEXQxRP9gePjOs0oU7dAnOVz7+ZBmZcB0zsYEXCi5+KQ3scT9ZFOng0BcbjAe/+vIPlGNE0CiYYACjpNDLSPQ2lR6X8j30Z/uz8LInE2VrTm/gN2dYHb9MzEqrULIldLY2QpB+3hJE8qSHokkaQlgr2A99vNRx5qPeRfnmTPKY0OAXhrv9fu5REkt4zvnreudEUYOPN3/Xi96LEHMGvnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0hHhttW2tPypxMntmMtpHp5qgt+kkvqyZx6SFpoMWg=;
 b=N3QylW3IMX7SrVLgcFcGs+Y8LXiqAaSkpOBKK3Y3Ap71MI0LnvpbimY5KQLMfhlxTwRk6IRbw4LGWMatXNsvdgzpAgnCmY+MRtWPpdAgb4RL5CjxwQ+Yx9k5vsO2IEYXHDYN+4YtWIKE4M7YeGQN0z1JZoaxP1wMFootxK5hu1O7KWV0ATJwwnWsvYa8Zyzka1TXQGQgTI2WpXOYhbQrcej8nt2ExWtkDzeGHX1Tcfx7lqmehHDN0+YD3xgdZ/iG0Gqk39XAql+kQLZzjCNfdQhEXhqvf4HZP6051Y5ecwZCglqMMCif8fVtVBtEbpwBCa7DbBePVPk45yi8gtFQQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0hHhttW2tPypxMntmMtpHp5qgt+kkvqyZx6SFpoMWg=;
 b=ohkioZbZE/nNUBJiW+39frrjgj2l63NV4CyNiGkRL2uZP4Ug0UwhnM1mfZwttpvQy0Peg64WDDCbLbzCYloyCtnddR2RppsPHPwReLVWYgxII1Ru5KJZ1JKopS5aXbDAX6cTUXUJTaOeu5XcEpYmqmkeNnGmwFhH0uJWzEZxr08=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3670.namprd11.prod.outlook.com (2603:10b6:a03:f8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Mon, 14 Sep
 2020 05:48:09 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::fc6b:8198:e199:c0dc%7]) with mapi id 15.20.3370.019; Mon, 14 Sep 2020
 05:48:08 +0000
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
 <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <3d6f9248-f819-debb-0d71-de29ee312ead@windriver.com>
Date: Mon, 14 Sep 2020 13:44:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.20 via Frontend Transport; Mon, 14 Sep 2020 05:48:07 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce5c9f27-50dc-4a4c-8583-08d85871c243
X-MS-TrafficTypeDiagnostic: BYAPR11MB3670:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3670D63593D02267FFF6BFA9F1230@BYAPR11MB3670.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JD37Jn+j8Y5LWqPT0ADa6F9Kjtyg4e3vC567dkSjWIbcD0bdvL14kA9XyykW8R+Mke50QR4eRO1rqT0fkRaiHFnf+JRqeTLPR0zz8CCfWvtmM5iXMq8m9pxY7N/9IhBXy+3dFxrm2fHVy7mCuX/eiXPldbgtmTvg7gFTIpuPAsoH/it/zuaSz07VzOfPkJbPwCanRpFBA/ZTBVJNTyBX4bd/4TyONuVimPaaKkCReSrGUE+ofzdfw9p++AU7iYTiHBPPKGVhdlh8YdAED2BiIKa5JfJclnubh3SyXRyGxhgmOIlPPTwWxoHecD8cDD94/co0OJBhaTL0TIC/uCXaiaqQJxuWczdRy2en04w0pUDw84biBIG/LYhSD07wBkyUNkZVaypGWYlHZhSpoKbf2cKyPWSF0KxwnqdM3xuvIYiXHRnbaMnJ0rrGps1rtJqJ5uzplI98ZSrTaMD/kZ6MmlL0EKdqfMMH9x84E3ffXU8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(366004)(346002)(136003)(396003)(16576012)(316002)(26005)(186003)(31686004)(16526019)(966005)(6666004)(8936002)(8676002)(2906002)(86362001)(4326008)(31696002)(110136005)(52116002)(478600001)(83380400001)(66476007)(66556008)(36756003)(53546011)(2616005)(956004)(6486002)(66946007)(5660300002)(6706004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vSkcG08voTSsEzhu1Q+Pcxuo1z2F8/7mZDGpGJ6UrIH624r7WrPqMUThiju9TLnfDF8k+AskaTEuQBTU5y1phv0iWb6jJNS3095+sMvDs0ni7n8QwKQiWxZ1BwwVfsu4mlUUTKsmhH4d1x/aKotJgYrrej7TET7QXpKGrjImrFpro6Di/UluJczM2zzpTn7kd0q5E3eYW3TtU3E2rebRqMJbczw3hZ1+KWCfT1XaeqUdQ1FqNUGnY9/xTRxrwiVwZ98i8WTOPvRl3PIwhLu6F9YUHiAKNUSyvPT5rV35MNJOaSHa/fMQNmTVpYqSW0ENILOZCYOKCzmsdzSIL23gMCb6oToC/s4veKfdtjSgQOYas6Mvq7mytQYmkmoM3Fm70KkrDVlEO6sH7OWv+nNK2tOIPAxP83hrxyxvVDMA6uOb187wUHOvZwNPovXa3zwPBvDWYWW+pScWgEA0LBFmbGUKXxdL9pkXQYYKgaTf0YgMzmZpdVZ7c823qu9O48Qp1Fd5hvGCeuhdxCeeakmYfA+eGQ7ajCPq4RtLjlLhIIAH+K/rFXYPy1WH3Kbws6U1XHcJAlLJ1F2TYFpP5tHJZw1TZyis9A+6s1B2UL/5Q5IGuecRCuOpr+HfxC/MaOSz8VuMDZAX6s3CpWfvKiFUPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce5c9f27-50dc-4a4c-8583-08d85871c243
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2598.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2020 05:48:08.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsZbTScbI1dL6L6iizpxKH+yoJCao30m5qddLuIZyqY0dhbkyAxZZBseodgOebJtvmyLUbz8s5Vtp0c+wKUQqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3670
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 9/14/20 1:26 PM, Khem Raj wrote:
> 
> 
> On 9/13/20 6:50 PM, Yu, Mingli wrote:
>>
>>
>> On 9/10/20 6:41 PM, Ross Burton wrote:
>>> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>> +Upstream-Status: Submitted [qemu-devel mailing list]
>>>
>>> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=unknown_lock_type&submit=Search%21&idxname=qemu-devel&max=20&result=normal&sort=score
>>>
>>> doesn't find this patch, can you link to it please?
>>>
>>
>> Hi Ross,
>>
>> The link is
>> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html,
>> will include the link in V2.
> 
> are you compiling without __OPTIMIZE__ defined ? qemu may not work

Hi Khem,

I didn't especially customize something for __OPTIMIZE__,  could you 
help guide where to define it?

Thanks,

> without it.
> 
>>
>> Thanks,
>>
>>> Ross
>>>
>>
>> 
>>
