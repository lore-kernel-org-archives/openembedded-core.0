Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31805.1793876983817942877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=dC7Ni8lb;
 spf=pass (domain: est.tech, ip: 52.101.66.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SY2l+nGAdrRgBbB1G5Hn3gcR/ZhW9DMLU/7WKhNx2GIBP7tc0c0sJooyhmFkMVPWkVXMMOO4JJnr+zxtpDzxTs7xeU10FKVKuNfZfJzBQDL/Tv9eeDS8mrnNTW7ehTF46zxfj4L7lGxEFzymrLUDT6IL2PydXuK5tOFAzb0UCCceFxT+qs/HCxRcag5v5kZYx/E4nCNmEacxSPrgZBv9NguYMqWhXDX7W+QEi4YpGW3VihZc2IZOFGguKSuRQc17iPFJddSyGhXOJRgbfLYSQ3P0rQPWGBBDeQ6RF8/V+/UecTXYguk/6q5E4jz4F6mm95qtPcN1zyh68rEvYVc9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tgqgve3jR5X2Y6IujkBs07v4QefQ8zRhfjzh5v+MZMg=;
 b=UWcm31Y8Lu4l3TG13iEW6YnzANli7UI3wqDRU3VEHe9YHTFnWQ9MpaTiH9TV+9uH9amNmBZUFC19YdhXCPVxP26tu+tzyLwNvZ9hOGq3QBodJe/y5faA4VMagRVo7R11t6zpu8fBOa9RZGzQnZgJo4s2C7/ThsAgiWAJM6j9i8kUX7ub+v3NNht05Z3RDdDMf5iOZ8tLtbeCWkLwW6Q12Pev2WkZv4nO7Xbk6oZzm6a0mAPXqjKVVvUJ9yuK+gQ6bWs1OpIgPS8v1Civ8hhLl6TzInNi28kvx2a6u8s+r58lkkql7YopUTFXT69STl42aiZlHxRR4PW5/awzjNIi/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tgqgve3jR5X2Y6IujkBs07v4QefQ8zRhfjzh5v+MZMg=;
 b=dC7Ni8lblqa1zrEsSPQt1+f3JhZntVtKdEZOVVNE5bDC6OqkQ381ELxXSr8J0tkSvgpC/Cwc0wWG2O7KkIajNiu8Wi6XjSJOloTjs3qrmBvzz/Fe2w4MWRYDrvuCNxIjPriKcd+g7SOwBYbMqOnl5VsU+oKMBULlxktoHW9MX4ephQJkJpEyyfGWhjzFgFaXtDfnKAh4rFg4nIBdtWw3srUcW2HX/hoSTLaOVw7nMo1IJwEEKK1MuPR4AROybmzMqHKZTjKqL/nYtprVV0tvvPwm/lG9qAm4802TuDYRi4F0FdYxLf1wnJCwSqjeritwjsKocZMt+1Ulk6UPKDpjPw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:43 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 06/10] systemd-systemctl-native: rename to systemd-tools-native
Date: Thu,  5 Nov 2026 12:09:26 +0100
Message-ID: <20261105110930.52643-7-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b87de5-1605-4d3d-7be6-08df3b2d4b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261021121427099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261102123227099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: knJths8/c/AwUvFx06z/8Tv6MJhYHrY+6VSmjPZ89lrhvLSJ0KIMnNN013pXkMwLHwc22bOOaifb57s941IPZo8vvjJ7+39QvGgb1KXUz7T88aQUOfBeOK5bEtH0Tqpppy/4rMY5mc1pVQzDKNSFA24wXBu00xFfVN4Hg4/qqVj2qeVykjvvinFpzpSGRnuPtvxnylE6bXKHn13mZn5Jbwhv5aeDzTwO2qJ8NXxqIeUhp1TKl7TroWl8bakMrCBEOOKjQZqEkX5DYMprNJ9nGsCpr6fv6HlOnXgxBSzez3az5JYbcOJVVKCSahkzfEUq3zyjae5AEL0fIU0Or84/hk5PreIZIn9cqpMWeVjzQx4y/fFSXhSOttDBlSlq9GX6E3CKXBum2VJaS4IfaSXAEyrhu+AVHUARgg8OpurPR8JYsfq594hr3GNNkeG5e7Y1UZYsC6WGJPT6YPL3Y13vasItHf4R9Thqw6hHlqnJo2ZrbBncTs+g556+jgHIPz3QcGxHSByw0OWghV5x9vsK5loOiCXOIvJe6ggkd7N16SaafPKjTCi2rVdTOxwxKP4nnxHvAA2Pzcqtr0qBQTdPOXNIPoY6fBUZZWT4ZxgVEh3wOBoQ+QIaAq4StdQGcLuUpswyker7evjDzwr1yAmwX1byaPlf1pKs9tzkCbONZRk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261021121427099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261102123227099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/5P1URKC93c1mry7gSTlKjeq0u43Mje5rZZDBGjRgNIeaoMK9HLBE2o47RI1?=
 =?us-ascii?Q?1mIb4a2X50bs7O3G5h81WOLzucI5X8J4m7KjnfYuCUcaazxqRPj+E32mZkXY?=
 =?us-ascii?Q?WvnQxstiqguQ52+xrlXjK4suYyIW5GmzOoj+La6vnZyyXAibOuyXCxuHp0d+?=
 =?us-ascii?Q?DZZ7+e7RgvUo+R5IFkigFlyxA/bdm6pfVgAA6fmZsh5JBG9NIz0JnkMoh1vf?=
 =?us-ascii?Q?14geZMrHDkprDI6gTuDAN6H3nx5Sk507kfnqEmUTmW9tXmLPm0bQsmOeO46d?=
 =?us-ascii?Q?0mA+tdfxGi2GgBFRrRJzFqL9lATXQPwM1hATMPie9cqVJuJ+xVYuoA/IdZBB?=
 =?us-ascii?Q?ZFN17nMF2v/P3MBf2fYn1CkO7uBjZxSdvnAwvJeJhZmaF8sJeK7UxNV09DoE?=
 =?us-ascii?Q?S1a5JFRdUA3zi0qrYbcb8Pix8jFSUvdwUkApalXCAWCnbZuexqx+MoBMq5k8?=
 =?us-ascii?Q?98LIFZPNT32wWEU1B+Jo55Bc3wTb4gH5WvHN7lt3I00hiMhr3E6P7/XCx7u1?=
 =?us-ascii?Q?eoV25E2YM/WPWnrh72BZfXyuNcjXsLE4YuL5kBUnHIH+RCuFsSPh+OLw8msc?=
 =?us-ascii?Q?aTNmcxXuL8hN8Y25h1DQ3gvhOg9tS16gsX2/X3jyFBC9YMd345eRTwghwM7c?=
 =?us-ascii?Q?opbxrocmnGmvPaNb30VwXoawR6i0f+WirASvGLaULa3uHsHEKsD6Qw8Cibjz?=
 =?us-ascii?Q?LOBcn6Ye3i2gh+85GZJ2F40iJhtDKh3rhe6+ptPCD7HaLgqnlZH2wb8U6AWo?=
 =?us-ascii?Q?IehIMvCPd5WoN9497qPEj5OgyTUdwUJr8na8CsJQoQhj4h9EcOriqhu1Cemw?=
 =?us-ascii?Q?tfG0skQMlhGdWDduRLpHmcjWrjZveAnDAlzEKJsDka8ic64+evot/LOb1SeC?=
 =?us-ascii?Q?CjIwzyTTZi3+0iS4c5+Z+lgCS4Fann4cklVdVVC2vNClmSFE+FKFCs0lGAUO?=
 =?us-ascii?Q?qd3PLp3nvv4fEn6n+/5GMnCHrBx3t7cxl3CHEKv/ceyvmaAnWUuh99YZYsrY?=
 =?us-ascii?Q?eDsB9UopnXPJsRr6UYnRFPbmfIGZ49aBcH2JObmvMwJQFWifCQhBll96TRaq?=
 =?us-ascii?Q?L8DHVWbjvtPLdcQ7PgkwGIzcKVDFBwVbEZ3IVWxNn9S89V/XgHynh/X9rI3M?=
 =?us-ascii?Q?5hhO4ihbNwK2k1dYuT8tM97HQKNAdr9tbXjaobJcyhAdJWugtvWji+5UAXZA?=
 =?us-ascii?Q?tYFQkQk4M2oBMsyHZKqyTlQrSslxnDUjiMLq7LSEC7TmrziSzQhktH2uO+XM?=
 =?us-ascii?Q?fJlaAnri9+aJn5NkHpXnENNtBst0ym/LJkngGQ/YvpTNw+osqya81o10d6t8?=
 =?us-ascii?Q?n6W1H7kv3BxovJA/o9AP8WFLqf2aJFPGqcWhczHLzE0g+t2GoDaakIIocBd0?=
 =?us-ascii?Q?qLUjfiM5U3Lw0iEOZMIxQL2M6IO/jW6j4I1Wa8/Pf2vOus2bxlCyDBHl/r2o?=
 =?us-ascii?Q?VFxRoWZYEX6XUT08kfJK+qI3+p3dG5qhfW5N/I+H+GHlG+T0aB3auN7FkfTc?=
 =?us-ascii?Q?cPMKG2QrOoRwlY54kh8/f5858ZM6S80mW/MxNoaGpK6Gth606gCYHe7M3YOO?=
 =?us-ascii?Q?2Qd1PzSEejsjD+dF805728NMOSN/Dd6/tD+mSG4ZUq2ebuLDHcPW5eNNDjmK?=
 =?us-ascii?Q?STEbD80dP3Hh07DuGgwvcyTVW3I6RLTwKXqogHUThYZnffevXVSu37PUvaE9?=
 =?us-ascii?Q?R49ySC7FdnSt954CpU4IGftRwSkMLaMr1w5w4iKTwZPSjlkHw0Dbe5MYWhX4?=
 =?us-ascii?Q?Jve0THi43w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b87de5-1605-4d3d-7be6-08df3b2d4b2c
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:43.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdAkvhzKfqUUH3CS0UlSbMkKzf/m2tHN7QoPPhX0DMsjwdG7A5w9k1nsQ2nfsc5zyoE7j2c7tHwgrTfTtLy4v1k3vQ7cJISAV4vX+/dxaAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249533
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

We plan on building more than just systemctl in this recipe, so rename
it to -tools-.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ff985de4df46945a92ae4ca59e54c930b7640c9a)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/conf/distro/include/maintainers.inc                        | 2 +-
 ...-systemctl-native_259.5.bb =3D> systemd-tools-native_259.5.bb} | 2 +-
 meta/recipes-core/systemd/systemd_259.5.bb                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/systemd/{systemd-systemctl-native_259.5.bb =3D> s=
ystemd-tools-native_259.5.bb} (96%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 7499f7ab95..b1101172e1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -832,7 +832,7 @@ RECIPE_MAINTAINER:pn-systemd-bootconf =3D "Chen Qi <Qi.=
Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-conf =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-systemd-machine-units =3D "Chen Qi <Qi.Chen@windriver=
.com>"
 RECIPE_MAINTAINER:pn-systemd-serialgetty =3D "Chen Qi <Qi.Chen@windriver.c=
om>"
-RECIPE_MAINTAINER:pn-systemd-systemctl-native =3D "Chen Qi <Qi.Chen@windri=
ver.com>"
+RECIPE_MAINTAINER:pn-systemd-tools-native =3D "Chen Qi <Qi.Chen@windriver.=
com>"
 RECIPE_MAINTAINER:pn-systemtap =3D "Victor Kamensky <victor.kamensky7@gmai=
l.com>"
 RECIPE_MAINTAINER:pn-systemtap-native =3D "Victor Kamensky <victor.kamensk=
y7@gmail.com>"
 RECIPE_MAINTAINER:pn-sysvinit =3D "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb b/=
meta/recipes-core/systemd/systemd-tools-native_259.5.bb
similarity index 96%
rename from meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
rename to meta/recipes-core/systemd/systemd-tools-native_259.5.bb
index 3c0dcd35a3..5b29babdc7 100644
--- a/meta/recipes-core/systemd/systemd-systemctl-native_259.5.bb
+++ b/meta/recipes-core/systemd/systemd-tools-native_259.5.bb
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/systemd:"
=20
-SUMMARY =3D "Systemctl executable from systemd"
+SUMMARY =3D "native tools from systemd"
=20
 require systemd.inc
=20
diff --git a/meta/recipes-core/systemd/systemd_259.5.bb b/meta/recipes-core=
/systemd/systemd_259.5.bb
index 848e12e8b0..69f4ee4fee 100644
--- a/meta/recipes-core/systemd/systemd_259.5.bb
+++ b/meta/recipes-core/systemd/systemd_259.5.bb
@@ -24,7 +24,7 @@ CONFLICT_DISTRO_FEATURES +=3D "sysvinit"
=20
 # Ensure that the native tools are available when we're building a rootfs =
with systemd in,
 # so that systemctl can be used in postinst scripts
-PACKAGE_WRITE_DEPS +=3D "systemd-systemctl-native"
+PACKAGE_WRITE_DEPS +=3D "systemd-tools-native"
=20
 SRC_URI +=3D " \
            file://touchscreen.rules \
