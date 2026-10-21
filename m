Received: from mx-relay26-hz1-if1.hornetsecurity.com (mx-relay26-hz1-if1.hornetsecurity.com [94.100.128.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10246.1792586259538836119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 05:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=m6HqahvC;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.36, mailfrom: tgaige@witekio.com)
ARC-Authentication-Results: i=2; mx-gate26-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=52.101.72.117, headerfrom=witekio.com)
 smtp.mailfrom=witekio.com
 smtp.helo=am0pr02cu008.outbound.protection.outlook.com; dkim=pass
 header.d=witekio.com header.s=selector1 header.a=rsa-sha256; dmarc=pass
 header.from=witekio.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=vv0rVhzCaS3GXsWVvd1GaxIm7foeCpnr6FNmpXla9ZE=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version; i=2; s=hse1;
 t=1792586257;
 b=jsW3qOgLoeTcTE4lBOejjDCmDFYgm3GH0qSjRN7zVmHxYcUxZ86+PQL3vjtolZTmTiGWLR+9
 L2/AJyR/FqC9C94rzIZF2BNR4Byl6jID1lzM6sqwKjNWiGOHJ8q+zjn5327L2BdwV5xo2EHvDkw
 qiDTaqcWfd6nh/5AnAqS5e7w+JORC680/lcW/znlpUDPvMuIDf8QodeoyoQIi0plEQLdWriwlTi
 UYO4EYL9Ddop4jHN/OWwNRv6rJqng8R3aDwVo05AhUL9MSv2kYyBflTaGZBnjruFdASNIb+VUQ9
 DeGZlHuVd4A7UpQWRbXnLdl0b028b4VfLim+Yp9htwFQg==
ARC-Seal: a=rsa-sha256; cv=pass; d=hornetsecurity.com; i=2; s=hse1;
 t=1792586257;
 b=EiAc8ljwCTMyB4/sN/T39m/ID0nrSUnmG84oGbQMdNYlx0qS7l/bZXrhhu2b+aitJOQLCAfz
 DALY8Sg0p3EGT68VfAtViWHq3lKRBnLfUYBxp7CuNjZR/bQ27U3KxPtKq7gmbdZU3js2XGz2kvK
 BkAPR1NFjCAmDO4NxyVzZ3RHjckNLF3AOBWzxsXyE6jHIjjwH7N5LO5XLRJLhG8CTM/UXyyBf8R
 V01iW1WaciaP5QBYYWB2DMLiy7BPHkNX7wEGlpInd45o5zpZHQE1f8+KwmEcgBzrk7b54qYE/zK
 Ipezsl5bMmDuDVS/XdF4hQTckY8T83Zyvnx/4SBDl1TuQ==
Return-Path: <tgaige@witekio.com>
Received: from mail-westeuropeazon11023117.outbound.protection.outlook.com ([52.101.72.117]) by mx-gate26-hz1;
 Wed, 21 Oct 2026 14:37:36 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUgMf9PVlR6av/G+eBwFS9/zAbFQ2xORPliT9/pgGsCz4P3L4RuKB7u8UU3mVYJdoX4OKjvzw7/BVIfDoBnZHDdpy9SjgYnOnY0psO6tpTdKFrQRZvmYq7Lm9qByJX9XHfScOdL8JatO1Hv6S4YIU1tBVgUL9SiFvzelsp2UyQSJ8bhgbAZIxye1iMEpFBt3bdnMGHWgFukevDvUKlWli7s1pSgS+2w+JB5TVJ5eWPYiLL9phokrS3//pz1CtlrHp1ooLPFlUbK3g5ufOyYMHAOxFUDaKwTWXjZMFgwXQ22NyFy9e9JFmHR1fnB8OGAQZzFxsjtZDSFfDImAEJFlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vv0rVhzCaS3GXsWVvd1GaxIm7foeCpnr6FNmpXla9ZE=;
 b=FKLCasZjnce0NNH+bBuFCRKxjLvAPBKZQHV34m7gCfU1mdZI6hAJedveL0sfsc8wtuJ8epNg+gClxZKiQTUn7EHHklf3VnXGahUdHhl2fX0JqzME309bmPE266Oe2DYfZXF9bCrzw5F9O0yZV0DvQnAFfZqBv57C7Y/Od7XRMoJcP4wcktRZKFyQqPAnIp+9DMfXDyFSkhWmtTITtBr4HXphRvAMukuJq5dy7lMtJPLj6+II4wIkW6WPZtCEcCrhxaql39vr1Jx5YsF/+YZgd5EYg7y+k91pO2uD3UC8hLRgi8AAu7gXUhLZOG/uJnAa3cwAPODUmCwWrdu0qzaDIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vv0rVhzCaS3GXsWVvd1GaxIm7foeCpnr6FNmpXla9ZE=;
 b=m6HqahvCQTa7001NcqPv/GwMEHHrfODgLmgXzYgbdn8ELEQ6a5eKaEH+VSj5rHSk23aQKk7Qfhb70V++pfa4vUjW9ZPeeOsNMYYtFnd4eK16JOMafLWpqfPCdnjpKUto7kg4/67PMlir3R+rU6Hi0RCdy35CAi9OXDgbFoCKZmxPAK64PJcifBMcwWjAgEFw83yDJXbKgRVz/2AqM91LIDC1LUDXNlqEpOTEY6GVVVyWGY+8tv6skhsHwNzd8tey1q0usfyHuk0hVEvMB2xMJkr7bOdOFTKIKGf6CVaIKhzQOY9Pfgmsk/1ZyxktHIQ4uRajmKFgcbnYvaAEOAYlww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:51d::6)
 by AM8P192MB0898.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:1e2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 12:37:30 +0000
Received: from AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58]) by AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 ([fe80::81a:852d:56c0:eb58%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 12:37:30 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	Theo GAIGE <tgaige.opensource@witekio.com>,
	Louis Rannou <louis.rannou@non.se.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [scarthgap][PATCH 1/2] python3-pyelftools: add python3-logging to RDEPENDS
Date: Wed, 21 Oct 2026 14:37:21 +0200
Message-ID: <20261021123722.2713530-1-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:51d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4P192MB1862:EE_|AM8P192MB0898:EE_
X-MS-Office365-Filtering-Correlation-Id: 588a1c7c-c7b4-464b-ca22-08df2f701297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|23010399003|1800799024|366016|38350700014|261009223027099003|10067099003|56012099006|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: qljGYauopRF698L8MKEDk/jWxqpqIVUFlO1d2icN6SrS0C+zbvEtEeLIeezV3zPThJGwOahg8S0fpqRQ/8TPBzvLWkVe4102Hf0m7nVBtbhMLWzHygLpL+N5UT3qnBactcYD7rtmXcxqUr5JGQNA7Ps6bfZ7KL5RHwMAUW36dRCUIuULHg5zu6zJj0yt5xQJbbCU05JXqxVKhKuXYVZDyK589xgHh07TsYN7x0RTfdU+UwJe8wjX3iRjifGcKYP0E63Db/9caaZWBp73j+AyU/MbHLRe14cdxeJhzmpLUZLEmovfwaxKKGV54E3OgcnLn3eEjoe6ZzH4sI1/IIqkJdfV9SJOy1cUOYBguXKvPhPNVgIg14OsXzeGHGcWrh7kLuH7dTxToUbB7yx1mhe6hqjJIHScN9JGWjb3hxYcf5q3X7/QIlFhWJWrk6dJFdom9wBn1+/k1w4HWiM7Tcxq+60H1gHV1QF2xBHGwJTX+hoHDrczl1pLg/bBn20UnfqZAac+pZMV58cXM9b6ZB2txg8F4EgJTlLIaV1dxcBYKt/YCJLKcVwT3o88IgAKA1NOQuxGlV9fuvi4djO9znXql1z11PJqd7GpU4vpBZbWY4wiNcO2KhCfOFn67hREwE9TH1b3YuHTvl23zWrq6moqPPMfa577MuR4ldbtYpNPWFJEQixmx10eV1o0ylB9992+Q9DYnqit3WwST4ZaHZhqCla5yy5++sST0IpVL6zbKZA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4P192MB1862.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(23010399003)(1800799024)(366016)(38350700014)(261009223027099003)(10067099003)(56012099006)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mjtzvojKloRH7lcO58wbEefJhk41CTICYdnzRDERaTSwNanACaJwsrDWFfUF?=
 =?us-ascii?Q?ookIgpGeVw7Nre91o8eQ6E8kfGC/wIfov3+XgWxmOo3GCz9746k0VlYfiL93?=
 =?us-ascii?Q?xEO6z0LS0OsXFVwo7E75d8Gq/+vKIyVEezxYLR4v434jln7jwpjs5QJGxvv/?=
 =?us-ascii?Q?fkFtJeGveEP/LAnIc87tU5rnz01T6BCd9Gqi8XwW4SEgJDyTnjGa9xwlDFdh?=
 =?us-ascii?Q?qu7bHsOJG+1kyX16YlVm0q4Mzlb+fhdeqIeZN11AHBMJPvfQe8Bp4qq1WX1P?=
 =?us-ascii?Q?q0e5T+ZEd9CkFwS980BK4otPOOEh/IJZBjkE8wFTBuwvJAQtQ7R2lz20Fvfg?=
 =?us-ascii?Q?MXtMf71+h9qKmw1lnPI4q2AlzWhhA7+t3ZgvtkEfLlOQq5IK78AEuJR35kci?=
 =?us-ascii?Q?YIFPTWuWWS7nFqh0WipL0boSCnVmx+KoptM5i/AveODeSgrfU60cyRhSmZzK?=
 =?us-ascii?Q?a0Ixv6ZsUFgfTLTke/wyoNYYR2JeKXwojMU8mjqhSa0Tk/0+HjAJHna5YV2M?=
 =?us-ascii?Q?IVRb6OzPXyARMq0A/3ESTe0Kdr+MMr4XBM7fl8i8OIFT/AH1RjVPuQOlVtXv?=
 =?us-ascii?Q?UfcxM/c8KkeLa409jo0C5kXcx9OYKtnV13GU9vol0g93nlL+fAMo2Lm3nI2y?=
 =?us-ascii?Q?wJ5BWfQgtFLa2rEY9RAKjJHxsfz5iOFmx/FIWx+MyMA/7RjirYFommpcZ6IT?=
 =?us-ascii?Q?Q2NU3mawPrjmq0uiYCaYy9r9mYhPxvvR8eDbGwFmBtuiNQcT979LDjhY1Qfz?=
 =?us-ascii?Q?G2wpJHt59ciNd1ywKP5P2qQg5WXai014YZz6g4SyyhCXcHmyzmIet0GIPAu2?=
 =?us-ascii?Q?I9HDOpitlM1geKpft+X+5beH3pgCDQY51pGPt44jfGnX8Zzl1dZr70t4ajQa?=
 =?us-ascii?Q?Rdq009TTAlHlOxbVHRnyIQOHF6Xv0vnsXNCCk8nt7lQFmgQjFsWrYcXqNBZM?=
 =?us-ascii?Q?KCAOD/IP0TTzR4gB+89YxIeOyKgOt1svOuHTX1Bv74ZjWcLasQi7gUbH7ucA?=
 =?us-ascii?Q?u1w2g0YcZMBlghFPs/MVt9HId2HEiE8LcIoEpVMeZvpd9/6ZYm4MlCkeXkbs?=
 =?us-ascii?Q?ebbHVhgu0ikHDoOvoYlLMEHy+/AdK1YxgjykOJHrI5RwzokX/henFDFDOory?=
 =?us-ascii?Q?28u8JjfYOoGSiXxTG2jI0QzJJvJmrMJHo3IVJiC6ooO6M4YeJfQntT2tmJu+?=
 =?us-ascii?Q?fU/aHPkv9WtuEs3qzv0dpBpOY3BJWQRSSm/mGbY7eyEF+E9Kg/ZROzPiwKMX?=
 =?us-ascii?Q?Jn+5WTdR4DwSrZf9tF/jC1K33Y56JD8BpCPKQQNMVkvlW0Y90lPVC1bW49fX?=
 =?us-ascii?Q?UQxA+YOzmhelrPYrKUKAOtn7DIjsMJLmxbi0my0SqKjyurKKKN80Z/FyHdL6?=
 =?us-ascii?Q?eH30sy0jtdh6HIBx2YlABjpZDg4KjTRxu8cy0shs6MXEedrxlu+HqvImnA+K?=
 =?us-ascii?Q?Jbp6F6OpSX/1uXEld//cbmIFYwAGRQGr/UTro74uETC8nOr/F5oxavvYzCdw?=
 =?us-ascii?Q?56nlblHEf4A39bGJ4Pz7U7jf876qHFwbWppiv/9/k4xDBKASDJxyUfYYBQ9A?=
 =?us-ascii?Q?6Iqk6hbp67DKUpWZytmNvoahbU1sBt7gn6l4ZmngHPyGjNaXdOrsJO95P6P/?=
 =?us-ascii?Q?zheqYLaZo9GnNHx3OdqiL6s4Gq39plLuq+1hfFGfhayqWpykecz/PGQkgQYb?=
 =?us-ascii?Q?5Vn5zAjiqHzOajKXiSxWiblYMDJ6yR8fzNjLNd2Ci2/jZWrs9RDGB+n2SH2i?=
 =?us-ascii?Q?03xr5lAXwA=3D=3D?=
X-Exchange-RoutingPolicyChecked: KWzzawsibooM6e2CqObUNQpzseJWPzLsOP8FsBfb2nVPLYeUkQQ2fnT7YYZNxzeEz5Wa4KJk9OdAZjCl4BVVpkQhhZ9M0TN7sw8wg625CXnj72l6Iz4iguH2lmY+UftwwIkdxcjHTqP3k2YhJyWpM786x4VrlLWezQMxayZ02m1vWH3n+TnqA8CUt41amvVC3z2MgtsA84IiRRP5FGdipwayrCeSC19xi70k/no1aI2A5SJdHEjLMw9me6mh0r7N0XcWlchvSQtuWckdOUhmIsy3nJRXH19oIOgWI+4enjSubTMEzsz4X9WkZOW+imVExfx+eBfaFGAecalFslNxkw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: G09w8OOrg75u7q0mO4ga1zofp6iLyDkN1UvSeLY/Qgdh1n8QS0s+QnS5B23LXlZ+Nkgwgz4shBwCA6eL/RHsQwrZxDwA9uK07tuRqdmYamerVadIZ5sr8xeSZqXIteumHOvmfg1abIuu1qL7IxUMlWDsfqwl03kGFZ5yQ9usl5VsUXLuK1O5kPySyEWciAuxW61k+aB8l0m9zLocMELyiYazppy6S0S5lnnlOrj9dAiZc1jc8ZML7O5Sdz5OrKRLyLc35bbTMp6t+M9TQHv5O4rTQMhdAGxiHRTpoEM/LxJ9dBCHZXko6wJflG1LE5j/W4ju0vknM8jVWE+jDd/MLGN5wpNBrkMQTMnSDlzM/QKlaSEkOiovhjO7v/nmGXnbfqFUmAAz1SszGuFvSP48KA8Be01oT0Lcc2toxxik8dRBhrcSULbkTp7GYpS2ztsGIM3VBC3U7aOQkjuSibURYYNYAXZLyhZDJlyxHBUlNq3WWTonBls9O463P1X8dZ2Q6BOxrBHRQBvfhVr5N9o52mJX3aZ/D+beNWoZ2WIyGGVsJR7gVmvmjTGa++T3huB/QI94X041lzWuWKSki+xSalFReSdCfCaFnTr+MDd2My8t5I4+ME2IP1QkUPQGg3kp
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 588a1c7c-c7b4-464b-ca22-08df2f701297
X-MS-Exchange-CrossTenant-AuthSource: AS4P192MB1862.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:37:30.6037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MdF4/BEK2kstXRXNcVyBHhzCeGAO/budMG78PfpKK/D9ZsN3RW1gGpJ+ijryDi5NnkCNLgQPVZAR2DUGbIXu1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P192MB0898
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate26-hz1 with 4j8phW666Rz2yMDb
X-cloud-security-connect: mail-westeuropeazon11023117.outbound.protection.outlook.com[52.101.72.117], TLS=1, IP=52.101.72.117
X-cloud-security-Digest: 9d43923a72b689b8e1b622af168e3384
X-cloud-security: scantime:1.466
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 12:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248395
Content-Type: text/plain; charset="utf-8"

From: Theo GAIGE <tgaige.opensource@witekio.com>

python3-logging is needed as a runtime dependency of python3-pyelftools
else the readelf.py script run into the following error :

```
Traceback (most recent call last):
  File "/usr/bin/readelf.py", line 31, in <module>
    from elftools.elf.elffile import ELFFile
  File "/usr/lib/python3.12/site-packages/elftools/elf/elffile.py", line 29, in <module>
    from ..dwarf.dwarfinfo import DWARFInfo, DebugSectionDescriptor, DwarfConfig
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/dwarfinfo.py", line 17, in <module>
    from .structs import DWARFStructs
  File "/usr/lib/python3.12/site-packages/elftools/dwarf/structs.py", line 10, in <module>
    from logging.config import valid_ident
ModuleNotFoundError: No module named 'logging'
```

Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
Reviewed-by: Louis Rannou <louis.rannou@non.se.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 9b956f6b5a345bd3022a9e64fa70a0365bfac502)
Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 meta/recipes-devtools/python/python3-pyelftools_0.30.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
index 837edb7165..b799f5acf8 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.30.bb
@@ -12,4 +12,4 @@ inherit pypi setuptools3
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS:${PN} += "python3-debugger python3-pprint"
+RDEPENDS:${PN} += "python3-debugger python3-pprint python3-logging"
-- 
2.43.0

