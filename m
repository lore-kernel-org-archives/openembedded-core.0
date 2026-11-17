Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16002.1794916293062564636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=MHUmQYKp;
 spf=pass (domain: est.tech, ip: 52.101.84.4, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9YE68RDUHy+xmUV7rxUpzAjSfmo6W7U3ajKvhV8hcwS/IX20eXDggpKpXCySXRZ1SSW05+96pf+SmgwczvDA5uyw7/Kg95Dz/5Ntc95XYSnj4ugRzL9q3QXBAgqUnzF17NjZqo1S/61TeYm41arvXIUY4BzeAAfQwNpj6yCyH/bnc310rSaxqe2MAvdBDGkWMPylTIZdmBeJU/esq00hoi4zu5A0iy3S6oEEDebxIOBn/WhOccoVHI2Rivkr9Q4y2Pbl9WgrcD+bcs/3vtg7dz8Axt49UinpTBPh0u63SZ3AFlVA5W/b4JN3NyD7kbjd8/OSq7hBurbuPTu4SjhjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDDVmxeOL2U7Gp8l7G34I6/set7x2P/sL8/nc8W2+qM=;
 b=K6Q+IldAG/nBdh7d4xt3B00rg432Sp0gMLYcuPxtJQMHtko6ZAE3TqnXwYV238LjC8/Hisj2pxwzAnWu2NILfLVspV5pkwW4of8+ZsPPfk2wLMuBxozBeOYQ+M6BWiPGURPXjykjRB20++VA5sPwz9s24tLWa8AM5vAiB3KQ3wQvdfGc/gMjxBGYMe0eY8Uai59zu6v0KOYtk5PPak8ncuYHrSQ3EPtRBu6CibOwQIs5fdSL53Qqn6//XT0KSmW1b4KfiY014IVCdqt5t5RLK+zxMuEWfKs0tLN3O9LS5enxBdKRcKRi9P8XZ7rjzZrs4DIL7jO8xvIK9AV9yvKJ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDDVmxeOL2U7Gp8l7G34I6/set7x2P/sL8/nc8W2+qM=;
 b=MHUmQYKpOlyQrc5Dy/LZjEzUCkuUbVu+5z3Drl6XekZap2jW/wxoivh3AR9ZI2s4uRMcZ5MV9Y0T0Bz80PM6V7kZFhlh5RTKhGqOzS2KkZ1e47ObjKKVa/ROimCgWgI2oqoq6yp8PAXHLiDfrtmpOY9qdoedUsO6MVC9KWbiQ7ra5Bo/5tc0P0t8EXokLfvvKU1M3crjmGd83keH72QxDZSQKngNbXBlpR6nrBgOwQGLzE2fT65KayeX/3J6uIkklnSAqFUVcPIeL10nlqYa8ZKYZjFnYbRgwA5M6Q7UgXX847v2efnXaWCoQl7/Tfmu3fdX/Ks2aLTeofL5Qmx52w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:33 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:33 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 3/8] modutils-initscripts: remove obsolete systemd masking
Date: Tue, 17 Nov 2026 12:51:21 +0100
Message-ID: <20261117115126.14374-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0265.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: 916b1f3f-784f-4027-0d89-08df44a1204e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|10067099003;
X-Microsoft-Antispam-Message-Info: UMRbCledZf6kzO8UrhVWnFWqp+TeDUkke3W65M09bwmmQSTUirPkdDgVXF2DA/S75iLuFqxLbCAJ+Wzpg4kKA8z3pj5pEl7/je72aK7lNmnnV6YonltTnhvplneFDNBADTmUIabM+x0trVrZqwFCARJLUNduPa4rHdzRTd5HAYTOu3N1yCQFJ6f+h8U1n9VNPCJf2zMfwIkXGlkf+Vg8yUnd2WHv/A1QvJqUGicigvKYi4Yn2GTt9I4vTRN/rgPXn6BcHIikD2fzbR9StTwZnf2Fq5IlRzC2m4iXF4dqcp5zMKlQVU0ogzTOLZqatN7pIaahlWtRDxsGD47QP+QUIejc/IJyO2usLoXyewEwqz9mI/J18H6Ig5rY5oU5u+ByJWylYLF4skh9y4VS1B7YWqIWAAqe1cyYkakVnDsvzlw+NnAB5dRNizPr2mr3V+Pp/MmGx1mmVklh/Y0+5EJV4ZLH53+tFGiymK5Moky88+8SoTjB46UI+BrHvBTDHBO+qq5ZEKCdiubp5Z2ms7O7KAs4SjRyFSIL7TTFZS49fN1e9hcvImkZKKDsyAKABYd0k7RgnkmIeYA79PObA7Z8IwkLXu17nE2pxkiw76+Hh5n13LK44HkDWFMv2GOonrYEU5wLJA8SjNWM+v0x4MCB1J8iV7p+tJsuCMbeanKogO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVltlXXmnYAH0wSUQpOFAIqysjwQcZZydWheWpq7ZI8a1FQI62FNIkCFLKYK?=
 =?us-ascii?Q?ph14GicEqJFWGJVE8b6FS7DZ/898dQpTdAHLvr2EC9CQUm00+LkPr4dtFny/?=
 =?us-ascii?Q?1e3FI8fy3jgZ4O24yeoGBjLE0qPkBYNE1PNMpMcgT5TKxjdGsHCaplK241m5?=
 =?us-ascii?Q?Xhobr0qQ5FzttbzBB/Rel70Wu/aWLlc8HWSfRfRilTJmsflnG+RahpZHSKMp?=
 =?us-ascii?Q?NtcU1oaklbaUqvpC/PT9IOVuAzF/3Ro7+AEVCsPXQuKT7rDIyMlps94JwOOy?=
 =?us-ascii?Q?Sr9Dp+LXBkp8qntGuSfJAeVW9v7fXoIwA+FIgw4j1Lr0rHp/K/zkupWo28sj?=
 =?us-ascii?Q?SfF8pKWMKTnVwjHKBl6J2OGHgyxoZRTlDXo6o2dh+fgAWeMuiGOY5jp7Dpei?=
 =?us-ascii?Q?C+WMVZLdGaqfKjIL8hcK3mA64nHD1V+1puGF9bT2s5axSC6gvzRmsmH5lg+4?=
 =?us-ascii?Q?3dvPN4NShvL9QvXFzWDWMMK9Orek50IloDtV8DxUWNbu3uVq3e43apTSetK2?=
 =?us-ascii?Q?r/nRwKSDsQ7Nalf/QY1lXSx/BAWDVAMdpWMVGyDY1GbVA56W4mgm3rnMsxrQ?=
 =?us-ascii?Q?Mv9Fp3dipxjizD33rjaZ9/lsprxQ71Ew1pyGQwYtwbujps2z8fkCORZTsq9f?=
 =?us-ascii?Q?yicy/i1FIcw8jtqN3mUvdfdysBAFeDlToP3ofyWMl6E6uCWXJvBbJNbErcMM?=
 =?us-ascii?Q?aBb8RIGGotXZvVswlAV827a1KzQ3OAQP0TzKROTK4K5lC7wzp0ieA4rZsKKl?=
 =?us-ascii?Q?ZkOE6zeT3j3R3k2UXYi819M9xK0aK345E3qCSNwR1BH7R90Ak2h+0aCLX3N+?=
 =?us-ascii?Q?Y8yS38m9K64j+WsuohuWABXyYLr1kzoJYjxqBkqx3J32Bf/Ovd/m8/qWM0nN?=
 =?us-ascii?Q?/1m366lB2CHxPOEWhTziFChgNtLhfyVRAQkU4UrjZpHrFykAhyZpRam10bQO?=
 =?us-ascii?Q?CSD746EIS4KzVhKV8QTEwXJiU1x/tCZ18lhKAe9Jx/77KYAkPbbya2E3QvIr?=
 =?us-ascii?Q?rx1TeJ3ElfwVih096r8h825uLAh9A1nLj4QtxwtG2Jo5TC4svBBkH+T+OUDw?=
 =?us-ascii?Q?lKG14CWNIbF9atx/fEMhSJMZ+lVL8Knq6E8dCcpTIH0HwwkX1N6QpGFGJgcQ?=
 =?us-ascii?Q?F/RIwJ40M5fKxZvjkPfeO68ouOwzZ5s2PTrlXw47scW7yM1DqcMX06C1NH6E?=
 =?us-ascii?Q?g+xGpjx1v0ti+MWwRE0dPM1kKg0bv3lrrruBGyF831WBVlZw3t9KcMRTNBkv?=
 =?us-ascii?Q?EYBaNcoMwkll9CP/uZuFf+Mzhpa/+OpzyjIk4NHi47TKfmHfHuaUDybIR0dM?=
 =?us-ascii?Q?ENVHI1gipZwRzAEMhMSTcU9XORdH/7Zk1EekOY873sNJPFbc8QokCos3KiKG?=
 =?us-ascii?Q?x7pP4ymnGELIfyLA+3bLjkzG3Gtg1LnkaSK4JVAwfEY6+jQv7qvqDONqSwdJ?=
 =?us-ascii?Q?+N8exF2LNVoUUpL5gscITntETewwK+x/YEmyLaTgELJWUSuyv0mEXCvQgwde?=
 =?us-ascii?Q?t/Xdgdm+1xBVU/CHW5uFAis/St/o7F++7VXud45rmSmC8Et8syBxUH9hejZ/?=
 =?us-ascii?Q?id9vSeAZmzLAQ4OemnyB3xd1ikYjPs3XGRAx0SjElSZguj3/K0nHMp7LQnGH?=
 =?us-ascii?Q?Rkp+7rTy8VAhkwr2CBStbyo/omw1K8YvuKOp/OK7Fyf59zDFv3axZgidI+/T?=
 =?us-ascii?Q?X88j+BSqgLWnG2NTiV14RcAkt9s2rHghqGCKT7THz87L7sqdvCihswNGDAQ5?=
 =?us-ascii?Q?P4kTqhlNqQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 916b1f3f-784f-4027-0d89-08df44a1204e
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:33.3469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iElFKp7cXoi60pYvTRGEze4H5Jdpn4cA/hGiKD0Np13lzGxjabyo39knwjf8fJuZBt1+uVHtiRVNDSubyi6u2Uzp/j7I65p6NThu9PvkonA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250427
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

systemd no longer has sysvinit compatibility[1], so it won't try and run
the init script in this recipe that is also implemented by systemd.

Remove the explicit systemd unit masking, effectively reverting [2].

[1] oe-core d9ec9e20eeb ("systemd: Stop supporting sysvinit compatibility")
[2] oe-core 8fc304a59b ("modutils-initscripts: mask modutils in case of sys=
temd")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8e6b86d89ffe9b16d1a9aff423940446ece0f5b)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../modutils-initscripts/modutils-initscripts.bb       | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.=
bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
index fb7b09393a..89ef8bd600 100644
--- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
+++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
@@ -18,13 +18,3 @@ do_install () {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${S}/modutils.sh ${D}${sysconfdir}/init.d/
 }
-
-PACKAGE_WRITE_DEPS:append =3D " ${@bb.utils.contains('DISTRO_FEATURES','sy=
stemd','systemd-systemctl-native','',d)}"
-pkg_postinst:${PN} () {
-	if type systemctl >/dev/null 2>/dev/null; then
-		if [ -n "$D" ]; then
-			OPTS=3D"--root=3D$D"
-		fi
-		systemctl $OPTS mask modutils.service
-	fi
-}
