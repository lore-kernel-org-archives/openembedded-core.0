Received: from EUR06-AM7-obe.outbound.protection.outlook.com (EUR06-AM7-obe.outbound.protection.outlook.com [40.92.16.93])
 by mx.groups.io with SMTP id smtpd.web08.12220.1617987104531276792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 09:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=Cb9CRTnw;
 spf=pass (domain: outlook.com, ip: 40.92.16.93, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fh+CY1nGIPXu+ifsfcXGFZhIsOqLwGUhzx1BpCrCFJIt2KkJlIfrD/NJMA1okyIlzJeYJVFphAzrtroW05euRaZKLqdKEydoZyNBVewOkGY+XGSIpkDCmczJkZE1F5Ata91oC68ledjH2dBow3FGLM0tQNRVwTfGYMhaNRxAmUlaqII/otOwrkqd1h0r9D7pb2g5BFcPt5A8r/dPsKpnuLCKJL3R2yn0g0ZLzwURe3+SC+ElwDcOKCdjjytU7mP/UHYX7T44Xdvo/fzDbFX0qGthB1YEs0ohxh5dtkmGbVH8No9GrUoAbBqm4ye6GFNt8zwqKuWE2UFPb+KSoQAMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqtWzAwoJgds7hLBUD8ARdCNr23jF6H+RSh+WInBBug=;
 b=Dj2Q1PaYF1RPugbtcDx6opY9wfM47KgzL9dFfYw3dszdr8Iy68pWag0MRI4bW6RTtQmd7ULXDJtlH5iGVZytxAgyP9dMVZmInMs1YS9pw2RdDEdm/I75tDccJOU4OOtFq3znGKNtUrCwAQLFAOuTzw7BzO+NbF/RXDApJdB6775ZSrdIaeVXV5Qb9N5OV6/i8YCC+mSTvWKVrr4KElIktB5+Zyo7SEAGa1DkxmuT0wEVCxb7ZAiLZ9ceOzC7FlEhHxeOOmxRmRz6+SMtT7mGO/Hj89/AG6tqBxEM9ukz/yihPnJwWk65l4IqOOpaVDZeXp12OhYl5GVdWeT1ynussg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqtWzAwoJgds7hLBUD8ARdCNr23jF6H+RSh+WInBBug=;
 b=Cb9CRTnwv9GMkLNrgndyJv0NOv2a8Lx1jHbW32vgzkdCbD3+0ApJSotdo7PWVOyp3GNdfzOHw4rKa6ij1vD7WRoX+z6llYnU6ID+A2CSStLXaWnfEo0whhnTQ+5SRxX9KYXdzHl4PQlYupiT0CQKbGpDylp9co4b6wzIWWEAG+R+NPAHguwzUpSW7VSOTXH1Hmbw7fX0t6tEadM7qtf2rb9PuLIysS19/Q8CZxSG8lj8ZOLrPudKan5G8QDfMYGHqt2OnARXDsUceSS4ITUARjI288rx8xUhdgCrCkiLbC813gjFOxq2HdXRIdg6UQx2dnTz8ld90WC0Cb74ZUnfLg==
Received: from AM7EUR06FT060.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::4f) by
 AM7EUR06HT244.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::108)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 16:51:42 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 (2a01:111:e400:fc36::4a) by AM7EUR06FT060.mail.protection.outlook.com
 (2a01:111:e400:fc36::446) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Fri, 9 Apr 2021 16:51:42 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:600882D31C2C74E5A7419826619E18E727008F31E19359341803D4DD1E0BF742;UpperCasedChecksum:88D066A4CC30B9C28F83F9AB6478D1C77107E57C9C88E95D29A747768CE19164;SizeAsReceived:7301;Count:45
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::35f3:a85d:b2c5:d4b4%4]) with mapi id 15.20.4020.021; Fri, 9 Apr 2021
 16:51:42 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cpan-base: set default UPSTREAM_CHECK_REGEX
Date: Fri,  9 Apr 2021 18:51:23 +0200
Message-ID: <AM9PR09MB4642CF1784A0921E034E0F77A8739@AM9PR09MB4642.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [bWNTFnLQBEhzWbyquvNjGon+UHdZ8aMQ]
X-ClientProxiedBy: AM7PR04CA0003.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::13) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20210409165123.683058-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.85.34) by AM7PR04CA0003.eurprd04.prod.outlook.com (2603:10a6:20b:110::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend Transport; Fri, 9 Apr 2021 16:51:41 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 72db7b0e-cb58-4af6-5c52-08d8fb77c05c
X-MS-Exchange-SLBlob-MailProps: 
	K3wx5smWY1MmHaZHwMWEH47Q5jZNz+ocRjHJfeqZPBNpxVDDDSc2cCqWlo4bNzQcJJw5DzIUWvq4DLWnpFYpYUd6Ts3VDNHOsevyvpcVjamow8GtrqDKMiHvJQv6feJiCKKrEmrr+1Oktp5oWlLlFS/vHFJdtLKCH8EsUSrnZx6I7af/9ZZYXpBJFg7cIiVZDPD00sN+bWXuG1Gezj/L9P73AoJc+MZdmXawotDEvuYByRQ7E7Ys27G6hCNGtamqSJnacXfGAdKXO2E4yBMr0BE+OL90N3KFru0EvguqZXcwWKfVhF6M9imZWRUbsQAmnUAs78Prs3oRudGTIm7jos2imQs0zkiy+i9X2Xc+bZvIbMnzMP2eI54siWPvI0k+JCYUeHSsaRVt1smRZpPC/zvk/koTQaZe0swunPcsYxyOt7sbpG+79JZ2KcJHd4r+rQ5RJHkJlB6rO+FqfJoGTItYxWQFvYgK5wV7MRifdpBCuSyaBXev4dIY5sNRIPXls0/Y7yN0Fsp8IsVEVi+jy4sVF9vzO7g0vhckPblOJRxaLZvW7QzULSNTt7/FJp3Tr/NBZK7h3AaeSR0AwufA3JExNE0vE8bcN9WwO20DbS2s0iyjjlc+fZ2L9LPrWkkG+RvrplmB8vWuhypYSDC8OIlMGGGyAa7+a86LzwwAVPVe3lrXdeWbn3xS/HAmcvz4WVL4zxUuQUfS8+CXSQR1tV5ZNKYqMBoxMJR1BIk2T+JfCpk5RX0Uq25jUxddAWUanGb8DaVzS6Ak6QpYy/9ndKoV4HpsV58AlsRdpPGMM6nHZWGAA5bDw3sbZmEWBNZXc+DoAf5/IXP79A/UZApKg9ALo2ICUvcaDJPTI2ylvXGEms+hpIzc903LH0+JXejmyUT3t2mvV+hbBVjMb1IqSP31Do78Tj4gBGZEOx+uJb8=
X-MS-TrafficTypeDiagnostic: AM7EUR06HT244:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LjtPnLBJ8In3OV/zj/qPQ0fbOFJHljVr0BUjKRE6emIK/albqL6RenKO1DfRCFornbPnYtNJBq/X5j7sR4PudHWIjCIer/Tna428QOFGI8kbS53L5sQh5+W70mqRyvYMQde8+TrRwR6VWHQj2Kr1ygRp4lWBFv7Xxjep25qBJnFXoMmnbppa/lF5/K13VxwPEVsnfBPdfuoPIoQQTXVajnoz2A0R1R9qchfJx+W1oPMynblVkWgSLSj4/UF+Ef/7H4kzIqal4nP8hhEIx5ac+Gs6tZFclGERNb0fKnUbc2fAUhfgZsisY7JNM+1JMmkFu+bb1cbeCgLJo3t6IXS2ViP0Izf5J3WSGX7eTXAuwpVHBaTKfuOVaa7QeWC8vGvCo30EYZPiaceyM9T41LETovQBzbc4a1Au414NhvY+epRyjKKTpVJwA/H6zMjHdv+2
X-MS-Exchange-AntiSpam-MessageData: 
	v4xKpcrQsZwiMmSpEeUdRlMzuFlGMAP45D3RVZHxzL1FhN5Obh7XH9zvEubFixK3OmvM95KdCWsQ3fBnOL0/tYxT3QoHwiEQWzz0+KFXyNg66Ck7ACeDM+1rz7nICAqoO8sYqpHdW26aqnsXNKjT5A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72db7b0e-cb58-4af6-5c52-08d8fb77c05c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2021 16:51:42.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR06FT060.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT244
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as cpan release versions are almost always follow an a.b version scheme,
it's better to filter out beta releases such as a.b.c.
Use the first resource fetched from https://cpan.metacpan.org as base
for calculating the needed regex.
In case nothing can be calculated fall back to nothing.
Add this to cpan-base to enable it for new & old style cpan integration.

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/cpan-base.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclas=
s
index 867edf8707..1fc3f0bcb0 100644
--- a/meta/classes/cpan-base.bbclass
+++ b/meta/classes/cpan-base.bbclass
@@ -16,3 +16,12 @@ def is_target(d):
=20
 PERLLIBDIRS =3D "${libdir}/perl5"
 PERLLIBDIRS_class-native =3D "${libdir}/perl5"
+
+def cpan_upstream_check_pattern(d):
+    for x in (d.getVar('SRC_URI') or '').split(' '):
+        if x.startswith("https://cpan.metacpan.org"):
+            _pattern =3D x.split('/')[-1].replace(d.getVar('PV'), '(?P<pve=
r>\d+.\d+)')
+            return _pattern
+    return ''
+
+UPSTREAM_CHECK_REGEX ?=3D "${@cpan_upstream_check_pattern(d)}"
--=20
2.25.1

