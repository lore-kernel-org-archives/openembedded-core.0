Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5735.1631064096403232281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 18:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=CdtrC0Em;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4885e7fedd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1881Ehit021367
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 18:21:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=B3PTqPfyzwCmT6H/BVsjOr4F8KoYb08joKwSW+cucKY=;
 b=CdtrC0EmHYlEtACuHw6+k02GWT9nep742N6eRVCMfouMY8ddI+RKy3fRgEDL1hrPC2Rs
 AQbFZ54n3FLSSaNh+aEouZLmYLNSTV3Wn0nrN7dLmUolUfATefjW40vLjEWTda4xiejy
 d1gkKL9UmJ2dMn/QLYBcYBUkw9mluRQ9SJWa3iOUwNOHrbHmKDbJ//ygaf8M+2OkMK2E
 AGEweQbAuFzbLx21OugkPjE4SKQ1Ma5UuHcmrRII/NqseWS8/XCyJnYg0A5AcSgqHvsP
 Nsor4Uguw1ia7yWlCG4LHS1gxgBNx5vsUpEzUoOZgsRyD8Q6vn33g1Nr4i3JqOzvtoBI og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcms085j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 18:21:35 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1881LYKW003422
	for <openembedded-core@lists.openembedded.org>; Tue, 7 Sep 2021 18:21:34 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcms085h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Sep 2021 18:21:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjMhAObWXciLAz44PQ/WLE01jHhqrCQAjPIV8HE4NXfM8f5IX+vDox3oPSL1MVpfLa1S8DyLyn1K2Lwjf7RA205IztMzkx3CsCeurXp5uqp4zraq366NTbd+tkt6JjByfyty+TPXHZEZ9G83YF1n/qklT75H1ejREj4xhqbMRjAIIYss8mDJqPXmKjUI36rJwVle0PmdYjogsFgKqQkW/xZVrmJUgXahprtFt2qd5aSCvj+9DfD1A75Pq2R0rhCAvN5BwUHM9xUdVTNP9yXrHE9zs+TEzzBXcQe0fVz/jxtelU+KNMABjJHYNvTQl/lX9hQVhDJTqVvwdgLz6ZyvKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=B3PTqPfyzwCmT6H/BVsjOr4F8KoYb08joKwSW+cucKY=;
 b=SgfKCruz5ncZNuBz5SDal5LG6f87YD0EEhmAVdh6lBiJ7qL7grw8r9Wp0dmCokiMVzmKoDfl1lG3tchRzUd5GGlACd1rj0OXxGr0YJUQrSLvgEq6WyLnfIDLvolMptb/GlsRjQgKgo8ET3P9GSpfdnnB+Ir9/wqPTmkuSffGDvOYwY0PbZ9qBvfE3Ki4B8eShgAJhaUmr5sBhZQKbBQb3l+Zj6GumzE71IOdqStH1DC9jY4tfWkbpE3OCQ9ypN1s28OHh1IKdPzNcvjkWys03Y1NTfgxJuDi6YpEotMlSdFeFNAg5DWbn/EwglpXC1KdP2WyCzd7K8XVt0xG6OBepw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=windriver.com;
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by MW3PR11MB4587.namprd11.prod.outlook.com (2603:10b6:303:58::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 01:21:32 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::902c:4da3:6c7a:185f]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::902c:4da3:6c7a:185f%3]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 01:21:32 +0000
Subject: Re: [OE-core] [hardknott][PATCH] Revert "sdk: fix relocate symlink failed"
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
        "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20210907062554.852167-1-hongxu.jia@windriver.com>
 <CAHtQpK7+qYwK8qa9-NwCg0FyVjsq1DsqfRwFW-3Ck8zbrQF-bA@mail.gmail.com>
From: "hongxu" <hongxu.jia@windriver.com>
Message-ID: <4c1b091d-3ba2-368c-41e6-a3aa279dab8b@windriver.com>
Date: Wed, 8 Sep 2021 09:21:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAHtQpK7+qYwK8qa9-NwCg0FyVjsq1DsqfRwFW-3Ck8zbrQF-bA@mail.gmail.com>
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
Received: from [128.224.162.148] (60.247.85.82) by HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.4 via Frontend Transport; Wed, 8 Sep 2021 01:21:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 404243c1-e45c-4add-3f76-08d97266fdee
X-MS-TrafficTypeDiagnostic: MW3PR11MB4587:
X-Microsoft-Antispam-PRVS: 
	<MW3PR11MB4587F3EA4FDEFB68AFDCFC0D94D49@MW3PR11MB4587.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:226;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tknwixsnwr2eG5Dcz/0Bb+ivRmCGihwLuL5D8GzF90lbPLWNl/REQj0GKswPPEF39grkvG3iUnlnbaEEckISoD/thyRQVwR4XNhilxSgGDpYbHxaaFY1h9hwvKbstsgYAaFTAy6bg9n4K5kdtpqt21VX04ODdSvUbidfifbYra7tWy3uKtMqraKGeJrPbQ7Z67gS7uhi1XHoU9/SpjKBsrdQwvhZvhdtTjQRfwed9I0Ru82tVx26YQMbhkKcjCAobr2kbTuDDDZEEGp+nGGSkxWo0o5VufuOAWXg87BT/rsb/opS330HyRWUcXFlwjnJWCiXO6Xow/bOq4c6wkgx2TwYiyvBmPc/mipUsE3esqHXaFinTdwqdG9OX5XukX8NJRSDsdfkHH5GcGDJpTG8LYx7bYuUo3rd3lF9ZFyV/HNVybNtcphMyTbDZAELGukvdemKtJ817uhcdoRX1Y4nlwP459zvwxfPuG4h6hmeFY9kAn7HM8JRILOHv3nd3/H2MjLs0L2MeghYR10KdjNsHJfP3DiOZymxZsyWBJ+8TILJhO3e1I6qbMiWDTjNPyOMrSgFrlvfjNfZFm/1s4kXP4ayckqoKffztNnvaReK/YKKdCwlSPJBVbTk061YeMP79ghjd63anVxOtBicJ2Dg45VSP5eLVg7vXpd4hyhYrWu+aozPmElDJ8ELQlgBGIiszcOZ/T0KfusNYAIMzuu+eWjxYjT0PI/AGNGOe670HJAlvDoRZCSyLOB2hXMmdi0BFUXpJD5aJlo+xeuNwqaMolp4ct7aKcSTv17MTBXW6IxCifhE8Wk58wUmEb28o2hKwAc42o0FpVXMB8cdGV+ITp0xCU8OZG2k04igER8rWo6SCVxOfjNMDmEuCDMgDRbKx2yBIqIVRN2F7mj/aOIDTJiZ0Y8mfxvdsV6L/OhiQrw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(136003)(366004)(396003)(8676002)(8936002)(6666004)(31696002)(16576012)(2906002)(52116002)(66476007)(956004)(316002)(53546011)(31686004)(38100700002)(54906003)(38350700002)(36756003)(6486002)(66556008)(6706004)(4326008)(966005)(86362001)(2616005)(44832011)(26005)(6916009)(186003)(83380400001)(5660300002)(66946007)(478600001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZzJwTllaZ2NaZjcyd2hqcnlqcHNFcCsxL054QU5CSHBXb1RzS1RTWktFT29D?=
 =?utf-8?B?cTdvT2hJaUhoalcySnE1alpZcFVCOG9WejdOWGxNWmNic2N2ZlVqMFVic0hO?=
 =?utf-8?B?b3VBVW5oSndqdTZ4bU5IZjJ2TEhCNmxhN3FUNy91VFVwZFZSQjR2bGdFd240?=
 =?utf-8?B?dW5TcEFwNnNrWmpxME80S0tIYW9wU3pLcjlqZUNvTlJZRnRld1YrME5KS1hZ?=
 =?utf-8?B?ejg2Nm5lWmxGWUR6ZGpNL1YvLzhKd040OXhQQjBXRHBmS2YzUVNJTDlZZDVw?=
 =?utf-8?B?MEZERkpSQnlXN1p5Y2lDczVNNHp2SEczZldacm9ib0ljKzQxWHdhMzhOVFo3?=
 =?utf-8?B?SVcydHBvV2FRbVRCQ2JKNlNOTDFOR1dkNkMzdFY5U0lOT0QvZGxUVFZUYlJk?=
 =?utf-8?B?T2RMSVdabXB5WGZZbXBFb3Q0enRTeDE0d0FyZGRxWTdrRlB2TDc5SWZ6RHZr?=
 =?utf-8?B?c0U3cDRsMVZsbG5Jbk12YUpVblVvWVZjaTRVUDRzL3NkYUJybVQzcGc2eWVr?=
 =?utf-8?B?RWQ5T0dyTXoxVDZuWm85Nm1vUFlSUVNvaVQydXFGWDk5d3N5NHVSb3lyaERD?=
 =?utf-8?B?VTg5U3V1U2hvMDFGNnJESzgzQXE5c0haSk9HTEt5aEdjV0svZE14QUs5SGt5?=
 =?utf-8?B?TWxNNCt1U3R6SkY2QWVJWDJDaVBJelVjTHh2WnR3VS9oWmc2c0pLVWVqYzNm?=
 =?utf-8?B?dmhXZnUwL1RIRlJrTURPcXhvWlhGK3FLR280cGprM0R5cEpIK2JnNlRNR3pE?=
 =?utf-8?B?Q3FJUjdnL2lJb1A3aWd6OGZjWEt0d1djb1ZOYnVQaDNtNitNbWkyTUVjd2la?=
 =?utf-8?B?cG45cHVvOXRQSzNDRnVMTUh0U2FqK1NrWlpZQnhtaU5vMStsZVQ4OVhLR2Z6?=
 =?utf-8?B?WUFqclZHdFBoVDJkOGNuVW9XcHI3aFpLN0lVSlNWMmZNdk80OXZ0clBHN3Fl?=
 =?utf-8?B?eU5XQ0wwQVZuU1Bma3BzUUxuOWNsTlVSU3pnTUYvRXpaWWsrdjJnT0pLRjlM?=
 =?utf-8?B?bzFCWDhOOEcvS1hrbXRrRGorL0F1MVNXTjFna21HTWFoUzBEWWYveDZuK3Jk?=
 =?utf-8?B?TkJMa1RHZFZIc2VBeStMQ09wWVBmbmdrSEpVeENXdkJoemdmMkZaaWQvSGlZ?=
 =?utf-8?B?TG5Da0tOUmRXM1lVMzI3T1ROcU91SkJYWGRJRlhCR1lmSGZTZHk0ZFJVSFpN?=
 =?utf-8?B?cktaZ2tXNDkrcDF5dW5GWGRRZ1lJNUEySkhMelRoYmVYM25LZ0JhbGNzN2pH?=
 =?utf-8?B?Z0JmSWM5SVRuT0M4blVnUEttckNld0o5cytnZEthZ1N4QzlxQjV2VUdjeHAv?=
 =?utf-8?B?ZlI2bGx5aVJmaDNDMUdPL0VnbjdXWk1QWjhFOFZwalprdDR5L3ovNGtpNGhI?=
 =?utf-8?B?RVROVUc3S0hmakxmdStnbWJHUnV4M1doZ0tsODB2akw0QjZBZnNYNFdTVldP?=
 =?utf-8?B?S2FJTTZxZjcvMUE3czIzQnd3d2RSaCthNThPZW12Y3JReWVRcVVQRklFOWo0?=
 =?utf-8?B?bDZveFlZd0RoY0ZQdlJadmNFS3hGQUlWNkRsTmhMSjBScDRodnkza2JqZWd4?=
 =?utf-8?B?UnRCZmM3NXphcVlGT3JVWjU1eTRtdTN1aHB5akJHaUQvTDdIZmdHVjN0c0c2?=
 =?utf-8?B?Z2piNGJTS0V5SExvVHBJQzlrMHV5R2F4Y3liMjlOZkFRc3NHVC81NlpzN0pO?=
 =?utf-8?B?cDRxbWtmVmpCYXNMTHdIRWtjZXZKRzRYTjM5TE43NWFBYW1LZC9xWS9rNnQ3?=
 =?utf-8?Q?lYH2tvxCr51XeiT+rTe9bnxwea2/hpWhZXuvfv3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404243c1-e45c-4add-3f76-08d97266fdee
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 01:21:32.7392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QyUKB4rUsLqFemepVbzXQLFdzC3wZRIPIpJ/aPcZOLzSuLMwz/Uuda/6kF51sqwEljHpyrkc8EWv58sv18T9JRCf5ysltBBCcfs6v95SiYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4587
X-Proofpoint-GUID: J2KpFdF784YCVPQUTUzHIVgQF49gqUAU
X-Proofpoint-ORIG-GUID: BTEQV3eXqIZj8ChifdNy6nPGPEy3f5-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-07_08,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080006
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 9/7/21 6:39 PM, Andrey Zhizhikin wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Hello Hongxu,
>
> On Tue, Sep 7, 2021 at 8:26 AM hongxu <hongxu.jia@windriver.com> wrote:
>> The commit [7e71acd265 sdk: fix relocate symlink failed] is used to fix
>> regression issue caused by commit [bc4ee54535 sdk: Decouple default install
>> path from built in path], but hardknott does not contain commit bc4ee54535,
>> so commit 7e71acd265 should not be in hardknott neither, otherwise it caused
>> other regression issue.
>>
>> This reverts commit 7e71acd265637d54d5bf149ea36cefa581f60992.
> This has been already discussed for [dunfell], see [1].
>
> The actual proposal was to take the second commit rather than
> reverting the first one, which Steve did (see [2]).
>
> Can the same approach be applied to [hardknott]?

Yes, I think so

//Hongxu

>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta/files/toolchain-shar-relocate.sh | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/files/toolchain-shar-relocate.sh b/meta/files/toolchain-shar-relocate.sh
>> index ba873373e2..5433741296 100644
>> --- a/meta/files/toolchain-shar-relocate.sh
>> +++ b/meta/files/toolchain-shar-relocate.sh
>> @@ -72,7 +72,7 @@ fi
>>
>>   # change all symlinks pointing to @SDKPATH@
>>   for l in $($SUDO_EXEC find $native_sysroot -type l); do
>> -       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$SDK_BUILD_PATH:$target_sdk_dir:") $l
>> +       $SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
>>          if [ $? -ne 0 ]; then
>>                  echo "Failed to setup symlinks. Relocate script failed. Abort!"
>>                  exit 1
>> --
>> 2.27.0
>>
>>
>> 
>>
> Link: [1]: https://lists.openembedded.org/g/openembedded-core/topic/85311771#155603
> Link: [2]: https://lists.openembedded.org/g/openembedded-core/message/155670
>
> --
> Regards,
> Andrey.


