Received: from EUR06-DB8-obe.outbound.protection.outlook.com (EUR06-DB8-obe.outbound.protection.outlook.com [40.92.51.43])
 by mx.groups.io with SMTP id smtpd.web11.42234.1593973709948718522
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=KnSNE1y8;
 spf=pass (domain: outlook.com, ip: 40.92.51.43, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZKkKfKsgQ18guCyOyBaWPMLxYh5RvqZz7kLYfjYu7+a9qYl5Ly3qFtJqSB9PlVcvjsWA8LTYMzZuF6313Li3/toqTEx1C+afBudPsHE/QtnPDcm+sRU8EPGyRF0vuYNWy0ih6sMd0qUs3QRBq7huWmH/zpe7Y5AjfJLCNGkwLCxtcxhxqPMN0zD60Nwi2hA+yFgtT4pz1pFITtjob1o4pUpN3hU+czBjy4h7BPGcn+hDQC1N6IgF90uxA9PPGTRxriYUDBXHz9TE2CWC7fQ0TTD0e150R1ti2gbym+D7AByhAJFERwCra5/OGyeiZJnP/aGc8m0F/pEUrQaGLMBoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3YpcF/8Pi1ZuycnBP9DQCBdm52kgc9FHS3lTHGdHlE=;
 b=CHyniFTqwy9fyZUOkQ8HJqtLqL9xXbZLfDl8gYUo9G9Sz/FlKr2ZGggfzd359nD0C6DS8lRY0dCbsw2T8az2ZBiknNc6E9V46ZDa4mmk5Ek3UUvu/kf+pkf6bfe7m/CZFTMpa9ZVYUfBYjVSWk1b7eh9HmG3+wgROpy5lq/vGkYmxzU2sHbdvwPybiHWVEDq72QgkPE7wU/hGo0U+6c4awEM5pfXWYxzC87QLp47tBF275qonPDsuth8fNWoWZeD+4a7MSQSQg07+jKmOhRbmJ8apMYL59ZFnC1qCjnebySzgIlR++TfEJA6zJa/AqJuswGeJrHgWkGGLI36iwCx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d3YpcF/8Pi1ZuycnBP9DQCBdm52kgc9FHS3lTHGdHlE=;
 b=KnSNE1y8QHaBUUcUdniUhU1Z9Cydujwx4bg2fOj4ac1jvMaJO12RbdtmM+2TNmnu5SBUk8uFpcR80BeW8tapa4IZAD7W/2SgBB/muvu0suWIDx+/Z2aTVQKAlvZIm7ZQKQd+naOcC1U7eS2XZL/1JxWZ/qtFxYlp1KHVQ2o00FmQ4ULGMIY7Q0SV2uI4MxUzRMUfvBKj6/FZlFa1SdQ68boMD6wRrvyNoQcqgb8t1NolexCJbDo63cEoF3Y6nVsjouQy4m2UC+o+QQG+n8kIBCqTxoUNwX1j10xqbSFRltqvDNvIxZVadeSsILKC6ZSKt1asCIWRdB8dZoVxSlz0Lg==
Received: from DB8EUR06FT024.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc35::53) by
 DB8EUR06HT173.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc35::249)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:28:28 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc35::4e) by DB8EUR06FT024.mail.protection.outlook.com
 (2a01:111:e400:fc35::309) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:28:28 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E9FA1B84849BE4173C43EF3F9939586B4919C1D58E6B872D17EAD64ABE1774D9;UpperCasedChecksum:31AEB202CF68C41C163CC332FB136DA39209B9B7BA363F3452ECC538A80B553D;SizeAsReceived:7404;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:28:28 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] systemd: remove kernel-install from base pkg
Date: Sun,  5 Jul 2020 20:28:07 +0200
Message-ID: <AM7PR05MB6881B39A0544D9D1DD4A91ACA8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P193CA0132.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::37) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705182807.23925-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P193CA0132.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Sun, 5 Jul 2020 18:28:28 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705182807.23925-1-kweihmann@outlook.com>
X-TMN: [5HCCujE2rQrnGewfO0n2TfxS2cXK6Wnt]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: a161ec4c-c4b0-4e07-09c0-08d82111363a
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtzQKBnabWIkBn+wH6y2Reemd4Ru2v/ES8yOhaetzGj+3S/4wiuZytcd9bSsbalxLh5m4cVzAS65qIuSDj6JUYG+yh+Q696devJfvfppuVf69zjy4Vz/EPoo+0ms2qMz+tV5dZebQAHpZywfcTD51Ou0MD11QsmtbuBx1CCJv1RZqzZzCvtdLRRe3RQ4qU58xCRmuJYujjlMVLuaIqtWGRNlCcDMojxvua/sURmaUYeylOFAifOKSJzJIK0Oh/YbQOTF7S1l65tOt6qFdzjoS1RXF0MDofgAHrZjZJEThclFoJGxpr73z8cZ09BliufsROuzFwFqn+dx+r4y+QoszpbuE8zUzUeWci1yxdjJtAM92s3+kf78ciJgQZXgdlv9zAI6vVZCrJPuOwZWH46eCFmFtB7pe58noOeWMUsIaZVHTGXtvt0e/7e1ETNW9xaRHfxanZ+ZnaXNxsChaP72FGOq2b2neeBgvQtPCT74adrWI/deAd+w+ZbNrd0srBYkpyAP85D5YF1YFn74UNKEWP1Zw2cdtHUrPMjr8jmHH4XplgsGZKoq+YDWFIuoaPMAC9A20bHY6OGIIJC+F+pnkjPUHMLXf25IWwCxHpI98S75oVBW4RHpGaA+CLQTQbBR87NfpS22QVPzfw6fGuvQX/u02dQbko8LBM1hpaJ3adlz+MU03ralgAjs/N6nsb6YJwcRnUZJY7d+VApCyS8hFMBu8+QioelM7gB7ZOxahJdfuQ==
X-MS-TrafficTypeDiagnostic: DB8EUR06HT173:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lI98Aoi6iGSH51kSLGjxRSMe/zuR+TqcTt0gQnHehdcXeNZMAfatxAuX8TLTs10wjIDvJVL/jEPZbwmj5LTOJhS9G9HDpTJ3wdGYxyQldtM085jGJUpoIxyqoyRz1oiRHHt6IQJ9pjtso9I9X3+G155RZ1HsxolyR2AjJrwxq0qTS/RHB1G2/pGZr1TF6nt8XbXfIEGnC/kTPaI2PqlZAA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	FcrLKs2Zr7sPDIZ1tKT627o7g99N3I02siRyZ4NdMaaBJ4igocaK2ZS3YEQtuvtd1EcFL+rDoIWGvUyOW8+XyfVzAQRh33kmGYghynIIFKs4d0H2Dqet5xYhJNT6ZdAbthJ7iCkPEgpYoTFinSfC3A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a161ec4c-c4b0-4e07-09c0-08d82111363a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:28:28.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB8EUR06FT024.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8EUR06HT173
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as this is already packaged in kernel-install package,
it shouldn't be part of the base package

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/systemd/systemd_245.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_245.6.bb b/meta/recipes-core=
/systemd/systemd_245.6.bb
index b6681b2069..cdafb98247 100644
--- a/meta/recipes-core/systemd/systemd_245.6.bb
+++ b/meta/recipes-core/systemd/systemd_245.6.bb
@@ -544,7 +544,6 @@ FILES_${PN} =3D " ${base_bindir}/* \
                 ${bindir}/resolvectl \
                 ${bindir}/timedatectl \
                 ${bindir}/bootctl \
-                ${bindir}/kernel-install \
                 ${exec_prefix}/lib/tmpfiles.d/*.conf \
                 ${exec_prefix}/lib/systemd \
                 ${exec_prefix}/lib/modules-load.d \
--=20
2.20.1

