Received: from EUR06-VI1-obe.outbound.protection.outlook.com (EUR06-VI1-obe.outbound.protection.outlook.com [40.92.17.76])
 by mx.groups.io with SMTP id smtpd.web10.43655.1593978976096196013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2020 12:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=sTwmqoUi;
 spf=pass (domain: outlook.com, ip: 40.92.17.76, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lnMquCu9iloRK6fXAiTIdt2s4F0FvZFOiMKN8WSZ5KEZKHWqmDMeiceZwuPgQsPrgoU/fczbiav/ZAcSLBSfXVooTJMmUc1ohlUizXYuAUAN4Tm+798qQM0YKEkx6JF9oY8am+2CyxbEPMB87J+7CNbu2M6aQdzGz3tabqaeSO+015exeG1qHEayxnnBvacsLECG+9kwdu07R8C95p5BDdvlfOZIxnT6L9n29ln6F8c63Cyt5/QCLpGo2eA+rlwH3VberqN9rbkozRGdCP4KnFiO47ictgzYweqsgjJqGLpXRoyH5aG0SqnXHiB7CMtptz1Ywo7jfRVlo5S4378lvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glpgJbArChSx1x9qlTd26xOm4FT1WqdqECElWEBGod8=;
 b=QX7bzI6bXFpcc1dQ1AdVg2pnAbEm0WROHtzD4aiqSsfl358pp2W7rbyBm16ZCoajw9XBv7YpjCSbre2y5+nMgWpVFOMNlX73JbJjfqYY5BtcFAERE0i9D4imLVrqNCJmpTU1VODZ9wGWgb57HtuyW3ehPK/1s107PXxB6Js3FE8FAtoWD+72Q5Q6TinhH2eJX6KBsJaWuAdCkGUWCZvQzHD6NPJq+0lZCz9kkpzhFOwPZEqatShLeYxc269mESQFVdTDMQ7xuEcgOhu8XRCTgy19VbbLHjACS5E0mHAnl1J6VYKtJSismACjP/tIpdSUMRw/VeQha5C9tig4+ghzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=glpgJbArChSx1x9qlTd26xOm4FT1WqdqECElWEBGod8=;
 b=sTwmqoUieJiNZNKQKYjwEIHYh0gxi6Rt1aroG7MTaZBMcGmAvE/pIzXzcl5FoXSwuh2Iq9Rqs0c7XTqyz2npX5SlY4Yn4ZjGkKgEQBGCedmicbBs9HuBRb7L+ep16+lsi7pMbeQhl3Q04YCVCSv+zS/JCtMMOqUSU43h6fwXwABkjUl+B/+IT00aucLf4f5wWbpvd49SCrXrH+d0F576lT7dj1lw4AbsNVcP0ugf01ZU4Fo21QsirTr3GrIKTim7h3Qd/oaf8fVSLVZqic0jCQjK/O5Djl8a0HcCxcxSLakiKUzyTE+elAhtcjNEqMQP+T+ESPWacEWpvYNDkkEEoQ==
Received: from VI1EUR06FT030.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc37::4e) by
 VI1EUR06HT049.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc37::202)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 19:56:14 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc37::51) by VI1EUR06FT030.mail.protection.outlook.com
 (2a01:111:e400:fc37::192) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 19:56:13 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2E41DA0DF0B6D32B231AEEB0CE1783F5E1DE076D1B3FE5B47D32227DAB9E99CD;UpperCasedChecksum:87E778B582EB2F51791AC30BCB290980779D2286A055535F0C7B9B4D4C1044CC;SizeAsReceived:7404;Count:47
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 19:56:13 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] bitbake.conf: fix whitespace issues
Date: Sun,  5 Jul 2020 21:55:20 +0200
Message-ID: <AM7PR05MB6881339A1E4F69347B9515B2A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::35) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705195520.19241-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P195CA0022.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.21 via Frontend Transport; Sun, 5 Jul 2020 19:56:13 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705195520.19241-1-kweihmann@outlook.com>
X-TMN: [zzup3Sh5mvQ59N+PkdQx5SgeEFtuc+q4]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 2feb9421-1cc7-4d06-d5ea-08d8211d78b9
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLZIPUDhDw0ZwXN3T8aIiWJIvTPgiOvZIRBaxInzERUjkXAF6SyTi6CITZQiqOiw1UO/cjdwmfTsUyLGFiYO945tX29pr5kUBCs913YlNPHTuq6X54zj3uftgzRq/qeLstoasFpCkyGFvXIRIqcJYebgGBXFaAkWsfyNF+7EEbOZW876DIj49xuWPA4ghyEnzdvRUA4VmAYNfhwGgHD7CRUTW6TjXA3n6Ig2Fw3abB5x9XQ2HsJLgjo+Yz/nOQejNZx3KIpaB9GO8Xy9zJV1d1N206mKUScNd8LWxNiq4RbygMNKfrqmXDJhQ7C9xNet/YNYQqRBOzoGzDJTvnhjYB2B5WAHsQ3j/h7HTpJllu/DFWTxe5DU7twL67Ib3ufEIakPemPGH0jhW0VtkYY+GbBfFka6XOcJSjVdZQXoDCKVcljXA2BiWU37aFmt/rAmHWbbfiNzhETjn8oe2lLaJK+OM7vkufWTNs9PN0YlHnuqCWSad2jGMEY0kdHNfXhOKwlHHx7RP9/TzjPeu1ht/ITNFlh0hx1NWA96wHumJbX77404s+XsqgmvTCY2tUbQeBCfVhogdWrYPxiKuwPd9H2lGncUiYRaAqnvhd5yInx1DDD8M8AibghqniB+UyfaApL1718FrWxDPeeQzXJ9YSkM8C5DHv4cRHi6Ycx5ztwLscjUfWEE8Ny2aSPidSvI02G4h3DerzdoKp6XFjys50NcJeRh+ScQJlyadwnfxaBJQMN+WxVKFplzIDJOiGlPqo=
X-MS-TrafficTypeDiagnostic: VI1EUR06HT049:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5PkaQYEAOhlcDBuzln/hr0bXPI5xnDWWwI7C1WgIUNiJWTJ6XNEBrSWrM9BsMWjo4sNK7X+DmrGXvISWBPb3RDU4puGKxsp3TwPcuDMCPIpaOvw0QqNPh4FqYErVim8whgSiUgjS9mhXcBfsXXmjOeElDCp1W3bZYPETd2zBcYf2GA2bykTSe8q5aJcZf2lzQFPSYBr+Q1gI2LIVeMzU9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Y7mdbYffJLpqcejWEA0ce9aGEsHhjnm/Vfli69J7gmIo+x2RPZHxkeBZghw4279Wf+pUac1bE0oktco87k2CUEQw8BCeS+NrL5NDsKmnYQ8hnxG/WwvXo10w1AD8PPylVWn+7T+knsvoBY8N4IRQ9w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2feb9421-1cc7-4d06-d5ea-08d8211d78b9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 19:56:13.8328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR06FT030.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR06HT049
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 89717a7134..353caacef9 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -252,7 +252,7 @@ This package contains symbolic links, header files, and=
 \
 related items necessary for software development."
=20
 SUMMARY_${PN}-staticdev ?=3D "${SUMMARY} - Development files (Static Libra=
ries)"
-DESCRIPTION_${PN}-staticdev?=3D "${DESCRIPTION}  \
+DESCRIPTION_${PN}-staticdev ?=3D "${DESCRIPTION}  \
 This package contains static libraries for software development."
=20
 SUMMARY_${PN}-doc ?=3D "${SUMMARY} - Documentation files"
@@ -267,7 +267,7 @@ HOMEPAGE =3D ""
=20
 # Ensure that -dev packages recommend the corresponding -dev packages of t=
heir
 # deps, and the same for -dbg.
-DEPCHAIN_PRE  =3D ""
+DEPCHAIN_PRE =3D ""
 DEPCHAIN_POST =3D "-dev -dbg"
=20
 DEPENDS =3D ""
--=20
2.20.1

