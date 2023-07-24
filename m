Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EFCC0015E
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 20:40:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.88])
 by mx.groups.io with SMTP id smtpd.web10.5411.1690231232263140200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jul 2023 13:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup selector2._domainkey.welotec.com on 127.0.0.1:53: no such host" header.i=@welotec.com header.s=selector2 header.b=JakuB15M;
 spf=pass (domain: welotec.com, ip: 40.107.14.88, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMbaktErqMFtNyLhgRdJOluChM6mBbVUiq9KdWNOXwD7aPtQpqZbEKeZXz/cQXiipIUwDVHkmHFuWsht/QnWhXKYXrAQX++4CD4SGp1nkAn53etDpdlAbt5RA/agG1bfIIbgM8nscfjuwyhCbqU7s5Ax1JLge7f5aR4+zKy5a4IhiLDf/DOgpKEyMHh0JKLyLOjUgaFJdSDGygRZPB713VgIl6W4r9anKPZj0mgfy3+E2WUwbmbMWS27QlmNKfpaecXXPP+mQFKyRkg0e30Y0J8lwL3oq6iwTpaZcCFBvos3bAU1tWJqAKxLF59rcFja1q3ikJvpQnUFtKisbYpKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kB7xyxUeNluQqbf3tJnadiXxu2/DCvjfD0ISUoG0+Kw=;
 b=MtitDG2qVuhF9xjeCD6jLKxyblMjfQv0e8ncABep/IwbWBpmfvtZ/+YCpw+SbC7bhsZW9P3ssEmo792TWtPdkbEo6uQXuoQLHGh8Q+Pg6b3Vw0cWeYrGdYDPimrQdtYzFSN71a32wBRyqPcrsdvivZFJUd8DyTLi/NQFCY314W7rCF5I597drKtc+fJ5Z+XU/UR7v5s8NE41VdxXDFGKovD5IdkLXdcEQtof2fZeuZss+KGdbGjbPOmEbvzsoJbMuoL3PKNDFjYStq2nXzbEqZCOYABe0o7YLtYqL50IH7kI/S4yZTsi0rYGTvGYbUaVcDTZvB6qRA0LN11tTsIxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kB7xyxUeNluQqbf3tJnadiXxu2/DCvjfD0ISUoG0+Kw=;
 b=JakuB15MwM06TcXmCHClZmGtF+yz2SJd+6OouQYtQI8AU9OWt7YnBChdumBMPwJh/4ccQjXY+wEyLV6WJ7M7qI6wor1urt+6vNdebcwNIhHy9klBYlb0vI6I7a5AGnnKj+KX6NQWTmkiI8WEewvQqRCxxbmjUFpH80oOUsEVKhY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7608.eurprd04.prod.outlook.com (2603:10a6:20b:293::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 20:40:29 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 20:40:28 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: Christian Hermann <mail@hermannch.dev>,
	Alex Stewart <alex.stewart@ni.com>
Subject: [OE-Core][PATCH v5 2/5] CONTRIBUTING: fix yocto ML link
Date: Mon, 24 Jul 2023 22:40:15 +0200
Message-ID: <20230724204018.352695-2-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724204018.352695-1-p.lobacz@welotec.com>
References: <20230724204018.352695-1-p.lobacz@welotec.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0317.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::7) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: 95bb976b-673b-4efe-8b3b-08db8c863785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	666sc3b3vSfRTiPeF9kTfDoyKd7JT2H8D5ZxahuFDVGx7saKjsNQSEjnuRykINZiqi3kr66C99kamssQE5D8jL+1Ax/HjfWzHnzCBDRsaUKsGviEXBFGedP8c6jCxZ0XhA5bXFGYMUal0NHGjx3v1Sf3z7txfeVNYy11hPEI3GEUpLJIIvQ0RK5qwGs6s3wCmtZOBg8kcL9DWAussGW0jDgluL3lYh84DvSORNZh+hxHX+njPFks3FMJkIDQzJR96Q/cA8dgDgesb7bLHse6yeJPIJDWFRySY1AJ5vI6CArqN8rlxhPIdHztCYOlAni3Zf48xBqtyKjcRjg3Fgu/9XJMKnwNhRcp9F9hE8u7ZdavTmrjwWk/h/u2+ubx88IGqQw/p8xpQBx0NE0zzS8Gvo7ukHMXj6W+7qNgzWwQPBWs5h2kHGc2rxJIryRY68tzHVOaXZI6i86rTlam+hik7bXKpAQ4LLPDmDeFYDkZY/tHhUfZ9ef0Oom4y4DdzfB2CHqNYvwX8lO+/1WThlLo+mqgIQPsFh1vzixdDktRhlpSroCUdcFJWNWSZUvIc2mBLJVyioneEwmcynwaHdr95Tbrbs2dAdxoI4BAXjTlQ0gI/+WUCaTpBIHbNyrsMVmm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(39840400004)(346002)(451199021)(66556008)(66476007)(66946007)(316002)(4326008)(6916009)(54906003)(6486002)(6512007)(38100700002)(83380400001)(52116002)(478600001)(6666004)(41300700001)(36756003)(8676002)(8936002)(1076003)(26005)(186003)(5660300002)(6506007)(86362001)(38350700002)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?teY1XTQc6+trNE+tPDECHylaumweb7rNjTG88jz+eRB5ossnlCXAZ08u4L2R?=
 =?us-ascii?Q?EFtjjuaT7vSZVEGhBem9IaopbXq5Ji/3myaPtMuTh/rATrlMCeCQTuwTt37+?=
 =?us-ascii?Q?97no6B0VBvmZ7evGulXr3K+dD0g+IorG1+CCOrS/ZuRWrlDzv31czfodyd03?=
 =?us-ascii?Q?krOkHen7w2+KwcgD2M3u+X1XIHfz2jQqV4eJgLpPVfxAMI0NSeWr7tIxFSHX?=
 =?us-ascii?Q?/5fb/Hw6CM/IzBt6lZ4pK5gAIDpEgvgX3YRy34jAHJN0Vlkb5kzDE1VV1Bup?=
 =?us-ascii?Q?j70CGEJ+kn5TwVmGwz09076rLVETcNWR37O3zlxFe6kMZ0iQoyT2WXNkRB88?=
 =?us-ascii?Q?4T3/717cTFLwjS3cPrGqljwxdeC3JXjL6Ya1KA9aNBjBCGFNRGxVO5ItNROb?=
 =?us-ascii?Q?R2hATo0kjReJ4s1U0qk1RpOK/ymdxjhlkvCDu5eLkDoCYitMMJ8UHpfWvmx+?=
 =?us-ascii?Q?fKP8oyyJnLTzhsoq5v0cyUx6URsYqKIVGc3AfMg1EDKHNW056YzUdYbTupH/?=
 =?us-ascii?Q?V80kFXZdXufmwbC3guRb3j7scy6pLIJrkluyxih18XyFe2SuncEx+4tlj5jH?=
 =?us-ascii?Q?6878mqds0PoQQvzCBCPqrhpR4uM0N3Bx04N2K8OMLRJm6Ch6xcJGIqFy1LYg?=
 =?us-ascii?Q?JJWg/JY+0/rfWaxQzzrfM6TJCOVUD+0f4Vl/FL0TjF/MngVVBfjcHgJFZ+Ky?=
 =?us-ascii?Q?eG/qu6hKbdjz8doUIsewoNZrSh445Gh2HIsltfT+Byv+C0tGtBQrgdOVQ76u?=
 =?us-ascii?Q?N9KWBxhK+yQtR6xAYtTlyHdNxVT6A0Q0Hz4m7QWsDxhTYvhi8pvPwCgxHVJb?=
 =?us-ascii?Q?OI+RKq+89OHr/+3z5WxaDc7Z4TWmtoKhY39eFdDqGCOy5g7xQhfpuQyzItrX?=
 =?us-ascii?Q?jDI6Ife/qIjN80lDhppHjBDFDGlB8qsThTvoBlBDzqEycrXJ7Upqx2Al2K4Q?=
 =?us-ascii?Q?HVHQ+KjJn7263uPX1l8t+hhl/qhZG9kFExK2qC9hgcRs0pa4gg1quPDxad8s?=
 =?us-ascii?Q?tyf1NFEfvGJdwZg/Ta3xkAp3Xd64cBpKy3BDsV+LFwrYw/E/bJ+r8tDpn5qj?=
 =?us-ascii?Q?LFYG/gwHRBIOizAHuTNn43rREQyci+FwlJlAOt+G+3PJ+N5Eio4Sed4jD6qU?=
 =?us-ascii?Q?pz3ENQ057GaE+29dHZBIc+HWG/sptFqMislrWinj8zpmuABolv+5hewYkXE9?=
 =?us-ascii?Q?2WfpqVKUvf7F85EOMER4pJ9AC0YL87yTVUGOsfpryk2blp6Nj7oxtMk2qMR0?=
 =?us-ascii?Q?cMu39xHVqkcKtw4udhI8HeP9PSD7xZOnKYxNLm/K9Gui0jO3F4YnbSI5wnk2?=
 =?us-ascii?Q?IxM8abZsprsrjOVfmSwGcvQNglRQ9FStJklP4C2r8Er9b8REIU1cNBP+HHfC?=
 =?us-ascii?Q?qDtW8x4Tv9QGMnxIAAPJiH+rD6G83Xgk7/lhZO55sQ7fETxvScg/iPXbYkax?=
 =?us-ascii?Q?O8sBdZED5YqjJfy3XA/4tUVeAkZUAA+8G23FHMJhj4j9fYSoH+xrmqxgzel+?=
 =?us-ascii?Q?vjaInGSmUZdMTrL/f2IE2YM6PD6KwSdPB6t1o9DWdt3fr2meMl2slOoA4qUQ?=
 =?us-ascii?Q?ZsnfSMWsDZZi57D8ZIf5LGO/Gy3v/tNF+0Ivueym?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95bb976b-673b-4efe-8b3b-08db8c863785
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 20:40:28.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BheYx27RDaxMmgvd6s9L5nrw/ds7G21PCNfOsX5cKKQp/ex3rN0ryYxibImTJk4MfT4ndqYH8DZEFyBum7qqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 20:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184809

From: Christian Hermann <mail@hermannch.dev>

Signed-off-by: Christian Hermann <mail@hermannch.dev>
Signed-off-by: Alex Stewart <alex.stewart@ni.com>
---
 CONTRIBUTING | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING b/CONTRIBUTING
index 8da0fc4..ea6b4ed 100644
--- a/CONTRIBUTING
+++ b/CONTRIBUTING
@@ -46,7 +46,7 @@ changed to fix multiple bugs, that should be multiple pat=
ches.
=20
 Opkg-utils is primarily used by the OpenEmbedded build system but may also=
 be
 used by other embedded Linux projects. For now, please submit all patches =
to
-both the Yocto Project mailing list (yocto@yoctoproject.org) and the opkg =
mailing
+both the Yocto Project mailing list (yocto@lists.yoctoproject.org) and the=
 opkg mailing
 list (opkg-devel@googlegroups.com), adding a subject prefix of "opkg-utils=
 PATCH"
 (this prefix is necessary as the Yocto Project mailing list receives patch=
es for
 many projects). Also make sure that you use the -M option on the command l=
ine or
@@ -57,7 +57,7 @@ opkg-utils directory it will all be done automatically wh=
en you use
 `git format-patch` or `git send-email`:
=20
 	git config format.to "opkg-devel@googlegroups.com"
-	git config --add format.to "yocto@yoctoproject.org"
+	git config --add format.to "yocto@lists.yoctoproject.org"
 	git config format.subjectprefix "opkg-utils PATCH"
 	git config diff.renames copy
=20
--=20
2.34.1


