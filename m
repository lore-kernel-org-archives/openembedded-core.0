Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.23783.1631497811808817193
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 18:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kQSKL6Sq;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48906cc4cb=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D1j5lD024597
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 18:50:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=5zOtuvWeYJc/tO1WpnaRmgTSpwDauZXBSYPRMrbmgmQ=;
 b=kQSKL6SqTn81uProPHbvRco7Dg0/l3MPNIb6PudOdE17Ebia8ZiLJLGGIZQGhBkzP5A2
 NUVez/kion39hYwGAFhZGIvFstn0Ret97Zy0RGWjZmLNWeKXH05tF9hYKrBO6msLSyrR
 Kp6RfnC56xavUrYXCp1j1Qeh5q5GFumMtdFAWZrntKlHKyPI14rx7GtOojIfpO57X+Zf
 63ZVFeaJuFANvCHBdRuniWZ2UOGdJwYwA3gAMe1onqFZpJXn/AQwljGJ7nEOwcA44iil
 PCWRlBJYw8AGXiP+2NOIVS60eWPzvttoilp5TeXJXYdALWo7Mb8/CaY09Pwfi+fK5+MJ JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1qjw84hr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 18:50:10 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18D1oA4N001428
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 18:50:10 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1qjw84hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Sep 2021 18:50:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT/G5qG1DzIj/9pUY3sHReMK6YLhIis4conIqNYU6QtpP1OWSQgZZqe5mHmd1PzEdKxS7LFHA3TZeKW327w/nqICbuzguDL3m8e90rqa/1kDZCMKpiRmX18Cu9YfGJ1it1BXnIkESkQgowDT6L11odqZ/V3qhl4LZacW+g9pSzWhtDH3Xjwh24wxnLNmnvEU+wnm8WRKiPv/8MM/aLYrMMCqd5Y5ogGmFgVYpaxVkERJbQhfO/i69dseRyZgURnJbBO//+EkaCCLGCsG0+SnIQTfUba7DQZHurQUAqI5B/tOwGjY51oJSU+CX9zKnGb6I/Jh+UOSHETQNqJfFFA1kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5zOtuvWeYJc/tO1WpnaRmgTSpwDauZXBSYPRMrbmgmQ=;
 b=PrCzioR1UodaJfndoz701VfgBDcAAJUkQbXmOpuvE0u+wNowjVv4dt9tNi3cEbCQzH7uoLdbWHHKfA+KfozmqkAZBj0mERyIJy+ryqzVylJ3zB1rHqG8o1wNH3A6BF0xtOrFJLMn/MwUufiAspM5w/riQ9Gw/bVqkBVeLptFfKqFl4xp3tB5lSnPb7oaXur8Kh8+uaEhM/0MYT8uvbc3NlzKqtwBp1cGRAwAYOWBzWAqN8+Oq4+1hFE9WHY6f/5eT0AixaPJyqzzjmZIg+ZxlCMV2gGA5AUoK/orP+oSP63NTOkOshc55abgIUThVrgN6GJj3rRQkfEAOfEJGQqeiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5588.namprd11.prod.outlook.com (2603:10b6:303:13c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 01:50:08 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d0f7:e11e:9176:b999]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d0f7:e11e:9176:b999%5]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 01:50:08 +0000
Subject: Re: [OE-core] [master][honister][hardknott][dunfell][PATCH] tar: ignore node-tar CVEs
To: Armin Kuster <akuster808@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210912162732.1573351-1-akuster808@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <1c45f2ed-401a-7e3b-3528-8ad5ad14a782@windriver.com>
Date: Mon, 13 Sep 2021 10:02:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210912162732.1573351-1-akuster808@gmail.com>
X-ClientProxiedBy: HKAPR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:203:d0::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from [128.224.162.141] (60.247.85.82) by HKAPR04CA0012.apcprd04.prod.outlook.com (2603:1096:203:d0::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 01:50:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc460097-350f-47ee-0094-08d97658d098
X-MS-TrafficTypeDiagnostic: CO6PR11MB5588:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB55883BD712BEF54D2A444AB2EDD99@CO6PR11MB5588.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jfkX6yO3apl5sYqPpEeWQ66wLvYWuHNmyXiU5oqsXRCQbFaVf1R+1iqWmymLVIGvcBH9V/EmWYrRy7xzKMPBPpDxbK45rhSRl4vZFCK2W54XYb+kG+bg+gDqKgCWKEFR2xcpEeB/5E+nHapQdXZ3eRaB/E9YgzJHrSNiF6+DV4FHzVxGZUgnPbbnvbNVI1Zx5cGuaFYwpnM65Xpacpk9I5XwGt2tpj3JY1daLp/Tn9ekl0UAPYH3kEKni0C08S3r+ZdA/fpQ3iA/1+fbxjXcwtjEnfi2wM1XioK/YKU8/0vkt4E55RyAIDwmGuWkTMw5Ycg1fqrA2ZS9kijKEv1vTsQS/udjCEtfaMtlxaMzZrP5zoPUkB9FJeEJMO56ORjrb7EBLF0VcUJ+UPn6VlwU9tzmySZ3wNs2EY1YVm9YWV7ap1on45oNk/fhU0syyIzFky2By2gMYl96yLCVeEUGQDrLRSAaoqT5mMryaFHluuAJRqhv/kl8H4uA3WCk5wARMqbM/YexA94fFPJ1H3IEJP8bKxbnor9x+QiuMSbaCG/gEMQswKu3eU9/9sdah9UVOMqQjSqaf4muO8syVNbn44xQxj4ZGgUn7LTNHr+RCmFO7u903O8HL8YxEJ3WDvmjliu5Bb+EzrgGBdmrBe8ZQ3kdaY3s5R3tAoUC5WD8ZnKBTnh4biZDSVdq7/qeRn5GV9pNkqnYbOrF1JLEhQgr3sdIKUufnV0vgsmu1+7B2gp/06GJZoEo0aTqp+dOc8z9Lona4rWdqc6dZQqVqWHUlELYLdkvXkskflgczS59KeOIKzpzIokyEvm9nKvaFfqILZW6Y6QPBVChfbNg+S8fkJRZw3BEs7dTwQNG37DhDGY09AM5iXXAWCW1mhz6LRd8sQKbFDBJPwjPM/TZKKCnxsxrb3wG3cb3GNHZjVpzVnc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(39840400004)(396003)(8936002)(53546011)(33964004)(6486002)(86362001)(6666004)(8676002)(26005)(2906002)(52116002)(186003)(5660300002)(36756003)(31696002)(16576012)(316002)(31686004)(83380400001)(166002)(66556008)(956004)(6706004)(966005)(66476007)(38350700002)(38100700002)(66946007)(478600001)(2616005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dUJqeU5DYm9FdXpQYTlVSXFMc09iTEg3cXVaN29aRFFYamtwcmhwK1dyQ0Vp?=
 =?utf-8?B?dWlROFZXdHB5am9xeXovL3VoQ1FOZ3U2d3lnVjNYRG5FWkZ6Y3R5c3Bta0t4?=
 =?utf-8?B?QkJQMDRlOW9rK1pHaVFKOHdodUd6eWw1YTl2amFyN3M4UHVyTWtUZFJORGdu?=
 =?utf-8?B?T296ZWNvaXZjY2lDWk9GY2ZzTytnSUpMWjl3MGpaQXBPcWtrQkVLcnp1REtM?=
 =?utf-8?B?dkZFZnRmUHFMZkFLelJrNFVkekZkRzU5V1dVckZBT0p1alRlcG1zRWRDV0s1?=
 =?utf-8?B?bTl5SFlzOUlmQVk4WFNEMjVERjc5TjBnRlArdE5YeDZaV1dEYXhtQWhOYW1D?=
 =?utf-8?B?WnduYlhrWFRIZnBrSitnN2pvMloyNURmeWlkcXY1bHFkMlJRS3ltVnJDUmYw?=
 =?utf-8?B?Z1BJbzRWaU1uTW9sc0QvaFArdGV2M2lwN1p3TUo1QzY4TkM1WXBzNXBKMkx5?=
 =?utf-8?B?bGd3eDFvSm11blFuT0lrMW40N295ckpMeUp1MGRNWE45bHZrcWR1elFmMHB6?=
 =?utf-8?B?UVRjeXZMRkR4eG02TmhiaWNrRFg5V2oyblVaL2tac1dhcDZ1ZmpTMlFSMVUr?=
 =?utf-8?B?YmxOdHAyU2hISzdIbkxaQzVodW1FVTVvTi9DZzczVmc5b2RPdnp3cXlmS1BG?=
 =?utf-8?B?Mm5scVpEQWdoQnpzK2lmNFZ5RGtDNXJWYU5sVDVPOStYM1NkSnhLMlV5MkpG?=
 =?utf-8?B?bG9kcWROa1RrYjZwR2JoN0RYLzQrSkZob3FlMEgzaVRsYm5rT29CMG8zcU9I?=
 =?utf-8?B?WDBNLzFGWHJWYXA4cDlveWFXc1Q4QkN4S2F2Sk94VjFPbGJnQmJmdFM3dXVB?=
 =?utf-8?B?YVB4UGloRTlPM1B0QU1WOHdSZURGSnd6bDFkbzJlQjZhT1RaV3RDYVVyOVAx?=
 =?utf-8?B?eXVEWUNXTkYvRW9jSkhNcG9OVTNPbnBKU0FEaUIxeER1TmdJN25BYm91NlRZ?=
 =?utf-8?B?VzMzeUEwN0xaMWQrUlBSYjdUZmdjVXJ0Z0R4U0xrZkJEZWZNWDZ3bnl6MThp?=
 =?utf-8?B?ZlltS2dTbUdLZnRNT3BvVnIwWEhlL1hHWXB3YWhxbXRmWWl4MVBDU3ppMGlr?=
 =?utf-8?B?VW9aL003TS9iRUljZ1ZRcW1lbUZEbE1adkNXL1FyQjFmbGdubjZTUG5SSW93?=
 =?utf-8?B?UmZCbnhQMkRUeUlORGlvWGFpcnV6L0NzVnhsRWt6MzQvV00xWHd1TXJNNVJY?=
 =?utf-8?B?QTJTaVMzTC9PTDdGbFJVcDhlc2JiRkk4Y1ROYW9HT3ZkTkY0Z0oxcnh2VHcz?=
 =?utf-8?B?ZkNTaERBc0xtdnhMUVBWWkN6b21IRWZWNFFoN3JJZThvU1cxMXFTbjY1b2oy?=
 =?utf-8?B?Rk12c2dWUG1DUWxNS1NSQ2krNWkzL0YvUlc3QTNEM3phR0JtT1BZK29kRDA5?=
 =?utf-8?B?Z3NtSVJlSUhURXRaYXBRNkc5VExmQVU1Z3ZwYjljUi9yMVhuVjlhYVF1T3R0?=
 =?utf-8?B?Sm5pUDY4enhJd3M2cUY4bWlsQ1FkZjlGOGRpbWxwSmIwdFd6R2txY205S0Fo?=
 =?utf-8?B?MjlHWFlwVjJpSmlEVXpLaTBhSFMrdWlLMWgwZFRKRi9CWnJGUnF4VTVzb0xo?=
 =?utf-8?B?SWt4aG9EOXV0L0VVWUVEZG1IbGRHYnJrS0Z6YVdGazEyckwvNEpZWFdvYUNh?=
 =?utf-8?B?eDZDazlnMnE1a2RyVEt0WkhXTTVFUEZLaTQvUS9DbVk2VHVFbE4wL2pQakxj?=
 =?utf-8?B?aEtqTyt3cFUrb3g4T0VBaVB4R3c5YUNVc2hXaDBuT2xzK2RIQUh0aEMwNk90?=
 =?utf-8?Q?K8WsmJeS7xXfgbbVGAvpwaPU2djWLJW7iKCztny?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc460097-350f-47ee-0094-08d97658d098
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 01:50:08.1683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bo4pM1iAj5++KX48g6I5+hDqVbdY++9hpwFjxDswpPJyTsJ0QcjznebSBYlUcx3ewgoGnA8itI8x+kHDLFuLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5588
X-Proofpoint-ORIG-GUID: hipFjtRV6xlroMewBpq25wmzJvQqtvP9
X-Proofpoint-GUID: CIUxSIwr9_aQHmARqsjFpUtLLWgSn44o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-12_10,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130011
Content-Type: multipart/alternative;
 boundary="------------6DE913BD184A59D894E26EBC"

--------------6DE913BD184A59D894E26EBC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm wondering if we could restrict CVE_PRODUCT to 'gnu:tar' as an 
alternative solution.

Regards,
Qi

On 09/13/2021 12:27 AM, Armin Kuster wrote:
> These three CVEs are specific to the Node package node-tar.
>
> exclude: CVE-2021-37701 CVE-2021-37712 CVE-2021-37713
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   meta/recipes-extended/tar/tar_1.34.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
> index a6a417a1a5..3488a6c955 100644
> --- a/meta/recipes-extended/tar/tar_1.34.bb
> +++ b/meta/recipes-extended/tar/tar_1.34.bb
> @@ -65,3 +65,4 @@ BBCLASSEXTEND = "native nativesdk"
>   
>   # These are both specific to the NPM package node-tar
>   CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
> +CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
>
>
> 
>


--------------6DE913BD184A59D894E26EBC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">I'm wondering if we could restrict
      CVE_PRODUCT to 'gnu:tar' as an alternative solution.<br>
      <br>
      Regards,<br>
      Qi<br>
      <br>
      On 09/13/2021 12:27 AM, Armin Kuster wrote:<br>
    </div>
    <blockquote cite="mid:20210912162732.1573351-1-akuster808@gmail.com" type="cite">
      <pre wrap="">These three CVEs are specific to the Node package node-tar.

exclude: CVE-2021-37701 CVE-2021-37712 CVE-2021-37713

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
---
 meta/recipes-extended/tar/tar_1.34.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index a6a417a1a5..3488a6c955 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -65,3 +65,4 @@ BBCLASSEXTEND = &quot;native nativesdk&quot;
 
 # These are both specific to the NPM package node-tar
 CVE_CHECK_WHITELIST += &quot;CVE-2021-32803 CVE-2021-32804&quot;
+CVE_CHECK_WHITELIST += &quot;CVE-2021-37701 CVE-2021-37712 CVE-2021-37713&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------6DE913BD184A59D894E26EBC--
