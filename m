Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.84])
 by mx.groups.io with SMTP id smtpd.web11.5032.1618811587158678085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 22:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gsuxbS6b;
 spf=pass (domain: windriver.com, ip: 40.107.244.84, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwCLHel6bgMj3IsFb3aCqjX8MzYgRrOpgIqJ8UwZgiHP3cnqzwZQ6mu26Sms9Ri3IWzHETTRzzq/ekF6AUATEQgLqzYAtc+HFBX7UWmh+uZODT/914tsctt9IsXuAlarWh02XR/oiF7doxzrqmyVSP5UCAlH4LEcpPfaqVdOoMwLiqUUIJRXSW09dD0afu5chu574h/Btm31aXx25NUonzlArLJFmuWDE8MN61rcg9ZUygNb/L+B8Q28llAmrEKPiPrliLOIUSqz3ZoaEw+wIP6ac8ehs/p0/PvA7CdG/DOapG6xFvlcaZMRPJx4MImWM8VxtmJgKWOMJOUFtTshsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBp9HmpLsS3ndCIGee8Ji/I0a3ngnK2dMHROMJjn9Qs=;
 b=LwEhE3gU2k7RgT7jMcAGy2496XtyH0gAAbpocEcq0ZcqjK+7XTdKOKIgvgW4f1AUcTQypDBLyfV+MIdWhOH7s2jWW48ZCasP5icSkP3UC1Kd/8m7brXaqG43zhO7M34OKE/zRXy3yygTEqqk11fzltFxpIJVxrnS/cwMb4PbqQWuAp4Ock+ymjjWrjFNA2PLsKRcuybZQPnJUdMuR0YB4Nc/79aqZvsBVdJORGe4IXwBDvYBir6Up5pv3++FL1Kthieq3VsFYmRe95Ox/5zey5ighnb2K1PB61epTju6HsusrYtzGgEFI8TPHM4u02Dc8xbFmOfZIiAnWGrP42Ynng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBp9HmpLsS3ndCIGee8Ji/I0a3ngnK2dMHROMJjn9Qs=;
 b=gsuxbS6bxvJns5cO8R5+zaWX/b/aYPA83QpEmXU50JFEugNaBSQWHegLrvR66Q12BQw+WoOe/RyHThCRKi06MbcCjOaxdKsQFJflrlb4feiAlzvUj5vn+GizPeJE3yP6orxui9WdzqZ7i1SaGoKuuB1x7VZU9P1PDep1/bj9oXc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (20.177.127.219) by
 BY5PR11MB4151.namprd11.prod.outlook.com (10.255.162.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.19; Mon, 19 Apr 2021 05:53:04 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 05:53:04 +0000
Subject: Re: [OE-core] [PATCH] db: correct CVE_PRODUCT
To: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-core@lists.openembedded.org
References: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <b053131b-a5cc-9eb9-395d-ef9cdf995e82@windriver.com>
Date: Mon, 19 Apr 2021 14:01:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0217.apcprd02.prod.outlook.com
 (2603:1096:201:20::29) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0217.apcprd02.prod.outlook.com (2603:1096:201:20::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4042.16 via Frontend Transport; Mon, 19 Apr 2021 05:53:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e11c52e3-2d8b-4828-d17b-08d902f765ab
X-MS-TrafficTypeDiagnostic: BY5PR11MB4151:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB415113554FF9902C51086FE6ED499@BY5PR11MB4151.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1850;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hpifZnP5ib5JrjFCTxMfURwGPIcaEPH45lb28hPSVvPG2F5OokMRHtNCn1xBxqSytb+IxnHV6wOCKpsY4AsxxzV8xwyN7anC0238ytVIfMxwxNiM84VoAlsIh3nC9G56gifA3ohyfAnCDx4kbcNTCgZ1cQJUEf3dTvjA7UhZRCWXb/547ZtsTxQX8TEHAjV0ifHu5OgKqWjW7rlUjnvUJFo8gRgecWaeq4ZPcnZUAx+eKc/qBzrK4sBlEnqZAohQmI3FOukgATYDgtC7OMcrkgcCYUwueYSxbZk0xegas2l7vwTdSosewfTTXltUtB0KgOXvVbWobBWgoEgvAz59uajVGS7yi2jM9967djwvz3bOQU5oyMKtme/x4hadgkAP1tdt4KhB117EC4EejCyuJ8OFGNU5m7ZowXKmvuVcetRd7mMD2hznL+bLxzS9tsw9P/eKIefrKcSOe0T29L4F0ciKEZ56g/LU4R6J23w1CFAzGlD1bNGLCUolZN2kfmmY8++fghtOMm8XA3vEl4TYFrRV7QnIZ1qXx/JOpK5siSHO+hHbdqRxIGHyeontMtiBY6U2gIXjchKcCXWd6M6sadOWSvL1ZCjKm4oVt7KpqcGKLncNAQEw5AOuUcQT9pC4jGPRlYLZoeEmZ7t9l4MGpeQA4jlOZnoKlldAO8pWyJp88MbPo+LtYOcWOU0CcI+4/nFvz3ZTUrwCNctICA6Y8JV1VSQawYhP4Si0+j4Ot5Z353R/XjU9pP0WYQuo3Xy23KnW+aDRQXlAgR5SR8Eg9CLoc4318zStnkNscIzBjDzug/z6HgCEXehlFUN2LsLw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(136003)(396003)(376002)(346002)(186003)(6486002)(31686004)(53546011)(2906002)(36756003)(86362001)(16526019)(6666004)(31696002)(2616005)(38350700002)(166002)(38100700002)(316002)(478600001)(16576012)(5660300002)(66556008)(33964004)(26005)(8936002)(66946007)(956004)(66476007)(8676002)(83380400001)(6706004)(966005)(52116002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y1U4YVVwTXFLZzJwZWQzc2w4d09zOVhSUjNrUTJCSUpnZUsxK3RLUTB2Qmc2?=
 =?utf-8?B?cStveDdzTkxaTjhHZW5rdlNaVWpvcy9BYklRNGNXbWJCZCtLUXdLYktRYVhi?=
 =?utf-8?B?ZHd3WVlLb3ByNk9CaGZtREVpb0I2U2diNHk5KzZ3elRTN3QvTkZIMlc2T1o3?=
 =?utf-8?B?UmtaL1hLQnlHNVRvT2UydnBqbURiamdycnZoR1dsK1crc3BBR2pSU0RBTE4v?=
 =?utf-8?B?SzVMZzlSaUxDTFNnWS9qc1lQNHQ4clBHYVk2VC91cDlBSm5taFpmQ1grS1U3?=
 =?utf-8?B?MkF2WkZsMEQxSEJib3pTMG91MjdVS29NVnVsdHdFeThnMGQ0aTJhNDUrSXBR?=
 =?utf-8?B?dlQxV0VSVWpHWGQzQTRYZWdOVGo0VjZYd01uSmY1RG1tejZDTkRIOGNITVF0?=
 =?utf-8?B?ejhPTkxOSWNsMGhIY29qbnZIczlNbDlxSGxHaW84MDVacmZtMk5hWHJLdkly?=
 =?utf-8?B?TUtEeFJFcDc5blFxazFUTkMxTEo1VkxxeHdaaDdJWkM3M1cxQ0wxVXdqQ1hu?=
 =?utf-8?B?aEl4dnp2RVBIT3kyQW9TMStWWmk5OUp3blBTcERmTHNDNXZmelVnZHhVWjVy?=
 =?utf-8?B?dXdDMXdmWXEzY2VZS2lmSDhnQ3d1bExsZHBURDZmZmluM3h6NjQwaUhkRXl3?=
 =?utf-8?B?aW9pMERMMDZCcUtuNEhCdG9hYU44K2Vjejh1dlBZalpyOWNJUzRSSi9va21G?=
 =?utf-8?B?bzF2VDBFRnc0ZXFCMWg4aVppS3pXaHZWYzVBSmM2SC9TN2lqRmliaTl2QS9y?=
 =?utf-8?B?RXRFbHBDTFJSRU9jRUlZSUtBaDViUGd0S0Y2V2VWcTh2M3J3ek02ekE4MTRs?=
 =?utf-8?B?ZlQyQW1DWTJ3MFVuY3Fxd1Q0V21nWFpPdDRaM1R2dXc5UnhMdzF6UDlLTUZ5?=
 =?utf-8?B?SURzV0RBS24raFZxcUNIcFpRNTRHcW8xcGllN2w0WjV1SHZ3YTJSMk5tUW5x?=
 =?utf-8?B?amRLWEdNa0F5Rmxsb2FIYjVMSkg0ejE1ZmpGcGkxNHVsNiswQmJrTFZmVysr?=
 =?utf-8?B?VmZaRnVhZmJUYlVoYks1eG9uaVpxSy9EZW0zUDdrd2hsaEYrZnRwS1BGai9p?=
 =?utf-8?B?dXgybDgxdmVrdWwxRzJhVlpBWk5DeExFRTE1MGhUUEQrdnY5WGE5ZzJnd1ZB?=
 =?utf-8?B?REx0SkxJamFyY0VYb0kyWkpPL1VkWStoUzZGK0s4TFhrOFJGalpLdjFmUVdO?=
 =?utf-8?B?eEtUN0pqRGEvclFNWkZWelZVRjVRaklmRWlDVjNOYWdReDF6d3hQUEJ0aHJq?=
 =?utf-8?B?UkxnbkhRT1dVYk1SNHZyUUIrRWJRM3JaOE5KNHBTWVJYcE9FTmt3T2JCNC81?=
 =?utf-8?B?ODRmREVLM2N1OHBzSUNHcmFwd091c05xUUNKNWFtRWc0ZnhWdnZhd1djemF4?=
 =?utf-8?B?dTJXdDVkVlcrVjdLWjVwSUw5K3Z3cFZ3YVh6ci9iZ3BLdlF4S0pnS0NjMkRW?=
 =?utf-8?B?U0svRWtGNExRdDVWUmpzUVAyb0dwNXZPb1EveXp6RFIrYXB4a3IrTE4vdThm?=
 =?utf-8?B?TERYZG9OcWRJME43NXBGUzlETUZLVlVZWjFlMnQrSmhSZW1xRFdzWlU2MFRw?=
 =?utf-8?B?U1VCWFdjb25lNU8yblBNUmZlcVVXbytlVGhiaU9tZDRBRy9rWWJiWC9nNjZl?=
 =?utf-8?B?d1luVjE4TGNaZGViMXdwM2hFblIrN1ZNN3VnNFV4U3Avd3lFMy93QllMNTRo?=
 =?utf-8?B?SVZFWk5TOTR6SGQyK3h3OVVFU3h5N3FTanppaHBVek5WVHIxb0x6QmFHeXUv?=
 =?utf-8?Q?zaZuqVK42tgCux9ud4IyWhnk/PP792aeQQBu95T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e11c52e3-2d8b-4828-d17b-08d902f765ab
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 05:53:03.9950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh6oH+ihzO4mzJ778a5wvJVyw+ga4X+I7lIcQBVgKr31sz0goNwGriPq2dWYJWHGMQJp0HwoNK8iJc0GBAlQFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4151
Content-Type: multipart/alternative;
 boundary="------------6E79F7D38715FFDFA44E5BB6"

--------------6E79F7D38715FFDFA44E5BB6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Which ones?

Regards,
Chen Qi

On 04/19/2021 09:45 PM, zhengruoqin wrote:
> In the CVE database, now it use db2 instead of oracle_berkeley_db.
> So, in order to be handled correctly by CVE check, modify CVE_ PRODUCT.
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
>   meta/recipes-support/db/db_5.3.28.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index 9cb57e6a53..05720053f4 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -15,7 +15,7 @@ HOMEPAGE = "https://www.oracle.com/database/technologies/related/berkeleydb.html
>   LICENSE = "Sleepycat"
>   RCONFLICTS_${PN} = "db3"
>   
> -CVE_PRODUCT = "oracle_berkeley_db"
> +CVE_PRODUCT = "db2"
>   CVE_VERSION = "11.2.${PV}"
>   
>   PR = "r1"
>
>
> 
>


--------------6E79F7D38715FFDFA44E5BB6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Which ones?<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 04/19/2021 09:45 PM, zhengruoqin wrote:<br>
    </div>
    <blockquote cite="mid:1618839901-127113-1-git-send-email-zhengrq.fnst@fujitsu.com" type="cite">
      <pre wrap="">In the CVE database, now it use db2 instead of oracle_berkeley_db.
So, in order to be handled correctly by CVE check, modify CVE_ PRODUCT.

Signed-off-by: Zheng Ruoqin <a class="moz-txt-link-rfc2396E" href="mailto:zhengrq.fnst@fujitsu.com">&lt;zhengrq.fnst@fujitsu.com&gt;</a>
---
 meta/recipes-support/db/db_5.3.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index 9cb57e6a53..05720053f4 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -15,7 +15,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.oracle.com/database/technologies/related/berkeleydb.htmlLICENSE=">&quot;https://www.oracle.com/database/technologies/related/berkeleydb.html
 LICENSE = &quot;</a>Sleepycat&quot;
 RCONFLICTS_${PN} = &quot;db3&quot;
 
-CVE_PRODUCT = &quot;oracle_berkeley_db&quot;
+CVE_PRODUCT = &quot;db2&quot;
 CVE_VERSION = &quot;11.2.${PV}&quot;
 
 PR = &quot;r1&quot;
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

--------------6E79F7D38715FFDFA44E5BB6--
