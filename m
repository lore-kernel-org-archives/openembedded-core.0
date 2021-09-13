Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.26755.1631521275687971370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 01:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fNP+axfd;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48906cc4cb=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D7Q0MA004837
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 08:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=hzKVc7zJ+bD6GAZ3+ORuFIn5ClMpdNklMQ1bl0tWJ1U=;
 b=fNP+axfdVH4WMVIqxk/klzMkzsdaziV4l8+15VZax5t+53ZwzIJ90fOZB+7w45cmlfp9
 2oNb1zzJnee06pIyBuSYtDHlu3L4tt5N+8MX0yUglIXv8XAEsvtUFiLkqbaoaT52kwVC
 Fymy38WKcmEDoB6C1BrA9+yvh+yfonqSijmHvaaWGcx7U5n/Cp4MSkYn8xfm++VO3V2C
 ZvBo/AoAK6ZwJSVmGIuebda8v2XW2f1W3WUVuajBpCS9sozMXJyQsFX5g008q4pRzZuG
 pdjmD5gm9O0mvNNETyN0Qf3fe5qYFzeBaXa//0qpWOd8q4D1hHZzdIw+dhCeFpHvqc5l RA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacghdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 08:21:14 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18D8LDrH007888
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 08:21:13 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacghdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Sep 2021 08:21:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwXB7VtZ3uYmvu0RBe955hJZndygYS7UBgm2li3dGip0EBRbOjgFxNPRG7hEUNFpRq/y2WfC9rMysrcexPppcwdQA3VIKhSp7ADkCN9WmSFp0cQtcYQgj49/Rq0/siEMGjuRgpwjUfFCjlVVIyy/bPLsKwhc24PEyFJopbNsk+0jaT0a7a2S3+5l9en3OvwASw2heaFpTjk8pmeS6cvEKSUnAoYRmpRWsGHk41Jdi1r9GW6ZxImCRR3ekHHbXo98u7CS5NHSFp8Sitfem9RZJ2fWG35RmIZvXorsE2Ng3SwFPW8hwTfxl2YfaMe6X2De5PFqM4sIZCAOBdgrgcLCpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hzKVc7zJ+bD6GAZ3+ORuFIn5ClMpdNklMQ1bl0tWJ1U=;
 b=QuBLwcgCiP58qKMvwu6LKcucUxBEHdDq6MyNsYHMbQN+/QgxVzo1q4VISxlKXeTGehGaHSHubwAdwTbJN9Afa+7H3OFlqHNACpd+OFXjJOLolHkhzcAQh5qJx+TxKB5gJTkim2QmELgtpAT7mEZFzPeJH5kCoWIF9OtLhl7N4f47ps3Zh6kzCEIhHZFHJjJhxKu/fPbfxyCbXwL1UJccRatYqxxQTF1lDSEW9aSrjqHkevEDNxnKlogoUywUfTJDDcc73yLeSUV/eytBeNKI4FScxwcToaWmQgUBj7n5NKfgM9phB4XcGKrfricwTQCdIIKmDrIGqEzAinbsw2h4qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 08:21:10 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9d20:68ca:19c3:803f%9]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 08:21:10 +0000
Subject: Re: [OE-core][hardknott][PATCH] cpio: fix CVE-2021-38185
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210913044935.30958-1-Qi.Chen@windriver.com>
 <24d8ba47f26a0d99ac4f0f158283d68c3f13ecae.camel@intel.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <5389a90e-bd2e-3950-e4fc-4d1154bd8073@windriver.com>
Date: Mon, 13 Sep 2021 16:33:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <24d8ba47f26a0d99ac4f0f158283d68c3f13ecae.camel@intel.com>
X-ClientProxiedBy: HKAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:c9::11) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
Received: from [128.224.162.141] (60.247.85.82) by HKAPR03CA0024.apcprd03.prod.outlook.com (2603:1096:203:c9::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4523.9 via Frontend Transport; Mon, 13 Sep 2021 08:21:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c68644bf-c2d7-4c5e-74f3-08d9768f70f0
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5658B89A958140B90A9F2BE0EDD99@PH0PR11MB5658.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZvAzxzQvMYDH87p5Ku4gwcyHwGjD+jpXQc66f1hYxoA4u0/KJn7VME7rEIYBhSHDuKiIFMisnEAuXJd+uQQoiiKBJpAZK0iqwQnhNThraLxXr08NJN/TdPsC+rZcknRz/ywR3a9/oP8/8tLQm4aL9U2ucma2sBgPgb983r6KFb7mta617JLjk/NdYfjMU97JwQmdq3OHzvJG4qBDz/Uv5IJc6okOdVIw6s63ZVbcx3bZbSsliCxNmuQbHuAmWpbpi+/MccpsIQXZDcMPa0Xw8qD091NWp1rKAQi/nVjU5AvxDcqw5McrxG42GBC9rrD/4vV4VvuMtb0oJbWSPDFMUX6rTyWPyPYuJ/IF6RwzD12hN+SVY8j26ut6rpIW7qWPiVn64w21wXczpD9QNUf17puv+/mJylAC1g/XRvnEeZNt6j7VxaBk/BYRyC3GSrKlh+WD7gl44ArzLZL4TZEghMgv1EmvBDQVQ364JDS+v4krDxqgCqHKUHHoID9wFLoQLfqxNqod4GM4ievFBc/7LLGJxKrCEABbwRY4iZbxDRRIAVP+cVqjDzEd+swyq6lQwKZN5hiTcj6a+0M9sW5vQRzabdf4ptwGgR4WYui2XMOInThuTFNzawgOayc7S+rVoThtE7OJsZZSwjYdrjEqUltrrcSg4GjkuAhSkNeq7ty6AIeEsdLCRUKtpNz8sS7fasZMJtcwJdrrnhyq+az8VLCrCz48EOYMWx5vhrNNbpmeby5ZWmYNXlXvztEqZnGItSUjf92SNb/mPD6a7xa7L829uHYLSGr0f+QUSPNQrIR8kRNkl1/lZNm+7x4H1e3frQFcLeKpwwOxeRL5rCdJu8XLPxGHQJZcees6BrYgRLTxNlbKXKEokMqIt4j7/1sf+cEoQrWHPTj3A8+v2Dbqon7nXVZ/bPE3Tqk/wwHzqtQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(346002)(39840400004)(366004)(376002)(31686004)(38350700002)(38100700002)(6706004)(110136005)(66556008)(66476007)(2616005)(956004)(2906002)(6666004)(66946007)(186003)(30864003)(6486002)(86362001)(83380400001)(478600001)(53546011)(966005)(8676002)(8936002)(5660300002)(26005)(16576012)(316002)(31696002)(52116002)(36756003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cHZYTHdkdmplVFRTb2FtYVBFdWQwbmRCN0hiS3JxNXZ6aEIrVHl3OUxvNE1x?=
 =?utf-8?B?V1dZNm9DOExvQkxTMW9uSTFpeHowNGRvSHVsRkgvMk1EL0djcngwaG9wL0pU?=
 =?utf-8?B?QlZwRGlrTVlQdldFSjc1ekdIaS9GWDB3d0dZczdMMk9pTXJFK3dWK3RIbW1E?=
 =?utf-8?B?NnZwc0xBbmRUcHc4Vms2WkJiczR1SW82bURjUWp5WS9FSFNOQ1k1cVhIa3dr?=
 =?utf-8?B?djZZM0MzVzI4c2FOSjR1cU5VR1hnWVVSSGtYT2VidTZwQlE4aGk0bDhmRUZP?=
 =?utf-8?B?dG8vV0wrTDRkWHFCUEFGVFNudTlSMU1PNWZ6Nkc5UU15R3JZZ3MwWk9YUVlX?=
 =?utf-8?B?OGR0aHBLVjdPNmRsZ2hNYWI2ZGxNdlBMTGxVSFJDRFZEOG9FekwvZjRrZDQ5?=
 =?utf-8?B?ZVRRY1V6U0xEekJQdmphbTFpUDE0bkZWYUpXVXU5YlFEZHY0VkFJSHpIUlZK?=
 =?utf-8?B?K1MwNGJDWW4zR1JxSmJSR0c4dWtOQytzcXQvUkhYMFJTd01ncWxMaS9aYmtP?=
 =?utf-8?B?dDBheFdQZ1VmS0xnamVCM0FhTFpRTFNDczFocmpINythNkZQRlY0aFB2cHNZ?=
 =?utf-8?B?U1BMbzh0SkVxVXdoSkhRWDAzVUVNMGV5aFlmR3RIU1Z3QWJpUkNqQ0VhRTRx?=
 =?utf-8?B?U243bWYzQ1A3Z2htaEVkNGMyNk9Sb2VyV1djOGxicEpMU3VXT3dVMjlzbXJJ?=
 =?utf-8?B?dkFoTk43b0xGS0J1Zkl3UmNFV01kc08rd01pdVZvY0pmV2pQb2NMQkhwUXlz?=
 =?utf-8?B?OUpsazRqRXhZZmlqV28rZjBYcDdaSGxuV0ZoTGhQcDM2NldoQmVwT3VyV3du?=
 =?utf-8?B?Tndmam13c3RaaGJkcExiODBvV1dtc2VRN05NVjcrK1k0eHYveU00WFdYRm94?=
 =?utf-8?B?QWZ6NzNEU3MyYWVGNE1vMEM2TTl2ZTJ6WlJxUzRsODd1OFBMOU45T0FYaUNO?=
 =?utf-8?B?Yk5uamFqemcxc3g4YnNkei9xN2tHRU04WktZbndBTWU1V0ZwTFVlY01WNzRv?=
 =?utf-8?B?YzVlYWxYZ1U5VUVEem1aU0VVM05wb3c1TWtjeVN6dWJCWGhtblZBODBjUWlm?=
 =?utf-8?B?Y1oyTjYrQVg1K25hMUVCTnB5OTJMZmxYRnAzL0RyM0cyNytMUjBaOTBOZlRS?=
 =?utf-8?B?Q2JNQ0RmMXlRSzlWWTQzTDZEVzhNd0hjQUREY05Rczd0dmFZMytHTkV5Mlov?=
 =?utf-8?B?ZUMzRHhUOTNmRU8xeFFHVzR5NG5pajhuUHBJUjVBSG5tSmJCNEV6bW5qTHAr?=
 =?utf-8?B?WHlXTExsU2ZXQ2tVbTkzL256VzdmOVJxanU5VXNYa2h4TUhHWkZXcEJncXpF?=
 =?utf-8?B?Q0pDREpZSVY5WURleWo3VzNoZ2JndW1wWjByQ0NhbHFOUThPMmFYN3B2WGFG?=
 =?utf-8?B?UkIyQkFhZ0RJZUo2cnkyWnhoVU9tM2Ywbk5uSEtBd2RwdzJhRzNqYlhnZUJ1?=
 =?utf-8?B?WG1oUnlYOERiSVhOUHJPUm9od3gxdmRsSW9SVzdHa3pZY1J5K3BHUVBFZ1dy?=
 =?utf-8?B?MWRSN2x4d08zTWlueUZBOEhEZFJaYUVrVGIzK2ZJZ3RwL1F3ZzZQVkxPa2I5?=
 =?utf-8?B?V1BBWjQxajVqWC9RQnQrUHVPcGxoaTJhQTNsMDRyR1pGaDkyejdVZ0FRMU8z?=
 =?utf-8?B?KzhZeGFwc2RBTlp2andUVzB6dlFycUVZdXRLcFZnc2ExWi9FZ1NXTDZqYWVj?=
 =?utf-8?B?TXpXNlpCSkh0NzVIVVVsQkQ0T2RqWkttSE5DRWNrNWFyc2tMdU1Oa1hFNVNN?=
 =?utf-8?Q?zUiQ2dKKPXKPnqH7Y5oVi0BuacYWcd8l4twu/ds?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c68644bf-c2d7-4c5e-74f3-08d9768f70f0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 08:21:10.0756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll+ZVpyO33aJufsChb1astPgSvjzPYw+h+RYhloEzihGSGlSlcf+c61uhvAYhaJAKYJz9GK4fSwNE1kSQYsDjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5658
X-Proofpoint-ORIG-GUID: 6swva-Li9_nhjMr2tY2EsXS0iVhajYrc
X-Proofpoint-GUID: w9smdWcPJiY21hSd00RigN65lY_dupTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130055
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just found that Ross has sent out a patch for CVE-2021-38185 and it has 
been merged in hardknott.
So please ignore this patch.

I'm also curious about how you spot such issue. By double checking the 
commit logs in cpio repo?

Best Regards,
Chen Qi

On 09/13/2021 03:11 PM, Mittal, Anuj wrote:
> It looks like this has introduced regressions and we'll need at least
> these two too:
>
> https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=dfc801c44a93bed7b3951905b188823d6a0432c8
> https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=236684f6deb3178043fe72a8e2faca538fa2aae1
>
> Thanks,
>
> Anuj
>
> On Mon, 2021-09-13 at 12:49 +0800, Chen Qi wrote:
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../0001-Rewrite-dynamic-string-support.patch | 458 ++++++++++++++++++
>>   meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
>>   2 files changed, 459 insertions(+)
>>   create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-
>> dynamic-string-support.patch
>>
>> diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-
>> string-support.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-
>> Rewrite-dynamic-string-support.patch
>> new file mode 100644
>> index 0000000000..93ed05184f
>> --- /dev/null
>> +++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-string-
>> support.patch
>> @@ -0,0 +1,458 @@
>> +From 0cdda8baddbbc50a4212e36a470053ac624075bb Mon Sep 17 00:00:00 2001
>> +From: Sergey Poznyakoff <gray@gnu.org>
>> +Date: Sat, 7 Aug 2021 12:52:21 +0300
>> +Subject: [PATCH] Rewrite dynamic string support.
>> +
>> +* src/dstring.c (ds_init): Take a single argument.
>> +(ds_free): New function.
>> +(ds_resize): Take a single argument.  Use x2nrealloc to expand
>> +the storage.
>> +(ds_reset,ds_append,ds_concat,ds_endswith): New function.
>> +(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
>> +* src/dstring.h (dynamic_string): Keep both the allocated length
>> +(ds_size) and index of the next free byte in the string (ds_idx).
>> +(ds_init,ds_resize): Change signature.
>> +(ds_len): New macro.
>> +(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
>> +* src/copyin.c: Use new ds_ functions.
>> +* src/copyout.c: Likewise.
>> +* src/copypass.c: Likewise.
>> +* src/util.c: Likewise.
>> +
>> +Upstream-Status: Backport
>> +CVE: CVE-2021-38185
>> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> +---
>> + src/copyin.c   | 40 +++++++++++------------
>> + src/copyout.c  | 16 ++++-----
>> + src/copypass.c | 34 +++++++++----------
>> + src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++-------------
>> -
>> + src/dstring.h  | 31 +++++++++---------
>> + src/util.c     |  6 ++--
>> + 6 files changed, 123 insertions(+), 92 deletions(-)
>> +
>> +diff --git a/src/copyin.c b/src/copyin.c
>> +index b29f348..37e503a 100644
>> +--- a/src/copyin.c
>> ++++ b/src/copyin.c
>> +@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE
>> *tty_in, FILE *tty_out,
>> +   char *str_res;              /* Result for string function.  */
>> +   static dynamic_string new_name;     /* New file name for rename
>> option.  */
>> +   static int initialized_new_name = false;
>> ++
>> +   if (!initialized_new_name)
>> +-  {
>> +-    ds_init (&new_name, 128);
>> +-    initialized_new_name = true;
>> +-  }
>> ++    {
>> ++      ds_init (&new_name);
>> ++      initialized_new_name = true;
>> ++    }
>> +
>> +   if (rename_flag)
>> +     {
>> +@@ -779,37 +780,36 @@ long_format (struct cpio_file_stat *file_hdr,
>> char const *link_name)
>> +    already in `save_patterns' (from the command line) are preserved.
>> */
>> +
>> + static void
>> +-read_pattern_file ()
>> ++read_pattern_file (void)
>> + {
>> +-  int max_new_patterns;
>> +-  char **new_save_patterns;
>> +-  int new_num_patterns;
>> ++  char **new_save_patterns = NULL;
>> ++  size_t max_new_patterns;
>> ++  size_t new_num_patterns;
>> +   int i;
>> +-  dynamic_string pattern_name;
>> ++  dynamic_string pattern_name = DYNAMIC_STRING_INITIALIZER;
>> +   FILE *pattern_fp;
>> +
>> +   if (num_patterns < 0)
>> +     num_patterns = 0;
>> +-  max_new_patterns = 1 + num_patterns;
>> +-  new_save_patterns = (char **) xmalloc (max_new_patterns * sizeof
>> (char *));
>> +   new_num_patterns = num_patterns;
>> +-  ds_init (&pattern_name, 128);
>> ++  max_new_patterns = num_patterns;
>> ++  new_save_patterns = xcalloc (max_new_patterns, sizeof
>> (new_save_patterns[0]));
>> +
>> +   pattern_fp = fopen (pattern_file_name, "r");
>> +   if (pattern_fp == NULL)
>> +     open_fatal (pattern_file_name);
>> +   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') != NULL)
>> +     {
>> +-      if (new_num_patterns >= max_new_patterns)
>> +-      {
>> +-        max_new_patterns += 1;
>> +-        new_save_patterns = (char **)
>> +-          xrealloc ((char *) new_save_patterns,
>> +-                    max_new_patterns * sizeof (char *));
>> +-      }
>> ++      if (new_num_patterns == max_new_patterns)
>> ++      new_save_patterns = x2nrealloc (new_save_patterns,
>> ++                                      &max_new_patterns,
>> ++                                      sizeof (new_save_patterns[0]));
>> +       new_save_patterns[new_num_patterns] = xstrdup
>> (pattern_name.ds_string);
>> +       ++new_num_patterns;
>> +     }
>> ++
>> ++  ds_free (&pattern_name);
>> ++
>> +   if (ferror (pattern_fp) || fclose (pattern_fp) == EOF)
>> +     close_error (pattern_file_name);
>> +
>> +@@ -1196,7 +1196,7 @@ swab_array (char *ptr, int count)
>> +    in the file system.  */
>> +
>> + void
>> +-process_copy_in ()
>> ++process_copy_in (void)
>> + {
>> +   char done = false;          /* True if trailer reached.  */
>> +   FILE *tty_in = NULL;                /* Interactive file for rename
>> option.  */
>> +diff --git a/src/copyout.c b/src/copyout.c
>> +index 8b0beb6..26e3dda 100644
>> +--- a/src/copyout.c
>> ++++ b/src/copyout.c
>> +@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
>> +    The format of the header depends on the compatibility (-c) flag.
>> */
>> +
>> + void
>> +-process_copy_out ()
>> ++process_copy_out (void)
>> + {
>> +-  dynamic_string input_name;  /* Name of file read from stdin.  */
>> ++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
>> ++                                /* Name of file read from stdin.  */
>> +   struct stat file_stat;      /* Stat record for file.  */
>> +   struct cpio_file_stat file_hdr = CPIO_FILE_STAT_INITIALIZER;
>> +                                 /* Output header information.  */
>> +@@ -605,7 +606,6 @@ process_copy_out ()
>> +   char *orig_file_name = NULL;
>> +
>> +   /* Initialize the copy out.  */
>> +-  ds_init (&input_name, 128);
>> +   file_hdr.c_magic = 070707;
>> +
>> +   /* Check whether the output file might be a tape.  */
>> +@@ -657,14 +657,9 @@ process_copy_out ()
>> +           {
>> +             if (file_hdr.c_mode & CP_IFDIR)
>> +               {
>> +-                int len = strlen (input_name.ds_string);
>> +                 /* Make sure the name ends with a slash */
>> +-                if (input_name.ds_string[len-1] != '/')
>> +-                  {
>> +-                    ds_resize (&input_name, len + 2);
>> +-                    input_name.ds_string[len] = '/';
>> +-                    input_name.ds_string[len+1] = 0;
>> +-                  }
>> ++                if (!ds_endswith (&input_name, '/'))
>> ++                  ds_append (&input_name, '/');
>> +               }
>> +           }
>> +
>> +@@ -875,6 +870,7 @@ process_copy_out ()
>> +                        (unsigned long) blocks), (unsigned long)
>> blocks);
>> +     }
>> +   cpio_file_stat_free (&file_hdr);
>> ++  ds_free (&input_name);
>> + }
>> +
>> +
>> +diff --git a/src/copypass.c b/src/copypass.c
>> +index dc13b5b..62f31c6 100644
>> +--- a/src/copypass.c
>> ++++ b/src/copypass.c
>> +@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name,
>> struct stat *st)
>> +    If `link_flag', link instead of copying.  */
>> +
>> + void
>> +-process_copy_pass ()
>> ++process_copy_pass (void)
>> + {
>> +-  dynamic_string input_name;  /* Name of file from stdin.  */
>> +-  dynamic_string output_name; /* Name of new file.  */
>> ++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
>> ++                                /* Name of file from stdin.  */
>> ++  dynamic_string output_name = DYNAMIC_STRING_INITIALIZER;
>> ++                                /* Name of new file.  */
>> +   size_t dirname_len;         /* Length of `directory_name'.  */
>> +   int res;                    /* Result of functions.  */
>> +   char *slash;                        /* For moving past slashes in
>> input name.  */
>> +@@ -65,25 +67,18 @@ process_copy_pass ()
>> +                                  created files  */
>> +
>> +   /* Initialize the copy pass.  */
>> +-  ds_init (&input_name, 128);
>> +
>> +   dirname_len = strlen (directory_name);
>> +   if (change_directory_option && !ISSLASH (directory_name[0]))
>> +     {
>> +       char *pwd = xgetcwd ();
>> +-
>> +-      dirname_len += strlen (pwd) + 1;
>> +-      ds_init (&output_name, dirname_len + 2);
>> +-      strcpy (output_name.ds_string, pwd);
>> +-      strcat (output_name.ds_string, "/");
>> +-      strcat (output_name.ds_string, directory_name);
>> ++
>> ++      ds_concat (&output_name, pwd);
>> ++      ds_append (&output_name, '/');
>> +     }
>> +-  else
>> +-    {
>> +-      ds_init (&output_name, dirname_len + 2);
>> +-      strcpy (output_name.ds_string, directory_name);
>> +-    }
>> +-  output_name.ds_string[dirname_len] = '/';
>> ++  ds_concat (&output_name, directory_name);
>> ++  ds_append (&output_name, '/');
>> ++  dirname_len = ds_len (&output_name);
>> +   output_is_seekable = true;
>> +
>> +   change_dir ();
>> +@@ -116,8 +111,8 @@ process_copy_pass ()
>> +       /* Make the name of the new file.  */
>> +       for (slash = input_name.ds_string; *slash == '/'; ++slash)
>> +       ;
>> +-      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
>> +-      strcpy (output_name.ds_string + dirname_len + 1, slash);
>> ++      ds_reset (&output_name, dirname_len);
>> ++      ds_concat (&output_name, slash);
>> +
>> +       existing_dir = false;
>> +       if (lstat (output_name.ds_string, &out_file_stat) == 0)
>> +@@ -333,6 +328,9 @@ process_copy_pass ()
>> +                        (unsigned long) blocks),
>> +              (unsigned long) blocks);
>> +     }
>> ++
>> ++  ds_free (&input_name);
>> ++  ds_free (&output_name);
>> + }
>> + 
>> + /* Try and create a hard link from FILE_NAME to another file
>> +diff --git a/src/dstring.c b/src/dstring.c
>> +index e9c063f..358f356 100644
>> +--- a/src/dstring.c
>> ++++ b/src/dstring.c
>> +@@ -20,8 +20,8 @@
>> + #if defined(HAVE_CONFIG_H)
>> + # include <config.h>
>> + #endif
>> +-
>> + #include <stdio.h>
>> ++#include <stdlib.h>
>> + #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
>> + #include <string.h>
>> + #else
>> +@@ -33,24 +33,41 @@
>> + /* Initialiaze dynamic string STRING with space for SIZE characters.
>> */
>> +
>> + void
>> +-ds_init (dynamic_string *string, int size)
>> ++ds_init (dynamic_string *string)
>> ++{
>> ++  memset (string, 0, sizeof *string);
>> ++}
>> ++
>> ++/* Free the dynamic string storage. */
>> ++
>> ++void
>> ++ds_free (dynamic_string *string)
>> + {
>> +-  string->ds_length = size;
>> +-  string->ds_string = (char *) xmalloc (size);
>> ++  free (string->ds_string);
>> + }
>> +
>> +-/* Expand dynamic string STRING, if necessary, to hold SIZE
>> characters.  */
>> ++/* Expand dynamic string STRING, if necessary.  */
>> +
>> + void
>> +-ds_resize (dynamic_string *string, int size)
>> ++ds_resize (dynamic_string *string)
>> + {
>> +-  if (size > string->ds_length)
>> ++  if (string->ds_idx == string->ds_size)
>> +     {
>> +-      string->ds_length = size;
>> +-      string->ds_string = (char *) xrealloc ((char *) string-
>>> ds_string, size);
>> ++      string->ds_string = x2nrealloc (string->ds_string, &string-
>>> ds_size,
>> ++                                    1);
>> +     }
>> + }
>> +
>> ++/* Reset the index of the dynamic string S to LEN. */
>> ++
>> ++void
>> ++ds_reset (dynamic_string *s, size_t len)
>> ++{
>> ++  while (len > s->ds_size)
>> ++    ds_resize (s);
>> ++  s->ds_idx = len;
>> ++}
>> ++
>> + /* Dynamic string S gets a string terminated by the EOS character
>> +    (which is removed) from file F.  S will increase
>> +    in size during the function if the string from F is longer than
>> +@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
>> + char *
>> + ds_fgetstr (FILE *f, dynamic_string *s, char eos)
>> + {
>> +-  int insize;                 /* Amount needed for line.  */
>> +-  int strsize;                        /* Amount allocated for S.  */
>> +   int next_ch;
>> +
>> +   /* Initialize.  */
>> +-  insize = 0;
>> +-  strsize = s->ds_length;
>> ++  s->ds_idx = 0;
>> +
>> +   /* Read the input string.  */
>> +-  next_ch = getc (f);
>> +-  while (next_ch != eos && next_ch != EOF)
>> ++  while ((next_ch = getc (f)) != eos && next_ch != EOF)
>> +     {
>> +-      if (insize >= strsize - 1)
>> +-      {
>> +-        ds_resize (s, strsize * 2 + 2);
>> +-        strsize = s->ds_length;
>> +-      }
>> +-      s->ds_string[insize++] = next_ch;
>> +-      next_ch = getc (f);
>> ++      ds_resize (s);
>> ++      s->ds_string[s->ds_idx++] = next_ch;
>> +     }
>> +-  s->ds_string[insize++] = '\0';
>> ++  ds_resize (s);
>> ++  s->ds_string[s->ds_idx] = '\0';
>> +
>> +-  if (insize == 1 && next_ch == EOF)
>> ++  if (s->ds_idx == 0 && next_ch == EOF)
>> +     return NULL;
>> +   else
>> +     return s->ds_string;
>> + }
>> +
>> ++void
>> ++ds_append (dynamic_string *s, int c)
>> ++{
>> ++  ds_resize (s);
>> ++  s->ds_string[s->ds_idx] = c;
>> ++  if (c)
>> ++    {
>> ++      s->ds_idx++;
>> ++      ds_resize (s);
>> ++      s->ds_string[s->ds_idx] = 0;
>> ++    }
>> ++}
>> ++
>> ++void
>> ++ds_concat (dynamic_string *s, char const *str)
>> ++{
>> ++  size_t len = strlen (str);
>> ++  while (len + 1 > s->ds_size)
>> ++    ds_resize (s);
>> ++  memcpy (s->ds_string + s->ds_idx, str, len);
>> ++  s->ds_idx += len;
>> ++  s->ds_string[s->ds_idx] = 0;
>> ++}
>> ++
>> + char *
>> + ds_fgets (FILE *f, dynamic_string *s)
>> + {
>> +@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
>> + {
>> +   return ds_fgetstr (f, s, '\0');
>> + }
>> ++
>> ++/* Return true if the dynamic string S ends with character C. */
>> ++int
>> ++ds_endswith (dynamic_string *s, int c)
>> ++{
>> ++  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] == c);
>> ++}
>> +diff --git a/src/dstring.h b/src/dstring.h
>> +index b5135fe..f5b04ef 100644
>> +--- a/src/dstring.h
>> ++++ b/src/dstring.h
>> +@@ -17,10 +17,6 @@
>> +    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
>> +    Boston, MA 02110-1301 USA.  */
>> +
>> +-#ifndef NULL
>> +-#define NULL 0
>> +-#endif
>> +-
>> + /* A dynamic string consists of record that records the size of an
>> +    allocated string and the pointer to that string.  The actual
>> string
>> +    is a normal zero byte terminated string that can be used with the
>> +@@ -30,22 +26,25 @@
>> +
>> + typedef struct
>> + {
>> +-  int ds_length;              /* Actual amount of storage allocated.
>> */
>> +-  char *ds_string;            /* String.  */
>> ++  size_t ds_size;   /* Actual amount of storage allocated.  */
>> ++  size_t ds_idx;    /* Index of the next free byte in the string. */
>> ++  char *ds_string;  /* String storage. */
>> + } dynamic_string;
>> +
>> ++#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
>> +
>> +-/* Macros that look similar to the original string functions.
>> +-   WARNING:  These macros work only on pointers to dynamic string
>> records.
>> +-   If used with a real record, an "&" must be used to get the
>> pointer.  */
>> +-#define ds_strlen(s)          strlen ((s)->ds_string)
>> +-#define ds_strcmp(s1, s2)     strcmp ((s1)->ds_string, (s2)-
>>> ds_string)
>> +-#define ds_strncmp(s1, s2, n) strncmp ((s1)->ds_string, (s2)-
>>> ds_string, n)
>> +-#define ds_index(s, c)                index ((s)->ds_string, c)
>> +-#define ds_rindex(s, c)               rindex ((s)->ds_string, c)
>> ++void ds_init (dynamic_string *string);
>> ++void ds_free (dynamic_string *string);
>> ++void ds_reset (dynamic_string *s, size_t len);
>> +
>> +-void ds_init (dynamic_string *string, int size);
>> +-void ds_resize (dynamic_string *string, int size);
>> ++/* All functions below guarantee that s->ds_string[s->ds_idx] == '\0'
>> */
>> + char *ds_fgetname (FILE *f, dynamic_string *s);
>> + char *ds_fgets (FILE *f, dynamic_string *s);
>> + char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
>> ++void ds_append (dynamic_string *s, int c);
>> ++void ds_concat (dynamic_string *s, char const *str);
>> ++
>> ++#define ds_len(s) ((s)->ds_idx)
>> ++
>> ++int ds_endswith (dynamic_string *s, int c);
>> ++
>> +diff --git a/src/util.c b/src/util.c
>> +index 4421b20..6d6bbaa 100644
>> +--- a/src/util.c
>> ++++ b/src/util.c
>> +@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
>> +   FILE *tty_out;              /* File for interacting with user.  */
>> +   int old_tape_des;
>> +   char *next_archive_name;
>> +-  dynamic_string new_name;
>> ++  dynamic_string new_name = DYNAMIC_STRING_INITIALIZER;
>> +   char *str_res;
>> +
>> +-  ds_init (&new_name, 128);
>> +-
>> +   /* Open files for interactive communication.  */
>> +   tty_in = fopen (TTY_NAME, "r");
>> +   if (tty_in == NULL)
>> +@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
>> +     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor
>> changed from %d to %d"),
>> +          old_tape_des, tape_des);
>> +
>> +-  free (new_name.ds_string);
>> ++  ds_free (&new_name);
>> +   fclose (tty_in);
>> +   fclose (tty_out);
>> + }
>> diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-
>> extended/cpio/cpio_2.13.bb
>> index f4df826ed9..c65d6980f7 100644
>> --- a/meta/recipes-extended/cpio/cpio_2.13.bb
>> +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
>> @@ -9,6 +9,7 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
>>   SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>>             
>> file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>>             
>> file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
>> \
>> +           file://0001-Rewrite-dynamic-string-support.patch \
>>              "
>>   
>>   SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
>>
>> 
>>

