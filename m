Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.16])
 by mx.groups.io with SMTP id smtpd.web10.17501.1599388893565294691
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2020 03:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=t0yEMiWF;
 spf=pass (domain: outlook.com, ip: 40.92.89.16, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VW28nEbhiipEESMHpMQVq7dE3kS19hPKOKWOv7xY9YQriSD2mF+nR42J0Jahatnj5OcJk8lqTEpYCaRROFfGbQu/wemvo95bHyTfs7yRjWgvvnNSMmA4dCoZ+SjjseGpVi7zCYj9lCnakrDuaJVXJsu7pBUrTwp5M5Jf5+0e1nUmZhXRgVGFmtc7idE5TmKMBwE7inEJcMfDDfUfyQlq77laDMjgGnzKUu8SZaHXQmXpNNBVK+38CDZ30fZ+5bLfi93B8zJ/hd8RYTpd68rPhMyICnqdl9ILKypx+IS0wzTZg90tZfQSFVjvSHgU95ZqaK58kRtdPsPTx0pdtuHTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ple8caO4nuTIpn2FYCvHBcCvEyD6bmB1KyTtp7N6C/8=;
 b=L5xoZ6mNHDODuAMK8f8kaY24DteZyHj+Q7G8PZz1TFCIWMcwRv5QtRMZUhHALWrlwYQga/ptAVT/rYopfnaDYR7/XxuwIuUVHDw73rgk1aDkXs8ZnLqg4Gm1E20Z5+ERr1m4Y8JmoyM0EmiDg+r6F2Fnr2fWdF8MSFNpEvepeavtw8U669nbbH7dHvbXVgY9tAX1DE2KC46PbToWeRUr5fqOHGH5bTwi1EHQ06ccXPxE5xyIBJ80M0CKvuYYKe3hdFxUs6nB0fXYA3G0w4zeRteYzTmigx911E1EaZ+h5nNa99YytNCTjITscF+ml+qhS6XdMdPAG4jK4B2ov6OTMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ple8caO4nuTIpn2FYCvHBcCvEyD6bmB1KyTtp7N6C/8=;
 b=t0yEMiWF/l2HY5qrGmjdBSqqqxOAkbcpbfKXTmtiZwlWa8wOUTk1uMbP4/Cy7wQzulvYmn6g1bHgt4/WTEs7ivvZsnzuMwSXVbyyC05etG58a/9FjMxPzsUcpQXLbXzJva0lbv9pIV5izxds9H0HqXoFZjmLwSwzUrpMyIKbwPwIucUEUxKauH3bzo1+8BATr3RDIWYgheB+rYYxhCbh4IMOosQAFBm9hXOedP1Frckb244qD4ByDw4Zn9Ub1bId9gJGXi+liy2FjTYKP3Umd03Q/VmcSgHIjSXWIGnyC/693pxC8+Qn9yoMSnol7txkpm8JEhq8FentKMXalD21fw==
Received: from VI1EUR05FT014.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::47) by
 VI1EUR05HT189.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::229)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Sun, 6 Sep
 2020 10:41:31 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT014.mail.protection.outlook.com
 (2a01:111:e400:fc12::121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16 via Frontend
 Transport; Sun, 6 Sep 2020 10:41:31 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:26D241AE2F1D33E57C9EB6B07DBA48D729CACD737A273750FAF3A32EFE756F15;UpperCasedChecksum:FE5A26AF3595F99485DA50100DF033AEF93F002C6C59B9D08250F7F315603F28;SizeAsReceived:7456;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::a1a8:ed42:7e0f:10dc%7]) with mapi id 15.20.3348.019; Sun, 6 Sep 2020
 10:41:31 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: akuster808@gmail.com,
	Konrad Weihmann <kweihmann@outlook.com>
Subject: [warrior][PATCH] cve-update: handle baseMetricV2 as optional
Date: Sun,  6 Sep 2020 12:40:45 +0200
Message-ID: <VI1PR01MB646291A4E0E0372B863EEF46A82B0@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BE0P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:a::26) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200906104045.534977-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.149) by BE0P281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:a::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.9 via Frontend Transport; Sun, 6 Sep 2020 10:41:30 +0000
X-Mailer: git-send-email 2.25.1
X-Microsoft-Original-Message-ID: <20200906104045.534977-1-kweihmann@outlook.com>
X-TMN: [m06/Qo2kUIfkPChcjwXNJV+Q1CC/PWuj]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: ee598722-e60c-4a2d-693c-08d852516ac0
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtz8xYYJzKoAncfhzRhJgeiVGVQ21YaZoEb9Hf5pGnMzvwX1aR36L0UsdZN0r86wtdN01z0e0jw0Jqow4RsMIL2KGmXVnvyDLvsn0OOJAUySTMGJi4xOzpYWS2IftTal9HJgnfeFi2VW9UIsv2dRZN0doQRYsg48ATvcp8hXwZ0qYLS3ADfDhfaxh2f+/xakPm4Kd4E82gog2N3piPB8B4uuoM1tuzoDWFzijDFqt6hS20Bg7Ouct9yE2tgc6Zmlu4iE8UAgKxnWemMC5fr6SFrnr0+D3XQ4FhAlYIionFVHWhc5ZJLoCgnPAI87yKoIw9mHy+KZgZp8m2r/QEgSQwcLJqCK3A098O6d0nqgY0aaf4ljMcjYH5NHW+/Va+iDfhB9NWP/WqC5liBcG8Kws71l+h0QtmtRIJ8EtK3BwYe3vxAmWyGw3JW5kYTIQcfu7YTzANeFoOI4LvrEeWZZ204uFKOh9b1zMKwRI1Hzzx5yhEEnSVxnKU0Qwlm+QRPBbUQqUToEGugk0cwBAaqKDR/KFdXxYEjYpJ1DBff00NbXSR75QNLspALn3xVm6mrR71zvVOB+0yMVxWZC9nMwrT1opO4ufSYPrrFwcRxxeP1zPLCsqufito+M2QgasReri4aj7z0oesfbDzbX8uMmts7vLCoNy7mOt/tE1fbNcLaUqieCbSOgUQ0AEujIj3Obzk3U1dk03y2KezBIc0N6c9KSOBV8XUHb4geLYWI069XWLw==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT189:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+L65d/UDuXB5DtuiqZrH0i/l4wjZVY59gXw6BiRv60m9WysGd4roCzZCWbgRqJuVa/jTSnrhMBu1tLCCvlHvv4uGmySB7XKw0xr6skfcyswsisMPhnhlB9eRDC2/50Ynkrk8DMh2U/ApbOgd/y1MTxjqhJn/iu30fi3ULY8Tv5GSRoi9qagW18vtid034/NWBkfpW/u0RfksMKw5v2i9KQ==
X-MS-Exchange-AntiSpam-MessageData: 
	viOIPliqBWfPpFsqvHi0k8Ia9fLuYZFr3YAl1IsKq7or9KMJMJVkCSXKxzod54DXVhgoTLTt1EzSRpBbJwoFea+sV/EAhd0H3SL18Eh5uPLibD/dpB44p4h8z9TYF9Nf0FseDHvON5bcmftiiVVYTg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee598722-e60c-4a2d-693c-08d852516ac0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2020 10:41:31.2889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR05FT014.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT189
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Currently in NVD DB an item popped up, which hasn't set baseMetricV2.
Let the parser handle it as an optional item.
In case use baseMetricV2 before baseMetricV3

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-=
core/meta/cve-update-db-native.bb
index 1b4f31692b..c64dd768c8 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -160,15 +160,20 @@ def update_db(c, jsondata):
         if not elt['impact']:
             continue
=20
+        accessVector =3D None
         cveId =3D elt['cve']['CVE_data_meta']['ID']
         cveDesc =3D elt['cve']['description']['description_data'][0]['valu=
e']
         date =3D elt['lastModifiedDate']
-        accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['accessVe=
ctor']
-        cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScore']
-
         try:
+            accessVector =3D elt['impact']['baseMetricV2']['cvssV2']['acce=
ssVector']
+            cvssv2 =3D elt['impact']['baseMetricV2']['cvssV2']['baseScore'=
]
+        except KeyError:
+            cvssv2 =3D 0.0
+        try:
+            accessVector =3D accessVector or elt['impact']['baseMetricV3']=
['cvssV3']['attackVector']
             cvssv3 =3D elt['impact']['baseMetricV3']['cvssV3']['baseScore'=
]
-        except:
+        except KeyError:
+            accessVector =3D accessVector or "UNKNOWN"
             cvssv3 =3D 0.0
=20
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
--=20
2.25.1

