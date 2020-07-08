Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.46])
 by mx.groups.io with SMTP id smtpd.web11.1583.1594233865764836075
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 11:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=uoWyGmgP;
 spf=pass (domain: outlook.com, ip: 40.92.66.46, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLv++Eh/tlJlN7Ihmb5f4cVVg5HfLgbgo43saswHYHLpduJp7LmW6rqjKJkNk8lDC7HbroH791Da9mKh2v0kalP54QCtiDVZRLrZ9pNWrH9kA0kYyBguQko4DSEt621oavqjQQdSb8XCaC/voSB1bp9jqTPYpgrRL6V0lB+QuUxjn9WEF8ip/LTySJf1YaMWXByaWBMPr8YREDDAANehWmXJ6MR7bGvd7Bb/DiQxgV8OIUo+Okf9M3QlAv/jj+nEkOXdwgF8Yl6DUwrf5vuQKLrGn8zAwopECAc/6saUmBskiFwWWvfE90KkM+PfRqP1BAYD47H1+HxuscJJMBN5Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBw+M1f4Ce9xVDadsaRsUh/rgtP4cwlOK23VohfxXa4=;
 b=Qd9LqTLcD7StaTytWWtXLprM0g5D0LfkEJ+SwBwvR6KaQPS0hwJ3ujZnHN1uqJ/eNHGzVdJoi/ThAorHAVLouMWVyWNuYGW12CrktmN0krySg2/JNJtuhcImaX8bPa0iwbpbZQjke90BTDU+b0cJC80RCUvUTXODkpGLZTEhkA7mywFYHEpz/5AFQvLPHspLlrFcZSV1qe3M3xLQGciUVtgY+AK5m65LBwegBBaDF/yIcbJECpqCIZZeIY+Md33y+qGU+UwbOTbQgX0UYZjTS14sACkqebug7l6qCqk1SXgNxGodszRjhm3lCqQYHcNAPDUIevDZUQIhBJ2ZRndWyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KBw+M1f4Ce9xVDadsaRsUh/rgtP4cwlOK23VohfxXa4=;
 b=uoWyGmgPVql7ueyF+A2TBIEwIkTDvlBvWCETawnv2OJoRMlfpeGAbCPh2qAAF6pjh7EV2Y2jqRZ/8ZE/YHO0FBZ903eAebB9MPSInzdrXVAShc92lAj65eL94jVkB4UYM2xRUJ7MWL74MLtkDIRMFUtiM0iYDEL2frAFB7xSdzyGm2iTv7xHRiNAf0pVNLLhqGjIlhlJggl6oS3Q1lasQ3vIbyRvwQT0uK8Tn7QBRHj7R3TbZW6RiHOx/0bRdegY/kYtN7yrTJvFv7JdpeiV1YjZW4ar2eNF845SYsZl8rua7vuiB/r7fuFNkSx+ZiWXKmp/JAAk3MvMmQu07bCUfA==
Received: from DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::51) by
 DB5EUR01HT097.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::401)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Wed, 8 Jul
 2020 18:44:23 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::48) by DB5EUR01FT058.mail.protection.outlook.com
 (2a01:111:e400:7e1a::302) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 18:44:23 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A2DCE5A89CF2AC19414C5E36A639A2E65518A797543CB2892F3FF24E7855F877;UpperCasedChecksum:595F8FFEE262292D5E25A06B29B4B182EE14F81D8140F6246200CA4DB1718D8E;SizeAsReceived:7490;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3174.021; Wed, 8 Jul 2020
 18:44:23 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 2/2] ptest: append to FILES
Date: Wed,  8 Jul 2020 20:44:09 +0200
Message-ID: <AM7PR05MB68812C46B1DBD330440CA9E7A8670@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200708184409.21292-1-kweihmann@outlook.com>
References: <20200708184409.21292-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0601CA0071.eurprd06.prod.outlook.com
 (2603:10a6:206::36) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200708184409.21292-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.67) by AM5PR0601CA0071.eurprd06.prod.outlook.com (2603:10a6:206::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20 via Frontend Transport; Wed, 8 Jul 2020 18:44:23 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200708184409.21292-2-kweihmann@outlook.com>
X-TMN: [boNS/MP1bCqfEVWmQv4DYt/IkZ6i+EMw]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2a8fcc8b-a93f-4e86-f22b-08d8236eeec4
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj2m4GPXnDH28OENj2Thkvf23ED7SjnYvyUwt6gXuT5qc6wLK8GJiXBTPGdnHPezHZvht6c/kvK/hSyA6KVGfdGpxeGLNYVix4soVRMFigS5H7W33DkRLxy19g1eR0ZJuRbM689ZWEwvM1qfmCFqJ3C/Ixwwymu7hj/T7XStp4znx8DpHd4UYMPYxWWRfbP1Up3NuiS/1eHokSmEqk2iYgTtOuhD63Uz4Z1ZL9bZ4GDIQg1e0utJQWkLOKusVTIvTAFcSwYFqDsmzB/7oICKq6hpnxrRHtkb+XtcghYbLTfaTCEhUVdMnIv9D4oJvqEE2ZwXTFyigaJ+nbla38GvPUjyv0FpZT8kFUmXMIiM6JxA3Mu/yBPflxhGMSw2ZVf71k3eoi0ACkWxPGXrgVSCOGmy4gO3qaXYnjCrvmV9aVdsZueuFGuccojyhyC4bzCWxPbUPt/kOFaUSSjBKMMisXekwkvOO/browRlfDvSvjf/j/gymxnUaUhbwxd3H/Vp33cF4OJYW2SRFw3yDPAlGDZa/ciHe8nE3v5kAn7wTCRMWm8oh8QmQ4YkhjyqngBWOfEUFecnjrPqDZm2shjBLwC4VhVB4GfMgXBjJWhX5ARMo8dNSurHAVcs3rw0PkkxwCgohL3iwKkd6O0A3S7t1yOXvvKLs8HSWo93/Nosv1PdS/pPkbMOwdNrMnhhQwG5si3zBIISEmTOiw==
X-MS-TrafficTypeDiagnostic: DB5EUR01HT097:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oNtbcGEB0xbQ6prUfbEN8dQol3p35uZE69qH8jR33CsjP1RM6OEcWqXPtvJGbtFTDXJQaa88tNCQ6J1kzknvC3rRzRNtYAm/7/Ys0zdLfewDPvSxDPMJPGolq5pqYhWdcKrl+G1AeAiGcE6QZUfjpZgouyqqqLMtxW2dUJS3VzWFuXOLjQgfaScrmuZdZDlsxtXezHW1dnRBe9oiZp8lFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	9xH4GjSSf9Q1+YLN537RZhAsWUPfIYmLCCyKKyp1MU3+ZURuqU7dWz5R5Z070+gglkxNVzh+ywlD2G9eApKeUrCIQ4044M11PdBc9jASu+suLOzSpJsWK+VFSvufgOeOUd9z2NV5xTZBgrsxn2VWwA==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8fcc8b-a93f-4e86-f22b-08d8236eeec4
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 18:44:23.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as ptest FILES could be determined before or after the classes was
inherited, if is much safer to append to the setting of
FILES_${PN}-ptest

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/ptest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index fa4c36ec76..47611edea2 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -6,7 +6,7 @@ PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
 PTEST_BUILD_HOST_FILES ?=3D "Makefile"
 PTEST_BUILD_HOST_PATTERN ?=3D ""
=20
-FILES_${PN}-ptest =3D "${PTEST_PATH}"
+FILES_${PN}-ptest +=3D "${PTEST_PATH}"
 SECTION_${PN}-ptest =3D "devel"
 ALLOW_EMPTY_${PN}-ptest =3D "1"
 PTEST_ENABLED =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '=
0', d)}"
--=20
2.20.1

