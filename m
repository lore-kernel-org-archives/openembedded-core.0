Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.42])
 by mx.groups.io with SMTP id smtpd.web12.2315.1591755522736838041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 19:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QBTim/TL;
 spf=pass (domain: windriver.com, ip: 40.107.237.42, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McIFLrYmlWLX1yR7XZr3uB8+wmLQdxl6tRczRcWLJIuPAdAUIJRDwBjCFHseYB4zcASoVdwkG9x59jPkF+9dSTNcC6ZWPm+VNOLY8Rxmzj0TgJeZlZCpid10Iq+pzqmJ8MUWB8llKgyPYqTdBoeYBUOOmrwDd00SJ6O9boz444h8qa43b1QasWHkRHkW+mEIUpAY7eCNihA7lyYH628qWXrZAxLK91D5DMiVbv5Mlp8saoepNhuBAj4FEfIQKTG33MHq3NCSgLo5T2Il5dlvvC+Y+BYYSObW1w28Gr5SIW1SJbeucjA0Pgo95FlJvl+BHMRio2tE87f6IwyYBRDYaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsSEnMSm5JpKLhAl8WLBwVhfMOg8Oqii78dCWN+3dmc=;
 b=nvSDyeCoUyOdsitTeaCJpXciCqzEsJblncOLrSUVuTf5fg3VHpQgiy1tGo/JgveRFTg3uGfOlToc4xfErnMOOEw4GTCd5z/93gfD3CVHbJVKicTEJSOMPIuDMZFnrGNffPcZZQuLgWSZDMgaXvXoUKpyZcyEpsUWB802O3hkbjjrp+EIvAU8TqFAMcdSHug33rxGJlNBIfLFymGbCMksO2fJayC7lqKAHBdIU3cFFOkxy4RACkK1+ns/5sPfgQpFQpAJFOrAFz8ntdUdkQGA5dOvkqwyV4J1C4qFK1zAAWscjPymgiDZk8E3NEmtwwWFBij+FG22suOaIFFsvvaxbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FsSEnMSm5JpKLhAl8WLBwVhfMOg8Oqii78dCWN+3dmc=;
 b=QBTim/TLobmadaO/hS7HrbZMMPfUMclSG+ZO+c0oiPQxo+nVaDN9qV8nOV7V8m4rsB9SE20/xPXDlA/phja2fMVd1ZYT4yQIsCI363Hnoq1DMI5FEnbZO5Cs6DoSULA2BU1YsaBGTUSiIpgAjHYPY/jGxlZU2srthlLTX1+NnYo=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17)
 by BYAPR11MB3382.namprd11.prod.outlook.com (2603:10b6:a03:7f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.20; Wed, 10 Jun
 2020 02:18:41 +0000
Received: from BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d]) by BYAPR11MB2598.namprd11.prod.outlook.com
 ([fe80::b1da:3c52:3aeb:d91d%7]) with mapi id 15.20.3066.023; Wed, 10 Jun 2020
 02:18:41 +0000
Subject: Re: The change pointed to by a .scc file not detected when compile kernel
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Robert Yang <liezhi.yang@windriver.com>, zyang <zhangle.yang@windriver.com>,
 "Asselstine, Mark" <mark.asselstine@windriver.com>
References: <67e32d06-6dc2-5566-f362-d7c2dd736618@windriver.com>
 <CADkTA4M+tRVzebByfDPmM2kwALcakrSoS4CQ87zAj759cBksEA@mail.gmail.com>
 <ae0f0097-c805-ac7b-5706-4833ffcc0244@windriver.com>
 <CADkTA4N=0ZmZyrb7Qe8hwbB1sFJU+FStkJHTaR-u+dXxM41wHA@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <96bd474c-102c-37be-e95f-1370f96f0438@windriver.com>
Date: Wed, 10 Jun 2020 10:17:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CADkTA4N=0ZmZyrb7Qe8hwbB1sFJU+FStkJHTaR-u+dXxM41wHA@mail.gmail.com>
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To BYAPR11MB2598.namprd11.prod.outlook.com
 (2603:10b6:a02:cb::17)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.138] (60.247.85.82) by HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 02:18:39 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a4a41ab-fbdf-4c5c-8618-08d80ce49796
X-MS-TrafficTypeDiagnostic: BYAPR11MB3382:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB33821EF9E9179718B51D441DF1830@BYAPR11MB3382.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MV3/nLRSdYcswf2IeZhutiNnMd173ZOuCdldEaJDcjJtbnscn8uj7o53zpPMT7KOcxxvA+ULcR2itRB6XFDnkig7OvW5z5fotRMpHAocde/JNn29mhkr6zynjm8dyYx6D+eewSM5yqJi0/0fXqt17HQLYY/4SV+5AAZfd2k+PfWiMxkFwsslaXKfGqvXwjOtMzUkkxzy0LLmQTDmC8p4TlE3dU2mXKyj3aSYjbJMyAootJYeV07mrA8N7ePyIyVldJNIFStbsAi0yt+UmMyyiJMlg4nLlJEUzQXGpCnTZj6/EgmnVBHK7o/bcm5AnxXCpUSWPnro3of+D8+GDfDiHz4XBiXDOG9HU0UYQ1kjDy7PG+g6iA0vQOIytKa4bfmNzS0K+CG1GuvR9kTMto+DlFZhzyw5lnvMs2vy197XS8PP8DIaWYuqdEqIrrGcUTQtk07IqEZG/QaKzagDKqq5aIlTksqzTPhZVVsKcwU9EZ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2598.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(39840400004)(376002)(396003)(136003)(366004)(6486002)(2616005)(2906002)(31686004)(956004)(86362001)(54906003)(4326008)(5660300002)(186003)(478600001)(8936002)(6666004)(66946007)(16576012)(53546011)(83380400001)(36756003)(8676002)(26005)(52116002)(66476007)(316002)(31696002)(107886003)(16526019)(66556008)(6916009)(6706004)(78286006)(142923001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Ja4SBzjaZHtJxjnxfZrRTTkuvcCt1syrp3u0d3kS/kBXZs1ooRbByQvT2wGMKSNm+FO4T5HMWHVSZ36jnfHUNAcXdF0ZJNncM9mhEQMqLL4uFCzph90XhRjdWa8reLnBwMV6I+QJJGLTwCcdHGKO0mJRrAzBdcTvyQnLm+inHzWW+bUECc0nmHZI3BqUvgLzWuQorKvxbtEhapbFsfDABm8tGMDb9h7F06KvUj/e7JuP0bmqD87pbVrPdqx7LsPsyaNkum75MFKqwL2vyuBTHE0gJ4TxQR38HcOLV5+sA0MChSCUWuAtmMyuqDm/8rQCz7H+rPyitWsi6IWGkEUnaRZBJRm5Gts6e5fWuWrmWjPU5tY7h+qlBxUcl+JBlUHMemB2tqLHhp9+VHR2jFn6OPL+4yrZCqhXyOIUy4nucxlodqJjBYw7wEj47goNytigSoHMDkpzBW8zSEVNJHi2IPw5luUUt5bCXed0en41e8Y=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a4a41ab-fbdf-4c5c-8618-08d80ce49796
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 02:18:41.1364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtzPhmR4JbwrD/yKd2vbKMBYdvOns+4TFSsJdB0eP7TbgN6BVwRwmKM5EOVXRe+pBIyZo+2NrPIROuSI84DcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3382
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 6/8/20 8:49 PM, Bruce Ashfield wrote:
> On Mon, Jun 8, 2020 at 1:39 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>
>> Hi Bruce,
>>
>> On 6/4/20 9:04 PM, Bruce Ashfield wrote:
>>> On Thu, Jun 4, 2020 at 12:52 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>>>>
>>>> Hi Bruce,
>>>>
>>>> Currently, the change pointed to by a .scc file not detected when
>>>> compile kernel, for example:
>>>>
>>>> 1, add DISTRO_FEATURES_append = " virtualization" to conf/local.conf to
>>>> enable virtualization DISTRO_FEATURES and also add meta-virtualization
>>>> layer to conf/bblayers.conf
>>>>
>>>> 2, bitbake -cconfigure linux-yocto
>>>>
>>>> 3,
>>>> $ grep -Rn CONFIG_IO_DELAY_0XED
>>>> tmp/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
>>>> 5367:# CONFIG_IO_DELAY_0XED is not set
>>>>
>>>> 4, modify the lxc.cfg which introduced by lxc.scc under
>>>> meta-virtualization layer
>>>> $ git diff
>>>> diff --git a/recipes-kernel/linux/linux-yocto/lxc.cfg
>>>> b/recipes-kernel/linux/linux-yocto/lxc.cfg
>>>> index 3fefc03..b7a19a8 100644
>>>> --- a/recipes-kernel/linux/linux-yocto/lxc.cfg
>>>> +++ b/recipes-kernel/linux/linux-yocto/lxc.cfg
>>>> @@ -1,3 +1,4 @@
>>>> +CONFIG_IO_DELAY_0XED=y
>>>>     CONFIG_CGROUP_DEVICE=y
>>>>     CONFIG_CPUSETS=y
>>>>     CONFIG_PROC_PID_CPUSET=y
>>>>
>>>>
>>>> 5, bitbake -cconfigure linux-yocto
>>>>
>>>> 6,
>>>> $ grep -Rn CONFIG_IO_DELAY_0XED
>>>> tmp-glibc/work/qemux86_64-wrs-linux/linux-yocto/5.4.43+gitAUTOINC+aafb8f095e_9e1b13d7f9-r0/linux-qemux86_64-standard-build/.config
>>>> 5367:# CONFIG_IO_DELAY_0XED is not set
>>>>
>>>> The change for CONFIG_IO_DELAY_0XED doesn't take effect.
>>>
>>> Does the same thing happen with a cleanall ? There's an open bug about
>>> the checksuming of those SRC_URI elements, and you are likely hitting
>>> it if there's no cleansstate or cleanall happening.
>>
>> No, it works if execute a cleanall before the step 6. But it should work
>> even if we don't execute cleanall.
>>
>> BTW, what's the status of the bug you mentioned?
> 
> It's waiting on some input from Richard, its on the fix list for the
> coming release though.

Thanks for your respond, waiting for your update for the fix.

Thanks,
Mingli

> 
> Cheers,
> 
> Bruce
> 
>>
>> Thanks,
>> Mingli
>>
>>>
>>> Also, you've confirmed that CONFIG_IO_DELAY_0XED isn't missing any
>>> config options that it has as dependencies ?
>>>
>>> Bruce
>>>
>>>>
>>>> Thanks,
>>>> Mingli
>>>
>>>
>>>
> 
> 
> 
