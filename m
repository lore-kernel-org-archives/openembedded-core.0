Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F34FCD4F52
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 13:12:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15817.1727269922166218034
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 06:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9998c7229c=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P5jhwT001242
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:12:01 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2047.outbound.protection.outlook.com [104.47.55.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41um55214j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQW1qlFWZRgseTq5l0KywYJRmYQT4Q2Qg+71lSOuoz5vRF6Zs/XYE8JNrLwMAcgMfVDrYnd6Ka0vPA6Z+XnvQJRFNIszzKOjrgDK490xGqvNx5PAWALPslpVCA7YxJ4vxIzmo+HgxytxFquz5HyWY9K5bqN4I+sRQrJLqpvCsXm+Rd0/QpvxIX4dj6Vl5wk2D+1SihIR6fCzKAJQSV4YQrnnafA+W9LsyYI1NPK/j7JqXq82xbMQ83yWHjVbXNn9+Vi7aBwAKp0TNI7ZE01zGJKMhytETXD7FfRHhwp3l2eZprNEQS+NUoFIXPZrhH+18gkxON1J7384Ls0WkL1XsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISC94G8XeB6xk2apb4bCFK+6V8veeqNlRDsbO1iR46Q=;
 b=YfBNifcjFY416hNzULDpIy/jBAK1lwzsYM3Br5hArRzQyGshICE9Cvtamjc+3uSD03HtZQRYuSmcZHf8O2M5ZheP/uCmkUlz79id4uJW48eqDF/Miktw8hcyKp1ix7zyT407nlttRC7p9YoA4yWYtaJy7fUevv67JAZg/ND/oZb5wRxhD8JG/ofq8rRdQz61/YmtgeqnKHUhOc/lJFUy9DJ0U59fjD4M5ZDvsFhfFyPddqrYjLn1EJuGBXlTtVnl0Tmu14GYG2vqukIF04I+05wHxaX+ZNLq4BYluhOrKPcvNqHuJFs2d41rDqRljjDaiTI6dktPn+80ZRQn/5IXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 13:11:59 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 13:11:58 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] glibc: stable 2.35 branch updates
Date: Wed, 25 Sep 2024 06:11:41 -0700
Message-ID: <20240925131141.3655587-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::9) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|CO1PR11MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f719849-2386-4d3a-0c9d-08dcdd63a2f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?J2iZCQTqdLuCXEWDW0TbUaydQw/O3vAqMdjXchQ34i+LHwaqSHtbzhvwSa1W?=
 =?us-ascii?Q?pFJZNpODGxrTY075rZwNnKpVA1zonN4YAmBA8/7MvXs/78t84u7ZDe5FVjy4?=
 =?us-ascii?Q?5h4L6gsK1ZyRZMAH3QGlum5TWNEc2x+ayAwkU2SWF1jicRf4phgoiEMoaEfk?=
 =?us-ascii?Q?pxvVrG51jmGXvbfdTkPyQcD+evOiLxWHW+jIhupvpmWGeTIXTts4wv1FwcVe?=
 =?us-ascii?Q?GOPZTa3lz7C9NEezxlR1AQgUPSf4QpWpTg2s+0QbFgBDAaqdAiamO5eOZo9r?=
 =?us-ascii?Q?4SusGaIrOMiUqiuoebswASmIh/NuERETTemrw9KN0hrQdlk1oqqOnD5EchEr?=
 =?us-ascii?Q?Yo++jXw5vjQtduZ5JYcCp5RfDoPrczMEJ62V749RnPgvPMw8dMZhfaS7E+NW?=
 =?us-ascii?Q?67i98HkmGT6h3cODZ2oogmZSRLpCDi279TX8TG94+otuu1lOo0HCIy0KyKHE?=
 =?us-ascii?Q?7gH7liUm9/mBFvGMo6oGP8OcAEvm1w+casOKe6MYWw6jrT0MJlLAXN5i62AV?=
 =?us-ascii?Q?ePAZwmRZgTg21WQlnfSX3c0PAvZ8O03Qm0/kbmsgNcaiKRf9DMfV7bmXBnuI?=
 =?us-ascii?Q?aV5hQJ8kmNHCqsHfwUKFYv4Flj7ISug3PMPYQvL/GtMzcPQ5Acfhqp+AQ4Y0?=
 =?us-ascii?Q?5o0hHa8zhZdBV5TO55q7JydKSqfvAyBnYxSohNLV475AAGH3D9168qoYusYG?=
 =?us-ascii?Q?wEB+Pvti26qhMywGN/oPG4uO61j/czKy1CVQPIYWi0MtIAosTG9HMqXQN2sI?=
 =?us-ascii?Q?44HfCMOJmP0OU23pcbK/vWwjuVbTpVR+Ypdf0bEWpmDDtYWCNSgJCcL7dGdC?=
 =?us-ascii?Q?lF2KxG3quooCIfIbFF7UvVmJrMAmdJelUE/8bJfb6IzOvHhhy72a0J8TdNSu?=
 =?us-ascii?Q?ije1PGMG5p1m4b9tVfUhOuFyR5qC3Ano3Tu2yl6y1OaX0uWp0EVifq0VN7nx?=
 =?us-ascii?Q?F+O+LEaEOd88vAP8eygRAo8U0nEvJigC/jRf9gW1Z+0OBJesNzOnT85sS4iX?=
 =?us-ascii?Q?oqDbi9P5jHaKcZNboOAEmoGOgMQrwcuaZpDtE21DF40buVqKClZI8DS13RcX?=
 =?us-ascii?Q?DHbcwoiZif3aP6hvZp+H26K8JXzIlCHg5WMHfJvYhXUnikj+g329IHHJNvxq?=
 =?us-ascii?Q?eJMtP82DIGxNpjmepPBAa7IP/5F9aV21vuYfB+0d11gr/psKVJiD+WYsKJg8?=
 =?us-ascii?Q?MawmbrHyyBP/X4Df/magscjotp8DhCtx5XoC8vvyRCvyQAQytHrT5TFyheBu?=
 =?us-ascii?Q?E8sgzmJEn7V7w8nEYeKXztuQEgI/UESi9+5RMCaRwTWRvwQo2CIxuertNzRO?=
 =?us-ascii?Q?cKvCe+sUQ95C4gD0M7uKsactSsaQtYhC+mcrgoH5e8LuaR3nn3P65CIr1wWN?=
 =?us-ascii?Q?tMtItGWAoORQtEGfT1WYZJw2RmnIlrvMlkmwHNLf4a/Dgb8Z1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?medr4OR8pYhl0iYc/JLmabhxNrbvyG0PGcPDJUX0z6D5q67HAfF/qyuxS0ke?=
 =?us-ascii?Q?BWgxDEn2yOK6a3h4VGFhhRxUAMWscBerTdi+bK+uXxzbS5XtOfTZzKfWbJMq?=
 =?us-ascii?Q?O0Km1FAXbWwlyDG+zPSvR/ANoK3BlLzXxOVgfO+APV1BpdHdh9QvfMmn0FhQ?=
 =?us-ascii?Q?KPi6e7SFVZPnNKdP9AKdDaRABOInCYzF2f0xbJERT9X/yoHpnk8IMgNRmRGr?=
 =?us-ascii?Q?MwExhzTQxMfji5QwDP+EBYbf9/07Y28vN/KucxPhHmJqf9+zqmzUpgyKTa2h?=
 =?us-ascii?Q?QacIWGWId8EgUIRHqpBm+0YNZbtaJKwBhkzTay1dIiM1B75SL7xdSvZgEnU2?=
 =?us-ascii?Q?IkE6LRhtSLCTJaThrJljqEYvFdUo5ZmFxcxMmcA7xQggxtdk/bojSfMtPKzb?=
 =?us-ascii?Q?g29eGaV2lUqtxX1W0T0Bv9bz2fxJaRyiv866jeKUmReBuPQhmoVM/d+jdulr?=
 =?us-ascii?Q?qL5N7PROZDaGc35HQvL1QNGA6ppxdba5YEeTR/U9hIvBzr4uw3Ny5S6r1Wj+?=
 =?us-ascii?Q?4eScy+VcrntmZOREtsJjHMo3rJY/yNZwLHzV8zTC6EeDYbv9cxPzAIxlWCjM?=
 =?us-ascii?Q?pNo5roSyZgAg5OnBMr2u1keXEmInRm08dlUivhro/KwClArLEbXilxbK6e9t?=
 =?us-ascii?Q?s8I051QF5Lc8P3MQ3o5VeHjrciQpqTHGKjCwRM1CiSgGDlgQA+0wzJoy6kK1?=
 =?us-ascii?Q?m9sXnvQNvM4RTVN+7apvNqOTmqKzOG6WjsYZDTB8xx4yRbHePlx/0deCqhIM?=
 =?us-ascii?Q?CR13F5AiWRmUcl7GnCsXiWUrIHvPVGBIZXqwvaYGOZdNtUIz9V2n13hErQfF?=
 =?us-ascii?Q?0awZPkP1mPoEe3llY6zIerIZszNHjssjrxb2Pjeb41ipYVotHwhdyv6YIPiD?=
 =?us-ascii?Q?MAFZ5Qq35Ct7fMwNxdz3xZBh2xtAZ2/SKbN6WOltfGKyelsnAY/e53mslRt1?=
 =?us-ascii?Q?9nJsXWGvdCz8vEgC1+8vWfChEAFToNaXuOY/kDcO9icr8l1YXdsvVidvJSWY?=
 =?us-ascii?Q?vC55ECLM4kk58CoE9sOO/Q/SD+OoklDrRkb0WtojZXNW7kBWVj3iZEMeGb/i?=
 =?us-ascii?Q?5xSbaRosj+Q9NQzijDO0scO2IpTYDImkeXabFq5sVHrqShCuf4oTZG787+59?=
 =?us-ascii?Q?8AUh6OdIDbla6o3w7nKqTaXWHBOjfI2DSsmXU8k83BSS0grhHMzV2yCWR/9V?=
 =?us-ascii?Q?ARgqIK7fHNhDCYTis8UUgx8UaHMlaOuZLK3wQYSFA0BnDWwVRDBjX6N9bIUu?=
 =?us-ascii?Q?IjlzerhTE7x0f+5RAhyXOmTZovjIxqIUQr7U8K6Bi9XLjyqrZqtc5UsbfoQt?=
 =?us-ascii?Q?S8kYufCE+VF01h7DtsQVHQGXwoJ3f6HhLdJPKUpHF/Ad95RuEG6pXY8PBZq4?=
 =?us-ascii?Q?YLNGB1HsP9vFxSB1HbA7X/GpogamdXourQ+RofbrVV6yNPkwcyqlLW5uhEjv?=
 =?us-ascii?Q?IFFoWp9hXOAgGxx5FoMbVW/r6f29nTchC3UsxzwUKpNsEOkYHoshEJbdbnK/?=
 =?us-ascii?Q?Xz5EAtDbyGwud0ig1hNUVQisqTcffptDPxXCyjNnnZUw10pKoVs8osahO/TG?=
 =?us-ascii?Q?gB0jRiBn9YtsZEVGS93lMV1O1u+fdztR5+c36l9oe1kM5VA4Bmw1qGUcXHdr?=
 =?us-ascii?Q?0A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f719849-2386-4d3a-0c9d-08dcdd63a2f7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 13:11:58.6856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIxOz/0/i783CTlrvD5wA+MiQGm5N8XQNtTIuxDxQ7jS6kGzUL46+vpN3uBWbrMAkfvS6InHmrxZt1IVav6B9PjPhNiOv2pDBRikstcU+CE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5057
X-Authority-Analysis: v=2.4 cv=Z/q+H2RA c=1 sm=1 tr=0 ts=66f40c21 cx=c_pps a=2/f09Pi2ycfuKzF0xiDRrg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=2HOXcNS-yM-1z2yLJUUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: 1w30RLde7gV9DUJEZdbJsRfsTZZCjXjd
X-Proofpoint-GUID: 1w30RLde7gV9DUJEZdbJsRfsTZZCjXjd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-25_04,2024-09-25_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=740 phishscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 13:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204953

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Below commits on glibc-2.35 stable branch are updated.
37214df5f1 libio: Attempt wide backup free only for non-legacy code
09fb06d3d6 nptl: Use <support/check.h> facilities in tst-setuid3
507983797e posix: Use <support/check.h> facilities in tst-truncate and tst-truncate64
bcd0e854ea ungetc: Fix backup buffer leak on program exit [BZ #27821]
e930b89df7 ungetc: Fix uninitialized read when putting into unused streams [BZ #27821]
a3db6ce751 Make tst-ungetc use libsupport
ed9762fdbf stdio-common: Add test for vfscanf with matches longer than INT_MAX [BZ #27650]
cf71d2189c support: Add FAIL test failure helper
5b4e90230b stdio-common: Reformat Makefile.
3c64e961ff Fix name space violation in fortify wrappers (bug 32052)
ba003ee5de resolv: Fix tst-resolv-short-response for older GCC (bug 32042)
5a1d0633be Add mremap tests
0ff91d3961 mremap: Update manual entry
7459b6fe47 linux: Update the mremap C implementation [BZ #31968]
461d0cac38 tests: replace system by xsystem
041ac9dffe resolv: Track single-request fallback via _res._flags (bug 31476)
820a750bed resolv: Do not wait for non-existing second DNS response after error (bug 30081)
4f5aa1d2fb resolv: Allow short error responses to match any query (bug 31890)
a180e82837 Linux: Make __rseq_size useful for feature detection (bug 31965)
f8a52d39c0 elf: Make dl-rseq-symbols Linux only
d36daa4c01 nptl: fix potential merge of __rseq_* relro symbols
602fff4efa Add AT_RSEQ_* from Linux 6.3 to elf.h
c7cd626538 s390x: Fix segfault in wcsncmp [BZ #31934]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index a5903bc5f4..dc18d20dd8 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.35/master"
 PV = "2.35"
-SRCREV_glibc ?= "72abffe225485d10ea76adde963c13157bf3b310"
+SRCREV_glibc ?= "37214df5f103f4075cf0a79a227e70f3e064701c"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.43.0


