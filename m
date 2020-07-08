Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.80])
 by mx.groups.io with SMTP id smtpd.web12.8322.1594206646520571911
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 04:10:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=HZp5mNFf;
 spf=pass (domain: outlook.com, ip: 40.92.64.80, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCVj56I2sicBta7UffTUllwcqNScsQA7OR7aMKeC88enOrj8ZrS+YRydae9ZPjTb01jsFcb+0eyynEAXcjssmVbDScPTCszySGgbcTk71LOFnJ3aLFpmSWYr8eiftAEckrUHcodilQnbzRdYgP0luG9jOPjINhACoCxxIPtfLlN+Q1SPQGaOnm8NSaNtpcob43/9eMsvCrlj+A9F4ntW2KSVbT0tmJZx/BlhfFugrWQlSCHvXZBZ5kV/um789xH4DZSvzRf/fYDmaTFvnrFuCTl541/MifmIJxUML0hVDR+Ju13UdMcCqD3NekQgA1ZvktLG6fEtvfOEHgbrPtEzvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lffKm4Gpz4PAmrFn0fWGbVFZEMKOjPmPiLUJcSgp4M=;
 b=od1HBmgZ9Roc92kvfs6NKlQUN/Sei7x5OBJEX9PKx9q2h+FveDORbIEmpvMMAzrmcMpvIUqO2s6ETjx1nF8hsFTm8q1q+5U0TbYwaf8zdrjJehO+P0UrW6Tj0/7sJzPjeN4TzcEfuohj2uwuPQQs9nsrb4vjxdMMNVRNC/jc2XAMqqMaEie3CPJnEqntJ/cOF5kfkANWUH9pXpofJNqSpIGgWOt3LY/gHPsxIjdw9aO/UNLg0s/mmmgNoznUsteJBfsYDMKPqtta1SV3mluMnl6eCjjgd1k0Z1Fo9yO4DHkjQZTz+WypZlQewd+vtlP6qjfe0v4m74Swckl2OJ2PGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3lffKm4Gpz4PAmrFn0fWGbVFZEMKOjPmPiLUJcSgp4M=;
 b=HZp5mNFfI61IiaiZ3rGsNWls6fE7B86EPq49ykvGATmvYtspU7XBQRv3Gp9I6IhLRVDDBvyYNk5tUvXEvXjJ0y31zDm5dvjxQuCsdU0jSKp2gDaFC8KEgSyMGf+dR42kvWBPZgFyQI+9XgbTznKC+d6ox/dlJA9PPFNKeCaNEHhDqpRDVg1l3l0xREU/H42rdmI2EWQWeCeNxlrHnkwk4O1xvSJxU9m3hcPvU9ycnvEMSIj1KdOc+f5MkZZ2UNLSj6mobPMnKxoEUwpL7Ayid6C6aPj/r7wDNwjeV8aEesgR6d18JBPbKGMroLzVhax+8T+AkLjP2KGl6Q/25xaqaA==
Received: from VE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::40) by
 VE1EUR01HT012.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::98)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Wed, 8 Jul
 2020 11:10:44 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::4a) by VE1EUR01FT052.mail.protection.outlook.com
 (2a01:111:e400:7e19::275) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 11:10:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:BE8DB10D66F374EBCD3644F506F2E3061282D53DA0E8AC30982E9D46F74D0AF7;UpperCasedChecksum:5A37208D9B1523C5124947919A28881C9411AA09DB6CBF523BAE4E43C02B36CE;SizeAsReceived:7538;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 11:10:44 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/2] rootfs-post: add sanity check for ROOTFS_POSTCMD
Date: Wed,  8 Jul 2020 13:09:36 +0200
Message-ID: <AM7PR05MB6881E32F96C6B2D662250CFAA8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200708110936.17099-1-kweihmann@outlook.com>
References: <20200708110936.17099-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P195CA0064.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:87::41) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200708110936.17099-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.67) by AM6P195CA0064.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::41) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 11:10:44 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200708110936.17099-2-kweihmann@outlook.com>
X-TMN: [Xr91/hR6tzw13OZSlb+zPxV0RFlme+iU]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 88b123d8-4d43-4c76-6efb-08d8232f8efa
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyJw5UtaifPLpAfX0jZwjGxHAeoZCTQh53g8xk7vktZkhuVQgsEMLwe2Mdc9sgw+bIKtGSrFpE+YcqPIqqI6+N/K9qjzTbFksobUdTbcKpuP9irhUXrPSdoZArut42tNVWsTBYAdj/T/XSs96UTVnbqNlo22BY79Td24bcDa472qt1t3Foo7vu9CAdpzIUSrCHtt8t9RYou4JKDNyZgK0/iuU8NOu0Q+zS/FNIwvrywqvNBdv0/89vAsLHJoHWWNshM6wwIQeg5Fx5CtiSg1Y+frKcoKnFLKVRFd8LYDm/c/v/zIoK8XCRirE0E2bQSaTAzFLh062oivyrdtBFmVpf8ym+9LfgUa25EA88vmYFUdyN1BBbX0WNFLEMBiAS5PRQZmglGTuddMbIK/d2fgdLAW0enWNIanVdSrV1DsrrXnevXp8twPbF7p1nynpZfzmU833nM57m9NQvQymrSK77rJEbkxuYzO6qVAn6h8IFFtuHZb67cg5lWh9Vfdoo888cv8b9RX0W/cGZmhGr0vIzNnEQpah7bfY1DNzo7VgMOUAymqJH8wi9B7seyOcekg5uCtZb3weSLzl3BQfMACk+2OFcXWKrMFWSypXJd/nXm72IZXZCN/LVJWggrofDJax6Aj4Xg9jIHAaSnvwUnrNUiwt5qgCMiQ/CRxCJSMRilflfx87dS3ibiN1lc6HcDULIX3EDaRWzcEmjqCZKqQb+Dwm/5xjY34f0haJEmdUjepmO4JIw7phGRp4esJ1vyS/AY=
X-MS-TrafficTypeDiagnostic: VE1EUR01HT012:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J6mNpiHYyOK3Sz73253qJCI9HU73dT2aUgQqF4+LuZ2t1xDl+XXj3h04pzFidQCfRK897UDAhOgfkUVeP5FgFtOJ9aNiQLkCTsvvmMSXRYiocgqiDOa0ozZuo9nbhX/FSpii0wq51khAiE42MVXKLehkXymm3n1i/odRQ8b3UVRX7xuXS8zEbldR0PYm49PXsuqufr44ah0WDvdhi1Hnww==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	oscgrQeFLR1w4vH2JsTejCcYUjjbt8RuLPLFKhDAeG/ULUWS7MiK7Xo9C8hAAheCBLMMCj8+JcOhShudFlI0vtEf3gT1cABB9c6mBFgZU6tzeGEn4W0//g04VuWN72+Umsx+Anmw7rcVYNLaxs0iDQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b123d8-4d43-4c76-6efb-08d8232f8efa
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:10:44.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT052.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT012
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

It warns about trailing blanks before the delimiter, as otherwise the
task can't be removed properly

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/rootfs-postcommands.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index 984730ebe8..e33715f016 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -57,6 +57,14 @@ python () {
     d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
 }
=20
+addhandler rootfs_postcmd_sanity_eventhandler
+rootfs_postcmd_sanity_eventhandler[eventmask] =3D "bb.event.RecipeParsed"
+python rootfs_postcmd_sanity_eventhandler() {
+    for x in (d.getVar("ROOTFS_POSTPROCESS_COMMAND") or "").split(";"):
+        if x.endswith(" "):
+            bb.warn("'%s' ends with a blank, making the task unremovable" =
% x.strip())
+}
+
 systemd_create_users () {
 	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_R=
OOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
 		[ -e $conffile ] || continue
--=20
2.20.1

