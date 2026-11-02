Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13409.1793628431665359501
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 06:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=SsUJ0Hsd;
 spf=pass (domain: axis.com, ip: 40.107.162.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AnGzA6Uwyy4U6PozJcl1Nc1NmvpivAWeBDPRVrCaOBS2V3mamy46mQbRNCtH3fdiWSRi8byNNjIeLU0r/ednDRUU/+33N0lSFn3ItGjkC4zoaqW+j0uRGo0xCoNpx0He3lZ4Vp5rK9wJ4l5WXzQrbqS/J6u74pcAruAQn3mOvFHAtng7IFqa0KXPHsBve/ymfLCVE0vPtt1FlZzN5vmO8PFXwvOZebj4xs2izXBbrFVzg+p/zz4Ip2J+4jiV6MGfAwB+Q6ft2tDHm0w3n0DMPK8MlRav3DTRmPrn1K4MN80FfHbUZykBevACfqT+xSCpSz6INL13dpYewYVBZ4O3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j8jGWOWdpTvpxvFaSUDpr3nfRe2GOCdNyi/Dku4JXo=;
 b=inng6DDW77v8kfaydXiZFxyPsXSBc2UAKBsm+gjgV41exltsnKs19lQkOvgU7rgXNe/TWlMjaY0Lndm4IFJkGDUC4DDHo3utZOphfWi74zO/8Nix9UuQua9WS20LQCvhJZt4N/30/DZbb+D5rJDsxNP6osh1SQXK67eL5ge6hsQ154vZDd7wda4Y6zhBw6NLS6CmRCwXB/hNVIupDFgBeveMJFM9H5dg3q+yLORCMUw/c95OgzOkPBBjMcy5xrPf1UrHeXm/WXgNv12DjHRIT40DDrLIm31oJbevVgBgOGkr4+I4y+DjyLd9hNrx9dZ1ILaRi81ebvnCS+rqd+m7xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6j8jGWOWdpTvpxvFaSUDpr3nfRe2GOCdNyi/Dku4JXo=;
 b=SsUJ0HsdhRadwwW9OoHPGRwMvXH71qcSwhK4yFI9rvI6ajZfhWZjq+LbwsJMo32YXinX5LzG1VHyw5ebBfR6fKMtDlheEkG8jL3u8+q/r4cRGWgJwwABE8ux7b7kWIE7DtG4Vt4hPhQNhZbW0EbU8kaoYWCwdgMWzfpSKKx6Ufw=
Received: from VIYP296CA0010.AUTP296.PROD.OUTLOOK.COM (2603:10a6:800:29d::14)
 by DB9PR02MB8322.eurprd02.prod.outlook.com (2603:10a6:10:395::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 14:07:06 +0000
Received: from MI3PEPF00008487.eurprd02.prod.outlook.com
 (2603:10a6:800:29d:cafe::1b) by VIYP296CA0010.outlook.office365.com
 (2603:10a6:800:29d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.12 via Frontend Transport; Mon, 2
 Nov 2026 14:07:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 MI3PEPF00008487.mail.protection.outlook.com (10.167.240.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Mon, 2 Nov 2026 14:07:05 +0000
Received: from se-mail10w.axis.com (10.20.40.10) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Mon, 2 Nov
 2026 15:07:04 +0100
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Mon, 2 Nov 2026 15:07:04 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1E1B9138B
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id 18518129C3A; Mon,  2 Nov 2026 15:07:04 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] libzip: Allow support for bzip2 to be disabled
Date: Mon, 2 Nov 2026 15:06:58 +0100
Message-ID: <20261102140700.2707257-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-Path: peter.kjellerstedt@axis.com
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008487:EE_|DB9PR02MB8322:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ddf917-0ba4-4a07-d523-08df38ea939e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|6133799003|12006099003|260925021311599003|260925022911599003|260925021911599003|18002099003|10067099003|56012099006|13003099007|261009223027099003|261021123027099003|261021121427099003|11063799006|261026121527099003|261026135527099003;
X-Microsoft-Antispam-Message-Info: WsVUhPnuoCdl06OA5CeebKjcufpbhHGA+AQ9RiDNtZPMT7NCn3zNGLoZwpZa9PgZj35nAfPd3t5LPsKW2lxQvBbgcTTuKFcRJhGuUzl91WvCs2EsmDZGffS5ThOyNG7xTXoAMSS9GZK2X7zY95NmFfcfMjVFbqYg1pYw21mwdZb5y3M9fRkUcGhTDnLcWB8IfpthD/xk8JVys70z3fWTn4gyeEs1rNhc989FAKqTrQRa2AEaeHBPbCq+XlkAHJJzFegcozFPp0Onpevl1qGLjwYQjI/NQQabGKGgLW3t4jmxanpq/LhjaWhj8HAv03JhU1M4jnrfU76RO1AZOSPwqfbDWYtiVuJYtJtu0xq9HS5IEvqHmjhLudJjoAHWFWR1korUzLfvv0luobXermIHCAU5KLnRj/F6OnuAjPrnPkv9w36zsc/XDM8enpTD4+lf2yP0pshizHwPtUV8ONNBtsMHE/mJi/6nBFJGYbuF6VYEKYD3rrHvXx0fjVoQdO7G6swt2yvqNo5Em+D/nVo25c85X3Dq3DGhCzf8Etk8meyEQluM+M0yfOBnugm+NpdEsMoCca0KjRGRnKSatgKHzxKZnGEybsy9JLoHnpRRWqYswPxfbCb6Q9yJSWR2ShXhFbH3uVeLitq9I4wM+vJulA==
X-Forefront-Antispam-Report: CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(6133799003)(12006099003)(260925021311599003)(260925022911599003)(260925021911599003)(18002099003)(10067099003)(56012099006)(13003099007)(261009223027099003)(261021123027099003)(261021121427099003)(11063799006)(261026121527099003)(261026135527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xTHzWXBXmfob/m6Cq/NLnjiPRDtWFTAY9hPxc0hsSkyhNr9AdV47KYpP2vVCU9SEsTlEPdnFIWqMlteUdMOZJx5PR/e1A2g7P+sUHCsyOxpcuxrb5+sJVNCKAtq/S+9StmOUzoDoE0ywuf4DWMpHhZfu2z6/rS6e86DeE2STv1IHcn5LMTFO1jhgmC9efPF9WlwN7PDpIwjxJzfQob11jcRbnyhrRJFECebFJl6Ma8Zu51eE5pSlgwmGRWvOLKmHnIVMr1BNpvXUIPf26l7v0kjhNQoeH92w4AR9jT60+VN/fEzyz6BL+U3NF9A4ZCEoRBw3vRGNQjUa2CplsvhOpaqkhQmyawSxwlHgzPxC+m23vPr4Nn6gtWubyG189/GcVnV0MK2Sw/XBkFJ/6y36MH136776NexdXbXS/LH6C5CaYa1ukBJ8lOiAaR/yB+of
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 14:07:05.9416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ddf917-0ba4-4a07-d523-08df38ea939e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: MI3PEPF00008487.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8322
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 14:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249209
Content-Type: text/plain; charset="utf-8"

Enable it by default.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/libzip/libzip_1.12.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libzip/libzip_1.12.1.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.1.bb
index 95bac993f9..bfa23b6d9b 100644
--- a/meta/recipes-extended/libzip/libzip_1.12.1.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.1.bb
@@ -10,15 +10,16 @@ SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6fcea978dc627f41e0bada0de889ec=
4"
=20
-DEPENDS =3D "zlib bzip2"
+DEPENDS =3D "zlib"
=20
 SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
 SRC_URI[sha256sum] =3D "c40062022a1963c80573d48f6070792297cecd7c6bffe3aefc=
ac0d8b9bee8913"
=20
 inherit cmake
=20
-PACKAGECONFIG ?=3D "ssl lzma tools examples"
+PACKAGECONFIG ?=3D "bzip2 ssl lzma tools examples"
=20
+PACKAGECONFIG[bzip2] =3D "-DENABLE_BZIP2=3DON,-DENABLE_BZIP2=3DOFF,bzip2"
 PACKAGECONFIG[ssl] =3D "-DENABLE_OPENSSL=3DON,-DENABLE_OPENSSL=3DOFF,opens=
sl"
 PACKAGECONFIG[gnutls] =3D "-DENABLE_GNUTLS=3DON,-DENABLE_GNUTLS=3DOFF,gnut=
ls nettle"
 PACKAGECONFIG[lzma] =3D "-DENABLE_LZMA=3DON,-DENABLE_LZMA=3DOFF,xz"
