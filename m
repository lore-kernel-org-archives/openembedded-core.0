Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5004.1631250026683583253
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 22:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=am0fKCra;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4887ec39e7=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A4s3Oi025726
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 22:00:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Sn8mPM82ECstOZU0HKs/ASOSLml/7p7oDzc8aDiics8=;
 b=am0fKCraSN4P2IUOCtOJ8HBqY+r6GD3sPjHm++bf+ahbwTAfVnX83FQMLJ0secjw15gJ
 d8F6s2Z7FSPbi7jZ7Nf84ds0Vd2dHkjXGf4dt0weNBfs//MtlzpOwKfIMvwcCEUEMtiH
 jEdmDDH/Ste/9+gpfromeiNNNzKkOAHMR0Z2LBbetOPFsEAjmpD1ml702YdIao17HkUG
 vx2VsikFkRmvYcEQf0GJI89sHSfXPKvivli+kb+v7PgLSmyeLhP4S9gklJEZicnpwptv
 uq+Muf7vWaG/stFFCLTf0PJ19c4SKo9W9CUDFNq2aqxfQ1TxeEMca9tW51sE8js2qgTu pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aythyr7n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 22:00:26 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18A50PGM002954
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 22:00:25 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aythyr7mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Sep 2021 22:00:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c1jirBBm7VAX3eeZa7j1obkx+VuDNlv1rY2sk+rxLrkRo7a7keKRVx49lgWY5kRDfKNnvhY7G3CSlDnm9qY70fXHbJTsv3VqPmVIoOaRXo65uMDntPDI37Oye6m+OKw94LgTJx7ZVkVO9dwjPjOMkgsY9lHH1dywa/mKoaBqE3MK70a/iqvyM43GF58sXaq9D0QHbFjxvwVu56EoM8DtHpznvg1lC1PPg9r//tbVuPA1iJ2b54GN+bEYGYsNqf2f6XCHyv5AJpM522/h3Efqwvdj/O2AI3oz41kfzcnf7LM3HvcNuxYE8mkzBP8D0Ho5KHmN0M7ujkfxzptHFs89lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Sn8mPM82ECstOZU0HKs/ASOSLml/7p7oDzc8aDiics8=;
 b=ieuYxtzuNuGO8gENfyQ/bj2TxJzZEjm3LhUvmCLgl0vn7E36/90Z5Z2rPYIDTvKIc81j4rBC3YU2/hLEwNbJp4W4Ayfosd8gps9riaY/UK3M99NAqhjnDJpDqh1dpLGR6daHrbgwBAzoHXTXzKvxv1FBER1FktrC+QnsFg07v62/qpeK5/3N6UC8MbCinlJprF+7iUvctcYgKbJY4RcAmT2s7TXgW3iOIIMA8NyR2ixQb8TwVXsCDx2zOT8O96OGFUGXlrB2zW6X3ZSnYp8lFQpdSCIV5xoFg5kVQnPHVlN+rvMUZLPq9OvAxq4H2YEZ6pNMpSKOQyvawIst93rnwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 05:00:24 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::d92:b64a:8b59:cf4a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::d92:b64a:8b59:cf4a%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 05:00:24 +0000
Subject: Re: [OE-core] [PATCH v3 1/1] perl: fix CVE-2021-36770
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20210910031616.8750-1-kai.kang@windriver.com>
 <20210910031616.8750-2-kai.kang@windriver.com>
 <72b903727f8cacc1b2d55eb2dd3332582987ae3a.camel@intel.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <9226e239-4fac-3851-0d6c-c76a33ac29a7@windriver.com>
Date: Fri, 10 Sep 2021 13:00:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <72b903727f8cacc1b2d55eb2dd3332582987ae3a.camel@intel.com>
X-ClientProxiedBy: HKAPR03CA0030.apcprd03.prod.outlook.com
 (2603:1096:203:c9::17) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
Received: from [128.224.163.141] (60.247.85.82) by HKAPR03CA0030.apcprd03.prod.outlook.com (2603:1096:203:c9::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.8 via Frontend Transport; Fri, 10 Sep 2021 05:00:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18b9db0e-a9f8-4a12-6a91-08d97417e5d0
X-MS-TrafficTypeDiagnostic: CO6PR11MB5585:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB558539BACD5156C5EE30D58395D69@CO6PR11MB5585.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hA5LPRXiMY9qB+diyHp5q9kkhh+HsCqLoPbMawKii4HGAQINFbDoIzI9PH88gW1/HiWkWJT6bWHF7EVz9pGR1PyTIWt66v4zBT7sramSL2uY5pfYDgl2K6dhvN2IiiYwrFf8IY7rnIjveQLQTWXenTLNdTa0OE6eHBaL0N/sOpHUBFT8ocQLyABzaUtI0lqjF1RgJtd4/w7q1iE5BxgO0xxUgjqclZ7xoJUkDyjFm89t5vy3pfZxY5Pyh10T4PJo2X0lvreczCYvraJHokEuBg7tTbmwt2JsTI5w5iW3oylS3K3l4UnvESyBPm/3tU+9MC0mgb8c8VSkoDAoQEF/vEbkPtqCMs0eR5zzNB5Pz21YDYky5j16dKkFCxTWiICenQK9OGVIUTtxIM1uk1/6o4i+rW+mi2L5RpLA3i/awrW8AxQivrMBw5XzT26ey/X1MelPPd56DV7k5qxmYNunavI7Msy8Q0OAP71NWNeyNeZ0bCZTQzu3mc+N67w9oaw/oNnl1xEhPYFEQ5lbuCj30MALy/wqLsP7FjOHDxJdS9i9/rM18lZvu/eS4cvtpiDu8urMNa+vhrDDcUWABKGjANx/BIsoP0OA4HQWrORQyjjp64FGDHWCVG2egJew7OOpFlKq2eqKLhTP4moBk7bF/B6XSof2Q6SF7AAFSajMh667jCQ5hOaWAfZx08haPcLTsiYrvfSbfqG6uqmqFCTN+g7m2KwDpHw/Blrhcw3DWK4G5EZ7FSv943UFV9bhUIFDe431qu2ioUBbJmLv4D25f+fWsuLxF5MfLHi8ibjTIJuNJ1A+imDBKdFKTJnFr2+xMo8C+oyvXYcyqT7Bea+COfUKttR5hYsQSd0gC6Y3/reWcM9oJm2slzF9AAA4pl8Cy2L/vFFbVLPQn/xXRPdsU5tEy52AjZgeeE47g5WSCu8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(39850400004)(366004)(396003)(346002)(956004)(31696002)(2906002)(966005)(316002)(53546011)(16576012)(31686004)(6666004)(38100700002)(6486002)(86362001)(38350700002)(186003)(26005)(8676002)(36756003)(5660300002)(6706004)(110136005)(2616005)(478600001)(66946007)(66476007)(66556008)(52116002)(8936002)(83380400001)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YWxRcDltUHVtOURJRFI2YU5vTHQvd0V1TUNlQkNMRHlUQ1JaM2hpR29MVTFa?=
 =?utf-8?B?Q3Jtd3B6RVBVVnZKMnh5enpCdVQ1cDQ3RVlKSEJFY2JNQXVjYS8wR3ZaSkpr?=
 =?utf-8?B?b3dWVHZiQkJjek9jWkVZdmVTaW9DSi83SGFVWW5aY0NkQlZwNnZtQzRrLzR3?=
 =?utf-8?B?NjgwRkYrdG1lRHgvekdOOXRsZi9aNzVqa3JzMkhJTGVuWWpvN0tKQnhWSVNO?=
 =?utf-8?B?SDJMc01BZXgzK0Z0ZEJHbzE3ekVKek0yQUhUUFVsMXQreDd0WHhiZ3NiMWZu?=
 =?utf-8?B?RXMwdDJ3cW5EOXRxV0VySEZyREs1cnNFZk5tUWFzbk9qREZiSDlsaUdnNWZ4?=
 =?utf-8?B?SVJhUzBaTmhzOWJienJzNC9iV1hhSTRNUmt6UXliOVJ3SHpPeTZKNFpROEJL?=
 =?utf-8?B?ajg4azFsUEs2TW1RdUcvUTFROWtJUmdEeDluUWo0Y3VPM2NaTUhhV0piTzRS?=
 =?utf-8?B?dk4veUhoYTNONDdnTGtQdzd3RnA0R0NPMDdoMkc0dmJFVUdVWWgrdHZUcnlh?=
 =?utf-8?B?SUVlMmIzRDV3Qk04RTdoVjM2a1FzQkhWZExYNzk5cUgya1F0eVY0Y0pTTVp2?=
 =?utf-8?B?SVgzKzUvRWQxNmNZbHZEZGJXZmFxY0tiYk85UWtES2NXS211a0Y0U2dTL1Nm?=
 =?utf-8?B?a3VsTDVXeUUzdzlGdzkxWWI1TFBZVTNDNGNIMmNlVzhhYjN2blJtUXE3U1Uv?=
 =?utf-8?B?ODFXdmxwNnFUS3pWMDA4SVF4SlVNTXpYb090WlVSeUt0b0RGc0kzRkhIMFVk?=
 =?utf-8?B?TTdFdmpQMkw0RHBDWUxBZHpQMEhHaVRNS0V3WHBmTDFKbDU0NzMvVDkxV0hF?=
 =?utf-8?B?L1JQcDhmcFdHSHNwcThpREkvTzRRaWIvb2FSeUxoVWFGeUNFM1p4RWlzVHVF?=
 =?utf-8?B?dGxkRW8xUGVlNUYrSXVpNDNLZkNseXdZZ1VlSDdkT2JuY2Z1U2plamZvRFUy?=
 =?utf-8?B?OXo0T3FSKzdhQjQyZ08vcUhCUVJQampaN2c1WnIwZEZIYUN1dFZSZURGeEJH?=
 =?utf-8?B?OXJKNkgyekxaU0ZYV0VFL2lCdmNTdVlyZUJOSEVnaS9jKzVUT2J3ZWRmQTJJ?=
 =?utf-8?B?SzllZkhjVWNXcmhkTnI0ZW0yczBTQnZQRzB4TElYYUs2YTJtU0U5Wi9pTW53?=
 =?utf-8?B?OEgyZTM5b0w3eXlja0tXNk1PNzEyeHJGckNtZ1IwNk1kZ2I0MlVkeG9FOTJt?=
 =?utf-8?B?N0h0K3lQV284VXhRenA3K2NhbmZ5QVpkdG9iQ3EzVUVDdlJBVGlRdEJTUXFJ?=
 =?utf-8?B?T0N1VTNFdVRZSjl5SlFmVzNGcjUxZXBYSitRMXFZOVlGenBuZ0RiRTM0NWpi?=
 =?utf-8?B?cUdnMm5XY0oralVFeGxFeHNCam5nVVZmai9OaUltUjhJbHRoR0JPRENuUTdN?=
 =?utf-8?B?c29qb3BXZzVodmVpeXJPM3U0RFo4UDV3Z3ExUDJkdmNoVlJwcktpeTk4a21i?=
 =?utf-8?B?eVVKZDZ3a1VLenhBZU0wYjZHYTVXOU91bjFwQzR4RHJndStMaTNyc0NqVlJp?=
 =?utf-8?B?dFRxdEhSTHRvaERZYTJ2dXF6N3lwMnJ0TDE0VXp2QnllM0ovOGJHZzJWRVoy?=
 =?utf-8?B?cUVTbGR2VXJDdmFhVWQ4TDdTWlAwN1Q2VzZzY2xVNGJVM29EUUlkR3EvSitU?=
 =?utf-8?B?N1ZPbE0wWnNuSUJjdElxQ2taQ3U5MjBuYk4zWWtINjNsU2tYQ0pFUEQ5WjMy?=
 =?utf-8?B?ZEx6dHNWSjJLVjZzNGlic1g4NzRobmxBakFMa0p2R2lJQTBQbmcyWjB0THlH?=
 =?utf-8?Q?1T+DlNE7E76GHUTjq1Y+1damzTfsdz4znhuX4WZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18b9db0e-a9f8-4a12-6a91-08d97417e5d0
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 05:00:23.9223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdEtV0NpO14YdEcGgC5DQ0y2lA6sQkA0ldGQFFNfN/qX+z75XR3GjUndicpA92Eentafkjw0Y1OP7sYjN76LfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-Proofpoint-GUID: fPANHVlb9nhTm411Xr2TUO6O9BlQ46fX
X-Proofpoint-ORIG-GUID: 9Z7c4omAIITTTUcAwd84YoaImMYr74b5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_01,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0
 mlxlogscore=985 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100029
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 18A4s3Oi025726
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/10/21 12:02 PM, Mittal, Anuj wrote:
> On Fri, 2021-09-10 at 11:16 +0800, kai wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Backport patch to fix CVE-2021-36770.
>>
>> CVE: CVE-2021-36770
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>  =C2=A0.../perl/files/CVE-2021-36770.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 49
>> +++++++++++++++++++
>>  =C2=A0meta/recipes-devtools/perl/perl_5.34.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>>  =C2=A02 files changed, 50 insertions(+)
>>  =C2=A0create mode 100644 meta/recipes-devtools/perl/files/CVE-2021-
>> 36770.patch
>>
>> diff --git a/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
>> b/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
>> new file mode 100644
>> index 0000000000..28bc457b86
>> --- /dev/null
>> +++ b/meta/recipes-devtools/perl/files/CVE-2021-36770.patch
>> @@ -0,0 +1,49 @@
>> +Backport patch to fix CVE-2021-36770.
>> +
>> +Upstream-Status: Backport
>> [https://github.com/Perl/perl5/commit/c1a937f]
>> +CVE: CVE-2021-36770
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From c1a937fef07c061600a0078f4cb53fe9c2136bb9 Mon Sep 17 00:00:00
>> 2001
>> +From: Ricardo Signes <rjbs@semiotic.systems>
>> +Date: Mon, 9 Aug 2021 08:14:05 -0400
>> +Subject: [PATCH] Encode.pm: apply a local patch for CVE-2021-36770
>> +
>> +I expect Encode to see a new release today.
>> +
>> +Without this fix, Encode::ConfigLocal can be loaded from a path
>> relative
>> +to the current directory, because the || operator will evaluate @INC
>> in
>> +scalar context, putting an integer as the only value in @INC.
>> +---
>> + cpan/Encode/Encode.pm | 7 ++++---
>> + 1 file changed, 4 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/cpan/Encode/Encode.pm b/cpan/Encode/Encode.pm
>> +index a56a99947f..b96a850416 100644
>> +--- a/cpan/Encode/Encode.pm
>> ++++ b/cpan/Encode/Encode.pm
>> +@@ -7,7 +7,8 @@ use warnings;
>> + use constant DEBUG =3D> !!$ENV{PERL_ENCODE_DEBUG};
>> + our $VERSION;
>> + BEGIN {
>> +-=C2=A0=C2=A0=C2=A0 $VERSION =3D sprintf "%d.%02d", q$Revision: 3.08 $ =
=3D~ /(\d+)/g;
>> ++=C2=A0=C2=A0=C2=A0 $VERSION =3D "3.10_01";
>> ++=C2=A0=C2=A0=C2=A0 $VERSION =3D eval $VERSION;
> This is changing the version of Encode without having the changes.
> Perhaps this part should be dropped as it doesn't look relevant to the
> fix ...

OK.

Regards,
Kai

>
> Thanks,
>
> Anuj
>
>> +=C2=A0=C2=A0=C2=A0=C2=A0 require XSLoader;
>> +=C2=A0=C2=A0=C2=A0=C2=A0 XSLoader::load( __PACKAGE__, $VERSION );
>> + }
>> +@@ -65,8 +66,8 @@ require Encode::Config;
>> + eval {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 local $SIG{__DIE__};
>> +=C2=A0=C2=A0=C2=A0=C2=A0 local $SIG{__WARN__};
>> +-=C2=A0=C2=A0=C2=A0 local @INC =3D @INC || ();
>> +-=C2=A0=C2=A0=C2=A0 pop @INC if $INC[-1] eq '.';
>> ++=C2=A0=C2=A0=C2=A0 local @INC =3D @INC;
>> ++=C2=A0=C2=A0=C2=A0 pop @INC if @INC && $INC[-1] eq '.';
>> +=C2=A0=C2=A0=C2=A0=C2=A0 require Encode::ConfigLocal;
>> + };
>> +
>> +--
>> +2.33.0
>> +
>> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> index ab19a8d0be..0e0fe7f985 100644
>> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
>> @@ -17,6 +17,7 @@ SRC_URI =3D
>> "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=3Dperl=C2=A0\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://perl-dynloader.patch=C2=A0\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://0002-Constant-Fix-up-shebang.patch=C2=A0\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://determinism.patch=C2=A0\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE=
-2021-36770.patch=C2=A0\
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>  =C2=A0SRC_URI:append:class-native =3D " \
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://perl-configpm-switch.patch=C2=A0\
>>
>>=20
>>

--=20
Kai Kang
Wind River Linux

