Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0066.outbound.protection.outlook.com [104.47.40.66])
	by mail.openembedded.org (Postfix) with ESMTP id 48CAE71D9F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 19:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ht5mfZLYlx/j+f3Mreb4JqsaHKNGxekeZhxqvbFOKyM=;
	b=UpYnNkbqpQBqsrjIjP/TNCGVduxPxfQoJdYzQrjk07fiH4Y3vnR9Ls1+kDEncBQ3deoLvnRQC1Cx2lmXoGAdRqCxt+YlctUPz3YB+elC9M0IipB+Ou84CQcNPIoXmZ+Np2gTPyVfMjP/y4PNtENe9GmTvyr6K51i7zt1EEVNpBI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13) with Microsoft SMTP
	Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Thu, 6 Apr 2017 19:50:15 +0000
From: Martin Kelly <martin@xevo.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Apr 2017 12:54:45 -0700
Message-ID: <1491508485-2813-1-git-send-email-martin@xevo.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR18CA0016.namprd18.prod.outlook.com (10.173.238.154) To
	CY4PR01MB2679.prod.exchangelabs.com (10.172.135.13)
X-MS-Office365-Filtering-Correlation-Id: 7741e824-322b-47fe-ca25-08d47d262546
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	3:0G4vkCM6cckbBsfT9X0i0BWKawKraLgRx+4C4v8OIBNeBT/MCBuDLttUxwkzpz0WtXKqJPbow/e3PDhBFAahnhtbmhadbN8gfpS5kicGzcfjaj8VV5AY5gdn9kKFelBWlG911kAzJOEk9EFZK3KdKFQodK0U0/DGxgsVg0Z1JKN6QY9jvn77u/wSvriVco4Ct7xpogzNUZgQoCAYxJuH6CQ5sNJ9McQ0MHiF+I6xrH71euDKq9lYTBeSv/aM3B6gakdcPV1BzGiUktvXuwM5yyZNNnombKdBd6b8M+Z9tBvveSgN/IvkAT5rOvT/kKmJ2vskqTuF+JJXK8EmbODp4A==;
	25:e8M7N7pmg3XIJ3tGv9R5mJgEewah4dcqH+mVSknq/Ua269RX2sJ1gzFaGxwwF3Cp1F6j0xPA4iaAbl8ZPKjy0YiXUhMR7hRxkRJPdCjPe0l7fjHIT9MLYR6cqTryVCk1jMRQuBZCG38pDco5ntgziRJsXB6lUiEkDK6tmzItlMh/Y9bzxDWf7WeLbkVlnl5rXKAmacFkiZ6579q9m1MsisTKVLSPHngWdUIsPDQURpL2SaoAR1qpA5tsnpO0RjQWHeMOVkwOUSIx60AHA9Mcpqqc/ThDVkyKC6dVQbYFEHGU+W0F2BRheWh10H6SdjMkE2fiGykMqF1jEuczZr06JxJPBTx+1BG1NAkrvJtgriYuf3oxyWFKe6+NYRuJ39J3EQvRy4r8wu22clNLANPyzwlYTZCSR95Ep+DyD2BXrvKTssxGCnCbh88l3KYjZByF
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	31:+ydNGiZSVVt9KDt05oKYQLprM3g5f0nB/GisL8P/pP7IHoPayqRhr0uc+6rkhRkVi5w7m0Oe1lEFZb4e61G0bkCnsAIfQWmvL7t9US1nFVFRgjyOCcYlKdlrkKqtZpt1pQgzljkhsMO2/SojIatS7Im3m7bkAC6Tf6/6DyKehKG2i4XuCP6Hk0AgysksAUBeLKZGHlHVrt8NYRpaJqWfqGMiNekPhTdEW5D/qw/WbfY5yWOw/WlbDNA4hrib14TO;
	20:fdAnnjCV89/7w7YGJBK6KEtz4t29PqRdpTS+w4fmH8GYqRjIGdSqaLVWvbL+9bx20V6YNj9QP481LeCPDeIiH2I0Ujt19xARD2EeIcwJkOVHmTy+UHs2ohV6+/AZPV2FJwZkR2EVO25ZABs7f1lDbXk6VVH7gnzRpgrC/zsWcShD1MBcInxQHzsuRR7WqmTPtRf2R6VBZzYk6C5Aj9CcX+vspXIYvncujYMpRaYEjgrti+lH2OKD3+YwlYPesXLZ+ih2iRBFtrCRQaz3PGVi+INcC5CgswU4Gy35uHPqsWhHOu6+EZo+CSP10MrtAxhn7/MEQNfndBDZ19DpXQ4EIA==
X-Microsoft-Antispam-PRVS: <CY4PR01MB2679F8CE7D5925F346848EA5AB0D0@CY4PR01MB2679.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(6041248)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(20161123564025)(20161123555025)(6072148);
	SRVR:CY4PR01MB2679; BCL:0; PCL:0; RULEID:; SRVR:CY4PR01MB2679; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	4:LD27+7JTKItl6fDlbbKpWfi+5eo/STWxN4msT0+N2CfCYM8gXKgmFr8nQEfDa86bcstRgE9hts8PTCaOQJtU1s6i4JcUCJd27+nGBUcuJbef9rEUJAWKv+SccyUq5b5o59O+01itts5qttRc1Fn0FM+Q0ipmkCBvRdXBSuAhFbCAFI1qcFp6VEuEvxqflLQskiCcLJ+Xie8TONx3N3GWfSLVrOXL7g3ByDhE9vLEJwuln3V+7djODaOVO88KvDaqfwGtzekeQci4g/9K3i/QqmsTpzlUqSHiuKI+q7gngPK7/fmDuuIo9gtxEkDkyOCZOrrFoq2dSS2tqzn2DqQC4vXwagOJ9oBV0oussznJdMTBiMQO5a0gd/I6C/Bp+ODMV7LRH71S3NP4r1DHCWH/6yAzwbsZrXeZa/eA7YEKNo56EBwqlGiMl8bRcWAkkpFJ7jI2sYPjDesWXmy7zs5rlbvI3pWULIbo5lm3tisQ0udJDfxe4EqreRKs18mM+HHz6uDx+bXYRYdMYW7rD10wgPQTZpIBb9ex9uDrcZ0mkgzA6sa2Rlep3B+mcluvofbcuQBOgT9Io4GiIAr+pgEQmSdOQM8jP5tUEoHtzS64Byadv3VjCj2+4BoyLKbjclJcq3LVXmfhFZ/Y0qPdh+fsaaPK6oSjXUYdWLAay3nC6DzFEbivCPYs7oC2kJNNUhNhfZTcavqMgKndFhZfU0Jm9g==
X-Forefront-PRVS: 02698DF457
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39410400002)(39400400002)(39830400002)(39450400003)(2351001)(50226002)(6512007)(81166006)(33646002)(8676002)(47776003)(42186005)(50986999)(3846002)(66066001)(53936002)(5660300001)(50466002)(6116002)(189998001)(38730400002)(6666003)(53416004)(6916009)(7736002)(4326008)(305945005)(2906002)(110136004)(107886003)(6486002)(5003940100001)(6506006)(575784001)(25786009)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR01MB2679;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR01MB2679;
	23:gXaXQe58F0dNwr7qBEbM0UdcjAhHa8DWs/3NA1nz7?=
	=?us-ascii?Q?OrZgKvOJ5Dgn6HKK0l+oWO4E6sRZ9ga3pwzFM7WtpnKfBhOpshQ5LWKrSgkb?=
	=?us-ascii?Q?nlXRyjSIBaXf3RDgD9xqpHmw/uIdgWYdLGI/A2N4M0YzZyN3hq5anmIQGgrz?=
	=?us-ascii?Q?rJHfnnOxE5JGnMdh7UW3rQiuTGCiWfCKYScAAYoawWnreF3lsLeUYV3w4bBa?=
	=?us-ascii?Q?oHwTBmc0Ws5EMCD95Kr1c5QD001K8YuiQEa465iMIOHZPZaOUJxIG2OZ2W1k?=
	=?us-ascii?Q?+zeUXtrnVQTQr43iii9oPK9WMDbtA4dEzbMrgu+/prtbQrcV4Ja39OZEXr7Z?=
	=?us-ascii?Q?QNc3+NKLgD22mDaPrEdTUTJPof/CqogPniGQAQdJnPiI6PIqTQAcSRtWaBn1?=
	=?us-ascii?Q?afDLQtM+ng+mKxaCL83Pt9906mGAN7JR+UxMsSK+7PrCXe1qlNOdeaRP/b1W?=
	=?us-ascii?Q?lP/MHNlIAxxReE2FtQ2cc6wpXfueWcoQmNEa0Iy+ws5vuWtSu4WQ3uEgDNey?=
	=?us-ascii?Q?cntXz78fyrlKV6TUBdNZu1LWiwIMEyinK12rGuKAOp18y/+N9RalB54pNUuq?=
	=?us-ascii?Q?Q6zefRb6bSiDGWMGKVZZnuKbBO4F2KYQXSziGw+M/WKA8ujNUlABw2XEh/N7?=
	=?us-ascii?Q?8MfhmqXz97oyomUNWktXLHz1yfZk0VQF5p11WrjkW01+2DDphRq5xv4bCTPW?=
	=?us-ascii?Q?eT2mMLdKE+GKTILG+8DS0/iaa+redSt89xdJ5V5MVswbn7LQOe+xEfW5rv41?=
	=?us-ascii?Q?DTDtK5Nlo21u4u5HT9oheqmYP1EkQi9ituUBtH8NMbC5XHX8UgaWKWqxhNGD?=
	=?us-ascii?Q?zMajmwsQSyjkFpbTVLe4IFGj690iy+TG9L9h9r92sWH9UfnjqrMid7RUL1Fs?=
	=?us-ascii?Q?/psyY1UEXwKoCF8xcP2Ezi5yG5b0IPyx1j3e8jjW3dLlEU0pxQ85xv+ZWIXx?=
	=?us-ascii?Q?NwzSeVaYpkvj9bRXtGoxXVvAQbH7Qu7wxtx93wf/Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	6:uKgcUY+SaSEQ/0/pzfdpZ0l/K7UDrx/Ew3KPSI5+OYYGE3BeFy8V3keQCPpjexoqX3Ce3yE8LtjbARWuZnu5hwUpRc4Rih4a6bFeaWCU/Lx9sq1MK5E5Ahlj0DRBGBV0xA20Qv+9BUVkNuzp737ooO5shssO27Kl1HD6oD/NvJ0THfFp3rBQOaJHbkSaZF8tA4MafjJ8fjevSEq5x4iWaAkeG3kOw/BroLZgN0in0HI/u1aUN4glbJIcECwiECMHzmwhSPGF+ndegDJyVpG/9bS5Yp+lgZhUdL5gL/v12El6qCi3lFhkBMHOHBGNTIxNVjAMtAsYQ4DLRbkXwi0C+LtnIHv+cvzENXuaBEvqQ8ehf8GSdwnD9TIlVutiIQxgiMrsFJvndHp9wIBKsH92JA==;
	5:tMM1ply6a43HDaUc8BkK0/ZsIXWd5oxzhmd1o1hlxEfg9oH2NpFYd1R2TZO0w5rvQcY/CGixxuhKuIbVJw1Bc+XTHTfc5U/Gn/2ccqGzdn0AV2x5s8cjoL4oBbLykPMcmDBp4Rx+X3LIl6NyLxpQ6g==;
	24:qMiSU4DAlk4TzB8LebTejr9yutaGUgeJQKh6c+oxRre5sEVG605CuHL/ZwWaqPbCgKZR9JPndgtptmFp0leVz7uwoM4Bw90qZeDnQpG8lGs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR01MB2679;
	7:0L4L1v53b/5V/j6JkH9B/EUP0xwcPFzVT3ULbXiQejUS9SJ6ABWz98+ITxPTtGHgewxx/hIPOU6aUTPX16h6hWPsZfB0/G0IoXcM0NULs7Yv2Lxp02zCITYHVTs21Vzre/KMXJupzbbGs1HDY4PZmelrKTbLgX5hAUesSnYEHMFm9jYGHPvmlXL20uRkA5AK9Ww9ztOzgdGK191NnAOG+7ynyzDQ6ns0zfgREPcswhcNxeep3NSYBnqwaQHKXB6AlDXlPttAA8vQ8tYujfi/NkrPgllbNTVdkNIpV2A+FMzJKEiIi9mpFjLg9Mstocx6Exlcq4sxDasNTZGdosaJcw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2017 19:50:15.2587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR01MB2679
Subject: [meta-oe][PATCH] libsdl: enable X11 for nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Apr 2017 19:50:15 -0000
Content-Type: text/plain

From: Martin Kelly <mkelly@xevo.com>

Currently, the following situation fails:

- Build an SDK and image. Make the image support graphics but not X11.
- Extract SDK and copy image somewhere outside of the Yocto workspace. Do
  runqemu on the image.

This results in the error:
"Could not initialize SDL(No available video device) - exiting"

This error occurs because libSDL attempts to load libX11 for video devices. When
it fails, qemu also fails.

Note that the same runqemu command will work fine from within the Yocto
workspace environment because it will use the native libSDL -- which supports
X11 -- rather than the nativesdk libSDL. In addition, the command will work fine
as long as DISTRO_FEATURES includes x11, because then the nativesdk libSDL will
be compiled with X11 support.

Although the example above may seem a bit silly, this is actually a pretty bad
error because it breaks the ability to build an SDK and image on one machine and
run it on a different machine.

Fix the issue by building nativesdk-libsdl with X11 support -- even when
DISTRO_FEATURES does not include X11 -- as we already do for libsdl-native.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      | 3 ++-
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      | 1 +
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
index c802a6f..89d84ab 100644
--- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
+++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
@@ -43,8 +43,9 @@ EXTRA_OECONF = "--disable-static --enable-cdrom --enable-threads --enable-timers
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'alsa directfb pulseaudio x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
+# Without X11 support, qemu will fail because SDL cannot find video devices.
 PACKAGECONFIG_class-native = "x11"
-PACKAGECONFIG_class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG_class-nativesdk = "x11"
 
 PACKAGECONFIG[alsa] = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
index a38bdea..6d7e675 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.12.bb
@@ -31,6 +31,7 @@ inherit autotools pkgconfig distro_features_check
 # The libxau and others requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
 
 export PYTHON = "python3"
 
diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
index 6f4e444..b397923 100644
--- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
+++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
@@ -25,3 +25,4 @@ UNKNOWN_CONFIGURE_WHITELIST += "--enable-malloc0returnsnull --disable-malloc0ret
 
 REQUIRED_DISTRO_FEATURES ?= "x11"
 REQUIRED_DISTRO_FEATURES_class-native = ""
+REQUIRED_DISTRO_FEATURES_class-nativesdk = ""
-- 
2.1.4


