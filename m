Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web12.4313.1608069537833942488
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 13:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nio365.onmicrosoft.com header.s=selector2-nio365-onmicrosoft-com header.b=pUGTbE1a;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=5618316f7c=alex.stewart@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BFLwG6J016079;
	Tue, 15 Dec 2020 15:58:56 -0600
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
	by mx0b-00010702.pphosted.com with ESMTP id 35cvjancr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Dec 2020 15:58:56 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kfua0DtHS3w3m1vRho3Ki8KFbOpWdjw2cnVUm/GR5enTLn37D/375RjHCrQoaa4xmKkBzmKAnVf5aw9N1aMX6PVt0hubmSY6CT6PYLZ8Gt8meHqCUYDLrF3i2tP6sAL827XGwb3jGo+SnshGhxHuUEY7yLULpgvNFhdYlBaNj6fms3fUBHIPurWfFzh04RW7p/qYX0nQvXkMp3ZbCfcHhlAb88wixU8MXcpocrGrRCb2d7Wj7StpJbqxc6J4UXDeibXCt6fzmvUCkCiZFUFjR+RQLvjTHjTM4FGidXffzxgVPvhk5uPSzKSFqeX0Xv04qP8ijEJDrgyRpbxPkrixow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B46LEpC/JLLYW6+EvnGiwA0jbPAZsZtAEN6XhHbSqI=;
 b=RItqJW/4uUFK5onkilaD5VSGzdU7rpL4bEVsXNmUutcuUvMqISWVJP6Zx3FHT6Uug+PrqERWYN+A2i3zUUsvGTgSzTiPhfZFWGCyrtm3UUzlxIaqLbKpf7gCW9f9dokyR7WqC3vy35A+TC8dWjV5ZB0NZOJCJZzCDBJuLu3QSgdA8XsH2zkCm9+yhGyq0bdNIs4R/cYPh7qtdAZh1iaBrqdHlThv8RcXbpzdUXNK8quGgwoLzcMoj6sj6cSRMlxxFRMA83HlaH83YSuNa48QGvhkxjHCRIoGVYJwiDa+ULAITPMDpoy2m6wNjh9JS1hNPmNpA86CuMD6sDqTMIo3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B46LEpC/JLLYW6+EvnGiwA0jbPAZsZtAEN6XhHbSqI=;
 b=pUGTbE1aHkGIdj3rJaQiPQYdonajYRztnmEDsBYNT3RtmaKXSgMUBG+03sIG0ZT8HScjylUZ3e3SOkOhEZh6NnGStIoFfzNHCwNpEjWd/tnxUkHdBtgghzvI5XavczogE+1jdrvUUvd9gtw5VhtWN+BJGIJCCqmeOPQeZOuJOrU=
Authentication-Results: ni.com; dkim=none (message not signed)
 header.d=none;ni.com; dmarc=none action=none header.from=ni.com;
Received: from DM6PR04MB5306.namprd04.prod.outlook.com (2603:10b6:5:10f::25)
 by DM6PR04MB5307.namprd04.prod.outlook.com (2603:10b6:5:108::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 21:58:32 +0000
Received: from DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db]) by DM6PR04MB5306.namprd04.prod.outlook.com
 ([fe80::85b6:eb0:e666:8db%6]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 21:58:32 +0000
Subject: Re: [OE-core] [PATCH] opkg: upgrade to version 0.4.4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        Alejandro del Castillo <alejandro.delcastillo@ni.com>
References: <20201207224400.1008323-1-alejandro.delcastillo@ni.com>
 <CANNYZj9Yq6X3Px4AHJ_T40MoKoX0aMpETW6BnSTcz8oAyQOo=Q@mail.gmail.com>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <1f3df707-1948-718a-72cb-172abd737498@ni.com>
Date: Tue, 15 Dec 2020 15:58:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
In-Reply-To: <CANNYZj9Yq6X3Px4AHJ_T40MoKoX0aMpETW6BnSTcz8oAyQOo=Q@mail.gmail.com>
X-Originating-IP: [65.36.69.14]
X-ClientProxiedBy: SN4PR0501CA0079.namprd05.prod.outlook.com
 (2603:10b6:803:22::17) To DM6PR04MB5306.namprd04.prod.outlook.com
 (2603:10b6:5:10f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.3] (65.36.69.14) by SN4PR0501CA0079.namprd05.prod.outlook.com (2603:10b6:803:22::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend Transport; Tue, 15 Dec 2020 21:58:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59a9debb-9194-4a41-aa98-08d8a1449081
X-MS-TrafficTypeDiagnostic: DM6PR04MB5307:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR04MB530726950B9AAFA1CD204FFEFEC60@DM6PR04MB5307.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ERrIMVb9PJCqY1aTejqwyYVaDn6unBqz5Cv/Ev8KfJXHP8IXR6H5Zu7ArnBdC7ZnbND5abUQ6OdAavvI9cT0pqdLlxL+7vSPAnMd9DzweuJ6QeOq1I/v9yuw1P9ue67r5T9ASBPjbKHItUXpB2WfP9riMoByDGPygEjRQhBJHwClRm12Z23MLFdIvIsWdvbPpPyGyHzd3xBuagRDUure6r3Ac6pdeCpJVF2r3mULunpC276qBmN4QjKcB74kGdExl7VS3pWxRAiyak6WzWkBFrLFcXGiLJSrqyfWb+7RoqbgdCG91De229djvUHrUPohraXronah1CvcL2MeE7YwvnXKVyUB5hWRgk3G+zWx7ZDL5SxsCUG63AYKgkmqxTqoZbGuW86IIbLkdZmH+EZBqsKJzFwdTQPBVZBFk8nou02El/ebjrKCFdMdifrd2BsvQy91pAvBw8IiZIqV8zBiMvsgfz9QmGgDtgWPSDIfAs1kTsAwBY7my3FoMYwxz+Ye
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR04MB5306.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(39850400004)(346002)(136003)(396003)(66946007)(186003)(16576012)(44832011)(956004)(83380400001)(31696002)(6486002)(2616005)(36916002)(16526019)(6916009)(26005)(31686004)(53546011)(54906003)(4326008)(66556008)(36756003)(316002)(66476007)(5660300002)(86362001)(478600001)(8676002)(52116002)(2906002)(8936002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NjYrYTFlUHB1WHptcnBRYjVkRitFWnZXa3RMbFVUUGlMajdNbndxaXJIQ1RE?=
 =?utf-8?B?U3R1QU1mTWpRNHpzcXZ6V1QrK05STmtrWEJaeE1VSnNob1l3V25oUHhISnV4?=
 =?utf-8?B?SUhsNkNtaFJvZ29OSUUrM3BEV1BFb1R5c0JPYW9NRGtnMkpmQUNLLzlJaHVB?=
 =?utf-8?B?d2V5WGN0N1hLSy9qUUFMclQ1SlRGUXkzOWg2em1jR1NtbHNxNXdTcEVDVnFy?=
 =?utf-8?B?VGh0MHo4MWhROGEyVkZoQkR0S3VNbmNJSHJzRTFsOEJyQld2QnZXTGUzTjd0?=
 =?utf-8?B?TlZTN0lTaENkMmFsWmorQURyTDE1UXYxUmRSMGh2TkRWcWl4bXdXbGsvemhQ?=
 =?utf-8?B?d0dET1V3eG15Zk8rNXFvczhDeVliY1A4OVNDV3dzUkZYeENGeWdXZUdmMTZn?=
 =?utf-8?B?ZFFCOGU4d2owUzduaG9XY3lHalZwbEtrTExGY0FBd3lKMldpRENUNTV0RVd1?=
 =?utf-8?B?MDltcDZzNW5KZTlwamkrZHpUYyt3RkV0MjJVN2xGOXBLWXpiQTBTL3BnRW1Q?=
 =?utf-8?B?L0lDb3lFdTI2b1lDck9sQWNweGpHR1llbzR2TzlaaHJSbnY2YS9UUVpXcHhz?=
 =?utf-8?B?N0dkUTNid3FQN08yQS9wbG5JMUkzZDR6ODJ5TTMrMERZYXErYm9WSE04aXkw?=
 =?utf-8?B?ckpOSDRTQythSmlIWGhubGFqcDJBUmdEWnRHZHppT011aEQwbVBTdW5zcnZG?=
 =?utf-8?B?aUhYK1NtamN1aU1nYmZ0azAyMjd4T0tlUmE3ZDhBVGY3Tml6VGd3bEQ4MzBy?=
 =?utf-8?B?ZmhVQWlvNkhuNFA2bGk1amdjd3YxRjVaSUtXZkFiSmZ6eEFHS3NlUG5GeFR6?=
 =?utf-8?B?SDM0eEh5RUpuUHlIL0x5bDVQV1NTVy9zR2JQWG1WT2F0bzQvRDBxL1BjL1hB?=
 =?utf-8?B?SnZnOTR3MEl1OTk2V0QyMjZ3MG1KdER3aDVSNVJlWEpEalZHV1ptdjR3clRj?=
 =?utf-8?B?dXNEcmw1NEZib0Y0Nk9oMmRxNEx1NzA3QUEwZ29KVTQyZU9Pc2dBYmNMdU5N?=
 =?utf-8?B?eW1EQWFIMTBwUGZpcXVJOEhha2lpaFRnM1NzM05KZ05rUGJ0SG1pZExWVDlQ?=
 =?utf-8?B?OE9kU3NhZloxUi9DTTRjM0FzR2dlUE00bEN5aGtUaS9rcnFGb0tsOVNDd1pZ?=
 =?utf-8?B?eVZSdlA3Q3l3dUdJd1Njam9BTlQ2MW10djI4S1BQNFJGZGZCTXcwNUM3Ukw1?=
 =?utf-8?B?U25LTDNjVytnWkIveHZ0czR6NTJva0xaY1VFMktsYnJ6WlIvOG56R0N4SEMy?=
 =?utf-8?B?WEFLMGd0L0pINmRDc1NHWnRGU3JYKzFWejZFUkxNbUx3V2ZyQk1lS21nSCsw?=
 =?utf-8?Q?cf16BNl6Fk670Td3heRvsALvphsXCqSBAZ?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB5306.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 21:58:32.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-Network-Message-Id: 59a9debb-9194-4a41-aa98-08d8a1449081
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zu1C5LSRJSqVo9c13EluzjnUnEWrFZv3Wn8Cp2XcyOSo0Ygr70v4WpFso1kcUtes/Pk6vzuCtQCyM3lPdrSLyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5307
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-15_12:2020-12-15,2020-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30
 priorityscore=1501 mlxscore=0 spamscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=984 adultscore=0 classifier=spam adjust=30
 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150147
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Alex,

Thanks for bringing this up. One of the opkg test framework changes 
introduced in 0.4.4 doesn't play well with hosts that symlink their 
`/tmp` directory. I have a fix for it which I'll post to the opkg 
mainline soon.

Since Alejandro is OOO for the holidays, I don't think he'll mind me 
adopting this patchset. I'll backport the test framework fix into a 
`.patch` for OE to consume with the 0.4.4 recipe upgrade.

Thanks,

On 12/14/20 1:52 PM, Alexander Kanavin wrote:
> opkg ptests regress with this change:
> https://autobuilder.yocto.io/pub/non-release/20201214-1/testresults/qemux86-64-ptest/opkg.log 
> <https://urldefense.com/v3/__https://autobuilder.yocto.io/pub/non-release/20201214-1/testresults/qemux86-64-ptest/opkg.log__;!!FbZ0ZwI3Qg!-nKzjywoAri9TTtGVweycYs2SB9nawYzY5wxthFeo-gExQXFZ_yDeIt5ijJVDbI$>
>
> Do not merge please, as this undoes my work to reach 100% pass rate in 
> ptests :)
>
> Alex

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

