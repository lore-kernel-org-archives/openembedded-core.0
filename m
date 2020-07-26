Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.92.64.34])
 by mx.groups.io with SMTP id smtpd.web10.25858.1595755515442661496
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 02:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=W3wcpkQu;
 spf=pass (domain: outlook.com, ip: 40.92.64.34, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV3dZ5EoTByXJie+MyeVrCIWrw1yjGJ16if+HdRX2BHywTmksCB6kFjhCWUlg5vbH7t4a++VZ2pzPAB8JIWnsCfhqyYnFGgiaxR24bHi5VDFJOylzVjYhMC3Sk4/QwySbPjfEYrct0UygVeWgfcc7dxmbqJmHG8/i1SIjsFNtdrS/yxPmWsn7pPj9av9/dZ/gxhkV5gxn6ehhBKqIA2gIZe8rF2ZesvU8nFTUvzdZQo6PHkDoP2D1oyXlBTYKW0KwZ/7Y7wp5AdVugNkd15z+AddFgKbxaOHcQDse+J9ClxCOqJBXV3kv6HXl6FNoYrzNCCxXUckaVmOm+9BUGH4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+e+eCOrLGVPnjjt9aL6xTxFSYEzvzI4CTqffLcd9lM=;
 b=ffvYsufkz0UO1YFzbLSqkKr0Lv8UkasUEQR0VYbw+yiy8g16q568g90pXBuZcMFToAJ6tWZbfF8S4gn197OyBez2i/1MBlMm/FCC3QISdqHAAvkn8rlrsTxdTV4fP2YuOO9PHVaXN9qQghWTkNvaXRBrOc3dS0CnFy3TEGDqG97tPVM3ITTiAujk5CS3LeEWIKxnhxMvGzK6J62adgIpnItiE1nsc1YoQQWagvhxbSvLtYK1F150Bidym6KmsxBz2gqEEJbfyFpFH+g0MuEOoSmlpyQoXAAKJW+BTA/eiwREZpORXGz0GS3yUUwaoK7s9pH8Dxd+5lyQjviQpeW46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+e+eCOrLGVPnjjt9aL6xTxFSYEzvzI4CTqffLcd9lM=;
 b=W3wcpkQuwspQOAhOM3T1VeO9RczoeHhvudDr4iZowxUe4h2jO1Y1as+Jujow3ELjGFN6EkVZrzwN3SggNI/UcUBvdUf2Germq38tEFjGRvnnpqY8oNArMIHWIa9xEOcSvwcJL1vgGK8jv3XhGgUsAg1i178PogkbGDO/f7URmxxxk9YvZdKDchK3f1oPM7bkdOKlEHllWve5qswX+cJMU7NLH0gEFzF3x9lD7BBUIiIFK79RkT/p4d4jqrwxV0ox6KxvgG6yKgoNAe/20nuPujv6VPSfisi/HUfw2eNso7T7aY3hX+3PwDQYv47n8H3jAuk//hundJJfZ8jAMHVNaA==
Received: from VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::43) by
 VE1EUR01HT013.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::122)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.18; Sun, 26 Jul
 2020 09:25:13 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::47) by VE1EUR01FT020.mail.protection.outlook.com
 (2a01:111:e400:7e19::234) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.10 via Frontend
 Transport; Sun, 26 Jul 2020 09:25:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:593D9DA17E4B9EA423115E7A266B963674D2B3300D3203FE473544D5678FDEBC;UpperCasedChecksum:2ADBCE23BCBC49E0B5D3E8A2A278780F586A39E4B96B8E9C9802582F16B2FBE4;SizeAsReceived:7415;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3216.031; Sun, 26 Jul 2020
 09:25:13 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] cve-update: handle baseMetricV2 as optional
Date: Sun, 26 Jul 2020 11:24:50 +0200
Message-ID: <AM7PR05MB68816B5E01EC9D7D6848512CA8750@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM5PR0601CA0048.eurprd06.prod.outlook.com
 (2603:10a6:203:68::34) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200726092450.8734-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.87.220) by AM5PR0601CA0048.eurprd06.prod.outlook.com (2603:10a6:203:68::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend Transport; Sun, 26 Jul 2020 09:25:13 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200726092450.8734-1-kweihmann@outlook.com>
X-TMN: [uy60GpDQ6jmgkjx/HbCnuSYBn/ZgLWYV]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bcd6d6ac-eba9-4bcf-acd8-08d83145ccea
X-MS-Exchange-SLBlob-MailProps: 
	0RSV28T7LqSUbJDRmy8IQKLewJiYTBZh6BCyG7uFIvehlL+eAAmXAEiXfQl/ghVU69644F/58dNfq9FD4rv5RX7NJ7HuPWNaHSeyi6I4uD67ermcWiaBNzuT+87A2HngzL0mtLC80kiuJU7gAMF6I2mf2JrBurcUQwV41rTACsf565rxU4fnecRx/rxSKHBtJV2RlUP41KZLErgb+2CIxvMgVuqinAV8YVUkjrdu5XKYD96tINuFSdOkOzdE2M+qZyXx4By04DCJIGbwaawrO5k0dKBSJh/kpel8zLhenOALkpMKH9a5SpIaLxnxFRn3QK97Tss/TaPreiF4fUhnTFsSa/4H+Qzkmn4dacMPYCl4Xj4tRisZzUzS3PUUHBq25wyO101YSQdLLIDpIVxENUV0WcHJ37t9C4M6ds8XaWKqO45/4Zb9GUllDFEcLikdlclkweBpphlC9elNuy+DjPpS0/lup/oelG+joQTnpKd664+xr1okCuQrSvSXINUkUosMTLhOQFJ1BcIkDddtgyQQU1XBPTbqDErFIh2hU1ym3LFZ9CSfOVDjBrrPYUJqwBFibo0w2VGFHMTkuyDalHrumoTSd74mm075Kn5cUYJMbKzRlOMyISFXMYv+LV+cQ1V5DP4ZQmYdLoccB/ASaLAL4Y5uOz3u8xiJ2dHfGviG3EY3Vhi8fVBaMr07UfrP
X-MS-TrafficTypeDiagnostic: VE1EUR01HT013:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	btubTixu0wqfU5GzFPMgfuzgAOhwslgo6Cp0KAck89TO5yvBlh4aA3G3w97ouAhSru4O6nGp4AJjCUTdD/UxBwP4omNHSBD6vI4FT3bmqarerWHzsDfC+9PGOn4atOgKB66P/VQYSKyOPcevfsZ9XD3X4tUG+/wY3d506UpXIODC5do7FzHcl1cXyHz49V4xJlgBB82YplnkP64XFqEJLA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	CeK8ATRhGYr6/HlLkqmX4hZRV3DwYkmEcADS01pkPldP16/0aEuhBPxTLmK8A1wWdmwVi3I2+ixp3W7ipsNrfHlvQrZrbVGC496co7757Uy0JRuylIn0QMgNf/W/Zh8mV1tOcE+3wfg2Lk2qgiuyZg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd6d6ac-eba9-4bcf-acd8-08d83145ccea
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2020 09:25:13.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT020.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT013
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
index f27ade40db..cbc370ffb0 100644
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
+            accessVector =3D "UNKNOWN"
             cvssv3 =3D 0.0
=20
         c.execute("insert or replace into NVD values (?, ?, ?, ?, ?, ?)",
--=20
2.20.1

