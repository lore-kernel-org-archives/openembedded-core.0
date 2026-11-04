Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5253.1793783251569640712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 01:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=j6dscDRh;
 spf=pass (domain: est.tech, ip: 52.101.72.44, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwtAwi3ickwdNZe+ty2NA+szUoc504tUxbPFP0PZbfKBxRfsLY3CqTWuDfTYpTBo2tJIWI0QCWlQraBUuYL9w9x5KRX6Nqoj2N+JY14yOpl6gFiKJxHDCnWQDsXP1iKp67qa4P83r2Nav0e9gUoBAXAa3SdEBUaCfQcx1+1m3Io8A63qUfxLe/Q9trVjtFBZUsHR7Y8TBghnBuxDi8W4gQmvJZ6ZilTnxsDZLK4HVScS41MMEocuH6Ro60Tub5SGS/GiZt1A4UVoUSg5gJblZJ4zwc9z9V6UcVpCut14zNX6eYxtHrC6ancsPzSI7r/s8YbNvXBP0Qj5Nj5cLXCz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gS6ynKe1c9bf7F1RH8oKHpQa3nsmJoz/1T/+xuhdt9A=;
 b=M0raZ25WlIiU50jJTolO7pnnaNxFycRfMlExvNq+hdtA/Oh2GClQ/MM0htUID9yT6zJ82XM1V2cA/qg3n/HpXQ+hIVotnTWLlSj4+dUlHAWQGWNcQDEZ7DIcHwgBtX9DWXM4eg3F8QF38Y46TH2nnxbvQGZ+TZvyaHnemNs9V5VdHRCPWUX2+6jSlgYX0wMoi2x/d+16juK5Af/763bacb0qHWQLWA6gvUeZO7OSI20cz8OCmlpzjYWGSLJKy4NWnKwYEYwUEwTtDKmihwnZeYEG2FkJ+SYMjJJWvfJSmdTGYzzvL58jO+WSptRnGtVbIrKuCRtBcQ0fvmkrpVPtZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gS6ynKe1c9bf7F1RH8oKHpQa3nsmJoz/1T/+xuhdt9A=;
 b=j6dscDRhNJ2ju3O/Tkfb1WfObEKevHPV1LIIFaOV/l+pF432Y30g13Sq90eI/om8ojwjhRAE4Ozn8X8gxUPdQ4uSoopAQy0ymtAwNlmEbvarmym8gxUUcuItsacIF81XHSdfjDjxLrj6HcRJtBfnM9DVY5eerwV55SiDzzoeup+p6ly7WA1OytIhhs6JIfUHG6Kexbnl7bCtkGanek/nUngSaQ2Em+0m2apbqO9AXG8SGFyBBdCbKkIOg96rM1YOaSoyqM+QonZbDXkQJANJtqPakrc5NvrC3gGuaYl/ci8ClUnSv40xjZMhjW5FfqbK3/H7Ei7srSFurdfr9FPvqg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0825.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 4 Nov 2026
 09:07:26 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 09:07:26 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] python3-jsonpointer: upgrade 3.5 -> 3.8
Date: Wed,  4 Nov 2026 10:07:24 +0100
Message-ID: <20261104090724.44115-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103092800.39286-6-jaipaul.cheernam@est.tech>
References: <20261103092800.39286-6-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0276.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0825:EE_
X-MS-Office365-Filtering-Correlation-Id: 303e8633-6ada-45c9-1c53-08df3a530ba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|261102123227099003|11063799006|261022075727099003|261028144727099003|56012099006|261026140227099003|261021121427099003|261026121527099003|10067099003|261009223027099003|261021123027099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: yK+blv9vmFO8wt+bhzNIE1AIAmVgAP6gyey9OwRSsXAAoMi/oTk0Jyoyf7RoNHeIoSYOrU9wFafAz/seDr/u3tR0pCNmuGjRzpjIxyfLn5WZK83UcGiYKwbroBnhbtlLO3WxNkrMtPthLHtDwoeMZJ9wow1JMIMSUehC0+8WS2fo6bruCuWAlOu1bZlPRTF18QiFzp7Js6AEMARw3NzlZGWcPC4odEfRjxOxZgD7c7qBSnE0Zk1HZ5sz2P3aDOEBXTuEIRbPUx894BQw3QGj1uY6xB3ugqNYITOmRQ+3z7cfAjMQ4huzZsnXiEJmaRt09BtxaCKGfRD+D2GH+AGWdGcYuwipTLNp0MjOdGcHYsvuDXl/RLoxVp9LrP97Pl4uHfcR1cWyOO6jvFccd6p/xogxdBJukq0AY1C+TnHHg3jrPrSmZGW6JeOa5M4wp70PPFIIuz1/0Dvu5n6A7ug2zMNt9pNpvQZ8qIi3SfZX75nsyS+GCp4+oxt/uQWXx1DtVztb9I8pOfu1yedoCOvjGNpMSBLF38glJydMwInpubFp7kIXPDwLVav1vrfU/fmbW7QRefkXv1ZnLrvGZmwE+7sZdB2xOhXrM83+tWLFDYHJZizO4tERFF+rrvdy6OoWCcE+v3pbG339uaR+v/LBBUPN2koriKX/zrWAwZJPEyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(261102123227099003)(11063799006)(261022075727099003)(261028144727099003)(56012099006)(261026140227099003)(261021121427099003)(261026121527099003)(10067099003)(261009223027099003)(261021123027099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X664HdYQib+lW0wAxkcxkgwrQtSpnyzHfoj72FNeAmFqTZTy7pLfvvW8B9+8?=
 =?us-ascii?Q?nHW3rQnXD8pmadtaBRfBDSAkZpBnLzYYN94R6OS6pP3Z431GH7pr5XoXA9O1?=
 =?us-ascii?Q?T9DmmRFGjPYdw4TFDikcnVaz9SCaqK5BQ9CoJzDjAjP6uxVHwETnTaIDuPva?=
 =?us-ascii?Q?aJHTu69LGCyMnx0NWufUu2VY11eIdRbpJw4mLFz/SAL9CM1amvixP1OwQsQW?=
 =?us-ascii?Q?FfC0+oQvHzR0IDwesYMqJgSEEla3WFp/dhbf1KTpMJIWhedeJp2Lblm4Ks5L?=
 =?us-ascii?Q?C000Hn7GnSTBFTUe5TgLyFuh1nVcqhhiF1ZItIAfBR3zaPQyeB5XIhodxmyO?=
 =?us-ascii?Q?OAcxRvrwdq4QFhReeDQiiYCJsqqu/1IUWfE5jAea5LOVJMgoH0Iw2pBBj14G?=
 =?us-ascii?Q?ZPwnb/viCPGL3TYJTzFxkDu75s54RPtUhS1vxOhD781mB7mZlXmU7/BHUWIR?=
 =?us-ascii?Q?Ttnqyj1dE3VNlqvQHd/iPFc68zaQ/D1sAomJGXc76EEe2JdAtnbHWEf1lxnn?=
 =?us-ascii?Q?MgDWXGsOyRYDh5/SNx/yeDa8X/uW5/vcTqgicDB8LzJJuMVblI1cjzT+jvCy?=
 =?us-ascii?Q?yYOB5+ecp09TcQZre05ZHSkRSM24UJYMRPRUmZXJlHxHd4M56UYdUEQWnq1B?=
 =?us-ascii?Q?U4pI/9BiWCle6yu68JHavNTOZ+79JzBQ6Ren3utl65hAM2OLwqbSZxfxCMt5?=
 =?us-ascii?Q?uTxw1qmGOSkiIbegvrOdaq7lMxa8giltSyJ3JUZoguyTRarEGPB33cID2Fve?=
 =?us-ascii?Q?vr51pE5RyL6zDHRJ1yCEE8rktMha0/MfEY7LKrsWONpdLNN4AuLw2xqVdML2?=
 =?us-ascii?Q?R3STwyj7oFSDokjGCVAtULnSVP4PXbDWmmWFbnGSZGot4PNkGDwz/Zzv5uDw?=
 =?us-ascii?Q?8bPCIOjmw1MAtZGxM2aoZ8gXSPTxBMDwljOaNRVSl8LYnegdTvIMK9iowVbI?=
 =?us-ascii?Q?uqaq4qBWgmdyluthC6RQPFwNkDhFzzLH8IsXbvhBMCK7bdpVi8+NIXEQvUDL?=
 =?us-ascii?Q?Sgaus8z++YtT1gkgQtd0zYEsaOsMVRN+UIkvb0hL3dkHFwBmRHo3hUODbiw+?=
 =?us-ascii?Q?S+7gjy+e/kuhKdgPruzL4y9bPIP1i0dX9ql0aG5sxi+nR0QItrLkCZH0vapC?=
 =?us-ascii?Q?IOAxjsyWbBK1Dtc1Y969dsr8u1bF+G3ZAOcX0O+PRnhpYQhYY4DaBiFhwXGf?=
 =?us-ascii?Q?kQpYG0Nn0GcQP426/QrfSbb40eV6/ulSEehvnJNCigYe8Ot6vNr+HYx1aTkx?=
 =?us-ascii?Q?jxQNuSJAqxe0WImkrBbKrxPwbuIfjPailvvQxfEP7JuqeNTRwHKLBUep2qqO?=
 =?us-ascii?Q?QN8PGuyVc/WN9TqQdp8AKv76D0wkjkRYVXAtDDWOHJK3tRkKqbbBIFGvyQqk?=
 =?us-ascii?Q?YWuTM8P/X85lTrhoiQfJRiYyDI0+9X44DNqu4N9sUbCKuQaSOYgjXLxxq4Nn?=
 =?us-ascii?Q?Zo093Ftoq+i9VOhCh0AiDDRUXaYHYD1mzGHHJ7AtMoN2wKk64a5epRek4SA3?=
 =?us-ascii?Q?WRhGuyQFopX0fLB3RISULLVr3Ok0tKIUxTxF6IKlXHInfKuoYwMi/enHxkrN?=
 =?us-ascii?Q?VadiYnxikOhWg9ZOsiI2K7FIyQxNI0/SesIrPY+fcPSBhctAVbW0UJls36V+?=
 =?us-ascii?Q?S5uDYluJ1FJl8MNronGdcPqaj5o4O4/4b4mDcN/x8jXkiWa9HflPWoOBHVhL?=
 =?us-ascii?Q?Nh3I3DWPv2yUxWYdsjRTQU9ZPRtY4ZmdIzX537hWIwpT4HckUVvTm4791NAk?=
 =?us-ascii?Q?huN48RIgOQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 303e8633-6ada-45c9-1c53-08df3a530ba1
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:07:26.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcYbb6oq+QklkoCHlqTqH8+h9Bwjggo7ujFXge79sdFq303QFBAbdZ25FwuMYiQZQO+9qQB6ZDViAIcdbRrTlc1o7f5+QPR7w8IZHQyFNBk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0825
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 09:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249349
Content-Type: text/plain; charset="utf-8"

CompareLog: https://github.com/stefankoegl/python-json-pointer/compare/v3.5=
...v3.8

- install doc/*.rst into ptest; v3.8 tests.py now reads doc/tutorial.rst
  and doc/commandline.rst at runtime, introduced in [1]

Testsuite summary:
TOTAL: 84
PASS: 84
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0

[1] https://github.com/stefankoegl/python-json-pointer/commit/729bd881462f5=
36746248188ca138fd758e910b0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes Since v1:
- install doc/*.rst into ptest

 ...{python3-jsonpointer_3.5.bb =3D> python3-jsonpointer_3.8.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonpointer_3.5.bb =3D> pytho=
n3-jsonpointer_3.8.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb b/meta=
/recipes-devtools/python/python3-jsonpointer_3.8.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
rename to meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
index dc39b0ea38..b9fdf6347e 100644
--- a/meta/recipes-devtools/python/python3-jsonpointer_3.5.bb
+++ b/meta/recipes-devtools/python/python3-jsonpointer_3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D32b15c843b7a=
329130f4e266a281ebb3"
=20
 inherit pypi ptest setuptools3
=20
-SRC_URI[sha256sum] =3D "81f28618a019cf1b011a6cf757439737972de1ccbeca2e1f86=
dfb4d661800792"
+SRC_URI[sha256sum] =3D "a627a255641390bfb4d51d4cfbb90648078ae855b45804ef7e=
19ea13a4cca355"
=20
 SRC_URI +=3D " \
 	file://run-ptest \
@@ -15,6 +15,8 @@ do_install_ptest() {
 	install -m 0644 ${S}/tests.py ${D}${PTEST_PATH}/
 	install -d ${D}${PTEST_PATH}/bin
 	install -m 0755 ${S}/bin/jsonpointer ${D}${PTEST_PATH}/bin/
+	install -d ${D}${PTEST_PATH}/doc
+	install -m 0644 ${S}/doc/*.rst ${D}${PTEST_PATH}/doc/
 }
=20
 RDEPENDS:${PN} +=3D " \
