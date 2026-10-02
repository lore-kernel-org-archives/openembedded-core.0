Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CABDCA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 08:22:20 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6638.1790929337934930551
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 01:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=ITu53F+H;
 spf=pass (domain: est.tech, ip: 52.101.72.13, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RoIJA/IS1tQKe4kGkUxDwuX99eaV8YqkjU7VCqdfthttHbbmpP2AAMWZH78vIzpDt4kCwOiR4ee7HKykBgCAredJG9CLapMazJNOUwj5OMn0UjMHveUrM5iFCzLrAmVwxe6yIwjLz8gOQ/SVhRCwtDBapcWqdX/Y1huTVxWTd8GNJL++izQ6tlQS/2FNul8w68gSTyPbVzfACRs4C+7Kav6VSNx+x0M+YyGEyUn97HRzpctmC/FIkagA6IKM/sTOPU8P27waTLKVeEed/C1D1p4/HGMY8mU/44mnlaiF+2NBtsGqxCkrG5+clyHUqjY0AzDLOorQGCF71DsABTkMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRexIu201r9mwS73NDwbtzzSz2FLGasckRfK7iS4kkw=;
 b=Zu0AgzOi6w4O57vHcGge0sL6DK3HQsufoMzKpGUq0Y1DpKJ5L91kzmMsR8qblA3BhgQonCSTF6EFia+1FImq8v1GV2lnwpH6SSiW4R2DXwoQZ1YC4tGzFR1FSYb/iQ22YxkEaS19nYVHgHG1Dp1tvIxz+88s9YKKKYrYQvwKhF83PDWnpQolI6Za6L/o4mv0YrOAYols/3Xt74nYQIHMeqcMdj0zkJ996HWwmTb1CLTRdTJopTEjXGAC3wnJxtuSMV3MjTQP01T6jswzmRvO43wLBmntARALbhO8aQQhy0+z/WexL6W/54GZ0CH/s0xfoXD2+74QfyEljAobt82dpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRexIu201r9mwS73NDwbtzzSz2FLGasckRfK7iS4kkw=;
 b=ITu53F+Hrm59iejmQ4WJqY2NokXg1JhrUSxjWu06KgTFVFJ/wzTKzQyu6c5aj4l8J3J3r0E/kks7Xc+xaqfvs3l5rXPsPcFOCn/+AFQr2e5qLRJeyci4jNgRYgfwfKHVOnJlw6IpPnYN6lSopFQWT2cuDqrRxxJCbuGasj/Z2HSyxQVksUzh7ZffAWITADj5fdb4FmoNfz8jgannpz0v/hh+DzJqzuA/RGRoBLmme7xdXGM4WMaqXTjOAxN/OfGifxP/9PIHnZNnHpwEUuau2pCuuVq5mYdBYpBlDfS/L6m7nh1bOwPM1zQOaPTpba7EvtTbthDWRYf0pFCbj6KSjA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS4P189MB2159.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:576::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 08:22:12 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 08:22:11 +0000
Content-Type: multipart/alternative;
 boundary="------------0PRJcLmcnMe7Zo7WkYfmxGbS"
Message-ID: <8d16f142-505a-4806-a419-b237773e5374@est.tech>
Date: Fri, 2 Oct 2026 10:22:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] python3: upgrading to 3.14.8 SUCCEEDED
To: mathieu.dubois-briand@bootlin.com, auh@yoctoproject.org,
 Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
References: <010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com>
 <DLTOIG3SFIS9.38K7K9E7WCA4H@bootlin.com>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLTOIG3SFIS9.38K7K9E7WCA4H@bootlin.com>
X-ClientProxiedBy: LO4P123CA0371.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::16) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS4P189MB2159:EE_
X-MS-Office365-Filtering-Correlation-Id: d7482e0f-b458-476e-73a6-08df205e4211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|18002099003|22082099003|10067099003|11063799006|4143699003|13003099007|8096899003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	fw6oS530EE0F+SrWyQa/KulJa0jpR3E8W3MiCVsKFxx2BVSGRxmXlGkccO/DaNH50v7KAge4k/8KuZ6XI3mI9VQ4zmQ7NMWz66Z4hFmw4D296pdGZrG7cE0HFJIPX25HOJTTNZZs+1EZO3+tl9pqoIiobco7GPRFoR6CVnsnYFXjORlQb3QKUjTKjWBgszUvUADRNms2UyRfLVzz/vJrdYVajiXzPT1njwdNN51fzGV2tdUk78Qy3EVw0BJNJS0PWqjutUcxacCGYFwDjRTMjd2xraQHSrzZlCX/+ronogc+ZJ7JeGMJ8eSUuybMvNQv8OPCydtM9GJ0t5fOmqfccVxK0FdfABUoKxhz0lpdcl12YY0elPpMlJjbfRma4rf+aZ+lWIaG0WH4u/2ERUntkihkQ2cRw1JbXm5l6Zu4qRMIZsH/g7Zk6aV94vKPDNk/x1Mvnae9b5ZYrmUQPIJue+13WQ3mpYIni+XZ09tyaIJLJw1hYGGkz0HMRqJWHNDjUdfIfgG2CkqV7GsCBWrtIYDhLZAsuU2vWGdFurdzj2CF2tp3R6I/n8o+y2faCpLrG/ahawvNHuffwGwOuDTdXqvV7AJ1lRHsmezKO+zsWGjo72drtvgYYGDDvEonHvp/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(13003099007)(8096899003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enpRenVGN29mZUEvWURzdXpLQzBYOWhJdnlGcjlaeVZvNVdsNTBaWnJqY2hE?=
 =?utf-8?B?Y1RRRFZkMHFvNDBraU9kbDRmZUlLNm96WGNIV3ZzeDdSMTV1YU1TTllmazhY?=
 =?utf-8?B?VXRZQWJsa3FIWFlCWndZalRxN2tYbzVNY3M5aU5xZWludnp2bUhJTXZEeHcr?=
 =?utf-8?B?aHp4UndhODhPRStPVVdwdzJhUmhDZXJGSjFmajBFNXh4ODBBUlpBTUR3S0xv?=
 =?utf-8?B?c2VLeXFReml4UE9nZTdjNERZL292Yk9ENmZiWXhtMG96SmFIdUtWQ0Z6MXBj?=
 =?utf-8?B?cjFtL2RpWEFRUXk0L1QrQU5DVk9RMXEwZyt3TEt1ajJjbHdoSDc1TnFOUkRT?=
 =?utf-8?B?eW1MeXZoMy9xWXBjWmFsMFN5YU4ySTRIMGg5andIQnNDNWNjZGJSNGhPNlJp?=
 =?utf-8?B?T2ZyTm55QVBQUXdidHk0RWt0cUc2eit1ZmUxZ2ZJYW9qcDZIYzBqVXU2eGph?=
 =?utf-8?B?dHdCanpaTkt2YUhkK3paRTNvRVU2RktWUW1OSmVVL3phdzlmSytEOVdMdEJ0?=
 =?utf-8?B?ZHBIWlEvTjZmSHhVU1M5bHpoeDdDNDlZa2crZkJpU2tXbTJWSEJ6aFhBbEJO?=
 =?utf-8?B?V3N3cm90WDh1M1VKUVNUeDh1MEpJU2E4azhjNlFPVFV2WGZoRHpqR05vY2gv?=
 =?utf-8?B?b2h3K2t2ZE5ScWl0Ujl0UDRTN1RXckdHT3NjelNwVElzWW15N2F2UVgxb3NI?=
 =?utf-8?B?UkxZZnFIVENUakpjeHJ1TjhkMlFHRHRPTldlNDJVZStkemhJTlRCM01xZzhJ?=
 =?utf-8?B?N1ZGNzd5OTJOYllNaThRK2RRYUpyR1Uzak9QUEFRczg1aEtWMG9UTXNRdkZL?=
 =?utf-8?B?cSt6Q3BKb2c1OWZMa1M0KzJpbTRkRVhkVkE3bWFsaEZ0UDJLb1BLckxKY2pw?=
 =?utf-8?B?citRZjRPdkxKcEZ2T0ZMazhOcW5qMytobjJxaXJZRTBJN0JyaGpReUlJWGxU?=
 =?utf-8?B?OVgxVEtvWG96Q0JUTGIrYkNYU2RNRXB1TDB4cUxaUUVKZHBSSFlNUDNOd1Fs?=
 =?utf-8?B?aDZ0WWxCb3RBZVlGMnl2Z0VHdmFSWVJIYXAxNjU3Q0JLV25vUFRrRy9zcGJT?=
 =?utf-8?B?RjkyVEZGb0greHJHclVoNFV1bVJYaVdRRW1hOTcvd2hiL2UyQUxqS3U4QkNu?=
 =?utf-8?B?WU1SSm4zY25pMzZ3UEYwdWM3TlREMGphNjVKUm5jallNcGtkeHNkcmowMXlk?=
 =?utf-8?B?ZE5xVGRyeHBGREFIc2ZCNURLNitPTGZSdElpWjBuQVJtSWNxa1J4WTZLbStC?=
 =?utf-8?B?RnZPZ2RCNkZ5MXpqY2gzRlVCZEtoU3lVeXRtZGgvYWY4NGMydnJzRlRZbXJt?=
 =?utf-8?B?UzByVlByY0JUcGR4bDVHME9CSGpmcWl1SmhueXpBdktaMUIyTCtML2FLeVZj?=
 =?utf-8?B?TGJDdGFKb245L0dUSXUzUWdiWlQvcDVzQzFWLzNJT3V5MXM4MzR5d1FIbFJ2?=
 =?utf-8?B?bkJ6Wkw0SzRyY0pzVjZnZlpYV2JXdE1YT1BHc0JjbERVdTFRNkVjdk1LNmpw?=
 =?utf-8?B?V2szckxjczJVQ210bkFwYlBaRnZLMUY0bTRmOVJoTVJTeXc5Z1VWL3ZHeXZ5?=
 =?utf-8?B?dDl5ZTZlanJrVGp2M3VjSStpUURMZ1FWMXkybmp4UHB3UkVlVU9kRlBSWGRi?=
 =?utf-8?B?aFM0dHF5VDlYNThmOThPNERBZThqd3h0c0tqUXdISXJYQ2FJYmUyWXN1SWU4?=
 =?utf-8?B?ckpMVGJEVU95YlNoUXJEQWtaVUZmRWNaQklJd3VsRUxoRnpYVWIvN09HN0Jh?=
 =?utf-8?B?dDBoTTVyUTIwWStsaDFZbHg2U0RETllDczRHaDdZUHpMdm5NVklWR0l4dWh3?=
 =?utf-8?B?Q1B3L3UyVUJPUldDS212c0JhMHpkdDNOaThrcTdYeFpaQ2drU01jaUVIdWNL?=
 =?utf-8?B?SzFuUFlxd0xqQ0l5M2g5bllrSXhrdWNvOUFRQlJ0WkhXeWlLTUpWbE1VVTRm?=
 =?utf-8?B?Vy9iQzN4VTRBc09vdWFKelMxc2E4TkFnbHZmd2pIelpUTHhMQTViVDdRc1ov?=
 =?utf-8?B?dGdLdDVoR0lzR2V2UTFlZytDSk83K1dYT0VmbzVRLzc5TUlBcFN2TEZ1MC9v?=
 =?utf-8?B?UUpyQWpXMHAwS1lEbEQrbUJHY1hWWmNsY2pwdjRkRFlWZ0U1MnM2SWFqd1JX?=
 =?utf-8?B?WWVQTERYVWdoaXZTTCtJdWE3ZHl1c05ybFdocDRLVE5QeWlQUXQ3VmFVa1lM?=
 =?utf-8?B?dVRLaWdOL3o1c1FrRmlOSmtoaXcyMDQ1S3RYK0Z2Vk9vdlVYVGFwNVZMaEVj?=
 =?utf-8?B?STJ5L0kzL3lJK3AzaG1uOFZYMW0wUlBVSEZGSDZzUmt2Q3pLU3phTkF3cVZr?=
 =?utf-8?B?NXIwUlpESlA2Q0NkSnFTWUtQeGNSMERCTlYwUFpoMUtwbkZVdDU3dz09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d7482e0f-b458-476e-73a6-08df205e4211
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 08:22:11.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZXCp2afohvzkaBAbUjr53cLztaO1pqTpBr5R0kyHP8cHnAkcfyAaqEYs3B6Ir3Vuw+5eBHy4v08mC1VOlipMk8FpG5b9EoLynJozSqMUtKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247088

--------------0PRJcLmcnMe7Zo7WkYfmxGbS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2026-10-01 19:31, Mathieu Dubois-Briand via lists.openembedded.org wrote:
> Ptests are failing on this one, when built with musl.
>
> Failed ptests:
> {'python3': ['test_append_limited_history', 'python3']}
>
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1308
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1297
>
> If anybody wants to have a look. Otherwise I will try to find a bit of
> time.

Hi Mathieu,

Failure looks related to new testcase (test_append_limited_history) 
added  this release .

https://docs.python.org/release/3.14.8/whatsnew/changelog.html

gh-123018 <https://github.com/python/cpython/issues/123018>: Fix 
|readline.write_history_file()| 
<https://docs.python.org/release/3.14.8/library/readline.html#readline.write_history_file> 
and |readline.append_history_file()| 
<https://docs.python.org/release/3.14.8/library/readline.html#readline.append_history_file> 
producing a history file that |readline.read_history_file()| 
<https://docs.python.org/release/3.14.8/library/readline.html#readline.read_history_file> 
could not load when a limit was set with |readline.set_history_length()| 
<https://docs.python.org/release/3.14.8/library/readline.html#readline.set_history_length> 
and Python was built against |libedit|. This works around NetBSD PR 
60322 <https://gnats.netbsd.org/60322>.

Change: 
https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e211be7b9 


I think we need to skip newly added test case in above commit like we 
did for test_write_read_limited_history in recipe.

# Also fails with editline instead of readline. See:
# https://github.com/python/cpython/issues/123018
SKIPPED_TESTS += " \
     --ignore test_write_read_limited_history \
"

Regards,

Jaipaul

--------------0PRJcLmcnMe7Zo7WkYfmxGbS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2026-10-01 19:31, Mathieu
      Dubois-Briand via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:DLTOIG3SFIS9.38K7K9E7WCA4H@bootlin.com">
      <pre class="moz-quote-pre" wrap="">Ptests are failing on this one, when built with musl.

Failed ptests:
{'python3': ['test_append_limited_history', 'python3']}


<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1308" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1308</a>
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1297" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1297</a>

If anybody wants to have a look. Otherwise I will try to find a bit of
time.</pre>
    </blockquote>
    <p>Hi Mathieu,&nbsp;</p>
    <p>Failure looks related to new testcase
      (test_append_limited_history) added&nbsp; this release .&nbsp;</p>
    <p><a class="moz-txt-link-freetext" href="https://docs.python.org/release/3.14.8/whatsnew/changelog.html">https://docs.python.org/release/3.14.8/whatsnew/changelog.html</a></p>
    <p><a class="reference external" href="https://github.com/python/cpython/issues/123018">gh-123018</a>:
      Fix <a class="reference internal" href="https://docs.python.org/release/3.14.8/library/readline.html#readline.write_history_file" title="readline.write_history_file"><code class="xref py py-func docutils literal notranslate"><span class="pre">readline.write_history_file()</span></code></a>
      and
      <a class="reference internal" href="https://docs.python.org/release/3.14.8/library/readline.html#readline.append_history_file" title="readline.append_history_file"><code class="xref py py-func docutils literal notranslate"><span class="pre">readline.append_history_file()</span></code></a>
      producing a history file that
      <a class="reference internal" href="https://docs.python.org/release/3.14.8/library/readline.html#readline.read_history_file" title="readline.read_history_file"><code class="xref py py-func docutils literal notranslate"><span class="pre">readline.read_history_file()</span></code></a>
      could not load when a limit was set
      with <a class="reference internal" href="https://docs.python.org/release/3.14.8/library/readline.html#readline.set_history_length" title="readline.set_history_length"><code class="xref py py-func docutils literal notranslate"><span class="pre">readline.set_history_length()</span></code></a>
      and Python was built against
      <code class="docutils literal notranslate"><span class="pre">libedit</span></code>.
      This works around <a class="reference external" href="https://gnats.netbsd.org/60322">NetBSD PR 60322</a>.</p>
    <p>Change:
<a class="moz-txt-link-freetext" href="https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e211be7b9">https://github.com/python/cpython/commit/e87da800b6103fd890841688da48e41e211be7b9</a>&nbsp;</p>
    <p>I think we need to skip newly added test case in above commit
      like we did for&nbsp;test_write_read_limited_history in recipe.&nbsp;</p>
    <p># Also fails with editline instead of readline. See:<br>
      # <a class="moz-txt-link-freetext" href="https://github.com/python/cpython/issues/123018">https://github.com/python/cpython/issues/123018</a><br>
      SKIPPED_TESTS += &quot; \<br>
      &nbsp; &nbsp; --ignore test_write_read_limited_history \<br>
      &quot;</p>
    <p>Regards,</p>
    <p>Jaipaul<br>
      <br>
    </p>
  </body>
</html>

--------------0PRJcLmcnMe7Zo7WkYfmxGbS--

