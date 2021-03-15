Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.74])
 by mx.groups.io with SMTP id smtpd.web12.3603.1615775582235588729
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 19:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iUq6CzJA;
 spf=pass (domain: windriver.com, ip: 40.107.100.74, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPCprBrY6xGu0B2H+UpAUcJ3XmHf9ix8QwkC99/Qf/4BkSPT240pWk0FuK6Plb3te21OVIptYcqto2P+thEL4v3C+5xEYLJ6N09s1USFCZm9hVj+048foXX9+rLQ/DjtPObjQs2OV/wStnKAY2QuU2uBHFsTnDYfHqGW6IDKpv2a8YYlUPYUYEKABk4LQ5dwKmkDpgN4TVnWukir0lfatyuUmUJ5kDsAe7FDgxcxFicHxWls5pAuwWcAIUENcXVRn6axrXGbGdavxB9fE4V/8vFqf7tGOTFV2G9b5Xl35h3hZJS/a1Sv6GHrSj1gNckd05SpGGe/uLrplofUvY63mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNuTwl9eSxFJOv7wPLfBwW9rhJYX/xuNyskWNTri4Mg=;
 b=eRAZRRTPPVOo6fvkCq3hgnBAtnAkaZJ55+bJTgnth4oQjECdCnKMCDgabG3EGLTth3sCKufyH06syndxnl8ZgFv5XNtnemdabZfW4aWBqC7xqlNov4GGsfavoCWusjT9zE/aw4WkARnzOA5acmXAuAewexgbN+mDcziaFwlN+QvgBV8k83gfZSGYh6LGKdB22KwSDy5pcYXS5SWccdDNa94c3Ga1Jcz5rYUVJ2iI1ulFxoL8/a/P4pJAjqLVe9EKEdk9cxKjkYnFYysc0KjGVWrDFLocqlCK6xmJfM6eAu5MR3a22ClRRaPlJ0Tc+SS6WMG59O03NSe4wOnVMFZFOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hNuTwl9eSxFJOv7wPLfBwW9rhJYX/xuNyskWNTri4Mg=;
 b=iUq6CzJA3F0Gi69IdWCed+dk/kFUKIal0Fanm0lpD8FR8aqyjuZAuoqmOCUns1bo50y5+1EzE7AQ6f6e8VkhLYs9tObc2eMzalSPCWELU2akyxH5VvJBGRBRn/u8m5e2A8+qGH18wlJLT/jifCm/nYMOXiibq6if+p+O1XEg29w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by BY5PR11MB4369.namprd11.prod.outlook.com (2603:10b6:a03:1cb::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Mon, 15 Mar
 2021 02:32:58 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::f8da:7bfa:e2e7:244b]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::f8da:7bfa:e2e7:244b%7]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 02:32:57 +0000
Subject: Re: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a warning when login with root is disabled
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1614916931.git.liezhi.yang@windriver.com>
 <870b35befc0b8fa9cd1c3a03fcfd2395440c2f41.1614916931.git.liezhi.yang@windriver.com>
 <f23d196c13f24731a5a7e00ff139aa42@XBOX03.axis.com>
 <975479fc-e8f4-dccd-56c9-3d830cc5dc54@windriver.com>
 <e67217d10fc244b58cb3ef73815cf37f@XBOX03.axis.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <3c93c982-1f66-1a52-8b91-fa5e42be8098@windriver.com>
Date: Mon, 15 Mar 2021 10:31:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e67217d10fc244b58cb3ef73815cf37f@XBOX03.axis.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.198] (60.247.85.82) by BYAPR06CA0021.namprd06.prod.outlook.com (2603:10b6:a03:d4::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 02:32:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ecb58087-82f7-44ee-9c1d-08d8e75aa507
X-MS-TrafficTypeDiagnostic: BY5PR11MB4369:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4369262339CCE443A4B71653FF6C9@BY5PR11MB4369.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lm9gCRb7SMrnSmao5mP+FMPjQyP5ncMGz+QbQGFR8Fp4A4jf8496pDCpkDUdp0Hw/XxUFPUT7Bu+UduqtaZ56SPdBcbzJsd0QZKQOPetWBND2jKQPunqcjouxFnN/17JzwjdMwWECU/pUI1ATYt049q5OLHRivTOyoV1fkRUP5VxzWHCchuB7Ts7csWkVXgYv8ruIkTZeQsPJ/9Rtx8If0fyzaInhe7kbecAhDHEJDvQC7ze3hsWpDJexd6EJTYORNU4gJ2RixzQDRljlZzKJSvAIR5LXGrjzRGFcaF6rIvFVbo33PjANIL0J+aIB3c1iaOOff63GYhVnLR6/4MGhm07kJiy8QOBE/NvRnBF79phit5wXxJ/a5Ju3UgS8o6zK1rs96RL9WvqhEq0dUp/m/cyGuulAq4BcMXbbWtjVYoO5krcz2+H0K1AXSIJTHM31paNopSMMIlktHgPdcDXaerwWWo53o841BiJhTfIbh3+L0Ul+WoUjMGaMr6MqvsSdYNn8m6DQYK4WCqKVnuSHHU8MDld4Ccg751St4RKoyTw6P5vOy2QQEg0iYbVsMRAgh0z/gzFQSeHRsccbZIVvQDgIKirLLrqjZvGTniXyzQ/e0F7CGFLtnRRvhrLbxGsRRPo4J6Ars0a3ILdx4Ck3F9GAe06flI3GKtCazk0ppE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(376002)(39840400004)(346002)(2616005)(6706004)(956004)(5660300002)(8676002)(53546011)(36756003)(52116002)(8936002)(31686004)(316002)(478600001)(66946007)(110136005)(186003)(66556008)(66476007)(16526019)(31696002)(86362001)(6666004)(83380400001)(6486002)(2906002)(16576012)(26005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UUZSbHJodmJ2UXkycE41clpKRVdTdnpsMGxnSE1KZHMrWWNDenlVR3RmVlNx?=
 =?utf-8?B?dlQ2NThUV3B0Tkx2MWN6K3U4N0xWVzVVMnFGczhtR1dKQWFBUDhycU5qRWEy?=
 =?utf-8?B?eG1TT29TVWdQWXZvQ0NnVm1UL0tsOHR0SXBoMHgrUzBWWnBHdUhSOGl4bkgv?=
 =?utf-8?B?ZEtJSzVBRUsrY09ORFl4M0R6ckRrbFoxMTRNZnUyRmJzaThYNUI4ejgxa3lr?=
 =?utf-8?B?MGNsdzFGVHFCMGdYL00yVVVHblk3S3JxaUpaaUlJWG5aenFGRFFPQ1dsbGs4?=
 =?utf-8?B?Y1ZOWWZWR2xVeEpVRGd6TmV3cXdjQ1kvODZxVkpkU0g2L1pBT3cwQmVNd0Zw?=
 =?utf-8?B?TEpzSG1XVVFyRHVSVU1KVUtDOUUvS2ZMV2xzWHd4K0o4azlCMjdUM08zb1k5?=
 =?utf-8?B?bjI3ZGVHWnNTT1ZVRTNmMllnTDQvckNGcDZBUVltd0Vndys1Y1VES1d1UlU4?=
 =?utf-8?B?L0VEdWozTDY4TmtPVlJXa2hBZFJqUXp1U0FxOGtLRk5QTzZBcXVyazNaRXVZ?=
 =?utf-8?B?SDRzdEdzQ2xocFhNVmxCQ20wQ2NuQjZpYVJHMnNyemZnMHAvL1NFMXVGakpa?=
 =?utf-8?B?QWN5YU5kK3ZBckFTN3hHOVQ1dlE5NktQb0hJaGhTOTJQYW56Q1lmc1J1SStV?=
 =?utf-8?B?bUw2SzMyQUJ1eTkrc2hvdzZNTUk0di9KMTNxZ1ZidEN4MTJtRWVONk4xOUR2?=
 =?utf-8?B?eDgraHZPa2FYQXdsbXYyMkJJWVU5S0xKK0JuY3h4WHVqTXI0QkN5aXFhUVVM?=
 =?utf-8?B?MTBqV3Q1dFRRMitUaUZuMU5hLytabmsrZDhYSFRFT2JQZGZLQjN6eDhtNnFs?=
 =?utf-8?B?Zm1Vb0dkMU9hVTZCRnl6b3duc1VSTndIemVRL01FU0RNMDBUK3hIc0RjbDdF?=
 =?utf-8?B?MHFRWjBBN1lCa1RKNU9zcEhjOEdQMUhUOE5XQmZ2bmhMZ1pzYTFudzBuVkQx?=
 =?utf-8?B?YzlKWU91UGhHb0J1RGt5eGYwYTRpMkQ0K1JDV3lzbWhNYTdqUGFRc1pORzZr?=
 =?utf-8?B?TGp2eVRKbE5rYTUvTm5FOUh5elFhWDhIWGNNem9ISzFpK2N0WmdrWjJpMTE0?=
 =?utf-8?B?QU1RcDd2UmVPR1hyVWJSQXU0cUs5YWFrYzVaWGtlZUZwSmxGeURQNmcwUmpB?=
 =?utf-8?B?SktFWmNrNEpGVlBQNVZsdVRGT0xpNThhdmRBR0ZweXFMTHRaVnFRVS9xZVZO?=
 =?utf-8?B?djFwNUppMHRON09TMkg5RTN2RCtmc1FhSjZ6cit4d1hvR0xhSGZ0eitQOEQ0?=
 =?utf-8?B?NWh5MHAvbUF0eTd0N3VFYXhHdWpzVVdQdFF3Z3VUZjVoY2lhYzZQYmVHVG5H?=
 =?utf-8?B?R3pEMW84UGVXU1NMcW5yN0JHMTJ1U1dXZEpTR0pDRXlqU09kS3hodHFpSS92?=
 =?utf-8?B?U2V1ZkpLeXJXeXZ3VWZndXdGUmp6NWkrbTM4RWVzYXd3YnlHWTQ5VDZlYTdL?=
 =?utf-8?B?dGpHNVcvK05ZRFFYUjVpclBlMFU3MitLT2RWZWg0ZUFpVE10eHVQR01ENmpx?=
 =?utf-8?B?ZVhVUG5vT3lSQ2t4ajlURlNCSDJZcXpSc0VGYU1udzNsQUJSQ1lvOTY5Z25B?=
 =?utf-8?B?eGNrck9JUEE1UzMxNVJjSy8yQTYvaXdyWnFxdEVZY0NiMjRTM3ZEbTZvWm96?=
 =?utf-8?B?ZXMrZ3o0T0FSM2pib25MZWJjanBUcEZIYUJ3emN0dE9hd0daZ1lRejBmejhX?=
 =?utf-8?B?VGVmdlQzdDhwWVRGUnZmTEpza2hqU2wyNXZ4SnFacVQ2Rjdab045MW9DdGxB?=
 =?utf-8?Q?HaD2EjpLWPvgXKITgv8KD0ew4enVELQlHAk7sRa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb58087-82f7-44ee-9c1d-08d8e75aa507
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 02:32:57.6876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fF6dbTbtJcSWn/9D0mva3K7YLAEQVikrhmVBIqgJQYZKIIEdubYYA6t2NC8D9dHh/wPsna1WCiXPnP5f1iKiRJzXKJ/NJntO9HEXw5v38ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4369
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/12/21 10:13 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Robert Yang <liezhi.yang@windriver.com>
>> Sent: den 9 mars 2021 09:32
>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
>> core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a
>> warning when login with root is disabled
>>
>> Hi Peter,
>>
>> On 3/5/21 6:18 PM, Peter Kjellerstedt wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>>> core@lists.openembedded.org> On Behalf Of Robert Yang
>>>> Sent: den 5 mars 2021 09:49
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] [PATCH 1/1] rootfs-postcommands.bbclass: Print a
>> warning when login with root is disabled
>>>>
>>>> Fixed:
>>>> EXTRA_IMAGE_FEATURES_remove = "debug-tweaks"
>>>> $ bitbake core-image-minimal
>>>>
>>>> Then we can't login to the system with root without any messages. Add a
>> warning
>>>> makes it easy to debug.
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>    meta/classes/rootfs-postcommands.bbclass | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/rootfs-postcommands.bbclass
>> b/meta/classes/rootfs-postcommands.bbclass
>>>> index 1f27a3d07a..e4fe416ac9 100644
>>>> --- a/meta/classes/rootfs-postcommands.bbclass
>>>> +++ b/meta/classes/rootfs-postcommands.bbclass
>>>> @@ -147,7 +147,11 @@ read_only_rootfs_hook () {
>>>>    zap_empty_root_password () {
>>>>    	if [ -e ${IMAGE_ROOTFS}/etc/shadow ]; then
>>>>    		sed -i 's%^root::%root:*:%'
>> ${IMAGE_ROOTFS}/etc/shadow
>>>> -        fi
>>>> +		grep -q '^root:*:' ${IMAGE_ROOTFS}/etc/shadow
>>>
>>> That will match any /etc/shadow file with "root:" in it. Change it to:
>>>
>>> 		grep -q '^root:\*:' ${IMAGE_ROOTFS}/etc/shadow
>>
>> Thanks, I will update it.
>>
>>>
>>> And make this optional. We intentionally do not have a root password set
>> in our
>>
>> I don't quite understand about "optional", when the command is:
>>
>> grep -q '^root:\*:' ${IMAGE_ROOTFS}/etc/shadow
>>
>> Then empty root password in shadow is:
>> root::
>>
>> so empty root password won't be matched?
> 
> Sorry, I was unclear. We do not have an empty password, we have
> "root:*:..." in /etc/shadow, and we obviously do not want this warning.

Thanks, makes sense, then let's drop this patch, this patch is for debugging 
only, it doesn't matter to drop it.

I wonder how to login when the line is "root:*:..." in /etc/shadow?

// Robert

> 
>> // Robert
> 
> //Peter
> 
>>> products when they are delivered due to the state law (SB-327) that went
>> into
>>> effect on January 1, 2020 in California, which prohibits default
>> passwords to
>>> be used in IoT products.
>>>
>>>> +		if [ $? -eq 0 ]; then
>>>> +			bbwarn "Login with root user is disabled
>> since zap_empty_root_password is enabled"
>>>> +		fi
>>>> +	fi
>>>>    	if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>>>>    		sed -i 's%^root::%root:*:%'
>> ${IMAGE_ROOTFS}/etc/passwd
>>>>    	fi
>>>> --
>>>> 2.17.1
>>>
>>> //Peter
>>>
