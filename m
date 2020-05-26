Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.84])
 by mx.groups.io with SMTP id smtpd.web12.1325.1590517214988658965
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 11:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=sxbAP0wn;
 spf=pass (domain: vaisala.com, ip: 40.107.21.84, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V7WvMbi4D5BYoHTD/0AL73D1t9V86bglKlV79CWxgKD5zLfGCkMSAUXi8Bls2YdsCcyZ7639yq8XWA92zw5yOoardQ8sdoFB85Ph0U/QuWqPMevhiSct1l0neS7tuqYf2ze6MrvowII2gQ3uGYINN6ZsxMRFhd4Xb8y/45CrIfNSLSGc3zVxi9zkAeTmXh/k+L4ivD/iporHOX7DRlc8QuSDSYF2qscfGBXcvl0ACkNPIedwEFitKn2p0VM8GqPNLpmXCeDuOWnNjJBU+zDZIthdTiWNm5HVsh7F7RjmMRIa79WoTuBa4LOfLHidoICgjY3u2t3Hq5xeQL2l0AWw+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=g3o28PUSyd0E9uzUo74FOC1SUL6AOIfBl4yyjuXSv2ETAAkVv/rlAxu2YA6kkLGr2YWnnCKDbRGGOH6D7QxGNH9LlCNZBvLt7JMWmT+jfv1BNFLJER8frNr/ukSzdfy5YMdVbwr8hPPYRiSscPnwOooFWXgo2baUeo9htKqUS9Cf/nazcM1vC6/Z+6yeuYZ3vzpRBT1z9bzMtNysNOlMGX7fqjargXcs79jkrstchQ079kiBhvkv5S/QcOn8vdA+/lZ9H8W7/H2DTslBM0PT6ituU65hJkFYnMJhzfohIGVR0yfUoFYImXx9MQMhP5BuNRWow3pBOPEghThCizEZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=sxbAP0wn5Due4dyxMbVQvvhB9G7SMINBaqKPsRj6WKrJcN054E5pwuvZlkHmjkKqRO+oLPjBhjKxV7MV9C90ZZ7D+0m1mOM8VZdYYKqEpkyjKVfvx2X1QZd5KDBTUqbjVwjs4+xtp+7uA0L0LV9KCkKXEkzuf+XpeCKllz9f/7M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB3403.eurprd06.prod.outlook.com (2603:10a6:7:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 18:20:11 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 18:20:11 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v6 1/3] Add a recipe for `python3-fdt` package
Date: Tue, 26 May 2020 21:19:54 +0300
Message-ID: <7ef57e76e2fa950fc8630c097df8e3558c92f50e.1590517053.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1590517053.git.nandor.han@vaisala.com>
References: <cover.1590517053.git.nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR05CA0160.eurprd05.prod.outlook.com
 (2603:10a6:7:28::47) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR05CA0160.eurprd05.prod.outlook.com (2603:10a6:7:28::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 18:20:10 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b34a45a1-9295-4fc6-826b-08d801a16d1f
X-MS-TrafficTypeDiagnostic: HE1PR0602MB3403:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB3403E80EC289666FD1D2EF1F85B00@HE1PR0602MB3403.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fgH/4bdbDIpPsYz+st54GURWIENwssBp6HZSSCv0ZxcDgLA5qxhWTolJ1F9inncVerwBGKxaynkoynkemaFtcRx7jEq0qcPLlBmd2e1o5p4Xyci/ClxfkG9+XMaqw0wHm3VIBQE0l+7E3FvIMOz1ifqbeOgI7i1dRkzPV2zxFUgLdg0z2Av8CD8Z9Zp8upSMPU9ENq/g5FCAj4A1TgwNU9yLU5TeD99zYJZQzMd+9KB6s2Adrs3XubSBQBsIC85/m8O1W9V/aDZlxqn5DUPvndryh15qLg/NLfmEy5N5lUkssznuCDyI9aL7M77yP4OleWtGwNIhFi5OfuKj1+Idf1p3Hwz4Y1quMyvmoN3r+GAuhuH/htovl8wonykX8lsDUAHAMPGeLfW1q4/5HGuatEve7xrJrKZvKILOLvqv2vBLOlmhmcrFIEXOOjqIUfSUE+4PESo/ZwN83+jFI9u0tKpxqwzWzG+Q0YZ6dBgi7do=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(396003)(39840400004)(376002)(366004)(8676002)(4326008)(2616005)(107886003)(316002)(956004)(36756003)(8936002)(6916009)(26005)(52116002)(7696005)(66946007)(66476007)(478600001)(66556008)(6666004)(16526019)(2906002)(186003)(6486002)(5660300002)(86362001)(44832011)(81973001)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/E7HHaVIZRZluZEzxO/ciNAuj0q3l5lPv1xsH5ce8J27MEtOwbLL7GTLtutUdMu+aJK7vs+nbuAWbQoTufN6aYWJsdnSvupruXzipu3NfzMO23GaldUOWFkTfgSuN9FjlOSgTMz/QjVnLz5LUQcbnJjJEv0CzHGAjE1nqTVDIYZLy8fHNS/2fjt1mubHEwRSEOY2C76oLy0pTMAlwkCo9iRJVAftvO/f2wZROY4EwEwu/fpse5Pl5KQiKAw9Aeu10rqVO+4aeFmiDEyLI2iSWVA46TBy88Opj6uA7BQRM0ilA/jJqdFVruHlaxycbwUGYtV1bLKoR6FfZ9q4+Gi4STKuLbGXagmCej/ebzxUCY1fJ4tuwwNieLcgmB7Md5VT1pSwv+RJu+1qTs1dKlEXJhTtSWxOnevJxMWYywAHzxEW1TAMPCiwQNsWjU2mVHpUczYo+Otr3OoFS8VGnFNq2wK/8m1jRNdLoj0o9y4KvGU=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b34a45a1-9295-4fc6-826b-08d801a16d1f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 18:20:10.6938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+zsvkIsxpp5aJ9pLV29e+gZP6WxhQctsBgw6DtJs61wlabPMU/pbQZZApZ/lJzpGATGDzGNFNloCRMziOeeVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB3403
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The package `python3-fdt` is used for parsing and generating DTBs.

Signed-off-by: Nandor Han <nandor.han@vaisala.com>
---
 meta/recipes-devtools/python/python3-fdt_0.2.0.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-fdt_0.2.0.bb

diff --git a/meta/recipes-devtools/python/python3-fdt_0.2.0.bb b/meta/recip=
es-devtools/python/python3-fdt_0.2.0.bb
new file mode 100644
index 0000000000..040ceba980
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-fdt_0.2.0.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Library for manipulation of Device Tree Data"
+HOMEPAGE =3D "https://github.com/molejar/pyFDT"
+SECTION =3D "devel/python"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D9a6e=
a5b6c346a830f54cc95f6a2a9245"
+
+SRC_URI[md5sum] =3D "a91daa36b3216f54feeac74ea8e5a475"
+SRC_URI[sha256sum] =3D "b675139346946115513e27b5eed9aa882628ab74ed500bd5e2=
5e122ee0afa2f6"
+
+PYPI_PACKAGE =3D "fdt"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND =3D "native"
--=20
2.24.1

