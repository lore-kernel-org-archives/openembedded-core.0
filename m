Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1156.1795710323678515132
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 08:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0WoSsnZp;
 spf=pass (domain: est.tech, ip: 52.101.70.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO65WWD/+2b+4HVmM9DcjeVahaIC504W00GJe8aMXRc2kH9bwplLsEUOt0Dz22+pdgFJeaFT/mfvP3jNNoBpzHoCim2P5skg+t4uNywfYWFgw5Md7cEDsHks4/xIknCP4lchhYQp1mRmMLkIvAbAzkVBWTFH30OsCV2407QquvoObXgAIZcF9smcoVRNsHQcBlf9vLeBW+vufbXXcUjMYQTKZ3iLNDqElHLkKQEaqRCZUxcPpQq8FXJb/nDlawWMvjiQ5t9CoNx4ESNuU7hf9dckIgux4VrPh+FTvtxYTsJuGoGqZebDV69hhrhaaBqCXHO6FTSI/HXq7pxkACGyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDoebAMcXvCWS4Ztf1H9IyKREQNgz2obNCn4jMHIuCg=;
 b=qnbkg7yTqq3tzpIL8kzkBl9buOb+wyfYq+NfxC7Ku7g+8l0b/eJGD8v+ePxLlMBpi7trqLBsd5YfiWMQ1wxySP+YrN7/fkaUIkn/ZKbgAtn6IIZdKsxmr+gduZsnu5EzhXwF8MEf5NuZcp4FPIMWhfLt5vNMSXNaZra4W7iriE9bPQ7GotYGZl4O1ww0CzMyw990rA1XaqxVSuSFT6xkfbR8a3uQYfFAyQgD5BJ6trehBLmip8IuL5teRUWpDMDKZVBD7Bcc2sf4D/XK01U7Eq4tXIIMa+IGyCUqOzSRbIkdELWk50/oGLr9cC65LAuxWf6lcODq57XSG9ytEooXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDoebAMcXvCWS4Ztf1H9IyKREQNgz2obNCn4jMHIuCg=;
 b=0WoSsnZp7VT7oBFttnhpJ/CrJJ14FZC9YHEDlfY2JzyPl+x1uJKJoAakoKPXmisRgBeouo0Q09Qae0/xphlv7nErNlRjdAZPYaBWBZADLbtUomQROBI8P5qpVczSBZHiR6f+psr06VJviMzEoRFYQxL744LuIkcS0FXfFkh4Wa1Ixk2Zi31rTPK/IjAeWPlk4dpthnSn35QtM7o1Uyjmhqcic+lB0phs2qLWKXNuyR1ka0XAH9Q0F0LnH+tL0oQfbTvBWUgbYboJ3DMnunA9oJKWq9Vxi6KNKAqezGQ+MFRDnNqklJP3xzeA/+p8Pv3CmixICiQMp8tYAXtIldpRdg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1834.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:330::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Thu, 26 Nov
 2026 16:25:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 16:25:22 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libpcap: upgrade 1.11.0 -> 1.11.1
Date: Thu, 26 Nov 2026 17:25:16 +0100
Message-ID: <20261126162516.93141-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261126162516.93141-1-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-2-jaipaul.cheernam@est.tech>
 <20261126162516.93141-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0174.eurprd04.prod.outlook.com
 (2603:10a6:10:2b0::29) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1834:EE_
X-MS-Office365-Filtering-Correlation-Id: d67ad8aa-c3fa-419d-15c4-08df4bd9de74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261026121527099003|4143699003|11063799006|261022075727099003|56012099006|261021123027099003|261021121427099003|261028144727099003|261102123227099003|10067099003|261102130727099003|261026140227099003|12006099003|22082099003|6133799003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: WN8OU8oRK60J+QFk0IzHcoUttbS/SIZ7iLacW279shFGw9b6I09FlS6ysWJNld6hxo5GsDVwlJZp6yVb9HP2GYfcf0FIOKD3jzTOS/oOt/WTURo5j4SmUjnh36N81FmsVN6J5lw2Zwi/ht+AV5fvKWpZ2RxanlJIBlJOHJp0x/D/WhZJvVhiThwjzF/yEVHKKKno8rm9lLzIlk8iThg3u6jJwxw+0aG/0MGTp5cfPcNzZAeJHXFkZYBcAi5rol816m7T5iuqRD9sca3p9Gpo6Gp0JlQ9aJPHDh3ebFgEPsKI5O3C30q/dvVdogkIh6YDpYgJX0rtyba9pcs41ENttZ9DnR6BAz4eZfjuOzDpU3CWwqA9usqdD1AceRXd1QaYO5ZFO2uxoiJvsdKGktht1sq4ggUjf3M26Zianko68aEAsrUVzwg0s0alJqfQeu3Myl3gWk/qHOhjegZKY6KfHXLm/U0QXV0RQBKUWuGGrJnFHWVzFFUX+Q7l8SkEFwQOkLR7M4m5cucJgng04aktvxKHUVtWtJKSvydwrR1sJMiKNsHbB88LshKCLY7CyIVJWcB4W1+OITKQIlmJYEBiLb7fk7rivPm8FmdIzqYPeqAxR0aSTAeEW6K5pHTOH46o
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261026121527099003)(4143699003)(11063799006)(261022075727099003)(56012099006)(261021123027099003)(261021121427099003)(261028144727099003)(261102123227099003)(10067099003)(261102130727099003)(261026140227099003)(12006099003)(22082099003)(6133799003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bmSyoMMspMsZnvuUiTFRa0oQUPFDNchPy7GGK7pHMVCxVe82FjdqCUeQfhTt?=
 =?us-ascii?Q?II/iVa2ZUaCQGjtcQTvNWdENYtX0+geNkPplP2EfY6CujfHiddMwol6qRRyJ?=
 =?us-ascii?Q?V+aQnyBaIhbL4K+P25mazXHVnpJXbLYKoignTfh2h3BouwWpYymn+1BypKEl?=
 =?us-ascii?Q?R3r0z2bApZmOcbc07YNsBCMYkqnHj3LQUQQukbLQI1beT/I7dBlMxokO3rsq?=
 =?us-ascii?Q?y7I/hRZqGJQ7FpQ8B6kBVtfKfGCcgJwfn6riWL/vUmiEAOEWRm/+bYXSQqRZ?=
 =?us-ascii?Q?Yaz+/zwnbnXuEbAo6At34UbOjG47TbxFwdtbmZ+9aIJLnkRswlYDmySIyI7b?=
 =?us-ascii?Q?aRPyZ1EHF8F0igHxCpI3iBDQRT4Z3obT0zG1QNtpNNjygSRpxmZgoh8+WMSh?=
 =?us-ascii?Q?jSb4x3brh5RnHIgSf4e7Q8WP3dANcu6OAPsES1xrpWXDTIs2wAOgeOJFR7I0?=
 =?us-ascii?Q?f39oJk3OQiyQzGEeCGoD8roQJXwiTqlwkQ6CD4gBqPILC6F2KOCwhMIPKesf?=
 =?us-ascii?Q?Q+GnPxtG0qObryfG3VcnGzGQ+gsMf6WYTkSn5kuN+QR/Zf6qwUgbx3TjLZfs?=
 =?us-ascii?Q?/+BGYhCp/6yCmP6fcadrGpnzieaRFti+GSK60sGyMealG8KiGcSWKC33bRyi?=
 =?us-ascii?Q?PjukYL2tUNlAj6RILTQcK7uXkrImEtWQAs+Xkhh3txQ+vHlTjUP3pCZ71GlT?=
 =?us-ascii?Q?FUi+ch07zRvT91EXiSrbpiiYhP1jifyyMvETSzhh04+DUj7zUVogHd1TiJ3L?=
 =?us-ascii?Q?g8lWuq9dFno0NrhsxJ42gj0HmtvfnfCsRCxlS6vsEQsQYwsU4vIz7nmlJWnR?=
 =?us-ascii?Q?6Fw33agotokxNU9qRxNou3uPDb/rG1Wsz5C+1mcpno8aPM6WKwcj6z99Edlg?=
 =?us-ascii?Q?kJPI6AkEJeWcuGHkonjF3QeMo6NaoOyfZtpRaZEEQ3mfE+80vEHOy7B59Gu+?=
 =?us-ascii?Q?ruKpJDHbZqLyrFprSqTuzmJDdLjxPHrFAZunOdmUTpeklBJLRJ8fppINzAXl?=
 =?us-ascii?Q?qHlK9/ntL3POB8w9nPLMDNv7D89jnbky87i+z9jw3VBQPRJ8AOi/SoAq4Dsz?=
 =?us-ascii?Q?pQ9UhLbSSmcxTgPivs+9ah/APwJFGZoDvynlYMXcgSYtIJZ13ktMfBU7xkC0?=
 =?us-ascii?Q?ioIH1e8BVC4GObxGmW/HEZkHNms2cR9qU+xz2tda1+dcSdbrWJ6pjVt1hUNO?=
 =?us-ascii?Q?34W/Ql8W0zbR8yCtyG5A/ie8Ya5Y9UoKYpgbmG8yEUJWdmoViwx51J9bq32s?=
 =?us-ascii?Q?Gk8GOuteedVjDfDgPaVi/nI98E8h/X4ibA4NDL9a+BQmr9bylIhoFZa3V6c5?=
 =?us-ascii?Q?1MT1FmwahVsGeYXc/InNbJFblKip5hRQgdev2YBCxhbF7datu05z8dGV3f9o?=
 =?us-ascii?Q?iA2tqwZfnD8Figl4NdeCqKT9Cv09iJ6MdfWCOyiF2RdjsZHpeKy0hBjZ4mvK?=
 =?us-ascii?Q?yB1rC40zJOi7pSvSpp6VP9VWK7NvMp9RtlmYIe4s7ndlDYMcHcRpxVH2pV2q?=
 =?us-ascii?Q?4RtogN4HCT3Dwxgw1RZVR9ehMDWCvMMjyZGE6qg+VzaHORH1/FX2d0GE8IiP?=
 =?us-ascii?Q?MZzSLKHBJZnlFk9rUoblPd7Onv8c/DB5kp7S/kNomknkj9ECQXnxwQJj1ugO?=
 =?us-ascii?Q?MJ5PEM+WxYloG3vXjImNwSI4BbkbH3PEHMlNFyE1pWPD9lSug9ssEUPM/sr1?=
 =?us-ascii?Q?BRJ8jDfA1B0atK4cV2S8VV2TcFKsYYLc3fNIdoVtnhhp9f871CMSMX/MifuS?=
 =?us-ascii?Q?98TAeiEMcg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d67ad8aa-c3fa-419d-15c4-08df4bd9de74
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 16:25:22.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zbcZ/R6upmZ9ZoeS5uEwQJifv8lz/fa4Q4unBgFtOUFc1uEQCLpRReiV9nViSwbFgsSlBsQT8H2AnqIkOsztu8adVO6na16h9arP3Y2Zy3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1834
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 16:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251320
Content-Type: text/plain; charset="utf-8"

Changes: [1]

Tuesday, November 24, 2026 / The Tcpdump Group
  Summary for 1.11.1 libpcap release
    Source code:
      Fix function names in two error messages.
      Have pcap_fileno() return -1 rather than PCAP_ERROR if the HANDLE
        is invalid, as the return value isn't a general error.
      Indicate no-capture and no-inject devices.
      Require libpcap [internal-only] config.h in [internal-only] pcap-int.=
h.
      Use more parentheses in BPF_STMT() and BPF_JUMP().
    General:
      Set all the file descriptors/HANDLEs to an invalid value in
        pcap_open_dead().
    Building and testing:
      At the build time require atexit(3) not to crash.
      Require config.h to be from the libpcap build.
      Test for <sysexits.h> instead of specific OSes.
      mkdep: Use mktemp(1) if it is available.
      mkdep: Propagate compiler errors.
      Enable out-of-tree invocation of autogen.sh.
      testprogs: Factor fcodetest out of filtertest.
      Avoid some compiler builtins in Clang < 9.0.0.
    Packet filtering:
      Fix validation of "/", "%", "<<" and ">>" 2nd operand.
      Fix a dangling register index in "proto[expr]".
      Fix a register index leak in "protochain".
      Fix the skipping of AH in "protochain".
    Haiku:
      Fix a compiler warning. (Issue #1738)
    rpcap:
      Properly check for a network error in one case. (Pull request
        #1793)
    Documentation:
      Note in pcap_fileno(3PCAP) and pcap_get_selectable_fd(3PCAP) that
        the descriptors returned by those routines must not be
        closed. (Issue #1722)
      Update a few OS-specific README files.
    Linux:
      Include sysfs rx_dropped in pcap_stat.ps_ifdrop (GH bug 1328).
    QNX:
      Fix DLT_PFSYNC definition on QNX 8.0.
    Link-layer types:
      Add LINKTYPE_ETW2/DLT_ETW2.

- Adapt ptest to "testprogs: Factor fcodetest out of filtertest." change [2=
]

ptest-summary:
INFO:  6580 tests skipped
INFO:     0 tests failed
INFO: 16043 tests passed: T min/avg/max =3D 0.001184/0.002512/0.022410s
INFO: Testing time =3D 42.74 seconds.
INFO: Executed test rate overall =3D 375.35 per second.

[1] https://github.com/the-tcpdump-group/libpcap/blob/libpcap-1.11.1/CHANGE=
S
[2] https://github.com/the-tcpdump-group/libpcap/commit/fd4ece414c8c

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-connectivity/libpcap/files/run-ptest            | 3 ++-
 .../libpcap/{libpcap_1.11.0.bb =3D> libpcap_1.11.1.bb}         | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.11.0.bb =3D> libpcap_1=
.11.1.bb} (92%)

diff --git a/meta/recipes-connectivity/libpcap/files/run-ptest b/meta/recip=
es-connectivity/libpcap/files/run-ptest
index d6c76f52a81..b788e0d25e8 100644
--- a/meta/recipes-connectivity/libpcap/files/run-ptest
+++ b/meta/recipes-connectivity/libpcap/files/run-ptest
@@ -5,8 +5,9 @@ cd "$(dirname "$0")/testprogs" || exit 1
 FILTERTEST_BIN=3D"./filtertest"
 TRANSLATETEST_BIN=3D"./translatetest"
 ENUMERATETEST_BIN=3D"./enumeratetest"
+FCODETEST_BIN=3D"./fcodetest"
 CONFIG_H=3D"../config.h"
-export FILTERTEST_BIN TRANSLATETEST_BIN ENUMERATETEST_BIN CONFIG_H
+export FILTERTEST_BIN TRANSLATETEST_BIN ENUMERATETEST_BIN FCODETEST_BIN CO=
NFIG_H
=20
 { ./TESTrun --passed --skipped 2>&1 || echo "FAIL: libpcap"; } | sed \
     -e '/^Passed tests:$/,/^$/ s/^    \([^ ][^ ]*\) *: .*/PASS: \1/' \
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb b/meta/rec=
ipes-connectivity/libpcap/libpcap_1.11.1.bb
similarity index 92%
rename from meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
index ef1ff0fff8d..ae5993f731b 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.11.0.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.11.1.bb
@@ -13,7 +13,7 @@ DEPENDS =3D "flex-native bison-native"
 SRC_URI =3D "https://www.tcpdump.org/release/${BP}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] =3D "9237f5bae9dcf3a91823d9963ec43b7c0e2e3374ef2ad57d92=
c8cd39530f4723"
+SRC_URI[sha256sum] =3D "ac3b1ee6c6b3a52f77d530b4b54d08f8adcb9929c2c47ac5bf=
d3db70e73df6da"
=20
 inherit autotools binconfig-disabled pkgconfig ptest
=20
@@ -40,7 +40,7 @@ do_configure:prepend () {
=20
 do_compile_ptest() {
     oe_runmake -C ${B}/testprogs CFLAGS=3D"${CFLAGS} ${LDFLAGS}" \
-        filtertest translatetest enumeratetest
+        filtertest translatetest enumeratetest fcodetest
 }
=20
 do_install_ptest() {
@@ -57,6 +57,7 @@ do_install_ptest() {
     install -m 0755 ${B}/testprogs/filtertest ${D}${PTEST_PATH}/testprogs/
     install -m 0755 ${B}/testprogs/translatetest ${D}${PTEST_PATH}/testpro=
gs/
     install -m 0755 ${B}/testprogs/enumeratetest ${D}${PTEST_PATH}/testpro=
gs/
+    install -m 0755 ${B}/testprogs/fcodetest ${D}${PTEST_PATH}/testprogs/
=20
     # Savefiles used by the filter tests (SAVEFILE_DIR is testprogs/../tes=
ts).
     cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
