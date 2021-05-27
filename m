Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1630.1622081400629451090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 May 2021 19:10:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R9tQfO1A;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0781cc0e5d=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14R29EHU001395;
	Wed, 26 May 2021 19:10:00 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 38syn5r3gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 May 2021 19:09:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeYCm+HuKSUubHMdyh9TtyVzaIhOY6UWaw5YlZzqF+HGY6Y2oPHrReNd9BFEwS4jeelXLVc+b42pJB1jhc5zzJwpynYmVT3ZPgENyaLsPVIVgGJZvlJsgCsdV6hrBpHdgTkEaEYIBbhAh/bZvi7ymiWstSTagQTpHUY1ez0/RNCSrU+OtrzpGifWmHfQ6DuxdTYS1BdWAkTrLSmclqTZBkSmbiK8MqoIgzzFzPz6wtwFy9rPGIaAj1gvNN75afWhoP+jqdHAWA3iXbST4k/TC1eD2oBluyr1bP7HNPcG8EPv6Ozs8Xp+u90UwqaB2pFLJ3b+zqRAWbYvPrhMSdVluw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5yHfDjamQnIb87RTjPlhbTNJyKxpTLO/Sqf1UE9Nsc=;
 b=ASE+xip1hVR2ichAoGBGsSwAm1hWSNguxU53V5VAyNYveuBIJtqqJqRnXg8F6PCRj/be9MFNVB7mm5BBlaQlPtR0+SBB1pDW5jmeqxOTSGYhZARcOi/HfDOjLcYVQFet5wLTMvB2GNegc3k1hWlOdDL97trvgbFgPxGVEVE0Bl+VWqn5X3nc/fY3J+kSDbwpRMejsA6ecbRwmgwu0FglZJ98JGDx22D0YOZeeQcud/Qzp2okQN6zIV1TIDILYOh4HpEEp7s0vHb5yk4a7GvaMBgqVMGpTistaCIwEcB8jJU4QbFtB9nxPhhFEWijfiJsM6cuV719AVuwlp9JwITZuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5yHfDjamQnIb87RTjPlhbTNJyKxpTLO/Sqf1UE9Nsc=;
 b=R9tQfO1AlrXMjc1rBC6NwTPwhTJxOuAhGzyBEv37EuX7FAUEkhJWelDedn1PMg7cJ+h7ozVrQPVBWJ4EDigj5Eluz6irO9ULq/nxOdV4388P0ChPS4Vb71W0RldJ16BG9qDvEgj85ZWZ18dB8UIdEk7g2rm/mZn/nUWwnmS95yk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Thu, 27 May
 2021 02:09:57 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Thu, 27 May 2021
 02:09:57 +0000
Subject: Re: [OE-core][PATCH] expat: set CVE_PRODUCT
To: Steve Sakoman <steve@sakoman.com>,
        openembedded-core@lists.openembedded.org
References: <20210526152204.1282585-1-steve@sakoman.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <6e79a9ed-ce41-eeb5-e1f2-4cdda18ea040@windriver.com>
Date: Thu, 27 May 2021 10:19:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210526152204.1282585-1-steve@sakoman.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0009.apcprd04.prod.outlook.com
 (2603:1096:202:2::19) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR0401CA0009.apcprd04.prod.outlook.com (2603:1096:202:2::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4173.20 via Frontend Transport; Thu, 27 May 2021 02:09:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 934b64f3-6c6c-46de-671c-08d920b4866e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43066DA51757A1C783BC2E45ED239@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lppEzOKJBmnBr6fQ1IXg+pcPlR1r3zwaMbxuEPbh1GZEJLRPbcZkqj/mVs4Hm4IvdzcXnKQkMpmnzAcnbNrzjvrcvH/y8q7TxF8pFpyNTSIDbgLUtpBYkQB4rCUYj/4PNrrpdby8FYkFqApduzqJeoZXOGRTyGpsqk2JRhuZWJcfTK4g6dOQhyhtq176r7Xnp2MxAjLheky/lk//nV/B+fn8PZbUeIFNDk6MT4xpsaG6P1kKKtnpGpUZqc3TMDY03pT9VcEMjtuJDsPMYb8QRuetmbRdRCgoBmn6cFw0BPBn3/LpdlfEZzL7f7Q2i5KGt1m1MMX3AMvPMmNsXnUd1x6MGEBHW8YFC6XMn8F5ExpIqdmpdzbmG148wWVtzYotf8MKR7tcud53bbYF6ZBOwCKTok+3sS/1Swpl5olKiQ/jQtktAhaHa/WeIQWgq+twadvaiYGqMrOg5gxUn6fEb2O2JriGY3uECXGglFs7vJuIVkg+3pI8phJ5BwPRH+0lHXVFm7DfbUF6BoVPbMtoccxczY1I6UyIFKLpKxhLav/nFSGHMA7v++Knj9hW2ZFrox60sgt55mvNPY9Cctu9Ck5sXUK9AiVrx94hl8/iaG/5mPlltmWBUdMd58j6W8kyreRMztW2/dvjjoiBOSjlAekK0icqRgcGe57MzPTa2oMsA1ysdbOwbfA8+PAqwCX+hsszPtdzIutkY8nYJluwKFcryCovIk0KNoozxOOmmm5w+WN/9m49OZzKNtiRwlw8z+6Fz2BhAoAs2FWMzFmnN+5RTdXmvp7HsdoDKymtXoYi6HtmUdSLtnl+tjsNHWI/iX0sTQrVJZK5m0jam/Z7lo9zTfKCz3SPTmNbgQamxxM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(39850400004)(376002)(2906002)(478600001)(6666004)(53546011)(66476007)(86362001)(31696002)(966005)(6486002)(26005)(16576012)(186003)(33964004)(5660300002)(52116002)(66946007)(316002)(16526019)(83380400001)(66556008)(956004)(31686004)(2616005)(38100700002)(166002)(8676002)(6706004)(8936002)(38350700002)(36756003)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?clMrTExrSkEzbjVJOElHdjEzNVJVOTJuVlQxZEhZeWYwY053ak1Ld2pYV2dh?=
 =?utf-8?B?ZU1JUG1NTzRYdzN5TmZ4OVlERCtKK09HeHRyV3JHL2JmMVR3anNvNUdXWXRY?=
 =?utf-8?B?bmN6RVczUTlrbDN1OVQxZmJsWDJ2cVB3ZEVGTklZREc3cCttQUNJYm9oYWVP?=
 =?utf-8?B?ZUFOaXlobWdiVkFHNFNORmxCQmphUXpBUTZaN2paWDZVa21tQ3YvMnQ1bE5I?=
 =?utf-8?B?SC8rQnhSWVdBSHZ2dHo5YVlVMk54amdUUEJXeXo0UThRMGkvVHRaREdaM3Jk?=
 =?utf-8?B?RmpSUVNjR2Q4ZW05UDZYdDZNTm1vaUk5QTh2dFAwZmQyNFdCZ051aGpRcFds?=
 =?utf-8?B?Ni9Oa2lNZFFzcmtOWEFYdEZuY1c2emRNb3BHVjl1NTlaamtSVGtQMkVXZFl0?=
 =?utf-8?B?MzBZTEFqM0dtWWJSWHJBQi9mYUlqR2ZzcFJ2NDBrZFoxZk9xWHVMVlp5a1lP?=
 =?utf-8?B?T3FKK0xyakhFSXVPTjd5Wmt4S2NjQVIrYW04Z2Q4a29HRzF6N0FlWVNWMWEx?=
 =?utf-8?B?OENpMXFneFJWMW5SQTdOMkF3L0w3T2lZMEZ6ek51NW9JdE54dkFnQ0JaSXVM?=
 =?utf-8?B?bXlHUGRYU1lxOTM3LzdqZkZZZnQxOWJSRGhycmMxSXAwcjVrRlN6OUk5SGNa?=
 =?utf-8?B?b2RaYXhoV1M4UkZYVGEyd1p0SW5WWVA1T2JHbllUVDVkdlJzd0E4R1gzOHhu?=
 =?utf-8?B?Mmc2VTlHNHVmSmdXZzAzaUhtK0NLNndoa0VQT1BDQ2pxbWhFTk9CekVmTkkv?=
 =?utf-8?B?YkpMcEpLM2hqYjJlSmdLNUVBb1k0U0JsWG5EenJYWmFqYnJlQzh6QXZsYmJC?=
 =?utf-8?B?SzM0ampNMzVvQmtCaVIyd1dHVXZiWk81MS9iRFZXaC9iZitzaUoxSEhabTls?=
 =?utf-8?B?YzMybEJzRkFNTG5ZS1NyUFhTV09QM0lYWGwyOGhxUlVIdVQ4TURVYkNEL2Rm?=
 =?utf-8?B?dTBhKzlkbTRhRHV1VW5ZeTZzZjlaZnN1NTFpeFloMUlRMm1nSHAwYnMzRVBZ?=
 =?utf-8?B?SUNMMEZ3aS9CWFNPMVU1eXU3NnFOeWk3QUdZVUVzV2FpeWh6cy8xdkxvVFha?=
 =?utf-8?B?eEdOanRBMjU2ak9EZDJKS3VuTzBqcE1LRlZQUkdOTkpBbWNmZmhJTXFRb096?=
 =?utf-8?B?dXpWTWplYjluVVA0MnRkV2pSc2lHcHExRnRUczY4ek9LVld6Znlhd1VOa09u?=
 =?utf-8?B?YXczMU9YWlViLzhneWN2S2g3OXdEb0dqeDhZeUJQK0Z4cTBmT3RFZnZ2YVZy?=
 =?utf-8?B?d05WMk9HOVFoUHN6SjhkYndCb1Z4cTBFOFhTUHAvMy90Rm5uN012bGxxV3Y3?=
 =?utf-8?B?QnUrcTBWY2h4MlBnMUNYcE9YMzBrVy9RaG5uWDJNTVlUOVBnVmJtMm8rd1Fw?=
 =?utf-8?B?YVl2SGMzM1MyVGsyVnFKVU9mNzBoaTJXRWo5NGYyT0VpU241QU9IUHR1ZU5G?=
 =?utf-8?B?UHN1K3pDL2hCRXJRNzJrRDg2ai9id0FrL0lXcERBUUpEVUFreUQyRnRPaVVF?=
 =?utf-8?B?V2JEanRYd2ZDUS9nVmlOYVNyanp2Mm4xaDRHZm5vSGJ1Q2lJZlRwa2hiNi90?=
 =?utf-8?B?OExvSENwSCtjWnMyZkNBd3RWdlgxSG5xeEtySHRVdDkxYyszanJZVTNqUnVR?=
 =?utf-8?B?dnA1eTVNTlk4MG95RnhIdXBjcHcxRG5xRkRsbDdNc1JqWWZzVnZIMW4zVjNV?=
 =?utf-8?B?TU45OTZFK0pQT1poN1hEQ3ZJYlpPQ0FyUVJTL08wTDZMS2VoS2Y0QjVTUWd3?=
 =?utf-8?Q?MkUboUo23QSPab0Qd7oNIXRpJTc1fkb+86XAnle?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 934b64f3-6c6c-46de-671c-08d920b4866e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 02:09:57.3708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TI0tT+xHIheFfATlIOF3aVN9+38aNLe4Ht4KGthyowngPupn7QVy5u9nMJFYNJ/eyoHF8slmYkJ6DZcdSaY53A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
X-Proofpoint-ORIG-GUID: F3W9fHkB2L9ERxoxT2RYpgrn6v3UodKb
X-Proofpoint-GUID: F3W9fHkB2L9ERxoxT2RYpgrn6v3UodKb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-26_13:2021-05-26,2021-05-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 mlxscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105270013
Content-Type: multipart/alternative;
 boundary="------------09EB170A5FF627F5B3C43B8D"

--------------09EB170A5FF627F5B3C43B8D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Both 'libexpat' and 'expat' are used, from a fast grep in the json files.
Maybe we should use CVE_PRODUCT = "expat libexpat"?

Regards,
Chen Qi

On 05/26/2021 11:22 PM, Steve Sakoman wrote:
> Upstream database uses "libexpat" to report CVEs
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   meta/recipes-core/expat/expat_2.3.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/expat/expat_2.3.0.bb
> index 14d2855df3..b77b114fe2 100644
> --- a/meta/recipes-core/expat/expat_2.3.0.bb
> +++ b/meta/recipes-core/expat/expat_2.3.0.bb
> @@ -24,3 +24,5 @@ do_install_ptest_class-target() {
>   }
>   
>   BBCLASSEXTEND += "native nativesdk"
> +
> +CVE_PRODUCT = "libexpat"
>
>
> 
>


--------------09EB170A5FF627F5B3C43B8D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Both 'libexpat' and 'expat' are used,
      from a fast grep in the json files.<br>
      Maybe we should use CVE_PRODUCT = &quot;expat libexpat&quot;?<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 05/26/2021 11:22 PM, Steve Sakoman wrote:<br>
    </div>
    <blockquote cite="mid:20210526152204.1282585-1-steve@sakoman.com" type="cite">
      <pre wrap="">Upstream database uses &quot;libexpat&quot; to report CVEs

Signed-off-by: Steve Sakoman <a class="moz-txt-link-rfc2396E" href="mailto:steve@sakoman.com">&lt;steve@sakoman.com&gt;</a>
---
 meta/recipes-core/expat/expat_2.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/expat/expat_2.3.0.bb b/meta/recipes-core/expat/expat_2.3.0.bb
index 14d2855df3..b77b114fe2 100644
--- a/meta/recipes-core/expat/expat_2.3.0.bb
+++ b/meta/recipes-core/expat/expat_2.3.0.bb
@@ -24,3 +24,5 @@ do_install_ptest_class-target() {
 }
 
 BBCLASSEXTEND += &quot;native nativesdk&quot;
+
+CVE_PRODUCT = &quot;libexpat&quot;
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

--------------09EB170A5FF627F5B3C43B8D--
