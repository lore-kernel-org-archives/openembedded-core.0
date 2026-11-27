Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17122.1795791240359827332
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=EggW1GDc;
 spf=pass (domain: est.tech, ip: 52.101.65.3, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiYN19yFsKc7jl/pZ75+NYktXdzIld7vtqUeFrCU6hJctcdKEUBAD6Gzh1Xi9Zf/AZHua+FKcG0F7GHRUGGIP3i45VQIYwBI/AYIW8KtfULDqFZNw5PPepuQkHS/D+OGShuJUUutryr62DIcYzVhCrkBMIEBjz3aB01eRUiM8dhFET/U0em8qfGAUXyXOSEdahv/4eHP965zI7fx1a59YAVOFZl/h3aRUi25HOqmghJzsRoTyh+vhR8KYXV7X2XpYQRn9wkPa4W5eL4z9HAS5F3p4om1jLpbhe1n9ZPdDarrG2sM/yWJdEMtJwXzpViLzCSG8GupNGxW8yUPPMA/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cj4xnXV2M85GgBN8m6e08/fE4ipbHXxepKTjIlH864U=;
 b=sUTEP0L9dm7kCuv0leHyvlwy3yZMu+DgmIPo1qgD9lBuLtWL6Y3fmJP6RM1eZ5OLcgIVt6q+dhmF0v1Q+F2xFc6M/rulFKE7B3eRx14bY1cepAi6FgZFETTaDANNXzYF75yptJVgC1ZuJf+oTA7CMxbab7MxWu4zOhB5sneK7clFBUbn7dawizmMuGbNBve3TE/qCI5FTYln50TKjIgHw/xqGVDSilW+zgJBPnSYX4eJwF6/yFC2ns3NYdso1QnTE8P8vRs662w3Yz2W2xo+aNTT3NZ/qQ+POZbdrLuv6dN64bNpVjRjvUx3YgiYI6Gdom/8Zv4YauXDjI+I/kI8uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cj4xnXV2M85GgBN8m6e08/fE4ipbHXxepKTjIlH864U=;
 b=EggW1GDc+9evK9LMAsDCA1GFoGK7m0ZGsad5y80qGZq9mbGPXMkponGiq7Mf9WOcMqo2G3sej6WM3DOgygsIM82E6NTqYcaweMbX1e8wcaf/ii4VwwYCQqxtsI/b6Cb47D2trwz1EoGbezab9PdwihyVCoYWP3JTG+PooBmIXlM1mLVRTG62YfSbDOklMTB4RbIP3obfxxOZOkx78jOZUFc/5zSa9NEkO0F4S4wOQn1vk9wlXX9IJlnclkkSuV2cjHhVpeL9jcKJl/Aoc1VXlYzp6Jf8BpFAZ1IFRXlEWUyJiLsJPqZrsbohS5CKkl+HmhewuEsH6th6YfJZ/EkQjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS2P189MB2493.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:593::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 14:53:55 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:53:55 +0000
Content-Type: multipart/alternative;
 boundary="------------23V74sxcorXkxmB8ZTSl7SgR"
Message-ID: <f5d3260e-96c1-4c0b-a48a-2e98abec9aef@est.tech>
Date: Fri, 27 Nov 2026 15:53:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/7] libxfont2: upgrade 2.0.9 -> 2.0.10
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20261119141333.34492-1-jaipaul.cheernam@est.tech>
 <20261119141333.34492-3-jaipaul.cheernam@est.tech>
 <d91fd9d2818a3ccb016f034b62be3613c2bec7fc.camel@linuxfoundation.org>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <d91fd9d2818a3ccb016f034b62be3613c2bec7fc.camel@linuxfoundation.org>
X-ClientProxiedBy: DU2PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS2P189MB2493:EE_
X-MS-Office365-Filtering-Correlation-Id: 748f5d2f-085f-4637-ff59-08df4c964293
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|261009223027099003|22082099003|18002099003|13003099007|8096899003|5023799004|11063799006|10067099003|56012099006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: xSx6ayskWIz3JL18evtemEujvgGvXUa/GiREZzZLuEUjoocf4s1zC4SbE4SDaY3WVFfQpnhfqjbSvycA9p2mgvQA9cViOMqmP75Syzo+p+KrJHS4txEQ4hHKaTQtbYSVzmHwyuMbcSvdyWpqSJkq3pR+30gvdhT7u9bMwMQ/E2GpJ1tLc1IaZYp9yv+KFI4i+iLdoAE1MZZh+ma80VGjTVrOSpDUn6WrZHVgfyheUpWC5x/2hJtv5Frl8NOG/UlWntcTRwmw5n0FGaJAhgiqTcyM/SxIe/MoGtWjwAgRdKDQLm2rCEdEgE65Bwp7blb2o5OYwMK0DbCoeJ3XTXEkZO0FpgKNWOArYjs6dwx6uMQSoBNMWAqb5i8EX9Jpe6M4vTPenkHTEt0XvmM50DEdDx7Fe3zOoIFjnvQ59bBkcNyLx4hgGxnRprYsJ+zfHACYOaZMc7Us/iFqRhsQcYCASncHDu5lFNZyQ+gnvSVx5ykhS7Rl+QG+wMGdwvkyu2iHKgTMaCLUXOW8w04gPo65ly8z782gzckXMdla75X+Vk0GLOarKIX6vaktQaJ+MqAdf32GKoEjUtTd8qrtnSpWb62sdpvfNwIILahGVt13o+PHS3LLeDEhMowAO2/hVs1I
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(261009223027099003)(22082099003)(18002099003)(13003099007)(8096899003)(5023799004)(11063799006)(10067099003)(56012099006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFOZ0tZT0FEenlUSXVqUTNUaXBCWXNoSjZyVVo3ZE9Ua0JGRmxTQjRkbHZY?=
 =?utf-8?B?a2hubDN6M1BIdnZQR1RXeElBcVRWNklqT0NLL2pYalJqS25lT01ON3FkMHNx?=
 =?utf-8?B?NTRsQ0FmU083aEhScVB6V2RCMkZmaG1SUnpPZVl6SXJGMjQ1c0dkNkNtbGhX?=
 =?utf-8?B?dTRYRXlFQ2FOTVhxN21yUy82Q001SzUrcXZrZHZWVW0yVjh5RUpURnF1WUNS?=
 =?utf-8?B?VTRsRHdBaEF2aUo0N25iT09neEYwWEx4VldPVDlhZm5aTGM0YnV6bUg5SC9v?=
 =?utf-8?B?RTRveU1CT1ZWcDRVT3MwWUFtVUUvYnJDVDd0L1oxNGlqZWl4RG92cGlLQk5I?=
 =?utf-8?B?NnVTbVBpYURYVUplbmdQNXdTLytvenJmUklqdDhVSXZLbUlRZE5WTVlTNjd6?=
 =?utf-8?B?Mjd0N3pxNXg0NTZab2Z0cVAyWXJMNUZMUVpnUVdTaWRuQUVLR1d0Z3hxK2s5?=
 =?utf-8?B?b1lPaEJ1ZGw5YzU3QWRWakFCU0c5cGRBZ3JKcHpQQU5qTkt4aWp4Y3BNN3hX?=
 =?utf-8?B?dVd6RzNxbGc0LzZiYWtIRlUyaGRRenJzZ3JNL1FhTC85NDF3UTR1U1lHWStL?=
 =?utf-8?B?Qi9YVEhZQlY5YXl6NnVvb2ZRSzNjUG1DRHVYNDVMck00YWVZMnA3SmxXWXpq?=
 =?utf-8?B?N2NNcVFiOXhCbk9iOEQ5K1g1d2dlb1JCZlY5VHgrTWdOaTBmV2hGbUthemV2?=
 =?utf-8?B?d0NxRHNQc2R2SHJyc3phaUZwM1NmOTFJMXd6WjQwSkxRdGR0S1B5SUpXbXFS?=
 =?utf-8?B?YndNVmdBdWtiY1k1V1dTS2YxcWFPd3Fidm0zb0MrK0trS0RUZlBjNGl6M25M?=
 =?utf-8?B?c20wYk90RDF0RUxFcGJ5NmYwRXVUb1VIZXAwTGRFS3Y0alRyWUw2UjhxV2tp?=
 =?utf-8?B?Vk5aZmxMc2FqYjBKQTRIa0ZBTHBkQk0reW9kYkZTeGduM2tEdDlhazUzNXBM?=
 =?utf-8?B?TkgrSVUyaXkxbk9FZERzeWJUdmRRem8xaGFOMXhlZHFPamZkbWpXY0U2TFI4?=
 =?utf-8?B?U2hhUDM4YjFBdEVXK0llaHRENzJCOVlvejdHdUFUYW8vaWN4U2NZQmcrT0Nh?=
 =?utf-8?B?Zmhjbk85aUJPRGhrVGlXMUR5bW5STTFpQVNyRS9MTHpVUlJPckFzQVhWZUMr?=
 =?utf-8?B?WWRoVkhrQ1k3RDFQY0Z2QkNHUVZ1VjlDQnlMYTFUaTdoWHpCejYycTFxNE1X?=
 =?utf-8?B?TC81S1ZKTnZBNVJyM3llcUJZeWVGU28ybzRrN051QVpERkNDZm1pSi9PY3JZ?=
 =?utf-8?B?OHhFb0tzYTNxcmRZWjltRFhmNWdtbjlhZXRXdGhhSmM4ZlpGUGF0NE5ueHVS?=
 =?utf-8?B?eXFnU0RjN3ZkbGdYd0V2Qk56T09oRE1zWFRucWtGNkFNaTJtZ1JWLy9GeWhV?=
 =?utf-8?B?Yk5lblg4OXBqeUtFZ3hUS0RBNmpCM1RiTWVkVWR3TlBEUEVPY0YrTkdZTHNw?=
 =?utf-8?B?TnI5QzlLN0tsTGpENjBHalV3OTd1eEpCd2JKanZjUFdMSnJkTEY0YkVNTTU0?=
 =?utf-8?B?NC9DT2V0YThna20ycmFDOXBabnVtSG5VSy9haldlZlVnRVRMUEJ4Zy9uejNP?=
 =?utf-8?B?TDZrWDV2Y3l4c25vdnlqZlFJMjRtRlRVRVdRRE1hMWdnZmdhajR1RFBEZVo2?=
 =?utf-8?B?cXh4RWRtTUVNS0pFZkZJZVh6cmpBbmh3dm1XMmhQcS9vNkwvZTBMQmZoZGZY?=
 =?utf-8?B?eHkvdmczM2FDWDBaRHJYYzJvYWpzaE40SFdFNi9oa0NLTjNEODZwbVo4UEFm?=
 =?utf-8?B?d29sc1BmSnpkbzdIREJpYmhYZ3M5dFJneDJueXlLeEZPRGxleHllellCWmtj?=
 =?utf-8?B?ZGhTT08rK2QvT3dFT0hWL3A1WHgrMDhha2t5RkNmaUhFeVF3L2EzenNrMzQ1?=
 =?utf-8?B?eVBXYWtYRlJybkpUc1RUWisxcG1GcVJ3YWRucThSMyt4YlJCNFhpeEVXSFRQ?=
 =?utf-8?B?dDdnYVNBN0tCeVhneElqeEJ1a3pQNEpadHUxdzVRRFhZTTc1Z1dOeHMrMHhh?=
 =?utf-8?B?VXBhMUkrSFYzaVNPcENwYzlaTTJ2bVFjZEVuYzFYb3ZiSEljNTBzVkFzMDE4?=
 =?utf-8?B?MncvM3NqdW1sZzJDdHY5M1N4Rm0xekVEMWVUbWNYeWk5YlZRNFJrMUpHZi8v?=
 =?utf-8?B?RGFPcHdtVlBwdDhNWmh6dGJraEZUcytKS1dweXJ5a0RoSmRUTmJtbjZ0aUpG?=
 =?utf-8?B?QW9ocVBWdE5yYS9CK0ZjOW5GTFRrckZxYU1mSFFoM3RKclFkQTl3Vmo5RnFY?=
 =?utf-8?B?T0pRUkowb2FNeTJaTkR0Q3FQOVhvQnRqa1NvZnpPSGFZMzBsS3RPWUNNWFpS?=
 =?utf-8?B?VStwWmNPL2o1R3hMTXlibEdRRlZVUHhmWEdBUVBiV3pCZjRUQ0tTeXhQcHBR?=
 =?utf-8?Q?N5VSToatQl0MILls=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 748f5d2f-085f-4637-ff59-08df4c964293
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:53:55.7128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf64uFx8CwsD4sYWEIThadGw++D+quhX9Y5R8JhcubUiN/4ATb0I3eN2bR+edYptHKzYcMO+CHR6osoRp1tGrp/KNArhktJ9RnSdc9BcYy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2493
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251397

--------------23V74sxcorXkxmB8ZTSl7SgR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-11-23 12:03, Richard Purdie wrote:
> Doesn't that mean we're missing XFree86-1.1 from the license list? At
> the very least it needs to be explained why we don't need that...

Hi Richard,

I don't think XFree86-1.1 applies here. Upstream only completed the 
|gunzip.c|block in COPYING [1],

and that text is now identical to the XFree86 License at 
https://www.xfree86.org/4.3.0/LICENSE2.html 
<https://www.xfree86.org/4.3.0/LICENSE2.html>.

The same text, with the years 1994-2005, is labelled "XFree86 License 
(version 1.0)" in

XFree86 5.11: https://www.xfree86.org/current/LICENSE5.html 
<https://www.xfree86.org/current/LICENSE5.html>.

XFree86-1.1 is a different license text. It adds an acknowledgment 
clause and has a different disclaimer,

neither of which appears in the libxfont block.

Since SPDX doesn't have an identifier for version 1.0,

and the text only differs from SPDX X11 in the licensor name,

I think it's best to leave LICENSE as is and clarify this in the v2 
commit message.

Other alternative is to add X11 instead which is close match.

[1] https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/37 
<https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/37>


Regards,

Jaipaul

--------------23V74sxcorXkxmB8ZTSl7SgR
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-11-23 12:03, Richard Purdie
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d91fd9d2818a3ccb016f034b62be3613c2bec7fc.camel@linuxfoundation.org">
      <pre class="moz-quote-pre" wrap="">Doesn't that mean we're missing XFree86-1.1 from the license list? At
the very least it needs to be explained why we don't need that...</pre>
    </blockquote>
    <p>Hi Richard,&nbsp;</p>
    <p><span>I don't think XFree86-1.1 applies here. Upstream only
        completed the </span><code><span>gunzip.c</span></code><span>
        block in COPYING [1],&nbsp;</span></p>
    <p><span>and that text is now identical to the XFree86 License at </span><a href="https://www.xfree86.org/4.3.0/LICENSE2.html"><span>https://www.xfree86.org/4.3.0/LICENSE2.html</span></a><span>.</span></p>
    <p><span>The same text, with the years 1994-2005, is labelled
        &quot;XFree86 License (version 1.0)&quot; in&nbsp;</span></p>
    <p><span>XFree86 5.11: </span><a href="https://www.xfree86.org/current/LICENSE5.html"><span>https://www.xfree86.org/current/LICENSE5.html</span></a><span>.</span></p>
    <p><span>XFree86-1.1 is a different license text. It adds an
        acknowledgment clause and has a different disclaimer,&nbsp;</span></p>
    <p><span>neither of which appears in the libxfont block.</span></p>
    <p><span>Since SPDX doesn't have an identifier for version 1.0,&nbsp;</span></p>
    <p><span>and the text only differs from SPDX X11 in the licensor
        name,&nbsp;</span></p>
    <p><span>I think it's best to leave LICENSE as is and clarify this
        in the v2 commit message.</span></p>
    <p><span>Other alternative is to add X11 instead which is close
        match.&nbsp;</span></p>
    <p><span>[1] </span><a href="https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/37"><span>https://gitlab.freedesktop.org/xorg/lib/libxfont/-/merge_requests/37</span></a></p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Jaipaul</p>
  </body>
</html>

--------------23V74sxcorXkxmB8ZTSl7SgR--
