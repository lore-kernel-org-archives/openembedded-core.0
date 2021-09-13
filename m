Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.24967.1631504581557741312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 20:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZAMpLINB;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4890d19b72=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D3gYC4020848
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 20:43:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=8CSAFBxo4QYv5gtNXN3YNAnkkTg22qVafMK388xz9z8=;
 b=ZAMpLINBc4sa0KzTbeElXiGJVQ64cZIBU0MFE4Rg/12kHmu7j9Hx7sX1ORNo3reLtpzk
 G3PyxisRhwVo3ZNVKiuyAHbyAzcn10G5BocKiYGsqu9EHjOqdCoz2wdXfdkv73APbhAS
 86JPvbBPZJBDa5miUj88xDwXsKPLlcfDQWUn1kKoY6/K54ibrjnymlkPsd19p+bo9Ep7
 4qckcy7bqTqTdzCQEzrD3hbs3KQh1czvWzu40NAV9N+QEDolKTG1U/2jHMgy8AUxeRuO
 iNInyZ553QNbxV/z6xR1VelsS5s3IiPeOBGJxQ0vrLgQgpiULYp52LoYZZ+OEz5mZdFx 3g== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1qjw85xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 20:43:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oxio0Srhefe5HB3Lr7IOSJuMm+3UjuD/hy84GRBkcdH9ybimHU+O8rsPK9XV9Alq2QVhB+yEwZ6+eDhRbD/1qFxQPY3KWf9mxwh5Yao9U6nJYwgi6cXI2M6n3lQ3RA+LB5Ns7bUC0GZIp64COxAriwb8wFFzylY+pMIa3jKKjFdUaj/lEJc+pMLMsiQKy0f/b8xb5IrDzxnm2mG29fsnvQ9Orohuo+aGvrQ0gSb6NvJB900OL1yOAvBIanW4FEvq6GnBf8KbjkLefRm5FBbaMb3MFrOnLLYAdxpPtx7ccHjUu1sTdgjgIuxVUp/yI1A954/QnNJZNeZqOz/AYU6LEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=8CSAFBxo4QYv5gtNXN3YNAnkkTg22qVafMK388xz9z8=;
 b=KiThKHjMuyD1lWZ1G861PK3R6prrGvZa1QHmBdlRemFPd/s3z1wVuRzht5NnIPw2vJcEEDXZnNo4KHBBthKPmRIkGzxSIESO56xEdkGY1E2SQVuBtg8OoRFvFUSHImKsLS3uu5cDYsaWo/KKY4M4vGNSsB31qMMQ1dP8aCXrVMqyysNdvSLzR5LI1escIsWMqqAKTG+dVYEpiW6p2nVt6HgDUSwuI76Sac62eaJ9baSgmaYZVipDjU1Z/my+sV9tCX+hFcCd2CTa0XXd+cKV4Lc87yj1WgTXp2mUB28bndsN+kja65vpoqNFbgAjREh8V4XtnbxvulRXiiZDk5DHLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Mon, 13 Sep
 2021 03:42:56 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::a544:19b6:196b:f339%5]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 03:42:56 +0000
Subject: Re: [OE-core] [PATCH] bitbake.conf: support persistent /var/tmp
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <16989323AFD32DAC.17148@lists.openembedded.org>
 <16A0074A273CDC4D.26797@lists.openembedded.org>
Message-ID: <11e3b9fb-0673-db2f-5f6a-4f10d48cda0c@windriver.com>
Date: Mon, 13 Sep 2021 11:42:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <16A0074A273CDC4D.26797@lists.openembedded.org>
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
Received: from [128.224.162.189] (60.247.85.82) by HK0PR01CA0050.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 03:42:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88821cee-0cfe-43e0-c768-08d9766892e7
X-MS-TrafficTypeDiagnostic: SA0PR11MB4669:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4669037073D728E61BD0253E82D99@SA0PR11MB4669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rmedakh4EGkT4QqUTwhRrQZHD1mUis7xBjIOvsYTi0J4DBrowVDTxzzsd1zDmenxJhi52CFywiziWs1xFzS9REseX0PegvwnsYP/w/F0BrwSthEBtxbck9W35luyGn2HNbsg5lAsxzLmZ35k9y8gaHvD052GgWAVBCwk3KjWU3tWXWE8BZcJUQqku/8kRwTlkmo0SdgI7e2VPuoL+1DSdd1QhpU/2ex75oiFEpxS85iCoviz47BdeYQ+AT2MVWQH6EmfvRB9lbW2PYhyok7DrEHvvE35cL4mZEX85He1D5ljKdJn5BZiOXimBljQKu/aUWDuIbyBTxhvW8rE7EFDOt/3oNABOCaommzRD7qPaIPFgrhKZzc7ntJk3ShgLbG6lDVqiUL0Vij3gMPoa6+kewFxIrweHEhAf4yiMKrGyqm1qQaGeIzeJPe7ssctME5K3nu8AAVQEOmE/VxSooVWoH3UNdLi+zuq+/prC/OjG+gnRjLUQPaT3sdQjxYK9CY2Bn114/bULao/+afOiA5qa6Hoh0siALDQ3xUGt2b7n3AuFxX8ej2iV5Q2geSUqyQJswm6y5eX/JG4azw9ow1OU5qVEZ1VsCF37a1fxgarNr7bsESJ3m5y+WR41pAkrlEIl53/kDQ2y7b1QYq1DmMcS+I80JYfyloc8zUGI6DMwtygUkUhoVSicsIqnhlRiR52WT8PC+J5vqAbmJc+jeMVuvGcXxJLSOG1cmg1deFaVwYWlGHW2V/IEEp7B6hwVbRrd6z+y9rkRYdv66Fs4I4J1tBxpoVLxsb1RdRFdfQR1wXePu9VUORjsyMJK4TIISdscCrwMYVPPIl2w/Tq0zmrmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(2616005)(16576012)(52116002)(44832011)(6666004)(30864003)(186003)(31686004)(956004)(66946007)(966005)(31696002)(26005)(53546011)(5660300002)(508600001)(8676002)(8936002)(6706004)(83380400001)(86362001)(33964004)(38350700002)(6916009)(36756003)(38100700002)(6486002)(66476007)(66556008)(166002)(2906002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dW1BY3hEQ1RWMGJMaUpaNkhmZ0hVRnNRYVFoTk1IeXBMQW0yK2hFU3NhZVBR?=
 =?utf-8?B?KzBkUGI0b0QrTEFnSEdYSys4dVQweEdYakptdEZFYS8xVW5vTXc3TFdjY1dM?=
 =?utf-8?B?SHArc2RISC9NR0FlZHZIZEdBL3pXMERVN2pVam1BZ2FUSHp3N2MwM1pVaWpl?=
 =?utf-8?B?TjZ1OVJDVWlLUlV0UjdQS2dIbjVNQTRUWjlwQ0FlSS9zWXV2bmRva2R5aEpV?=
 =?utf-8?B?Q1B4ME1KYmJRbWphTTF3UjJYQzlGZzcvT2o3QWVvZWRuZEVxRytEdTZydTVW?=
 =?utf-8?B?ZERQeXh6b0t1VHlzRGFQaUF0STRlY1ZSdHFwM2NBeUgvMmtGS0FRT2FGTlBp?=
 =?utf-8?B?VWt4V3lNOFNvMHlyTCsyVHQ1YU12VzFXYkJnSDJSR040TzlTa2Rpak15M2F6?=
 =?utf-8?B?UnZGaXRia21jVUpXeGcrS2pXbTd0QVYya28rQlAzRWpCOHdjTmFOTWxmVXA2?=
 =?utf-8?B?RWNKZ0pKaGJzVFM5R1F6Z3F4TnBaZzBDeklTMCtvWWFEUDRTemdRZmo2TVQ5?=
 =?utf-8?B?dUJRS2JzSzdUUG80dFpDcmlGWk1UaGhtdm1hQ0d3VCs3R21PUGRCNStmUjc1?=
 =?utf-8?B?TkQ4cXNYMW1lS2RmNmcwYmg3U3dmWkJZK0pLaGNqQUlmWEpMdSt6OGNxQzhP?=
 =?utf-8?B?M0p4QWd4Q1Q1RlJ4ZjlGODlRSmVwdThiczh1RUx4K1hRTHlHMlVKUlFTWmRm?=
 =?utf-8?B?MEFSMk1wejhsZDAzMkloSXRwblRNeGZsQWFyaTlSK09WWnVkT0Njc3REdkIw?=
 =?utf-8?B?TkVSSmt1eElLZG53elJIcHNFUENQSEFUNDFTNjFQazhMcFgxZ2VWOWFBZ0VQ?=
 =?utf-8?B?bFhLM045eVFleTA2L3JLSVhiRWhUUXRUbHJiUTk1TDhrTFFWbFhYb2FYeVVY?=
 =?utf-8?B?R01Yb0xESU41ODlTY21sZEdVYWxpUGlyU0F3dWppT2kyVW16K2o2VVJJMnJJ?=
 =?utf-8?B?Y2RPQkovdFlVMDZVaEd3cWtYMlpVU1hFU1Z1V256VlhPUXh1bU10L3BTZmtj?=
 =?utf-8?B?TW4vaVNlTlhTc0FmM04vZ2hFaWlSM3cvdnYwelFiTHltSVh6Qm9YS0JMOFhl?=
 =?utf-8?B?MGFrMDBTTDZBeGw2YVdDQ1laVXp4eDVzeThsWE0vbU1vQ2ZydVVtRzI0RTdi?=
 =?utf-8?B?dFdVa1NlVzFLMUZ6S2pmb0VsQWZNTkxTblZWYjlSd1pGYzd6QUM5VXVzRWF4?=
 =?utf-8?B?S1lBVGhOMUhDN2sxN3JOc1A3cEVwUExETUhOWHNIWTY1Nktxd25Kb2RMWVdU?=
 =?utf-8?B?RUxLY1FGUXZ1ckJEVWM1UG5FZWRFTmxRQUFQcXpzaGs3czBycGFINFg0Snp4?=
 =?utf-8?B?U3IyTmw3WXp6Z21PRFJuRlFsOExtdzNYMVcwQnVENkQ1cFRnWXBXa05GWitW?=
 =?utf-8?B?QzR6L0pIL2dKdHpsUkFXanpsc3M3aHU5WDltZDRLb2E2RmNndmo2N0ViVita?=
 =?utf-8?B?N3BaT090UnRlczBicmFHaFN3eEtnSTVISGhkejl1RWlvNmRqcEkxbVYyOFpC?=
 =?utf-8?B?NnJmOFlLbDdaRGMwU1VZalFqWW85Zm4rUWVLWnVPUUExUmt5U21YOTZvaUs0?=
 =?utf-8?B?SDhzNlBpMHY2ZG5lakN3VDNqMTVUTlJSa2FBN2N1c0p2cVZJNHVCeDNXSTd4?=
 =?utf-8?B?RjB4aWZCRE9CTnRsY2NJNzNBeDdSZDBVM3hMbmJsQTViQVRhMjYvRXRyU1hX?=
 =?utf-8?B?UTFDanl2MnYyZEsydEEwT0pwUlB5S1h0WkFNd2p4TVRpTFhwTEFOdGJGbmRh?=
 =?utf-8?Q?dCUsXdkV+eubeLDhtnXZ+PkZtDhxTODhEwZM6LT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88821cee-0cfe-43e0-c768-08d9766892e7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 03:42:56.7463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6tJI9KyXfZepXDnXByaMlw0V5/4HsfdxQei2c9oH5SCW5fQ9C1i2yNPYVkpVickQ2vGtOHmDafUb57v2F7qawHusKvauM0JPkGVYt9eHPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
X-Proofpoint-ORIG-GUID: SxrTvlkT8RQhj2YaEormiZND2wG0Td4K
X-Proofpoint-GUID: SxrTvlkT8RQhj2YaEormiZND2wG0Td4K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130023
Content-Type: multipart/alternative;
 boundary="------------846720332AB6DA96ABDB1BA8"
Content-Language: en-US

--------------846720332AB6DA96ABDB1BA8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 8/30/21 4:11 PM, Changqing Li wrote:
>
> ping
>
> On 8/6/21 9:21 AM, Changqing Li wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Steps:
>> 1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
>> 2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
>> 3. docker run -it --rm poky:latest /bin/sh
>> 4.
>> /var # ls -al
>> drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
>> drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
>> drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
>> lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -> ../run/lock
>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -> volatile/log
>> lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -> ../run
>> drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
>> lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -> volatile/tmp
>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
>> /var # cd log
>> /bin/sh: cd: can't cd to log: No such file or directory
>> /var # cd tmp
>> /bin/sh: cd: can't cd to tmp: No such file or directory
>> /var # cd volatile/
>> /var/volatile # ls -al
>> drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
>> drwxr-xr-x    8 root     root          4096 Mar  9  2018 ..
>>
>> In step3, because we don't launch container with init system,
>> volatile/tmp is not created during startup, and the dad link will cause
>> error. Supporting persistent /var/tmp can resolve this problem.
>>
>> To support persistent /var/tmp, rename VOLATILE_LOG_DIR
>> to VOLATILE_DIR
>>
>> Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
>> to control it separately since it will make things complicated,
>> we need to make kinds of fs-perms*.txt for kinds of combination
>> of the two variables.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/conf/bitbake.conf                                 | 10 ++++++----
>>   ...erms-persistent-log.txt => fs-perms-persistent.txt} |  2 --
>>   meta/recipes-core/base-files/base-files_3.0.14.bb  <https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$>       |  7 ++++---
>>   .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
>>   meta/recipes-core/initscripts/initscripts_1.0.bb  <https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$>        |  7 +++++--
>>   meta/recipes-core/systemd/systemd_249.1.bb  <https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$>              |  5 +++--
>>   meta/recipes-core/udev/eudev_3.2.10.bb  <https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$>                  |  3 +++
>>   7 files changed, 21 insertions(+), 16 deletions(-)
>>   rename meta/files/{fs-perms-persistent-log.txt => fs-perms-persistent.txt} (95%)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 821dae2ba6..e93c0b7893 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = "/usr/bin"
>>   # Root home directory
>>   ROOT_HOME ??= "/home/root"
>>   
>> -# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
>> -# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
>> -VOLATILE_LOG_DIR ?= "yes"
>> +# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
>> +# /var/volatile/log, /var/tmp links to /var/volatile/tmp
>> +# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
>> +# is on persistent storage.
>> +VOLATILE_DIR ?= "yes"
>>   
>>   ##################################################################
>>   # Architecture-dependent build variables.
>> @@ -349,7 +351,7 @@ FILESEXTRAPATHS ?= "__default:"
>>   #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
>>   #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
>>   #  oldincludedir
>> -FILESYSTEM_PERMS_TABLES ?="${@'files/fs-perms.txt' if 
>> oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 
>> 'files/fs-perms-persistent-log.txt'}"
>> +FILESYSTEM_PERMS_TABLES ?="${@'files/fs-perms.txt' if 
>> oe.types.boolean(d.getVar('VOLATILE_DIR')) else 
>> 'files/fs-perms-persistent.txt'}"
>>   
>>   ##################################################################
>>   # General work and output directories for the build system.
>> diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
>> similarity index 95%
>> rename from meta/files/fs-perms-persistent-log.txt
>> rename to meta/files/fs-perms-persistent.txt
>> index 518c1be3c9..326c0ed092 100644
>> --- a/meta/files/fs-perms-persistent-log.txt
>> +++ b/meta/files/fs-perms-persistent.txt
>> @@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
>>   # Links
>>   ${localstatedir}/run	link	/run
>>   ${localstatedir}/lock	link	/run/lock
>> -${localstatedir}/tmp	link	volatile/tmp
>>   
>>   /home				0755	root	root	false - - -
>>   /srv				0755	root	root	false - - -
>> @@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>>   # Special permissions from base-files
>>   # Set 1777
>>   /tmp				01777	root	root	false - - -
>> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>>   
>>   # Set 0700
>>   ${ROOT_HOME}			0700	root	root	false - - -
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb  <https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$>  b/meta/recipes-core/base-files/base-files_3.0.14.bb  <https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$>
>> index 94299431f6..0e06629bbd 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb  <https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$>
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb  <https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$>
>> @@ -29,7 +29,7 @@ S = "${WORKDIR}"
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   
>>   docdir_append = "/${P}"
>> -dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>> +dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}tmp"
>>   dirs2775 = ""
>>   dirs555 = "/sys /proc"
>>   dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>> @@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>>              ${localstatedir}/backups ${localstatedir}/lib \
>>              ${localstatedir}/lib/misc ${localstatedir}/spool \
>>              ${localstatedir}/volatile \
>> -           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
>> +           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}log \
>>              /home ${prefix}/src ${localstatedir}/local \
>>              /media"
>>   
>> @@ -53,7 +53,8 @@ dirs755-lsb = "/srv  \
>>                  ${prefix}/lib/locale"
>>   dirs2775-lsb = "/var/mail"
>>   
>> -volatiles ="${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
>> +volatiles ="${@'log' if oe.types.boolean('${VOLATILE_DIR}') else ''} \ + 
>> ${@'tmp' if oe.types.boolean('${VOLATILE_DIR}') else ''}"
>>   conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>>                ${sysconfdir}/issue /${sysconfdir}/issue.net  <https://urldefense.com/v3/__http://issue.net__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlI5FtDIsg$>  \
>>                ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
>> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> index cd8a4be05f..eeeb8905da 100644
>> --- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> +++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
>> @@ -24,11 +24,8 @@
>>   # a link will be created at /var/test pointing to /tmp/testfile and due to this
>>   # link the file defined as /var/test will actually be created as /tmp/testfile.
>>   d root root 1777 /run/lock none
>> -d root root 0755 /var/volatile/log none
>> -d root root 1777 /var/volatile/tmp none
>>   l root root 1777 /var/lock /run/lock
>>   l root root 0755 /var/run /run
>> -l root root 1777 /var/tmp /var/volatile/tmp
>>   l root root 1777 /tmp /var/tmp
>>   d root root 0755 /var/lock/subsys none
>>   f root root 0664 /var/log/wtmp none
>> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb  <https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$>  b/meta/recipes-core/initscripts/initscripts_1.0.bb  <https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$>
>> index 65f9c0ae8d..cc079024f4 100644
>> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb  <https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$>
>> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb  <https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$>
>> @@ -105,9 +105,12 @@ do_install () {
>>   	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh  <https://urldefense.com/v3/__http://read-only-rootfs-hook.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL1vEuXgw$>  ${D}${sysconfdir}/init.d
>>   	install -m 0755    ${WORKDIR}/save-rtc.sh  <https://urldefense.com/v3/__http://save-rtc.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJWvQk5og$>	${D}${sysconfdir}/init.d
>>   	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
>> -	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
>> -		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
>> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
>> +                sed -i -e '\@^# link the file@ a\d root root 0755 /var/volatile/log none\nd root root 1777 /var/volatile/tmp none\nl root root 0755 /var/tmp /var/volatile/tmp\nl root root 0755 /var/log /var/volatile/log' \
>>   			${D}${sysconfdir}/default/volatiles/00_core
>> +	else
>> +		sed -i -e 's;TMPROOT="${ROOT_DIR}/var/volatile/tmp";TMPROOT="${ROOT_DIR}/var/tmp";g' \
>> +			${D}${sysconfdir}/init.d/populate-volatile.sh  <https://urldefense.com/v3/__http://populate-volatile.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlKbAMCb9w$>
>>   	fi
>>   	install -m 0755    ${WORKDIR}/dmesg.sh  <https://urldefense.com/v3/__http://dmesg.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLNtDYikg$>		${D}${sysconfdir}/init.d
>>   	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
>> diff --git a/meta/recipes-core/systemd/systemd_249.1.bb  <https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$>  b/meta/recipes-core/systemd/systemd_249.1.bb  <https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$>
>> index 9bfb12249c..0914b7e0b2 100644
>> --- a/meta/recipes-core/systemd/systemd_249.1.bb  <https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$>
>> +++ b/meta/recipes-core/systemd/systemd_249.1.bb  <https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$>
>> @@ -251,8 +251,9 @@ do_install() {
>>   		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
>>   	done
>>   
>> -	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
>> -
>> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
>> +		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
>> +	fi
>>   	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>>   		install -d ${D}${sysconfdir}/init.d
>>   		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
>> diff --git a/meta/recipes-core/udev/eudev_3.2.10.bb  <https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$>  b/meta/recipes-core/udev/eudev_3.2.10.bb  <https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$>
>> index a5d2115f80..3761fd748e 100644
>> --- a/meta/recipes-core/udev/eudev_3.2.10.bb  <https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$>
>> +++ b/meta/recipes-core/udev/eudev_3.2.10.bb  <https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$>
>> @@ -42,6 +42,9 @@ do_install_append() {
>>   	install -d ${D}${sysconfdir}/init.d
>>   	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
>>   	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
>> +	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = False ]; then
>> +		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /var/tmp%g' ${D}${sysconfdir}/init.d/udev
>> +	fi
>>   
>>   	install -d ${D}${sysconfdir}/udev/rules.d
>>   	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
>>
>
> 
>

--------------846720332AB6DA96ABDB1BA8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 8/30/21 4:11 PM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:16A0074A273CDC4D.26797@lists.openembedded.org">
      
      <p>ping<br>
      </p>
      <div class="moz-cite-prefix">On 8/6/21 9:21 AM, Changqing Li
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:16989323AFD32DAC.17148@lists.openembedded.org">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

Steps:
1. build out rootfs core-image-minimal-qemux86-64.tar.bz2
2. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
3. docker run -it --rm poky:latest /bin/sh
4.
/var # ls -al
drwxr-xr-x    8 root     root          4096 Mar  9  2018 .
drwxr-xr-x    1 root     root          4096 Aug  5 06:59 ..
drwxr-xr-x    2 root     root          4096 Mar  9  2018 backups
drwxr-xr-x    2 root     root          4096 Mar  9  2018 cache
drwxr-xr-x    5 root     root          4096 Mar  9  2018 lib
drwxr-xr-x    2 root     root          4096 Mar  9  2018 local
lrwxrwxrwx    1 root     root            11 Mar  9  2018 lock -&gt; ../run/lock
lrwxrwxrwx    1 root     root            12 Mar  9  2018 log -&gt; volatile/log
lrwxrwxrwx    1 root     root             6 Mar  9  2018 run -&gt; ../run
drwxr-xr-x    3 root     root          4096 Mar  9  2018 spool
lrwxrwxrwx    1 root     root            12 Mar  9  2018 tmp -&gt; volatile/tmp
drwxr-xr-x    2 root     root          4096 Mar  9  2018 volatile
/var # cd log
/bin/sh: cd: can't cd to log: No such file or directory
/var # cd tmp
/bin/sh: cd: can't cd to tmp: No such file or directory
/var # cd volatile/
/var/volatile # ls -al
drwxr-xr-x    2 root     root          4096 Mar  9  2018 .
drwxr-xr-x    8 root     root          4096 Mar  9  2018 ..

In step3, because we don't launch container with init system,
volatile/tmp is not created during startup, and the dad link will cause
error. Supporting persistent /var/tmp can resolve this problem.

To support persistent /var/tmp, rename VOLATILE_LOG_DIR
to VOLATILE_DIR

Don't use VOLATILE_LOG_DIR/VOLATILE_TMP_DIR
to control it separately since it will make things complicated,
we need to make kinds of fs-perms*.txt for kinds of combination
of the two variables.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 meta/conf/bitbake.conf                                 | 10 ++++++----
 ...erms-persistent-log.txt =&gt; fs-perms-persistent.txt} |  2 --
 meta/recipes-core/base-files/<a href="https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$" moz-do-not-send="true">base-files_3.0.14.bb</a>      |  7 ++++---
 .../recipes-core/initscripts/initscripts-1.0/volatiles |  3 ---
 meta/recipes-core/initscripts/<a href="https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$" moz-do-not-send="true">initscripts_1.0.bb</a>       |  7 +++++--
 meta/recipes-core/systemd/<a href="https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$" moz-do-not-send="true">systemd_249.1.bb</a>             |  5 +++--
 meta/recipes-core/udev/<a href="https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$" moz-do-not-send="true">eudev_3.2.10.bb</a>                 |  3 +++
 7 files changed, 21 insertions(+), 16 deletions(-)
 rename meta/files/{fs-perms-persistent-log.txt =&gt; fs-perms-persistent.txt} (95%)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 821dae2ba6..e93c0b7893 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -86,9 +86,11 @@ USRBINPATH_class-nativesdk = &quot;/usr/bin&quot;
 # Root home directory
 ROOT_HOME ??= &quot;/home/root&quot;
 
-# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to /var/volatile/log.
-# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log is on persistent storage.
-VOLATILE_LOG_DIR ?= &quot;yes&quot;
+# If set to boolean true ('yes', 'y', 'true', 't', '1'), /var/log links to
+# /var/volatile/log, /var/tmp links to /var/volatile/tmp
+# If set to boolean false ('no', 'n', 'false', 'f', '0'), /var/log and /var/tmp
+# is on persistent storage.
+VOLATILE_DIR ?= &quot;yes&quot;
 
 ##################################################################
 # Architecture-dependent build variables.
@@ -349,7 +351,7 @@ FILESEXTRAPATHS ?= &quot;__default:&quot;
 #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
 #  mandir, docdir, bindir, sbindir, libexecdir, libdir, includedir and
 #  oldincludedir
-FILESYSTEM_PERMS_TABLES ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@'files/fs-perms.txt'ifoe.types.boolean(d.getVar('VOLATILE_LOG_DIR'))else'files/fs-perms-persistent-log.txt'}" moz-do-not-send="true">&quot;${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 'files/fs-perms-persistent-log.txt'}&quot;</a>
+FILESYSTEM_PERMS_TABLES ?= <a class="moz-txt-link-rfc2396E" href="mailto:${@'files/fs-perms.txt'ifoe.types.boolean(d.getVar('VOLATILE_DIR'))else'files/fs-perms-persistent.txt'}" moz-do-not-send="true">&quot;${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_DIR')) else 'files/fs-perms-persistent.txt'}&quot;</a>
 
 ##################################################################
 # General work and output directories for the build system.
diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-persistent.txt
similarity index 95%
rename from meta/files/fs-perms-persistent-log.txt
rename to meta/files/fs-perms-persistent.txt
index 518c1be3c9..326c0ed092 100644
--- a/meta/files/fs-perms-persistent-log.txt
+++ b/meta/files/fs-perms-persistent.txt
@@ -47,7 +47,6 @@ ${oldincludedir}	0755	root	root	true	0644	root	root
 # Links
 ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
-${localstatedir}/tmp	link	volatile/tmp
 
 /home				0755	root	root	false - - -
 /srv				0755	root	root	false - - -
@@ -57,7 +56,6 @@ ${localstatedir}/local		0755	root	root	false - - -
 # Special permissions from base-files
 # Set 1777
 /tmp				01777	root	root	false - - -
-${localstatedir}/volatile/tmp	01777	root	root	false - - -
 
 # Set 0700
 ${ROOT_HOME}			0700	root	root	false - - -
diff --git a/meta/recipes-core/base-files/<a href="https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$" moz-do-not-send="true">base-files_3.0.14.bb</a> b/meta/recipes-core/base-files/<a href="https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$" moz-do-not-send="true">base-files_3.0.14.bb</a>
index 94299431f6..0e06629bbd 100644
--- a/meta/recipes-core/base-files/<a href="https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$" moz-do-not-send="true">base-files_3.0.14.bb</a>
+++ b/meta/recipes-core/base-files/<a href="https://urldefense.com/v3/__http://base-files_3.0.14.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLGKroQBQ$" moz-do-not-send="true">base-files_3.0.14.bb</a>
@@ -29,7 +29,7 @@ S = &quot;${WORKDIR}&quot;
 INHIBIT_DEFAULT_DEPS = &quot;1&quot;
 
 docdir_append = &quot;/${P}&quot;
-dirs1777 = &quot;/tmp ${localstatedir}/volatile/tmp&quot;
+dirs1777 = &quot;/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}tmp&quot;
 dirs2775 = &quot;&quot;
 dirs555 = &quot;/sys /proc&quot;
 dirs755 = &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
@@ -42,7 +42,7 @@ dirs755 = &quot;/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${localstatedir}/backups ${localstatedir}/lib \
            ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
+           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_DIR}') else ''}log \
            /home ${prefix}/src ${localstatedir}/local \
            /media&quot;
 
@@ -53,7 +53,8 @@ dirs755-lsb = &quot;/srv  \
                ${prefix}/lib/locale&quot;
 dirs2775-lsb = &quot;/var/mail&quot;
 
-volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_LOG_DIR}')else''}tmp" moz-do-not-send="true">&quot;${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp&quot;</a>
+volatiles = <a class="moz-txt-link-rfc2396E" href="mailto:${@'log'ifoe.types.boolean('${VOLATILE_DIR}')else''}\+${@'tmp'ifoe.types.boolean('${VOLATILE_DIR}')else''}" moz-do-not-send="true">&quot;${@'log' if oe.types.boolean('${VOLATILE_DIR}') else ''} \
+             ${@'tmp' if oe.types.boolean('${VOLATILE_DIR}') else ''}&quot;</a>
 conffiles = &quot;${sysconfdir}/debian_version ${sysconfdir}/host.conf \
              ${sysconfdir}/issue /${sysconfdir}/<a href="https://urldefense.com/v3/__http://issue.net__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlI5FtDIsg$" moz-do-not-send="true">issue.net</a> \
              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/volatiles b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
index cd8a4be05f..eeeb8905da 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/volatiles
+++ b/meta/recipes-core/initscripts/initscripts-1.0/volatiles
@@ -24,11 +24,8 @@
 # a link will be created at /var/test pointing to /tmp/testfile and due to this
 # link the file defined as /var/test will actually be created as /tmp/testfile.
 d root root 1777 /run/lock none
-d root root 0755 /var/volatile/log none
-d root root 1777 /var/volatile/tmp none
 l root root 1777 /var/lock /run/lock
 l root root 0755 /var/run /run
-l root root 1777 /var/tmp /var/volatile/tmp
 l root root 1777 /tmp /var/tmp
 d root root 0755 /var/lock/subsys none
 f root root 0664 /var/log/wtmp none
diff --git a/meta/recipes-core/initscripts/<a href="https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$" moz-do-not-send="true">initscripts_1.0.bb</a> b/meta/recipes-core/initscripts/<a href="https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$" moz-do-not-send="true">initscripts_1.0.bb</a>
index 65f9c0ae8d..cc079024f4 100644
--- a/meta/recipes-core/initscripts/<a href="https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$" moz-do-not-send="true">initscripts_1.0.bb</a>
+++ b/meta/recipes-core/initscripts/<a href="https://urldefense.com/v3/__http://initscripts_1.0.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLZKOO3Tw$" moz-do-not-send="true">initscripts_1.0.bb</a>
@@ -105,9 +105,12 @@ do_install () {
 	install -m 0755    ${WORKDIR}/<a href="https://urldefense.com/v3/__http://read-only-rootfs-hook.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL1vEuXgw$" moz-do-not-send="true">read-only-rootfs-hook.sh</a> ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/<a href="https://urldefense.com/v3/__http://save-rtc.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJWvQk5og$" moz-do-not-send="true">save-rtc.sh</a>	${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
-	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = True ]; then
-		sed -i -e '\@^d root root 0755 /var/volatile/log none$@ a\l root root 0755 /var/log /var/volatile/log' \
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+                sed -i -e '\@^# link the file@ a\d root root 0755 /var/volatile/log none\nd root root 1777 /var/volatile/tmp none\nl root root 0755 /var/tmp /var/volatile/tmp\nl root root 0755 /var/log /var/volatile/log' \
 			${D}${sysconfdir}/default/volatiles/00_core
+	else
+		sed -i -e 's;TMPROOT=&quot;${ROOT_DIR}/var/volatile/tmp&quot;;TMPROOT=&quot;${ROOT_DIR}/var/tmp&quot;;g' \
+			${D}${sysconfdir}/init.d/<a href="https://urldefense.com/v3/__http://populate-volatile.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlKbAMCb9w$" moz-do-not-send="true">populate-volatile.sh</a>
 	fi
 	install -m 0755    ${WORKDIR}/<a href="https://urldefense.com/v3/__http://dmesg.sh__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlLNtDYikg$" moz-do-not-send="true">dmesg.sh</a>		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
diff --git a/meta/recipes-core/systemd/<a href="https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$" moz-do-not-send="true">systemd_249.1.bb</a> b/meta/recipes-core/systemd/<a href="https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$" moz-do-not-send="true">systemd_249.1.bb</a>
index 9bfb12249c..0914b7e0b2 100644
--- a/meta/recipes-core/systemd/<a href="https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$" moz-do-not-send="true">systemd_249.1.bb</a>
+++ b/meta/recipes-core/systemd/<a href="https://urldefense.com/v3/__http://systemd_249.1.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlL5fo0QpQ$" moz-do-not-send="true">systemd_249.1.bb</a>
@@ -251,8 +251,9 @@ do_install() {
 		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
 	done
 
-	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
-
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = True ]; then
+		install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
+	fi
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
 		install -d ${D}${sysconfdir}/init.d
 		install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/systemd-udevd
diff --git a/meta/recipes-core/udev/<a href="https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$" moz-do-not-send="true">eudev_3.2.10.bb</a> b/meta/recipes-core/udev/<a href="https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$" moz-do-not-send="true">eudev_3.2.10.bb</a>
index a5d2115f80..3761fd748e 100644
--- a/meta/recipes-core/udev/<a href="https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$" moz-do-not-send="true">eudev_3.2.10.bb</a>
+++ b/meta/recipes-core/udev/<a href="https://urldefense.com/v3/__http://eudev_3.2.10.bb__;!!AjveYdw8EvQ!MoXYkSbYEh_wPDSc9aNzNMO5yoT1RxF7zH1siib0KE9zK-MrIOfuYiyBk0-AGlJBKLyQTw$" moz-do-not-send="true">eudev_3.2.10.bb</a>
@@ -42,6 +42,9 @@ do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
 	sed -i s%@UDEVD@%${base_sbindir}/udevd% ${D}${sysconfdir}/init.d/udev
+	if [ ${@ oe.types.boolean('${VOLATILE_DIR}') } = False ]; then
+		sed -i -e 's%mkdir -m 1777 -p /var/volatile/tmp%mkdir -m 1777 -p /var/tmp%g' ${D}${sysconfdir}/init.d/udev
+	fi
 
 	install -d ${D}${sysconfdir}/udev/rules.d
 	install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/local.rules
</pre>
        <br>
        <fieldset class="mimeAttachmentHeader"></fieldset>
        <pre class="moz-quote-pre" wrap="">
</pre>
      </blockquote>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------846720332AB6DA96ABDB1BA8--
