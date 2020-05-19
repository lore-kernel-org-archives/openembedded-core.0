Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.82])
 by mx.groups.io with SMTP id smtpd.web12.3534.1589913391517661697
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 11:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=JYBNjNHZ;
 spf=pass (domain: outlook.com, ip: 40.92.51.82, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FiR8EbeEEMAcsgmDy0PPJsJxNSorr0co7S2eHQnxAbOjhzMI6N9UzukkkAaG/kuCCHziCr+bZzjBpLtbtlPQIKV1SKTMx7b3X3TxYKFH5WZe2Gm5W1b8uz6VQzxOL6UQblL2oz5UUZm0QdwBrj403KOYGuGfgxE1jqBrQHEdW9CUymuU7rXRkUa63Il7S2mpcZGac6yHr8UYpoFM34tckxd+W/gL8eOQhJZoINiF84M9d71kxty9gL26QphZSsmxB7JMgfyYnZ2qknnCx3NI+Z2fiv0GzLOgiy+z9v7qPAzVAYxuANPd43FlX/w6mRo8kEEnVuDfOLQIcdUdEBpsZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NvZtkQKE/toT9hsUcW+KukRZGp2X1DeEbUjhH2vJqA=;
 b=OblffI+Y9HftsbJLGHF5Lf34uwgRR4oXOThlwIs8s4fqQ9sDs82UOuoyJQZ1kGzqD/y4OLfELfTVQ9T0SmyP5da6QyfCdYkAChifP9H5DXwnlAe3eyLOt80DpeBpouW2yTvnHqnwd6zfPHYAw8fe6gwDnJhoVD+imjBgK2bctDIw9zjh5BYWDJqCRvnKhCBuMDEcQr60PdAv/u5K72Op/J5AbQjBeURY4/oJuG9+F9BE7teSigkt6Ni/OD/Ot9A7eUQmXS8kpc7tFsJUtKpzy08j5PO5Nq3ctL3KRqj4L9xQsTEvgRvhBmVpsoUjhvJWVCTR/RQ7bCA1j1jyI2Lw6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0NvZtkQKE/toT9hsUcW+KukRZGp2X1DeEbUjhH2vJqA=;
 b=JYBNjNHZGSyo+BlphUTlwqvdu/GbbIwPt44SifxeezO0SWc5cVLCegoW44bBqsxKgZ80zWgWR5ZtcMdJcdPhCvbVQGeKxxogmjLqbwSidCaI6pZ1m60Z6XXs8R0lcZJ+WIMDJvsLSGGboc6mFEJqTZkZRSfGmVkiYN6GA58t9rH7izyE87853itK094HB2moQ9b4quS+4H9NCC6VskF3uVGq+qiOgtGMFLZxwFSCpo50QqV3K5wNZWu0+/51YSKmupnaFuqgyjiIyRzCKUjHSSK+/QF+KmXRwFFa6r29t6bX1bhiuNjPNLT8BTcr2p5GjwwjTmMUDfLkbMIenatoOw==
Received: from AM7EUR06FT040.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::43) by
 AM7EUR06HT198.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::422)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19; Tue, 19 May
 2020 18:36:29 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc36::42) by AM7EUR06FT040.mail.protection.outlook.com
 (2a01:111:e400:fc36::497) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.19 via Frontend
 Transport; Tue, 19 May 2020 18:36:29 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:479FC4F4186754F5FC142F749BE3EEE136D76A0C81738F485411071D46D9C959;UpperCasedChecksum:325084BAE97A1E9303AC5C4EF561507D2D4AFA73CC48EC9AD48A85BA7C1EA5C4;SizeAsReceived:7473;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%5]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 18:36:29 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] package_ipk.bbclass: print opkg output on error
Date: Tue, 19 May 2020 20:36:14 +0200
Message-ID: <AM7PR05MB68813C6F4A99F236D682914CA8B90@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM0PR02CA0012.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::25) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200519183614.18887-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.90.134) by AM0PR02CA0012.eurprd02.prod.outlook.com (2603:10a6:208:3e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.26 via Frontend Transport; Tue, 19 May 2020 18:36:28 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200519183614.18887-1-kweihmann@outlook.com>
X-TMN: [lswvGIAB9/mdRC8H+yRcqyjt5ewWpGMc]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 0ba304de-b39c-4c62-0106-08d7fc238b79
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtw0CKt9GUECDsl3T8vzS/0C1GggH3gm/wzd8E0jyIYzy4jNJ70EGnF7igiuMvbiUPns6rtkV7ItLB1IeYWY/iJBlXhC2KgaK4fLeSxIBq7dnsSulfgtj062F1rvEBvhHq8uSUPFpowsx4BQJ0GPYPXzkr5W7BUZRvVrYSaIhXvFBxef8GJJWex8lqn6WF0jWh0HYGFWT0Qn4CYvgtzXvH+XJqH+O87nPIExXzFImAiugK3CRZqBpzQNjvpiYV10pVSPVumvoaP6JzqcJfi4I2U+dmISulfK5cq0nb7//sUSGlgiuslH/7ov19e/DBGDToGraV1ZTxLQK5Owhu9VoTIOtwRyB/1AiAzYZvt+wY4NJnk5+0y2Q9r7SfuazDgVHeWdqkN6jTWblJLlzsz8GrTv9t0h0eD3/2nyMNuQ/6Jfhw8XL2wJysU206uCCTM1gkrmdec/ADKfrmPyC8y5cCRyYAfefzucyHzXkZZEMpt0I55+3c+04T0+hceXuVJlIt9ABfsvy2Y53eamRAol+3pd/tz4tLbCDIp7Tsrf98awPSVmxFzy46G3A84BFDwEHnEKos3gbXPm+0ymmvjcUTn7cYmsnUxSAq4X2PqD2mNPXuxMNJDSOzyXVnJ2wNrudiyiXzlObDJH6VhYvDcRemN32Qz1W3Cun8EydqpPVnxGU+YygJ9kX2Z2uHx4icYChQSycbTYSf5Fc3he5r0npYFf55wJs5b4PaQ5lnB+TkPuxA==
X-MS-TrafficTypeDiagnostic: AM7EUR06HT198:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4deSInfq6efD3LGp/lA9aihgmXxGvC2+7/cYv7vw0qdl6VSK8flfzKCqVwAcg9+z+jtLZgYvbemrPR4byKz3CmGLjJiKmi1RZ/O0TBBFw9HKz4jF6KuWyNXv34t02bo2xPoSWH8TvMe4JxGagO3lC6S210Pim/5L60X24/5nBhJSXVBTa2kytx8l79OHbAM67DThMfFeG71GfgNJ69NHJQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	vGa36rUdjUtF00rKJdsqI9JXiMvbJpI4rqvDkmTWMYKMgjnhoBmCmMLsC/Hwn2bROxWFOiAI2wtElxGDv8U8SHZTYZFEGSrmlsxrcYz3pm6W1MdpnNolBMRu4NB+b1m3yPiCn7AjadK7aS/N1I9GoA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba304de-b39c-4c62-0106-08d7fc238b79
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 18:36:29.4065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT198
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

in case the opkg command fails in before no output of the tool
itself was printed to assist the user with debugging the issue.
Print all output of the tool by using CalledProcessError wrapper around
the call

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/package_ipk.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bb=
class
index c008559e4a..5e7d552cc5 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -223,10 +223,13 @@ def ipk_write_pkg(pkg, d):
             conffiles.close()
=20
         os.chdir(basedir)
-        subprocess.check_output("PATH=3D\"%s\" %s %s %s" % (localdata.getV=
ar("PATH"),
-                                                          d.getVar("OPKGBU=
ILDCMD"), pkg, pkgoutdir),
-                                stderr=3Dsubprocess.STDOUT,
-                                shell=3DTrue)
+        try:
+            subprocess.check_output("PATH=3D\"%s\" %s %s %s" % (localdata.=
getVar("PATH"),
+                                                            d.getVar("OPKG=
BUILDCMD"), pkg, pkgoutdir),
+                                    stderr=3Dsubprocess.STDOUT,
+                                    shell=3DTrue)
+        except subprocess.CalledProcessError as exp:
+            bb.fatal("{} failed with {}: {}".format(exp.cmd, exp.returncod=
e, exp.output.decode("utf-8")))
=20
         if d.getVar('IPK_SIGN_PACKAGES') =3D=3D '1':
             ipkver =3D "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
--=20
2.20.1

