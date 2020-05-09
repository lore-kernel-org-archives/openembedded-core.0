Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.86])
 by mx.groups.io with SMTP id smtpd.web10.4547.1589056401294762711
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 May 2020 13:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=PvebXiGx;
 spf=pass (domain: outlook.com, ip: 40.92.65.86, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5neeMI5kFVwQuZH2oiT01hGH8qOT9Ei5MMPMiJm9oOuTpxzXeR5xiHiHf4OR/f1+D3ueBktlMeKpYW+koYuUqIJ7slzAfH2pSNCqf4iGc1GwxyVHwFQdugmilvXjjA4KqSwH8tvEsKc0Jbz8LbUNi5SiiFm49ZG0SOicgnHpUHE9pH7/vnH8Kb6JQtVZUZ47xzE97t3q17doP1QVYQWryXCmig4ojFOYMvq3n7ucahEuQKsozhlmWhrKNpGfVObr3FT21dQeRBbkNuxWyPkwOKlFPN2irYCyIlud8/I3F6Z9KdlduZT3rLpgGO3uQkQHs9PLvdel9CqmlJ9EbBSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PATtcMM3xb2USMgCGuGtmjKY6GmRDOieDAt7FAIXp0w=;
 b=UontfDFUInIxnF2OfZzYsmT8JedzitJsGWo4IL+1Z9c+WCd0ZvKVXtl8DdzDHbOgFKJY4wCPwfC51J2InITdee+BO2bLdmI1sq6xbKCgswf7UPe+mOwd9aEy6aKUBb3yvfhIVsYgfkw0ZwoFpJdlZFPwhNJOtezWut4v20Ahne6Jg5givqb1NLnatTawm9sLSL3y9eQeWnfG1bsgzFDPeQpJdjfzSuJQFZ0kfheY/7MCl1bYFosCAjjfelTX6Exo6RIdCeIi9fXl5XA7EGSSQQPWHcgBmdBBUz00E80gceJHc483XVFKdUAvhPkAGrjGhju9NX25r+i5SOQ56uMurw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PATtcMM3xb2USMgCGuGtmjKY6GmRDOieDAt7FAIXp0w=;
 b=PvebXiGxDO5LgEd6nHAYy1vsn4f8S2XE4sXEXMi2LDf8Tg0oabNGb0NfjRGDyi31wlt4Ta4Sa8cya43gAG0YqDrAW3DIDm56+5pW4ZMHOoq2EZPrC0GsvAmgJ9SVRovLsgfTxtr0VoWLVM2LkcQll6BKhYd3caOuHCnlB/c6jY4K5l3VMXr1fNGdS3gA6GCQDLEkC32HBV3xtVJejDRffEiiAFGyVvJ3Cq5iYbLoPsdODLzLRo9uqsbL5TVNt40+sbyjZ84hAjm2KeVHyYxKnmOPPPDiWsfUxa6t5EBz3ZJTA0I/dz/sxIRkUnhial+DyMpI8crCw/zRQD27wyU53w==
Received: from DB5EUR01FT020.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::48) by
 DB5EUR01HT108.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::160)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Sat, 9 May
 2020 20:33:18 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::50) by DB5EUR01FT020.mail.protection.outlook.com
 (2a01:111:e400:7e1a::247) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend
 Transport; Sat, 9 May 2020 20:33:18 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:5F586BAB31E5700BEFACF23A9878B48AC625F9EC4570DA8C5DFA63D282B1162D;UpperCasedChecksum:B293AA6DBFACC42D505AB4B98E5BD377E8D66D3EB0AFD658CE813CA140222753;SizeAsReceived:7467;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%6]) with mapi id 15.20.2979.033; Sat, 9 May 2020
 20:33:18 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2] pypi.bbclass: mind package suffix on version check
Date: Sat,  9 May 2020 22:32:44 +0200
Message-ID: <AM7PR05MB68810C07AC538B986CE47C92A8A30@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P195CA0018.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::31) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200509203244.14121-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.10.191) by AM6P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27 via Frontend Transport; Sat, 9 May 2020 20:33:18 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200509203244.14121-1-kweihmann@outlook.com>
X-TMN: [XO639mlA5H69bOTniTgQWBUo/kZFA/ce]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 539d3e0f-9345-42e7-25d7-08d7f4583549
X-MS-Exchange-SLBlob-MailProps: 
	lHNTL7xaWTi4W9MQWDhgQ3zA69mWx4nEntK7PINyhTTbZ5l93rCMjeLzPXUmeJIWVwhNjV/QmmBkf7UMXIpOIQFyz+t+JI0eenJA3VJ4PoXPCTU6BipQNZOCO16yTthXh2fkymszJb8/GAs1MO+XHo2B/ftEvqVsyKKtgkMCfvSsmZX6KzwlxoX0PnkViJUkgwaz6I8EhheAWvzcKPz0GTHZaajwMDsBQLRNoXDGO4nL2zPWebIzrcIkvJtd2vuxpkAVmfj2CoVCnkcE7pNlUV+Y6VIXoWQrAmnJpLT5x/FXmbbHAjtjkWSmOBqUFLi8TxT2zsdiovSr6qQ3Xi/GBo8WSumK5HpDO7t2IFMUk5yLvGyxHS7+YTYlrVlEy0tpGxsFr/wRJsx6ywMKaQbjcLLu8VdiTtXTSG/UB4M0JvCDE6i3TO5o1Es5FEyv/0H64YiA/T89SU1Fd/om5pcaGMDCGlAdWpGqqjCSqUFZyKNCYGnSH5xeit7adyDqVwYHbKP0vP9xK3ENznbUo97qFtTF5iXgVbxnU2tAjA1htLVoKt6p6yJJgB5+Y/LkkC5ZJC3v5VxWrvpgxQD3hZIfwcrLDYiDF4wWmFhfFg1qUDnqgw1HYB2sAaMvLtyne7P7yHvVdR153OJFAwN+t5q6L+tDE4s5ToLc/8RHAgVbnmigSKwhbYLvxViyaViyV4b5s8qGHf6fZJVUSC0Ep8oaN2scXtPq2RRah3NBxjgy1ZIWq8iHRUL4QTiOqJPZOIV+hfZA9Z3gUJPbYs0WQiq+p2zslgm+ff665FG+lCB64pbiqcFXqxGri3evt/PbHm7H9qyCJPDCGJxlzSeMlACuRff4iYlFlMrqMYVc9+81rhEiCnTVidKnB2rMvJOUn4EAxKhSU4YmZ+jd64acFByKaM25w1/zKqkRwgC7H0BCPpxVU76Lx89G2jWOBAYL6kVfBj8pu+wq+dE=
X-MS-TrafficTypeDiagnostic: DB5EUR01HT108:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Tzwwj+CSNC7M/9QhA0eE7QlyPrqP48e7jAEMM6rKBx+Xi6KjSpseixkQmfDOD0rUf80Ar999eaZKsSgcdVSwienWDCw4pTwIvtOpn2ck1RQfRhmIe6tbZmBWJ/5yajF2LM96o9pbdFHokLt5D/xh6juMbinWHuqqIC26HLqX2t9UKPoX8xO/k0wZUdHEhKaEHkb6xs2dgPWJ1nOzOK6AcfSsPPkujEdgraTn5IXA71sBFqvz8utr6x/VFQPlrMbq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	iUyvpQdo7Ilq6ODvzRqvW3I9NEkevCTla1Uyg8zt+oYc1x+btY4001cve9noYHaLzU8Tyaxaxa704lofDvxGqC1tadbReOyT/S97ZxkSWeVyN9oN0zSu7Klynt1iQ5kNxU88bH8drJal5T+euweBIg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539d3e0f-9345-42e7-25d7-08d7f4583549
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 20:33:18.7905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT108
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Some pypi packages do have suffixes like dev, or a0 or b1.
When doing a version check on these, the version will get falsely
identified as major release versions.
Add a terminating slash to rule out those false positives

Changes v2:

- ignore suffix versions instead of reporting them

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/pypi.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pypi.bbclass b/meta/classes/pypi.bbclass
index e5d7ab3ce1..ffa8aa3ff4 100644
--- a/meta/classes/pypi.bbclass
+++ b/meta/classes/pypi.bbclass
@@ -23,4 +23,4 @@ SRC_URI +=3D "${PYPI_SRC_URI}"
 S =3D "${WORKDIR}/${PYPI_PACKAGE}-${PV}"
=20
 UPSTREAM_CHECK_URI ?=3D "https://pypi.python.org/pypi/${PYPI_PACKAGE}/"
-UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)"
+UPSTREAM_CHECK_REGEX ?=3D "/${PYPI_PACKAGE}/(?P<pver>(\d+[\.\-_]*)+)/"
--=20
2.20.1

