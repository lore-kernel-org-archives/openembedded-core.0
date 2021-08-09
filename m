Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.19197.1628488914985653255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 23:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OAQDdgez;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3855c1cbbb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1795upTn012567
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Aug 2021 06:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : from :
 to : references : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/M70A+FZ2SCS0A/TEz0V9A7bdX55IStvbPAKuuSbED4=;
 b=OAQDdgezbdMRqcMiIQ98A9T/hz8St+g9/fbDcHSJZdWQ71WWxFiPetKgodhJoIW897K5
 X7aCD9k3woSNP0iYpa8OwpvKivSW10LUm1PZDcElZq39L6EVqD60lESjF2kvkNpq+hZS
 yJWnd9zFINqq6lcUcjzWXONefm6NYqNGrJmK7S/yTQyUH8nclHmwKNX2r4nD0K+60D/Z
 KAxhCIOR9JdRWLIqxI0tjR8VbUAbpHcWipt1JKjB0a2fBwIOhOki/p9jf0gvv8ykQkyk
 CvMSVrdf9HtX8ltC6V8U9oPwsRJhuP4yyv6M6ceZZAaVEca/fwmCWDPdkMBjiPUu7Yej Zw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aaf530c93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 06:01:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkaMJRMTrVW0UfmRPk98E00WJNrlZXjDCkCaY5ixjq6v2kYIQpWq7fQnjHhxdcVxQjPi0p2jHCFZcQH/pTAxhMEMg3JCTb6oHwHv0rk5+gapYFNTMacGqC0+lDsNriiU8m7e7dCjuO1xMHMUQP9jj/VhTbJ2EumheESzRXMx1zQgQ834bf6We7itRUwNTTNmokYT5LiJJHiFu5zu6shQn9sb0i3XNA7DCCFml74HexCYEDfCJzeH8e+7QiHbwOIt9wA3qSrrrmicL8Enpa5ju1zhZFMhTuE0NijNYBhHNBvgoyPTAd6V2/PR54RJP4Zk/nNAbkORXksNjTmxGHVVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M70A+FZ2SCS0A/TEz0V9A7bdX55IStvbPAKuuSbED4=;
 b=kQJSkZfyGlxXHfAlOfG6R5YxyiS2WoTk1onQdstjMpL0rCEiWi1+W2WoLrwclOmxSQqStb6CYXuVGFltQC8hODUbbBIBMsYUHA9vzk5t4y7y38NBtgNp99ktmEq2nwB1HCg9LUO2YyP97kIhid08suBiZSR5hJi17vJGyP5ACDJ1Y9Z2a8zQVDOdg9A2Y+A7V+5cg1+6W6E+zYOMr2iVjIi+479OBpXko1o+sqGbVPkaxNCoUrZhIjXnCjOoXLc7D58y95W45K0kjGN8NgOwmq7DEUrzDrzf7iGSFHLo6FK0jvFVU923QJ+GLr2+HypeGVAHwshokSCad3QT6L35BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN6PR11MB1809.namprd11.prod.outlook.com (2603:10b6:404:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Mon, 9 Aug
 2021 06:01:52 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::31d7:3206:1012:5959]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::31d7:3206:1012:5959%5]) with mapi id 15.20.4394.019; Mon, 9 Aug 2021
 06:01:51 +0000
Subject: Re: [OE-core] [PATCH] libconvert-asn1-perl: 0.27 -> 0.31
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
References: <169759E55CFA4CD7.25031@lists.openembedded.org>
Message-ID: <494f8563-fcfd-aa3b-319e-d35b5db44c60@windriver.com>
Date: Mon, 9 Aug 2021 14:01:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <169759E55CFA4CD7.25031@lists.openembedded.org>
X-ClientProxiedBy: HK2PR04CA0056.apcprd04.prod.outlook.com
 (2603:1096:202:14::24) To BN7PR11MB2548.namprd11.prod.outlook.com
 (2603:10b6:406:b3::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HK2PR04CA0056.apcprd04.prod.outlook.com (2603:1096:202:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17 via Frontend Transport; Mon, 9 Aug 2021 06:01:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f7f3c20-edaa-4c9f-97d2-08d95afb2ea7
X-MS-TrafficTypeDiagnostic: BN6PR11MB1809:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1809BC69F806555B86D779E182F69@BN6PR11MB1809.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+O6dHoAyTiE7xLqIcfqUB7cyG65wJAwEqld6sqd0+mswQASZiO4nNiTsPat24wdLlTflICAYywICV/tbnFN7NhXGd5ZwxRNFR+MRQmcG7sPMMxv7Ui0/Vq9o7ZB/lHYWrnDeFsFWGeWB8D4PEf5ypZAyfvvAVPYbo87N3yCVynuXRxDCyYBKVMrfC4DPXxHczKQ0P8EAH3LS0+jTUEim5ihexwRVowhU8+sRju1AQHcvNEejfSjLJEMhYwHms0j+V4VwW1m6CbueOt6yOvM2dSxqCdBZAN/JlUleDMTFv/m8SkvqGoUzsCrpbRJCmubBqiFh7tV0aW8hl4Tqdbf7DbnUrO9uTlC5zH2hz5XcPKsiL619gMuRWTTUviPHUU2Iwxu5HnFCDFxUquimu0l1KiWmoHyr4QtrW/s7r4llH7NyR3gwCAtK6NaHI4deIr3Cuu3la2zH8m8mzC0T80Qy151wittdMEx7SGdKwymzKlJnsgTIgHuYEjl25eGu88iMkgPfsjJtljVJzotYeR5BccVcQLSEXMUA/Mz0YsoJblGVJQgNRpdnjxrSRh2WO0H6OXa4gP04oRr4bMMtjx3/WMuarsaOr1bf1h01xR4l+xfORN2JMKJdFlIfcoYhPI+BqQZpKBe1wb6Skj/jrlkMVMs5E62hGDoz4Y/dsZj+D/S9bvRGvnU1NIL1wHJU1s5iwWwKkYnFPcNYaDvu4uOJ3IcYy+FkXaUXtDoBileJfiZPRR+31t49M2jWIdtItz9WkbT7c4b99EStGg4ATWmiDdCSgfOEFc3cIomlP9Xx61zpWBkS5PSNFX1kBRKlpUQFBRjOJtpT5MNs1MjCFvhBPVO+4STdLjF/mRbi0+eYpzmBkLenOLxhoLDj8KXkpl4gzZD86f5WreytETkmE0ndiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(346002)(136003)(39840400004)(396003)(83380400001)(186003)(478600001)(6916009)(16576012)(6486002)(38100700002)(38350700002)(166002)(316002)(36756003)(6706004)(6666004)(31686004)(956004)(8936002)(66476007)(66556008)(66946007)(31696002)(33964004)(2616005)(86362001)(52116002)(2906002)(26005)(5660300002)(8676002)(53546011)(44832011)(966005)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OWJNQTZwdnEyV0tvTnFJZWluYXNCREZwRnRLWEs1TlExNVhTNWtYb3pPUGMy?=
 =?utf-8?B?UGxNdUViQ0FMODduTXFrOGw1TjkwUkllZnBua2tQUEtEVFJIRWg5VXJjdndU?=
 =?utf-8?B?WFV2K1hnUDUxVnBMNzRFc253WWxVK2NMMS8zWGJVMThlL1pLOFdrTmttbjcw?=
 =?utf-8?B?TXduNmtkQUp3YnFpaGx1bEZwb295aCtnOTNVbk9YNzFrMGxVRU43OHF1dnZ3?=
 =?utf-8?B?dW5KUVM4VUh1MWszM2xrMzhMYi9IendGdVpIeFhHWnpuMCtpVmlvZUk5QTBl?=
 =?utf-8?B?aWZ1Rmd2dnpDZjF6OWJmWFlvZjJVZWhXdmZBUUFLV0txY0dVUTh6ckpUcnc0?=
 =?utf-8?B?MmNsQmZVOWlRejZNR1pKWmNvK3ptMlB3RkJmWXRvYVlRd3JCeXRZUU00UlQr?=
 =?utf-8?B?cjcwMVNGT0NQMmtEU0NpcDdKSUZoTE9TK2NxZUExZU1DWWZ2TjdLa1R4TEUy?=
 =?utf-8?B?bkpSYWxwMmJNdjAyQnNqUVpqT2VISWJCUVByY1JGN3MrU0hSUUlJTkc2TWY2?=
 =?utf-8?B?RDQxOWZSRGpjbmllTmVzcjBvVmlnbGpDM3BkejZ6UGVJbW9CZW9YOHhqaTdW?=
 =?utf-8?B?K0crZGJhWWJUalBsS3VubXVBYjNxajFuQWZjRm00TDhBOU03czRqOVhidUE4?=
 =?utf-8?B?bHh2UDBXR2hYSkdLaWtrWUlmNEVOM1ZYV1Y0R1lFUTVZdXc0Z0Z6czFvRCtO?=
 =?utf-8?B?QmpYREYzUGxDRkJYTjdhZDM0bG4ycXhsSjQ5SUdidDRSeEl3TWJnQkF3aDVl?=
 =?utf-8?B?RTJHNDhtWnJyeFczTi82UUJCTFhGbWxzdXZnQWpOTEF1SFZvMEpyR0l2WU42?=
 =?utf-8?B?Yk0zL1pkalRaVjdrVDRYQ0lCbjlVdlRJZFZVNWR5SEZTVEpIa2RCT0MraVh3?=
 =?utf-8?B?akJVL3lnLzNRWnVpdjdBOHhqZ0JRSEw1TFZGYSswRGtENmdKWkp0T2dKOHpu?=
 =?utf-8?B?S25EWHB0N3h4V242MlBlY0tadEh5bTBHeXpHU0MxTXRtVmVkSUtLc1I5V3FI?=
 =?utf-8?B?NDRMbk9xWWhWMEllOWRONDk0bC9MSDRyV1hzMTllVnNpMTRCSHI4dGlpOHd2?=
 =?utf-8?B?eE82REdCV2xWV0l5N3paQ1kydjdVOWUvWXU1dCtrMTVFeDNGSWl1amtwSXdS?=
 =?utf-8?B?V3NjYWlQSW9uZmh1b3NBcjdzMFVRWG5xck1NSDEwaFBxOFNpekkrdkZjL0xa?=
 =?utf-8?B?MGxpUGN1NGYxMXpoNjlHeWg0N216aUFLTmlRT05Ga1Z2U1lZa3NnTEtvWTI2?=
 =?utf-8?B?UkJhV3dRaWZ3bENMb0ZuUzl4ak1jQnF3TEVOZ09IdlY1VVpFa1AyT3ROMURz?=
 =?utf-8?B?UVhNa2JvT1UyeDJ3UndFRGV2KzE0NjJKWk1rVmxnZTk0R01VNlNVMU9VaElK?=
 =?utf-8?B?Z3JzVmZPQUlpNDFXSU05N1haeHA0d3QyNTJLa3FxZWVWcjBSZ1Z6TlNoeDNx?=
 =?utf-8?B?dXRYdVBqd2Z5UXozSmR5MjgrVmsramVkTmdTZFZuYjhHdThWOUpLNHZkczhp?=
 =?utf-8?B?Y293eXEvVTMwM3Flbk1mRVo4TzZNdWlka1YvQ0lYZDdxZFhoRnovN2VzOHds?=
 =?utf-8?B?RG40Q3JIOGRGVDNMeUE0c0k0aXNjYkZzbDhQa1JBY3prM0JpYnAzQmdtZ1hX?=
 =?utf-8?B?dEw2WmFpcWpsRkYrN1BtWTJVRGlVL3dXUlhtcWYvTWFxUmtlT3JuLzFWWjI5?=
 =?utf-8?B?dk12ZFNhQjBkT1BGRW9qNTV2L3dUdWY4V1g0ZDhXRVNycjRXbWdsY2JocVFM?=
 =?utf-8?Q?Fp2ApLGLZa+zPOGxanIyEqQKUVH3bcjHCnrB+lP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f7f3c20-edaa-4c9f-97d2-08d95afb2ea7
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 06:01:51.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HlLtg5s9kIELym9+VU4bCNCIbmFYoAdtCZ2UpV+Sg1vcPI3dmI2q10q3Runf7gvGA7nHGaAdhRPoqya+9jDZEIGmn4lzwLQ+CP67AzhqSLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1809
X-Proofpoint-GUID: _I7es-l3l3MBO5UQL7JXLB-uRIel2zFy
X-Proofpoint-ORIG-GUID: _I7es-l3l3MBO5UQL7JXLB-uRIel2zFy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-09_01,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090048
Content-Type: multipart/alternative;
 boundary="------------F1FDF39346AC37402CFE2261"
Content-Language: en-US

--------------F1FDF39346AC37402CFE2261
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 8/2/21 9:41 AM, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   ...ert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>   rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.27.bb => libconvert-asn1-perl_0.31.bb} (71%)
>
> diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> similarity index 71%
> rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> index 409a8f3896..2548878a2e 100644
> --- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
> +++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
> @@ -1,14 +1,14 @@
>   SUMMARY = "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
>   SECTION = "libs"
> -HOMEPAGE = "https://metacpan.org/source/GBARR/Convert-ASN1-0.27"
> +HOMEPAGE = "http://search.cpan.org/dist/Convert-ASN1/"
>   DESCRIPTION = "Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions."
>   LICENSE = "Artistic-1.0 | GPL-1.0+"
>   LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
>   
> -SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
> +SRC_URI = "https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz"
>   
> -SRC_URI[md5sum] = "68723e96be0b258a9e20480276e8a62c"
> -SRC_URI[sha256sum] = "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a"
> +SRC_URI[md5sum] = "1e12b263a5042804bb1c59ddce899876"
> +SRC_URI[sha256sum] = "6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb"
>   
>   S = "${WORKDIR}/Convert-ASN1-${PV}"
>   
>
> 
>

--------------F1FDF39346AC37402CFE2261
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>ping<br>
    </p>
    <div class="moz-cite-prefix">On 8/2/21 9:41 AM, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:169759E55CFA4CD7.25031@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 ...ert-asn1-perl_0.27.bb =&gt; libconvert-asn1-perl_0.31.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.27.bb =&gt; libconvert-asn1-perl_0.31.bb} (71%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
similarity index 71%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
index 409a8f3896..2548878a2e 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb
@@ -1,14 +1,14 @@
 SUMMARY = &quot;Convert::ASN1 - Perl ASN.1 Encode/Decode library&quot;
 SECTION = &quot;libs&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://metacpan.org/source/GBARR/Convert-ASN1-0.27">&quot;https://metacpan.org/source/GBARR/Convert-ASN1-0.27&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://search.cpan.org/dist/Convert-ASN1/">&quot;http://search.cpan.org/dist/Convert-ASN1/&quot;</a>
 DESCRIPTION = &quot;Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions.&quot;
 LICENSE = &quot;Artistic-1.0 | GPL-1.0+&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f">&quot;file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f&quot;</a>
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz">&quot;http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz&quot;</a>
+SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz">&quot;https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz&quot;</a>
 
-SRC_URI[md5sum] = &quot;68723e96be0b258a9e20480276e8a62c&quot;
-SRC_URI[sha256sum] = &quot;74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a&quot;
+SRC_URI[md5sum] = &quot;1e12b263a5042804bb1c59ddce899876&quot;
+SRC_URI[sha256sum] = &quot;6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb&quot;
 
 S = &quot;${WORKDIR}/Convert-ASN1-${PV}&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------F1FDF39346AC37402CFE2261--
