Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web12.823.1590515895168852608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 May 2020 10:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector2 header.b=o5m7+/EK;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 spf.creamailer.com}: limit exceeded (domain: vaisala.com, ip: <nil>, mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZlsDIHlGVAQzGB2cc3odjVPGbJc/JuzgUzOhmSgi93tPSAX8uam/ozu+hXQ2hy8S2PaH6qHQlvf+WCPrYTZWsFjZUTY4r5TLw5ksQA1htYXmX10itrtp0pSxfktDwoRgeyJ5wKQf0i7bjLvr2aAtKWzuv74QzW1pU9IsYY+hMdpc0sEPqbwhqiz7Y5zlpOVHvXiwBy8SxzgBMoh5T/k7Zo5sSfGP+pUweR1x++bZ199P2bFa3vZo9VsN07L/5al8hk66KVXHzDZZE9cHUxt3jkUXM8p5fxWS/sMtxYvFhaZRu87WZnLi4LYdNSfYGbIsjcXxKyLVmJGPLmnZ71LR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=mLwwevnF/fMUDv+w42BNs4UI7+QtyxxwqwCytA0By3IwCirX/sa5qV0fiqeqW3GWB+yyYi38W3xVGPfi2I+pF+RfGfeel8IWIXDQH6lnnYErzwaVuwWOIsC7PPcKyih+125ZcT3y5DprXseuBvINyNyGARD8orPSyUcsFzGgWQGRcoAGNsuULmyZcgpNCdInIPuDd82iZwL1De2oV1gde9UFw3njkAQTnUWCaJ9B/ZJhglV7zEvddIVOGr+7JxpSGWu2ahfdNNiTkE9qPdIrFhQYXnrzxQDOo4h2YEaVxNxyUdvocr01DBlVRNGoC3EpnmIumGy4KJP9HAgjkyCiFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wicAuE1p3Llz380WOqJERjf8nsNlSP2l2X5+fkYNeUg=;
 b=o5m7+/EKujVH0YQlgFSSHlJUvMhJT84yV2CDetoG9KgvLrYWshzTqe5V+ogjqTIVke+8XZ+h6T5pEHAB5lQlBDAmCo6t0Pv/7rciBwxuMNIuMLONUGFRTI+9mmwAvTtSmjSy0yDwLUrV0sDK1L3El1obdgk9t3YlSSBIyngNE8I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com (2603:10a6:7:8a::22)
 by HE1PR0602MB2892.eurprd06.prod.outlook.com (2603:10a6:3:dc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Tue, 26 May
 2020 17:58:13 +0000
Received: from HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40]) by HE1PR0602MB3449.eurprd06.prod.outlook.com
 ([fe80::a972:752a:8780:fe40%7]) with mapi id 15.20.3021.029; Tue, 26 May 2020
 17:58:13 +0000
From: "Nandor Han" <nandor.han@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>
Subject: [OE-core][PATCH v4 1/3] Add a recipe for `python3-fdt` package
Date: Tue, 26 May 2020 20:57:54 +0300
Message-ID: <7ef57e76e2fa950fc8630c097df8e3558c92f50e.1590515635.git.nandor.han@vaisala.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1590515635.git.nandor.han@vaisala.com>
References: <20200326214308.1042374-1-nandor.han@vaisala.com> <cover.1590515635.git.nandor.han@vaisala.com>
X-ClientProxiedBy: HE1PR0101CA0024.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::34) To HE1PR0602MB3449.eurprd06.prod.outlook.com
 (2603:10a6:7:8a::22)
Return-Path: nandor.han@vaisala.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.vaisala.com (82.181.11.213) by HE1PR0101CA0024.eurprd01.prod.exchangelabs.com (2603:10a6:3:77::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.24 via Frontend Transport; Tue, 26 May 2020 17:58:12 +0000
X-Mailer: git-send-email 2.24.1
X-Originating-IP: [82.181.11.213]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e151eba-ceca-47d0-e811-08d8019e5bd2
X-MS-TrafficTypeDiagnostic: HE1PR0602MB2892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR0602MB28926F20CA7EF9A82FB0E2BA85B00@HE1PR0602MB2892.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 041517DFAB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2QYtq1zKGTKFA1x4SFJ8i34KgVcWbFGKk69+aCUbnN1yEb0JPUB6JwrUeXtSUjLrMncqlw1Ph2xQSgdp+1/nLWTSHgA9eK8DXDWn68fs/iIbh25OWJdDe9CXd6C7V24wWdXPsaxN41mzw7KffbCsRn6V1GItYqTbdT1BCRgJ9pyGfEae248HaS37nNnIN17wfOl7eYv0oYFHbtUdhd1+I/Bf9Wqdkwhb3n86HyxBiGGfUwEq82TPKXvOFGT5t4swq0401IF6fD7cDEFQndfZl7QKY6P+87eMNGNsusFnxBjXrGiCfxNDvHNbznDrrK0FC1LWkLRed87wW2UpVfthJwb3gE4ZLHAZhNCvcEu3G0vwQTZVBOzZIs1RSZEsbNSjxnpfrsB+CVkSnPTiOqDdW203S1V6IXO0MGe+OEh3PPXAibfwUcczwphtAuWdWXbmkfoCFDxJOsRk/2h/BxRlzJygt/W26FbEinkNCgTle6U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3449.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(346002)(376002)(136003)(39840400004)(396003)(316002)(5660300002)(6486002)(86362001)(8676002)(6666004)(4326008)(8936002)(36756003)(26005)(16526019)(186003)(66946007)(2906002)(6916009)(7696005)(2616005)(107886003)(52116002)(66556008)(44832011)(66476007)(956004)(478600001)(81973001)(136400200001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	J1LncUpB0WcyoRc4V098e8PjNb8379DoAjD//2K1kjoUDCepmumXwAdFMdLACUWBROT/R5tn7a4GAa5r3iFNXY1KjVKbvp48Cn0znGLtQZwkV8fJQ4Qr/WnvDUyKRkj7XgcJOgwIpN3V3DkO1KkzupwnAOaM8BHtI691F0uBI7dSyoZ+oz84xA6GjZjTuj0QbUVJV/4dJD+bZDehN8WxNlEM9C5hWJlynT9gNXkdnf40R0GN3fCrXWXP/2KOLEvey1iu67t0+8knblH/otPGNnUzTuFarnkv0FBqxhrr6g3a5QRj9cgis1o/BRsXon2Yfjq3IJEX+t3EFLA4/zcMv3DnkY1y1BrzAnNZQKGZtu3Xquz22Hk5rRiKR5cmLxPPAxQdGYoSDJCn471gP8AdcnTm5i3FRsIEBAOsKDUuHtSbt1RYGfjBnNPaf09TQ/IwMuzZFxXHi4zdKOR1MyZHwliP6sofaypd1c9iPxl+HBo=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e151eba-ceca-47d0-e811-08d8019e5bd2
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2020 17:58:13.1703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGNhQpBgw2KFLdpMnek+0N1DzKVjkkYQrh9b9NH0o+OaJGLJRsmk+i6yc3hcEEpMzJ+2x2eECKsRuIxXT/z7gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2892
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

