Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2431.1624504929812371910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 20:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TZrG470n;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1809cdc186=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15O3JIen009627
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 20:22:08 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39bykjgsns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 20:22:07 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15O3M7OZ015829
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 20:22:07 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 39bykjgsnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jun 2021 20:22:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkZW4A1iegwTDE7Hm5sohKMp3z+BoY32NtrK9faSTQrcvAjcwnCVPxzjTZWWFxjUFlymYO3i9Csza5b91OavjgBO5M7RdZ5TuM9M7TtMxPefP+xLRSNt/r+4tRGlhquQElhIsGSgA2waM6yj5re2i3wPCXcx7X/IydFk/EFZBK2WE965DJiMRKOj+QZ+YdJ02gG0XIOvlJ41DD9pLEe6ShhyBXPqgAGliZbRCCu3LEhtcNCpGBlqp3H1YWoveyQANgHWq6utuL2NYEqIjtWExLO6PI2qZbPDdISgWkyEp6nutODfiI1nM6VwyiJcQZCPBrc5TMFbmCwCmILwkY33oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm2w62ATSY3dpZVcjR/HgmjKgx6o4j3HwV6YU3E9Mls=;
 b=Sx/YJms4vffb6oRGEyQo/isYxm+h7VDvU/EV4ZGNNU8Sd21fdlPvWd6LRGuHzptIHrVT1tPpnkANgXsmFVmL22mx60uKQ1e5nahpzsVmp2JiOZrTlIWtOg4TNqApCm/iiXKn/6kDC7E46ATx/PimKQn9iDCUeJXznE+JNmftHyVA4EqB3y2DpsJlNgLXZXkYzH8EAMYgaC371E5Dd7pVVtE9X4v/eeXfDaWI3hqY+HcEOCsRJNjBYJNvxd/8TkMt8n+3ZBgImO7m3JLoJbgWQoX5S3yh3QmbdjOugton7kZDw2mgQ0Qeb1HNSxNDEQkKL6KPFU5DSWrS38VeFjoiJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xm2w62ATSY3dpZVcjR/HgmjKgx6o4j3HwV6YU3E9Mls=;
 b=TZrG470nJp5lgSxRlvDqOozqe7rXSv2NEnrlz3Pw/+O/tQXb1L1dBFqM3W9yC1cFb1OYryqKSUisUkMhmALVldidm8ZDbsnDimEwQM+F9jLn6uV00TrKfUjiBeOkJz0CGwxrYUJSaDYZB1D+OdmoUHYuDBkZhXtVE1XIEH0hTo4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR11MB1280.namprd11.prod.outlook.com (2603:10b6:300:2b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.23; Thu, 24 Jun
 2021 03:22:02 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::ed6b:a25f:3a16:3127%7]) with mapi id 15.20.4219.022; Thu, 24 Jun 2021
 03:22:02 +0000
Subject: Re: [OE-core] [PATCH] perl: avoid the source file patched twice
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
References: <20210618023036.26144-1-mingli.yu@windriver.com>
 <5ad75eedd2ff8f0c414b9628617630774ff0e945.camel@linuxfoundation.org>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <672be83a-6dde-ae8e-43ca-62ce95b99e79@windriver.com>
Date: Thu, 24 Jun 2021 11:28:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5ad75eedd2ff8f0c414b9628617630774ff0e945.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.140] (60.247.85.82) by HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 03:22:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 89d65d3f-1f4b-4e88-cc13-08d936bf3c10
X-MS-TrafficTypeDiagnostic: MWHPR11MB1280:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB12807BAA7DB1124AFD771AE7F1079@MWHPR11MB1280.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SPSW1ekz+V5vpGJi/JB6fUeDh6TFf5iZJ5HM4TK+mXIqDx5rbbxHGsj+7UXsRtRKexBeO+eAVyfNiBt4WGDvt8a4gD7m0uUm5YFBItEH6hzRFCu9npgszCH4fZs1FnL6Gj3k3n49EEQjCWlkqLvdTtdiAW6Vre6MnG0eRKuUfyi6DX6hPqbVmfKrCQVAdLlNQn38WcJXLES69iYauGmyEgy0u8a+njbu0NRNBaaw/okZA4pT+un6ViNkx/wVneuseVwxRSml7VBRrDIRHOq9UJWMkn7AwJ/4Oix1zl3JLNXL8/eT1+FM0X150DshNIOtR9+HuV2U+/wibEseEkGJ/tCVENYBX2RU5H66NIPQVxjXfm5wWu80zI3JLwRz5/nt0QKyV2uP22Bg0CrB//tR5WNg5niHFK9y7IJiAIeleBT2DqfWz1qLCF/gShE1AkxsiTfF5clYfloM4/6AOmZhhX0U9QhEpOq3x3OvgjAFk9RCJTvrY8hhH6asH5zobGbAtQjVbPHHF77uJoeu9+gvPDqoWcPxglp+Bdo2NfGWjcjz30PvRzX9PRFiDb7GQNhOrg0vwiOL7gvTxuEXX1a1VOX86HRYigXti3sWQ211GSaplBuLwlJEG4p1fzhs7E0xELEVWPifVS121q19b7uj27VlU/uM/KzEZZ4u6w48KE4rndJGq/1240ak9CS/w01TKaSEx0x8TRMExkCoAq9m0//UUjlNn3R3hZoiAidS1X8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(376002)(346002)(366004)(83380400001)(2906002)(6666004)(6706004)(31696002)(8936002)(2616005)(956004)(478600001)(6486002)(66946007)(31686004)(66556008)(66476007)(38350700002)(38100700002)(8676002)(16576012)(52116002)(26005)(186003)(53546011)(5660300002)(36756003)(316002)(16526019)(86362001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aW40VEROMUFGVWpucCtFdzhZMSt5SzFDMUR1SHhkUXFCdlFiMXFwN252K2hG?=
 =?utf-8?B?SWJ5TVVKMXVJU2l3UVZPcUtTTTV3OTkrazB1WTNsMkpuUXc5ams0R29KdFY3?=
 =?utf-8?B?QW9BM1hCKzZhVXdqaWNndFZJaHBtbFY3V1laWWJQeE9hY0paYURhZE84Nzg1?=
 =?utf-8?B?QWtvdlBrMklRSlhJNXBtOXdKY01hWXdsK1Y0ZTAzeWJaVDlHVUFWUmcyN2x3?=
 =?utf-8?B?K1RDSHBhbU9iVUZGdjFHeFB5a2l6c3EyRTEvQVg4cngyS0MrTDBOQk5oL0Iv?=
 =?utf-8?B?ZWNZMXRoM3Z2RHAwTkNVQUloTWRkRUt4YWREQzI4eGtvSzJiZkRSakdUMk45?=
 =?utf-8?B?UVRzRFlreHFCRitsTW82cG1INDBzNXFWUWdJWlowb2RHaWthS1Vtc1pGVStT?=
 =?utf-8?B?SUpEdC9VTGc3TlBMREFNSDFWUHdxWVZyVENOMSsvb2ZJc25uNGNoS2toUjRS?=
 =?utf-8?B?aUNWRmhwaGl4M2hkbTBTd2ZMOGUxRlZKY3Y5N1JucTJuM1BHNnlLeWZyTE1V?=
 =?utf-8?B?amFVWFpaOXU4UzhuWjBkWk45NHJSaVdKK0hpS29panRHTDVUYkFYZWF2VHUy?=
 =?utf-8?B?NWxQZEtXcUlBT3NHYmREUXkyRjMwc2lYYzg3b0N0dVZWMm5JRUlmVE9PQmND?=
 =?utf-8?B?MW1uNlRXODNlYnBxYkNqWjNZS29UZkwrZlk1aUdZMUVXc0RHSTg4VVo4R3FD?=
 =?utf-8?B?OVBobStjRW56NUxjc1IwZ2VPQmNMWFJERGVDcjd0c1I4ZDdGalNNT0pITW5v?=
 =?utf-8?B?VzQ2VmJzVzJNZTFDYjBNNWtvZllwOWpPdXJvQmh1Z1NvWksySktXYndIa2RJ?=
 =?utf-8?B?NWVqQ2NCU29QekxuWGl2SURWSk9aWEEzakh4bTZaTmVUT2FoNGh3UnRyOCtO?=
 =?utf-8?B?QTdDNGlmbGhhbEtLai85QmRIeU0zRndVa0xFay83UDdoTnBoSzhMdjBwaXY1?=
 =?utf-8?B?akNiRVhPdjlrMWxJQUd2Q3ZKUjh5QVVKY2V0TkV2VjF2V1Z2SkV0ZWlhRm9B?=
 =?utf-8?B?ZjFRRm5zVUpDK0FZYlRtMEtrTXowelEyVTRhN2ZXNGZ3YUcvSkxtanVqeGdZ?=
 =?utf-8?B?VHdYK2tEY0QxQUQyNEVFckc0aVJaMWFuaDc1a0l6c0xWS0h4L0JvMCszeXl5?=
 =?utf-8?B?ZnJkdGZsQ3FidVhDOUFyQjVDcVdRVnJOU3NkRzYvczlSMGJVekVyMU5qUGx5?=
 =?utf-8?B?Q2hPc2NKYkVSRmZZRU5VL3F4cXpBTHREYTg1K0pzMi82SURIdTdsY0xDSG9l?=
 =?utf-8?B?NitOUS9Gc3pMaXNKUXJ0QWYwYVgvNjJBYUZrTFBVeWhaanZCelhxZEdlTmNm?=
 =?utf-8?B?V1ZsSExuaHJ3V1ZxT0NlUWUyQWlGaytJQVJ1R3pPMHNIWDR5aG5NZUhDQjhi?=
 =?utf-8?B?RjNmdi9tbGovUnk4V2tPSlE4N1krdTZ5UTZuVHpHckQ1SFVnK2hpbmZaMkdG?=
 =?utf-8?B?b1RnYmZnNHdWM0FXeDZEQnQzdWNOMExwQkN2cXkzcVlJcVJyc3g5T0NjTm42?=
 =?utf-8?B?QmpvbGZJNkxEdmVybTQ4NVo1ZmcxQWNqRXpwVzdEa0daZnRXYm1JejdVOGhx?=
 =?utf-8?B?eXVqd1ZnTmxBMHJ0aUpRQkVENkRlWFhWZkswVHdxRU44Y1VldGJ3ZE4zbXpE?=
 =?utf-8?B?REZCdGo4Zzd2TjNnd09CRHVyaTJvZGgyZVQxdWt3U09yQjhNaFBTVUJESDNi?=
 =?utf-8?B?UDh3N09iWkZLOVpmY2xxYzJqRGx1a0krcWVUUUEvQjRGSytyc2VFM1EzQ0Rm?=
 =?utf-8?Q?nw9P/pJ9wlHdRZfb+R3dBEO5DobiNrXBFjsHP2u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d65d3f-1f4b-4e88-cc13-08d936bf3c10
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 03:22:02.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDwVejLu4eYGn7FTT81Cosas2pnh9RAf6kddod0IFKMUlQ02BrRueCLstFVL1tk1uI1dzB6j5DYk2d43QGDfPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1280
X-Proofpoint-ORIG-GUID: LFTwDDOVjTxQChgZeR-Askxt-MYheKlA
X-Proofpoint-GUID: 6EVb7QGgEQpXhkEUlK_9MqzJ0nIwByQS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-23_14:2021-06-23,2021-06-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106240018
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/21/21 4:48 PM, Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> On Fri, 2021-06-18 at 10:30 +0800, Yu, Mingli wrote:
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
> This patch is incorrect, it would cause tasks to rerun all the time and is not
> the correct way to solve this problem. We don't use nostamp tasks in mid tree
> tasks.

Hi RP,

Any suggestion to solve the issue? I'm also researching a better solution.

Thanks,

> 
> Cheers,
> 
> Richard
> 
