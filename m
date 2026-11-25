Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38474.1795597599787432426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 01:06:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NNpmrpwp;
 spf=pass (domain: est.tech, ip: 52.101.84.69, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SknvLuiBECslroQuvVV5kAVRu/pj/BOID+/vxgocULSC324XKzSPYRhMtKFNjOtEb5sbvUyzwUrNblQLCuFRJ1l02vF+YmAwe6M9x7aG2L4OfCukqm7+gBRnvSOZDQD5/xkQm71Un/23Y7RhmqdKdFBMPxHp/i5UAOrfKMedA//Uf09eEDdxk/K+rjQ78UYEWCEC1P13kHJtaL3nB5jtZwohc4xWW3KSyKiDexuD4Ad+6gccXf7qiZ+2qSS21fdBoE+0tOJsWAxCKmMCD8iYwM2A/WrBBy+slP/fac2MueZw+paVoi4NnJnXdgOELWTjjlBqlMwtfxhbwQ+oZdqDbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4uGx2QQFdlWnviI/TGit4acAFEYsO9PUIkfHkJXc+o=;
 b=HU6AAWvqdIRZEOuLAjFlgAFXZXwdbiflUnXYgaUy8SpTfnj8ZAVn1SroSQgdEfNrjaBw7kgS2JrYPrx2qtSe030NX3LS4GqV0SczGS9q/tn2N2vu0gcc11/9plmWg6SZ4efNAzDfkvjWfxOyfOxNq7bgZegjOBzzgLxcdV45ckzBsuWHJtOAWqbMbR/KGfflQo9MWe4o3gH869F9bmACI3I+exUkY7YFNGsHuxKMrwwBDsbm/2vltn/E8N6ZE3g949routxLNrlPl6gg/v4lScOrlZNCHp78aJpKPkygfUVJk/Hs4UzXiOz3F5iOPRFxcRQkzfRDRuL9P2ZtEEK3IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4uGx2QQFdlWnviI/TGit4acAFEYsO9PUIkfHkJXc+o=;
 b=NNpmrpwpcVHQMfgaJnG6IynQAIk6QU3dwJ/4ANPQ3DNOFFXVcUOT9g5WH+SpWNfc2etzVnvzI3BeR5Hd3ybq4MATNBYcsfpVet63VyfkYWFCjMiTDHkqFmGPdMhXlqnonJMZXQ4vd4AMmjY++2k9sPpyNJXK76pzXdFqSoa7YlpphZpMePEhXuRyMlUgs2FhQkuog82G4P0Z+IKpx9TG9mkAIHAHTRmAkXdjxA5g4BJTnSm9aw2TM6ynNgsMVEpMEafQCkwvFEw1GuOB15Imedi3YMMkqnGNkXgDRgjaMcsfi5dJFpUKPMj8FotlV9DAM+D1obIdLtkUHyAfJ0aLaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB2746.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:06:32 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 09:06:32 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] repo: upgrade 2.73 -> 2.74.1
Date: Wed, 25 Nov 2026 10:06:26 +0100
Message-ID: <20261125090627.78976-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
References: <20261125090627.78976-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PAYP264CA0028.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:11f::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB2746:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a14fbbb-4e12-41e6-89fd-08df4ad36643
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026140227099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info: ovfh1kGeyT+HoFacHlWXbdbjTxYWziirvLb/AjTNatQI7l00X1ROJnCToX9hrf9OViZLRuEu+PRddNS+tNLbAeNiHdap6D5/9wlGlqIMZlm/nvuWvKIgC1jctG1DbBu6mDJOxLLXzEvGFyMdJlLAeBssgcD9pGoOtZobCcU0am8ObwhXLLK/4A56CQ1Nl1ta3nlLJs8IM8qSRPW84PEjAOVSQWcLBHBtPOCF1ixKulZAjser75rnZew4YNbCPIWsQ82nBw6IaqMk6pdj59TV7FTdpPrq0//qMW8vorRUncdpwZ32KPqtO9JNnmbpPwJuPrfz+uK1IdsUU+nOknIpazRkcbHMvBzkvE/PhwP3X6PxvFq9xDT2Fs0oGPL09HrxnDRta3H4Np/pkd9oRwM4tZm5IG0ZytLpQMVsF15G/Vh/OalBqGFBZwBYE3B/xpr24X59TGihi2Rry24kcYE+uZ2QO2cdKIDND8O071P2kR1plnSSYKVXOu5Kpvoninwox5aQoVyEF9OaCCJME3q4P8qfXXMNIPSBJTCOlV7Exaaxy9dyzFZqRWy8kvfUzc9YlopH9L6ToIbyqoAApqX4f/39wYjNxee/TPP63MjDaByWZ6u59c0XmUg0QBpWogWXb1DQ4OjaJR7rVN20Ot0AwQHceGSw52E14KJg4hkc7No=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtGHBUn6++t9BgT7uujobDxnOCUMA06cWWlacbzwjB0zarQFhFxWhx3OCgVK?=
 =?us-ascii?Q?OjCZYQsdZYm8pNb1juiSFu3z2lk8MNIOCvb9f2U34ZQS7DtI690sUHIJCRC7?=
 =?us-ascii?Q?W0TKbowScAlsYqqxCsTWEuWAU9ZZoAhsNVHp+bvkyOvx2DzPkLzV+6lbivEq?=
 =?us-ascii?Q?AfT1Sz++DVqvRSvkTA2FJtSpYevh3xdDcB9VDkMQssdABcPxZJHj++XL8Z8m?=
 =?us-ascii?Q?q64fHoSoo6QzE33nrT/6TKDaUPIrnF9G7oiAPmXroLPI+dwFhgyyvBKDWUj6?=
 =?us-ascii?Q?K+9CoQ3nlU2LgCVbCXefzuFEJu7D/CghmF5LZJZqiu9D1DKsdwMrw9ogwxgP?=
 =?us-ascii?Q?ed/oLAaRxoTNW0UF/JQK1H+eQsO7OCFS36sq8p6ChMhjBdEf45k344MH3QOg?=
 =?us-ascii?Q?iBDP2mbQYuCYnd/tKWTsa40imKCUnGwIw88E2v7FuBFrSsHrTcc7OjuIATwB?=
 =?us-ascii?Q?ZsRwsL/ZfJnNh+aPH+rR8VlBiRXNJCXNj4pbno4SqpnMRebq7ecV2edkWZ88?=
 =?us-ascii?Q?mdsqyL/1vf1ty496JIA4lLXrvQBzS1ZQD8lFSYPEPDQ0pifV5Grt1GHPGjxl?=
 =?us-ascii?Q?AmLgS1o+6dxnuU6ez1ihhUM3f9Fpy/Ei7tsWdA1Hq6o2Hnpy4e1PzkPC/X0s?=
 =?us-ascii?Q?+95LYiwNGGBfcANmGDHn5Wr5uJHKTecTWI8mvcwWBctj0HL0evUGwW3X3QNc?=
 =?us-ascii?Q?IzDs49DsxfQrJyhweUxtRW3kh16Iu1gudHPzPS1vVvvacOOsydMxp50AYzMY?=
 =?us-ascii?Q?2kaz90BfLvOHc2SRz8pOg0rRac12uITTNO7c2PhLhItr2Qy8N8+7AFciKrkX?=
 =?us-ascii?Q?wPgsINAxH9vXk+M33sJd4tCf6eIroK+uza0ysu2daBqYy7iz29W77NaP0UHU?=
 =?us-ascii?Q?n6EYgZnDa5XziKFwTCBo2lULmRpT9RX2Rdv+l5vqDh6I4OdoZ7c4vjqDvjds?=
 =?us-ascii?Q?LDmf/v3PGQCEsCCAHWcbz9q0y0k5YxQDloGpJup+Je5YcE02f4gpdgLqgBfM?=
 =?us-ascii?Q?k7shwXIV5RwkAlss4zJylOG9Jc+Vo+3TpgfT43RtBhxTWpMNhs4D8B+YJqnI?=
 =?us-ascii?Q?bcU4UOkIe4cnHlKtyVRo3R1PrXUXJqZ8NIvamUgtHC0DXEogUnMFUyuGNfdf?=
 =?us-ascii?Q?hVQO748jkoUopaTlL4+Xfoq+pF6iyt0dMajRNkFagNoneizk2EkCvPfRdNgs?=
 =?us-ascii?Q?IrnKt8h+C/7COQTBZmC1Y+mG01ithFxh0u8IOHQBfp6P/rIiMg4csaRv2he5?=
 =?us-ascii?Q?LjfCmh2L/z6xWbIUh1x0rWPTGQZyaMWxGgtWB3thSefk5BAYj/6NmC9lYOV0?=
 =?us-ascii?Q?8FZBJDrSjivocQJ31SldxYMj0vAWYXE/xwl06sp+Qeqy1tZ+L1zXPzbySjGX?=
 =?us-ascii?Q?88CV57ZXTVp8B2YRfYDr6nIu32i8tQkNAcTC3yfAXGjpkkcL3l1ToAThMuQW?=
 =?us-ascii?Q?Uj+YNH+DCFadUkBQtLA8OlEEMG8VxI9m5ZtOb2l/vKfr35EhopmOxFsj0hcs?=
 =?us-ascii?Q?pG+ca2GPefQAFuIdRS9Qr3cFuJMTzjo3lsxUnDyRqWmWuI6mhl3RFf/mPtW+?=
 =?us-ascii?Q?K73FKExyUvO+LNN/rts7deFeMS0TuI1PA7FgOy/xKma/8DT3BM5ezpcWrq9c?=
 =?us-ascii?Q?pA0MGaWzQqRCU2cCyYPLLz3K5p2N9xlGhOkHzgXnyPE7e3T73HnMi/WJhoKE?=
 =?us-ascii?Q?yReN1bU02iTKy5hrVHjI72KzKDbWwi3VPDvemGKya++9OdNUZQ76h6rgMRh9?=
 =?us-ascii?Q?8pa58D/BUCCS943idtEtrPnKG/9eGOk=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a14fbbb-4e12-41e6-89fd-08df4ad36643
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:06:32.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSdRAMvUJR3O64HWL70h+f7fnvQZw+9Xm/QNwzMDzBVSGU9k1Pn1SeVJSUPCjGUH1fjQ1rIuj6/wEvYb/9GxDzR4MGJA7Ds47woC/h8RELA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 09:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251168
Content-Type: text/plain; charset="utf-8"

project: fast-forward tracking ref from prefetch
sync: add repo.smartsyncdefault checkout policy
init, sync: persist --manifest-depth across syncs
manifest: default sync-tags to false when depth is set
repo: bump launcher version to 2.74
init, sync: support per-branch smart sync branch config
sync: sort interleaved sync slowest-first
sync: add --force-jobs flag to override manifest sync-j-max
project: avoid git spawns in custom fetch ref checks
project: only unset core.bare when it is true
git_config, project: coalesce SetString writes in BatchWrites
sync: warm init.templateDir cache for sync workers
sync: trim preciousObjects work
pyrefly: initial support
typing: fix various errors caught by pyrefly
project: fix invalid logger call
project: fix Project.HasChanges API mismatches
pytest: only keep temp dirs of failed tests
tests: switch to mock.patch.object
run_tests: turn into multicall program
git_refs, project: read files-backend refs in Python
sync: handle smart sync when the manifest checkout has no branch
style: use `from subcmds import sync` everywhere
style: use `import hooks` everywhere
pytest: enable xdist usage
run_tests: regen uv.lock
flake8: fix warnings with newer versions
git_command: move _GetBasicEnv to module level
sync: remove obsolete projects before interleaved checkouts
style: use `import command` everywhere
tests: delete buggy git_command tests
style: use `import main` everywhere
style: use `import subcmds` everywhere
style: use `import command` in unittests

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-devtools/repo/{repo_2.73.bb =3D> repo_2.74.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.73.bb =3D> repo_2.74.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.73.bb b/meta/recipes-devtool=
s/repo/repo_2.74.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.73.bb
rename to meta/recipes-devtools/repo/repo_2.74.1.bb
index 3b5ff064f78..3ac080c1194 100644
--- a/meta/recipes-devtools/repo/repo_2.73.bb
+++ b/meta/recipes-devtools/repo/repo_2.74.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14=
655fc854ddc3c6bd57"
=20
 SRC_URI =3D "git://gerrit.googlesource.com/git-repo.git;protocol=3Dhttps;b=
ranch=3Dmain;tag=3Dv${PV} \
            "
-SRCREV =3D "d7c431b9968d928373fe9b463a51d304d3b2c48a"
+SRCREV =3D "83eb32ef8758d5f89bdc7237b7513e40cadd1409"
=20
 MIRRORS +=3D "git://gerrit.googlesource.com/git-repo.git git://github.com/=
GerritCodeReview/git-repo.git"
=20
