Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40990.1793014987331228864
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 04:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=RiEIotZg;
 spf=pass (domain: est.tech, ip: 40.107.162.25, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xePRl01C+DD3P4vNv0UnhD4kmLgY/nouuCnO3rbb8I3aq4aVGtG7z2xMYV8kOzzccZrpmi11k6jfWo+nrCENE6k7mfsX/ymt1GDFJHuhcbus9GsFhjUo8GQ7JgWPgj70h20Aw2CHul3/DOMgXuVCW0twRvoFdZK3XldXqJC0vp8Jr5wTLYC1FXD1wFiMBCPr7CKcUWwHjhD9BMIUieeIObjizs5Qdrn6jPWI6+LMY2AOC2eS4Qkv2I6+3DX7cJzh0WINwykwbksc9InrS0V6wuMYhwUC1oTQx1fMZC/ec3IwPVxRP0YVGZQtWRcQdAculstGmC6IkUWZA3FQnxgmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKsh3bLi08sfHzY+uHYfC4lX9+MNcM3gLpiZCj/W7n0=;
 b=mBe2NlFDkCI2Vft1XHSx/+tGLvUwCabE4HpkphNIAn+0l678ISj6cMtboI9vTJvGSOdlrzjIHDZ0CDs8xmwtKUwyyoH5GGEqvrPn6N+4xF6NJFs5wRrE5BXTA7pnheLieN/8DmVIQBR6eDqPZxgil70mbqYnoG1UFgEcu+OjskmzOrQJ4bNpZ1PXcSNrv4q7QHOmy0FOl/s3GhOHGhVMwTqSXwCJpBYZEseAbn3sd9TluTIQrnfoko+tPUVhDGdgTgfhlu123TAx1IVyEoJej9Gfbk0Sf5w5fvpXt1yknR4HWpZekkMOyULOM1O13+tdhU9zngL5r/aTtJbByI3mPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKsh3bLi08sfHzY+uHYfC4lX9+MNcM3gLpiZCj/W7n0=;
 b=RiEIotZg4A9yqlt+3D7DM/PU3NsUWADBgsOR15Sho1+Lc2qVZkd6eDmvDvcLn7bGQqz6pZ6gAbEJmMHptW/L5PhEXvLx2Yuz7545mSR3MdSqDQwrsYAUbnpLNnx7MsEAAPmNrho91tqLPShvH7ptzu06fDsJh5YgdB2tE89e+5mZDUL6rNHpNq6WNse62Ky08wrYC1xNNtbHoFHHxuT4qS4q87BA2ohwK6yCDuAyblMFUTpCIdwxuphOx2fSTXJmm9CHXjhuRFv8abCyDlUgLvB7O2Md8bYABk9Wf1prnCRcT0s4OCbysfoq6PNPUSuaPSPHJoBke4fiD/cUWD4GLA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AM8P189MB1314.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:249::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:43:02 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:43:01 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [PATCH] python3: ptest: skip flaky test_shutdown_no_wait_max_tasks_gh119592
Date: Mon, 26 Oct 2026 12:42:58 +0100
Message-ID: <20261026114258.28892-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0441.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::14) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
Return-Path: pratik.farkase@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|AM8P189MB1314:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9b82e5-a2ed-40d2-aa5b-08df33564a65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261021121427099003|11063799006|56012099006|261009223027099003|261022105027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: y/wyUrKj4W4s8tenjb8jauY0kiFoMKVlVpTlvV/CWyjkgHJ4QzR/p8oixxicH1o2mS1SFknmrWZPhzcJZkweBtHcV3sRqne0GQg9nP0Pybv8HfRcpwrYVGQ1ciV+q4Jc91qkQfBzY43wJYOuF3tlhsDzG4704sLeLH2vZoiuUbQl5xchyNf7bVpTyOSUGwMs2zosXNybHFUffEO1ZudoN2QiuZaSFEt7JrmsG2JUKdaO6YlSuZTv47WvyfS8Vk1GrU3kU7d+QUbN007hjuPHNNORjD3TGyaXFYolkZvcjZrTuDQAMUUPn5HuDtfK3tsz7/qx/RizqkSkcpOwyP4vdMcZQkq0B8EVJ4IHJB4HcYe6x3LON7GFKWRr3dbzGzpriUL/Equ3hjPMxMXgb+K1ujV9oXYIwHnL8qVafSjJAw7GGIa6qLGxJpSv76SX2SQfZjmfquAXFjw+whY7wWczYhxa6wg5wJw73IHkVB/5OPEnyFe5zfN81pGo6xt1rHf1oDxtJyrVhlcDzYSeySSo2GGwMYClhUxX7lekvuvx9HBemFVHPGQTxVYQyjECosOzpVyP2tpqlAxWwebmsXe1pjr/RmsRFYgUvQN9aKoq4uvX9HPcOHd/xcADyG+g8C+aq9PoJhKpzIK8PKIa6PgywbJoQI6H6iIJjfhGAU3DMa0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261021121427099003)(11063799006)(56012099006)(261009223027099003)(261022105027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v64d95gpJhv792jCPK30yF9EvuHtJhHjmmVKx9toR69F7fDw7W9QMjI8iwUb?=
 =?us-ascii?Q?Ne7Ifn6uhteN8ChQ66y4NirkyZMfpqw35qY0J6Ry/5f3UECRbBt/I1WGCjhc?=
 =?us-ascii?Q?ZyRc8NQ7Gg5RLFm6hRFHH5NQ9LCjcSZjhAu2ve5hAUC9wdxurnrpGMGrE4zD?=
 =?us-ascii?Q?ftzCfiy02t/ECBmUTXYOqEG+EbWnSUsVaNPUKEGOxzz3YVfnJxsJ9Qa4CmsK?=
 =?us-ascii?Q?+0vrVggK8m058Hd5HFxHTrvPLABbdeRfUzs8yKNHn0g1BOCfFMJX9/XGeHdQ?=
 =?us-ascii?Q?IJGByuo1qLNS/2v5oTnu6/zkPsBNMpoqB35ttR7D3EQgCe/dfMQU5FyVXMlF?=
 =?us-ascii?Q?cFOEhj1O13pc3a0mRcH5MBvKjPXXCt1wrz6KiW9qQZ9KbfUz16Yn+k6KCYQn?=
 =?us-ascii?Q?QVqtB0Hf4lqfZ7tLrZkHSBdOpn2J/hWE5KxDmGBXF0LBDnUAGmH30NIPUmkr?=
 =?us-ascii?Q?sIbifnF0+0QwQ+T0bLkYVOCh8eQVUqtDqfJotitdLdCTCCIYRCK67C8nSRrY?=
 =?us-ascii?Q?13ADABgerIH/rHcdwjF2lssqXjs1KOqxKpHlQGIK5h4L48ssSW/lWBaKbcua?=
 =?us-ascii?Q?U3b0yzUZ1W+JF6MwqrKs2w1oTZ40jwrKC+CuzORkJ1bzX7ysvQnESx+kAcsM?=
 =?us-ascii?Q?6bqpGl7O3jMfHEzA6VfpuPZCLBM5vTAlWbBb5NwWFXCV7CkqX9bP0gQGlqHE?=
 =?us-ascii?Q?RWOE52iNFwlDU09GMPjG+aaXXVGS6sHo9zDY9QgZBzstwca8RcLo0BrvR6lU?=
 =?us-ascii?Q?04kKZZJZZ8XznkVZXzpksphRmprQOE8L83My2gXGfEwJcEHNJFCsp9ULjBIg?=
 =?us-ascii?Q?X/09rDUwqz3IDcisxKlJrzEtM8dsOI4IJl+D2ZiQs9FAF/ocLRC/nQHqoEeT?=
 =?us-ascii?Q?XU+BuvzGPMyX88wLY5L0zrhRGz9d6R3fw0MS6Y7FW2MHzSBu21J8w5wMy8l7?=
 =?us-ascii?Q?ulBEJgLwM+qmicZI77Z/ElqoZK+df68nVwl5Ni7sMld3HC1XxEfKPMPVRguW?=
 =?us-ascii?Q?Y3EQr0lkAoMdf1cyijATb+kadiN0fxUl2XmIeBUTNcqQF37UEoSLqAlnQe7d?=
 =?us-ascii?Q?Trh1mxD0eIO43pQ5smvQaVsnx+i52pbfeyXpSF6E0Zhtze/0cham+k6Inso7?=
 =?us-ascii?Q?SK05ER3w5SWnWxJiablX8Yts4Dd2ZsHOlWioa9sYimBT5BVoX9lXI1YYbvPT?=
 =?us-ascii?Q?CFUh2k8NwI095UkoBfcNGpv3mwPPj/pwJUmt9YK86/AJqKVbLBEp1RUEvpYY?=
 =?us-ascii?Q?WCrnMWEsik+V76KdItZT/68I9urkUimqVsv1NclYCeH2eDT6v964b6VpDQzi?=
 =?us-ascii?Q?7vxYq15X8fONlwPodVNTWUDAdobq5iDYrFxnbT4jyRbZNpq3PY/09RpJPF7G?=
 =?us-ascii?Q?OKivIxlLD0JzyUDb1X7596C05mvNdvpXCptW+Kz4Gtm5U+O2w6llIJot9aFX?=
 =?us-ascii?Q?2lhRye6vPsg0a+CmLJTD7+SuZUz+nKQBPk3/3AgURLS1YPhatCByw/bTqmzv?=
 =?us-ascii?Q?0P6Ogz6lPWEaZTPHnwfasoDmvt36gJhZGH0QsW1q/x5OAhdxRLB8rkCpZsxu?=
 =?us-ascii?Q?5S6pSi2AZUmvRv8uV80IhEg2Ghad/mqXj8P/UeZoaAGbwjNrAKoyB1bhFSXx?=
 =?us-ascii?Q?acYKDm50wFNLRFvuGD2HiMODha2VAiV4sg5vkDC/M+1+2hbJazLmQCd7U0qV?=
 =?us-ascii?Q?zoZH9h6n8O41w11z2CYIictFsbX8f45PWeZskppZNV2wPsX5MXwQI8X/uxGN?=
 =?us-ascii?Q?eR+eXtIdmQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9b82e5-a2ed-40d2-aa5b-08df33564a65
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:43:01.9362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RfP2p3vZgoX6zjWHYGhKekbnNGxu6baP454AaKAToe9AK0hVN23bM7IHXz3H/x87YIPAn0i/yQAMwrOjOH7Qqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1314
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 11:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248675
Content-Type: text/plain; charset="utf-8"

This concurrent.futures ProcessPool test starts a worker and expects it
to be stranded within a 30s thread-join timeout. On loaded autobuilder
hosts under QEMU emulation (seen on qemuriscv64) the worker process is
slow to start, the managed queue get() times out and the join exceeds
30s, so the test fails intermittently. The upstream test is inherently
timing-sensitive (CPython gh-119592), so skip it like the other flaky
timing-dependent tests.

[YOCTO #16466]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 meta/recipes-devtools/python/python3_3.14.7.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-=
devtools/python/python3_3.14.7.bb
index f917edebd8..d89da0431d 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.7.bb
@@ -353,6 +353,17 @@ SKIPPED_TESTS +=3D " \
     --ignore test.test_asyncio.test_eager_task_factory.CEagerTaskFactoryLo=
opTests.test_staggered_race_with_eager_tasks \
 "
=20
+# Intermittent failure under load - this concurrent.futures ProcessPool te=
st
+# starts a worker and expects it to be stranded within a 30s thread-join
+# timeout. On loaded autobuilder hosts under QEMU emulation (seen on
+# qemuriscv64) the worker process is slow to start, the managed queue get(=
)
+# times out and the join exceeds 30s. Upstream test is timing-sensitive
+# (CPython gh-119592).
+# Bugzilla YP 16466
+SKIPPED_TESTS +=3D " \
+    --ignore test_shutdown_no_wait_max_tasks_gh119592 \
+"
+
 SKIPPED_TESTS:append:libc-musl =3D " \
     -x test__locale \
     -x test_c_locale_coercion \
--=20
2.43.0

