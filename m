Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2689.1792484786121013839
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=ef0P0Ub/;
 spf=pass (domain: ericsson.com, ip: 52.101.65.54, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5Z9OfJJlYu/kJVM4UILhBrPpVosidCKlBHqm9rWWvVmQG/4GHiWKCY+xZBpMjSoFwJ20YQ+79Jd9phwWxiszeHaKHmRL4oATNOLixqxXG1TLnzIaGKxKp/ZLoEIOdqGBBa26uaHnEM248MoTwJ4re++AlMRytfMRV0DWcmwRhBHkAQ5i0M1i1k79sPKRSIh4rb5xv1wDtRwdQFsqaWHW3S9/uovTlRQxyreCa4iueyoV/YFoJK11yz0MRYPbIkPFSUIOp/W2aTlIGCA+KsOmBaWuCgkeewaz5xXnDJhOc3VHL88lBsSAYQeJPOO4RkTPJ8sTNTiitjU+2iov1ObwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTZJtFq/4pzFIgFpQyiX18EFtWP20g0JHZ0XREDUEMw=;
 b=Q0tnKbJc9aOhKyz/aiS9Cl4dgd3HV9/5Ox+1elyujr0ZJjvJDLXv+af93a5+oF3GOK08r678dExnv9CjGBTQdzxrAf1Y689xUpGhwh3fFZYIU59HYTDljcit7XxZEIZpIJBRiVJBnXm3FqKGSTAflbLST9TynMXN1wmQi2spDZORAya1/gBCXMtZIVAycRRWITCqF7rDqaQVXrftw7t/yJTdETtxFldVMIcuXCSS5V7O/yoUXoASw0iJzqdpZ/1nlKDTy2fdTAXGrK3qkdRHMZps+Ic9iQo5UfFUSgoEYCEugD4H5XtjJu5g2zNOM41q4Ud5BABUpUTJTJ8HR1gOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTZJtFq/4pzFIgFpQyiX18EFtWP20g0JHZ0XREDUEMw=;
 b=ef0P0Ub/YbTP6VZ8ZcIKIl6nPYSRh6yFh1hcfEIFvmymkQRHN3XJOD4kB8XvXnQ0sOKSFduQDE0HH8dIjObYsdjjVua9oJU93qu6eLebd/K4NHcfx1LHEZ9pnw2dGdE8i8vQr9Yh6sW7qEFkyVU0A1OImwpxntKoOI74yJQsmL7wCAsTZRv7GklgWHL4Zo2fUk08argD6+YE2SjpUy2cblEFYNArv5aHWak7jYyRv74VvgPNwpH3wiDhfyWmc78teRHWMiQnINRkKClfecKWbzmKS8wvazW7flM/Litc7is3HNS1eTRPUl+obgbjnl2t2xDKNKxAA7rQomo/1Ir3wg==
Received: from DX0P273CA0054.AREP273.PROD.OUTLOOK.COM (2603:1086:300:5a::19)
 by AMVPR07MB12283.eurprd07.prod.outlook.com (2603:10a6:20b:772::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 08:26:20 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:1086:300:5a:cafe::1b) by DX0P273CA0054.outlook.office365.com
 (2603:1086:300:5a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Tue,
 20 Oct 2026 08:26:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:26:18 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 96D5C95806;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 66CD5700E7CC; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 1/7] xz: upgrade 5.8.2 -> 5.8.4
Date: Tue, 20 Oct 2026 10:26:05 +0200
Message-ID: <20261020082611.3115623-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|AMVPR07MB12283:EE_
X-MS-Office365-Filtering-Correlation-Id: a149be20-4840-465c-a06d-08df2e83d060
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|260925021911599003|261009223027099003|11063799006|260925022911599003|260925021311599003|10067099003|18002099003|22082099003|12006099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info: IG8uzKccGXgvfy/xfq/WLtrHzPAK2uAmEG2DOoGpJcxz5MuRW5lYxy2FCXIXVefIWdvPzXNgcqyNI2O+zFIf/Dxzg6joIVisl4EJO1khJUpnsBfDb6PViW125v6Sjfjv/ci40dy9uEEZU82lLPJ/mzAlgODtGUrnm8dHicVuCHXEURBm09EqqgEMnyLPuD6dJWScCpP7utrWNTSIzey0qb4z5S5c3ErazhFhRqIlyu09Zp9EEDAE9pbEsmGYtRLpNZ0TQlCNAvzKjUZavvwpxtNBM5q9ixC6HpN7TSH26sK1pwchBz4maD4Z6I/JiMKNrJVg7rcUF5ZiHgHgg2VGdXke7Eq+YbOlugjWK/U/KbNaC50Mr5RHOO+Mx+GLOM/Layk7jmza2N4dbJ4WxukQ3SG8Li6c+Q6m5edqVAkJgwiPYZ3Uky9TUHt7EN5ZgzHvOlyfSUBmqG1/wqDJ+WEUHK47PnimyF2aU1OJFtVhuenIdtQVMj55wwjMWLKkUMNfp7fuEkX2HQJuKHIiv307jS8wvcGD5Vh/MHNSJfFFFWPkz6x6mXS7p0O6S1xHPm9mVKckg3NLG3l9llRCQf3U7l8yUdmPii1YHhHTDOtexzw9zPHmFquJGCSm0nuyqI/gIkgatU8jN6PqZ+Zz96uamiERbUr7UOoLU/aYK0pLAu0BrkPDk3TXKbZw5JQv1zaaAgpitszbN/bTZG9R9JL0gA==
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(260925021911599003)(261009223027099003)(11063799006)(260925022911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(12006099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cvYKxd9bta01iYvPH0up9a9PE6nHFn4//pN4+yHlZG+BHPI+5S0D6RhmlPBkQlsrA2VOGhi2iMQBjG2iW5Qh74RA5y2fImhZFNKiKndTUDkaoMnK/DvI+6S7Fh0ly2A6TXQEISexHyj4RNubZ7T2oe61uLRNGxMA2nUn40qfqDO3d7sLNgi/HoOYhNBvjlS4l7MlW+fYO0I/7ZA0S1SmlS5l2gntZEbDvmecX96CFJW2bSW9LYAybxbm+DW7Q/C8DWvhl6D9GukAPveXGWKKiNkHLiioWi647Be4bXGlM4zFmImzgDDwdMGPzEMmq8Kd8bPdGg3TQBEs8SFqtfkFc1ICGlWY7zIaMmbwZLgG3G8iu/RqehN9saubr3kEVxfpQV43SwRTlp6tw583AZeB3MRQSzAsV4RYBgPeMRUtQQovUSA8EkT98YTJLajeqIEY
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:18.0814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a149be20-4840-465c-a06d-08df2e83d060
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR07MB12283
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248250
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Security fixes in 5.8.3-5.8.4:
- CVE-2026-34743: buffer overflow in lzma_index_append() when
  appending records to an lzma_index decoded from an Index with no
  Records
- GHSA-5qpq-xqfv-j9pg: invalid memory access in the alone/lzip/auto/
  microlzma decoders when reinitializing after a failed allocation
- xz: use-after-free showing an error message for --files/--files0
  from XZ_OPT/XZ_DEFAULTS, and another use-after-free with --verbose
  when stderr isn't a terminal

The carried backport of the CVE-2026-34743 fix is dropped: it is
included in 5.8.3 and applying it again duplicated the check in
lzma_index_prealloc().

Other fixes: lzma_index_cat() performance/overflow, lzma_memused()
misreporting, lzma_index_dup() check-type copying, threaded decoder
progress sync, Landlock ABI 9 support.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 ...buffer-overflow-in-lzma_index_append.patch | 66 -------------------
 .../xz/{xz_5.8.2.bb =3D> xz_5.8.4.bb}           |  3 +-
 2 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-o=
verflow-in-lzma_index_append.patch
 rename meta/recipes-extended/xz/{xz_5.8.2.bb =3D> xz_5.8.4.bb} (95%)

diff --git a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow=
-in-lzma_index_append.patch b/meta/recipes-extended/xz/xz/0001-liblzma-Fix-=
a-buffer-overflow-in-lzma_index_append.patch
deleted file mode 100644
index d3918233ea..0000000000
--- a/meta/recipes-extended/xz/xz/0001-liblzma-Fix-a-buffer-overflow-in-lzm=
a_index_append.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From c8c22869e780ff57c96b46939c3d79ff99395f87 Mon Sep 17 00:00:00 2001
-From: Lasse Collin <lasse.collin@tukaani.org>
-Date: Sun, 29 Mar 2026 19:11:21 +0300
-Subject: [PATCH] liblzma: Fix a buffer overflow in lzma_index_append()
-
-If lzma_index_decoder() was used to decode an Index that contained no
-Records, the resulting lzma_index had an invalid internal "prealloc"
-value. If lzma_index_append() was called on this lzma_index, too
-little memory would be allocated and a buffer overflow would occur.
-
-While this combination of the API functions is meant to work, in the
-real-world apps this call sequence is rare or might not exist at all.
-
-This bug is older than xz 5.0.0, so all stable releases are affected.
-
-Reported-by: GitHub user christos-spearbit
-
-CVE: CVE-2026-34743
-Upstream-Status: Backport [https://github.com/tukaani-project/xz/commit/c8=
c22869e780ff57c96b46939c3d79ff99395f87]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- src/liblzma/common/index.c | 21 +++++++++++++++++++++
- 1 file changed, 21 insertions(+)
-
-diff --git a/src/liblzma/common/index.c b/src/liblzma/common/index.c
-index 6add6a68..c4aadb9b 100644
---- a/src/liblzma/common/index.c
-+++ b/src/liblzma/common/index.c
-@@ -433,6 +433,26 @@ lzma_index_prealloc(lzma_index *i, lzma_vli records)
- 	if (records > PREALLOC_MAX)
- 		records =3D PREALLOC_MAX;
-=20
-+	// If index_decoder.c calls us with records =3D=3D 0, it's decoding
-+	// an Index that has no Records. In that case the decoder won't call
-+	// lzma_index_append() at all, and i->prealloc isn't used during
-+	// the Index decoding either.
-+	//
-+	// Normally the first lzma_index_append() call from the Index decoder
-+	// would reset i->prealloc to INDEX_GROUP_SIZE. With no Records,
-+	// lzma_index_append() isn't called and the resetting of prealloc
-+	// won't occur either. Thus, if records =3D=3D 0, use the default value
-+	// INDEX_GROUP_SIZE instead.
-+	//
-+	// NOTE: lzma_index_append() assumes i->prealloc > 0. liblzma <=3D 5.8.2
-+	// didn't have this check and could set i->prealloc =3D 0, which would
-+	// result in a buffer overflow if the application called
-+	// lzma_index_append() after decoding an empty Index. Appending
-+	// Records after decoding an Index is a rare thing to do, but
-+	// it is supposed to work.
-+	if (records =3D=3D 0)
-+		records =3D INDEX_GROUP_SIZE;
-+
- 	i->prealloc =3D (size_t)(records);
- 	return;
- }
-@@ -685,6 +705,7 @@ lzma_index_append(lzma_index *i, const lzma_allocator =
*allocator,
- 		++g->last;
- 	} else {
- 		// We need to allocate a new group.
-+		assert(i->prealloc > 0);
- 		g =3D lzma_alloc(sizeof(index_group)
- 				+ i->prealloc * sizeof(index_record),
- 				allocator);
---=20
-2.43.0
-
diff --git a/meta/recipes-extended/xz/xz_5.8.2.bb b/meta/recipes-extended/x=
z/xz_5.8.4.bb
similarity index 95%
rename from meta/recipes-extended/xz/xz_5.8.2.bb
rename to meta/recipes-extended/xz/xz_5.8.4.bb
index 5e7ad1fc70..1c0e972c39 100644
--- a/meta/recipes-extended/xz/xz_5.8.2.bb
+++ b/meta/recipes-extended/xz/xz_5.8.4.bb
@@ -26,10 +26,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd38d562f61121=
74de93a9677682231b2 \
                     "
=20
 SRC_URI =3D "https://github.com/tukaani-project/xz/releases/download/v${PV=
}/xz-${PV}.tar.gz \
-           file://0001-liblzma-Fix-a-buffer-overflow-in-lzma_index_append.=
patch \
            file://run-ptest \
           "
-SRC_URI[sha256sum] =3D "ce09c50a5962786b83e5da389c90dd2c15ecd0980a258dd01f=
70f9e7ce58a8f1"
+SRC_URI[sha256sum] =3D "0014c7886930454fe8bd4228665b51af55eeae560ea135c9c4=
cd33f55b2591d9"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI =3D "https://github.com/tukaani-project/xz/releases/"
=20
