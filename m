Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8358.1792578633682195030
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yplhXfwI;
 spf=pass (domain: est.tech, ip: 52.101.83.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBNleem2yt2B/PrKOiOt9RQG7jCkuorWzz6vweq5fNRjkrjvFGnOz30eihmMMawhD+QwNLa2lYoA8jHwrOhVJClv04NqCywKzfsFSnjYbo2oePdMZtNJl2cC4gpzKpasFAnL8tqTQ/+IejAhSixWQiA4IRjU5bIqfDtG1LxqvxciyFWeMFGBxGSMlKjC3tVqapRWsz1jlOeXN7QLQivKEIKmJTMI2WsSbhSfQ/dc7qVvpEGuukOGGdf1Wi9HbAPHiAmiQ2Yv/JI3DPhq2sSFWeVVcfClgZn2CqV92W1X8OeCM0gvOXi6O3fG1g6JeKK23BD37GNS1gFSwxBtBj6qPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snYQSn4aEB0uAEYwuXpB9FWPHRMmGsvryRSuarTCCt0=;
 b=pX5GJRcnyahNBxslBXK8qX1JfHHJJduv5bMy+xPgZuTpue5nTAU8g22XdN6K3KVHyPUu+Nd+Kye30KO1NczMloYNo7MyWuC1WfTEaXcS2Lg3LYeju9ta/tKJZgDwz8h+Afd7QPKCyDXJnz4kgD7zasi8XPmUznGohtMBGwDJyw+08qF58b032CHop5fpcYGaWO3bvLGP995FWLEP7lYb/IyLKaI1Qwg9Dh+xL8AKqIi25qZ1EbW+HMEVQg6hoh7EH+TBkeS6+PCbn4qTXRmiew67koFw3pVTy5EmqRHJVt8CJnVVx2egk55YOMKHyFsBd6Uqee6F+EZI7IpK1Oph8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snYQSn4aEB0uAEYwuXpB9FWPHRMmGsvryRSuarTCCt0=;
 b=yplhXfwI26Fqb7fevz1OG2gJkMrvnJM83y5OHOe0g8Mt8SJhtggrpOGC09G9Ga297mOJfr8m/XMh7u0LrWr+7YisD5YsEq20vbM6R2UIYKk4/3gHLUcxM5blf+SCsSI4WgJ3VRnssVf/jeGWvw/4t0LLVtYpVNwIwEEkoBQaDL97P44hMS5WfGvj279PVS+JC9RxNkeZik4WDF1wN5OVWY85Cik1mx/yNTblhdZ+xIxRAF/jCIEuTj3lkSZaGnGAGUTqgIRB89pr5SA0u5Z4vSHUlGX3Gcs3KlxcdlEd96ztYxoWl0TsVoiSrUmw6zuhGROay8aySTmOMffOmREMvg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV1P189MB3131.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:291::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 10:30:25 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 10:30:25 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] iproute2: drop obsolete GCC-14 musl workaround
Date: Wed, 21 Oct 2026 12:30:18 +0200
Message-ID: <20261021103018.2594-4-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
References: <20261021103018.2594-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0508.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::10) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV1P189MB3131:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a21aa76-4b4a-4431-6d24-08df2f5e51bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: jpw5PFGkdx+RYlCYT9phLEGwiF7mKGL0wniocSOUjOk0c48jwZ3/yXB81l3wL1CJu1uUWohdaXO6N+aBpJWxKpgVvr0E25rA38dsB8i4NJCNS7YVwFwk0niP9XKNRQW4Ee24LFNL6C3UF29eTmlbDhQo8hID213do4hTIKivS15h27I4qeJhc2cbAW/iYZ3r4MdwwGCjQ0agfkO7Wa0LyDz4Zh2k610w/MX6x2BhNWeEvnQMIyG6CaV3wojqWMTNxxb+pZ5lKVZYEmvVSAOaTVMzaID34qdeoQ9pl460uIUMy7ipck9i6fAwTcuaRnOrmY9Cl/bMDCXBKgqUKRIRSBhl8NKjG774bC8UWb/3/0BUMr55HjSgxYapFyS7gJRr16rAzAk96yacvNoInsCZIqYAGjW3iO+NFG6ucSoeBbwaFUGOiOBGuq2rnjUEnDIB2zWdE6Uh1MnlloalNlkvqS8qMzAgAWLZslHMIpvcnKvquVGXU2IMq0oKSna9EjRAyw1B+qS7jrenNPqvuMQigW/RDWIAXwQ9bUgd3J7Ci694wteyEGTN5KmY4LotcjygYCY5EchfglS4Ww/8t5cxdiIG+WRweAyWWv4yliBIMuxI8yMhIJPtTz5KPLjNlbpz4lqDsMqo/D/LDH/ASiPneA+CMiDXwunuDYozrmiLdFs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aHN1uhKMojIcHNynnYHjp4AGpbxptcM8rGfzDee1gPre3c4LIH5zjqX4D+xx?=
 =?us-ascii?Q?3mSay0A9H3rgsL6IBHk+8f+sBdkhAt2bQqmPi/hkfwv4D8KgL6aN9UZRix2R?=
 =?us-ascii?Q?b15iwQAtKST5QIaA40ns5cODEfuCr5OyePj2DSUatpY8ieeRV7EO7+QKhOZh?=
 =?us-ascii?Q?RaEru5/xO+5ocpEGSYd9rnEdm9i6EDD/hQA3OFyS9suhY8EKHz35cmOPxLvG?=
 =?us-ascii?Q?Lt7IeLJbJh5/8/d7kw/DP1tAkUpuUdwjFp+Rd7aLKPZUOVZr6zqlsorb2FDl?=
 =?us-ascii?Q?tMG+brP48UcacV/Ecvk0pZgr6AtwCzguiLP5J395RsFP88UzdCC9i++TanIL?=
 =?us-ascii?Q?Mz9ksFEVsqJTJELACiSENvN9AuCJ8vaA+IkS8n/EiUX1Hy2Gu/Rs/nMsWGyw?=
 =?us-ascii?Q?KMOnCOs7Umt5VePHTaKJOTn/i3j2bFdINA95kqmhiIVQyzLspDMGaPKuxkjf?=
 =?us-ascii?Q?qd5vtTqBEE0TBvSB6H3bPR6KiPnk4tOB+BUjyFSvg7ZkZcjPggW+cWUDrsGp?=
 =?us-ascii?Q?ZrDcgdP4Mn+gblPVYBhO8e1eHgHirBTedes94mpejBpRpnRDFUoDOTmIZMqh?=
 =?us-ascii?Q?3DamRJ4kJXwCyzcB8Ry3pabVDDvfsp2DtMWfNyklLSRpfGwvXDzQ8qdWoVK/?=
 =?us-ascii?Q?fp7gIrQSSaN9kW9g2uVJSZ6H3J8YtW1APfiNzzUDvGSc53pfyQucDVzj8pdr?=
 =?us-ascii?Q?vJ1Mt010SDH8MELcyS+FBV7H/VKkjE8PCAlF4078iyk0T0IRxppWkTbitsvz?=
 =?us-ascii?Q?3LlNAyDjXYgE1dOE4O6K7ugbRoIgzzQfsgDIC4zOoRry3E5ftB5i7ssvxmE4?=
 =?us-ascii?Q?YML5a3EOPaG1Ni4N6/1Db07odNKgTQuGeg5UJBQOPWKiaiSTYIkuEWH0LLbq?=
 =?us-ascii?Q?YE3yWr7D4wehtcjhxjbXAwGDrpB4qSrQGysJQhoa9mOaJDNgbYlsc+nX5ZrE?=
 =?us-ascii?Q?RWKBtWTXmTQl/qjEs+JUp36urD7bEHm9cs2M6h7j9T0jnaTAwlEhUPPHwRXH?=
 =?us-ascii?Q?OX0KKR3YRw2GWkvlyjCz2FXQZ8t58hOMIPhzNnHETtO7P6r5HemVQ5vHzJQR?=
 =?us-ascii?Q?AZhPTwo9nTuUwoHE6MgHRvCIgYIPxtr1x3uGooXAcwGseAgkEEDyMh7iIIsX?=
 =?us-ascii?Q?oc9h2/DktKE/woluoGyUt4n9UuLPBk56YW40zdkTBUWgEF5bz9CIFNZu9P3A?=
 =?us-ascii?Q?gml3OA9f7/df2Ic8OREAGVZTxgTZ63dMYIcw9Ei0ObN08sobyXQ1pOC1qCzC?=
 =?us-ascii?Q?7nbdsGdN5OdNBFxTAVUS7dnHrdkXechR0diExb9FZC++BY4YGDx4fuGpSm9W?=
 =?us-ascii?Q?7G8N1NKASILGAQCDVNe1m/JTu1DaeAq8ISeqc2zpJLYoLMCZ1/Rv8BD8HAed?=
 =?us-ascii?Q?eii0ns+whRMQcKHMFzmCi+ZYapLIYJ4K/ScMtKDLpjR0hrWrdhAvkjn0fHam?=
 =?us-ascii?Q?8m/enGpUOMxnbACLMzZzi3Z4QO+ZBVmDfeq+CuxKSNJzy++Dbc0tWcUFiYLk?=
 =?us-ascii?Q?LBOA19bSRgSRd3FVEJvn87cMsXQfTU/EueXqQRw1GdDVKcc7RjxCX7ddaZMc?=
 =?us-ascii?Q?thibbi5pDTQrz+4FUJw9Z6CN6wH6dXnupZCiN2ZUT4QcRB/wx+v0xYchNHjA?=
 =?us-ascii?Q?RFV9cmZcMOEhW/iJckUgz+3nzxD4cVgMEtujB5upXP90ekwPs6XAzFKBX/ra?=
 =?us-ascii?Q?TuUnN4bglAexPdLKdKP5HXizizVZVxC4lhz6snDnLTfLV2SBtfMBHkZZ8cP4?=
 =?us-ascii?Q?CGlZhenWuA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a21aa76-4b4a-4431-6d24-08df2f5e51bf
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 10:30:25.5762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Thx1kcgqRP4+A71atgGIg1CtR4eMi0umuT8hGAOAghuwpa0DWtqGH2WwWXUbV54IZyjg1AM6KkCbYmMb0nQpxZC0h9Q7l9nCT8SdwtTSfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB3131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248389
Content-Type: text/plain; charset="utf-8"

- The -Wno-error=3Dincompatible-pointer-types flag was added to work
  around a GCC-14 build error on musl. With the current toolchain
  (GCC 16) iproute2 7.3.0 builds cleanly for musl without it, so drop
  it.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb b/meta/re=
cipes-connectivity/iproute2/iproute2_7.3.0.bb
index 685fb3ce9aa..fb11b5dd042 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_7.3.0.bb
@@ -30,8 +30,6 @@ PACKAGECONFIG[dpll] =3D ",,libmnl,"
=20
 IPROUTE2_MAKE_SUBDIRS =3D "lib tc ip bridge misc genl ${@bb.utils.filter('=
PACKAGECONFIG', 'devlink tipc rdma dcb dpll', d)}"
=20
-# This is needed with GCC-14 and musl
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
 # CFLAGS are computed in Makefile and reference CCOPTS
 #
 EXTRA_OEMAKE =3D "\
