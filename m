Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.8034.1624973165476693697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 06:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LgN4vcgU;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28145e51a4=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TDJEoN006338
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 13:26:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39fj000rj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 13:26:02 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15TDQ21r018224
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 13:26:02 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 39fj000rj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jun 2021 13:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHfMBKXthh8pdMqAKDSq9Ua8coE0WNK4e+XjDCrDPKRMQJcS9+AGgmXRwKC13mEZL7/ngcEo6/v2vMuoGaykypjAvEE/015XLQBDz9u6EujCh722PsSAZhzwticJh3087SvyRwllxjBh2MK+8TIBMxgCTSAIHrDGLSxtMBtEYcv1vosto1VwLJeLU01f6ubIU6PDzjZnCFk3aWE77jOITOgQOVgiA1jZW8/dHR4cOSvb0ByARBK3FeDPuyZeq7ifpcvoBFPK8Ws+sgXTgUxVK+ERLRqejFP/QAZ87ofcPj+KXNRVJqExK1Sv8w600dQC0en0lwFFcJdPXhFTzwg7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOX6jAwWpbUV/fKVVavu1pYBqsINJ7sVQgpvI6eDmqA=;
 b=k9RskkXrXjJzJTVoN6JI8hz8vVcUeGV78gIJD0+cWm8pWa8BfpqD20NOMioxRBt65KY6IqTuLiZSSDxbRSCe44PZUxIj5DNXSVpUINyXgBkPpR0wAivZEskaY6j408mBzspBFiamVT5PyKzTYs4z/a1HlzWuwQ93m9TOosnKDJd7DsUKrA+K4QOQMLRYx+v9jl1aDSgXoa5nnkkh2SjLjwT1LvLu3Z/R210RKbOpsWLkISutix/5yhWRYjseQUcFWZOMUfqD4LLZaxZHYPQ9pOj0h85WdRTlRKoNkZ5Hi/fGxEFvEVYln9DzcZ+nU4WgJdM86zF2mh3Ab8RJW2faIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOX6jAwWpbUV/fKVVavu1pYBqsINJ7sVQgpvI6eDmqA=;
 b=LgN4vcgU5V9A/xIRiby2C/Zo9nzouYBQqPLCQ3N0W20HrmSfNHb7OilLhcQPXOYxbL7j8dnGJZj1t+uwpR4gkHAc8xNfKgq1P2GpyPKwW1YctVUJVwh41fYgv5LhZxockeo8kp/7IhJpyqmiZoCbj22o7KhYEuJDAMBHihmsQ04=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1785.namprd11.prod.outlook.com (2603:10b6:3:10d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.24; Tue, 29 Jun
 2021 13:26:00 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::c413:9f51:c32e:a579%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 13:26:00 +0000
Subject: Re: [OE-core] [hardknott][PATCH] Binutils: Fix CVE-2021-20197
To: Vinay Kumar <vinay.m.engg@gmail.com>,
        "Mittal, Anuj"
 <anuj.mittal@intel.com>
Cc: "vinay.kumar@blackfigtech.com" <vinay.kumar@blackfigtech.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "rwmacleod@gmail.com" <rwmacleod@gmail.com>,
        "umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
References: <20210429113046.172473-1-vinay.m.engg@gmail.com>
 <4064cc6aa03b56a7e3aa5e403fc4c17ed5bef77d.camel@intel.com>
 <CANUMPcUyz7S_ynQGEtoq03TjnD-ccJZF9=Vfin+QGe7TW_GkEg@mail.gmail.com>
 <eba9f2cbb58cee3ae79e3db6ffd968d2f1c0d5c1.camel@intel.com>
 <CANUMPcXF9CyFh0ETfgHdR6w-qKb-i7Hr7h68wyE_+_7xu3y+dQ@mail.gmail.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <f744803f-849c-905f-fe7b-70b7b6a8730b@windriver.com>
Date: Tue, 29 Jun 2021 09:25:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CANUMPcXF9CyFh0ETfgHdR6w-qKb-i7Hr7h68wyE_+_7xu3y+dQ@mail.gmail.com>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0283.namprd03.prod.outlook.com (2603:10b6:a03:39e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20 via Frontend Transport; Tue, 29 Jun 2021 13:25:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5122de4a-be13-4a5f-ef8e-08d93b016f94
X-MS-TrafficTypeDiagnostic: DM5PR11MB1785:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB17853E8B297468DF2FE2E097F8029@DM5PR11MB1785.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4BB1aBhjMRFrAkdG1bFNway/wcYTkpRiVBPtQn3V4l1nhdzoczq0yOmb0TcKJa1GdkYj5IKdml9UkZK79VSHcA+of8l1hE6Lri7PxGkgBxxE2sZ1hlGrq+i8J5lmvYBMfGzmGCWsQ2fVzX7r/U0oeW2C/8VgIiVvKCHFUdzQ7c8FnOjLREMZEy01HRt3CXrFpm/+mHknb18ejGVxIPIgwZ2UOTEi6KcNUS/B2g0cxSXxKzfZYSp0rKf1hXCH0P6EYsLnwpBRJKsk15sHDSwoVdh6PQVcB20HPAgwpzNeqlljsrvFoEQGt034YHW+o4NtQ4Q1Xhg50muJjAM58NEw1vsFtcZHEpsrlFzPELD1zsKF6BQ/jnk9bDKhYH3TNWWovmrQ9qv/1dDQnG3xy8+amUesunVbuR2T0EseZWk9eB0pUFZui63klTqN/nI8Hp1PSPJKAHsKHpDSpKrT24ReGlzihHmXsW0GAylI5QUJMWHu6uklhoZapB8baD+9pnNj4hZwy6IOshkxIPhzstV9mxD+Ee8iEHOlG2Nv7pP2/gAeIHIU67Wg077rx8kFt+KHcbv9kb+CJvQGkDkh4+grO8EhBljlolY3hCpHmEOUXzZAxOXfR/AVhrnNa+giQR5/JwKU4qxsJ2lrmgKBl/xhZM1A0v9BxyOEx/Fy48/rk7HxmoTEhGfzzF/w62FWcSJlOBWI3xyjQmhRjZ+VaYRlBCZsN8ZzXSQLsdJ/YgASWgt73Ws1XaywMy9T1d6mS54aF7U6fv6bon8QojK0LA4p9BQyQ6XN4ISK4QluODCswiDCDEREPzdZnx6LbwXW60Jn9zcb35URQGqemSsXCbH9al0LPk97x5QS7T/VgxwXDFrrSqlXinidhD0ME6ymFSqU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(396003)(376002)(346002)(36756003)(38100700002)(38350700002)(110136005)(6486002)(83380400001)(66476007)(2906002)(26005)(8676002)(66556008)(31696002)(8936002)(66946007)(86362001)(52116002)(956004)(2616005)(478600001)(186003)(316002)(16526019)(16576012)(53546011)(5660300002)(4326008)(54906003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXc4b1hielY4dnB2c3hoQ09HMk5MTitHc1k5dXViN09rU01vdkNwVEVYOWxz?=
 =?utf-8?B?UHJLOW4zZzZJVnhpRVgzUDh5b3RSWUxyNnBhZkhIOHhkNC95dVpDNVQ5ZGFC?=
 =?utf-8?B?RnhXNHlJbUNKV3BmQUdTdDVEV0dmd3FHcm54RjdvVWpTc3lLUk5CZ2RxZklK?=
 =?utf-8?B?WGhIR09ITkR6U20xMFVyOG9zZmNra1pVZnpiNWgwUFNMeGsvZWlvWlg2dWN4?=
 =?utf-8?B?cDZ5MTVYcnhQZDVJa25rY2dCYWFTZFAweHpCT05OTVh2ejNHc2sveWUrT1NO?=
 =?utf-8?B?c0diVEpzS2wxNWNibmVtWkJScE9FL0pSK2YwSDlVYnd3STJaZk42eVQxMHA5?=
 =?utf-8?B?cHRrMjNLc3pUNys1QmhMVTdqUnZXdmxIZWNzLzJ5VmszMTVCSSt5ZVFxcjll?=
 =?utf-8?B?QU5qTjNWNW9BUFp5cENLN1QrbUNQUmZyKzJ4M1ZzUWJiZk9tcHFSWEVoRTNy?=
 =?utf-8?B?bHJVcnBVb0RTVFhEbmJTYTlSeTZZVGl2dmtrRnFKaUIvQmZUci80NUllQUx2?=
 =?utf-8?B?MGQ3K1pwS0E1SnIrWFU3NDZKSDM4Z2lsU2oyWThYeUFjNERrRU9zMjhhb0Jl?=
 =?utf-8?B?VTVKNU5taTNQUm8vRElRVk12OFJtNkI4ZWxCUCtMZ3c5ODl0YzJtUkhWUk5p?=
 =?utf-8?B?NFlwUXVMcFhjSmdnMDNyNzNYWDBtQ3BrR0VrenYzNHkzdE92RVl1Smdrc2JG?=
 =?utf-8?B?MEhqRGozS2pxS0I3cE5KbHBVNUV6bDNiQVRwQUhvZ0IvT2RvMGRFNlA4bEZo?=
 =?utf-8?B?VUhsZjV6NzdaUThhTnRZNmhXRHRnaUNRUEQwM2VrWTlIT2c5OHB5SG81QlpI?=
 =?utf-8?B?OTJ0WkxLc29wREFsZEZiZ0pPQUZNa0dQY3NJcFBpWm5pbHpWVncrUWxzSnZy?=
 =?utf-8?B?bklFNDY4VklwcG9mOWw4eW5zNC9LU1Q2bitUKytLOUoxbVB0WWpxSDkvQzA5?=
 =?utf-8?B?Uit2WEZXbHlEQkhnMC8vRUw5N1lqY2ZNUDEyT01kWFdRSjUzR0FRM2JZbUNu?=
 =?utf-8?B?RjRNQXBLeWFFTUh3MGRORzk3SkRMVVIxbzdWQ3NDQUNNUVpvWUgzS3ZIc1I4?=
 =?utf-8?B?alh6cFo3TXp0dGpGV1ZDcjN6TmxnVjVaZml1cUJIZWJXV0xoSzB5V2RNNU9K?=
 =?utf-8?B?Zkw0c2FUVFlaUWlMQzFrZi9XQVFoNFVEUVA3dlkrZHhHRmtWemZmNmR4UFhB?=
 =?utf-8?B?MVppN0l5enlxZEY3SE1BQktzeE1BR0FEdVVzWldYWVA0Z0tlZVBRS0k4ZUFB?=
 =?utf-8?B?MlBNdTE1U01xTmdDc055MldyU2liSTd1b1YwVXJuMjZIMVMwTGVCMFhlVm5m?=
 =?utf-8?B?UVM5S0MrZng4UWxPcnhzZVo4d25jNDEvRW93UGpMekFWRjR3QzFPZFd1SXFp?=
 =?utf-8?B?aDFnaVZMbkhoTEh4VnJWZjNTMXc4dk9aTG5kZzh4MVVaVlM1U0RrU3BMSGs5?=
 =?utf-8?B?U0JLVEV5VjJMdTcvSEExamxwSE0wZ0FFenkyRzkvK3NPTkNSZGttOERqd0pK?=
 =?utf-8?B?Z1pvWUU2anN4dkhRc0RpKzZlRTNhSVFBSU1TRXpaN0pKZVJ1VzFqdkxlOVha?=
 =?utf-8?B?ZldrL1BPS3R4YW90emE5MHFuWDZCREI5NXhsRkNVditqZTlKbmdVUENxc0Rh?=
 =?utf-8?B?TG1iNmZlTHVBTmF4bVo0K0x6RFgraFA4MmZzR2d3YXZ3V0NpOVVYS3JGTjVJ?=
 =?utf-8?B?bXVzc1dVVFRwMHlEVUo0ME5QdEpGbnF2eFZ0c003by90WG1tWml4K0I3a0hI?=
 =?utf-8?Q?yam9QNgKAaAhytbpmWbXJuiY/WDGCMVtEVh30HP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5122de4a-be13-4a5f-ef8e-08d93b016f94
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 13:26:00.4902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aoF7U9TYv1zazZAES6aw/oT4a53eVuQYgJhgKN/GlGRkLO3RmbxRzC5e3YDYNR+QVqxYgSk7BJHJY6uTBr19eM1AHVpnLJguUw+yWIwsojU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1785
X-Proofpoint-GUID: J2I9wk_U0JGwxN85cHFnO3mXQ39adqz_
X-Proofpoint-ORIG-GUID: eaPvylpYEU0NlhJa51XtPjhkkhjFu4us
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_06:2021-06-28,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290090
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-05-07 10:48 a.m., Vinay Kumar wrote:
> Hi Anuj,
> 
>>> Right now, the patch header is wrong as it's not the upstream commit that it is claiming to be.
> 
> Created 3 patches.
> For the patch of commit "d3edaa91d4cf7202ec14342410194841e2f67f12"
> planning to use
> below patch header from the commit it is cherry picked.
> Also, mentioning that in "Upstream-Status" section as below,
> ====================================
>>>From 95b91a043aeaeb546d2fea556d84a2de1e917770 Mon Sep 17 00:00:00 2001
> From: Alan Modra <amodra@gmail.com>
> Date: Mon, 1 Feb 2021 02:04:41 +1030
> Subject: [PATCH] pr27270 and pr27284, ar segfaults and wrong file mode
> 
>          PR 27270
>          PR 27284
>          PR 26945
>          * ar.c: Don't include libbfd.h.
>          (write_archive): Replace xmalloc+strcpy with xstrdup.  Use
>          bfd_stat rather than fstat on iostream.  Move stat and fd tests
>          outside of _WIN32 ifdef.  Delete skip_stat variable.
>          * arsup.c (temp_name, real_ofd): New static variables.
>          (ar_open): Use make_tempname and bfd_fdopenw.
>          (ar_save): Adjust to suit ar_open changes.  Move stat output
>          of _WIN32 ifdef.
>          * objcopy.c: Don't include libbfd.h.
>          (copy_file): Use bfd_stat.
> 
> Upstream-Status:
> Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=95b91a043aeaeb546d2fea556d84a2de1e917770]
> Used commit "d3edaa91d4cf7202ec14342410194841e2f67f12" cherry picked from commit
> "95b91a043aeaeb546d2fea556d84a2de1e917770"
> CVE: CVE-2021-20197
> Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
> ====================================
> 
> Other 2 commits ids patch headers are identical to the cherry picked
> from commits.
> 
> Regards,
> Vinay
> 

Seems that this patch was not merged to hardknott.
I didn't see the version split into 3 patch on the list.

Vinay, can you please re-submit if you agree
that splitting it up into 3 patches makes sense.

-- 
# Randy MacLeod
# Wind River Linux
