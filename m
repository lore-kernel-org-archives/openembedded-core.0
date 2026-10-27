Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14130.1793088749389756299
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 01:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@gehealthcare.com header.s=selector1 header.b=YVRUkFzd;
 spf=pass (domain: gehealthcare.com, ip: 52.101.52.67, mailfrom: maxin.john@gehealthcare.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UvYFnYqhPjUyCaOtnZAUPTm49N63jCZCPWE9Qpyn+wYjtyLvRUIyC+W1fgW+4ggbvKswndK8Nc8okJiZvVMW7ESF0SSstRE06gyduSEhL83MlU2iN9v6y9x1/6r/vVeBATCNL5s5c4scfTLn82R8P3Ve4l6391923/TPVd+JKzsdysajp4QVjhcCaJCiJM9C+qwNfMXWxBUeAMnjCM5XMkw5+S17872k37JsQLyAuZwaHgajGnyfBE1g+iHe7c1iX8DmZCpHw8g+Ef5aYAfpEVhDchQSuVxqDnv3cgJqrbY7U0eE4MKf2Zpv/67NbJL15jISnvEyBY0pb+k6tq2Hhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaozBl2YsrQn2mQuhDd7TCJPO76Lh3wCdbJ+OEC2sdU=;
 b=EW+Uis/q6+31Db7wJZe0zDxTJZjjePBWyMyLoFol0F6M+LTXzYJHs66J/0+TN2f6+kPT3LsdHxY7OjkIdl4Z14dTHbbTeZLLMw5AHpIgsMA3qGGpODwk/KdLPv3ZiTKMY0Tl/k1MWFcWSRNjDBAoHmbV9RQ6g4t9VKw20pU9H6GpvDXgDSvUX2iQs90OXHnMSOSubqziYxuVooBZl57j2N952LUYEj3X00fzgl0YweBHGLDqbyc1ZxiGKSrYIFOktnNciKXM9QA2z3HreKiqkWLnfgIP/6FlOXfHFiNkpgLJ/ffEvkL8n8Pdv3uFhW2FI7SOj0bSTqZfqGtg+x8EJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaozBl2YsrQn2mQuhDd7TCJPO76Lh3wCdbJ+OEC2sdU=;
 b=YVRUkFzdvHqdMaFCJQwbWLIPb+X1RVtdYDQp/9NI54R471vT1zctddpQqkHVZaTyn7QGt79oDeI6xI6ZyjdRUdr77MFTa9u+zDMsy3HzdVRv/YI7CzfWUHpMP8QJZxJpOBvOqqfD51Lo7wUBg9UypGoN+j+1OeN54hbsJDJoGaVrNyhKeH8dE+NP8xRK0XN0GE9NhQak4dMJXKg3Vz8KXg8xTVogGjop7JAtxmeyIay9HFEtXokNu1IRU7/HxjGJexdPzJfYWfOsYIM9hY0I9SDWrOYYQbPfuC1Osmwu4azzcwnE11Oqwue/L9FEhC3Agdn7za40EHL8rXGGETBMIQ==
Received: from PH8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:510:2cd::7)
 by IA2PR22MB5649.namprd22.prod.outlook.com (2603:10b6:208:4b1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:12:25 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:510:2cd:cafe::a6) by PH8PR07CA0006.outlook.office365.com
 (2603:10b6:510:2cd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Tue,
 27 Oct 2026 08:12:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 165.85.157.49) smtp.mailfrom=gehealthcare.com; dkim=none (message not
 signed) header.d=none;dmarc=fail action=quarantine
 header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay1.compute.ge-healthcare.net;
Received: from mkerelay1.compute.ge-healthcare.net (165.85.157.49) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Tue, 27 Oct 2026 08:12:24 +0000
Received: from d4c77ab47744.fihel.lab.ge-healthcare.net (zoo12.fihel.lab.ge-healthcare.net [10.168.174.110])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D265527608
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 10:12:21 +0200 (EET)
From: Maxin John <maxin.john@gehealthcare.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] archiver.bbclass: fix format string argument mismatch in fatal message
Date: Tue, 27 Oct 2026 10:12:20 +0200
Message-ID: <20261027081221.13-4-maxin.john@gehealthcare.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20261027081221.13-1-maxin.john@gehealthcare.com>
References: <20261027081221.13-1-maxin.john@gehealthcare.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: maxin.john@gehealthcare.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|IA2PR22MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cdaa0ce-46a9-46e0-b162-08df340208bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|261026121527099003|56012099006|11063799006|261021121427099003|261021133027099003|261021130227099003|261021135927099003|261022113327099003|261022075727099003|261022105027099003|261022115727099003|10067099003|261021123027099003|261026135527099003|18002099003|22082099003|261026140227099003|261026130827099003;
X-Microsoft-Antispam-Message-Info: Mn6jDIUkam4lFS2AyaiXmvFBgaJ/MbVVz52pdt4QQwsxmNsD2hIPC4BYK5BVkeTNZF5Eqy8/qNtq6SRByM82DdRIQw+8KAYYmoHwEomEZA66v1qhWVqWLyte3zC7E0l7H9r8bK1qSdBuLkSGALKoqEVHxKLZVn6OvGB/HBG3sJJZsRccNiKDoT2EC7jB3PMGdMjIFYN/JuuC0HJ057IZxJYf93CaKpJj6PSItzSSBfLBnKzhAzfABCdncMFk+PNo6V4t4UbDrkRR8mtFYVxzSAeE3Fy5ZXoQx6ixcVJqCP1Nkr5OqkhBeVfdJNR4VyGksJkPdtIxCPjZTJhe/gQ5q7dVf+BYsWjJb07WDcmtwGrjxcgj706Zz326YmNabpHKv1e4g5EokB44bmIpWH0TG8eC0T05Xc7jzSiTqyCcIMk/zkAb4CaEzhtysE01jfNdR4DtrmBXGgrb1nl7t1OZ08SPZCi0l75MEx9Cj8v5OF8Qf8zUsLKoWtp1NpsiDS8vlBNfbtKPYtvJib27fsmKVCDEq5LX+87Pff6A0og15O+AX/2pmfT7tBsHsey0X5dXbudfalTK2g6/cAwMzbcoaN7rLWyRd5DHh/oAcJWd+D3mGugG+Z3yyKgWKekyhEVSZ8GP+364624q2mYdt297h2gMN9PavpyGzBeoKAPP7rIzoHs83lYeQsda1PdOjAwpo/jfFeu98UlCacW0dcQboQ==
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(261026121527099003)(56012099006)(11063799006)(261021121427099003)(261021133027099003)(261021130227099003)(261021135927099003)(261022113327099003)(261022075727099003)(261022105027099003)(261022115727099003)(10067099003)(261021123027099003)(261026135527099003)(18002099003)(22082099003)(261026140227099003)(261026130827099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ccf7Z0qkOAIkz1AFmzLa83OtsgXxNhT7i47lmnFeLWYhVlxpqTCgv4zTKZO9i0WQnKHd67cYbWRKuBnuGAAzCK2jV1GkiGXi/biOUxd3FrLq3mKeVSMagEGRfxUGvbVxGvNwBw7517adS6X1DuE8I81e0KuUG+lMI9gbb2ilBPhxGF2KYqjzcUPnqKNrdiu3HGT0Tkhskgf8wKU1EE1JJWfRdi/iZHlRkS8GpxKkY4vkVCg/wLsTELRbytkAAPVuyXICYzMQXyDxVnOnB3yCga9/f7FvEtrc6Jg0+KqFZFaxIJNuNVyJerTItgoXuaYo0WQ9TIM50DbYhMfrRJBzXD3dUg4vZievQJQWhNDw8DbHwIaCYg2XJRXhk0k5l7yyBLKyOHhAH+rgIh4efJI32JRN1EbY9dpufuC8ByLyommEg9UpXgDFM9sv4wsEQM3N
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:12:24.9088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdaa0ce-46a9-46e0-b162-08df340208bc
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA2PR22MB5649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 08:12:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248717
Content-Type: text/plain; charset="utf-8"

The fatal message for a duplicate 'name=3D' URL parameter has three '%s'
placeholders but only two arguments. This causes a TypeError instead of
the fatal message. Add the missing argument.

Signed-off-by: Maxin John <maxin.john@gehealthcare.com>
---
 meta/classes/archiver.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index b274c53e79..b2b618023b 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -228,7 +228,7 @@ python do_ar_original() {
                     if not name:
                         bb.fatal("Cannot determine archive names for origi=
nal source because 'name' URL parameter is unset in more than one URL. Add =
it to at least one of these: %s %s" % (tarball_suffix[name], url))
                     else:
-                        bb.fatal("Cannot determine archive names for origi=
nal source because 'name=3D' URL parameter '%s' is used twice. Make it uniq=
ue in: %s %s" % (tarball_suffix[name], url))
+                        bb.fatal("Cannot determine archive names for origi=
nal source because 'name=3D' URL parameter '%s' is used twice. Make it uniq=
ue in: %s %s" % (name, tarball_suffix[name], url))
             tarball_suffix[name] =3D url
             create_tarball(d, tmpdir + '/.', name, ar_outdir)
=20
--=20
2.39.2

