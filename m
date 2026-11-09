Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6114.1794231641841910133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 05:40:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nGh3e7Sr;
 spf=pass (domain: est.tech, ip: 52.101.72.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nv0aAwmRIXYE9AwkAKgSupTF3apa5PPPWOySTkya8kPCsHLv8OZeboBhrpq6ah376YYjZ5x98OTryQyTV15Hz+VudM2Vne6sPh86tQ1AXEL/C/LTqGDj1C3WoMJqmx0HkaEqtpcVZtzZ6q2KTs/5x0OjS5MeH23E1vJ+xyiNoH5J65rVRQmxbn9K5nzCJUJX6LB3x2eUYu1k6s7u1BPMMvD3v1B//8TG8H7cMkHtJDcVcIvITZHuaNHFTbRZXfi585PWpU44TTVhyzmrWfPnqq5whqbo6mY8+Xc4OGR31gijQrgtL5MCIFFFO0qgX9nfDQLAGrvbu6lM0MjN2IZkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjRVOOsrRPwpkIMjV+/pAYYWSNBUHOOSZhaQ340hygc=;
 b=xIOS4QsXs9K1fqrZZo8BVocE5ILNXDu/BLJXFxDaN/O9Ql/0ScIKND8N8B0P8w6ZGDYbSAAnUMBe/5HQTaLad7ZQ+jUccF1O1cxIG9uo4evySUyhsUugYl/OgcIiznhcFZFCZMdWE2OvwlgmG+lgHVx+1eA7zB0Ua+vOrRIzdJQPEGMlQvFRWk5NvXjd4Dy6xYjsEPe8dtZrnOY/Tz0pMXM2kxhwOCMVGy4LHc4/BbJLp9U8FU4duRqQFf6lPbwA+8S2/6jFZyy5xOxnUMA/00yHN4Ga9vOv8KZx/7EZRXu4tkP+U1XgzMJ5kotRvfKpGJkgzTYcKNMhIyeUpZAmng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjRVOOsrRPwpkIMjV+/pAYYWSNBUHOOSZhaQ340hygc=;
 b=nGh3e7Srv7WmeQb+5toDuahSJvcpdHPHAMSfnPcqx0mvvrywjLTgg4Ve4bkXOcBtu6cwVrYNFqU0VK7mrFFFNCSMiWMgEs/cBKdp1D0qj5Dt4z3NFxZFsGrr9Cdkou11ss3ff9LiwR4aVCLme/M6rcJUIx04seVJML1XZsflt4NoiRVASfUi2jC2NRO+puykNd2f4fwXmqpek1HixFZoiZSynf1Itk9KGg23ZOZ1fwSv5bwtzIw3QRL3zxQqW2+ymTGw59XETlfqBkfpRKFH/PuAiVm/E4aNc1OyyPfDO0HVp3qKva8gElY0qg5BR+Zwrz3XCpKtiDJCMX9/JrkDKQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by CPJP189MB287125.EURP189.PROD.OUTLOOK.COM (2603:10a6:380:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 13:40:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 13:40:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/21] python3-click: upgrade 8.5.0 -> 8.5.1
Date: Mon,  9 Nov 2026 14:40:14 +0100
Message-ID: <20261109134034.74458-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
References: <20261109134034.74458-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::15) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|CPJP189MB287125:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a9256a-658c-41e9-df30-08df3e670a12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|5023799004|11063799006|261021121427099003|56012099006|261021123027099003|261022105027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: R2BQm2rdwKbD+B0lgaNqb1Q11C7G3UJPPKizeH/2SxH9ZXo9WIRCdfCR2jGj25MjKPpBwSl7ADRhjyF/lNIFXgcJ5Wfac2tn/7N2pbjhwAlXUHTvj00UMtjbIzMlnHEQ1mTE+UUUsfgx3jmm1KVjEdAI/vjIrO5pmNwQSD7Hxhj3niA69bxggjghVXy9qUB8v0xwKx5yAO2znlBnfVop0H76BJ/4r6ZTilxm5lOl3+/QO3MPMAZxGOTLp19EADey4WHGCwKYVFXoAf7GEc+r/qgDMhKyT0UYoMSl3T6d/BijMl0VJNhiANNiCk75wWAjguazWkLkrCk51iKodCFCzUZhDp3kM5R5zGwyoJb6nS4IXuiTim5FOgAUXN9/uGG3gHniwoixaDyG1CtKIBJkLYXm7t0sxEUKQJGctXTEbc4CdHsEFy1Vef2D53kplr0thKuZSpKFZ0VL35BdnsBwBUzq3Y+E9D4ClSRv2qTtqbIc3QpdU7LwXp9epu37mq33ktFZ6U5PUazvG7aJkimwr92vcvRJmTf38e9ssYOaGQjSOjJHjWZcoujOSEk424FBy7/SlrnHSPi/PK6TRAM+veFhrzDhr1MRdelzrgCTyik=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(5023799004)(11063799006)(261021121427099003)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZlwPOaHZfjl0A2TvfWq7IUa5bbTE6IMQWlT78GtW7DdVWKVC0GIg+KJDCVYK?=
 =?us-ascii?Q?9hXYVWRMVRXFzqlxX+Sl63LLNszzMWHpXg0ibQtpwNfivb7TYaezvEnTinW3?=
 =?us-ascii?Q?mcIvVl/s9gGW0A3BwqGHyewJEbN8opjqZWbIvURxo6BjI1n0qWwQzgJpEMd8?=
 =?us-ascii?Q?b5EKd5WtIeujH1Ip4oTJCE1p0H21Cc36hp6iOohE4cq3jz49bs56Lp00AqH0?=
 =?us-ascii?Q?bnR8T+sdTgj+qls/G6qOYAlawAdI6CBfDWrvrbTft+ybwsVEf59ke7+ZxWL7?=
 =?us-ascii?Q?G2xITg8li7h1aSXv3vpehavdHaQDsuCzzNSmcejNBkhiMyXHN4gBf2tat2pg?=
 =?us-ascii?Q?8O5ge38JKE67zJZm9bcn+GsCCqaMq5se2CnCyH550PuHXr2bE4ddz9EFUMF2?=
 =?us-ascii?Q?wZIiTxLPAjjB0MkVnNnjBf0mSPG6E/LKda5Hkf7JkNq3hnIW80kRXOyPQJGi?=
 =?us-ascii?Q?lmgLQn3kfb3wbrCvaIYqWUisbTPQW7M43HbxXND3F/yhoaN7S3YuPkfK8Iss?=
 =?us-ascii?Q?Bn7N4W/pgVheT6LLCzNBKzmugGftqq1rfrEnXUAaBX3B9sOF1i3lB4wN5XO/?=
 =?us-ascii?Q?fXrYGWUyfXiQcXrIwc9lvFSvLHPIA30ibfaYElKfWDRjTO9tqNNhnQ06jxOL?=
 =?us-ascii?Q?GoUxANnxCUs7RESGPrD9yIJzTwO8EOSUzaV4ngC+kmvuMO0/JuoJOU/ps5Ho?=
 =?us-ascii?Q?NXu7PM1Abi/xyO2Dprhzdw0EsVFRElR8mQ8z6aok25SKTQ6weyQ9lI35GfKo?=
 =?us-ascii?Q?oAQFWk8O+UhV4H8xopPP/gxLCYAufWGjAnWfyU6gIrhLLUMEnL1b35CractK?=
 =?us-ascii?Q?+wjLGyZZ2st3TmR4AMT++Wyek8AaQGFmMNVsXlr2N5eLYbByNBvKzA2LultB?=
 =?us-ascii?Q?nXF825xwXu3RPWiVm2MTdO2I2YnsFOise1pn1MCwgOZACIKpjWXK3UMhCYHW?=
 =?us-ascii?Q?O6e6EGO79C/NFlDsp+rJhfXzUFhIT3UbgXOV0BRMitU1tJbC3SxDkHvLDYW3?=
 =?us-ascii?Q?LxOnl+FI8TkZuFJvCpX46Q6erltfcQcCu5NrQDuhOmpOTMXc8gPV0DfN72sl?=
 =?us-ascii?Q?H8H6Yo5eFvQBir6Upg5ZYvivXYzNFS2YdSuCf7g+f/SWHdUuhV87pwRAPPPv?=
 =?us-ascii?Q?HEFoejK1I0ynfrv1W7S2djzuArhbAzX2XzvgAoMe+1QP05Ol9vDBkfV5eNtH?=
 =?us-ascii?Q?DPsaMwvOlBNmtkFaH9K+faDxj892oqlQUbqceS5mKIzTbvxWsiLTmSEiJ6Xe?=
 =?us-ascii?Q?n+/mGEKKKisdE9AU4vd/aWAKrmFp36z2lUAy+R2sBm+42alhkfDz8NGNPCZy?=
 =?us-ascii?Q?AE3/pVDY5ciE0jrZ3qLBKi/4X2U4deRSZsVmi/mWRok9FZV4S3HaqsT5r8J0?=
 =?us-ascii?Q?2oqe4WsO2E50qPsre+e6rP9LkvoLuJuon97mEjIWu2KPrUX5bd4sg6XoMGdt?=
 =?us-ascii?Q?jgNU+6Kd0Np2NQ4fF6O36+k4ITqfkXEWy65xg6WuHxEIxHsJU083SQeDPxsB?=
 =?us-ascii?Q?JlWrLMDNBCCl6Oa6/Vydv86XiITFLzjpTTX0R45jiHcIU7BZKURp2OTKtZAa?=
 =?us-ascii?Q?KT1UbJfg8Nrtp91dp9+Ic6eHFwLGf5vK0gd7ojt61UuZ2tYp1eOCcReYKZVO?=
 =?us-ascii?Q?pIVMoPpwRxe6X4/oxj2QDRyEzIqp7dvzUyPc3tLOetQuNluPJnThfOdXDwrv?=
 =?us-ascii?Q?/nIxw1kCaJmhFiQ9W+32Vl3SFT4dCjQsBmxowT1jorSpEVP0mjAWbv2Vy2AY?=
 =?us-ascii?Q?F2Y1Mg/W+w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a9256a-658c-41e9-df30-08df3e670a12
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 13:40:38.3857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NnV4VcCiTv60alRvq80pkJmd1RkcwEOPxwr2dxsipnRYMHUFXSLcwAZ0IE0j2dH32jA/iqHsYXnUvaIbQJOeKxGmR8qcnbY9pMtedLpNCHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPJP189MB287125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 13:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249806
Content-Type: text/plain; charset="utf-8"

Version 8.5.1
Released 2026-11-09

- Fix `copy.deepcopy()` and `pickle` on a `Parameter`, `Option` or `Command=
`.
  {pr}`3805`
- A `KeyboardInterrupt` arriving while `Command.main()` reports an abort or=
 an
  error,
  or while it exits, no longer escapes as an unhandled traceback. The comma=
nd
  still
  exits with the intended code; only the message may be lost. {issue}`3802`
- Add {meth}`Option.get_help_spec`, which returns the option's left help
  column even when the option is hidden. {meth}`Option.get_help_record` sti=
ll
  returns `None` for hidden options, so help screens are unchanged. {pr}`38=
21`
- The `Positional arguments` help section lists every argument of the comma=
nd,
  not only the documented ones. An argument with no `help` gets an empty
  description, the same way an option with no `help` does. {pr}`3860`
- {meth}`Argument.get_help_record` always returns a tuple. It used to retur=
n
  `None` for an argument with no `help`. {pr}`3860`
- Document which types are inferred from `default`, and what an unrecognize=
d
  `type` callable does to a command-line value. {issue}`3036` {pr}`3808`
- `path_type` narrows the converted value's type for `convert` and `prompt`=
.
  {issue}`3822` {pr}`3858`
- {class}`Parameter` accepts a new `help` argument and {class}`Option` and
  {class}`Argument`
  inherits it. {meth}`Parameter.to_info_dict` now reports `help` for every =
kind
  of parameter.
  {pr}`3861`
- A command's short help no longer stops at an abbreviation such as `vs.` o=
r
  `e.g.`
  inside the first sentence. A period ends the sentence only when it closes=
 the
  text
  or the next word does not start in lowercase. {pr}`3865`
- With `show_envvar=3DTrue`, an option's error message now prints all varia=
bles of
  an
  `envvar` sequence instead of the `repr` of the sequence. {pr}`3884`
- An empty `envvar`, such as `[]` or `""`, shows the same help and error me=
ssage
  as
  no `envvar` when `show_envvar=3DTrue`. The help screen used to show `[env=
 var:
  ]`.
  {pr}`3884`
- Align command's deprecated help text to options and arguments: do not
  translate the
  command's own help text, only the `(DEPRECATED)` label. {pr}`3901`

  does not. The feature set of {func}`version_option` is now frozen. {pr}`3=
581`

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/{python3-click_8.5.0.bb =3D> python3-click_8.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-click_8.5.0.bb =3D> python3-c=
lick_8.5.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-click_8.5.0.bb b/meta/rec=
ipes-devtools/python/python3-click_8.5.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-click_8.5.0.bb
rename to meta/recipes-devtools/python/python3-click_8.5.1.bb
index d6017e3d7b7..29cf0714d09 100644
--- a/meta/recipes-devtools/python/python3-click_8.5.0.bb
+++ b/meta/recipes-devtools/python/python3-click_8.5.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE =3D "http://click.pocoo.org/"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1fa98232fd645608937a0fdc82e=
999b8"
=20
-SRC_URI[sha256sum] =3D "ba0d2089de75ea0310e2dde03160e6ca10009947fb95a182f9=
b54021bb272e34"
+SRC_URI[sha256sum] =3D "9bbfada76703fd1d784b83eea012e3e8c6a001a876543ef104=
fa56aaaeb072b4"
=20
 inherit pypi python_flit_core ptest-python-pytest
=20
