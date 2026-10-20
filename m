Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2674.1792484789809585280
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 01:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=EgNSUHgG;
 spf=pass (domain: ericsson.com, ip: 40.107.130.71, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jIu6u7HnBWPRIqhbkFMyB1iAV3HW64DO8yGc0NrYX+ByvXC7ngY9/T9wJHEay81WOopD3Bmhq0ivkyDXP4oRb65xNRUWXgw21Fwsw7UCesle71ifwXRtjrOadxHnzlTiqf0a64mKoBKVzRgnJ+CFGLZgrnnCL1hvEWZA3Jp1lBlSXgnmg9nRYc/4rwIGykd1PIEkh9D2LRpAHxJ66IUBPJiwsucD1VQU80DKmJwtX7KJV9WOyKlgTNfE56tK7jdFzWYGz5412VMnYRjQLeG3ddqs77nAHxyAg07UNFSuqrXIMPw7/HpuhPfWnVVcLe0uGtW55UkY2YmNHV88c3TNvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gMjHvXTO5ntUvDwnRlNIIKI0JV9TI8HIr8bm9QMQQSI=;
 b=dwX/97ik5MskjDQHgxAjKEi3m8LNQtXwBW8iMdpdJvd5F4QidaNbAuQlyp9jqtJzXidK9FYIrbu6KDkznBffqqQh3g4NeODVAP/ZS2h8NorGXooD5poiH0OX8StW+dxp4EYXk6U0ehx3qvNamYQjM+h6rbRhw3tKkO5/Ujb7tPSx9S8Ms3x8lGtD7YJTJvIjsWjjXn/dwW/pkoqtQ3HDv+l1lFzJ62ULC7zDtM2teobFfygYFRzEbLBvNFqUBTAhxTIP2Bhel3jyE9NL+QaV1IqY3a67ob7ZgMHzwZUOGttVgWr0MKvwJ96Yk8qwUXJJEFK7+xK3ukJYoVzeza+Ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gMjHvXTO5ntUvDwnRlNIIKI0JV9TI8HIr8bm9QMQQSI=;
 b=EgNSUHgGr3u/Tloj0BahNZfVdMeEyDDyHphsPvarxRCYLWiLc+Rl26k6BGK0CbkAn/q9ZA3WWOY3ELLtUwZyord4AnR9hfvJRXsWxFs35HLejxw3cLmJ1esWxhWR1S0M+rKUZ/GDKugvVpbIY1TL+GEcDvP7XYq4BPmGWFmQUdtubcZf3srxLpBjq2NCM7ysz32pvu3JQ8pMGu8CDOr6Yg2SbgvZHBtG60hrqialEnl+M/WR2SdJ+u0rkFuz3iwj3qrR3LZRe/M6M4tbNurI3W1rpmDL+NR5zeKKzIFzW15prJSnw/7l3GfHu/h44y19rDSSueI7rErTG/FDg7Zt1w==
Received: from DX0P273CA0050.AREP273.PROD.OUTLOOK.COM (2603:1086:300:5a::8) by
 AMBPR07MB362568.eurprd07.prod.outlook.com (2603:10a6:20b:7b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 08:26:22 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:1086:300:5a:cafe::80) by DX0P273CA0050.outlook.office365.com
 (2603:1086:300:5a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Tue,
 20 Oct 2026 08:26:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 20 Oct 2026 08:26:21 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 20 Oct 2026 10:26:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DE6084020C01;
	Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 7D1A77003849; Tue, 20 Oct 2026 10:26:15 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [wrynose][PATCH 6/7] lttng-ust: upgrade 2.14.0 -> 2.14.3
Date: Tue, 20 Oct 2026 10:26:10 +0200
Message-ID: <20261020082611.3115623-7-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020082611.3115623-1-daniel.turull@ericsson.com>
References: <20261020082611.3115623-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: edaturu@ericsson.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|AMBPR07MB362568:EE_
X-MS-Office365-Filtering-Correlation-Id: 35180c55-65b6-497b-7329-08df2e83d22a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|11063799006|56012099006|18002099003|22082099003|12006099003|13003099007|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: u/aA5JGJV3qN5E4wZCjQXgIb4EmxaGLNhDYHopbfBOSGK4PQJ9h899w30IC4JbeNYRQ4mPHknNhiR1PocTxcR9DfV74UuunJaoi1EY0Yfa0lBx4pT7op6y/7QNmYBYyjBu3y7UvrWheI9ny5ifsJjG8B92rLjmajsuTkzIQazB/Bf6lUx4yO0nTfId2sZZByHUq5dsv85ELMhyyytdit1ghSMAVGtmXCesfXXf5Tdk5e4J90QSCpnwdhdv31xoiDw0D4/BjRcr14Gpa+RSbm9xg8DfOkoHuhVh1Yn9KFAU283y9oCdO/eTUawYU0kmFXBhVCnj5J6RcaBwwCZcjD3cpmX73x0fazR0Mfq8YrqnR4zTV+CDrebO8uefigWw5b/Lx4ulkPsnr2j6KNW5Nu07cl7LgiE5OZmTHDQq5vCsPXEFk7Av4n1RVOr/v58SPRh0ixM+7mVJsv4GKljW41BZL6JLrS9FS3L1jGfYzJDCWoBIXX181JRdVNy6SMAD9xCOx6T5QL59UOABr1xpmN3Y0Fnao5qBzd5HJGYz1sVzHLNIKKU9ymud1ElepjfWvxXLR4LUc7a8CyJxC/nKMg+5VKpp7OgpbdBbSTBsc3Set/VS1cOF56apPnLzGCiwv4v2tItMLwPUoVkxvgHivScB1wvQc5uXuxiJFDXgpDWns=
X-Forefront-Antispam-Report: CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003)(12006099003)(13003099007)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l1NqiJLXEfI6gPDWD+ElwCYJyqXk9AXyzXtQPBhKYFlM6h0dIlwcsjDcgsZQ+Z5PA0HSl9O9uRm2j9w9dPcfxJgrOklGZJblfCewgD+mJmLL1lqn34uOqlmkmfksqdIBRXPK1O+sG4mh0WsgEpSP/J5/5DSuSlABw6hIrVm9XFp75wny/EtEJYaY2zOVcLzaMGDf247mEy+BwLza5Z2/Z2/VzzqUYqa+m6CYjzlOxBdYgtZYAl1fBKxnN50Gbrk6g+UNogVjdptBJITAbGHrRyo+mHw0/ELe+ZBgXHZZ1ddRSHUZM4zL/cLpJlj5bEkJEXym0vyFW+fNjoZeBAEvSVZDXGdF0RWM4V5EbReg6UuS3luo9isJUknSR+YoB45CC3xKe6hBWbsFhzTXqMDqgHQ1DznYg/kUI3/JzYuFP7DkTltZp77cB6iQ1oryD2XX
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 08:26:21.0752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35180c55-65b6-497b-7329-08df2e83d22a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB362568
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248251
Content-Type: text/plain; charset="utf-8"

From: Daniel Turull <daniel.turull@ericsson.com>

Changes 2.14.1-2.14.3 (from ChangeLog):
- Fix: stream instance id mismatch for populated packets in
  per-channel ringbuffers
- fix: shmp()/message-size/zero_file/sigevent hardening
- fix: close_range and fd-tracker memory/efficiency issues
- fix: lttng_ust_build_bug_on undefined behavior in C++ builds
- fix: ustctl sigbus handling statement with no effect

Both carried patches rebased cleanly, no changes needed.

Verified do_compile succeeds.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 .../lttng/{lttng-ust_2.14.0.bb =3D> lttng-ust_2.14.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.14.0.bb =3D> lttng-ust_2.14.=
3.bb} (96%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.14.3.bb
similarity index 96%
rename from meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.14.3.bb
index 4285a445d6..b567dea1f6 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.14.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.14.3.bb
@@ -35,7 +35,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-ust/lttng-ust-=
${PV}.tar.bz2 \
            file://0001-lttng-ust-common-link-with-liburcu-explicitly.patch=
 \
            "
=20
-SRC_URI[sha256sum] =3D "82cdfd304bbb2b2b7d17cc951a6756b37a9f73868ec0ba7db4=
48a0d5ca51b763"
+SRC_URI[sha256sum] =3D "3c232b514f33c4248ce23155f64ad272fdaae3323255f69d5e=
7a5c3d6812b7ea"
=20
 CVE_PRODUCT =3D "ust"
=20
