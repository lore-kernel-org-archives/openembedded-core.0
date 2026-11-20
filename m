Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4873.1795177630966099851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 04:27:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=C/EsZRSu;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.42, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBidbz0NnsEpAdUw3LYxTBUd5Mp87cCgzB3nbqXsYjmjh26ObtTewZ18X6PjgEAG8Ne2O883XW7MS+PUnaG4IzRQ0srNN3aX7p+ERnXh9kLLJvccJh1+vp3EIQ3s0gHgmtyuEgrnM92JHzn2fazd5Za3zMG87KyaLgr9zVjsfy/J//krMsjaJfuo5P6iwbovkQxF3oYLGWDKaI2r/6j0ohbNZb/STlg8oNyAYkXX/dajFR41kRDd6LHljuxQd8/Bbk/MfoivjI6l75vFaku3jAL3nhl0w8JExcgQme4ad6Sz9VMMrmnjpkeEHCR0lU3gTnTMmgKMQo0Y2rtldvJazw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRP5xSnGVZLSRLhOuxrl1kmHAO0Df6hAhZn3i2YNK7k=;
 b=Ijr5nbPe+BJmUM5R6BaPzgekbhM4hhSwXbUvInQp/rOprGr/xcFYWl1xwBMgskU3DdhSR5mkooEXzPKio+3Tu2wyytTHYUuYNd21tl/ZtdPyUZ/qqeu05NRi6KiyeyqvFi9gaEJM58p+7YdA+jiQB/odRpbbl/dco4A/4EJnMUKMqi7ce/Hbu7X3EvhBhYMn7uIMuh/ixzCO+4brWjBo2ont0Qp4KNE2/+IaiZcceB+VRFR5nmz/DmfiiCCFRHZWbNqoKgivMafSbpzGGngvj9L9e+P3A9ZQtTlVqXPmr+Povp+9+h876KHLfwcnJh4tEFV3XdbU7tY62dyK0rDN5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRP5xSnGVZLSRLhOuxrl1kmHAO0Df6hAhZn3i2YNK7k=;
 b=C/EsZRSukVEE9NFk3u+rmle8qe42pfKYgqozATzbbXtE5PwCComNwpHl5uKU4kS2UIANuFpEnYWjG50g2xRAY+rFGaVP+AlE2mLQTSJEnU4EPf/HJUGaVEtZoE30FsGc6s+WLdqpzIbNBW23CWx+pS0/6NdIwQVK3pL0DnB3EeBigFqUUfqCJFgotE2tcjhN1+0314bPM/1sIWf9tU5rgotwFj//Byja086aiJ9MIYX2mwKium9P3Q0j/4kNuRCGh5FyFvileAQZK7IKwV6LGA4jReZ+JSoGCUjjXXpWyGyoTNMr0D/Ksoy/Kkr7YpIp3TyEWhqPbaJ/x92i7FkRmQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by MAUP287MB6324.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:12:46 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:12:46 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][master][PATCH] gettext: Fix falsely flagged static linking issue
Date: Fri, 20 Nov 2026 17:42:41 +0530
Message-ID: <20261120121241.11349-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4P287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:268::6) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
Return-Path: UpStream_IP-SK@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|MAUP287MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e17f36-c944-474f-1a6b-08df46ff967f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|18002099003|6133799003|261009223027099003|55112099003|11063799006|56012099006|10067099003|261102123227099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info: EXytBRIL99+xRsa+5P95tcqeC3+3dy9pDJcVlZm8EpusXiAZxyZ+6YBV3OLcSu3h/hQYeZyTS4SHK8wX7gf8BG3PirAKplgun4gUaD05g09a5XqWolxFfPZ8l5KYJNmHrvfgTYZYypNCBGaW+Qpgq5E5gh2vWcTpq3OICDnXVj9qnorRdaX1YJ9WYVzu4KIAeTcSPuwpHKnj5kSghRfbDWkSMNg8bSqyMkUYjYFhVyT/PAQtMM5w/cpBUiarzneD5xzq1b0U/aoDrlMjPQ/3JMRB8MW5cWuOcAny7O6groFi1yWgZDPnrrtjVKBVqQYEOs9AVQ3Gl21YnN9crIjY9TxIOu4LoIcaz2mtpJe4Jg7XkigzoQqXaKa4iLI8KTer9rBWWCQuzCgQ/lvrKdlumAnN4d+c6PwDNYAbXjbR2F+L+nUTzsPmqornpN6VsfYmONM4C5jyUGC3w+w9UqD9zgKhzdVbk5FM8YRK9qOu6W+PR+fdl3YfenEoZIb83uaIG84cc2JLxTEkg5awMg5ffTHZPcmJDZfi7J4xpCL2KodTYWufx+uLhZdbwa9xtlut4i3Xka+TnMLyo0fYp6RE0YCG8+LxEupCNsCbNjvFxijFqGPb8WgG+iPkAxNEScUImiNQBKyBG1BVkDVAXfmrlxp7Mb6OGYYDhPbgpDgoxfjo/zB+GrFAsnRitTkU/adJewuwEZbMieUqi8lLzCV77gKIc9Yk1ZJ265hzy8ph0Q8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(55112099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CS+bpjFXjZLKpTklOMBBU0WaiyAi/ImQuc66PZzXQjmLXdvz4Ph/DSPV/YdS?=
 =?us-ascii?Q?0/woWrsVxpLWbh0xo7s6ham7AkCbQkgJK7FWAlgUugx5X2Ox7QsK/4A4Qkti?=
 =?us-ascii?Q?mWMG3kaiQOnSTU+PFkEWbjTTAXaz5Zr3HqHZT7oZlA1ruli6kW90bc1cGJCs?=
 =?us-ascii?Q?TvaJhS3ssp3F/dAKrGJ92PZrRYN2p/VNsyuwZpjFztf1/zTO9gElBAm59m7P?=
 =?us-ascii?Q?4uu3Y8B9QKSgmfxbQPtOi+eUeHEd29PkrYl6uKYdhS+AmW1Wm3W+pqlmK6ru?=
 =?us-ascii?Q?bJWQLHYL1Da6woKwy+/szn7MDxAHLen1xlBPhlYbFFF8N/KQ+9eF7Yxzi7Xe?=
 =?us-ascii?Q?8SKxuL30TsNLFRoIDVQpasDXVGEHrzH+6/NGqnXPGyomtYN+wfcO+yIye6ju?=
 =?us-ascii?Q?l8aO3Y0G4lnlzwBUKJg10FxT1cbLOP1IkaagOibxqfTTC7uZFALllqv6HmSS?=
 =?us-ascii?Q?Zf1Qmr66jtjM/IUfv94Ul8hZ1G99sjP/+/4ra/COw8dMjwaRMeRI1cl788gK?=
 =?us-ascii?Q?N2jmsblG7JBPVGx8xaMZR17Kgg6yIjzHiUs9uD66quTyGy38rR8mEOoU3n1T?=
 =?us-ascii?Q?FOAbWAr6naDiiN+hen+9INCLSHziczxkh1d8JaftNIRfgp01CWfPQjHACcqY?=
 =?us-ascii?Q?bzKDU1KFVTPBXcQYM19PSruCkxCNuj8jlz8QcyWoc7zh85k1M+8BK9CcZhMB?=
 =?us-ascii?Q?d0ZtbGDiXHEDmsu2KtzWwy+YZiHWgWSXXOORXtHZGecHrfUTsoaAhWbGyNAS?=
 =?us-ascii?Q?ZTIdWIxd4C/nWiEGR7vLf7nGaM3q6+TdfMM9I3UmgbwecbLiZupbHCJB6tuB?=
 =?us-ascii?Q?asUhwAB4MRTrsm6JIR9jBStQK2E3Eb9e4MT7R05UJPBMkvkj8MHtBGtL+5P2?=
 =?us-ascii?Q?Mf6OqqcdHA6ZdGmMloXBMYxOK2EvurB4rLepmYBOEmg2dcn0I1u5Hmb2vQrg?=
 =?us-ascii?Q?GzLirN426VVxa4WAPwrilesFdPC3AF0gaE4LIuuFpnpwjcZpJAguRO7g01QT?=
 =?us-ascii?Q?T1uZOarZs6aA3Hwyjujgefa6lv82ICIQcUQGMbO6ReDi5bwRrUlXzUPTNL5T?=
 =?us-ascii?Q?FgfSDWCHGainoRtzHKLm7Jdu6BIG1KJZnnupTBkU+lTqYqrh3rdRCC9Piah1?=
 =?us-ascii?Q?CjSWW/dRkCIv27NIeWOWY8KGQqqL/mbW44nlHLrL+ViO0I5ij9MGLSGh755N?=
 =?us-ascii?Q?lbM1fsSxFE3Zca0GCDYv9zJKnjJO/j5cJBZo8iSFoQowqcpoU8+Gz7OGFT2O?=
 =?us-ascii?Q?vuoBZVjuXARqomT4SjYp1sJhx/PKQ+l5JUFIxpxUQs9uZJbUS7udHvijWlCy?=
 =?us-ascii?Q?Z/FDhWJgvdBFXCa0KynkVzNuXuHOXuDr8lp9074JqrwuMjkTeGVU/7YoVnb4?=
 =?us-ascii?Q?N1cwMD2u4CZE0X6HM9DOZJiq4WUmSqc/MFaWQzUab/zx73uPkjgjYUGB7Vpq?=
 =?us-ascii?Q?b5qcPED9dRlFAOQ1U/EH6dzdjTrjKpcnMt1t9mjNolpz6gtxE+fyDf+ZOAN9?=
 =?us-ascii?Q?h6P15rFhuBz/tZv6aLKfbpek7lHUGmAAi2ifqH9Ad7fkv9URoy/x83Z2qj2D?=
 =?us-ascii?Q?SEg9DLyC4R7T4TccB+wg+ZyttcxrBBYcX13aMupp1PK6iwbkdIW6WS9n4ncy?=
 =?us-ascii?Q?jHUi32zzG1ClAdRKQw8MMZUpWXzBLASxW5PbKF4p8X9t3MDZ5T0vEbDO55Xa?=
 =?us-ascii?Q?SSy2qo35oBYXxdfcsP40iComtzw99mdEt6o9bPCJ/38b9B4hfpdfKG/W99Xv?=
 =?us-ascii?Q?xFoTAwi1ijIFcW8qrQ0G6udgUk0lvQo=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e17f36-c944-474f-1a6b-08df46ff967f
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:12:46.6538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLNnr5iK+RXwahXAOo+zharUiYKqPnoNzT8SuzauAWJ3eZ7kXHO+obm/smMo85Ih5SztQjPTf40Jv3q1XflFoje9GlK13JAaVf6P2GzPqYM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6324
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250812
Content-Type: text/plain; charset="utf-8"

From: Sana Kazi <Kazi.S@bmwtechworks.in>

autotools_do_configure in autotools.bbclass deletes the
shipped configure scripts and runs one recursive
autoreconf --install --force. --install --force runs
libtoolize --copy --force per libtool subproject,
re-copying the lt*.m4 files with new timestamps.
The aclocal.m4 of gettext-runtime/intl is not refreshed
afterwards (gettext misconfiguration), so make considers
intl out of date and regenerates/reconfigures it in do_compile.
when make runs it sees the files with old timestamp and runs
config.status --recheck which is why we get false positive.

$ rg -n 'config.status --recheck|static flag -static works' tmp/work/x86-64=
-v3-oe-linux/gettext/1.0/temp/log.do_compile
124:checking if x86_64-oe-linux-gcc  -m64 -march=3Dx86-64-v3 -fstack-protec=
tor-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3D=
format-security --sysroot=3D/home/sana/bsys/upstream/yocto/build/tmp/work/x=
86-64-v3-oe-linux/gettext/1.0/recipe-sysroot static flag -static works... (=
cached) yes

touch <file> just updates a file's "last modified" time
to right now, so that when make runs it knows that those
files are not stale and need not run config.status --recheck
which throws the false positive

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-core/gettext/gettext_1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/g=
ettext/gettext_1.0.bb
index 8a93ce1b49..353eb46edd 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -70,6 +70,17 @@ PACKAGECONFIG[libunistring] =3D "--with-libunistring-pre=
fix=3D${STAGING_DIR_HOST},--
 PACKAGECONFIG[msgcat-curses] =3D "--with-libncurses-prefix=3D${STAGING_DIR=
_HOST},--disable-curses,ncurses,"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux --disable-acl=
,attr libselinux"
=20
+
+do_configure:append() {
+    touch "${S}/gettext-runtime/intl/aclocal.m4"
+    touch "${S}/gettext-runtime/intl/configure"
+    touch "${S}/gettext-runtime/intl/config.h.in"
+    touch "${S}/gettext-runtime/intl/Makefile.in"
+    touch "${B}/gettext-runtime/intl/config.status"
+    touch "${B}/gettext-runtime/intl/config.h"
+    touch "${B}/gettext-runtime/intl/Makefile"
+}
+
 do_install:append:libc-musl () {
 	rm -f ${D}${libdir}/charset.alias
 	rm -f ${D}${includedir}/libintl.h
--=20
2.43.0

