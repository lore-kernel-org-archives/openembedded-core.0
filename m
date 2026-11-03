Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7214.1793698089554979957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ZgEiHxk1;
 spf=pass (domain: est.tech, ip: 52.101.83.28, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV+blVTNlA0UVEFxizGHuItJeVC/5ScXt8RzDodHhD8w/bT7r16HV0MEh6aA8qfmllfQHNhdJkWqwX3DwdNtO3gCI8deCkIKT7rHq6jiWkWCu2/V4vLEI8J8uqkDYHPsnwfAAK1tfkhN0Q+D5ZqFXKP4YGo2LPIm+l5WzE02XzLeyAF3DMQoigDf5hFUrx/2wO5VwcG9FIABSxhw1deQkPJ7xhfwIlb406eZexrrImedL5TVrAcX0tFVyZzA8u4V0yUsDHD+LdUnS2e2aCUAC67W2wciOuAExZXqx0iLB4lUk3M8IK/3iInR8Yltac5JWidZkmxlzv+Fb6qyNalF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AysYJpfTeRMLSq8K3bvjlPb4uFwZIwIveQuar7jeBN8=;
 b=zQ16cdlL0G1Gt66QsBnGlNS/g3KQ9uAaA+BfNmSIrHYwT8I6dBRoOyNIIw+J5trFocFKhIO5j0nCVj3jAJ937QQ5PKT+QiWl3wqo2RNiuTZYZq05GIwdvHM+Jw5U7UKOSEM7TIwgtI8xCehI+5EMbf9l8UdUUTCOgJwjLyL+0FrammcizoNxliC3ZwMMCiIibRoZzyOdPLJfosUWCKWJLS7189RkVB8FlkhsnVAcREPc3/g/JykF+sPvj9IA/XzN4Rgwrco8SzRHWlR+4GNm/I6/gguZx24awWQuA99hyMoKbKL+p4H3FpjmkLzPY3aqXABlAIsv47+twY9kTGY59Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AysYJpfTeRMLSq8K3bvjlPb4uFwZIwIveQuar7jeBN8=;
 b=ZgEiHxk1LMICPqP8HzrwXmyQhydTZ9CL4nXcMGNZSbJEYVlAvTXl88fpaYnvUGIGGdqK2xsaleW61t/fgsGuaCLpPjfU8annCQMryUpxrO3jpO1RspYCNqKtiTOCLwLq4wWM7w17BSSjjY4ocYlrd0s2dLzokuOmFgLsZM8w/X3tzblCX4aVOqps8YMlKSrkaRWN+ANxR4J3YmyujdPTzHL9GlLWSo1BYlgPOhr78e6DsOqQ3tVdVHzdqlETxz34af4sJvuP/pYvnLFyvxnWJgBilQYldQeQv3xGB1GapE8ew9qY68KHN757qdfR0sHZ7+IPZncWvBf9Sw6CtbdrJQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PAXP189MB1951.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:277::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 09:28:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:28:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] expat: upgrade 2.9.0 -> 2.10.0
Date: Tue,  3 Nov 2026 10:27:49 +0100
Message-ID: <20261103092800.39286-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-1-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4PR09CA0005.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PAXP189MB1951:EE_
X-MS-Office365-Filtering-Correlation-Id: 57eb3170-7af5-4549-68be-08df398cc2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|261102123227099003|11063799006|261022075727099003|56012099006|261028144727099003|261021121427099003|261021123027099003|261022115727099003|261022105027099003|261021135927099003|261009223027099003|261026121527099003|261026140227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: cg54XzQP+kU4mfOgIsoXgpKf4kcEC1KGuMjlucBEz/x7IO5eZFVTCiCwduTAK2Vklsn153OiBKrUP77CFixhqSQ8Yz07cJ5FN7GbkfhPRJcChAO8c0x7I+LW0ng675eouoj13HQgI8ad0W8n915N2K6onbyrsojpOtbe+7PnGm6MzNnkfxMvFRuyAAFWv1Z9HCsZxXKdldQfkJr5DJnk6wa40DVgaGdSC80SKuiTTS4a93SMfkSgJTg5YtDCGwriK7wTaMHWp4KwbFBBGbnYDPU2Q7EeFIRiqgyqzIn+GqEKqwNLh4k2//LoUXkMhFel4X+C/aM5CidU/vK14c/4V3POpB2f/1vSvwhsPDxR0V7xIbGaK3LI7ccXBWCgbBGhxZAURpJVd/ZQz7qyNEAJSh5O1hf1bqg2cmGsOCE9LkS7nMKxLCuMNw8+FmqrIzLREfgI7PuCZjNxK2DgM6JE11CRY1/gNRlq8dx3r2uTVwbzd3yFrg+Z30gOJ0bOg/BVPjQUzsiccNaBxQRI9E7f7L5hJXf4+Xa3FFQk4QeZeOKHsO5P2d9nxXjZfVHyyQEnZ1RlAw4xcA1MBxrir9ZMyOKxDsIQ0wm14oS7BO2LtQk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(261102123227099003)(11063799006)(261022075727099003)(56012099006)(261028144727099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022105027099003)(261021135927099003)(261009223027099003)(261026121527099003)(261026140227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WeZoAVVcrKkUtzU17BhNUX4X4hGFbrpRbjW3BKpRFEOBKGo492qofy931WIT?=
 =?us-ascii?Q?y8yRejpxem+P+gNrYc1yLfydDhB5/2yDP6AX2K6yR/z4gQF+hIUIfRM7qmfO?=
 =?us-ascii?Q?PNU6zq2NCqY1TPgl071uvyM8uaAIR0jgTo8bCUw4VhGDI/vBWI4/vnBPPlpC?=
 =?us-ascii?Q?T56YByKAub7Nc7T6tYFur2QPB/73q9bsHd7YWvVCp5djpTCk8sTysLrOasXq?=
 =?us-ascii?Q?02cJ/Sk1I8u7uJcDijc+9ssfNqnyIv/QgWBZNRr99LFRLei+Eqbe1AI3kpOI?=
 =?us-ascii?Q?2YFkgi1aguvhpBlBroYNE+Kf89uN1yMiPKxCsc/bJ+B8bDRnsQGDPnbH1RTt?=
 =?us-ascii?Q?vqrH/SVPVTTcFiUatWAzEgZTqRXkvvdv4KqGuK9NPp9EMLvyoYd9/dWzrrXo?=
 =?us-ascii?Q?lMeJnSA1AesCZKVUpKapFlxyT3cphYQTCfiLlUNxde/6cjBjQKsQM3k+RZHl?=
 =?us-ascii?Q?68+6UGEiPozgbWpoXPjFnH6bLzyA5G4exg3vJjoakK3+8Gk3ZCM+Ceev0Nwg?=
 =?us-ascii?Q?ffh/F9rcjChp24ffx3mkHFx8HvmFgTikD654WW8TD9sPDP2b6R/LZscIGB/F?=
 =?us-ascii?Q?dF0YCUqQe8p7pinLY4OIAdTEbsZCEksx4/8o0ZCexdDS0ayMbDVDjKZU/e2X?=
 =?us-ascii?Q?KK7n2Kx7OqguThpWOiK4gCimgzb9X9Pw+3C0SloCmbKKpDvdHmvilocctNM+?=
 =?us-ascii?Q?nVClPPX4KyiNA71jcr9wWLxwqJM9rT+/WypW5q4VCqTXpDW8YC8dFIro4jpP?=
 =?us-ascii?Q?ZJywCY0H5ivMZOka0+tqjKaYQDlct7SRHKmQ4JZ/JvVVS1yk51kRjVFXndjA?=
 =?us-ascii?Q?8kXJm1t8ve9QHTCHx7K/bCf+pdXknqKqPmT3XAif6VvClxQHwRBiVON2oiy8?=
 =?us-ascii?Q?uENt+deKyZpCi2eIqAFNuAU5KdoNzOStuyFq0LEIlVjoNP0zFpNWDvVG4azA?=
 =?us-ascii?Q?bysPw4KKF41jwslh/800blWtfc9kBbLfEN0sYk2uIx1dANUzc5hsoQttL0k4?=
 =?us-ascii?Q?g7aep8wgOnQcBW2/ymJ+aLuJH48wxhHgR9JfeXsMi3doZFn7hCTtDvcdgjaW?=
 =?us-ascii?Q?e9hJERP4QUk/6jTrI4axfz0MtSK2zBfmSaGs7pqGMrPlfaTbzWEpm/Y8zMBL?=
 =?us-ascii?Q?8e2Zsu9jJVFcaNbP3O031jkRxOShM0UYq80AZ/3O/RnV6Q9kXDVwFW51E9xg?=
 =?us-ascii?Q?yN+FLCjQijyeru1iOIsdsxb8x6RVBCrcEjpL2O+XxgjfBWDWtwm0NLylEviR?=
 =?us-ascii?Q?7FqZCtVlaMbL+ulO8YdLuYrYbPsV0uDiPJroabtZwGBedL4snQDo0dZ/WLWr?=
 =?us-ascii?Q?ANywWk29g7011IwaB+uaZVkKvwxoPb6yilFzDc0Rpc6UDdprB99Fwj1CmbGq?=
 =?us-ascii?Q?Fzpq/jlwzETSvaTaYtd5BmmzTl2bY8EnlHDSGiVCXXdaUIJQuZh3ol5M83Dl?=
 =?us-ascii?Q?KaDhx+EXvRQfXbdNTh2VFEhq1swKhp6CjR68H/UoaAaMZjSlfKuErB9YTL5m?=
 =?us-ascii?Q?HyTUq9UOar7hcVukrT2kwcEvwHI+UIOlsPrgtAckjQl6qGf3N9HlDns/fS6j?=
 =?us-ascii?Q?6oPLkl2/Z+mILGgULK9JMAgNYoR4E/tE0koZJvuwPWurmzvSus1txGmVr1vp?=
 =?us-ascii?Q?KM81KADBxbDOVNr/DU0BXNAz1ThbvE4MUBjh0aRgGjKIQepmf2NKH5M0fKei?=
 =?us-ascii?Q?Yk6dL2HtksHjxrHASZu0gI6aVSvjLMy2uM+G4WIWur4kZ/03lhdRXAHgMo4l?=
 =?us-ascii?Q?B+zO95Z4qg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 57eb3170-7af5-4549-68be-08df398cc2ba
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:28:03.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N2UV6ClrScQYq1l/tdyjKgbipInBYRQED1MTDWXfkdweJyjvp8RH6kjjWRylBJ2ux8XK7lHQqRhjbtGRRDCthuGQclV40Ep0YjS2ZmJ7RWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1951
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249254

Changes: https://github.com/libexpat/libexpat/blob/R_2_10_0/expat/Changes

Release 2.10.0 Mon November 2 2026
        Security fixes:
           #1431  CVE-2026-113351 -- Fix denial of service with use of
                    `XML_ParserReset`
  #1433 #1436 ..
  #1438 #1439 ..
           #1442  CVE-2026-115506 -- Detect billion laughs attacks quicker
                    and more of its variations. Related payload fuzzer at:
                      https://github.com/hannob/lololol
                    Please note that a layer of compression around XML can
                    significantly reduce the minimum attack payload size.
                    In case of backporting, please note pull request #1439
                    in particular.
           #1444  CVE-2026-117610 -- Fix initial non-final empty subparser
                    parse calls. Was segfaulting previously.
           #1450  CVE-2026-118370 -- Protect `attIndex` and `nPrefixes` in
                    function `storeAtts` from signed integer overflow

        Bug fixes:
           #1452  lib: Initialize `m_parsingStatus.finalBuffer` in `parserI=
nit`
                    to fix calling `XML_GetParsingStatus` right after
                    parser creation
     #1457 #1459  lib: Improve `XML_Parse` for `XML_CONTEXT_BYTES =3D=3D 0`
                    including NULL pointer arithmetic undefined behavior
                    and uninitialized variable access
           #1458  lib: Use C99 length modifiers for `ptrdiff_t` and `size_t=
`
                    to fix support for CHERI-RISC-V
           #1461  lib: Check `isCalledFromInsideHandler` first in `XML_Pars=
e`
           #1467  lib: Add missing check for a character handler reset

        Other changes:
           #1441  Autotools: Move `-lm` from LDFLAGS to LIBADD/LDADD
                    to better support compilation with `-Wl,--as-needed`
           #1412  CMake: Support repeated `find_package` calls
           #1413  lib: Address warning `XML_GE is not defined [-Werror=3Dun=
def]`
           #1415  lib: Stop delaying `callStoreEntityValue` error handling
           #1415  lib: Add missing call to `poolDiscard`
           #1437  lib: Add missing `NULL` check for `m_startDoctypeDeclHand=
ler`
           #1417  lib: Migrate `ENTITY.textLen` and `ENTITY.processed` from
                         `int` to `size_t`
           #1463  lib: Fix integer truncation in `XmlGetAttributes`/`getAtt=
s`
           #1420  lib: Some more `XML_Bool` to `bool` migration
     #1449 #1460  lib: Document the memory reuse black magic that function
                    `storeAtts` is doing
           #1453  lib: Document failure to reject bad redefinitions of
                    predefined entities
           #1432  tests: Replace `XML_SetHashSalt` with
                    `XML_SetHashSalt16Bytes`
     #1416 #1435  Version info bumped from 14:0:13 (libexpat*.so.1.13.0)
                    to 14:1:13 (libexpat*.so.1.13.1); see https://verbump.d=
e/
                    for what these numbers do

        Infrastructure:
           #1414  CI: Stop using about-to-be-removed image "macos-14"
     #1418 #1434  CI: Bump MinGW Clang from 23.1.2 to 23.1.4
           #1443  CI: Bump Fil-C from 0.686 to 0.687
           #1456  Drop a `lib/xcsinc.c` leftover

        Special thanks to:
            Alexander Bluhm
            Bart=C5=82omiej Dmitruk
            Berkay Eren =C3=9Cr=C3=BCn
            Brooks Davis
            brspoon
            Funda Wang
            Hanno B=C3=B6ck
            Matthew Fernandez
            Minkyung Park
            Mirko Swillus
            Pu Cheng
            Scott Moore
            Shani Yosef
            Xisco Fauli
                 and
            City of Munich Open Source Sabbatical
            echo.ai
            Siemens
            Striga
            VulnCheck

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-core/expat/{expat_2.9.0.bb =3D> expat_2.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.9.0.bb =3D> expat_2.10.0.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.9.0.bb b/meta/recipes-core/exp=
at/expat_2.10.0.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.9.0.bb
rename to meta/recipes-core/expat/expat_2.10.0.bb
index 9b33764839..5b252f6146 100644
--- a/meta/recipes-core/expat/expat_2.9.0.bb
+++ b/meta/recipes-core/expat/expat_2.10.0.bb
@@ -15,7 +15,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}=
/expat-${PV}.tar.xz  \
 GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX =3D "releases/tag/R_(?P<pver>.+)"
=20
-SRC_URI[sha256sum] =3D "1e6371862cc31999b368c3b89b49994f0677e1bab5f1b2b85a=
e3741f5d803051"
+SRC_URI[sha256sum] =3D "c624ba2998fc65df1163a49641ff3f9ab73138b11641d92c86=
bee0fb01b1bc7f"
=20
 EXTRA_OECMAKE:class-native +=3D "-DEXPAT_BUILD_DOCS=3DOFF"
=20
