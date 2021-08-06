Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2738.1628242379240682810
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 02:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QbZ9dfFc;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3852dcc412=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1769OC11024613
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Aug 2021 02:32:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : cc : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=rEZnu0TB4SrMXKMU0Ffx/+qMZWcar52peSt+kwPgTlE=;
 b=QbZ9dfFceQ/y8JxuknSkKaivj89LFiy845dUNyh5aPfeaKqUCx1NYS8hpp8R59nPao7M
 AMr5rQK3mGk82kwyoXJZQI1Ys9EvxivRaS62wbsaMKe1m5+XzOxnjwA3ADy+s32RzMmk
 gDO7wq4Kpmsq3wfp51/ePdS1VdClXvSy4GVLWIinhmpLANq6yWMamQWp5H2ZbhSkQPmE
 ExganbOpKiyJQyGxOCU6Z+Wli2BwR/jTitUVhAXBHRJPcXEtmNz5qD/Abau9ewVy35Mw
 3bIgz5G5lQgk2t6+qzd3Or1gfCff7ZCvvx5FfKcEzhlZXSwit2CrfmxYbjg4MivXzT4u wg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a8nr7reca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 02:32:58 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1769Wwp5006921
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Aug 2021 02:32:58 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a8nr7rec8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Aug 2021 02:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oB3jveO236PPiSbme9Rpeonpf6mFKq0XDvU6/8W095bWd3kbZbcBHi+2RpovN2YQZZT/T58mPovYQFEJ2LNquL09oSM3eVfKaD/8plIuq+bp24Q/xoHoFdEcBAip8TEETj3PNV/QeffyAlB/El4NL7obI7xqWh94W450IKeEk+LcxQ4NBCcseSRnRiamkE+Gv0Ifmq7i6sw00NpOIXaZR7NKEqSgyab2mGtArQ5/XdNBOpkV0ERxB9xbWmEZWkifv1kg54bqfJumRsZnqQeCf44Z5vLC/qqL5E21ZO/mVm1rqvDmrydtAaMiJovBZlvXpBku6xtcrTdevbtumyu5LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEZnu0TB4SrMXKMU0Ffx/+qMZWcar52peSt+kwPgTlE=;
 b=XkGKOF0ItnhdwoLUDM2DMRzDMRtqMZCWAfzBTZp1aotZGnRLOCo2vx/B3J4A1V3/IC6+AzSGFBrqkrlnW8kGVOIIgbG8swxIKRl4MKguFGOMHRDlN1XI0UPoOW53i+CZJxk1EG6mPzxK9lmJv0qjF0Hq5YJwSFRDZOjxlFYvruNWNBmwzz2IfsvymsnhRLPpv5dJ7b9eYPxi1XkUmtIBE1UTtJKfQ5I458fP0lAVUeeXGy+mh6jAFc/dEbr2djIahEX2yPYOOjKlo+A4Bm1ISDiLfj/lcNlfgPKQpW1uQPVpsYkWxN+UkccM2DP3ekIwdsvP/LBjW3qtRx2VLLezBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5587.namprd11.prod.outlook.com (2603:10b6:303:139::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Fri, 6 Aug
 2021 09:32:56 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a074:6be8:3148:f63b]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a074:6be8:3148:f63b%3]) with mapi id 15.20.4394.020; Fri, 6 Aug 2021
 09:32:56 +0000
Subject: Re: [OE-core][PATCH 1/2] convert-overrides.py: also convert comments without a leading whitespace
To: Martin Jansa <martin.jansa@gmail.com>
References: <20210806090332.14065-1-Qi.Chen@windriver.com>
 <CA+chaQdFS4pb7QOsdd3Rwqi7Qva9z-Wh7EAd=g7+96=fd1C_wQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <337b6850-712e-e2e8-23ce-d7e8e61955db@windriver.com>
Date: Fri, 6 Aug 2021 17:44:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CA+chaQdFS4pb7QOsdd3Rwqi7Qva9z-Wh7EAd=g7+96=fd1C_wQ@mail.gmail.com>
X-ClientProxiedBy: HK2PR02CA0158.apcprd02.prod.outlook.com
 (2603:1096:201:1f::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0158.apcprd02.prod.outlook.com (2603:1096:201:1f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 09:32:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec6d4446-ac63-4b53-074e-08d958bd2c3b
X-MS-TrafficTypeDiagnostic: CO6PR11MB5587:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5587AB2A35A0A3EF07693CC1EDF39@CO6PR11MB5587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:324;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZjSHofKJzqpuWm525k9yqoPpNUpOi4RCWkmiVWrHSWeB7fzQ9LqdEATIYqqeVeqraBSUc3muI8h7BCUR+tpbHrMMvESAgw2Ou9SBuK5DZmontUFDFnyXZkqUEnb1OKQ2S/BfESuM+pWyPXiZRBXejEm/5ZY0xGGjzqiZOemxUEVW7l19t5iczYDphlkYYJdT/o4od/Rjy6MLK9+fNV5kcw7Uw9TZZ7vzDngSJCKVC3pseBziJHj+GrPogtCyJp6GDfCmdL0JC2f5lzjI+pCsxFKZLk5cCocathFFzFkM6/cTu2Eq5nDpcAeoYHrLxt9DwXgXgn2BIWUEcxCyoQ/vmSBXqSvNTO6v3bsdiug8xiKh71Ll6ZoukdEmRSCrB03Ja33xB3x5sMiB0TrAlkVxLs4xBazxnlLR2otx1A2/h46AbNZUDNJUaXUIB+csBGERVkugFHkzMlcZZqQFqYg7nGpKS2d4vfW9FQttnyFxkPT627x9/fYR3FDeA2k9S5FznPE6ntpvF9+/0jxz7Uc3j+RsjYhIdqZniG712fTXOEIrJgsIeWqYcjxgSGQbWMNXoNFoqaqzN1Qc01rRFN69rT6/8beRz8Ln52L0bSNW9CiBK1ggRW4rUnTsl1OQwd3+mMYHRNhVGBk9g7/icPD6PJQuidFk4LRjna1G25TFFaM8orBsI1wkFzo8uozbqMLHqBhU4J5jZK81OrN+sA0Xw5iFUVMnQ6oFFCs/iVeL7jRmtvJeGbr5ee4yzlikIeUQO9zP0Tb/vt4Re4UDAL5gKH/3O4Fq+mgLehQaO1VndbITg8xMYJ7M9P6ODAewBrU7wgM9SXWj8P7IU6CD7HWcUuOJ0Mi9ME1icJo81jgbnLahgZKUjFJJ68pen1/A8KJ4LPWVFHVxQQtwfDPt4WdXaS1wABjbS7dwr3qtA6TsPDY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(366004)(396003)(346002)(8676002)(83380400001)(52116002)(4326008)(16576012)(166002)(2906002)(53546011)(38100700002)(38350700002)(478600001)(2616005)(26005)(956004)(186003)(66946007)(66476007)(6486002)(86362001)(6666004)(5660300002)(6916009)(6706004)(66556008)(33964004)(36756003)(966005)(31696002)(316002)(8936002)(31686004)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L0FGeE9HMHNUMXMxYUhIY29VT09hSWptT2E2cW1DRDFjWE9MS3hkS3ZZeFpE?=
 =?utf-8?B?MC9YTTNURXJTQ0JQRmg3aG1ab0k4RDRIdmVOa2xPUTZzTlZISSs0c3RNTS9j?=
 =?utf-8?B?clA5cEFjUTVXcTI1czM3RzFUeit6NnhiNkV0eENXSWxmcDBjN3ZzZUJEVXJw?=
 =?utf-8?B?OU43SzJnZ1RuMkpBTU4rWk85K2c2aDZmeW1JYncvKzg4ZGdKRzlpU3V2MUE5?=
 =?utf-8?B?ZVcxcDQxRzhOcHo5SjNEY003Y1hVYVZKQUdCeHlQL243T1kyQ1RKYW5GemxD?=
 =?utf-8?B?aWFKZTBSMCthNStIL1d5dkJKZS9hYkdMUXVBSEVqT1FTeFFEVUJ1NVgwU2RY?=
 =?utf-8?B?amNJUG1nNmRZTEoyLzFoTFJDdHUvS0ZCR0lIRlVmaHY2RFN6UWtyY2FnbWxH?=
 =?utf-8?B?Q2xaQW0vajR0aTY4VzJKeHlQUDJudTBrY096Q1ZzRVBiOXVKUnpWZUZSenAw?=
 =?utf-8?B?VUpiQnlGUEhST1pmMEd5NzdvWUtuWjJ6c2pvN2pTWG91TG54d3BLSzFvNm83?=
 =?utf-8?B?cjMrQ3p2YWtjMXJTczdIMDRxTFcvYmx4UXJkN2lZTmNDMUttbW5NQy9Vd1E3?=
 =?utf-8?B?ZG8zWGlWV204ZEhXRzJqc3U1cklsaXJTUVFrMDJaWDloVkRGczQvby8xb2s4?=
 =?utf-8?B?VzZ6MlhpdzV3NnhDY3NldFNaWlJDb2hqVDZwQjYrSTR1UWV3d0E4cnRmL0t3?=
 =?utf-8?B?TUVxWHdhSEYxb2xia0UzMVdaWUdCdVVrY0Z0RVAwcEc3bjYwK2gzWmxpNnJh?=
 =?utf-8?B?cXhiZDVWVjNIYnM4QWcxY2krREtzaXRMSjNMckIrTG5hc1lJZWltMlBMSDBx?=
 =?utf-8?B?SDFzVDRReVhKSGpIMUNVSWtHc2o2eWEwM1VCcHlPcGF6TE5pL2hJd2psbFk2?=
 =?utf-8?B?L2xaTXNHZEczc2ZBR3JnSXhlVVIrRDNhYWRoeTVRcHlQYVcwUzdrMzIxQVBn?=
 =?utf-8?B?MHFvczVTWllMRUx6QWVEN1dsZ0hlWjU5bVY1S0g2SCtJZ2M0d2ZHcG04cVY2?=
 =?utf-8?B?czY2bE54MGpRNHV6UWtqM004d05ISmlhY3MydnJ4UytvbjZnYTdqVy9XcEM3?=
 =?utf-8?B?RlBTUVFwOW1OWmtJOUNRODg4MDJtZ1hkbVQ0MlVNb2E1RWRjK3l6SU9DRXNu?=
 =?utf-8?B?RUdrcmVDQWZkc2JhWVJiMlBJVm9JUTNqcXJXdGZJOUJoREdVeXN0YmF5V3ZR?=
 =?utf-8?B?OWw4NU44UTBieU11ZHpPemNWYXNXQnZ2ZUx6RENJOVVpMGpmQktFVzJtVlBo?=
 =?utf-8?B?VE9sSDN5bjBqb21vQTFFOEpySjUzWkV5UGRHNjUxOEJ2dURGV0FCK3FpcFlL?=
 =?utf-8?B?ZkVob1NFRGkySWkvRjVocThjQmtONmN0V2F6TnVlZk5GYmxzNDF5WmxkQjA1?=
 =?utf-8?B?eWcvTGQ0b1U2RnpUYlBPQTFGdVdaWElrU0dHQXV3SERJeFhKL045b2RKYmlR?=
 =?utf-8?B?TXBSMzA3YXJNNzh2MUN3Q2hCdmxyUytlTEx5OXZhZG8yY3FmOU1Hd2hIazhq?=
 =?utf-8?B?bXdUd0UzUzBJdHgzMUdYQnVOVE5YbHNuTFdYdGdsS204QS9RT0hycDM0eGhq?=
 =?utf-8?B?U1RlVkZQQ0pub3psQXY4cTIwV044VGJUWFhmS3YzSmRUdE9FQm5ydDA3ay9X?=
 =?utf-8?B?VnBpS3Rqc3hKRmFSUm4rM1RHSHBFeWVUMmRoNWMvN2VZZHFqcVBpU2NxQk9n?=
 =?utf-8?B?QXRMa0xObVZPT2R1eDI5dGhvTkl3ZVUyQXRJTXdSK3BRRjR5ZnJNV1N2MVlq?=
 =?utf-8?Q?/+Jq3FJfuH72pGV6Zxiul2XlRr3+6bZgnIx8Qe+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6d4446-ac63-4b53-074e-08d958bd2c3b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 09:32:56.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vVf12ZL9Gi+3GgZ4JtbqobJ6ngR2/8dhqvwDoQYJDq+gQWi4BC6FWeRSho1JnXx178smRevYrKVIFrGZITDVmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5587
X-Proofpoint-GUID: Xd3_1IDVczX-pLyPpLB2dYsHwg6sBDpt
X-Proofpoint-ORIG-GUID: Z6xzLN8q-IhG2sZxR6atDvfuprq2Zmz2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-06_02,2021-08-05_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108060067
Content-Type: multipart/alternative;
 boundary="------------E6B66F572A0BBB010284FD85"

--------------E6B66F572A0BBB010284FD85
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Got it. I've sent out V2.

Regards,
Qi

On 08/06/2021 05:25 PM, Martin Jansa wrote:
> Can you please bump the script version as well?
>
> On Fri, Aug 6, 2021 at 11:03 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Currently lines like below are converted.
>       e.g.
>       # IMAGE_INSTALL_append = " A"
>
>     But lines without a leading whitespace are not converted.
>       e.g.
>       #IMAGE_INSTALL_append = " A"
>
>     We should be converting both.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      scripts/contrib/convert-overrides.py
>     <https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$>
>     | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git a/scripts/contrib/convert-overrides.py
>     <https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$>
>     b/scripts/contrib/convert-overrides.py
>     <https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$>
>     index e4a310d1d6..4d41a4c475 100755
>     --- a/scripts/contrib/convert-overrides.py
>     <https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$>
>     +++ b/scripts/contrib/convert-overrides.py
>     <https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$>
>     @@ -69,15 +69,15 @@ packagevars = packagevars + imagevars
>
>      vars_re = {}
>      for exp in vars:
>     -    vars_re[exp] =
>     (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp),
>     r"\1:" + exp)
>     +    vars_re[exp] =
>     (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp),
>     r"\1:" + exp)
>
>      shortvars_re = {}
>      for exp in shortvars:
>     -    shortvars_re[exp] =
>     (re.compile('((^|[\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
>     '([\(\'"\s:])'), r"\1:" + exp + r"\3")
>     +    shortvars_re[exp] =
>     (re.compile('((^|[#\'"\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
>     '([\(\'"\s:])'), r"\1:" + exp + r"\3")
>
>      package_re = {}
>      for exp in packagevars:
>     -    package_re[exp] = (re.compile('(^|[\'"\s\-\+]+)' + exp + '_'
>     + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
>     +    package_re[exp] = (re.compile('(^|[#\'"\s\-\+]+)' + exp + '_'
>     + '([$a-z"\'\s%\[<{\\\*].)'), r"\1" + exp + r":\2")
>
>      # Other substitutions to make
>      subs = {
>     -- 
>     2.30.2
>
>
>     
>


--------------E6B66F572A0BBB010284FD85
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Got it. I've sent out V2.<br>
      <br>
      Regards,<br>
      Qi<br>
      <br>
      On 08/06/2021 05:25 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote cite="mid:CA+chaQdFS4pb7QOsdd3Rwqi7Qva9z-Wh7EAd=g7+96=fd1C_wQ@mail.gmail.com" type="cite">
      
      <div dir="ltr">Can you please bump the script version as well?</div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Aug 6, 2021 at 11:03
          AM Chen Qi &lt;<a moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Currently
          lines like below are converted.<br>
          &nbsp; e.g.<br>
          &nbsp; # IMAGE_INSTALL_append = &quot; A&quot;<br>
          <br>
          But lines without a leading whitespace are not converted.<br>
          &nbsp; e.g.<br>
          &nbsp; #IMAGE_INSTALL_append = &quot; A&quot;<br>
          <br>
          We should be converting both.<br>
          <br>
          Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$">convert-overrides.py</a>
          | 6 +++---<br>
          &nbsp;1 file changed, 3 insertions(+), 3 deletions(-)<br>
          <br>
          diff --git a/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$">convert-overrides.py</a>
          b/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$">convert-overrides.py</a><br>
          index e4a310d1d6..4d41a4c475 100755<br>
          --- a/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$">convert-overrides.py</a><br>
          +++ b/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://convert-overrides.py__;%21%21AjveYdw8EvQ%21PD0spdg2c_3A47Id6ecejSLJcClzE1tewbyquzswai_YYcg_XxOQyX2l9AH3cc9f2A$">convert-overrides.py</a><br>
          @@ -69,15 +69,15 @@ packagevars = packagevars + imagevars<br>
          <br>
          &nbsp;vars_re = {}<br>
          &nbsp;for exp in vars:<br>
          -&nbsp; &nbsp; vars_re[exp] =
          (re.compile('((^|[\'&quot;\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp),
          r&quot;\1:&quot; + exp)<br>
          +&nbsp; &nbsp; vars_re[exp] =
          (re.compile('((^|[#\'&quot;\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp),
          r&quot;\1:&quot; + exp)<br>
          <br>
          &nbsp;shortvars_re = {}<br>
          &nbsp;for exp in shortvars:<br>
          -&nbsp; &nbsp; shortvars_re[exp] =
          (re.compile('((^|[\'&quot;\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
          '([\(\'&quot;\s:])'), r&quot;\1:&quot; + exp + r&quot;\3&quot;)<br>
          +&nbsp; &nbsp; shortvars_re[exp] =
          (re.compile('((^|[#\'&quot;\s\-\+])[A-Za-z0-9_\-:${}\.]+)_' + exp +
          '([\(\'&quot;\s:])'), r&quot;\1:&quot; + exp + r&quot;\3&quot;)<br>
          <br>
          &nbsp;package_re = {}<br>
          &nbsp;for exp in packagevars:<br>
          -&nbsp; &nbsp; package_re[exp] = (re.compile('(^|[\'&quot;\s\-\+]+)' + exp +
          '_' + '([$a-z&quot;\'\s%\[&lt;{\\\*].)'), r&quot;\1&quot; + exp + r&quot;:\2&quot;)<br>
          +&nbsp; &nbsp; package_re[exp] = (re.compile('(^|[#\'&quot;\s\-\+]+)' + exp +
          '_' + '([$a-z&quot;\'\s%\[&lt;{\\\*].)'), r&quot;\1&quot; + exp + r&quot;:\2&quot;)<br>
          <br>
          &nbsp;# Other substitutions to make<br>
          &nbsp;subs = {<br>
          -- <br>
          2.30.2<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------E6B66F572A0BBB010284FD85--
