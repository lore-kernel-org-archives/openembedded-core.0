Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.51])
 by mx.groups.io with SMTP id smtpd.web11.1876.1617911434105255505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 12:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DWjgBCJZ;
 spf=pass (domain: windriver.com, ip: 40.107.94.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2MRr1d0XvpLrMJsOASY8Mx3hLnIGZa1u8Wcl9z46qlWLo2F3AN/g1rPu/0P3jF+SYk6B1wi4JhlgE3Xhei8A72Necn9YyWORrbh+QAcPFm842kCneB88UR0MWIpBC41AbnS17Ub3xFLJ8PHO2sLdGYLheHAuAnG0mPaH/w2EbxigWWyXUwnx8IBXQMikcSxjJLuUqgtdQMgWeulq/BJ+SYqeFdIdkvFYfKi+HJL1dLvkmauWGFolcS9zlJ3mf07KRD63MGZjQrEi2cRgRpl/pOENR2oW8FaxS5LgbRyn5t4ovNalYn4CgPDbT9oB3znSLrdWQvWVsSrkvxG3R9LyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlBfU9EjlMR/M0Ve0nF2CMUPaUnx9y8CinMbI9HrZu0=;
 b=b3wvNMNBFnj4hahI8aHB4ZqLgoEuZfNslcAHrKGd97Qb5D2OI/7crmG0SI7yNn6I2X59d8MPkJtoPALAFTnYIFVDlmFWRqwxfefB90jfHf9YnXuRcXrVvjJzhrh9xOchOV1+LQNoZAmFKmZiZK/yXWENz979Tv/Y3sfNHdhzzF54GluJYeP2hb31iIo3dfr1Dly13QGP8H/byWOuZR1u53sSn9o6kabIiQqYf/wLs21z2lFB99PAcPmNDQpk22qmfuRpoKJ1DkKFaHS4cHu7Cz4J7wRMpRXb/rOrnSt+kMm+okD/+ouC97Fz71x1jSamZYoj8Q9qyvkqdQwfZYttaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NlBfU9EjlMR/M0Ve0nF2CMUPaUnx9y8CinMbI9HrZu0=;
 b=DWjgBCJZWVDtUzPkFqUo7M9Khf6gRddJdnkZuA3HykTaeVVTQ1kCEy5Fgz7f7w/p+i6txL8+fHGZLH9UCS19jbfemYSIUCFB/RqcMesGkeEpPcpGkHeZQPZkZmTvcK3PUPInCgVX0oAEjALrjiPSre/EHpoZYtl6qIbuaQFTp4I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3669.namprd11.prod.outlook.com (2603:10b6:a03:f7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 19:50:31 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::89c3:3b4d:43c5:ae76%5]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 19:50:30 +0000
Subject: Re: [OE-core] [PATCH] curl: upgrade 7.75.0 -> 7.76.0
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
References: <1617860454-5064-1-git-send-email-wangmy@fujitsu.com>
 <1617860454-5064-2-git-send-email-wangmy@fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b26851b2-e3ce-f702-aae7-8b5615514927@windriver.com>
Date: Thu, 8 Apr 2021 15:50:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <1617860454-5064-2-git-send-email-wangmy@fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0055.namprd13.prod.outlook.com
 (2603:10b6:404:11::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0055.namprd13.prod.outlook.com (2603:10b6:404:11::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.6 via Frontend Transport; Thu, 8 Apr 2021 19:50:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faf617a8-f1ef-438c-64ad-08d8fac79077
X-MS-TrafficTypeDiagnostic: BYAPR11MB3669:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB36698B8A6A694DBC2AE8CF469F749@BYAPR11MB3669.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oTZpyUcy6phIBF/9FrFsXlq8971r31ml4trrbNoA7PiFobtVxiI6Ycxiv7UmJaYizCQWBOHYDO3Zt3Pp8+fqOLCyLbIZGz+zcK4c+Ol8eZEgOKQ8JL2T4SINsJrAkKoLtWyi+BWMd4PZZkn0E28dlhO0DgC0gxlpzwXfhqs/QTVMkfO+ilvNU26bA4YHMtT9+L9NR/fp77FQZLqrwhRy0LZl0UCN+EVU1g9FH5amLBb1+xE4ukGVzXuhtB3OLVAoeHZDj4zOwj7M8r/yQUhDa524x7RgJXRFwAYJhqZ5lX6KTn/s/KS3JkfmA1tsvb0mnE78sRrmBWx57PbPUEGhPifWRBQseXcSf22SGLAwT3ZL+c357ronJxAyG8YJWkBducpEyYw5X1RjJCgHkfAXLfKYbP9gq1aNvk6OJP0mEW/TsJ8VDTlhfc2KCLBkHC82anYykKakIqSckC8Dg4/rJOJWjsO4eL64nUqhPvuM3cYjQq4W6PgDa/Tt7bfEBN+8ht4u8moIi6dmGbsgrOT/Kbi3qLrQ0qrg30Y8jS2aD0trzYCXDT3xgyXpjpWQulxV3g7R70W5fFOA+sCk9N6iegGNwjsGu6WyN6DIlsHhPGu4UnVJF+C4KLUkYI3990s18ZzkwhPjjoyYRdECryFXGiglw5QfEwxLyD2AsRdEwNz+T20nR4BQJpnZoZgw4oHpMsUVSMHeNiorsJCWYF+zZVoiEnbaCPG02+kw1wTOL1+w8wdr0b9Z5bz3eTln91THCryeEiT8EXjaENoeJCUnHba4yUVYfvWzYsDdulFC1cI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(39850400004)(136003)(396003)(346002)(16526019)(31696002)(5660300002)(2906002)(966005)(66556008)(44832011)(6486002)(53546011)(26005)(316002)(956004)(166002)(186003)(8676002)(36756003)(16576012)(31686004)(38100700001)(83380400001)(2616005)(8936002)(86362001)(66476007)(478600001)(33964004)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?K1ZPOUIzVHg3MmFhczFFNHZoRkphTU1UMnR2NXgzVDY0YjFhY2lHRkZRSit6?=
 =?utf-8?B?TUpPUGNubkcwZWlhNXIzbzRDZDFKUjRFZGZ5WXBRSk1ZbkxaT1lKK1hJeTZp?=
 =?utf-8?B?RUhIYTVpK0VIZmFXejJVSU5KNnJSMFVIa0dIMFZEMi85VTNlbzBPYXp2TVln?=
 =?utf-8?B?bVZSekNhbEhrNWpVOVRVdDJUbUtUUXNwSnd4Yy9LVDc0cGxZc2dEbGxQQ1du?=
 =?utf-8?B?a2R1WW0yazBtR2dZbnBvelhXMEc3bFZpVWFaWWRiQlJIVll5SGZLWkhTaFZ1?=
 =?utf-8?B?RGFpVFc4R0VEOVpXNVFybUpFOUN0SnZZeXZxbDZoaElNbmpRQnRZc1o1YjBy?=
 =?utf-8?B?RlFGMEdLOHgzM1FnVnRJOGFoNnl0ZHVyeU5Cdk9vRVRUM09iZ2lySW1BQ0Zs?=
 =?utf-8?B?WWlCSkpoaGtVOG1mYXBtWEdmL3dpSGRJdEJBaVFZVHQ4ZlpLWGJTbGJPWWht?=
 =?utf-8?B?VmhnUnFhYW9LR0d5OGFhRk5HcndrSjRsQklJTk5RSC9sUTVBVVl3ZFBtaG5N?=
 =?utf-8?B?V1JYck5reVhneWNiWU8zeEdJQTJGM2UydE1xVHpVaW9RcEJYY0dSR2Z3Y3Mw?=
 =?utf-8?B?ak9hcDdHMFRqdUQralhsbXJraVJNVWdQb05POHlweHdHbjdWQURHTTc3bWxU?=
 =?utf-8?B?UnNtS1MwK1ZaSWp4Sy9MQXBrbTVoY1IzS1A3dk1iak01d2o2ZjVZc3kzT0xq?=
 =?utf-8?B?SHNSWnpHOHZGRWw3Q1o2UnhYYllsdTl2bytFR0pVdER3b1h5c3pDSW8yaFov?=
 =?utf-8?B?bHBRajlhTTJJT2d1U0dkSnBSSUk1cUFyVGp2eWh3QkhDa1hNV1RhUUF0djRr?=
 =?utf-8?B?WTE0OFFTRm8wRVdVR0ZqdDBYZkxnUkFBc2YvWkJxSUV2SlJjb0lRQThKMzBs?=
 =?utf-8?B?NCtUTDlIK1BTS2psZHVEb2dwYytyc3FqQ3plTFcrRWFuMm92cUx4L25iTUtH?=
 =?utf-8?B?dkg3OUJwTzVLVDl4aXUzRmYvTVdBeWY3ZElYekRWVU15WTJ3WG5keUliTGVC?=
 =?utf-8?B?bzk1Rk5VYWJFMTVqVkMwVG9lUVgwdjdKdmltd2FnSmVuN0hNak5GckdXZk5o?=
 =?utf-8?B?VnQxN1A0ZlhPNHpYMWdOc0lVL3N2YWdzc05kZlFERVczZmhaOHpHWVcyeGZI?=
 =?utf-8?B?NUVKMFFhR24vSkM3TkhTcE13cGFQMjcxeUNodnNEMk0rZWlJRllVNlNlUGdy?=
 =?utf-8?B?T2s2Zkd3V2xCU0VMWUVwRUJEUmkzcWNOU0lPVzg5ZGhnRkpIS05pdHFoOGV2?=
 =?utf-8?B?WnFsZS9kUW1mcjBZMHRDV2QvdkY3VFExWGhaTHhHNWRqRjRkdEpuN1IycW85?=
 =?utf-8?B?RDJWR3NvSDdnNUFWNTFma05oSTlwcFZSenNGZ1hUZW9lNU9UYW05SlhEaFdw?=
 =?utf-8?B?MVFQVVZscG03cXRnaDZ1c2ZNVVhPcEF0cG1OZWljVTh5Ym9IdVFrY2c3aEdH?=
 =?utf-8?B?WUJxenBVTUhkQm94b1dxSm9pcDQ1cWc0cmljbE94eklZQ0NsdlhEdVhDTG52?=
 =?utf-8?B?Qkt0bzFtWjhwWHYxaXlpZmUyUk9wbXdNbEZiMWRYdGVmVEVoeWs0NmhZSVFw?=
 =?utf-8?B?ek94STNrSExCSlpXaURqT2pwdjVKTTN2Y243MzJGZUEzd2kvdVFMNFAzMHNl?=
 =?utf-8?B?NVpQSzJtdEgwQzdnMHlBZllTVy94UlZjMVk2STZUTFFScUEzak1mL1lLMlhq?=
 =?utf-8?B?VG0vaWN0dUZnbjBLSzAvQUFzNUNhbkJwVkZ4R0lMd256SGZUU21KSWswNVBm?=
 =?utf-8?Q?RGHMe9K1eoBvedxFHAtx2xwaVRfPmr9s81674hZ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf617a8-f1ef-438c-64ad-08d8fac79077
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 19:50:30.3703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWHnYtsPQEmLe9DIiV1jvtEL49SUBqmfAgREq2gSUNj81yuQ0ZXPs9CfQT1FvFmogm0Nvk2aJElxI7G+NReUuNsW+7NBpMqLxn1Kv0af0QM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3669
Content-Type: multipart/alternative;
 boundary="------------361FCF5942D4D044EE140AF9"
Content-Language: en-US

--------------361FCF5942D4D044EE140AF9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-04-08 1:40 a.m., wangmy wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/curl/{curl_7.75.0.bb => curl_7.76.0.bb} (97%)
>
> diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.76.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_7.75.0.bb
> rename to meta/recipes-support/curl/curl_7.76.0.bb
> index 7666c7b608..68315d9f77 100644
> --- a/meta/recipes-support/curl/curl_7.75.0.bb
> +++ b/meta/recipes-support/curl/curl_7.76.0.bb
> @@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>              file://0001-replace-krb5-config-with-pkg-config.patch \
>   "
>
> -SRC_URI[sha256sum] = "50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026"
> +SRC_URI[sha256sum] = "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a"

This change fails on the curl-native do_configure step:

| checking for time.h... (cached) yes
| checking for sys/socket.h... (cached) yes
| checking for struct timeval... yes
| checking run-time libs availability... failed
| configure: error: one or more libs available at link-time are not 
available run-time. Libs used at link-time: -lidn2 -lgsasl -lssl 
-lcrypto -lssl -lcrypto -lz

After a look at the recipe it appears that this may be a dependency on 
libgsasl. Could you investigate this and send a v2 with the appropriate 
PACKAGECONFIG added? You should also include release notes in the patch 
summary where possible.

- Trevor

>
>   # Curl has used many names over the years...
>   CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
> --
> 2.25.1
>
>
> 
>

--------------361FCF5942D4D044EE140AF9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-04-08 1:40 a.m., wangmy wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1617860454-5064-2-git-send-email-wangmy@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
---
 meta/recipes-support/curl/{curl_7.75.0.bb =&gt; curl_7.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.75.0.bb =&gt; curl_7.76.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.75.0.bb b/meta/recipes-support/curl/curl_7.76.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.75.0.bb
rename to meta/recipes-support/curl/curl_7.76.0.bb
index 7666c7b608..68315d9f77 100644
--- a/meta/recipes-support/curl/curl_7.75.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.0.bb
@@ -13,7 +13,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://curl.haxx.se/download/curl-${PV}.tar.bz2\file://0001-replace-krb5-config-with-pkg-config.patch\">&quot;https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 &quot;</a>

-SRC_URI[sha256sum] = &quot;50552d4501c178e4cc68baaecc487f466a3d6d19bbf4e50a01869effb316d026&quot;
+SRC_URI[sha256sum] = &quot;e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a&quot;</pre>
    </blockquote>
    <p>This change fails on the curl-native do_configure step:</p>
    <p>| checking for time.h... (cached) yes<br>
      | checking for sys/socket.h... (cached) yes<br>
      | checking for struct timeval... yes<br>
      | checking run-time libs availability... failed<br>
      | configure: error: one or more libs available at link-time are
      not available run-time. Libs used at link-time: -lidn2 -lgsasl
      -lssl -lcrypto -lssl -lcrypto -lz</p>
    <p>After a look at the recipe it appears that this may be a
      dependency on libgsasl. Could you investigate this and send a v2
      with the appropriate PACKAGECONFIG added? You should also include
      release notes in the patch summary where possible.</p>
    <p>- Trevor</p>
    <blockquote type="cite" cite="mid:1617860454-5064-2-git-send-email-wangmy@fujitsu.com">
      <pre class="moz-quote-pre" wrap="">

 # Curl has used many names over the years...
 CVE_PRODUCT = &quot;haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl&quot;
--
2.25.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------361FCF5942D4D044EE140AF9--
