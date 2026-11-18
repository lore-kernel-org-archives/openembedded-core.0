Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5.1795017824429885252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=Y7l8CQuK;
 spf=pass (domain: est.tech, ip: 52.101.65.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f/9rRtXJS+PVCmKEF6MaXWMN+rjQlA2VZIWWI6XTFQbS9U3BHdId6dGUaf2zBI9OXGXmE1935KtlJ6gDPZgLwjufDaGyfJGCrefjF7k5JgRRSO3RCyaMQIJcUZlWI7W5Q2Uil/RNLVfVL7CrrtPB9IIEgiuZ37Hn6ZJfl3vJzdMBeXrGJrv8g4ueYW4lWo4+q3XvL3xZkTDluRyfWrzozFX2zzlcSKxDKUPorLuxyhmwzEPvbtcXh3B3oO1zi33pB2TOFDC/TL17wz3ftEQgn0EjFk744kMB288Ltfy2syiI+CnxpzuFauYpYjw4bwksI6W7Y8YzOqDIsEwdRBDG/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZhWIYlD/5xLaq9WI423lDbVFd3IBr6ltecrVn24ZpU=;
 b=yJq4OWRm5csYmIqIlC3TBHwsmkfUe+kf7ISwxWgSX1eGbH3Nd7wZduLDCsTopifwuarQESVccvKCmiPBQYwM93xWNYYqKAGY4ae7GjAh+/zMOQkiK3buBq31eOJCaC05Bi9mCMTiFE52y6ATUBBC8NITNHmQRYdmexyziWSi9cXN49KlYft2wRl2y4/AGb3aDrl0wY4zXwh8J7jyBmbmCtdLqfx5qIsNnabSKHq8sl1bU44QRkpz34J4/s6xQ/JOQCdSupRwD42j4zJb0Z3E8VvIMJzenMrFDBXxxTJJbrobLofnV0o+mNAq5afmjzDed8eM3iAEvJvM0rWW7Hfknw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZhWIYlD/5xLaq9WI423lDbVFd3IBr6ltecrVn24ZpU=;
 b=Y7l8CQuKy8zrPO3Zig/WObGLmKzUEV097cIgkeOPZLSvifmwB3SIzWUiKS40EspW4hWlAOyKJfK56ktDsTmidCmRxU4WZXAalKecNf5cGUyxY4N+RXpXHMH23i72hAI5YLAryS6qA+VlDty9XzNcddzNuNzRL64KEV+79y3ZDkCYcIr0F0U+c/xRT3clVzgpXIuYtXoQKY4UAOReZnX/fR8ElDVdxHl61TJz+G/hKetZJlDpA95eZd/5ixqGYxXrGr44Der/TSnIqqXh0AhH6LOIuLSfiFLElajgqgJ2dq4SmLEv5ljhZmmqBRCYU755O8auxTXNE6UiHyojy713iQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA1P189MB3389.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4fc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 16:03:40 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:03:40 +0000
Content-Type: multipart/alternative;
 boundary="------------4R0MJC550FreB0yBeTzgp6IC"
Message-ID: <6ecad917-f112-4a2f-8edf-ea48afe902b4@est.tech>
Date: Wed, 18 Nov 2026 17:03:38 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/3] gstreamer1.0-plugins-rs recipe fixes and
 upgrade
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20261118063416.18496-1-jaipaul.cheernam@est.tech>
 <DMYGEG68G3D5.1V4ZHX7E9QGS7@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DMYGEG68G3D5.1V4ZHX7E9QGS7@bootlin.com>
X-ClientProxiedBy: LO4P123CA0501.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA1P189MB3389:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faf2839-bc03-43f6-e3fc-08df458d82e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|261009223027099003|3023799007|8096899003|13003099007|56012099006|11063799006|10067099003|261026140227099003|4143699003|261102123227099003|261026121527099003|261022075727099003|261022115727099003|261028144727099003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: hGbPDwF7URbE3JxzUsZhSjtKEljDt7kULYRDkT8IrPseYqyW54BqL+O3qRLmaudioIT7lFXU5puZyYxelYrEeriWYwPuiKWrAxeXmnsmaTT2ulx4etBlnMkqB7AaYA8rBnXAKimiMhzm6nYEj3g5TOaJe/IKY/Vu8hEcpaiu4fgjhzgBpg3rJidmf6mTcLyw0zlPaYSBNUzJDK9Jz4PhBthmdJvAYaaRxxWUYix2q3Y94wK/HHriXIndYEfpDmWDEXI2vgyrksptDdDrPMSVBTjMLL+gEYWSPw5CTvK0mIuZs5yAteqrMgmg0nQeWXWvhBfoZU12Lw7dXw9tsJKvB21eWN00FRMznVRLKMQXu4YK4+vQllNt3e+GadHm4cMKcp+eQNx2R/hleBxAn3Bigw+aCgzCGkflLKoWR9ASz+FmE2igQ8c2Hf2m4cS2WzDFj+eV9xJ4CugVVN7ffzfDMkZib2nMY0o315n6dka+o5cIYo1t2q4dumt3zypbV3AjTYa0WUHJCpVxuZgDLvWk+Ean4XiadxJPPX53dDakqsUSESNbpllUagkHxR4PFDI1PPm5/aWNpTqxDQf31rZrs9Ua1UONCD++XFbH4GrNIh6Jn2XDRMkfW4kLnnSTm67W
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(261009223027099003)(3023799007)(8096899003)(13003099007)(56012099006)(11063799006)(10067099003)(261026140227099003)(4143699003)(261102123227099003)(261026121527099003)(261022075727099003)(261022115727099003)(261028144727099003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJENzJmTUE5ako0cUVEbVVWZ3J6cE1GNlQ4aFNTT3hIZkFwSkJnTm43akZM?=
 =?utf-8?B?d0ZmVTNzVjQySXJWeHFXMnFSc3BQMXYxY2V3aDIwUHFhMFQyYjBZa0toZ2JC?=
 =?utf-8?B?OFdtMWw0SXhNbFpnZkxxSE1JSE1mcEJ4Yi9jNFpNTkw4NHkxZ2t0cDBuR095?=
 =?utf-8?B?Y1lYZG5mRHdoT0xCQ0QyTHcxeEZtZXVnRUVoU1NIanVXZHI1TWQ3WE1jQm9x?=
 =?utf-8?B?Zm1MQ0lqZERoNUkyZHJrNi9nNlEySE9HSXJ1NW1yYlVyS2ZBNDJLSG5sN24y?=
 =?utf-8?B?Mmh5cUs4dUpmcm5sRkJweW8wRzhUTEpabU5PZDNwSDR1V0xwRFhVK1VkU203?=
 =?utf-8?B?K003bkNXaStVbURvM0J5STBRY0k3M2hVTi9FVzZZWGVaTnlUcEN6MUdpN0lM?=
 =?utf-8?B?ZkNId0o2TzV0U25XcTROVGQreFczVkIyMFB3eEpITnRwOENzKzlYWjlFdWY2?=
 =?utf-8?B?UUVLRVF2OEladC81dDZtUDhNVjdidDhWTUFQMHhVOHU4RVpCRkJEa1BvNzVE?=
 =?utf-8?B?TDd5TGQvVURoSzNuUnk1OUw1MW1yK09DQU5GWG1JME9sV3hEeDJjY3JrdGYv?=
 =?utf-8?B?cnlhbllnRGZiTlJYYXVGTVBDOFhaNWUzU2xmMm8rZmk2dXE0TFhjSTJsTHlw?=
 =?utf-8?B?UW9sOCsrYjRhaXdub0tmb3JjNjI5a3NXYmcvYVVydlpmdjFIWjI3Z1V6a3Zr?=
 =?utf-8?B?T2JQMTY4L0p0MmJjakdKTDN2bERxOU81azErVGpyTDVXM1M3V29iMVNyd2Z2?=
 =?utf-8?B?bkFGcnRLRGQwa2Jzbk02NW5SYlB6amFRZmdUR0pCL1RMeE1nRGE4Mm4vN3l6?=
 =?utf-8?B?MStNNlREUngwZG1GUzN5S0I1NGNXZ1ZpREh3QzB3cXlMWitPRnVubmt0YzRi?=
 =?utf-8?B?OHRNQ2xyK1A5MHdkNE9lNk1oRlRiTWwzeEJ1NlBudGxDWDJ0a3hjWSszREps?=
 =?utf-8?B?cE1TeE0xdjA2cmFubHRIdkplWDM3SXh5OC80UGhSYjZNN05wNWNFeThYZ3ZV?=
 =?utf-8?B?Y0pQdWFsS1NQcDFzaUlxYjZTM3dDTTdCaFovMFBoSmJiQzJPbkJFUXJpVFpu?=
 =?utf-8?B?bmlUMDlTcVJ5N0xLRlV1UUdwc3Q2LzN6bWg5SmFtb3cvbDBDZTVBbDQrcEFX?=
 =?utf-8?B?cHUzelBvekdXTkF1M0tTaDk5Zzc1bmZZOElCaVdlWTB6eDlJWUJJZ0M2T0xF?=
 =?utf-8?B?d2NUdnlCK2hSdkhLdjBGT05BR3IreHJtaC94T3paODk3TllqSEJxbnZvRmtX?=
 =?utf-8?B?dXRHc3IxeTcrbGtSQ3FuaDlQNHZ0K3JuRSsvYmVXLzE0a1F2WjBER3NBQytD?=
 =?utf-8?B?THBUa0ZSVXcveTlhNWNlbUtUSTk0dFNEQW1MOXZKV29WWmwxeTZFNmc2Qkw1?=
 =?utf-8?B?VTNMbk1vdXZ2MmsxbTlqelJobUF5Z0M1MGNwMmcxeDcyLzNVaUxWUkJQc0Iw?=
 =?utf-8?B?NmhZekdpOXRyM21FQ3NibytmRFZWUVhkVXVyaFBlc3pDeHJ5elZZU29uaG4y?=
 =?utf-8?B?SHNKYzJSZDQrMnZKaVVRVnE0Q0QrYnVzcURFZVhWcHBqSHpiU1BXRWREbUR2?=
 =?utf-8?B?blB1Wnh4Mk5LMEN6RThseVNkM21hRkRRUFFDYmRoeHZ3cVNVdmhBTG01c3RS?=
 =?utf-8?B?OHFoWm1nWWQ3T2pUOUVSeEtCMVBIRkdOcVV1eEhlODRnRjRRYTc3Z0dGTUhu?=
 =?utf-8?B?QWtORTlTam9TS05ITXdjZWQ5WENJbXp4ZXFvdjdMZ0I4M2MzVGtuSVFlWFla?=
 =?utf-8?B?cG5aNWxWK2NIdWFYSkxCVlIyOHVYVk8yaWxRV2k3VkZMZ1hIeUpLelFwWUFZ?=
 =?utf-8?B?RFNRV3VZbmw0T1NmaXM4dFFtS2plQzJQdWE4VkVWbTB4T0hOVDZLc1p1YkFW?=
 =?utf-8?B?SStIbDh0a0xaMUY0YlhOQUFRam5ETGZ6aFRUaHQ5WkgvZFlWR1ZKUlh0QUNa?=
 =?utf-8?B?T3l4Wlk3REplaHNVTG5Ga3Z1VUwweVNhUTExMFZrTXhBNUZkcC9Iajh5RzRL?=
 =?utf-8?B?MjlydWxQNUhKZFhlSWZzUTBCMHppSWtudWphMGFDNUJtSzlKYkRoUnNDUmhz?=
 =?utf-8?B?TU1PWmpSd1lDb0VNY0lqTnkxdXBGTFRrYlJZcFJ4T0J5QWlPTWduWTRuZ05J?=
 =?utf-8?B?UldwalNTY2g3NjB0ZTVDNUZUM0EvRWc1S3A5TlZsUnhVTHRwK3VVZGhsZUph?=
 =?utf-8?B?eDBBdWdEVlVUOGlTVFpXYlNzMDJ6cEhiYXVkZ25MYzNnWDJXUVhLMGVpWlk3?=
 =?utf-8?B?enpHZnFUblJqblZmREdMY1BNSVRITkhXTjYxL2xwVkI5RThoTWVVVHBTZ0FS?=
 =?utf-8?B?UWpEWk5JcFVGV2JiM3BmT2poQUVnczRSeTdwWUxUejVnaVlNNUFzdz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faf2839-bc03-43f6-e3fc-08df458d82e6
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:03:39.9775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HNYhMEw5FgZWtgvVoTygET+TIllJn0zP6Wx/X9o9TUeSNz2W8RDvFZS1WBKu1hMv9koHmDCGwJ2ZXPQzrpegxxp2HOm6sF59pZZMGa9G5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3389
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:03:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250568

--------------4R0MJC550FreB0yBeTzgp6IC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-11-18 16:49, Mathieu Dubois-Briand wrote:
> ERROR: gstreamer1.0-plugins-rs-0.15.4-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_configure.354772' failed with exit code 2
> ...
> | sed: can't read /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/sources/gstreamer1.0-plugins-rs-0.15.4//gstreamer1.0-plugins-rs-0.15.4/Cargo.toml: No such file or directory
> | WARNING: exit code 2 from a shell command.
> NOTE: recipe gstreamer1.0-plugins-rs-0.15.4-r0: task do_configure: Failed
> ERROR: Task (/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.4.bb:do_configure) failed with exit code '1'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5065
>
> Can you have a look at the issue?

Hi Mathieu,


I think I know the reason, its due to second patch in this series where 
drop S override is implemented.

I will send v2 for this.


Intresting that my local build didn't detect it as I did built 
core-image-satso


Regards,

Jaipaul

--------------4R0MJC550FreB0yBeTzgp6IC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-11-18 16:49, Mathieu
      Dubois-Briand wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DMYGEG68G3D5.1V4ZHX7E9QGS7@bootlin.com">
      <pre class="moz-quote-pre" wrap="">ERROR: gstreamer1.0-plugins-rs-0.15.4-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/temp/run.do_configure.354772' failed with exit code 2
...
| sed: can't read /srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-plugins-rs/0.15.4/sources/gstreamer1.0-plugins-rs-0.15.4//gstreamer1.0-plugins-rs-0.15.4/Cargo.toml: No such file or directory
| WARNING: exit code 2 from a shell command.
NOTE: recipe gstreamer1.0-plugins-rs-0.15.4-r0: task do_configure: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/qemux86-world/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.4.bb:do_configure) failed with exit code '1'

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5065" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/5065</a>

Can you have a look at the issue?</pre>
    </blockquote>
    <p>Hi Mathieu,&nbsp;</p>
    <p><br>
    </p>
    <p>I think I know the reason, its due to second patch in this series
      where&nbsp;<span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;">drop
        S override is implemented.&nbsp;</span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;">I
        will send v2 for this.&nbsp;</span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;"><br>
      </span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;">Intresting
        that my local build didn't detect it as I did built
        core-image-satso</span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;"><br>
      </span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;">Regards,</span></p>
    <p><span style="caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Aptos; font-size: 14.666667px; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration: none; display: inline !important; float: none;">Jaipaul</span></p>
  </body>
</html>

--------------4R0MJC550FreB0yBeTzgp6IC--
