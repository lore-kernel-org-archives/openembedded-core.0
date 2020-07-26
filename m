Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.104])
 by mx.groups.io with SMTP id smtpd.web10.29375.1595772636280803757
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 07:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=OTr+kkO6;
 spf=pass (domain: outlook.com, ip: 40.92.91.104, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1DYT+lAF74zQSDyRHpUXEtW7EM5NsdpVWEXZZMsmCW/430mx7EWD4e+gfuR7uBXmrNPdIcWCEhded4CzpiOcXVHA/U8ny+KW77qtf8RQl0Pvm93NWQ+q0ttD67mF2y/L/xlF/l8FYfq2YLrynaAHxpxEf8I6PLFNFjxjvW3mMjJWrN74+O9+IM8+sJbcktb9UfB0mIAsys0YSpPgJwbXLpWlXbclSwHfwIPTts7eaW+ww6QCsjFU/wDDV5QyYAgg6E4iwQPr0t1rdrOQPvE5BBY2xRHExg8ncRKMdlpObSRzCpU29nHIsbAKfiR9xXMsXNyicjVEEoEfXvKSZv3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNlXTs4R8Fl2nlF3YFVKZ/LUVBTyVjqTEa+eNOT4J6M=;
 b=nlMzQ7Gcwugylp3FemRFDJl2zWnAZb4893LfWeoBnlKhGcOowX7euOHSKANt1oKSjub2ueiwLl2nJmjEhIyW4KezC+NK1pCzwLkBx97Qc/nd0+iTy1Gq8AZG/VcsWq9USMmA8z3MVCCXVQ789GflOZMIGu2QTgs8zO0q5ArBTcqCExp92cjvW4e8aoOAWOGHDISpuFHrwRdprDN577KBBeMFlXwhFjGMuPXR+EWqPojhuq5U49UBx9xqwU/tR9pIVHcvu0Gqx7ffkOU0RQeFhw8XGzPuWCkttH2X1XQoYlyGKo6F94H8JGKokk2AyQVlHa3rwUAHcM/B67p6kNYUiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fNlXTs4R8Fl2nlF3YFVKZ/LUVBTyVjqTEa+eNOT4J6M=;
 b=OTr+kkO6vcvTonTPmr1zUDJtnVhlpgmtKks7pDnVdjH/U+yeZlxpqdWE1gyNPkECjoRdCABFzIpa5Ey2CnELmhCCO+WfR5n+60SOFtuPVK5xOhhzTxUAFOXAW2Nhp8SXK5ANfVy02qsumZMCWegtacmFOE2Xb8WmzvJwLT7KX0Iu8cnLnXBm9ewz0AGllE48QsgsbSVtltGMokCktNehdFwxhE3RWFKj78FBHP3sWk19C9Nt4cXogDKhGmZC5XOZXiFdx0U5bJAotrjL+B72yj3Nt7FPfNqCj2nqW/ESG10/yL6Hvo8hT/aJD0YWjqNfDUsDphRicIiTAqO3wEEgfw==
Received: from DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc0f::4a) by
 DB8EUR05HT203.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc0f::295)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10; Sun, 26 Jul
 2020 14:10:34 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc0f::48) by DB8EUR05FT033.mail.protection.outlook.com
 (2a01:111:e400:fc0f::105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Sun, 26 Jul 2020 14:10:34 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:79B203BFC5393293FAFEEC202693C921787493F74CAAE13C9E8175F48BF928DF;UpperCasedChecksum:F1EDE3E1F1D165A313F1B2BA3E7DD90E780590F77817B7D3F19AA295A6281A65;SizeAsReceived:7418;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3216.031; Sun, 26 Jul 2020
 14:10:34 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] cve-update: handle baseMetricV2 as optional
Date: Sun, 26 Jul 2020 16:10:06 +0200
Message-ID: <AM7PR05MB6881C647864212D1506693FBA8750@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P192CA0092.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:8d::33) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200726141006.19757-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.87.220) by AM6P192CA0092.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Sun, 26 Jul 2020 14:10:33 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200726141006.19757-1-kweihmann@outlook.com>
X-TMN: [tEbHfs5nyjMsuNBKkgaOyeZ7zsIJwlWC]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b73133c4-813c-442d-8fde-08d8316da98f
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3DnqLfgVr7/bY5LqsjA4rj5FtoVUs6TfrcjUanBdaBEEd64k6Yu662pw592rCx7KBt/CgCdQyejT5KkR4zarV8iBCRq7RR9vUbBXzsYuFPWEJvHCAZ/oY3mYNYkQDi3E1fvkXnGFvXyXlHXX78BRrUYkSXuGp6TwuLoV9ZR5zfB+kyYs3iMTM+XIXPYbx9mAmvRIchtVZFHRVzahlMdd5P4qaWbK2DM8IkzOVvqo9+nS1n/mIil6PlVe/bqn05g4oMQf1gxK6SZb5xh4VVnd8qUEB3GHp2/1b+eVkylYQ40NlzqsBgDRXenIYzXkYMvMF+10s1LvT6ppIucyPzmfd4XHkJOe1f6xIl7QO40aRsq5+OJoLEJh98Z4AiUqCkmPaM1v/7cyNVEL3GHdaQQIkky5b9pqCenZAMStKWHVpD7fJFnelFPgzNobfrrtXpKuq876I1IJHNRAlDspfIrsF/uQldBl6zQgEB4dwl2J7R1jeewUV2YKAMswqM02FrJfdi/sREoMoVn272N64f5jw3vG/LS3s6iJTFRRdZI+B1u31jZsKcd8bdlRYdsTRJ/DEhQkvwsTxagm35ihZxb0s968c2brTzUktk7OPgVxwB+AAMe6ry3Es1gkjYPa4h3KcrRK8glxAuKHSjpT0HY/c5R+MKIczUIfiVRlR2tXDoQK5fU5bGPA17E4TkVUo5uQlZTDHeCLr8wA==
X-MS-TrafficTypeDiagnostic: DB8EUR05HT203:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CSYDzgTXKCLMwXzCjn+CWRc0pop/0qVf7gA4Jou07WZLEo1Lz/syx6eapbiSe19tXYRyVVJ0Sy7fhRJIvxRpnc8Di7JsUxh/gBRBEcgbPKrEPzynWiAEPpCkLW31QJOzpGXUfDpjQwHYoMWB2xomWK/LOTW7hfFi0lQMwB9ahgrLFN6Pvhpuh9p7ualmz1s6EhwYPPwNyprdi4TquhLoUg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	2DYu2P3TpfjZgdfgv5KP+Pwu/C918FQOZZUJcwF4SjFQKCelPHY83rUSwu0dY0P/39K4gYI4pxMJP/hw3wKbdVIZBYpYX5aLXsehFemHZHD7Kb54JqF9zcNXSZ42js3EN+qOgbTZ0ti0+Qpt6tAdXQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b73133c4-813c-442d-8fde-08d8316da98f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 14:10:34.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR05FT033.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR05HT203
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
index f27ade40db..32d6dbdffc 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -176,15 +176,20 @@ def update_db(c, jsondata):
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
2.20.1

