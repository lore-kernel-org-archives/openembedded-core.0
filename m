Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3090.1625040535236167580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jun 2021 01:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Ksk9Y2Pn;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28153f1411=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15U84i9l013518
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 01:08:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a80ngs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 01:08:54 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15U88sWv021498
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jun 2021 01:08:54 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a80ngr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Jun 2021 01:08:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=efl9/m4TyBJN4bQQoM/7rxdHs+5hD9SIU8x5u6mcFWWPbxgsKygjp96Lg9C/bdQMJMc8d2dzd6H6K/RmYsWlqo4bfRUt3dCse0GXmgkXQJqZxlcm9i1J4hFL7A4K/tATtJrSezSYMPpeCyK0OV8Yy2w46NCUfdUgamHoPHygNj023554+oZPkw+cMBLlQle6hOTFEjDUil+hQgDJZZcn2o3RkMuupd9jG3TR7vFdhaCRTGf5A3YJTUYry0McrVNY0UnlWLf+TDyjOEFnFr96uafzvvhsbDR4uc38JU+enhuUBrRlnA7uNXUIjpvEqqM1Xd3IORuQelCMGxp62we1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhBo2pnzmTawe9vKj3S4c7Pbrbu0Ino3eYT7mqfFbbQ=;
 b=UR+48kT5nufxv6kawmzvhsS5rZl8tlkVwUQSqBctevLgKLFuzKEl5YLVIncS1jBKC7e783oXYvvF7ipR+X6I3bYSNpUg8UvcanRqASquFQUWTieP67l4ZOme4WJrs4CyvH0tDozGGJ310os3913arCa9z7/ofrSd7fV6uOeyHE8yC61Lqm4zhQiP5vB2xwZnGKICHEFXoZ32Rq8KgIkne9M9/2ATdH2QcdijsEXIqgXOOF1/b9/39jdMNwlc8/XtXQiFZKEsxG0W3YiJ1e1TAqOkhW+nrELMtOfmlOXzSdMlK+sV3gCK9kOvipakJfFb+qbsAc7Ef4PrfUKOjqxFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhBo2pnzmTawe9vKj3S4c7Pbrbu0Ino3eYT7mqfFbbQ=;
 b=Ksk9Y2Pn1tvljoWIe1x6jBwKOTPTsz636iBPy/EYw6U7c87njibV+QK4BS++XmahzeO6GE/MdeMrAEFekWllsI8OhVKQ2f4iWbLEJVjKXQYmAz/rxgrwa4Wp9cJZWzgDJku278Er/gi+YQAQtVVHjX0GyDNXzTgCcp68T5HBSrw=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 30 Jun
 2021 08:08:51 +0000
Received: from PH0PR11MB5660.namprd11.prod.outlook.com
 ([fe80::d49b:79d4:2455:f6a8]) by PH0PR11MB5660.namprd11.prod.outlook.com
 ([fe80::d49b:79d4:2455:f6a8%2]) with mapi id 15.20.4264.026; Wed, 30 Jun 2021
 08:08:51 +0000
Subject: Re: [OE-core] [PATCH v2] ffmpeg: link in libatomic on 32-bit powerpc
From: "kai" <kai.kang@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: armccurdy@gmail.com
References: <1688AD869A567403.20286@lists.openembedded.org>
Message-ID: <83cde94f-ffd3-c951-be23-c864881555aa@windriver.com>
Date: Wed, 30 Jun 2021 16:08:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1688AD869A567403.20286@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0152.apcprd02.prod.outlook.com
 (2603:1096:201:1f::12) To PH0PR11MB5660.namprd11.prod.outlook.com
 (2603:10b6:510:d5::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.151] (60.247.85.82) by HK2PR02CA0152.apcprd02.prod.outlook.com (2603:1096:201:1f::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Wed, 30 Jun 2021 08:08:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9462b538-e6c8-4015-e319-08d93b9e4bb8
X-MS-TrafficTypeDiagnostic: PH0PR11MB5593:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PH0PR11MB5593F809D03A0A99E2672F5795019@PH0PR11MB5593.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?alpncVplYzI1YWJJQWlzcityWmhZQVRBQ0RITWE4b3EwZHQwSjRydkVjRk5o?=
 =?utf-8?B?TWJCVGJCMzVEcjlZVGVJVUpnYXV1WkhkS2JJSEdTekRPUVJtcDJ5RDZFb1FH?=
 =?utf-8?B?L0lMM1g0SE5BR0oybzRpbitTRkpEUGIzTXFVS0ZiMnV4cFJ0dHB2Ymw0cnI4?=
 =?utf-8?B?V2pIOWUzTFkxNmk3ZTlOcjRHK25rbDF0a1hvNGQya01HSk15NHh2MWd5OTNi?=
 =?utf-8?B?VzIvYlphcUg5TTQvWldrMzNRcE1TYTFDZEh5b3Y1ekdYOXY0ekI2VHZ4TGJP?=
 =?utf-8?B?ZVVQaFBnY2lxSFdUNDRrV2N4K1lBcE1DRDhQcTFsMi9jZ1FLRFdGZFZNK1po?=
 =?utf-8?B?NlczOHcydVBTSklUY0NDKy92cS92a25Jb0Vwazl2eDcxMlRVQkptWjVlWngx?=
 =?utf-8?B?M0NBdURZd2NvUHJ2dGRGV3RFS0UxRHNkdEhZN1hZNlBBSDd5QzJydGVyaGJQ?=
 =?utf-8?B?bFhWcHJtT25ZbGFJc3NXektnNTc3Q3Z2S2lTdnZXYW4zZlpneWJLMXREdkFE?=
 =?utf-8?B?ZmxjZXhqU0Qra1FDdXEwcTFpczIxVVNLWlJVQ3Q2ZENlZTlqYnNka09ZNXBN?=
 =?utf-8?B?WTN2dWJlUlpNWkNyTVpjNzkzWnljUW43WmpvcmxQa0Fmd2pBVGdubUdZL3No?=
 =?utf-8?B?a2E2bEd3WDAwWGhxRXpkaXpQeUNPNkhMS2w2T0FWVmdBMTYvSElOb3dsT3Jn?=
 =?utf-8?B?eVJGVG8rWjdXZ2xvVFZBWlh5QnVhbTlReWh4NXgvWmtnQVFSK3YycXVoR09n?=
 =?utf-8?B?djhvRTZ3VVAyQzJDekdqMUd4OFpyVThudjJ3aGwzZ1UvNnJWMjQ4RjF3UWZS?=
 =?utf-8?B?Sm1OTFVvREZkVGdOOSszT2Q4UFEvaXFzWWg5eWZ1SjBhNnZsSEJFUmhieUtR?=
 =?utf-8?B?Vkc4SENFM21qWGM5eWZldjBvNGdBRGowUzN0K29OVTE3VHFiY3NsTnQ1RFdi?=
 =?utf-8?B?Sy93NHhveUNuZXBTanNYdGNrYUkxdDB5SklOMFprb25Rb1ZpNm45eFliODJY?=
 =?utf-8?B?NXhWT0U2RUFWLzRFdS8vTXZyMFJaOGUrNXBjYXcrZGxtMTJET0s2Vm83MEph?=
 =?utf-8?B?RUt0eHFYalZhaytRWk9vMGNVS2tJbFc0aWFsK3N5VFBBSi9JMXN0a0NuYWVt?=
 =?utf-8?B?RTIzNHdNOGFHMWJNT2VJU2JwWnJCRlFjZk1TSUR1b096RGRhVHRIL20wUVhh?=
 =?utf-8?B?bVg2WXl6bWNZZldVRlh1ODk2bys0QjFWZEFnSllBQnVqMzFkbDlXNUNMMTZI?=
 =?utf-8?B?VUNLQ2NqK2g1alVieldZbERadzg0SlhvMERVVHlvTEFYZ1pvQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5660.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39840400004)(966005)(956004)(478600001)(8676002)(8936002)(66556008)(4326008)(16576012)(66946007)(66476007)(6666004)(52116002)(38100700002)(38350700002)(2616005)(36756003)(316002)(26005)(33964004)(53546011)(86362001)(5660300002)(186003)(16526019)(31686004)(83380400001)(6916009)(6706004)(2906002)(166002)(6486002)(31696002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RXhuZFVYZVVXNGM5Q2hzMHBVdGg4MkZTWmNhWDNrR3gyYWRHbk1teG5VS2J0?=
 =?utf-8?B?RVNqdGxraWtHVTFuVHozdDdaSVlGMmFSZ0JORVl5bkJOU2RGMC9iV240dHha?=
 =?utf-8?B?TlBZeUZmTUsvUng2S3dhN1NTUEFqNUE2NENaa3BYL25ENmNSL3BUSUI2ZTRu?=
 =?utf-8?B?T3FHREtRWHhjSzBpWTAwWnNpWTl4U0RUcVJVOVJkcm9xcVhDSjlHY3k5WjQr?=
 =?utf-8?B?NUd0NTNjMEZ1b2t2a29LWjJnNDdaVmxJMjQxR0pGQnVUVDZ5eGpRRnFIMktY?=
 =?utf-8?B?TjQvQWtTblpPbGk3QVFvaklzY2o3WGZSZHJudi9rR0lNMnlnTVJUV0s5cGln?=
 =?utf-8?B?ajNEalQvL0lsWnp0YXhlOHE5dEZqSmlkWHRpYW5OUFBWazVkbHVjSkI2b3RV?=
 =?utf-8?B?Z2w4RFMxTTVhblFiUXZPMFRsamEvMEdaaWoxUnJMbG9qZ0R0bExYTmJKUE9j?=
 =?utf-8?B?WmxCVWwzM1VnaitxUE1jdHE2MGlMU1N6UnZ6bkU1N21JQzRXK1FqYVNrOHNs?=
 =?utf-8?B?Zm9KWVpxMjBNclI1em9YV2taL0VyaTduVm54NlBISlJOUDFEL2lxbk9TYmRK?=
 =?utf-8?B?NjdOWVExem0rdEhXZDdXMnpJZHhDN1NRM01kSWJDd0p5cmtNZ21SZGtnNXRl?=
 =?utf-8?B?SEJVSkZlMkhxdElVbzlNaThkRmx4ajRnQmlmaU9DUFNyVUZWYVlPV2dPSlZi?=
 =?utf-8?B?QlhQOGVkdzc4NGVwUm9iWVNxZWZESFplRENrenM2ZTRhbjBlVko4NUl5ZXVn?=
 =?utf-8?B?c1NxVngvK09PUXFmdlhRL3haTGVHQnhRdjhFMGtlTGx0Nmo0cWRxL1NibDkx?=
 =?utf-8?B?bTdUUnlvaWJPVGg0SEpVM3J0ZVJVZEg0TWRMU290RnliM201OXBmNVhMcEQr?=
 =?utf-8?B?RVk5TGpibG1YbVFuU0tPUFBWMVRlMHAxbThOSXVBVVF6bkFuanVNc094N0Y2?=
 =?utf-8?B?ZURTVWljV3JzbVIyYjdzODIzbnFZSFZxTWtVSDhQN2tlNk4zdG1TV0dUelpI?=
 =?utf-8?B?TURSSGFqUXNzeU9FL0h6YWkvTU0zQmNtaWNDSjJPVzRwUFFlN2JnVkpXU2hq?=
 =?utf-8?B?YjNTcGpyMThYWU0rbEFlM01TTFBiYzBrMzQxTmx4bFcvTmgzV2l0L1MwSEZw?=
 =?utf-8?B?bjljeHk1MkJxbmV1QXUxcEQrZWFTcjljcWNERG9lbDZXWmsybnBCeit3NDR2?=
 =?utf-8?B?TndqRk9nSkszYU4wRHh6N0FVc3EwaUhBeFdhSTJZZzlyNjVXM25SMjFwMVFq?=
 =?utf-8?B?TDVFamVoNXpxdVZreVpObDJYMVc3YVlZU0x4ajVhL2FSOUl3Y1ozdmlIdXRk?=
 =?utf-8?B?RWFPd1ZXNGFNQklmQ2dqMmVFQVBmLzV2Vk54eG9Eb0JhTjNTMjgwdFhjZFlG?=
 =?utf-8?B?bFppa2lBTm4zaW5jeCswODJCQU1aZVlnMHpzU21OYUw4QWxvOUk4TWducVF2?=
 =?utf-8?B?TloyKzJzdjA5ckc2QTdSZHFxL3BvdFhNcWl1QkgyTjFtbGxyd1hpM1EzUGov?=
 =?utf-8?B?VnIrQkJaa1ZjSTNoSHJSeUFiRjNsbXFxZVB0Wm5nNHdoWVdFRjYvQ1VZY2xF?=
 =?utf-8?B?eWpnVUZORHh0U1RSc1d4OHJUZXJHcm5Bb28reU9tRmVOQTk5ZVJ2bEx2djhI?=
 =?utf-8?B?M3Z3WHhNYkpoUEtvRERBZCtqcFhKR1Q5VXplRnhhQmtnLzJoa1dNR3VNMUVx?=
 =?utf-8?B?aFVucUwzMTJDSHJhTDdIdzAxdmo1dFdUOUhmVEtxMlp2RkFMc0xta3lraUhM?=
 =?utf-8?Q?s4yGav+eKX5VJDl/5PefxLJFqmBKVs/wZnKS7Y9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9462b538-e6c8-4015-e319-08d93b9e4bb8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5660.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 08:08:51.2597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WGtlcjLlxprR+R9wSWbMXwwsDegsX6J4ot+ak690IpH8Ni8dUYuFe0kDHA2EZ90XsF2RfdFVuL4kUrvZsCX8qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
X-Proofpoint-GUID: T99_FRZwUTPOdo-yLKuF5AH1bOwnQj5E
X-Proofpoint-ORIG-GUID: jShgYZ2PKO4RXJpEET6D1iUSWxhJDvs1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-30_02:2021-06-29,2021-06-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106300052
Content-Type: multipart/alternative;
 boundary="------------35489BF0C56B6FD40B34FAF2"
Content-Language: en-US

--------------35489BF0C56B6FD40B34FAF2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/15/21 2:27 PM, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> It needs some functions from libatomic on 32-bit powerpc too:
>
> | libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> v2:
> * correct the typo of the machine in commit log

Ping.


>
>   meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> index 3ed009bbb7..f3097f8ebf 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
> @@ -130,6 +130,7 @@ EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mi
>   EXTRA_OECONF_append_mips = " --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
>                                --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2"
>   EXTRA_OECONF_append_riscv32 = " --extra-libs=-latomic"
> +EXTRA_OECONF_append_powerpc = " --extra-libs=-latomic"
>   
>   # gold crashes on x86, another solution is to --disable-asm but thats more hacky
>   # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
>
> 
>

-- 
Kai Kang
Wind River Linux


--------------35489BF0C56B6FD40B34FAF2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 6/15/21 2:27 PM, kai wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1688AD869A567403.20286@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>

It needs some functions from libatomic on 32-bit powerpc too:

| libavformat/libavformat.so: undefined reference to `__atomic_fetch_sub_8'

Signed-off-by: Kai Kang <a class="moz-txt-link-rfc2396E" href="mailto:kai.kang@windriver.com">&lt;kai.kang@windriver.com&gt;</a>
---
v2:
* correct the typo of the machine in commit log</pre>
    </blockquote>
    <p>Ping.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:1688AD869A567403.20286@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

 meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
index 3ed009bbb7..f3097f8ebf 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.4.bb
@@ -130,6 +130,7 @@ EXTRA_OECONF += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('TUNE_FEATURES','mips32r6','--disable-miEXTRA_OECONF_append_mips=">&quot;${@bb.utils.contains('TUNE_FEATURES', 'mips32r6', '--disable-mi
 EXTRA_OECONF_append_mips = &quot;</a> --extra-libs=-latomic --disable-mips32r5 --disable-mipsdsp --disable-mipsdspr2 \
                              --disable-loongson2 --disable-loongson3 --disable-mmi --disable-msa --disable-msa2&quot;
 EXTRA_OECONF_append_riscv32 = &quot; --extra-libs=-latomic&quot;
+EXTRA_OECONF_append_powerpc = &quot; --extra-libs=-latomic&quot;
 
 # gold crashes on x86, another solution is to --disable-asm but thats more hacky
 # ld.gold: internal error in relocate_section, at ../../gold/i386.cc:3684
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------35489BF0C56B6FD40B34FAF2--
