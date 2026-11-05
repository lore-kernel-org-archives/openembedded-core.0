Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31622.1793876978210880068
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E/yLEXST;
 spf=pass (domain: est.tech, ip: 52.101.66.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjARRTndO8P+5GCF8Oj+NPFU5IeGnY/7eeimkfTNPLYJm5TXujAlqfY3lX6fpIwFrSPGAsTyRXNhFoa1UoWN4VTAIct5Gj7fkUlrsKMNgG1iSR7nriZI9uBlYL0630rwSCSipTxrNZrXCgVqxYPX6MA7TvvIM5VDlmv+G2A3XJnCR6/yrl22SXsJ0lDKVxKd/LE8jqJZZQZ2lQ0jlPqqU3IZ4jJE/WlW5lRGuo34Bb7rGqpO1suTvXT+UyufA6UUSmk5Vt25Oz3K6xMuCELir94m90xVNsal+AGTt5IUfzNzN+Q84OIs96/a2MYSD0HD7yo8BX0fsRwVEQFiZk/R/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDDVmxeOL2U7Gp8l7G34I6/set7x2P/sL8/nc8W2+qM=;
 b=U88VYn8w24DA4WKPy12I+w7H0/ycUv/WP4DMp7LorkdjRxbwT0qSrxAoHm/AB69V1vuA70YjbRyJn1bDH50MZmyygcdZwetTX3YFCrzyEdBRSDN8vb/vmhi4RUXh2z/8Ag70G7sfy6Z3Lf8b0r8A5x1gxTOsy+qM3szgBEmbtMHOq8BgeJOHuOyQtkxwMq6i4d5EBoniVMCwQYXnuMzp/0xSzv0QtAt/IropvHMaanpVinGyusYykSlz9qB+ClFaJdPCkH+rYr/Cg0lmZRNjzTFHsCYLNN8+M+RyArPJ2NMPxwLXuh7MJe8GeJN/c9IcLwBepr/lyYGQl+rY+2KBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDDVmxeOL2U7Gp8l7G34I6/set7x2P/sL8/nc8W2+qM=;
 b=E/yLEXSTctA89qCtHEbNZmlT5syzQdxTdcNqtzDhf5SQdAqSPdpRw643iStuxpDDs0SenDkvuLVolRcbVoohChBds0Mx3TAgACQ+pXfDyiQ35Jt8WehrFNDUtAH/Hwdt87PHUCiwszdU4+2BSL9s0huHNUzEdrrJRnCB8/s1tjHYhlMWhac3UOv6GhW0OGI/wEqyDG+/oVxPDl9O93JIglss3FcEChdyWmhtUNTRYh14PCdeGOFiz+Ranw6FB/yh2lT/tgyVE8X2xYKsocq/x/9B/oTg+pSH7oj58UHShaexUzw7SeDO7n8U12xbNqLdUbTSuxNietSsmrKVv2uSyA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3462.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 11:09:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 11:09:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2 03/10] modutils-initscripts: remove obsolete systemd masking
Date: Thu,  5 Nov 2026 12:09:23 +0100
Message-ID: <20261105110930.52643-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261105110930.52643-1-jaipaul.cheernam@est.tech>
References: <20261027110126.9383-1-jaipaul.cheernam@est.tech>
 <20261105110930.52643-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU6P191CA0041.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::21) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3462:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fd94642-7165-4ed1-b749-08df3b2d480b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|261026121527099003|261022105027099003|261009220027099003|261009221727099003|261022075727099003|261009221227099003|261009223027099003|261009223327099003|261021123027099003|261028144727099003|261026140227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 3NewW5ZNjcf79s+aY61SOKTqMWUAFhedz5kscxUzcKO7OFJw9QqP3XckjCgkZSXNbKyvqKrwpSMMFirNBfB0O1qdEcV2CBEhL8R0gAyLSkvAPyRcRJtDJDwnqoFPYtK8hyOGMfpsBYCVMNKBgxAuy2pSd139TDtnujHl/0fOE4wU7b6ncvWoSa0hFeRgSGo55lNgWD0TtEukIauKN3oEye7GudkveyuRUlJau0Yq1rAAPctdY7GnknczWzebz8HdU3ABC63PqIxPp0L2LOtkSAkOSQCN5nQBet+Rwxp/yHFTD/kFBRiQpU+04a6ZWN4LjOZ/H9KwljNbljST1JPJbttAXBZpSfJJ63Bb2p7kz5qpKCQbgc2CJjg45VRCAYG1VlytiR4zSnhhRBLMCQ1GpUPI58cN7XPgYm6Tz0RBuf6XlI2G8UBaQCpoc2RAh2nthPDb7RSoLOpR2ok1fT8gj1HBIJsB0gV2k4RRny8YRC7gGOXQwtuZ946IpKFg2BIGz78RH3AcRnTI26C2kqoWfbO3NgFn8k5rFtrkE78Hj2ylHwE8f+Uv/x0kNrd1KnqKrXCXOzQN4dFoKN+IrkFCkZydLIgaYMSUrCiI1IfcV0Wx3oxpP83ldO3FL5V4t8EFW9tWww28pRWJ6j3qFpNJLM7G/JpSSCplLvsw/337mpg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(261026121527099003)(261022105027099003)(261009220027099003)(261009221727099003)(261022075727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261021123027099003)(261028144727099003)(261026140227099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GX7ktBPPsejlAuPTINVJIe7FF2t1s+RZHc70InZZMGtYqTVelZqg1ctxe92E?=
 =?us-ascii?Q?5uNeIg5Ny4OSxPQJQozF1h6NWcoAjR/b5T/sQ/NH8nOUwMRPt35+C/o7bwrw?=
 =?us-ascii?Q?oZ4xyWbEZoYsC7LIHRzJVWSGJrEtT+q0dH6uRCPK+f02K3KrkHA9Feg7Z4cb?=
 =?us-ascii?Q?G8vZ59lZl7hipVpJrRdXBv16nGtPSqrQMjlH0iKae/yVWOGxs7rFDMLEo/3r?=
 =?us-ascii?Q?zjdSAlJNWHxwnJT7UUksi2cDF45QyvnNIu1gC07YPCQkmoMmedImYFClTTap?=
 =?us-ascii?Q?ScQkybjBJ9gNCQrdLU8kJjqq4ovB/bykhryRyQS/bxlhmUTXzntdCcsngWKr?=
 =?us-ascii?Q?QmgJ912vdtAwqzRL983NcMszqbMQTfB+taGRw6H3ku2JAsO5aiOPZNNe7xfn?=
 =?us-ascii?Q?l1TQVPWq8Rk+Jg43CA5bPZuOuiUViY15WJ45pZ7pXPGzbdpfsKhCp6sMfIL1?=
 =?us-ascii?Q?OoKYZ+lZ2Ic4X53EfHjT/R4zo9gUYp732Rq9fPup1KCyaxUMXo3In6Jg+EAS?=
 =?us-ascii?Q?9QpYgoiLeYma+lOB3WM7EHy9NRK8SKf/VuEYUZnQArAFvE668wbF3Ct8Npse?=
 =?us-ascii?Q?wa6HLZeIzMOKEYRWXF5LnTrZ9MkhjoYtLdrZPbRi+pdolEh+Auqd7RjmtnZu?=
 =?us-ascii?Q?w54oUciUU+MB1giZWwLckNKo1LAAi0MAVfxBcZH3rDjNO7MTcrpPelt3Dbzk?=
 =?us-ascii?Q?DHtN0OL7pyhjVCkFTZAQA0tXex/W7mY/RNXG6Zw/4bDruEuWES3LzUHE99ah?=
 =?us-ascii?Q?et9I64CHEFSJarR6A02cSsJxsg+CaVQoYh5hx4XZQpxI3ogITH9XvmdLbz+W?=
 =?us-ascii?Q?3C1t7vueGHeog2b6qwIEaf2h6AzzSAPOwLA2qyT51CWqa3lmdQ1RdSglgu/h?=
 =?us-ascii?Q?Vir5bRztE+RQeNKafROY2i0K4+OazMe0oZlTJF35usVfxOwkDdHHvzaSglyn?=
 =?us-ascii?Q?xksOVSXLZavxcJSgIHAkTACzgK4DJC9iWVK1e/pf+0nNzZMGdldaJqA2jZ9/?=
 =?us-ascii?Q?tuuj8c+8h8KU25DCiWgP/PqLU16IoeBIGjNim84IJjBZ6hJKT3F/8mu396ql?=
 =?us-ascii?Q?wTKQxVtWNWEVjgoegajmQ8ogCo/vIvY+08i9TqX6Qt5ZVY/hCVKC7+PzYF9T?=
 =?us-ascii?Q?r5oi8WpyKanmI4eLngnm4B8BfH6soK0y2qW5pCNm3/bq8O6lMNXPoOywgHAy?=
 =?us-ascii?Q?auR9JQYvdIdHh/IkvjbnCloiVWMktNsfKZgdxqFRCj/2hYxFSfk4bra/ykES?=
 =?us-ascii?Q?l8cLUvCinoGAtQ890wTeRmkaP1ZpghSHGfoKQPobVU8r46epBdYuhsIjAjIE?=
 =?us-ascii?Q?5g7AbjUMSHeETQpf0hP4dJVfP9ATRpSJtckZZHQ1miU577vWQ3D4LMSrCOTq?=
 =?us-ascii?Q?yDaDHkF0Yj0+0RwY7vC6pPzYDc8KAAOf4FBSWF9wFGhm7xz3FwfNdrg4MLKo?=
 =?us-ascii?Q?yCT3diMcrEk6ErsMs6viZDSupN/aWNtzxs4iwDtgyIQ4EfpnnFIW4Z0300HY?=
 =?us-ascii?Q?EUXq8F0zhr1g7sQ3o6Iw9A6xFsGB/DCZ8jao/6j4YsOhJAa9lLMqxjOz1kZW?=
 =?us-ascii?Q?zOmfdJx9r5IukAah3F0PjEvJgf4eODaccs1h+XAQPZFW+SlQkW54EpSt5F8D?=
 =?us-ascii?Q?RuSpTXiUSkIguURQzqs6L296fXjuQKleXJM0NKZ+HpvjZ+bouRMQRj2PKzGk?=
 =?us-ascii?Q?6sZNDF9wIZyjyikmxk0Fr2JSF2Cwl4yL5TfgGvJ+VNiEFU1BtSiS4aJz40uy?=
 =?us-ascii?Q?/3PFHZd+AA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fd94642-7165-4ed1-b749-08df3b2d480b
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 11:09:37.9575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tf/rfe/P3s3qDBwinNk+ju5cHcgr4omDmWjAZL/bj4LKdLri3gnNXFWe57Ycp4i2TAqE6pHbn07QuCEbtxz9xTr9FXcluHFnhPD1W5zLnG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 11:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249530
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
