Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.49])
 by mx.groups.io with SMTP id smtpd.web12.657.1591130696543615665
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=D0EW4sL1;
 spf=pass (domain: outlook.com, ip: 40.92.89.49, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8Woyk+/bP2dqXs9/wK58UiD6tAjO0zik5fe2wdUQyjpfxPjxjpVVWN+CrCNNRgxeDxVs85WEpiMCVuqI5COa1xQzKUV1oGzpE6snP6bxKB6fgi7g15U4KN6qiY3hxEg/wjCnAoa1Tds1ZiKAdKby27Xt8H37CSCMU+n0zGRXZqGnZ8JgyYl8L1nP639f9Lq2oBFPMcdwEaFGpabOLYzvyDei9mgGU/yv3C/4fNkVGYDnGyO1UmwgppnqKIHyqGHgPbcNYhIMHJ0yDjlla9ngwi0RArQcOVNtw+MMsysIjuXhqo+BIYtoEf9g/XibXZ3RLrlIJ8g/zdiYlDPDhh4pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbd7NAuXvL2CJDzj/JNoBeVGv9/sFOYx1rwoz6slncc=;
 b=WWcul1fitFvkTZdKi3LSfn2Wi82NZsKqIE9ZY/TKhgxgJeGgiO0y7brckx7TwUfVxCMa1V/RH7FeXOuDq6+/sfrFg+O9FXqCweahn9v44iLRGtD2u7BxATo9O+hu/9F7M7kOar12jp2bvk7b8AORlLfGIYjXJ4eDHpbCxysRjifYKTG43lMFUiDcBX06m12YsLCryIxhaef3/MS5X/olw/8KzYVyIq4p7ErIXck/KZTbHLkDkpN3QL+QRfW91uTAWaXxFGHg3epBPKJA9LlH2kMQKozXp+oU/LE8VYh6mzR5xp7gElxzM8LoLXMqK6oqQCTkLI/7ZyG/lDhIpjXW4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbd7NAuXvL2CJDzj/JNoBeVGv9/sFOYx1rwoz6slncc=;
 b=D0EW4sL1A6Qof7c1eM4rQfW1UR3xASm3q2vmsGbVor7mZfpVIvdpYC+4NgPJ7xV3oNrFYPAN484ZZPFbj0279Q5W4/53biWGG8MjM3BijOefns4VYQ3DzetMIl1iFifyrvn51ygbITG0lWT7v4z0iSUn9QTweR+GmLgLXuA7qhiqBXWAvXdLQjzg/yecL4HvTkDpHtCimpkqbHeJGmRSPTCG4WHIa61ve6q9wzxf/wDuO6iT4l3+O2yB/5gJj6QLHuAtLKuDn+BFSF8kMOF6vPBeXJn023uVsSXb+gOuuNiuvDw/X/K1QuECKGPBGqjNvx8rA6gFHRLCMhE/stcilg==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::50) by
 VI1EUR05HT230.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::413)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:44:54 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:44:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1D0672BCF460CAF9ED42211C9A554160C3D81FCBA5ACF2CE58703C723157E55A;UpperCasedChecksum:13C8D0CE55FA07E94427A76EA2A5B425A1181B4D8EA8673FE4E9EB6988AC2417;SizeAsReceived:7450;Count:48
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:44:54 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] kmod: fix RCONFLICTS setting
Date: Tue,  2 Jun 2020 22:44:10 +0200
Message-ID: <AM7PR05MB6881DCC70535A434D4B63AEFA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:44:54 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-1-kweihmann@outlook.com>
X-TMN: [BEPeVKaS7B+9yEb0IrG0WZrtTDojodbc]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 48
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 86a8df39-64a8-4a0a-c6a8-08d80735cdf9
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3rSzKHgYCb4RL1+JrTTR/FiYZeStRdbJdPqQX464FD633sJ0y2NMgPAdUzxkl50qWWb6ZDBCYHnc//OHK5mf6aOArqS9ToCcZ9AruO11Zgjr5HX/lkyuneh68X+51QRCDdCYFaT0atJfA3nwvPdbY5ZXZm46jgMmVzClm4jNpvczVyNmkf3kb4ZfMyJkSkapfqLIBR+VkwiV6MagL6UPpaJVJDQ8gw9z0lE9RzaBvGAwBjmKidmQ+2Yg6GramBrvHoMNADgp5iBpJzEv5JTfhVx0NKooTKIWUX0kdwdhUVviTZDboSO+FRFGHWjTkFn1lh4qwbU7gUZTBH6fhD7noEknlGnh44Otf6UdKW9WaUiouXhaGjeGJP2jVUVBwNUbb14siSQ3W1ZnrvgweIqxKjk5gUO456SLuK7VuglFUj9l2eE8yqx93qPmraNh1xfVN16VMG65CTTWQwiRj65gCX8sQYdErew4ocBd1ssYBjci1e1LWECa42rpkZJoBIPLkbZfJVpI4AYTDejdniGxa1cpLiSa/MEMv0i3j4A3vF+3yOczKpfydHjhKUbCk/n6iEhpoBRrYOtA1GWcuwAor+qNs4m1rQlcSYqyNlgdsUvp+HluIDDWpJvzRL8+85Z9jeSFd45kc2uPrNMS9t749bfAQDQMgju4Ou4W+3sAKhuBiUnsYfEGw9rXpwioDDZJTjoqcU13/5ZQ==
X-MS-TrafficTypeDiagnostic: VI1EUR05HT230:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y7Tx9AdKMrRyam6FpppnwfD9E1/0Eq19iMmrJ1meW3UT76PfZa2HJVHyhcjqCovsm0hZt7togPmnYotGA5wx62K46uU88R3PIiIGR7Ebk3JGijjs8svJcPqJZLQtS2NwteYf7lamcipYnaZU4On3rB7nsNW21Lu57waFeY1B4+vqXkg3JFWNJWTE9jwV4xfDu902AKDgjdfFNAEQgQiNfg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	FCwnFzHgoGjkdATV3vysK5nYHZKzpHjnJo+MLkASQj4XtflIHOyN71tiCUBujyvgyXK4nIoUI9upTdSOiUBhqJ7Ui4cyaQMu5r44H0MPeyYmqWcbi4nU+Ow73RM6D693pfO5JGLPZ0mIBaVnEje8TQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a8df39-64a8-4a0a-c6a8-08d80735cdf9
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:44:54.7068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT230
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Previously used libkmod2 isn't known in this scope,
replace it with the correct libkmod

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-kernel/kmod/kmod_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/kmo=
d/kmod_git.bb
index bd21d2ff73..5cfd2238c9 100644
--- a/meta/recipes-kernel/kmod/kmod_git.bb
+++ b/meta/recipes-kernel/kmod/kmod_git.bb
@@ -10,7 +10,7 @@ RCONFLICTS_${PN} +=3D "module-init-tools-insmod-static mo=
dule-init-tools-depmod mo
 RREPLACES_${PN} +=3D "module-init-tools-insmod-static module-init-tools-de=
pmod module-init-tools"
=20
 # to force user to remove old module-init-tools and replace them with kmod=
 variants
-RCONFLICTS_libkmod2 +=3D "module-init-tools-insmod-static module-init-tool=
s-depmod module-init-tools"
+RCONFLICTS_libkmod +=3D "module-init-tools-insmod-static module-init-tools=
-depmod module-init-tools"
=20
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 EXTRA_OECONF +=3D " --bindir=3D${base_bindir} --sbindir=3D${base_sbindir}"
--=20
2.20.1

