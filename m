Return-Path: <sandeep.gundlupet-raju@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540E5C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 23:02:42 +0000 (UTC)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.79])
 by mx.groups.io with SMTP id smtpd.web11.9408.1677798158438077129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 15:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amd.com header.s=selector1 header.b=o9qzW31i;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.237.79, mailfrom: sandeep.gundlupet-raju@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7C5QYW8V8+qugTYFWc6wHGKQ47ak2bGS/tb/gucVaS4aNs3Hq4akCYhF705R/vIowp7XVjsa0BGzYCRkLKVVDD1efv+TyeniEnKqMfud+864nKpNEYvyHJXv+MOajsI69uAdCFT3+uFXOzpJ0mmxA+bBMs7tUck9q36oIvZsPH19qmwMcHnhFjA86FRnZiq7qQmawUpy6ofkGVfd85KySGPeKz1NqwY5SXoahSqrMqbMsiJc8D1uNi3bjzigZLnI2XXN+pUAai5xIV113j9iVm4lyfTOTCnS6vWMocIEdeJY0uzODOQUB/yihPp0UsGXjOSoD9m92ySpjiW0SZSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMCoQ4Jbbi/y/I2wFaDQUaLOqudE8UME3V9RQSfQIUs=;
 b=F48eMzW1fRavmxHjH1scyZ5bviyZnjNsRZ6UPNuL0KHV4MzmHAVFxoYREuPgt+LR9iInCouUBoRSVRip1jVWvOBvrpS6/FC1cPBAziHRgwrxhI5H2sKnUnq5lT6C1u2/XuuAdWq+NLDZrLqPiemKjYUr91ff9OsNpn71Txi+raA3fQA9EHnUgAv2k9pGIA7mNkhJLPEUYaHbmjuESf3TRNUluBj42QOc2sf+GeTVoVMqi01/T1SwV24oa9Hq3sK2uJ4sAP+0lViO644Nwg1yiL7GJVJyvUe7GO5dtxhTTXd6mUaHCzzGkQ1O8NFHGfBeUe+V56i15ztddnxx396l2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMCoQ4Jbbi/y/I2wFaDQUaLOqudE8UME3V9RQSfQIUs=;
 b=o9qzW31i3L2n+cHC+Xvr5ymONrPOSShFZUUkBaJtd/PjnrogNLq/qg/MlmV8x1VOnm55uu5kOQUZ9/0QN7WDy4FtkPikhq8AbBUiow3zyfuP7SKXFLnTufzBcjU9RBaMfpm+i42FZRjKhbQTLeWlDvfWEj6hc7UyzVqM6BxOG/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 23:02:35 +0000
Received: from SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9190:fa00:9701:2f99]) by SA0PR12MB4367.namprd12.prod.outlook.com
 ([fe80::9190:fa00:9701:2f99%4]) with mapi id 15.20.6156.018; Thu, 2 Mar 2023
 23:02:35 +0000
Content-Type: multipart/alternative;
 boundary="------------dqnL4Yeaa1j0gYajS6qN0pxW"
Message-ID: <61a12c5f-a914-ddca-22f2-e29fc4e3694d@amd.com>
Date: Thu, 2 Mar 2023 16:02:31 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [OE-core] [PATCH] vim: add missing pkgconfig inherit
Content-Language: en-US
To: "ross.burton@arm.com" <ross.burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "nd@arm.com" <nd@arm.com>
References: <20230302161055.2322671-1-ross.burton@arm.com>
From: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
In-Reply-To: <20230302161055.2322671-1-ross.burton@arm.com>
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To SA0PR12MB4367.namprd12.prod.outlook.com
 (2603:10b6:806:94::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4367:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 84cdf3af-12c1-4765-2838-08db1b723639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T/4dLadI3qUSXVhBOAGU0f3b9RY/H5apLIiCXHhdR8ireW3jvLytEDriYyZaZQVSC1sU11g7/p0R952rwQDChpm5lR3/k4epN1K2YIsnHMhhJBO+KiTe0SZOn1zjh+UcEt5BhUJQ2XiGTEvgjdVEH+LlXWJtuq5ZXLSeSBD6jaTsR2RZjlxwP/Z/mpBU0lZTNOr47yvBD7gOCMp4ieRk1Rk6HCgqee+bXuZd7RcYAxe2hKWwlPOpfLwMnr5hlTkbCrL/WOqILhNucmOxIMIP5EGa/Wlyb/mJMYjkTQ5xAX/ooFjSfUs1479qI5tDyJI0cVnOBzh5FXaKK9ud/V5H8dxFxpPZ63dz6Ra76oswCpa+2B3QpehRzngf6QIsaSoBd8QfAOGpvQLkEEsswkHX8i0D0Bv3W9AvqQmvTfHkSYaIv7vhO2SLthdaOh4QDmFtnLFM8bEsjH9VcNP5o8bb3A14Kv1JThCa3paT6KCuHMVNffIYIVTpEDTgbSbKv7p0jCtBAMkGjqW7GztPtMMi/VbVES3fcEv14gdVbWC37FBBk0CYK0K4o0ylTQmgzPEKaGXoctYp5clTT0Pu5Iy97jsrMQv4Ms8/c/DEbf4OhOM4H/mGrsIGStGGruuBq/lgjIX+Uzeiq5T2uwnGZp++hnLqKr/A9mfPCaca2doSHu2O1IeJKGOgCxdRj2UafTh3VObLo/tz7upcD7CLXI2yZjM8a+SckM/mdpyctbafhew=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4367.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199018)(31686004)(36756003)(41300700001)(2616005)(8936002)(6512007)(66556008)(33964004)(66476007)(66946007)(186003)(4326008)(53546011)(31696002)(86362001)(8676002)(6486002)(2906002)(83380400001)(316002)(6506007)(26005)(6666004)(5660300002)(110136005)(478600001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WlA0K2pHRnJPSVIrZWNucWFYVVRZWUJNN1RQZFZFSTNQWDdUNC8xNUoyOElZ?=
 =?utf-8?B?dTdRNjErcFlSaHpDWFVRNVRHNWNyTVp0d0ZRVXRUL2JIQkJvUHdHbnpOa3hD?=
 =?utf-8?B?Q20rMWFrTVRVQ25tTUZUSUo0SElRdHdCY0luS2JNVThhcWJBSkVBbUJkRFhG?=
 =?utf-8?B?bDE2SXpnc1BiblRpRFRYVG00MkZqZ1VSYllyd0ZFWjBKRWJrQ3NRUE10OXJm?=
 =?utf-8?B?UDg0NFFNcWltWlRvV0kvaStGNzJNNkpZM281RXdmZnA0bDdLME9JMGRGQnV4?=
 =?utf-8?B?YzF6ZVI3YjZuNy9FcmRza1hrcHI5UHZUOEFZMllwYit1MGdETTVWRGtHMHFG?=
 =?utf-8?B?QWNwMXhCa25RZ2trY2ZFMXRQYmd6S25MUjF6YjhKc3V0akhUcUJXUHJaMWRi?=
 =?utf-8?B?U3RxYzJDZ28xdGt0ang1VEhvZmdZREZlQVY2MlNPZEtuUm5yNDNCUDdubDJ2?=
 =?utf-8?B?VlZ0ajMrbjNYVEdmL0dycjhaKzZPcGxBampVUVN1cmF0Y2xzcU1IWnU5RzhI?=
 =?utf-8?B?TUQvNEc3Yko0RFo4ejhLT1F4dWxpSTdBSjE0RXBrUXRGbDU5TFJybnNERG1z?=
 =?utf-8?B?WUpvRHNIRExTT0R0V1JjUDV5SFpUbDZHMGliVlo2OGo2bWJHRlU0UW9zVTZl?=
 =?utf-8?B?S1RyUzl3bndVREhRMXVZY01ZeEdoTzZZdXMzR1UzRXU1d2Q1ZTgwT3kxcVRW?=
 =?utf-8?B?OVpZN2JVaXQrUDc1eGtLK3BTNFdyMnlUb3NZZnI3akJySFpqTHI2bklnQ28x?=
 =?utf-8?B?Z1p0QndWWmJNTEJDOUhqNnpuZUpNSmttU3ZZWFpWMXYwR1NQVnBUNVlCSEdM?=
 =?utf-8?B?MVFqenVJaG1JcXpoMU50amNlMXhURjB2WW9qMUxXL3MwbzRYNGUyUVdYMEFq?=
 =?utf-8?B?VG8yUTNObmNHb1VLMnFmVldzTGpObkNkQld6a09hbTB0bFA1RGNjeFJXZGt0?=
 =?utf-8?B?UnVQNzdCUVRBVTRxbFRSN0pMRWd0ek9mdWZ0NkRSNVR3anUraEFTdmEvaXhN?=
 =?utf-8?B?Z2JGS0tRN0FFc2ZObnpZdC9mMUJ5N2daTlExMkVTbnlSYXFEdUVycDRWMHV1?=
 =?utf-8?B?Rm1COWorTzdqV1lYL3RwajNDQkMwRE5KTVc2K2Ywc0tuckF3TU8rOFF2b2pP?=
 =?utf-8?B?OVNFbVIwUEpUc1JadUJGTTdiSElJMk5qT0RMbUFZalgwbFMxYkVPZ2Q5cmcw?=
 =?utf-8?B?RVNmeGFac3lSR2ZJeUQvVXpaOGxPalIvcTZpOEQvbVFLd2RGS1pvU29IQnM5?=
 =?utf-8?B?WCt0S3prRzlEZlNGTEZCbU4vdXRlZGwvM1hoZkZpQmNlSmZHbXdMUU1DdStO?=
 =?utf-8?B?RHJpbGdLdmluWUNGZTY4N21KK2FTTmlTZnozZW9EZ1kvZ2hvM3FhaWhMa0J6?=
 =?utf-8?B?VWs5SjdDS080TnBuRVZvaGV2cDI0MXc1ck9XdGFiRFkrbUx1RGphODBBMGxE?=
 =?utf-8?B?Wi9sVEFsaldqYnp2U0VFbXB0RjdLYTNxaEFVYmtSVjVueS9WVUMvc1Zmam90?=
 =?utf-8?B?eUVtTzZVT3NmTW9WbXl2RkFCR1FKM2lieFJLR3pDb0lyVzhDSCswc01BQnMv?=
 =?utf-8?B?akRtTWpjWEhWaW00UnVFaDZoVU1VQ01vWWtoRTNlNkxYK0d3Y0JKNWs2R3p3?=
 =?utf-8?B?Mys2RjdSeGpIV0pSUzZ5VCtwdTRxNEFINUx1UVJiV2NDdXVGa2ZsM1djUHlu?=
 =?utf-8?B?eE1GdlhNUE9wUE1nY3hTRmFnRCtYQ1drRXpZUU0rZjVKTm9ldzBYSFRjY08y?=
 =?utf-8?B?dVczR1dRbUxsdVJqL0pyQmNuRTRXdDJpcGYxRWJudWdNTGxTc3VmRFhYTlNq?=
 =?utf-8?B?MitGZm5nUHdjMTdOY1djWHBEYzQ0UXpreDU5NFZGN0RiczNkZU9rSEhkc0Fh?=
 =?utf-8?B?ODZiNEphRzFuT0lDdnVwV0t3QzJsZGRPTzZ2Z2JKcERrQXFMazlDYjAwSnI4?=
 =?utf-8?B?dk1OeXBCbHNwcTAwaGYvVkFhNnVRTFE5VExpc2tnM2ZaNVBma1hqMGdHVFRU?=
 =?utf-8?B?VWdNNytmWEhudDYyeFJLYzhJeUx4Z0NtOEREeVZUSXFGeml5c2tyMTlTbDRW?=
 =?utf-8?B?WWEwZlo5V0l2aHRuK2ZIQnc4K0t5RGRocjFYOVVQREw5Ynd6eWVXYnU2MjVM?=
 =?utf-8?Q?6lJbD2T1bGRs7tfJhPzIszOtM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84cdf3af-12c1-4765-2838-08db1b723639
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4367.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 23:02:35.7850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8lcs0QTwR2Id5RmCQPptvJ1hUxrMR1NgPvgZTHvf0i7gp44ZnQ+Y19B8sgOOMNOaO+C5YOVguN/8I5S7TqnPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 23:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177971

--------------dqnL4Yeaa1j0gYajS6qN0pxW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by:|Sandeep Gundlupet Raju <sandeep.gundlupet-raju@amd.com>|

On 3/2/2023 9:10 AM, Ross Burton via lists.openembedded.org wrote:
> Vim uses pkgconfig to find dependencies but it wasn't present, so it
> silently doesn't enable features like GTK+ UI.
>
> [ YOCTO #15044 ]
>
> Signed-off-by: Ross Burton<ross.burton@arm.com>
> ---
>   meta/recipes-support/vim/vim.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index fcb5cf6334c..da586a56991 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -33,7 +33,7 @@ S = "${WORKDIR}/git"
>   
>   VIMDIR ="vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}"
>   
> -inherit autotools-brokensep update-alternatives mime-xdg
> +inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
>   
>   CLEANBROKEN = "1"
>   
--------------dqnL4Yeaa1j0gYajS6qN0pxW
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Tested-by:<code style="padding: 0px; tab-size: 8;" class="hljs
        diff language-diff"> Sandeep Gundlupet Raju
        <a class="moz-txt-link-rfc2396E" href="mailto:sandeep.gundlupet-raju@amd.com">&lt;sandeep.gundlupet-raju@amd.com&gt;</a></code></p>
    <div class="moz-cite-prefix">On 3/2/2023 9:10 AM, Ross Burton via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230302161055.2322671-1-ross.burton@arm.com">
      <pre class="moz-quote-pre" wrap="">Vim uses pkgconfig to find dependencies but it wasn't present, so it
silently doesn't enable features like GTK+ UI.

[ YOCTO #15044 ]

Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross.burton@arm.com">&lt;ross.burton@arm.com&gt;</a>
---
 meta/recipes-support/vim/vim.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index fcb5cf6334c..da586a56991 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -33,7 +33,7 @@ S = &quot;${WORKDIR}/git&quot;
 
 VIMDIR = <a class="moz-txt-link-rfc2396E" href="mailto:vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}">&quot;vim${@d.getVar('PV').split('.')[0]}${@d.getVar('PV').split('.')[1]}&quot;</a>
 
-inherit autotools-brokensep update-alternatives mime-xdg
+inherit autotools-brokensep update-alternatives mime-xdg pkgconfig
 
 CLEANBROKEN = &quot;1&quot;
 
</pre>
    </blockquote>
  </body>
</html>

--------------dqnL4Yeaa1j0gYajS6qN0pxW--

