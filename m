Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.36])
 by mx.groups.io with SMTP id smtpd.web12.669.1591130707887535854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=DNc8P4RP;
 spf=pass (domain: outlook.com, ip: 40.92.89.36, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gW4BvxR1F+rz6E87rnjHokbHb0lRrgYY+dVVYHH3N8WAQe6/LaWquEoqddvVJSIJdTZlEz+vRNVkWZW+UK/pVoaBFltCZBXakfOyFBPwOdFdJrL3yjoFi/54nBCaWIkefh8xGqCuQxcu+zMvE3tMTshIh3fTK+QiV4t1zCljCYaLTZ653TSy0aYMLWSowzQT2g5UHR3jzBgeeU6bSXSpiyGBn9L3vvP1hOuybOwDv4MIYMPrr5YcIIrrFH6SjEs/cSNg0dysF5yz+jZes1vbjyE1mUxgTHS7Y82W8xi0UkHOKWDN60ayWqKxtMFnxGPC9AWcyB50srUd1NSo+dgHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZdH5hqp8aTjaCycA+4iGwsQMikO2FbZXG1t2gcAvvY=;
 b=cqHbv7e8etF1/dn1C5Z8wTHF9dAdtNnZrp5ZmUeNBZ+HpsjVjh3UY/wKgifxj7/3iOSqWVRU2N10GlAghTGvtFmi7DfPJbrMr0Je5dv1vhJ4zWsILnvzO456wKrg0YILeOAwVVNemJSev2gWZit/jpnzSCYvLJc6r04RTTVY5e4omZBA5NKhOs8cIwsfeAR6e9rFOzIlNgIrnHPksfHMLBku3jFugKteTqYCfzdV3bwW1L7qaQRwpRzEvGceLB8w2aRym5eCNfWGyv8aKkTddq5dCOLx0L/GMUdjr+8hwI+UxQjkQT00bEPuPgdsKu/XziUHMqVIluNUuaW3O28W4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZdH5hqp8aTjaCycA+4iGwsQMikO2FbZXG1t2gcAvvY=;
 b=DNc8P4RPBoV0ReiKiRS6iZwrt1BQS8Taf5AYx5fIHI95hU+jilu+vvd5MIMlfHMMubFa5iTDlnysq7mcQdYCmfCK4QIopN9JzIB3Ua8cDPWUfN24XdisOQ+075hZV0Kx+r2Kp9U2u7vqN09LiGkEOyluSS74bAgOXjmMuTC2RI2JDGybrVJl4hVgq60172RWVojgmS2RLjfzB+caFcLHRpLwChHgvId+yJBgVb88otqGyu0fSj3pyiYEaTctLFSj+5I/OIuE2AFv9pKXGis02GEXOMyj//ReA6tnfBlrSPfUipF+BbbK1+xqbCz4eX+1EFMyMwLdNh3ER97dHAebrA==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::43) by
 VI1EUR05HT135.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::86)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.21; Tue, 2 Jun
 2020 20:45:05 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:05 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E794892E2BC29DDA3740B4EF5F28CFDF0E1B06F28FA632D85D76752ED2F345E7;UpperCasedChecksum:2D5A3C2177B588824A07577A0849555CB231CE1E71CCDA0DF4AA28F907F340CF;SizeAsReceived:7579;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:05 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] ruby: properly append PACKAGECONFIG
Date: Tue,  2 Jun 2020 22:44:17 +0200
Message-ID: <AM7PR05MB688165541EEC54AF8DE1016DA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-8-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:05 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-8-kweihmann@outlook.com>
X-TMN: [3Ccos37PCq5A65dNEcmc8c8y3FLb9Sxk]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: b1c6152d-26e3-42b5-cd28-08d80735d4ae
X-MS-Exchange-SLBlob-MailProps: 
	7MJMDUNTCtxZDRLgFxEZNXonRi+PvJzldZhGQubwYdYcWPnXxosbgA0OWkIQ0z0hnwb2Gxb2SCQrZfES/v/79FR4RgAVWihVKQkc1L5kVXrb8+ibBJif2GJokDxVR5yp2nGn09oajF2XQiio3zOqI8z7VrYMyr30yJLH7nG1XTuBxGF1l3Rww7FvGr3McxfJAlQY8pVB2VS2jRFKGY5HGmlH6pl9bhWridbYDsO7GLIyASoWmuPzo66nIZ1jWZwzkxiz1Wd6TBZfn5j6j+Jw5wSGZsi/zlIJIZfoHM0hQs9Xko9a3jJd+vv2xJkUjSMy7oJm4XlPJB7WXEGuWZxopB/lY4i+ycR6pgASw13cF1RDWGhhm+WqHScSH76Gyopw4KAB76ibYWJlV36xWAodJL1hbVJxDZ/TFY/I0xyHGtwxV7fJw18fzBZTqo+yqhW/6PRunQvC5tzmsax0E5Ypyy6OXH/YjnnKmfVRlfoX/UyhHbgAB3kxZ7TuP5nX9ckg1klKLGi70nHso4kYY7qmTYExLPMKUxmj8r+cD4mOurNxfCIVbVw70nq5dqNwrGWkqsUfLGN+tkjcqyan7nmw8BmGw0YLtA9/4OQV7Xus3kOKAhDdmrXpnqjKtzyTwBVTq3Po9minYllS/4e1AFF57Xq40h0sU9NRT1UxZf9a7Jf5lCYFttcz0MlWhCrL5vXSLyFy+gDIuKXwb4b6KiWf6oLuyTDDLKiAx7cwuBH5kcBBId8wS6IOIA==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT135:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PDFle8/Kw+IqnmFiOu2AWMRYZ1Hmc7oh6lVNGZKUGkrIfUADs6kFJgyHvMoF79Ek8eEWrtBw9aiKjhxH8bgy0BxWbkTivVbWM65E0yuRaKag9KfdYn4EUu0i0WAojwmk+Doz4mADgxwKumqqG2IRr3Y9dicbKGgpCkZFPt8GFMN8QjFTyQubBeCyD0qEVINo92OIc5e7x+aPkWSQY/1kCg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	XZ4Fsw8BFnGxFk/NjxTkfbLWK/xtISJngOnK1KPBDGi8E592i55za+WKotSAAUzTm3qnBVYbgNoSZSQw2K48hKx63TOCXRnVupacU6f4iaGU57Ix/708BS4FF1zSrThnQG7rIITREy5OEkURRSK2Yw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c6152d-26e3-42b5-cd28-08d80735d4ae
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:05.8579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT135
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As ??=3D assignment will be overwritten by +=3D in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-devtools/ruby/ruby_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.1.bb b/meta/recipes-devtoo=
ls/ruby/ruby_2.7.1.bb
index 3dd9fb0a62..3d7d095fbf 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.1.bb
@@ -12,7 +12,7 @@ SRC_URI[md5sum] =3D "debb9c325bf65021214451660f46e909"
 SRC_URI[sha256sum] =3D "d418483bdd0000576c1370571121a6eb24582116db0b7bb200=
5e90e250eae418"
=20
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
+PACKAGECONFIG_append =3D " ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d=
)}"
=20
 PACKAGECONFIG[valgrind] =3D "--with-valgrind=3Dyes, --with-valgrind=3Dno, =
valgrind"
 PACKAGECONFIG[gmp] =3D "--with-gmp=3Dyes, --with-gmp=3Dno, gmp"
--=20
2.20.1

