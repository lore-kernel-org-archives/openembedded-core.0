Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4892.1795177734421280889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 04:28:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=1Uza9RVV;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.29, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R0t+11GmZ2lVeH7sU/jwggxTabonpwoxTWO+LYj8Kn7vaNKoEGsIiWwxaE8BbHQD7SUn8pfab05Zwz8zA67dCn0rZMQra6rbORUXrdEn4FT6+JP/vjGSXfGJelmKBjm4fHYsCo1IFVUCN1TGLX4KV4HITdhR+bfUHCTMHZCZVHJy+LMEAl0N+t17Xtu9wLTkV8DVS6LJWot6RI9Wj4A6wssNrFgEt0hdRU+5lpmurDZtbSxvdaTDz0q7u4sf8zbQrt6tHwcojur9n6KVyFukrn5yaz87RCeAnAMqVbXjO4pRRZ6ycm2UTySKtUeXUbcnQ4A7GoqtTAAAjCQCXgYowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6YWQZ0BqyqN6s9zcDIN3z/iCo0frTshm4M004/JcQw=;
 b=Bt7GucIRfNz5eo8SrqULPlxkpy+eR5pWuqI2vSgxxy/pTxMs9leZadgFTCa+JwnJ9HJTgp1NjQ4XFsBe6e1PRao3hrdFCpt36NEs37rCu22bdGjZM8fhrB7xe+IfYzJFFEm1Fd4xq34ENiOPn/zhUBKIzKa//EN7bhkN8do0kefvj58cKPdNaCGK2cEDiGOnmkV/ojaRszXWVUL41eCoEYWL+GbqoCxl1B51QVCFsBVabEPwmrpYGlUBFYiysKgfc9qhicZiqNUDZZzEeAVu/2r8FKNIIBRwHwsbvR+BKtD7LadqoEJxiFhMdS8ftL3IlsZTlpFjh1RRbTk7PLgdvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H6YWQZ0BqyqN6s9zcDIN3z/iCo0frTshm4M004/JcQw=;
 b=1Uza9RVVICAk4Ul9HWo0XEUSFmQ8+uTLRdKVpQR6kRYiw1e8vax5F3rW9gBsowliYE4BXJbUtr57cMdAnzb022HB/ZwgjIfQDfIjvZiDFyDCXAibKBj4GvFritwWM/q2ZyP7WgbGin/HMopvhDxQUYYR/+/cJPkvNjTnYSzcJgBn/+tRCbt/qy1PwnG4qqv4mYViXUm3PVn3TpY6AhMJU/ViWiB5g02+HonSQ7BtfaaM36W3pDJRYQwEC9OJ994ZBRhPeBMeFg64nAxP1yd8wqfX9MlmpIF4skTQX8IgHnJPPuPUlot37drghuPm92VLvsYDa0ju4sXJ3hgzJSBrrQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:148::9)
 by MAUP287MB6324.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:210::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 12:14:05 +0000
Received: from MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504]) by MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 ([fe80::ef09:5a67:49d7:9504%5]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 12:14:05 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][wrynose][PATCH] gettext: Fix falsely flagged static linking issue
Date: Fri, 20 Nov 2026 17:43:59 +0530
Message-ID: <20261120121359.11514-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0013.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26e::13) To MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:148::9)
Return-Path: UpStream_IP-SK@bmwtechworks.in
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAYP287MB3754:EE_|MAUP287MB6324:EE_
X-MS-Office365-Filtering-Correlation-Id: 141a2d8f-222d-4331-2931-08df46ffc547
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|366016|18002099003|6133799003|261009223027099003|55112099003|11063799006|56012099006|10067099003|261102123227099003|261026121527099003|261022075727099003|261021123027099003|261021121427099003|38350700014;
X-Microsoft-Antispam-Message-Info: C8sG8vxq7sP5TVtLyCFN0XF8lsrWvmhrPJIATHWpfIxBrAO8yq1mg0t8uMNytAtHaasuzOw9gu48cERt/jWy3pqb6aiyBbQH+YPlK6cUnnkmmZjVsJK9Mpbu7PFWnsbvLJVMTAypxzCiL4/gEzBsvz407Mdh9dPJq1QcdGe0pui/vvXx6jbY7QhAyu6KxAgFrdYKn280sesltrqiYLfi0O1qenFlZEXCdcaSEdFWMG7k0ahhp9TxJmp7zPttmfMrmNeEMXXIOPYOvm7F9z4bJzGYFTUhEyTDkkhhlMXo7fC8q8ax5zpwFyHB4rVOYlH5UGCiayYgLYKD5XnCVxopfMNq/tM1d7m4lR0xrppzsBDBzJfm94Q+WEYoRyWJoRTA9UIvU5JU9T3D2eBN/yjtPlXOo7alrWRCtmnrg8iX7kUxPZj4umpxVevk5vjh0K+ycog0J0CFH06viGKuf5U6feeZAv/+SfDO9VUD4blY33tsgLRlIcuiujetEHF0Qp13/XzTpvs/8PYGkHtFhWh8h62Z+nhTQ7qkGcEQOSB/Ky4KmEeNZAP2DdbJcKuxKIgj7/YHJHyRgJkearRqOSbuKHAbqFFeR8WaOayyZ94wK0vqeqlneLgpl2JPtpxIpmaTACPBGGi49lsD6niqHcqYYyhOYfDGUFVfvpa++n+Ggojd0eOB3vQdeaQSe84IF+iDar+pNcINinHZ9FsrmNJ5Qw48gCaSQc0F5Ps0sTcgGr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAYP287MB3754.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(366016)(18002099003)(6133799003)(261009223027099003)(55112099003)(11063799006)(56012099006)(10067099003)(261102123227099003)(261026121527099003)(261022075727099003)(261021123027099003)(261021121427099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?epoFsXNAahpSQSxeNmNsUK03z6/C9xL2HDyJzAY9i4Hls4e2rHnewzQVSPdf?=
 =?us-ascii?Q?H4c3Bi4HdViOYn4C1xxlzPcVrMw5YHJXvzmEa9ffAAAI1tZ2WVk+4qwECXCL?=
 =?us-ascii?Q?ZLQTDKyK5Edy1KxgQnqHc8Q6YVFd/mTJCOu/eiXr0C2OEtumnlNC5r6Kq6fK?=
 =?us-ascii?Q?OjX2/ZjrbdMNQ6tL7aySUYzsUFdvxbJoMUvO6V5VWCHXn51vuqH2t4P11S65?=
 =?us-ascii?Q?RcgXF5zWVlX2Jy2B+UwjsuBkxn+Mqt4IN2/wG3pwF2eRwrtoBeWSZ8B9PiOL?=
 =?us-ascii?Q?SVg0EkLnrYvK+/m4t78sWCXDPCCfCP1+d9muSoMYOGj/Nyt4bq4NeF0Jm0tH?=
 =?us-ascii?Q?+UmvNqp8i7teB7/sJkUaM3mqUW9ZTcCFcnNhcYhSBgW24auyexj/gFVROgVK?=
 =?us-ascii?Q?6t69/2qVxmrrFLZXBbiXW9BKWtpkkAB5SV1ZI66cRDjBsH64JZgcMtaFbmbO?=
 =?us-ascii?Q?q6be2IEx0J9i/UUfXEdPAdiGwEcGvmZ90EHfjNWY5Ckv57nXwRKgR6YD0rk1?=
 =?us-ascii?Q?QmC5hs0P4WM/bXgjGSJVfcFIRoZ9xl0IFmsvwLyHburqdkuX+5aJvl24OZvu?=
 =?us-ascii?Q?CQtQ6lnpdxWJ9RLhYI6LyFuY+2BI0IPa+gQUpceqaXvPEa5VzCJi6VVFiZF6?=
 =?us-ascii?Q?20ICIdRWjUr6XJjvmbbgBc5gorvSwhbJVEB3yiBLJSxcFYgAVNjXTlciWul6?=
 =?us-ascii?Q?CqSyRd7viiHkGqliG8nnucRUYxM3ON4xBtbm2jw5cG0WwpJvJFLhu/hFH2l7?=
 =?us-ascii?Q?cpWfdHaPHpTDBCz1h9K1mTxkVFIdfieS2JqlSgaMlQeFgD+dxZgNiOg/ZY6u?=
 =?us-ascii?Q?3RViA0io84IIZ2+h1sc/fYU+rJRIYDP7uH73DkSv0M/RGLgwqRupG4q0N56U?=
 =?us-ascii?Q?hIJWp1gJm8F3SVDSxWrNEa80UYB2eHx0fu+J9jgPX894UqX0I3BKy9Ti66VQ?=
 =?us-ascii?Q?U7nW6WrT+lxVFOxXa3BTeBMc4vaYGmZb00gs9YHS+mD+VmLrx+bN4WjeCvZo?=
 =?us-ascii?Q?4PKIiZh5W3QU2gyqkVSg9aiG6Mc6I/14ZOXNJKTJd2n65AnoY2PSyuGtPsS9?=
 =?us-ascii?Q?BHQ8mn5xWi/9AtGLS/nkdcaCUcp89GJPXbcHdUdFCD3hSO9Bik4EfRrtVS5Q?=
 =?us-ascii?Q?452n4HdfZq+xhlQMTnqAySrf3QxUKCXVABvYk5NNkmn7NRqG5LNphGPYJKGQ?=
 =?us-ascii?Q?Cue59CIeKT6J07V1xx8BqiHFuG4za87bVpj/gXrE3CbMibC2DcE/1XPoM6m0?=
 =?us-ascii?Q?+/QP1Wcgr06BqtjpJ3kO5NG+ua5l4HLte3RpmXVY1jWzZ0tcUmUgBRPZfQmU?=
 =?us-ascii?Q?MO74Gw+vHC4KcY15IEDJqt02Fe+Dk6VYTQmMrmky3aQWzgK3IJsa8NtCl+iG?=
 =?us-ascii?Q?1gbzynOdZW9YU8gihPZ/mTCTikBkKm4mmRcyO3Sgn2X5oNiufyjmBdzA6OM1?=
 =?us-ascii?Q?Vp5G3KZkN6eAj+5O69l/reprw5YJtgThmrRK4WDdZEGVFkiIm4/GB7WTlCAd?=
 =?us-ascii?Q?x/yyAxltNfPnLX7OuJBjPPBGD3/zclG5mH/rTTkPhcSkRiw6FiJzK7+H/3Pu?=
 =?us-ascii?Q?dRw6amiXxwnRE2u5V8HkmvemuKOHI0NE96snuu1s3L1r3qi1mLeJbabn3hfn?=
 =?us-ascii?Q?k6XLQjMeAAtOABzhuDbAxANfbstfXXdmybMMhycmNIeN+RTgQ7fJKmh1JfQF?=
 =?us-ascii?Q?NPmt6eEjTp6T3OQuE51Z1pK4/TwsRd3H6/NFyCCNdOXMzvoxLq0BcDIptVNR?=
 =?us-ascii?Q?NufHYrFHUeTfA/pXxM6nuoDNmYCaJm8=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 141a2d8f-222d-4331-2931-08df46ffc547
X-MS-Exchange-CrossTenant-AuthSource: MAYP287MB3754.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 12:14:05.1009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37j1CgqCbHCl3env+ZB2oVu7fieM8XChQWTC8f/92BQtDyUpiEN4V12zuGGQc1JalaRc5SSmvchgH/HjlKPB22Ku8uvDS2qviJ7vFiOc178=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB6324
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250813
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

123:checking if x86_64-oe-linux-gcc  -m64 -march=3Dx86-64-v3 -fstack-protec=
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
 meta/recipes-core/gettext/gettext_1.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_1.0.bb b/meta/recipes-core/g=
ettext/gettext_1.0.bb
index e20ad8807d..11b6a26452 100644
--- a/meta/recipes-core/gettext/gettext_1.0.bb
+++ b/meta/recipes-core/gettext/gettext_1.0.bb
@@ -67,6 +67,16 @@ PACKAGECONFIG[libunistring] =3D "--with-libunistring-pre=
fix=3D${STAGING_DIR_HOST},--
 PACKAGECONFIG[msgcat-curses] =3D "--with-libncurses-prefix=3D${STAGING_DIR=
_HOST},--disable-curses,ncurses,"
 PACKAGECONFIG[selinux] =3D "--with-selinux,--without-selinux --disable-acl=
,attr libselinux"
=20
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

