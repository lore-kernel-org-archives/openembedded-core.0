Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.68])
 by mx.groups.io with SMTP id smtpd.web10.683.1591130708278884952
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=M/GMmJxu;
 spf=pass (domain: outlook.com, ip: 40.92.89.68, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oI+dal4MRT7htoi5A8olKt2/WiR/4Qu0ofe0FofyQ0AgE8TOiRMJS4Y6r3STRUqUsDLaFsP5gUzPDX6mrrYZ7/1yYjQGB4aYsNl1I9K+3+oW4BBs/ukrLcyh9tiztgMnfW4dtSGrGKuziYtDH1m8Tr6vldhivKS3SAXKBG4Bot0fvD5j3AjCeHt6bF9GIUZow3YK+puthgokzf5euBOikqGYnmwNSaWlgjeiYaSscaqoEwSf6u2gKiwIYg35BW92H7BV0ppX/1UoWL7thZti1Uilr4NrUPg+pWQ3mwGFKWbVr6q0K87msgh8u0zjI5IT01870EoLROcu/KCYwIbtMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xvj8/HbsuFCUKZyXdRU0VT6epXTynO4p5NnTPd3mv4=;
 b=RxYzp/Cw1+af/XL0V8tcVy6FcKv+iO44c4+ft6Lr8WK1ifnO7PIbhHh/Na5Rj+nFINSkcFEeEZTp7NL9LZBG5qyip5NRUNwAskb5hWMcVRnuUo9DVQ5+7wMb54nqyDUSNKSbRJ4wPg6OXCuDgCRK7CuoT5zNkGuFjmgTnZg44Kx+xAOQfYsLbctS2G0TowRGsM7FFI6RMRkWxCXU4HstIxm9+H73B5OGHud0JggP4lc11p35osOV7glqryR/FMWiY2Y5dG5Udd1a0myCe64nFf9vbwU9lAwhiSgSQbA44YuhM4jNiuN4RbKejFe6EDsVXbNOVauqvFfll+A3NU9WOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Xvj8/HbsuFCUKZyXdRU0VT6epXTynO4p5NnTPd3mv4=;
 b=M/GMmJxuDE0g2k3ulGHwob3+hrb590QaoihWJNe6AnyKvbDcJZgoGlB6UzO5bBk17Bmk7qXbSYNa/JX6So+LHHn3/ApTwSKVXSgFBj4WORn8ysZw+n8plUeWZJBa1CM15xLGk13rbko71iSogCV/lqnDdKjACwwmlzMryAmFjBq6eTm4dfO6IwgplA5GooFMyowROUvyYhoZrjRFdbV+djGc1fAe4ENmDou1UK2i02b1aXtjmz4OKQJhGx5/OjFL1/m0antv4BN7EoUpSlUPbPRlMHem8HuSrzynb97nHB3AFWhW4efwO6OkfE5AqjVPKu+jn32P5xJVHVE/gaVBZQ==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::46) by
 VI1EUR05HT073.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::127)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:45:06 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:06 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D7CBB54A2BE2A26F9A8E5279194ED5BBE172C63CDB7360C2F14163171E5D4EAB;UpperCasedChecksum:719A7E039E94CF7FBFCB2324D24B63F769B758B12A9A8002D273BA9C956619CF;SizeAsReceived:7562;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:06 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] vim-tiny: properly append PACKAGECONFIG
Date: Tue,  2 Jun 2020 22:44:18 +0200
Message-ID: <AM7PR05MB68818A9D6654B44CADF37CEDA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-9-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:45:05 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-9-kweihmann@outlook.com>
X-TMN: [X4pJyh2paT+Az3tD0iRKxQor+xbroZCl]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 5182f14a-3264-4df9-7f42-08d80735d4fd
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyKnU5wPuodHyLMPzuZ10HBOh88TnCChpaePdpGzM0j4SdPPToi7wKdg64XtvVhPUHAnFKwAiZnr4wHyRM05HE0dx18AkGTu4gdqCS/RJX92WMmholynipBIlbENZr5G6lNXUXdd4/QTQiNGx9yNZlUNHmcp/e7wDeuTDEisQWAep6FcTb8MGoh9c5gm9CSHdU+obWsbLyASWYjepdhMh5J9CdMHzOqd1kL6ETMehdiTTvB7bB8kgChAd2uTbrANXRF7D8kGObPqFs0TPHP+GoVE9UqVAVRwhCzuZbO7mYq7xNXYfJ7TxwMc1ewzxpkMmnal5q93DTRL5SB3FXDks+UnkCL+dR///Z8JIFdZOAJzMdh+1cOTeUL12n9q8wRts5QKc1+alNIHC3NDO5Yid9tfO281gk8bpkr994FAICm9ZzUp1faV3eokpPlfARqBsUhJXXxxc6fNgwgdWmB2RtSu5oBdpKyrneNRcLuzFPCHSMqD+ixLPBCp/SgYEIwsy/yh2Mwgmq96tnAZs0bZUfVwR7IfUInZRQlprf2wauB1ADbSrOzQ65H0WkfZXUiANJ0JSfQTLpj1Db/7yggJTlaT/atON+uIIM8Kt7bV0kmoRmWOca2vXzs7W7H0UYKd97iywneWdkKfr/82Q7kuZYw6zOhnAvpnXk8pisL/eqynZjuPfJjMp3duljBl5Tut4jl4Dx1ee+oraLZTN3PhR+YTcyz5tI5tnrjspMxJmRVmOdZo+bR0+2bMmurVY2JDhVM=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT073:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wQvm/Ye4p9xdr81y+riukIiDEB7aoGjyR+YFp0CR+TFzjfvIwFBZEOb+3pffA5ZjFY2mOwcO0UWsu0Cg5IgxfOUvsScvIYneyVTkzx5Br3d7d0BSAy9WE6WKWktcqkO2w2m0+y+pq/p6CqQNflEGPt+J8zLtNKT2MzbdeBZT1wbD9DUb6Habw1OhmuycutVEMse9w73l7oepb9mLH0UCjg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	d0q1KOlbz7nEikcr+GT/C1O5GZImmoUN7rFXXwMEVXHRneARH2ScptLpjWmY+lyikDgvoOajHA40I8KNgBH/QoDrChF+rWNq/cpozGEeMHQoOeudwkdWtPNBvMT3PkaDqdzAqS4b4qVF9+sfsIO7cw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5182f14a-3264-4df9-7f42-08d80735d4fd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:45:06.4304
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

As ??=3D assignment will be overwritten by +=3D in any case,
one can't define a default of PACKAGECONFIG in this recipe.
Using _append instead mitigates chances of accidental overwriting
the default

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/vim/vim-tiny_8.2.bb | 2 +-
 meta/recipes-support/vim/vim.inc         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-suppor=
t/vim/vim-tiny_8.2.bb
index e4c26d23f6..ed5631af91 100644
--- a/meta/recipes-support/vim/vim-tiny_8.2.bb
+++ b/meta/recipes-support/vim/vim-tiny_8.2.bb
@@ -2,7 +2,7 @@ require vim.inc
=20
 SUMMARY +=3D " (with tiny features)"
=20
-PACKAGECONFIG +=3D "tiny"
+PACKAGECONFIG_append =3D " tiny"
=20
 do_install() {
     install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vi=
m.inc
index 9f3dc08027..6f64104ded 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -51,7 +51,7 @@ do_compile() {
=20
 #Available PACKAGECONFIG options are gtkgui, acl, x11, tiny
 PACKAGECONFIG ??=3D ""
-PACKAGECONFIG +=3D " \
+PACKAGECONFIG_append =3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtkgui', '', d)} \
 "
--=20
2.20.1

