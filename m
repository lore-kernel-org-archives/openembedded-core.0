Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.44554.1624264836217755572
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 01:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UATxkn+N;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=18066996c9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15L8ZHBk027229
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 01:40:35 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39a7760ddb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 01:40:35 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15L8eZkQ002969
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 01:40:35 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 39a7760dda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jun 2021 01:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bQheIkfMTW18rPRFFGeTLKUir813s1dlVz77zLkgqf79CvyUBVNlsEPRtV960x3zIusO5qx70/jO4JuVDvoTUvs4CT7zrYPOkwa7gIirzuQ25wj8pGVefTWUCra+FPBl8PeE6ICTyL88rZsu6IsPDtK84HVUFrQBDqz3i6Pcxf+KuWki5f9ji+VXbQAxJFswQVsLmLdQfOvTAg1Gjz3kf1qL/DHEXwPdowFhMm17S7Rd5jogeZkbMOR0lUW1+vJg9Lifqvdg1np4Zg6ZQ1vjxRWWfs+GJNsflGaSiLEjyRn+ULMtGV15JzWrVsslAf0EQt8vvAcwsTaUIa+iu9ncLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JyK2c+M9xA9KVlyCUY4I6T4zrA8Dw2NR0qUerU6HtE=;
 b=hfAo6mUqQMkzoT7u11s1FGMN21Tm6/lWn0Bz7YLDZ2fYKgROwtZOatJmVp7OTxJZIYF6/NLzrpGvoS9FM+XbUxKBH7ROLorSDSsP6XUgI/Sw1Hs9UYYe80FZfWkqmpsE+UzRlQKUitrIp+SGWzU2AYTExfXzNbtdaAb6PI4c01PDHcIc2ZPR2QxMAu61CDoSqKrbk033dclkJj5SNhrBPfJseUTj06rQy/L7YWm/LfoPRqAHscAjFuwhrVfDTUFQcT9Z7Y0rZ1FwRj7sjsQYtBjfmrPvFzwp9XzeQz8NgTs3Jxs+/nUdBqt+UKUjsSt2YZUnQ5MzBo+Uy07pBwu4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6JyK2c+M9xA9KVlyCUY4I6T4zrA8Dw2NR0qUerU6HtE=;
 b=UATxkn+NFdXFkuZuagJLftrYm8vzoEWf5N4TRC27Gq2ZFNzOt1c9Ci1ect/bXh9KUs4qifiaAEoT8usj/TjnNm+eLlKAtSfRifZEeMNjUu/3hNr7uD7Zwe4+b0UwcwtEbR/QEllTiqisnE9OiaFruxYVmqqDxyUjVWiDMa/J7AE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB0079.namprd11.prod.outlook.com (2603:10b6:301:6b::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Mon, 21 Jun
 2021 08:40:31 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Mon, 21 Jun 2021
 08:40:31 +0000
Subject: Re: [OE-core] [PATCH] perl: avoid the source file patched twice
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
References: <20210618023036.26144-1-mingli.yu@windriver.com>
 <YNBNT5AZL9W6WYp0@piout.net>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <2ebb61fd-6468-15ed-6cfc-39f9cfb845b3@windriver.com>
Date: Mon, 21 Jun 2021 16:47:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YNBNT5AZL9W6WYp0@piout.net>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0089.apcprd04.prod.outlook.com
 (2603:1096:202:15::33) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR04CA0089.apcprd04.prod.outlook.com (2603:1096:202:15::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19 via Frontend Transport; Mon, 21 Jun 2021 08:40:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 33cc1a73-81e9-4683-89d7-08d934903ab5
X-MS-TrafficTypeDiagnostic: MWHPR11MB0079:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB007917186CA001ECA2E7BA6EF10A9@MWHPR11MB0079.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zgbl81iBGDxndttV8whAlO5SbtCFp7AWEH9rS9nTx+psdbcVnKxB/mLl8wiTaaJA8ZhlJV/1wTbbOgixlPC3v2FxRtzxGXgrRuZfgJRpwHksB5+3QF9RjfiK5bDEaaQHwwtQ5Sh8v5Mv9yUfIM9+t4ZbnTOch+9ygoImjk3kSEBHh543xmC8cbal3HE6NpiqEJhP3T9DXngSpUT6gMRWxKdfmki/mwtYczVFNee9oJ7JWybFtbCVC/zEQi0y8FbkS7oFd0nf23ZhGp/fOcCn+B+Tv+VCLwLXmLadLt16lMbFfu6Z61dOLs6SoAOTIbbIU2b2bzPYViGL6K2BQ/AAxfHA8FQ8xSUyCITgqkXbVBZLdSWvILjOmHXusrl+G+Ofbw+YhTiW/yeyM7/9fVurse+Fs2Qyf2bGMKopWperdD4Y0BeOe+IRSu42e+p2VTcX20TaF+difJqB+VPG506tXuvNuASmtYXTq8SHmwu3H+9+E36QF29/4zEacbN37JNqD4YeUA4VtMuQ5U6I8SKVzcrJEYNpwXNMj9t3qWkHpWQtna2otMVuyQ1rNDMHG5AJtuj/yZNXLkTPgNoRi5baZ02bfOS8SoI1u0KmpDiBoKPkvSAGfq9WU6ZLJtsbc3CErRDOW4SD/ma3O/9eBCspIrUjGiyakronk3L1h/hE7mqfISVWwg+3ldxzyYrR3KFjLrkgG7XxQnBkUQ3viatGyqxEij61Pcgbu09eVrXAraP06EeMJhE93YXchsRuKDAtnSumwXaXYs5aV6KO2AfWn1TpvCWe6Wc9IK/c3F1oLrHLmpU16cmOkZTqvHuzuUcfVznPEMHW9IJmtiHNVjetw4GQKCe7CwG+MY09qEBtt6b9YiwnRVbhh+fAgjzEKImlk2E+qNLx4VoDm5WN9oaNpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(366004)(346002)(39840400004)(396003)(4326008)(186003)(16526019)(26005)(38350700002)(38100700002)(6706004)(6916009)(36756003)(31696002)(53546011)(86362001)(478600001)(52116002)(966005)(8676002)(6486002)(6666004)(83380400001)(316002)(16576012)(8936002)(66946007)(2616005)(956004)(66556008)(2906002)(31686004)(5660300002)(66476007)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXZkN2xnUTlXVzVPVU5YbDJXVFpUNGF2WjZ3REV4OElodlJZVGhmWDF0UHd0?=
 =?utf-8?B?RFlOeFpGV1lDY2hRSkRQVDVXdHVPUDJ2TUtZeTBTS3JxenlJMktZTm84Wm1V?=
 =?utf-8?B?dnY1NTdyVmd4a25GUmhuNm1zY2c5cWxmVHFvdWlrNFZBUnB6TjE3RHhJNXo4?=
 =?utf-8?B?NWk3VWI0bkZldFF1ZnpPWEZCYlUzZndRTEsvaTVVQ2lDZElvOEZGUEVGVU1r?=
 =?utf-8?B?a1JjOHNxcjVLcUVOajRBVDNQbEhhWHhWVzJ5dXRVZGxJb1lIeVY0Vm1hSnpU?=
 =?utf-8?B?cnVnTG8xNlBEblc3RmZSNDdaQXJpNDRIK2lrUk1MRkxnSjVQNHUwOTBvZ20z?=
 =?utf-8?B?LzFFQWFnMCtkSEN1ZUIvYm5YWmptQVdpbm1udlhkQXlVWCt2TlA5K0UxaVUy?=
 =?utf-8?B?UjJ3NUhTV3d1a0h6bXFGMFZsSTZPRGo2ZCt3bGhqemx2Y2srQjVWRkY0a0Q0?=
 =?utf-8?B?YmxDZnpOOVJIeC83NEZzV25OQUVybjJVN2hycGRVT3djV0JBZFhLeXhFNGUy?=
 =?utf-8?B?UUVkUEVwWDNZbTJPNmFQTVlYRU5JYjM3RG41ZDk0TjFkOXZKK3FEcld4ZWsy?=
 =?utf-8?B?TWR3YXU2UnpwWk1pWmxjWVg4WW9VK1RSQXNnU0VwdTJzTGt4VUNHMWJaN0dW?=
 =?utf-8?B?SGd1OUUrMU9KNGlna241RVJhb2FCNDVUYkpuK25KZ3RPRkJGMFB3K2RkRWda?=
 =?utf-8?B?M2dRckFzVXk4WXRReS9BUU5pcnlXU0JFVWNUUnNKUVBnMGdPUVNQdGNaZUo2?=
 =?utf-8?B?YzI2WFJ1anhYUXpSaEovRkM1cWpmYW1HQitMSVN1bVpFODRSeDYvazB3Umgv?=
 =?utf-8?B?MWNGZVdDWGV0WmVzb0dxVU5OMG9uWFJHdXVXaXJuRU5hR0JoS1RlM0lLSmY5?=
 =?utf-8?B?b2NzSTZjU0QyYldFbDl6dzBzVEkwMmFRSis1cFZSTGdTRHduc3hOQWIwSHlK?=
 =?utf-8?B?dXVvSmkvdnhuZkVyZXNzeFowMWtmbUpwb2NmdjJVWXFBNHBzN0N2cmFtekFr?=
 =?utf-8?B?c01NN2dCZ0JEK05idVh0ZVUweFFJTXdIbk85VVo3eXp4b09vOGJzNGRXWDFM?=
 =?utf-8?B?VThjb0drazlhWTRHaDFIeVBoOTRwRlNaS2o5S3c0ck5HTHNlcXJkK1JTSENP?=
 =?utf-8?B?OXg2YUVpUmtIVExYYWlXUDZ6bGcvRWVWSUg1ZThLZTU1NnFEbXFmVXk5TlVn?=
 =?utf-8?B?VzgyU0Z0UGczRC84dnBqWnJlUnFLTE90ODUreGI2UGQ3cWJrOWVFTzBmK3pl?=
 =?utf-8?B?Z2x4K29HWUphbHhJbjczK3p6TmFZZ1E4dXB3cTN6RGRkMU1lOFR2NWpKRXFy?=
 =?utf-8?B?TzRRek5vTGlya3FnSDMvemhDN25qc2pURlloakg5cGhQTXRNUGhiRWxFb2ZY?=
 =?utf-8?B?RGtsYnpOenhRdDNaUjM2UFA3emtlWWN1V0ozV00xUnJxQnF6Z2UybXp3anpy?=
 =?utf-8?B?eVNlcmdPTDBEUENDR2hxQU5IMDkySWQycHMzY1hyWjU0S0dLS2ZUVDl3YTJ1?=
 =?utf-8?B?QlZnNUFreTBNV05INzVFNHprRUFwS3M5a2ZBUlkyMHcwOGoySHdTWllDMnJz?=
 =?utf-8?B?Ly9GZCt5QWYzSmNtSklML2dkMjdEL2puSlFNRE53YVVnVVBJTnJmMFJ0VzhR?=
 =?utf-8?B?TUFRcnFIMitFdkdOS09FVDg5T3ZlNExIaGl6c3NaWmYxcEU4a0FZdE4xRDQz?=
 =?utf-8?B?NC9FNjNWTVE1SkhJcHFEYkhPK0tPT1ozcG81b2R3dW11WjhlSWwvdGQ1d2V5?=
 =?utf-8?Q?JLiK40ga/tLwPCrxUBXAsJDDSn1AVWzAvUC5Pta?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cc1a73-81e9-4683-89d7-08d934903ab5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 08:40:31.6169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceg8bIIDnBKgEW0FlBslbZ6NIrrR+pLuwgeZP3YY4IQJy2Xort5IXwt2Fy+oSQ4XzUc5vVnblyDlQqRuHijhQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0079
X-Proofpoint-ORIG-GUID: H4qPxFeIYx3cm8an1UMnXXc1x-v995eK
X-Proofpoint-GUID: GeZI9tEtgBn92-W_roUHnO4T9HETr1-Q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-21_03:2021-06-20,2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106210049
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Alex,

On 6/21/21 4:26 PM, Alexandre Belloni wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> Hello,
> 
> On 18/06/2021 10:30:36+0800, Yu, Mingli wrote:
>> From: Mingli Yu <mingli.yu@windriver.com>
>>
>> After the commit(60dcb230f6 perl: split perl-cross into its own recipe)
>> introduced, the source files mainly come from two parts, one is from
>> SRI_URI during do_fetch and the other with below means during do_configure.
>> do_configure_prepend() {
>>      cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
>> }
>>
>> And the source files will be changed during do_compile with below
>> logic in Makefile.
>> $(CROSSPATCHED): %.applied: %.patch
>>          patch -p1 -i $< && touch $@
>>
>> And there comes build failure with below steps:
>>   $ bitbake perl-native
>>
>> Make a change as below
>>   $ git diff
>>   diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>>   index b77bbd1fd4..4c5e35ab80 100644
>>   --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>>   +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
>>   @@ -33,6 +33,7 @@ do_compile () {
>>    do_install_class-native() {
>>        mkdir -p ${D}/${datadir}/perl-cross/
>>        cp -rf ${S}/* ${D}/${datadir}/perl-cross/
>>   +    echo "test" > ${D}/${datadir}/perl-cross/testfile
>>   }
>>
>>   $ bitbake perl-native
>>   | NOTE: make -j 48
>>   | make crosspatch
>>   | make[1]: Entering directory '/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
>>   | patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch cnf/diffs/perl5-5.34.0/time-hires.applied
>>   | patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch cnf/diffs/perl5-5.34.0/xconfig.applied
>>   | patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch cnf/diffs/perl5-5.34.0/posix-makefile.applied
>>   | File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
>>   | patching file dist/Time-HiRes/Makefile.PL
>>   | Reversed (or previously applied) patch detected!  Assume -R? [n]
>>   | Apply anyway? [n]
>>   | Skipping patch.
>>   | 4 out of 4 hunks ignored -- saving rejects to file dist/Time-HiRes/Makefile.PL.rej
>>   | patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch cnf/diffs/perl5-5.34.0/test-commonsense.applied
>>   | File perl.h is read-only; trying to patch anyway
>>   | patching file perl.h
>>   | Reversed (or previously applied) patch detected!  Assume -R? [n]
>>   | Apply anyway? [n]
>>   | Skipping patch.
>>   | 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
>>   | make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] Error 1
>>   [snip]
>>
>> It's because the source files patched twice, so let do_fetch always
>> executed to make sure the source files which come from SRC_URI brand
>> new in each build to avoid the source files patched twice to fix the
>> build failure as above.
>>
>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>> ---
>>   meta/recipes-devtools/perl/perl_5.34.0.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> index 7935a58723..2e48110d2b 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> @@ -382,3 +382,5 @@ EOF
>>          chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
>>          cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
>>   }
>> +
>> +do_fetch[nostamp] = "1"
> 
> This seems to cause:
> 
> ERROR: The perl-native:do_fetch sig is computed to be ad5d35a67fb7dfcb2a67797631d358f99809c2c568f44db1b4e866f894368d3e, but the sig is locked to b715d1392c57c5341b05be30d4cdeaf2a443bae900890da8e053b9fc1650480b in SIGGEN_LOCKEDSIGS_t-x86-64
> The perl:do_fetch sig is computed to be 83844d137b60382447e71889fc92deb568e52f2f9e8b214d86c3a608af8e8bce, but the sig is locked to a269ce4ca52954820059edc72f464379b71186be0b0bd9927b3fb3d716395e66 in SIGGEN_LOCKEDSIGS_t-core2-64
> 
> See https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/3557/steps/24/logs/stdio

I didn't reproduce the issue in my env, I notice there is a config 
"require ../locked-sigs.inc" at 
https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/3557/steps/24/logs/stdio, 
what's ../locked-sigs.inc?

Thanks,

> 
> Can you check?
> 
> Regards
> 
>> --
>> 2.17.1
>> zO
> 
>>
>> 
>>
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
