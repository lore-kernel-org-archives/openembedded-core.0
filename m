Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6127.1794231673157143867
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ISR9FZIk;
 spf=pass (domain: est.tech, ip: 52.101.83.42, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtfI/kOyKqVwspqHzGsZFGNyINdzZSF1309x6QWx4U/lNlQxeBjYaOnofKfFhkuQDiVJfkMaKYgO50Nl8syKi+ZKSl0DMNlkHTSD+bKqe2yNUspY7qRVNnjasnbF+jy9/QjjfBNU2wQ55S0CUdM2W+PVY6YOzqDhnSiQnOb8p0bdUw0TEGZoD113zrYLXNZynFK0FxZAHhVa0xMbbCLArvHjYj9ZVHVH6qiibsin7lMq2LQ3JayacXUuNLTXPoCqvya3nN1Vnf0MMAv6GKq2yU2pdnyhWH8UA7rgf0fXVE/+E+pjLdvqecXbZEwfLcOWe+Rt0YB51KmO6DLZQHwW5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkoHqw0m1b0DJb3V22tUoamoWHHqImaefBPbZzoHjG0=;
 b=dSnTi99sajK/R+d63m+LcSUHzoydLijJXugqm8E4EPln2+KqDcPvmNajSHv/gAHIKPTtn8P4VG881dMp9YLLNFdZFTTxHJEIlBVnb2fNA0Wpx8gLHGqmVXjbozDeaY6dA/GY8Wb9ax1+pTNzSruT7qr1bkrSoolku7Eu7xWxGv2qXYUz149s0+FVv2mx19/iJ6pCIIgPs38E4p8ZfQfXvsIH5TG0IuavUOBXy5PE1HB5Rf+/DVtscn20tzcM/I9T6DU84YTYUJbE+2hvJauySNLiUGlEePQllxrkazpw7Q6iJv+2v4XVp1OWVptO3cad2cJ46qjteqbVkC+zaFpbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkoHqw0m1b0DJb3V22tUoamoWHHqImaefBPbZzoHjG0=;
 b=ISR9FZIk1bZqRClW0D7L/ElWWCcBsk1r8meXMzSwH/9zTcDC2nTAPxbYy9tPkQrp0ngCEiAmhavD6MgE5OAATNSI9/5WgqmxYA0gkjDBArkhUZck4VZYOJOjf/19fmnONK/7dsghnNyIc4qffqP05Y14pYKPe3Bc30jxgQWLYJx7HIq/6pw62+YANHuXaO3YVIm+uHRFImAB/06PYcdMg3C9vqhD6sqlS7tK79iFf+0IZjS8k4HE3P/0XEjzi0TCeVlswjSABvfpQoedpJtMe5B4T3miBBUcZ3r6ZhBT0W2G7T8P1eRxNTk2w7wDIH35UsWZvggiosis3g724jp5Lw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AS8P189MB2200.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:561::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 13:41:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:41:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/21] python3-pbr: upgrade 7.1.0 -> 7.1.3
Date: Mon,  9 Nov 2026 14:40:32 +0100
Message-ID: <20261109134034.74458-20-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0067.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AS8P189MB2200:EE_
X-MS-Office365-Filtering-Correlation-Id: 305fcffe-bd99-4ce0-03e2-08df3e671bb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|22082099003|18002099003|6133799003|11063799006|56012099006|10067099003|261026121527099003|261028144727099003|261102123227099003|261022105027099003|261021121427099003|261021123027099003|261026140227099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: nbvlDEyMgs3A4CXcj++P0yiNSp4zHgSlOp2fU4XifpX0BXRTjlRnktobyBnRmAgWRXfYw/RJnFPqqt8iTAOE8wQPiO518xmNJ6cfl5TcvWajjcNPsNcsKZGsIBNTldLpzJ9tP9Q2wtyw98vrMqTFmwcPcjYDIRnp3IILInrfskYMVP//tXlGm1u/B6Py8xArUYQXQgIYTiHfTrvf3MrNtInIOWVPjv2WPN18kkTq3eAaam/y5hiIBuMBoNfef2DX023veabVdFXJ3/YODnWk8fxES1JehtJh5VkPgShp9nW/WaNmRVbXdiShx24VjneFtKcGxcSUbNBoYkQqYdwVf3QrRh9R42+6M9kGz7EeU745TRrmvdUmT17azShzE6+oO3buRti6jdOUwPKdBjCeGihoHCGoboOI/ohqdKxBnnHkPMNIpbV4YeqcJ839qToTLa4mMX3JDJ0BiJZ07hJbYLIinAFa4PnaUgRCnoCHdYmagbHtQpWpUmYVLWupnvY1eBaGF9SyDmy14f0JYXN8bN7jzl+z9HqYdxx992c7Rc0ZZLFvRPTWhl++QlHa8uLS8vmcHkot/N1T4WZ+hgorJDHWGXGYI/ZqLetWqDfcgnE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(10067099003)(261026121527099003)(261028144727099003)(261102123227099003)(261022105027099003)(261021121427099003)(261021123027099003)(261026140227099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jLODD+ISlOhrJkTjqb0aiKDnelrXGIAL3Tf8yuU2Qra1tuUmTE/X0tZYCA5C?=
 =?us-ascii?Q?3hsByWtJ2+uLR1xWpK0Eozjo6CPtc/cULEZKrZ0NHO+5FwzxJQBYXC1nJTcH?=
 =?us-ascii?Q?Qh48oQN9znUdWPPhyBXGaJvBhzvyQGEs5BR9Ea3y3xfbbpVuan644V4OM/7y?=
 =?us-ascii?Q?7iNa+ivLepijmzuVa5XS3kIHwedytHB2EJeUGeJg7D3aKj6VqiLdFzVo1ExU?=
 =?us-ascii?Q?mDxvsn7TxvLokvlko5cRslIPuiLxSpGyQJuvSNeN0Mn/T/eYI8PYArNj1nij?=
 =?us-ascii?Q?JTshQCJmBmYe7SpCEUj1ddPB+MWvH11LvD2dc7RX43nhY6CKwjdBFHsK+s9r?=
 =?us-ascii?Q?wCceevfIPXGBXALR5f+rJ4KR12dWFFAnGyc+pDXm3PWfbTgFDnj6o96sxDvw?=
 =?us-ascii?Q?59YRzEccgDMg6bX93AKiiQ4fX0EQHixJDMlJw3+YYJ/3nu6Og/9aLtk3QzPg?=
 =?us-ascii?Q?p3ZCigtSvaVaOFj8ac1EJmsNPBW6Ixrf0ZHEJql/VsK4cfzASEpsvKxHa1Lu?=
 =?us-ascii?Q?2OA9krcmAeJKIK9jH6q31wYHPvTenCEjjUvstAfbuG51SK2tcAon6xN4FL8k?=
 =?us-ascii?Q?DoPFfqbjzpygXmvLIRnch3fLj4joeneDZ+c1ipoqYWRL8HF1yfPlN7KHj4u0?=
 =?us-ascii?Q?l7SpWoE47cGVfiv9ZzDxWigt6TGUj9akbmqu8ihkuzQjqoqjeD8u1C+wGJ7W?=
 =?us-ascii?Q?cThNl/9BOX2C51dhpWqnJrrzYyufH7JJRf6LvEfKL4273pZCTyRWnUiXjTpF?=
 =?us-ascii?Q?1/wpuvGZdDA/m0Zu0BoOLXKMT9Q5C5Y1Flg9mWk6xYqqn0PnXdKYJ93MjYH/?=
 =?us-ascii?Q?wMX7khnPWTah5UKo5Lh43+ws/grOjVWHT9eI2nHQsu5jsZdJ9NAtoe7ScdoI?=
 =?us-ascii?Q?iqlYTDPls3G4DhS3Y4qexq41aX5QNr56JKxZc49TUxYe34zy9cmQA/n2OFR3?=
 =?us-ascii?Q?IX/4ie0kI6Vr4DXxEIL5o5kOmKFhuyTFPe4LY6NduyVhdYYCyJbQhAeRjsNA?=
 =?us-ascii?Q?SwY7AzaOgip4kC7FOvRjGpCy15XjFU9QQlgIlwoOn/1R2cVJDlG0gP0siAtD?=
 =?us-ascii?Q?gLrYWL4bLFuIVxlUxHdLn1GXvs6glzFLEQ66s6sXUlMj31dQPsV2s93Cr1lb?=
 =?us-ascii?Q?1vG2Gk1HhXzPzLBL7JRgwHgHJMu+0OsIW+eVU77WdD9W+4aFkedN63HIrxoS?=
 =?us-ascii?Q?tnS8drCC6O4e+JvhWrNPk+4jl7gTYP3tm9DnkV18gAI9wrrY1ZpFdchuT647?=
 =?us-ascii?Q?bxf97Efd1g4PwnNtM9VJaZZ9MdH6WGNbYSkFpTPIbwmb0aBaTOWD2PT3tWtV?=
 =?us-ascii?Q?mv9VxkkLwJI+CjLsVeS8yMtayyh2gN+INvuM4+bsBJxG4zMyTpWhKPKqIE1a?=
 =?us-ascii?Q?v8UOJoChbDz81dH4VarLS79xj+tuEIp9YgmqRm/cMIIz4BxStUIveSSYL2ju?=
 =?us-ascii?Q?rJn9fM00EecjnNqaaVYJZb/0oyIk+JO3S9EY+qwjJdEoN+bZ1Ld9SfkI/ac8?=
 =?us-ascii?Q?pEG1LYm9EyQ6H36d18pTjR2sv8kG7KuqhlRXlx8AcUkuzX93pc6jnpdoewws?=
 =?us-ascii?Q?czw1YsR8NUgnlyXtXkCrJ83fTfIdPaTlRz7ZBA2obQe+qBJJBmTBQMRYZ3EZ?=
 =?us-ascii?Q?NdpWLO4o8CQv7OW6YFZjKNc5dLWAWjNPuB+s0ID2Dqvz4neyXy1jsEc1VpsB?=
 =?us-ascii?Q?rxYyk09hcxNDOy5QTS6VvwurGBghQATwRrRhH4IHwY1Ydf0YM2aaC8ISjtgb?=
 =?us-ascii?Q?ame1P20M9w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 305fcffe-bd99-4ce0-03e2-08df3e671bb8
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:41:07.9399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U2Bfc+ihiTA/mYSfLmqz63Lvn56Y+VqFHg5HAGxNPUaNcwkC40dNkyaWC6yJ04i3jLRBfRIsoKGQySDQ8jmscgKVJlM2FNBJYbSTehJZHC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249824

7.1.3: https://docs.openstack.org/pbr/latest/user/history.html#id1
-----
Insist on Python 3.11 for pyproject.toml-only projects

Only provide PEP-660 entry points on setuptools >=3D 64.0.0

Revert =E2=80=9CSet setuptools min in requirements.txt=E2=80=9D

7.1.2: https://docs.openstack.org/pbr/latest/user/history.html#id2
-----
Set setuptools min in requirements.txt

7.1.1: https://docs.openstack.org/pbr/latest/user/history.html#id3
-----
Fix hook ordering race that drops subpackages from wheels

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-pbr_7.1.0.bb =3D> python3-pbr_7.1.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pbr_7.1.0.bb =3D> python3-pbr=
_7.1.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb b/meta/recip=
es-devtools/python/python3-pbr_7.1.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pbr_7.1.0.bb
rename to meta/recipes-devtools/python/python3-pbr_7.1.3.bb
index 7fc227e6bbd..e11dbe6398e 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.1.3.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} +=3D "python3-setuptools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
-SRC_URI[sha256sum] =3D "66ece3a2f5c4f05e5f37569213e755193f6e00b8aa361bfb19=
0533ea8ee8b10c"
+SRC_URI[sha256sum] =3D "9a4a85b84e906337708009af0b5f5cdabeeb72d4dc213c9e97=
974da54fd9acc5"
