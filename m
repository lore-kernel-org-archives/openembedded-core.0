Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17187.1795790958037406337
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 06:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=WWjmPdnH;
 spf=pass (domain: est.tech, ip: 40.107.159.1, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BD50sWhXfh7KilRSTeVRPEl9voErI246bnvrXiVRHloyY2tE1MIH8bB91/4UQnhxbDpB4FgDUmajDv38HLEFR065YtOlfXEHRkNh3CjkRN88fV+F8UzVcZ41uPSf/Lc3TYZtm83jLInvmzC0amCX3IMZQ31uAkb3PjHGUoTMBPw2wZH8ZiAAviq2uF+r54t1xL1NV5B2uJffMXFhHhBV2B09uNxUJL3UD1Yy36fbpY92En3GnZeCDT7eSgW4M5VAEii1bv+IbNMDBI8tenXDyb+DU0fPyJ2CIlyqLOkzzZ6IXpP5hVX4ZFW3iu43WeZoD0+6V8e3LEI5d50MSoJhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fQXJra4ZTMT3WtZ6v+FcJQmqOoZlH66YLLK48Qa0G4=;
 b=nnSTfOgb4nHHFKqt6lxzhB4dbyo/5MoC8SwaHTBJrma3j1d3cGBIq3nzqrLsv0nygDVPIxVwM1n+Bna+W3CozhrPYkDjtV17KIJ2bWMqD1Ti738x7p38okfAhZmHkTNOMmSNqxWrXJoBh0Y9k5v4t+xL/GSWqlfXRvZQQ86OzvOjOlcn3cgXmAiqXq3JlXErktlU9nCwWBcsQxnWQWe/Tt3Ve9OTebaqhTjdotc+TOM+jFbhVF47OJgJ59noD6QCigKX0UZXWw2NOxK66UEe4tjwgPTzKC0aIjcnKcQOG2b0GlKEkwD5+rzXLJ0FtLru1PCn+Yd982xPrx9HV6vE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fQXJra4ZTMT3WtZ6v+FcJQmqOoZlH66YLLK48Qa0G4=;
 b=WWjmPdnHOEwF0q4/cNqwTQCCoz2Ra37bMxDUykrNCTEzUj86qUtJYp+qDSxcDf7UfWSGS15bSEH3lGbUGOU11bfMchx+rRaiPoNdrMgZpJk6VKxC8BKsUKpEF9kH7InZA1OnZF5rKmD/kNrUlJaGDNvud9cHvloh+XmJsPpwirLTiZnz9lUj3f+5JpeSLs/S0mhdY6sXUElQQ/Qs9DRdrYmOVno0/UtpJYENUPE0+3zIzzfXVSPHoHG5XNVkSq/l7H0H0Ie5SUCbNzPconMZlkKN0z6xrtwhuBw0WTejYzIjGYnmt7zXtjKQNnU+EayBhCn81EvoXbxphxRgCQDe3Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB691417.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:606::18) by DB8P189MB0920.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:163::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.9; Fri, 27 Nov
 2026 14:49:12 +0000
Received: from GV2P189MB691417.EURP189.PROD.OUTLOOK.COM
 ([fe80::7475:78c4:8cda:4c34]) by GV2P189MB691417.EURP189.PROD.OUTLOOK.COM
 ([fe80::7475:78c4:8cda:4c34%3]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 14:49:12 +0000
Date: Fri, 27 Nov 2026 15:49:07 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: mathieu.dubois-briand@bootlin.com
cc: mark.hatle@amd.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3] pseudo: Update to 1.99.2 version
In-Reply-To: <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
Message-ID: <8e691720-8af7-37ce-efb7-bfd1fbbbdba2@est.tech>
References: <20261126021504.2712290-1-mark.hatle@amd.com> <DN5SYWCJICB9.I7N9C1C4DHZI@bootlin.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
X-ClientProxiedBy: DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) To GV2P189MB691417.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:606::18)
Return-Path: david.nystrom@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB691417:EE_|DB8P189MB0920:EE_
X-MS-Office365-Filtering-Correlation-Id: c95a4237-664f-4d9a-145f-08df4c9599a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|10070799003|23010399003|366016|4143699003|261009223027099003|18002099003|22082099003|11063799006|10067099003|56012099006|261028144727099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: csRKlQC8Pha9f7vvzZMa0blk8ozTR57+9fXvEsTTmF6LQv3rx25fbejYYksKY8ZMbW/eyGoHA9d2r/5GWcLO5PP+DiVTR8YyEve0hqvw4qQHrqSZtK8AhuxJ07VbfzqVl4q+Z8SNX2SITiOMfqBFQyFlORniKqEPxV8aBRrYLsfkJNqiNl5jgbkEbr0uSssChMW/0/I4I+0EEfEWzPprlBn89xb0bnGrsB7IBUSvGt1BGpodVu4OB+KehuE/X2xhulYP9YKbf1Ult1jZ2A97xNdco7Mj8Guz60zaXKn9BLZcfyOqKzCwYBEHbeS1Ewc/QFyujXGp7IwBfSxQ2hbRTdHlIBoI9sk2uG0x+21Wd3JYQ1VtUCPgVk6HOgccxkApaBv3pkBnbcxH/J7TKJZrHAbM0hqQ6KCQxjjB7GWSBTmtXz0UvnF6aqD+mN3jftotI67HsGFz5kaMMzw0pXBtiJ5KM/e3YLKLyGJcBJ0mh10u+R6iDOLL/bJTFy+nWHuneGxdlNk+r6C3+u1zfVh3VwbSH9StkNUmPWAnWWaIM2urqetVLWTVUV9eMWJ3WjfIdyeXK8+9IsroCgCVHIp3JA8ATrGemLp/wNaevxs8bpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB691417.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(23010399003)(366016)(4143699003)(261009223027099003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?d0MG0M3sD8OgBrz9poVbDGdEHVNhqItJTb8JBAT+6DtghiLYOwEf8wBSKtum?=
 =?us-ascii?Q?yQ5uoyAteralPiM7xJjQ3RXjDQfU9vEKhisP2z+FnV4TwdhpwNSbiNspqSbv?=
 =?us-ascii?Q?Ly0XHBtL3fwbBrr+8r2Sohc4HRDNvbOc1qDYb1so3yPFiLa8KTWIhBUZSngP?=
 =?us-ascii?Q?eExzsa1CU3hg6Ld/RggO99wnyIlrsgAu2XvC4vKrCgHkcQ+utVk0IPSDco7v?=
 =?us-ascii?Q?0aVch8EVehmeVNFjkYABDk60u1RW8yM/nxXOk6miN7Q6H5lI4iLm0xP+7zSC?=
 =?us-ascii?Q?f15sthOPsxEPpI1OORYlJDMWBMnnJi4gFO66/abQ9CO9Zg+XVFqjAFOQAGqY?=
 =?us-ascii?Q?hMF/HMFNY86cnf01qV10F3PpXkXip/R5TR10lSNSsqSJzjNERmrNMBs7pocK?=
 =?us-ascii?Q?KYvgFGX+Q1+K0wCUVQLToEZlzVI8lLEZNXORBVJ8r1gz+409A0o0HTilSkmq?=
 =?us-ascii?Q?60C+7n0xfPnDgPjOENNcXWqqO9gsb3z52Oxlohy3nSz5OH5S9lLlBKXD/Ppi?=
 =?us-ascii?Q?uaSXy632a7nbUOj0QxjYrTrZ7/A3VB9PX0U2RsSFwsoTVBYpAuKPs17XSwrP?=
 =?us-ascii?Q?Kw0QxW5eVFM0REx1ukcIDXSl3WH6pTBRPhRduVzQFwZX2LvCwH1jJ1hS7z/A?=
 =?us-ascii?Q?zmn6VWorSYbPKtiFerrq1DOphv5WthWzge5hNoMME9LxVWG7HLz+m/P3AasF?=
 =?us-ascii?Q?7iH2ao9Y3/9CK7Tqyyih4X2SuAGxIqbHoSe+cqdD8IYJxObW//fqKOu/TWST?=
 =?us-ascii?Q?qEtGHJVr/ioPGai/SlVVWflS6Svl+WVBX7lJs5M42Bpa5FX/7TOxgw7OibHo?=
 =?us-ascii?Q?UbEgxjMCI1sMQuw1AW2SXbG6lNTcCS+BXBF8zbJrzzHvRBZzUQcCuxIp/o8+?=
 =?us-ascii?Q?X7dZ0gybkfbsA3iNATHhd/CpdwOVASueL16ee86JNeLB93j7I3mdAE6o8n5G?=
 =?us-ascii?Q?pzpLZhACOeLQhvhbdS58dHz6mzlIj8hHPTdGnBtoq79BJ3kPm/FUftJSHCto?=
 =?us-ascii?Q?WeCBsFy1+QA0AbBJjWnuqBlL0sOm9ddrv65YmgFcNrt+lVz03DUktwh1AKlA?=
 =?us-ascii?Q?9VqdG3XN9C6Hghs9E6UiJ0oplRmlByBBZMBg4uLDu7xgGgI57APL6xcDFSlY?=
 =?us-ascii?Q?TJmla81MfPoxWloNUWYWcHP9MXCI1dOlSROvlH2Qe6Ynx6ZFawdpdlyEu6Jj?=
 =?us-ascii?Q?HBedvoBGwZUGNEpHX4Sbc/iWaacnLFoXuyEyMG7+jTKWjmnQqveh+C2WIyoA?=
 =?us-ascii?Q?fZ3mSulTkN40gj+0WwM1LRQwoyJ1YGBpy08Udee6hcQVzqHMou0QaQkWrkHW?=
 =?us-ascii?Q?xRiMCVv1DhmAV/rcjOKY6VebFgURuf7RDnBXku1bgjqF4H7Vu5HfQ/zIyvhS?=
 =?us-ascii?Q?5jZL4jTKCo5BU8U+HKrx8grpF5MIdWth69NsHwCS3Niy0zupvl7MWR5dLIF4?=
 =?us-ascii?Q?chaLx2VUDP6PY5izLODYItIfTDRrSlUoG32H4qNiETMNvhGt/mTaYF3I4kDe?=
 =?us-ascii?Q?VoHuUfM5vGhVAelIq7G9zJ91hZbu76UbgEGko41slPhA/8pLB9rj+OyxzLuH?=
 =?us-ascii?Q?HIK8PQxzrHMVRoATKpMYIF6rwdkS6m4ORjUbGjyrmFWWVKuleb975NQQYBsy?=
 =?us-ascii?Q?SKvE3p2A59+zml2IUd7vq+215bkwxAdjVWCcjOQFZwy8G5RSyqUW5B/a/0sn?=
 =?us-ascii?Q?pyAfhEIFBQiuTFXDK7CljDceIonAHo/9qDqr6XxpRz5x9lXgkX90NRr8S5jr?=
 =?us-ascii?Q?7PQzf+dTcx30bT2wAFQwEoF33yQn6lug9hdd/Gr5lEy9NlTiEyyEctlEB8hb?=
X-MS-Exchange-AntiSpam-MessageData-1: enL9ZRLIK70nFQ==
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c95a4237-664f-4d9a-145f-08df4c9599a3
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB691417.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 14:49:12.2304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3eMSTtBT+Rm6SI3021Yx9mV9mw48eWCmCyx6dK9vK99QqnUpyviRQ0xVgmUgrIgp42ypiNyhtPkDbylnzunqTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 14:49:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251396



On Fri, 27 Nov 2026, Mathieu Dubois-Briand via openembedded-core wrote:

> On Thu Nov 26, 2026 at 3:15 AM CET, Mark Hatle via openembedded-core wrote:
>> Changelog from last version:
>
> ...
>
>> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
>> ---
>> V3:
>> Remove obsolete 0001-makewrappers-Allow-the-wrapper-architecture-to-be-se.patch
>> missed in the V2 patch and detected by patchtest.
>>
>> V2:
>> Corrects the V1 by removing the makewrappers patch
>>
>
> Hi Mark,
>
> Thanks for the new version. Now I can see build errors with other
> components. I can't remember if we need to do anything specific on
> pseudo upgrade, do you have any clue about this one?
>
> ERROR: Failed to spawn fakeroot worker to run /srv/pokybuild/yocto-worker/qemuarm64-alt/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_7.2.bb:do_install: [Errno 32] Broken pipe
>
> I can see that one in most builds, with a few variations.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/5039
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/5059
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/5033
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/5085
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/5071
> ...

Hi,

I wonder if this is a cross machine sstate pseudo-native reuse issue.
Tried to reprod locally, without success.
But I did find an inconsistency in glibc version dependencies.
the io_uring commit is using an unwrapped strtol, which is frowned upon.

pseudo_io_uring_wanted_mode()
-       value = strtol(env, &end, 10);
+       /* _GNU_SOURCE turns this into __isoc23_strtol() on
+        * glibc 2.38 and later
+        */
+       value = pseudo_strtol_wrapper(env, &end, 10);


> Thanks,
> Mathieu
>
> -- 
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
