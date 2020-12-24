Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.87])
 by mx.groups.io with SMTP id smtpd.web09.7799.1608792953074958800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 22:55:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Xu8ECUY3;
 spf=pass (domain: windriver.com, ip: 40.107.93.87, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEFjcKNoCobkjonWm662TUT8NLIQ9LXD+Ixh99JUcottsLw6/WHKd4JRHebdWaxo9QM+lGiP1l8U/TnwBP8nasunHxg293NS8tdaQQEaDAgwI6ObW9Ii67SJ3WXMA+7B3eMBmwx8KG4ObanRsPugOzdssM+SdNIss6FHZLcCY86O3UrP2D5LRK3ygpY028PLhFLHWIQKUa/UU3wrrzhpYKUoldVFFC4lJe/RVJoLoahIQMRorOLMNbr+AMJc/k813pxMN2tD9a/W+8/3598cKiyMzIDUH21aH0pyt8CHv/C9ok6KPjMoYLVBWOmwbECQ1ovuSWwVus7GiGYetlSIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8cUXcZuO7JKHwMbvx/TcmHYcfK1Z6Q/6WhMBylaGwg=;
 b=LTrDDMVPeVDU6Eocfjxk3A1mbtA7xoSIHew8S/HmR7Wn4/0wEHlHz150/J6STQcHAISGFQ7OlpCveh57vO5lSsDCLd2J+M8vytdV/MwUi2H8Ek2gpk9PrYhWDfyRAkSKkmaWS89pWxqip5agWMIW7lOLbOH9ySVdsVEfTxcqnnsai0El4NQSoVdlow2kv5JzUkWVNpRQYQw7mmK50lE1tjK88l3rLOgdl6TEGKFY2crjtUl5gDqxDOEesgA71b0ZrPLrAqV7xfVjAsn/1F0g//Z5Kd4hu/H1U3wXaRUD2BwXLeA97gkqkDukAh+JioxJd+4ewgbVoFl2WovYstfyPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8cUXcZuO7JKHwMbvx/TcmHYcfK1Z6Q/6WhMBylaGwg=;
 b=Xu8ECUY32P2G3iFHHWusPG5cMGuLOxm9/zHe4xax/9Yc/kp14P4/GJp/1tu5cW/30H19//DufHyfXZC2lhOdU7jS1/v1Ie5P3wU4l86AvX7HB7wah8TC096Is9WojRYohCYzwN/XthVj+vIEuxDKOH4HGPl/W/3cBb4D7q4E7OU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4181.namprd11.prod.outlook.com (2603:10b6:a03:18c::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29; Thu, 24 Dec
 2020 06:55:51 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::3c77:a84f:ae81:1cb7%3]) with mapi id 15.20.3676.034; Thu, 24 Dec 2020
 06:55:51 +0000
Subject: Re: [OE-core] [V2][oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
To: openembedded-core@lists.openembedded.org
References: <20201208015819.154331-1-jiping.ma2@windriver.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <b75e80f1-6253-ed4e-c91d-5a57d342dadf@windriver.com>
Date: Thu, 24 Dec 2020 15:03:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20201208015819.154331-1-jiping.ma2@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0022.apcprd03.prod.outlook.com
 (2603:1096:202::32) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR0302CA0022.apcprd03.prod.outlook.com (2603:1096:202::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3700.24 via Frontend Transport; Thu, 24 Dec 2020 06:55:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 441834d6-4911-4bc0-9df8-08d8a7d8f3bf
X-MS-TrafficTypeDiagnostic: BY5PR11MB4181:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4181C3D79F70D1DAA99AB23EEDDD0@BY5PR11MB4181.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HLdkyGBU2XQ9mlhK2Ce30bysQW1Iwr00wWOU4a6ISo2HJtcGXNV2qyvM3YBa0AsyuY9sIgujY++GSmhc+TEIAcM+yXhNV0nl5WHQhF9bLa7/sBvS2hn9ob34Z0r98OVWIgsG8kDIGbxpbCWgV5bS7C+rlaZgHmfcP64i4AuG3I7+04gZKENdRFxkMM729Yxu9KFa/YvjypQd9gtPlNVlI0k2Zpk4zNM8heXg9EQUlJ/A4ECcPs1bdqVB5ZbVbOOzLu1z5HRSqF1bJFQOLf8oD+HE6Eq4dNBufAR92hmj4SeYDx4N3iqRukd939dlyOFCfJoXj1ntZXb7HKqKeIU4VoCSp0fsgHys81KiX+llQtIujBi5eo3rk6ym+5tphBd5iKWkXLRz8YI4QuUcl03X1iW3ZAX6siwmiwMS56fIJ0pXBN9zyhvFDYUKBDqI3LRw+bf3bvhpZnmQKcvvz4hArpuNeLBWRCI79vXn/ayJTp1a1tdrYwIgc6GwSw36iUVGr32fQh7Jc6oPdQCJmNNIOusjk8TISfrinVxTi3FkMoK6GGjsfaWtZHRyXxpbLpcz6h17LdV+GYldlzNV2y4Gzg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(346002)(39850400004)(26005)(66946007)(66476007)(5660300002)(33964004)(8936002)(186003)(86362001)(31696002)(66556008)(6916009)(16526019)(8676002)(2906002)(52116002)(53546011)(83380400001)(6706004)(31686004)(966005)(956004)(16576012)(2616005)(316002)(478600001)(36756003)(166002)(6486002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?R3R6MEYrVThHMVhUQmdsVGpBNHc2NGY0d01Ec3Y0NWN1Mlc2a3c2eWFBZ2li?=
 =?utf-8?B?YzhzUWU4NXNEM2VXQmthNzZLN0NuYTVjWHBReFZYZlZhUEdYaHRFRnljRzBo?=
 =?utf-8?B?V0luOTdTVUJCZVpDRG85eGlhTEYzT3BPNkFUMWpzWHdiMlJSekxWa0R0WlAy?=
 =?utf-8?B?RnQ0ejhRNmJGTGo0b1JrWmZWUkcxQU9tQ3JVTk1ETitkTkF3SE1CenZhMjFh?=
 =?utf-8?B?MytOUHhmOU9xM1c5eVFTR05HVTN2N1FESllDZzB3U1ZHVFh1TFhpT3Nva3la?=
 =?utf-8?B?a3FBcUtDb3p1bGFDMUdSOVhlY1N2WXBxaFJxNU9mRjN4MnN4ZU9hbXlzbkNZ?=
 =?utf-8?B?dEtrVVA0WW04RmY3QmJ1UGtvbHFpNmZNWkVZQVVuN3RJaktuL2g1RFRSTnhB?=
 =?utf-8?B?OGgxamgvK0MxbGY2QmZlbWg4Tk5JY0pyTlpxaml1c091QitDK1hSM2YxNmlj?=
 =?utf-8?B?R05XL2RwUlFic0ZyZzNSbmhiRE55VGhBeUg2OU0vcUxlUmJqSTJJb210SlNH?=
 =?utf-8?B?SWxPNGY1c1NVZXh2NVJCSWs3ZDAvcXZBcWJxM2RtWXlNci9kdVUzUGRGUUlQ?=
 =?utf-8?B?ZWNWamY2WHNZWnpDUGVsNHZXRWdObmVBenlkYzBxK1dJZVFuL1hmbktraDdF?=
 =?utf-8?B?TnpBckZzMktaU2ZDTEltSDNGV1krcFJXOFlJcDU4cW1vWi9WUmJvT3Y2M2RH?=
 =?utf-8?B?aXVhQkc5d0FydkMzYlJzbENXVEllaW5vSm9Ua0xoWVozWjh3VDV0VnlwdTNk?=
 =?utf-8?B?SjdxbWJaY0ZmTkRYK2RBdXIyMSs4b3FBSW11VlRGV0srTnVzMDk0aUNZL1Vp?=
 =?utf-8?B?b3lUc1Vha1U2STVnYkdJcjNzSWF4bWtRRkJhRWdvV3dsMGZoRGlseHFNb0kr?=
 =?utf-8?B?Zmp6UlMyYkNaclEvOFozSEdsUHZDbUdHd2tYazV1MEpZL1cvcFQyM3Q0bWJX?=
 =?utf-8?B?Ti9LM2QzRWowSzNZOXZYdUVXa2UzS2Q3cjNOK1Q3Y3N2ZS93MjlBVVM4UHBt?=
 =?utf-8?B?dXptdnJMcGkvYWlmeGRqREEyVVdRSXJyZThoKytvNEl4c2hncHBNNWtQdkpJ?=
 =?utf-8?B?WlpoUmdDTnFHeGVkMUtZaDVDUVlKam1iYTViNDg5NkY0REdnRDdQRVZQM3Jz?=
 =?utf-8?B?OVRoajFoNHFnWUQ4Vk5oanArWUNwL3pRZUNWb2ZPZUhXVkJwWlgxQ1hTNW0z?=
 =?utf-8?B?MDI1eldwME5XMEdWbHBrd29VcXc2UHJKREdJcnBXS2JJclpyYXVEVHppQ1JN?=
 =?utf-8?B?UkJ2N0RpdVFyTHQwWTJvanYxSXdkdUptZUtMQkFnYnNVNFB0WjRweFI3SkJm?=
 =?utf-8?Q?LluKCS5k/PB6c=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 06:55:51.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 441834d6-4911-4bc0-9df8-08d8a7d8f3bf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v93EYwffft0Ih+FG0HKhJ28RE6hBV4KSSibd4j+KoNrib4/K0JYYIdqSXb1fa9OOMj+a/KJ72urjUzhACetdzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4181
Content-Type: multipart/alternative;
 boundary="------------D3C17B9FE1214E2E2A7A3E0F"

--------------D3C17B9FE1214E2E2A7A3E0F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 12/08/2020 09:58 AM, Jiping Ma wrote:
> 1. Build SDK without "MULTILIBS = """ in local.conf.
> 2. Build SDK again with "MULTILIBS = """ in local.conf, build will fail with the error info.
> Error:
>   Problem: conflicting requests
>    - nothing provides binutils-cross-canadian-arm needed by packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
>    - ......
>
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> ---
>   .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> index 3b430c0814..b6b3e5235f 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
> @@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
>       meta-environment-${MACHINE} \
>       "
>   
> -# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated),
> -# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
> -# This will result in erroneous reuse of previous sstate packages. The following line
> -# establishes a direct dependency instead.
> -do_package[vardeps] += "TUNE_ARCH"
> +# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine
> +# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to
> +# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
> +# following line establishes a direct dependency instead.
> +do_package[vardeps] += "\
> +    ${@all_multilib_tune_values(d, 'BINUTILS')} \
> +    ${@all_multilib_tune_values(d, 'GDB')} \
> +    ${@all_multilib_tune_values(d, 'GCC')} \
> +    TUNE_ARCH \
> +    "
>
>
> 
>


--------------D3C17B9FE1214E2E2A7A3E0F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">ping<br>
      <br>
      On 12/08/2020 09:58 AM, Jiping Ma wrote:<br>
    </div>
    <blockquote cite="mid:20201208015819.154331-1-jiping.ma2@windriver.com" type="cite">
      <pre wrap="">1. Build SDK without &quot;MULTILIBS = &quot;&quot;&quot; in local.conf.
2. Build SDK again with &quot;MULTILIBS = &quot;&quot;&quot; in local.conf, build will fail with the error info.
Error:
 Problem: conflicting requests
  - nothing provides binutils-cross-canadian-arm needed by packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
  - ......

Signed-off-by: Jiping Ma <a class="moz-txt-link-rfc2396E" href="mailto:jiping.ma2@windriver.com">&lt;jiping.ma2@windriver.com&gt;</a>
---
 .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 3b430c0814..b6b3e5235f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,8 +17,13 @@ RDEPENDS_${PN} = &quot;\
     meta-environment-${MACHINE} \
     &quot;
 
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
-# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
-# This will result in erroneous reuse of previous sstate packages. The following line
-# establishes a direct dependency instead.
-do_package[vardeps] += &quot;TUNE_ARCH&quot;
+# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine 
+# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to 
+# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
+# following line establishes a direct dependency instead.
+do_package[vardeps] += &quot;\
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    TUNE_ARCH \
+    &quot;
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

--------------D3C17B9FE1214E2E2A7A3E0F--
