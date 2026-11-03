Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3135.1793735324283343744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 11:48:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=bbDhEIJM;
 spf=pass (domain: axis.com, ip: 52.101.72.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqcNnVufkMo3teLv2bkouUmvyfM0RDk1wuqFqDRJ1SkDKXDZwLSPlmoK+0kiln9FudUhd39ahzbIYnqdmZRjPIO8/ZMU3iVGeljXVu7vhJXCgZCkHAdGyWKkCGTvFzg9g8OjlibsqNoh+tHbKWM/6+r2rF80gCDsVF8x9Gz/BijxR3ReVdHFBKqgPmlNPVh+0qtgLoi19yCc+SIQlFZwdZnZTsk2elK9P9YBJo6bxXkrbqkHnW+nPAAIHovCeXftPVCeuGA+wEF0XhgDY7sAi7Rq/eOhD0Ke8jwIZDQ9iqgkFEBJqo2/u+EhPFUgyrUGLjloBD2MBh/4PlloxiDJPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAVGg1xvAz1qKyMFw79S2unjR1pjdV7NTm8oCCwVPqE=;
 b=dLDxNkybTQvXiK5gPRI/DO0INzNIzyuyJG6TpjeOnuOcxOu0moX0mMasUtAFzkfAShSSp1+H6ig1+4lvLZNH2z62p0l0b03BKrF2lUOThKwY+YE7xdg/t/xTdbkBHgabnEtZoUnBW5Z9I5im8z0z27LFIQvNtBhlwack9gBRZm6i6mMFWAYNgJEDYS2b9GSEigX+GBZ9oD5fb+aDofIsrftvyeqpEEtpW7tET7IZDHIMD7aX0ObT2FbMAO9S10ILOKCuqsBeAA/t6ixNmzrh8Sw6VYqr3i5HGF3vQJ6NekNYWrQMI6vGFSNooW9YJJFrrC3dbIJOjrKTU8gdv5wXIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAVGg1xvAz1qKyMFw79S2unjR1pjdV7NTm8oCCwVPqE=;
 b=bbDhEIJMirNq3Xws7X+WaAMbaVDLGfy3VSymA5ZJ0qf8493ON+h8rsekno0RtyTYT1Gn3QzwaJFGprOL/m8v9uHNJEKC5094TCYCjAPm8T9R7EydhnpSLXgm4cmmHxg3YRlkb51BHctwhFquh6qNE8r5evmy4itvJWj2h12Qr4k=
Received: from WA2P291CA0024.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1e::15)
 by GV2PR02MB12435.eurprd02.prod.outlook.com (2603:10a6:150:36b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 19:48:39 +0000
Received: from WA1PEPF000099D3.eurprd04.prod.outlook.com
 (2603:10a6:1d0:1e:cafe::b) by WA2P291CA0024.outlook.office365.com
 (2603:10a6:1d0:1e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Tue, 3
 Nov 2026 19:48:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 WA1PEPF000099D3.mail.protection.outlook.com (10.167.242.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 19:48:39 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Tue, 3 Nov
 2026 20:48:38 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Tue, 3 Nov 2026 20:48:38 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id B8B3016FD
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2026 20:48:38 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id AC5B2129D3B; Tue,  3 Nov 2026 20:48:38 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] insane.bbclass: Avoid buildpaths QA reporting on HOME if its in TMPDIR
Date: Tue, 3 Nov 2026 20:48:33 +0100
Message-ID: <20261103194836.3765498-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099D3:EE_|GV2PR02MB12435:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cfa20e-bf54-48a0-32b3-08df39e374ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|18002099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|11063799006|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 1oT3XVBNizO5Edq6kVeZ3GfAEG6n7mf75q26wvERv5GLlBo5jda/eafBwvbWYX+MWz5nwMsZDt1/FaqgHSKtVGXE5IZVoNqVQEBPqZf6HXB+hbvPVdkFD6M3vrkcni87ZKCJzC1Zlj20KyDZHmMDhFeIfItOonH78+WulGO7vLYmEr6CUioAICGSpYM6fGx8hGhgABAtB7MEjviRg0aP+6TMmF3qOKJZuhNbbpzFwjZcifARqDmq6kLTqwkAG6N/pjo5dLEpRa284vXoRRq/7hN2L7U6nH8qHCmjqwG6LocG/f4qk+4ylQWocroC26pT57olGCmNkATJV3f1OUdMVSHgPtQnw9NUFE1HwXrAu3BOMY5Vxx09TKFcQ+HQ9c5bYbEQJupXlNEvvAPBDhJ80zBAGTl9zj2UTbMHq3wg5Y9rkw+HbqsDHkqvOq7jsh2szN7+hzCKHkg4qe81qF/0lTWMkHC3D8RVaqPOG4YDwcHGT/PjYnmpqmgAfqo7uWJ9rY44CIVQm9ASTO7pEChXWCXa0ZWJEy3GThlFshDlduB4sAjraWRjyE3gX3ckURb7Fon5H2FNm3CVRHENo9r8+6BHzdm6zsKoJH2V2XNgZK8vXPTolS/uVG/y5ucz2EUZrMaE7C3QNWJRSoNOxWsE0Gb5Rc0pL+o9oORH6jRDDCaVyQgDcRIKS+F61mcLEJJ6QypRy43+oJKZD9bT598G8A==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(18002099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(11063799006)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: txYKjJlJVgN0A7wzwgIcmYS70dd6/Ocvhoc13jN9pA0cHuJNb5ki2225QVwebV0sG27mU1l4Y2hsaRYTRN9wOWx58sNZ3lqqsoXCkZx54MM+Ore0jn55AvYva/WPOirXoICFQjPQ9xyBpwDQ1JTv2fdwuUaWDz9anugzVmkzX0mlDNkalZ58xkQroEOwqUYfh0OXdRJeEmxnlZ/wz3XfKlyqIhklwL5K2UOJroYzdqnSMK9N5NlJDfi5S1AzTBWMxpP4fRv4lsK/R693LYc5+5SPpzFMVVksOjmn2l0rTovrP+gSc6EltMjcvjzFLUE1oYM++fADnjGfcvTQl8jMg2dywtQjE4+AXMDvEFX44kcoXp2iStDk2vgzSDkkQz0nD1eDzkEoFdFUmWWFM/hJQd7fCqAq7rjbSP0wTtRxmqzKALlGmgO9NnyKHcLz32hz
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 19:48:39.1386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cfa20e-bf54-48a0-32b3-08df39e374ec
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: WA1PEPF000099D3.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB12435
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 19:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249297
Content-Type: text/plain; charset="utf-8"

Since TMPDIR is typically under HOME, there is no reason to report on
HOME if that is the case, and TMPDIR has already been reported.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes-global/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insan=
e.bbclass
index 721088a8f5..350e1f83c2 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -443,6 +443,7 @@ def package_qa_check_buildpaths(path, name, d, elf):
         if tmpdir in file_content:
             path =3D package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contai=
ns reference to TMPDIR" % (path, name), d)
+            buildpaths_skip.append(tmpdir.decode())
         if homedir and homedir in file_content and not any(path.startswith=
(homedir.decode()) for path in buildpaths_skip):
             path =3D package_qa_clean_path(path, d, name)
             oe.qa.handle_error("buildpaths", "File %s in package %s contai=
ns a reference to the build host HOME directory. If upstream hardcodes a di=
rectory path that matches your home, you can set OEQA_BUILDPATHS_SKIP =3D \=
"%s\" in the recipe." % (path, name, homedir.decode()), d)
