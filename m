Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.71])
 by mx.groups.io with SMTP id smtpd.web11.4059.1609315665695703239
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 00:07:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=k8rdb4PT;
 spf=pass (domain: windriver.com, ip: 40.107.94.71, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h32BZqSwT9Urr55pNWRkhVIM5zvgawpwEGwhsaLr5x4Aoc12qhgkqBsBT0LJ8bLb7DJDn6oMxDgJ/jYYR61fnQ5SbONFebXYXuR52FetBNYuotlTGqhYycBoxbhu6rxjGIKd0UCMAS7XMVDDbLSuke37kGL+kxPtoM3A1fDQzXhw0wYkd7Vwz0tEFwUlZNP03ABioW1aoWR2wQUuiPNxN81F2UQo7vgntR46SPY2tL4Efnney95NYsHKQchR3NCz3TIuBNyz7fBd8xjDBFzATsOJR3PJthYIHfdGjh1NRFdGeBN0tECVD+CvZ3Qs3ExGtBYwKlklrU6fYCbXJxahrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP0YRax6EVjRwQrfwbHxHxzqkxwWTAmX/aLXTHr2Zcs=;
 b=leTLB82drVZNC+R/Jg+SZAgPdNDtJRWGHCqHtzNlmXbuNuR6ST9c8XtVWIvUOdblRxJOTAKf0uVpnVnJnJpGfwjWEDe3yeyt7wQ1CrkWrMbaR04znePcBhOmAjOeVsMYjCM/UKF9WHz5mSRg5GsHJ4JN/MpQSsCXdAsdMYM3g+nCmUH/3A247BjuZ5bczvFwQfCLjq76pXUiRBYRkEbHyiKmb1F9Na9voH6PJrz7fk64hXfwZsTImR/rzOz96hvkr70zlDo914AqxUtKWNk/XlUGj3X0iwAZI8LtYM+2F7x5DUjAFBR4aw5LX0mqWdjSDaVVYqMfz9lySlwt2Po0qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KP0YRax6EVjRwQrfwbHxHxzqkxwWTAmX/aLXTHr2Zcs=;
 b=k8rdb4PTzHLz2Q6T8Hz/jq/aSqfboNlyZNRZ5LsXMS0RZQoco+fRCsJYFImVLaRtzWZRX8/Cmsw7xCYLaK14Nlp8vNDXiMuDTC9BtxPJulY/3qX1DB+NdlsIPucWE5cFowJnPgCq3vGwb0Zd4sGjbgJWO8BI52ffqxgAQzM9iaA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2143.namprd11.prod.outlook.com (2603:10b6:301:4f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.31; Wed, 30 Dec
 2020 08:07:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.020; Wed, 30 Dec 2020
 08:07:43 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] dhcpcd: upgrade 9.3.4 -> 9.4.0
Date: Wed, 30 Dec 2020 16:07:32 +0800
Message-ID: <20201230080732.138025-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0013.apcprd03.prod.outlook.com
 (2603:1096:202::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0302CA0013.apcprd03.prod.outlook.com (2603:1096:202::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.12 via Frontend Transport; Wed, 30 Dec 2020 08:07:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06ad8f12-d41b-4830-6b4f-08d8ac99fc71
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2143:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB2143D14BB37876F76716793DF9D70@MWHPR1101MB2143.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:130;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z9a5p7dRzmLezfgntWtuTsUMW8z0kzu8FC0USzr1PjsqN707PP89tYAvyrSls4nPuQoLJNsaPgic1CgOi+zWZI8EUhyoFf4nAhAnjlygofdPHPrmLYtlHhxfFC7CTmprjkueUMNs1RnLYdG1W6aRpEhhmmAUGg5HErkqgWlj4x1BRkYYRziBq13Rji8w5o0hB+Pg9zNFiPzkg7P9lz6Cw1lT8kXH8perwMUZhhLUcDvHt8AG/21H1BBMtoVJg1maNPzeSWnSHIwDf8LBchxgUvlEWKEh2I+t2O43z46EW+yZTpyaE7R1SVS7m6jIS2i0Fm0G6zi1UV02ueq9bapmu7MjXEklWbzS55a/6RNPdM8/pPTYEC+ugay25Dk0FIl6kN6fuL0RSNliUfVV0d4nj0Zm3nW3AtRcbobYX/1EHvUsUXv5HbfuZY+nDcQAH31wtHdGNfLTal6Wg3hT8RS9BQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39840400004)(366004)(396003)(136003)(2906002)(316002)(36756003)(6486002)(6512007)(86362001)(6916009)(8676002)(66556008)(6666004)(956004)(2616005)(44832011)(66476007)(66946007)(186003)(5660300002)(1076003)(8936002)(52116002)(16526019)(45080400002)(83380400001)(26005)(6506007)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?jw9TF5FrohcHZqiqPeHsxs8YhTECxB+HW463dwTCoa+NjQ8rpuueg5FFng8y?=
 =?us-ascii?Q?ji8CDIyU1Lbh7zoBZJbtV8uILXLRjFjE8O6WpfREo6sEOviyG+J96DrIkCQg?=
 =?us-ascii?Q?7hCfRNzhoCoT2EN4qDRTOyycxwWxIIU2/JicYV+VkfkxckEg4LDXSzjuCGFc?=
 =?us-ascii?Q?YLpkH6yODltzMphMUoKx3Dt74LJUC0+HZXGjzHwYjaiLlRrcrNgAIAUTHrp6?=
 =?us-ascii?Q?zWvOoC+GgCuO9DmvWYbBKWM1djTH/UpAZWm9Si9S1q2F7v5uKTfDfu4wLKb0?=
 =?us-ascii?Q?dLD/LrQhCR8EhDPoF/PphotyVKbXFuyzydf/v+YfruMCz8ZS0dQCKkIzyQRu?=
 =?us-ascii?Q?+a8kB6hOVCDdMgsNnDJnZQQ3Qh8QZFFYdaRdAHT5ZQy5HCKdxoUy0qzGAe9k?=
 =?us-ascii?Q?kvT3zfrjTe9UeIe+DJ5go3wRB37q1pzM39d7UjkJwUOytMRkIcJQ2dNJfdA1?=
 =?us-ascii?Q?3PPgRmWAxNSZROA6R6RlugR8ButmQOgpB1A5vKUrL/rlA3i+D1X/bWGYMZsj?=
 =?us-ascii?Q?4gYfw/+/MZYOYevzXTNVboP1EPcIDHE8KdOp33LGhJNKmmz6qNi+C/7kV7RE?=
 =?us-ascii?Q?zWQ0vOb3s1hmOsTl+KkHw3ORlKG6VL+XjMI8cQN0jzaRHv8tqrKL0W3snZeJ?=
 =?us-ascii?Q?hIwFPPNmcsMNFNbITxUuPZNvTv4nW/zTPShhewxmKAPKzLuOMFgV7OonPQ2f?=
 =?us-ascii?Q?vjyRx5BPj0ndWdJCLBydgNId8HUiLRuBCF7cCEY53IkP+d6slP0IaFcSPu3Y?=
 =?us-ascii?Q?4jqTJ16P3zSxz2fjYsYog8vvrfoYuWsz9KsytB3wfSi6yJF/lMxzeWz7w1Un?=
 =?us-ascii?Q?hc9S65TiyD13tDcU4+CZJcbJPtBSP6UX6A2cok1dDdp5Nm7M3ZjbHYIY/Hqy?=
 =?us-ascii?Q?5PtowFpFXRUlMKAf6eqVX0Q2Evj7a6HKr+TdX36A5sggZZ7dzgWUmnBsWU17?=
 =?us-ascii?Q?OmC0xldV2dAwruMTqe04mRgIXXte4qS2rDEHQkZswR4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2020 08:07:43.7772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 06ad8f12-d41b-4830-6b4f-08d8ac99fc71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1v/lD8Act8JGjQPleAjftgsFZjbtfkI/3MKL1ubjB520CWEOPbpFcu7D/s07Wr3xfkYFTKviBGyzGOS/GO0dVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2143
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Drop backported patches:
  0001-Linux-Fix-privsep-build-by-including-sys-termios.h-f.patch
  0001-privsep-Fix-Linux-i386-for-SECCOMP-as-it-just-uses-s.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{dhcpcd_9.3.4.bb =3D> dhcpcd_9.4.0.bb}      |  4 +-
 ...p-build-by-including-sys-termios.h-f.patch | 29 ----------
 ...x-i386-for-SECCOMP-as-it-just-uses-s.patch | 57 -------------------
 3 files changed, 1 insertion(+), 89 deletions(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_9.3.4.bb =3D> dhcpcd_9.4.0=
.bb} (88%)
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-p=
rivsep-build-by-including-sys-termios.h-f.patch
 delete mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix=
-Linux-i386-for-SECCOMP-as-it-just-uses-s.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb b/meta/recipe=
s-connectivity/dhcpcd/dhcpcd_9.4.0.bb
similarity index 88%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
index 69a07760b4..56fcf5cc0b 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.3.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.0.bb
@@ -13,13 +13,11 @@ UPSTREAM_CHECK_URI =3D "https://roy.marples.name/downlo=
ads/dhcpcd/"
=20
 SRC_URI =3D "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz=
 \
            file://0001-remove-INCLUDEDIR-to-prevent-build-issues.patch \
-           file://0001-Linux-Fix-privsep-build-by-including-sys-termios.h-=
f.patch \
-           file://0001-privsep-Fix-Linux-i386-for-SECCOMP-as-it-just-uses-=
s.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
            "
=20
-SRC_URI[sha256sum] =3D "5c823a0b981b52e7e0fd3183ae220422d6fcc3aa511af31dcb=
1a7ee6cb0f1c39"
+SRC_URI[sha256sum] =3D "41a69297f380bf15ee8f94f73154f8c2bca7157a087c0d5aca=
8de000ba1d4513"
=20
 inherit pkgconfig autotools-brokensep systemd useradd
=20
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-privsep-=
build-by-including-sys-termios.h-f.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-Linux-Fix-privsep-build-by-including-sys-termios.h-f.patch
deleted file mode 100644
index 095e3eb409..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-Linux-Fix-privsep-build-b=
y-including-sys-termios.h-f.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e7c22336461ee345a5668eed6158e935cd4cdf1a Mon Sep 17 00:00:00 2001
-From: Mikhail Efremov <sem@altlinux.org>
-Date: Tue, 8 Dec 2020 16:15:28 +0000
-Subject: [PATCH] Linux: Fix privsep build by including sys/termios.h for a=
ll
- platforms
-
-Upstream-Status: Backport
-[https://roy.marples.name/cgit/dhcpcd.git/commit/?id=3De7c22336461ee345a56=
68eed6158e935cd4cdf1a]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/privsep-linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index e588ecd7..1fbe97fa 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -29,6 +29,7 @@
- #include <sys/ioctl.h>
- #include <sys/prctl.h>
- #include <sys/syscall.h>
-+#include <sys/termios.h>	/* For TCGETS */
-=20
- #include <linux/audit.h>
- #include <linux/filter.h>
---=20
-2.25.1
-
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix-Linux-=
i386-for-SECCOMP-as-it-just-uses-s.patch b/meta/recipes-connectivity/dhcpcd=
/files/0001-privsep-Fix-Linux-i386-for-SECCOMP-as-it-just-uses-s.patch
deleted file mode 100644
index b79d5f04ce..0000000000
--- a/meta/recipes-connectivity/dhcpcd/files/0001-privsep-Fix-Linux-i386-fo=
r-SECCOMP-as-it-just-uses-s.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 12cdb2be46e25e1ab99df18324b787ad8749dff7 Mon Sep 17 00:00:00 2001
-From: Roy Marples <roy@marples.name>
-Date: Sat, 12 Dec 2020 22:12:54 +0000
-Subject: [PATCH] privsep: Fix Linux i386 for SECCOMP as it just uses
- socketcall
-
-Rather than accept(2), recv(2), etc..... which is horrible!
-
-Thanks to Steve Hirsch <stevehirsch49@msn.com> for testing.
-
-Upstream-Status: Backport
-[https://roy.marples.name/cgit/dhcpcd.git/commit/?id=3D12cdb2be46e25e1ab99=
df18324b787ad8749dff7]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/privsep-linux.c | 18 ++++++++++++++++++
- 1 file changed, 18 insertions(+)
-
-diff --git a/src/privsep-linux.c b/src/privsep-linux.c
-index 050a30cf..d31d720d 100644
---- a/src/privsep-linux.c
-+++ b/src/privsep-linux.c
-@@ -34,6 +34,7 @@
-=20
- #include <linux/audit.h>
- #include <linux/filter.h>
-+#include <linux/net.h>
- #include <linux/seccomp.h>
- #include <linux/sockios.h>
-=20
-@@ -311,6 +312,23 @@ static struct sock_filter ps_seccomp_filter[] =3D {
- #ifdef __NR_sendto
- 	SECCOMP_ALLOW(__NR_sendto),
- #endif
-+#ifdef __NR_socketcall
-+	/* i386 needs this and demonstrates why SECCOMP
-+	 * is poor compared to OpenBSD pledge(2) and FreeBSD capsicum(4)
-+	 * as this is soooo tied to the kernel API which changes per arch
-+	 * and likely libc as well. */
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_ACCEPT),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_ACCEPT4),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_LISTEN),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_GETSOCKOPT),	/* overflow */
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECV),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECVFROM),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_RECVMSG),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SEND),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SENDMSG),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SENDTO),
-+	SECCOMP_ALLOW_ARG(__NR_socketcall, 0, SYS_SHUTDOWN),
-+#endif
- #ifdef __NR_shutdown
- 	SECCOMP_ALLOW(__NR_shutdown),
- #endif
---=20
-2.25.1
-
--=20
2.25.1

