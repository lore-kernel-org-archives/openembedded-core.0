Received: from NAM04-BN3-obe.outbound.protection.outlook.com (NAM04-BN3-obe.outbound.protection.outlook.com [40.107.68.81])
 by mx.groups.io with SMTP id smtpd.web11.11334.1597224352423776018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 02:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CdDJGjWL;
 spf=pass (domain: windriver.com, ip: 40.107.68.81, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cxj8O1KIchkJUVfk0PsU8EVDzbsx4zPPkfyV3iTP1OVwEJ2nD0nRHzkdKd+np5it3CWoyXIskfHO5aHz1HYdSqDlj0lsEaOq3jj8CsUV4C85nvrwIi8s9d4S1ey/eabvHos4fSuEu0jWw6ryxao8VHTP4i3N8oYvWaraLMihOhAbKsyD9pNPU1NW1kDt0WsQvW/dv7pZPAoDVVP7wUn2SsL1VpdhdyhRZ5SqemRTuW/R6AS5ODtYowqeDTta2fBicRMCnaXL2cqfu8lsf7PN8yzINgc4FKRL90STSerdGpvasarf3nZtIzDM2CT4SuaXVkceRHdMRXYDXdOTM2zn+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmI/L+/Bb7NvkJtGZIb8uX2J/9CvlZ7KRP9GfbMUbrk=;
 b=hc0JwS46FAn9+MehFsN+5uh3j2D+M6A3R5oPvVWtcxRxA3B29Qii8PITJB1b2YKt87F0aHA3/j115u+bC7PqxaY7CLnZh23YwFHkWhwTYe1h4nAAheSupmLsu5xRJFpGYBBb4B37Txi53le6ncI0H6bh77Sk2QoDNZNMM+hmt1UakQaHxRncA2ef54P+V2ENub/Kl6AfShueVV04Mg0BuR+fJBPW5aN1NeWaY6mqKdjGcqxnJCI4rc5bb/X+io3FLFEBu4x724Zg+x4S9uTYwvVKTF2Nt35l+jzfXZLD2VHkeutg4JY6YB9NkWQW1eKEkKULZ5rXVsuENdZYgHDCsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmI/L+/Bb7NvkJtGZIb8uX2J/9CvlZ7KRP9GfbMUbrk=;
 b=CdDJGjWL3X/tcRkTM5PsV7/UWcXhbMAwil1JhzicJRha9QxUEaxprNC0PaPC+VZFs1gpyW29ZnSlji7BOfIPQ/zTJmLcin9Jdm4B9XiBNMl3FmP21c5n4C4+1VmDm787v0w52yZaJsqSKhBCR1q9LpXC8JbKWsfwRmk1uNUatpQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB3974.namprd11.prod.outlook.com (2603:10b6:a03:183::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Wed, 12 Aug
 2020 09:25:48 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::e91c:b2c9:b293:dab2%7]) with mapi id 15.20.3261.026; Wed, 12 Aug 2020
 09:25:48 +0000
Subject: Re: [OE-core] [RFC PATCH 2/3] tcmode-default: use go-binary-native by default
To: Ross Burton <ross@burtonini.com>, openembedded-core@lists.openembedded.org
References: <20200616170538.1049884-1-ross@burtonini.com>
 <20200616170538.1049884-2-ross@burtonini.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <1a012137-cde9-d770-8a67-aa5ca65b608a@windriver.com>
Date: Wed, 12 Aug 2020 17:30:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20200616170538.1049884-2-ross@burtonini.com>
X-ClientProxiedBy: HKAPR03CA0011.apcprd03.prod.outlook.com
 (2603:1096:203:c8::16) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR03CA0011.apcprd03.prod.outlook.com (2603:1096:203:c8::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3283.6 via Frontend Transport; Wed, 12 Aug 2020 09:25:47 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 24ddc851-45ec-4add-6120-08d83ea1b2b2
X-MS-TrafficTypeDiagnostic: BY5PR11MB3974:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB3974AC477F1BCC4B54921BF6ED420@BY5PR11MB3974.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:428;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ksm06hzix322+nSD6S3n6wndk6UA0Bw3MFxjjzepS07eiUhPKQhDdQej4OcfCmnCbWSFrIUZfkWg6VPFfvLDhE5TfGbp1SwXEq0KYiAXiLGKeu1VFQQErCqEtWbsE5YsakzfsbknhFxWNIU9emshZLM4y3rxx5SYZUJMuWJ+22OAnefnw9VE6O34ZDII4Uf4v0Pls97DTjrpyzXJYCq6X7SOlGQi3sb/RmZhp3wmnbfsP1vB8dfZTEnm+eyTacLFmWi2w+5KMnyD/8ACawx6jYrCSnzRs5vN8Ln6VuHZ+4bcbMPx0gx3AmrFI1SORpttwAJ30aA1UZhAUmFrySV9AGSI60JJBXQoHmEWXKPt7Rv23Kr+5dlf/XgEZgVHU3FWHJG42GTJDy7ZeGRdU5UwMOoMNnr2T3pd/yVbHt2AEiBxHzosy0b6kvWGJ1z9WEb8fWxGaGPaJI9OJ0KZpaBcDSVxZTdetwwDu0kvNmX/2no=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(346002)(396003)(376002)(136003)(366004)(16576012)(31696002)(316002)(66946007)(956004)(2616005)(6706004)(66556008)(8676002)(66476007)(2906002)(5660300002)(8936002)(6666004)(31686004)(6486002)(478600001)(36756003)(186003)(966005)(166002)(52116002)(83380400001)(26005)(53546011)(86362001)(33964004)(16526019)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	pDAlnYFFEAOEOsBXWv8Zr9CDBFqIbwNPBr0cQvMw4yevf4uTnHKBXn2Kq23axqUwKYSChGkyAI/UEhP9TPcv5JrCFeqpTwPmY30mBzQziL9c6LZq/NKQF9eVDRUfb3C7y79/MORVmUiZThCq3sz+EVYvu9MKTLIBMIDHOc51s2ywFvQK9owv4L7OYtihYhZRBWXPjydJt7ZSelmV/o7scEfa9frcUnhJOZHsGHaFo9NIMmcxodLQ9Dg1tjtkAGFV+Wlpe6GVfH+f83g7IoDmF1G7efSwpsopAwvLfpSW5B9y/j32hfssqmKl/TUou4BVfp6+X7/vXyhME0qEXCme4mHl6eTRWa9qrPKCBSzTiV6NCsWHBRZmyrt86I1zKWOo33UfYUal5k86tuJIWah5FO71qQOCgv3HBsaZbI7Ge6CqLGXdcCjSxoKiE+e+KiBV92IuzyseKPVtbtDtbsjnfQmhQKBsn9iMmc5kcGX8Bre7wZcpuiE9+4dXKZhjF0lnu6iabeonWCHGIWEET1K8KOyQthzH8Vj7JV5dAuUxHtvfWw8S5eeN+yw3Z61YLi/yuax9Bt6xcgobVGm2LPkvbvCNBx824GkHpLscEByvcKNeNnNUElzez8mK5OElSHmWrPxxhRBdYNs76WQsN3SBxA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ddc851-45ec-4add-6120-08d83ea1b2b2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2020 09:25:48.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDkC//yV4XQrxQo9b5yavVnkSr2iIn9YJm2f0o5yQ9YrycES96W8FTIgQTHj94Ybm4AZf3R64dlcPct92KJ/WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3974
Content-Type: multipart/alternative;
 boundary="------------7A09AA3156C85EDF238BE7BD"

--------------7A09AA3156C85EDF238BE7BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ross,

I've just tracked down to this patch about k8s build failure for arm.
I'm now setting the preferred provider to 'go-native' to avoid k8s build 
regression.

go-native contains patches like 
0001-allow-CC-and-CXX-to-have-multiple-words.patch.
These patches seem to make sense.

Do you have any idea how to deal with such situation?

Best Regards,
Chen Qi

On 06/17/2020 01:05 AM, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>
> go-binary-native is faster and more portable than go-native, so use it
> by default.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index ab4333144b..7103e10d3b 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
>   PREFERRED_VERSION_qemu-native ?= "${QEMUVERSION}"
>   PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
>   
> +# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
> +# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
> +# go-native.
> +PREFERRED_PROVIDER_go-native ?= "go-binary-native"
>   PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
>   PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= "${GOVERSION}"
>   PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
>
>
> 



--------------7A09AA3156C85EDF238BE7BD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Ross,<br>
      <br>
      I've just tracked down to this patch about k8s build failure for
      arm.<br>
      I'm now setting the preferred provider to 'go-native' to avoid k8s
      build regression.<br>
      <br>
      go-native contains patches like
      0001-allow-CC-and-CXX-to-have-multiple-words.patch.<br>
      These patches seem to make sense.<br>
      <br>
      Do you have any idea how to deal with such situation?<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 06/17/2020 01:05 AM, Ross Burton wrote:<br>
    </div>
    <blockquote cite="mid:20200616170538.1049884-2-ross@burtonini.com" type="cite">
      <pre wrap="">From: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>

go-binary-native is faster and more portable than go-native, so use it
by default.

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index ab4333144b..7103e10d3b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -66,6 +66,10 @@ PREFERRED_VERSION_qemu ?= &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_qemu-native ?= &quot;${QEMUVERSION}&quot;
 PREFERRED_VERSION_nativesdk-qemu ?= &quot;${QEMUVERSION}&quot;
 
+# Bootstrap Go using a binary release from golang.org.  If you want to bootstrap
+# from source using the C-implemented Go 1.4 (only supports x86-64 hosts) then use
+# go-native.
+PREFERRED_PROVIDER_go-native ?= &quot;go-binary-native&quot;
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= &quot;${GOVERSION}&quot;
 PREFERRED_VERSION_go-cross-${TUNE_PKGARCH} ?= &quot;${GOVERSION}&quot;
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= &quot;${GOVERSION}&quot;
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

--------------7A09AA3156C85EDF238BE7BD--
