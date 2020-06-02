Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.50])
 by mx.groups.io with SMTP id smtpd.web11.608.1591130700387182262
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=M07yUnwa;
 spf=pass (domain: outlook.com, ip: 40.92.91.50, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKONDrjp/sj95SrJDGAIyHqYcHLEzWFHb4fWslt21pyDVb6452VRYL0GHE5gxsuMaH4BlFii/+Q/j5A9wOrJkCQvdboEFTYORDutekcCzouXhbcCtQV1CPNJSym7/RFzQpWXI3h1eV4KJHmpf5Xe1+i4zfnTUvLtCrDs1yA4dC+sUiHer8VjQBsqF27iqpAzk236jG60/n+/4KW3IMjHSfmZ0cfCxtLP1tqHhJpu8Ybu1YVS/iKsXcNtO6TI9XUOwCbd+8C/U4lEL/rQK3bt108DdGgNB59OAgoJVKpuAiMqDlEm3N/g0yV2sjRPPogM05grMiBA+7Hf4s3/YCSp7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw9S0YYhab2+u15QfgNmoIqgZPBguU0j8uanOaNtRPg=;
 b=RZ/oNzqGtu1BkPcBMMEQjb4rHXgpV9yheSSHGRL+8oIf4Ax0xrx+Pgz9adsVOmSEFBRJwJWJHtbClm3vigk9hZBfEgxxhBsEeWjfcpLs3HLKLYvcyBGzIFZOhOkZ/yCW4SEzm2fAH9gx2rikF++Vf0cOH0TZFurNtPoY+73sM5PmMHPJOnyggXJr7tbP8i2h7175e25f8TsUmZmwIYHz6NsTSsYpUP6XjGnFsXRQ564V+UzeJ3PVhUmLizH7lzyiYczO5JshHsytFUnX+/uS9sIdH8uY/7H9myfXhCchNLP3+dY6bpoJQUW/2GiCsPhWo+U5SU3EnRMiyJGgSGCexQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw9S0YYhab2+u15QfgNmoIqgZPBguU0j8uanOaNtRPg=;
 b=M07yUnwaxbSqSXwt1w9cFTo30X/6mx6QOw42VBNTrz9BpSqasjXilK36LmWWoDzewhwL9VXFc4CBjt1FuxGVdZVfuRPBZE1OOFu4HlFj3MXGSgS99HrKCbUxY99kbbsUsRkvcrxhZwTKe18bVEn32t5mv3mqHAmwCqx79CdbTw1+th3MjsC21GCOCFik3BmFcKWX8y+Zlrygpc7ft/dYSpjE4VosgveVH6sd+gEUyNknFxO+dWp4FOwhMR6NE13W9KvJqJdHSpg0hC+xB9BOPe+O1J4TN3vZcAPi0EVbTvkLLrftPflvFEkSPPss6gt7R9Qh9RkygTHABTmcZHZvzQ==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::47) by
 VI1EUR05HT175.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::352)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Tue, 2 Jun
 2020 20:44:58 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:44:58 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:832A3472817D9716638C6B87CC0789B5674EF1F816B2C679C9630F1E8A4E815D;UpperCasedChecksum:500A71B15E54E5ABFDAF99396FA00ACAA01BAF2092D8DDA89F6AA86CE768D794;SizeAsReceived:7573;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:44:58 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] debianutils: whitespace fixes
Date: Tue,  2 Jun 2020 22:44:11 +0200
Message-ID: <AM7PR05MB68813FCD2EBC0CC1CD2D5001A88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:44:58 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-2-kweihmann@outlook.com>
X-TMN: [YIvU2oHNrJzNbIjSyIvPNt3QaPHb7pTN]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: c6028564-1304-4e06-6d3e-08d80735d056
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxZDRLgFxEZNXonRi+PvJzl1mQX0oUDkLuA6jRGka4RYxYau7p0R8uKe6yTQLyJIIol1jtYg/cAmz9+Nrr+L58Or9gQRhRqDxdr17JGPNxD0K/qepEiYrM2VP+Gnh8ieF+2vgTqq6i8g6EOReT7+N7YtzACMpLpEbDo/RRHS22yltk4nEA3kl+LGrisGYWeKiYah9Umn4CixleI+Hel7pAV8kFA56xssf1hWPinQy6YzDLWWZTDXxd8KnbqfVIjQAyrM4xQ7zcGYRQHWOZEEWsnQmUTEQ2nbYJM4eKsK++/p5rpKgBZBNjohF3wGQIWzfVoX3TOHV+CsMLdO8SZHhluCiYWAO3uJvropXm4HPlYUGo3axca0RnauMz2OD2LmRLHNqd1l2LAJFkhHmiJyBPYL4qhL1Pe4Y0aBZn5sj85AQrk1Jv7/8WsjPTZHYZRvWX9NrvXf4v/W0IXWv5XNRjo3QqU4vQFBmraozEzx1dwNILmBD03Ig2fSUdJl+3aBd3qzQFEQ+/QSRNP/arFOJH+81zI8S2oy2ODrK4FHUtGqz8VsdxWVNfG1dYSOf9DIji6wf6ybMLeskRP3JtujGqsQx1wjX83CvAoaOE75K9dzCOqY+YGdm9m3PSzoicE13b+jz01Y/U7I8GG72j7+HdtJMHiuBid/7qegZekQB2eeK4HnSZNXTEtFFNOWluBDpPf/EVmleTmOPMrpZyRycF5htx344k4IPZNtb8x3ny2/g==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT175:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xeZpR4B9+jefn84p9D5NqGwIKFpLfftv4XURoSL5RTZDDRAIN/FJgUXBzi9iIMmlCsH0r2k5RoR3TcI3AYJCB0lblakLbJ4IwEyvgjrSZtc9sN9lPSQOI0cq++ScmWjlbkVG8NLYw5GRoXAwe6Wj64dkOtLkEI1YD7Zhg8f+AyP7Wuu5vSYyGR+HmHRB4LcKY/s9rJTidKByiKOKIcl7QA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	RKbdsrYfEEU6WWE2egFrQ4ec9OAHEjQNAi+6engMFnnfSBuFJ7n5US7RSayz22SI2fVd8lsWGeI6HoyNo/2Ol2oBJzHfbrxrdJaNyubRCyN16c2IGKFd3sQdYIfma6aOgtsntZFk0Uq59fUHrWvXSA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6028564-1304-4e06-6d3e-08d80735d056
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:44:58.5201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT175
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Added whitespaces around equation-signs

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 .../debianutils/debianutils_4.9.1.bb             | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-support/debianutils/debianutils_4.9.1.bb b/meta/r=
ecipes-support/debianutils/debianutils_4.9.1.bb
index 904c52780f..768f28906f 100644
--- a/meta/recipes-support/debianutils/debianutils_4.9.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.9.1.bb
@@ -35,7 +35,7 @@ FILES_${PN}-run-parts =3D "${base_bindir}/run-parts.debia=
nutils"
 RDEPENDS_${PN} +=3D "${PN}-run-parts"
 RDEPENDS_${PN}_class-native =3D ""
=20
-ALTERNATIVE_PRIORITY=3D"30"
+ALTERNATIVE_PRIORITY =3D "30"
 ALTERNATIVE_${PN} =3D "add-shell installkernel remove-shell savelog tempfi=
le which"
=20
 ALTERNATIVE_PRIORITY_${PN}-run-parts =3D "60"
@@ -44,12 +44,12 @@ ALTERNATIVE_${PN}-run-parts =3D "run-parts"
 ALTERNATIVE_${PN}-doc =3D "which.1"
 ALTERNATIVE_LINK_NAME[which.1] =3D "${mandir}/man1/which.1"
=20
-ALTERNATIVE_LINK_NAME[add-shell]=3D"${sbindir}/add-shell"
-ALTERNATIVE_LINK_NAME[installkernel]=3D"${sbindir}/installkernel"
-ALTERNATIVE_LINK_NAME[remove-shell]=3D"${sbindir}/remove-shell"
-ALTERNATIVE_LINK_NAME[run-parts]=3D"${base_bindir}/run-parts"
-ALTERNATIVE_LINK_NAME[savelog]=3D"${bindir}/savelog"
-ALTERNATIVE_LINK_NAME[tempfile]=3D"${base_bindir}/tempfile"
-ALTERNATIVE_LINK_NAME[which]=3D"${bindir}/which"
+ALTERNATIVE_LINK_NAME[add-shell] =3D "${sbindir}/add-shell"
+ALTERNATIVE_LINK_NAME[installkernel] =3D "${sbindir}/installkernel"
+ALTERNATIVE_LINK_NAME[remove-shell] =3D "${sbindir}/remove-shell"
+ALTERNATIVE_LINK_NAME[run-parts] =3D "${base_bindir}/run-parts"
+ALTERNATIVE_LINK_NAME[savelog] =3D "${bindir}/savelog"
+ALTERNATIVE_LINK_NAME[tempfile] =3D "${base_bindir}/tempfile"
+ALTERNATIVE_LINK_NAME[which] =3D "${bindir}/which"
=20
 BBCLASSEXTEND =3D "native"
--=20
2.20.1

