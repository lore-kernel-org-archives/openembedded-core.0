Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.87])
 by mx.groups.io with SMTP id smtpd.web09.634.1603906908593027401
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 10:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eRtqUABY;
 spf=pass (domain: kpit.com, ip: 40.107.138.87, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc1NGk1Dhy9LQ5CFXIsm+t4m58MUtWV/X4xQDw/A3t/c8Hs/U/8RIMrFZK1MIVig/8O353uq9zbeCDoUpFakgV81X4sd4kK08jCvnREneOLWaXP7MBU8As8YcbuX/vaHJYDgicKHCm4sWh9fpon6LVLQuppseBv4r3ANExRVfQGtsEY5sB6u9VtEwCQw6rYl0GIMPTCD3OydT1+P6u2vZ2SHQqlYsXBrBpPNLly2FvFRM5b+HvJZRu2/h18uncHH70K3g66ICPyt1iJ44p2DOeJk4Vyt0uor+xjVMgTJQqz+J/SLNRIF4LOpjaRilV298da6sSLQiIDIreAMm4/aow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq0DSRev90bQcalyerLekGOcpMuRYjxZ2t00zIwae9Q=;
 b=jQ4kWMJE5JINF5ldPOixsE+azBK/ryeEcpr2zRdeumIIzN1QkScDDYuzgTRaiLfl0LCDRIZ9tESJqPSpXoNTSKlMORwyHndwWMcn2L44ABmN/lqqKqnRqDTxvBecv7ARKdibGvM4TY/fDHsHwY+iMXyFHJRxiYkgrk7Cre3nOEVsF6whHAM4P6WqOU9l3jARE3YvIOfaS8+/BOZkDBBvqWC/pmY0r2N6QF7i2CRXWdjp70sX5cFVmtd8bzw+o1+mVRyRIYvcWB444PGmzetaCu8+kKOFLaUHh1wOU3B2YzjLAyp4NCByqjZD1nAcBn+pxp62TAbwG5H5iXT497YMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aq0DSRev90bQcalyerLekGOcpMuRYjxZ2t00zIwae9Q=;
 b=eRtqUABYJpMYAYECatPtLJ3P2e3kKtXNkFb49e3ag/XqIhdVe1y6UbRFnQ47f7OqFl6ffdBQjKFJXU9p5snB4BFrJ5l6N8UdejKxM//LyVOQph/FKK8t9UVs/sKWenzDknNY99XnVOX9Tv7mOUJGreyGLgmjDv0ny9cpqErw1Ho=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR01MB2434.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:41::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 28 Oct
 2020 17:41:43 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 17:41:43 +0000
From: "saloni" <saloni.jain@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	anuj.chougule@kpit.com,
	Saloni Jain <Saloni.Jain@kpit.com>
Subject: [poky][master][PATCH] libxml2: Whitelisted CVE patches
Date: Wed, 28 Oct 2020 23:11:34 +0530
Message-Id: <1603906894-22742-1-git-send-email-Saloni.Jain@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [2409:4043:215:ea7d:104f:98c0:299:6b11]
X-ClientProxiedBy: BM1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::19) To BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:74::20)
Return-Path: Saloni.Jain@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2409:4043:215:ea7d:104f:98c0:299:6b11) by BM1PR01CA0149.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:68::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3499.19 via Frontend Transport; Wed, 28 Oct 2020 17:41:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9a1d19cb-da66-4795-4210-08d87b68bc17
X-MS-TrafficTypeDiagnostic: BM1PR01MB2434:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB24347508CAE9C1FB9649D50D87170@BM1PR01MB2434.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bXf3PfsEUEIhvv8Kcfb+mmgYpwfMCl8hoM4w/GEyEefYvRDnGIBUynRFnRGAL5/k3iv4j+BQpI4Hn25wAR3ln1SRRKffdjb8DERo3yIf7/24zjVojt4Kz442/AtnhuM5Hv0VdHe2J+6MwArAHk0/2IGmCjzIO2Zyk0jb+w9gfJZ6gq1r5O8d0NrIZ3Cy/FxPDwoShi3zE36Csvd6/Ae/LzJvXcXb2wkDiCJie+pSZCH8UHfRsmn4SoSBiLexlXfwmz7uzRnVbr4EZHvMl1/PTtIIeLka3kpdHPtMAeehGdW/Ufo3HDfCLR//6KCSMPg+JMJJL2ybpapRjWZ2N5LaEyKczx0ERrPv0cIynuwJMYcR7wKjGtJ7hcg4q9nX7cg1JAdyoochHBSbTQtaUiGRlCoIhD2JhDCvppwgG+vcfv13QhzNO3dJPYA20NJjZuCSkQns7LTcwJwZdTLM2qyEVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(6506007)(66574015)(66946007)(83380400001)(16526019)(4326008)(8676002)(6666004)(186003)(52116002)(8936002)(86362001)(107886003)(2616005)(2906002)(316002)(36756003)(69590400008)(5660300002)(966005)(6512007)(66476007)(66556008)(6486002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	D75dwRgmFUnXt9STLoNZXsD4KLWHDX4VytDfvR296Eb9LwTZVh8x1Ixo+6ro1w5n+5iWjKPtTxCzriHyN2QPlKutesvx3E97d1BecVdP4uEvZYwWGRnwp0LreyKSq+6y6a0w0cTshlEA/wpEbqmnFlB6ByTmo1GKnNKaMWN2LYMipWUPoS9iOB6bp6thJoEyoR/kZRaNO3DMtrFX5GTVPE6+Lw188Mj/peuF6F08xK2+dMHwahXgY5lpPJCzjpZvOKmXI7cKVrlm6gVDkNN94jCBt4D6kbSnlyPSU6H4v3upGI0MybuyaNe2y2geZihgl0Ct7M3/rJAqC1EMkz19kUgyAgjwLTQixiK9gIcuf5VfM3LiKJHVErUJ2xHvjBTc4Ni3cju3JfUsd/NZ3sy4VSfouwHyVJViFiJY4ZwSYrUM/QlSdFTKvLyetPQQtDfvGs27JXS9ZfnHL5V8N9XOHfzX7r9TDuqgzcReE+5BjCwtCWQPJZaPppub9wu2OcPZBg7hdPWv2/63QIe10q8wwDn7yVHSPLAWjdadKehSq7zewQrkG7whXim+cIg/y2KJUDHXcvHPAv0fYIvUBiLqcRlvF+/8ivUT2FJSTw2jaIIdWqoU+Q5ydjK3MwbBMPzX7+RfAMngssASGHf0xJe2Pa6MU9jhpC9Kti5/T2XG8DYa7bSJwwa2sPW0f9LkMmz4yaDrL2kA9L2Qp6s18vEBZQ==
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a1d19cb-da66-4795-4210-08d87b68bc17
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 17:41:43.7530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z80V+phxzT5FXAb6kyfHYlSjdgoU5p0RiV1VN1lkFlB49sMjtjO9kjJrvDLt2c79WELv3li0GuSU9KjGPugabQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2434
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Saloni Jain <Saloni.Jain@kpit.com>

Below CVE patches are whitelisted as changes
are already present in source code:
1.CVE-2016-9596 (Duplicate of CVE-2016-3627)
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408302
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1319829

2.CVE-2016-9598 (Duplicate of CVE-2016-4483)
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1408306
Link: https://bugzilla.redhat.com/show_bug.cgi?id=3D1332820

Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core=
/libxml/libxml2_2.9.10.bb
index 90890ff..4950beb 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -24,6 +24,11 @@ SRC_URI =3D "http://www.xmlsoft.org/sources/libxml2-${PV=
}.tar.gz;name=3Dlibtar \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
            "
+#Changes are already present in source-code, hence whitelisted.
+CVE_CHECK_WHITELIST +=3D "\
+    CVE-2016-9596 \
+    CVE-2016-9598 \
+"

 SRC_URI[libtar.md5sum] =3D "10942a1dc23137a8aa07f0639cbfece5"
 SRC_URI[libtar.sha256sum] =3D "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea10=
0edc2f262750611b4be1f"
--
2.7.4

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.
