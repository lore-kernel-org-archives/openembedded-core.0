Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3657.1792488593620650955
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 02:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=tsUv4pMP;
 spf=pass (domain: est.tech, ip: 52.101.65.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhG8yf3ZDIZXl6bbT1o6qvq7TzdZgvDZncP9EX84z6LW5xgOC97sC7qJrh8IS0RIHeRU7xpT/F9VL5+wUQ2OqSoGo3ezqisRgl7RfrWmXpgg+FqaUMv9Mk/RzTC5sSMzF81v4F5CDQ+AtW28U6IWJt3wvprsWgUncO+IZrGhD9NWmCkRBBM4+PR3SyxTDZxuw261Dt/Dngz7mACEYAs0ykj6fZGoR2v26HDjx1mQNte8ISFqG5Y2PNHR+D6m+QGPEJxjLgueMPTe8XbOQpeao5cz9SYnR4OsRbVtYakLc0UTOy0+X/8jQ1N2UlzgZXR/f4gHHDMgfTk5Gm1nW4fVwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiRRn5irqaDP7R3yYO7R/2iyqVTK8q5g+oWWeO9jJLE=;
 b=PPOovvmIvZ8BKiZg3+Rq+qR/NcwS1alb8YVMyuVK6v+uWpBb3uTAJGlN7B55pq2kPG1EnwmdenajeVs+Zins9GeoM16yreH+08sRv9NSNEKTINeuMVXJOqRx4+AabrKv4TyHEfMydfhp9duayCdyKQ7U8Ti6pF/D/JkOjBrm8AAYIt3E02UQDWYRkiuFm4tkYWDgWVcsSzIqweKiWazxmDZcUKo1m3LBp5osn4cS+kvPwsVxaRbXCjJGZADLOxorjOMmwR+F96qxHona1u6jmovHuqQMzqONOR1R4S2sMSAXj6oUlIhz81a9UZvMKH2k5LYsrz1jf3oXkFvX2t9e3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiRRn5irqaDP7R3yYO7R/2iyqVTK8q5g+oWWeO9jJLE=;
 b=tsUv4pMPi5Tk53iKvKrHmZ45jzx3VxGdnLGbM8Ou9VvcE2FflEt3qA11dccdP+uvcYdNbHlcwLiUsEGlAhrET5dK/ff4a/xcXJZuutTRVuuNf2llh6dB6/gBjRc8ml1QrsD0mVDuFK6JZDVJ7Bf/nJ7eLplOqh5SpwySJXRBf+Z6gbyXDiuTv1BHAwKLGZCwwvKjMhUR47yV+M/FAPCgYH8AOBBQ9gRSlBITFPawGkjYe4fgGV3Fa5a4ro07iyxjEh2Ndtt3qRUMNk4Y9JthwcKWiJrE7OuvoT/yNv5DhhRF2E57Ou4YOm+fVpUm0MaCk9IfEC0zsbkSMbN+zj6SSw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0808.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:11d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 09:29:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 09:29:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] log4cplus: upgrade 2.2.0.1 -> 2.2.1
Date: Tue, 20 Oct 2026 11:29:30 +0200
Message-ID: <20261020092931.4330-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
References: <20261020092931.4330-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0808:EE_
X-MS-Office365-Filtering-Correlation-Id: 666f82d3-5737-4879-a742-08df2e8cb0bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|10067099003|56012099006|11063799006|261009223027099003|12006099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 7MtZCWeczCJU8KLf5aDpGfPbNOkE1hxWMPMzbNf0uoRsn741qeRtPYJ5SsI6QX5KG1NkNQGr56hHRRv3cqymBAW3HFjKRPqT8ZXoQYDXmRYl/83uePclr1W/SSXzJBT9Kic4+GydhcjUF0nc/WPXmreZzXNm7BVpP48shZa69GGY8U47/rQV9RXNPubrEv8mFlGzsPcQDhZiPnLdFMAP3rLxdNVgOkpxev5N4Wa6u26NjdwEh3SXZEy/97Kwl7P2ZOBMxW7SZolm9pxKNdTfDSDHHnQ7cJ2YbaBdfiSmlyjaTFdBQzHXPHIU/5dQDI8DpD41XZY+UP5CZQXNAaSXooJP/JtZGC/aas7XuiMbsJosXSStnMUKqu0kMIMe7aWhQfbaUCgDP0PLm5j3l7MQDyy2zang5h/jIm2JPwRmWb0hmoZbshtPZch6DWjg3K55AOeP0TcQqUdKAj/7gxtPEuaY2aC9ksYPqHvD3G0IU+9diYcX1UmAWtW+OeuSfuSStGk3oZ0ObZotH1NODiuUXInp7Ezy9Ymhx885s88IU5Q+D94HhOyCa+eQvdj3h/NyZkFieeKEWWwttITIlPWIG1UId8hgsUu6apKpB/YU/FAovSWo8pggzhZZckbevKJ7Ago+hvQte8D5+tc1wU0yh3/oXUXkIHUDefW/WhFPlBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(261009223027099003)(12006099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wZJYdgUkwV/H+YzL6K7KUgdGe8v19eiIqOoFpnHeSEDPrAvLc5nvsZMkxvEr?=
 =?us-ascii?Q?iJTogfDxf3+Hc/y/HL19d62MY3zyx2pnrpWf3BSgfg6eMJdE8GUp3XY+CTLP?=
 =?us-ascii?Q?JHNxrmj7CujENaqeZKob94b55cPhb6RxsQ48rNPe68zfn1Y/i8Lv6xXH/Pjs?=
 =?us-ascii?Q?EaNajGXuq1BQ7F08BFz5DjvPv/Z0r4M1fT8lTGm+NYf7ZHc/N2RFK1E9rwAe?=
 =?us-ascii?Q?JlFBhmGy14QCi8ZWGXFc2LUoESu6kDAnQg9IjW6MG8f9OCmbGJKttc7Gce8G?=
 =?us-ascii?Q?7JK3qAjaqqDgh3iURKrfPBa1beFhhFrPPMtiOgih3LRcl9h56NEjbCOryRku?=
 =?us-ascii?Q?LhcVOllFTLjeVgCM5l9+oXRoGk3+C24GRiUX6IYomMxS8DZktU2bZIB9lehP?=
 =?us-ascii?Q?O+6M/zLlx7+aWxox1cES3gqaE60SZqNTVfWMUIH51ITt2HMKFICywIyaiI3P?=
 =?us-ascii?Q?PAVOVpDMBGJnaKpoOSWu7ySgmH7Fctd7ZKGIPdD2TTeWQnAFtT0Xrm2QVA32?=
 =?us-ascii?Q?ZauRSvTf9EnlXK/9D6fv9kJ1A83AsXqp3Qdoty+HtQUouB+gZF93GBZyCcj4?=
 =?us-ascii?Q?66uHiLVlBlTM53LX6HIZ1/H2Rba3L2D9Yv2FdQHo5NhNVZqadCxh5Mgl4XcU?=
 =?us-ascii?Q?qsJleSoCw/EjU5OmBxVM+glHUhkga/ebK+JYPqVQ2POR5lqqAYKFNgx5cvKG?=
 =?us-ascii?Q?2LGADj62OPiByB7MRpQFgD0YcGEY2HaWYAFNrrVZar+xbx08Txg7IAjOM8oO?=
 =?us-ascii?Q?sYeu9hZllWbVV2CdcPdMIzly29eXVhu8A+BNIt532gzGKvx6G6NfjeW1D0Ya?=
 =?us-ascii?Q?pvGvIK1zjpxp/7w+eoRVaCTETUD3phtAVTh41BAfkZwrdMs/QZdFnw3bIwIp?=
 =?us-ascii?Q?UFa2CaJA9I9CGYW10SuvvV7oYcMBsE9bsMZfxqxU5Nzv2LtcckJg2iL1Lj4z?=
 =?us-ascii?Q?Mr/jnktUsBezdsyIzrw6sJbFyNjWmu5OeiM9ZT8yUZDWKc/RZTeoh7fj7XNI?=
 =?us-ascii?Q?tl7pzvmitn6aePhKBIz+sxBx9nmy1CrrQfVzXy/sio7c9IbKkgmz7l+uuzlM?=
 =?us-ascii?Q?V6jZHX57+XCuot4OemlIGHTJd7Fj3D6YnIf08NW/ESDx2pHBMDQhPwt9x7br?=
 =?us-ascii?Q?kEWRqrvQsKZ8yGWKEXxrOTSfLCDLxJO7CRl6feB9gDNHcRd/BcSm5nxyeMak?=
 =?us-ascii?Q?RSwXdV7+JEOU7aoSCTgPma+L9ETqPOMkt1+FwRIAUC1pKp/z85ZUzAuZp/vq?=
 =?us-ascii?Q?aOaqNmwOt9xqlDbBIdGAq6T0Vuto43uMSRTBrLcvRz6/GBODphN4oUiVUoE3?=
 =?us-ascii?Q?sC6YQr+PH0XWh4/wnIQoZBoaxv8D+Yfxsz1T5PoaQbwnrOo3GpJM2PkVzcGR?=
 =?us-ascii?Q?i9peY7I2UR/vrtMwrOyq5dGv+7mplbVJQ6vwzatHDERzi0IPWOh7Em/QIA4W?=
 =?us-ascii?Q?4j7K71dpgYzYczxA7twUr8QmW5dPRxD7Kj8U3dBkkaEMMwCeHJYnwZZD/+K0?=
 =?us-ascii?Q?30MkAL2QzyufeaKg662du/WY/4cM8xtXL2V29u/IrX+jJ3QmBxiBT4tlLUvD?=
 =?us-ascii?Q?DtMVwroMUyPbXkzptbkVnATNnHFNKu+hCYI/cB6ZMR6lEh63eKuos6dKUf6C?=
 =?us-ascii?Q?nc428+s8/N089hlHhCLjmHpWOPKIjNMT/Zj2rlv35QEQYggBqQbyFdulxQGJ?=
 =?us-ascii?Q?R6ZwJjsrIsjE/H3JXNfbXA+GQtLpz1l5pq1RT6ovbHJXuE046XrGb87QkOn2?=
 =?us-ascii?Q?LuINTAzw9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 666f82d3-5737-4879-a742-08df2e8cb0bb
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 09:29:50.8392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HbCucAcYMU+rpfaGeF6lY708EzfQcjAV7pE4lyS+iCdLEVLCRDZXM26ybNlYu/KTW+OjkAheTi1nwAaqEe37HnQSiiQIYZM/9IW0Gbloy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248263
Content-Type: text/plain; charset="utf-8"

Release Notes: https://github.com/log4cplus/log4cplus/releases/tag/REL_2_2_=
1

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../log4cplus/{log4cplus_2.2.0.1.bb =3D> log4cplus_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/log4cplus/{log4cplus_2.2.0.1.bb =3D> log4cplu=
s_2.2.1.bb} (91%)

diff --git a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb b/meta/re=
cipes-devtools/log4cplus/log4cplus_2.2.1.bb
similarity index 91%
rename from meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
rename to meta/recipes-devtools/log4cplus/log4cplus_2.2.1.bb
index a10dd175a28..6aa29fb953d 100644
--- a/meta/recipes-devtools/log4cplus/log4cplus_2.2.0.1.bb
+++ b/meta/recipes-devtools/log4cplus/log4cplus_2.2.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D41e8e060c26822=
886b592ab4765c756b"
 GITHUB_TAG =3D "REL_${@d.getVar('PV').replace('.', '_')}"
=20
 SRC_URI =3D "https://github.com/log4cplus/log4cplus/releases/download/${GI=
THUB_TAG}/log4cplus-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "374175c22fabe752eb1c20138e732b69ae191e641f92d32c94=
32985cd860a2df"
+SRC_URI[sha256sum] =3D "e19d9b294f8c4c8f60467e0f456e1a347c81d479369d5840af=
c80c1137b7db6c"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/log4cplus/log4cplus/releases"
 UPSTREAM_CHECK_REGEX =3D "log4cplus-(?P<pver>\d+(\.\d+)+)\.tar"
