Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16118.1794916298633238925
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 03:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=IWu6XUIU;
 spf=pass (domain: est.tech, ip: 52.101.70.19, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OVHYqdQfefH2Vm0AceOyIxA+AcnBI5gPNwVHoNv97JnwBy84Altkgggu8zaFqbG7/xmqtju1n4vhi857RgXd0VZtgXIgOOYWWZo6AM+mQcWbTwkPIG2a9fVy1aRE6EDmnprs0N1Zu91PjhjM68bAGSUIsGdVF4n4X6I9GSrKyfMG2YRvCweSGNd69sfy8IUsCEWPDCvqNX4u1PA+IBPE4AbzNdkoPbBck2SYUy0PLB7Gr3VlTV4Hj1mtXTAPkgCQ+d3uZ6MaqxMRLiJxteuZW0SPNBBORPZYH4DSKSkDeRSyGYbF90+Ik3dfD8ntSrLHUGvYyK/cXazfuTH/7KnnTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNZqvv60Oh1VCXUurJP3a5D/sv50ktuByWwMgHFX54k=;
 b=S7B0/CnegbMKLs9wEzbxp+IiDllZfHA7w2FIO46KVLAJmZPZuhv/QHhywwBgiCWlGQ92sOmLDQ6RKS5cASLvOWSMaAsOomrYdhpZcdMU3Hg+0sVeffWx6T6waqctlA5SajQW0wp8eKTtGJOD8TR1h4aBiCkPVn44vn/wKN3VhSszwNqKwce5UZfRVA1qL/tX1TOaTmkzFNTrTfKOcfe34ehBqKLX/Uqn/Gk2Eqi7g4yF/fh3M3Q3H4s4M3PT5Q4fktQV6sGjF/e0aR98dStJKrAWiQ1au/bVesigQoVbcGbll25gT25icpMiyKuplwJA9ZYyncwSQcibaPx9Ea0HPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNZqvv60Oh1VCXUurJP3a5D/sv50ktuByWwMgHFX54k=;
 b=IWu6XUIUV6oqZhfbvfPTI/J93cofc4wA+L7Vuub2HRpNCpC/E0zIscv5MNgrxJfDohjjYzJoa0XZrILAKwdBJ5qFHnqkndE1QxDHV7cMcKqczKC+VEMGwz8W7qGeRp++2rrtZu+Ot9XQMWSlO/XvvaHFK1Y/ALfEK7TaMqpcbaQ+N3lyFkE5094JSSt4P+XC/fQga9Uh6j2WH8lOJ/VgSFnKd0D9FRXm4fc/ZdEYcMyKLLyo0NMcjPocpz719x1VacaRkhKm+MNohr1GXgjpxQA/fP6WANM7hm04l+5IigutHw+n7A2kqGGnq5+wIshpkGKsSxwPFP4232WJ9lkYnQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB8P189MB0853.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:51:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 11:51:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v3 5/8] classes/systemd: remove obsolete DEPENDS
Date: Tue, 17 Nov 2026 12:51:23 +0100
Message-ID: <20261117115126.14374-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
References: <20261117115126.14374-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P302CA0026.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB8P189MB0853:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bc78fbc-8000-4f7b-fbc2-08df44a12230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009221727099003|261009221227099003|261009223027099003|261009223327099003|261009220027099003|11063799006|56012099006|261028144727099003|261102123227099003|261022115727099003|261021123027099003|261022105027099003|261026140227099003|261022075727099003|261026121527099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: IyJywL7lTJ0y/DawRVI7SPBue+AOpKk493hauvHQDTIYaz7nU2l7LX8biE92oK/dzAr/qHmVpU4D0+DpKFX9mvPw/5mYJd1VgAv6tfDTSpltKahomT5xQX1p0SQuGLNEGjdbMCrwqZH88Vd3snPNTx70ui9Sy8+jE4sPYGje762J1npTavtqzJoAQT87aJo2o+0Nq9k/JLpwi5/t/mR7hiPtTp21iTtbnDBNbubaxG5nUXGEi9tvGoUC6W0CB/+kB9eRuhrf4qaJrhRpLdhPtbwkjp37Cx3RqWSFC9sTIDxdt5hrJVVPPBcsK0j/UzCCo9iIGtjzM+aLwOBod1yoGxhd6WLlD98zfj984esoKAe+DfRnMmWv2ZJ/4i6DSZ58kwx9WLjRQIYwz6jarEDagc1thUvxuqV7io0sEKl3TwGI3c9TvuOQIHxdJY1gnEPQA2Xcxu/dzMAF9R2lkDxxyntsvvwwnDyy5a9B2SZGbQSfY65JEayTC3CS6sz4CcYr12s5F0mnfGdyLU7XlZMIgyy8TRZ0RaWtE1ocbGW5G+WjrfN8QjfKFP18HYGgfqnl2gpwhF01C3zMqy/Br0eOfuhag0jCxWrzcKuZvfXe7OfPmTeUMMdHUSbYYRpyfrLRRFTac7X96XVQFYAsHvBH5s8fDJeF0jYi+cXodRhkPV0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009221727099003)(261009221227099003)(261009223027099003)(261009223327099003)(261009220027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261022115727099003)(261021123027099003)(261022105027099003)(261026140227099003)(261022075727099003)(261026121527099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WpMe03z9UBUcWexHLIBvIFn2apqVlwi6NmES4kYYVjuHrVeTi2u1oD/fFYkJ?=
 =?us-ascii?Q?bwWlm0FccjeMKOgTWNX3otfg4rf9KBjkJ2uOSjyX7rNTCDSel4lIG+/TgZbk?=
 =?us-ascii?Q?IJtp5RqweAVBFJSYLcq6LHIHOmgLPfF+PYdZbyQqRc6K1EwQuypKiBvWIZ7r?=
 =?us-ascii?Q?P9BXWbtzYSyzLK7KsTTVe7dAkEiO49YQoY+fTDGZsKvDS8FomBFTa2fRvXPe?=
 =?us-ascii?Q?jnGang7rC+8H2l33Zohlb2xeW//R0n8BO8g61drcsCzUCx6u/cNbmZAHkCcG?=
 =?us-ascii?Q?Lfdx0RiWEJFQHwjQSSeqRSCcxjvpsYV0FXqGXUuhkSFBiGXSmCpy+MmbKtUN?=
 =?us-ascii?Q?qmxhS2ENeWYc21U8gMQ6QUiTg7N/Op2B6gJXpVxtddzqz9q4e7xNITk01HFj?=
 =?us-ascii?Q?RYPNiCXNEKvy1yGCupzUpm8AV99TVXnfnGdSHYmvP+rdl1R4aqcR0kYFpL/B?=
 =?us-ascii?Q?HThlwhj5r5exui4ksKmE0L62EReUxuV0jGjPf3HgloXriW1Mu/ZdgsBAJZ1v?=
 =?us-ascii?Q?UoGHAi1lpbSCQPuYX17STzz+sR0ZbswHHV0KTK5B6J48oq2ybRsSn42tBdUL?=
 =?us-ascii?Q?uaiAVCS+uRalecGCGBH9SO6BQrQ4CJaddY2q4GEEqWBdPCXPmSXAawKj6W01?=
 =?us-ascii?Q?FbPAaAF5F14o7hYWn18rgggvTVXGE3Y/I1opi4hYQHV/oKOG8IWABCpWo1tf?=
 =?us-ascii?Q?/2/sdCnMvXCoC9JDx4SpzfnmwmJOWIBkccxvO11DFMPzeJhNP5ICJtMwj96Q?=
 =?us-ascii?Q?iousKiyLMDqqDXpTmK07WncrhajfuYz/MEVsYDBYi5wJiggffEhYQdCfiDAH?=
 =?us-ascii?Q?gAfZ3e0s8v3aTvzTiEjZ2sB6EfdD/2dtE59zRVcsJlOfpo5qqVadLv3alcft?=
 =?us-ascii?Q?37tAuGjMl933NOf2nFD5PYykwEBK7j/1taqA6+BSpaO659U+htg0kcuhkWne?=
 =?us-ascii?Q?P81IY/eC2jFLzxXF29NH4aHvHPUfRcuPmVHBRewhChGR+CZfHcKx3RIqSbF2?=
 =?us-ascii?Q?jl5VefnZ+rYJKObv2bnACReURrG2AaRUCXxxizYr4w0sIARO9GrbQ22kIacT?=
 =?us-ascii?Q?m2nv95rdwxaiYeknJx6iu3dTjtcHAQvQARendS2NBvs82GCC0mazVHOv6MhQ?=
 =?us-ascii?Q?ewPdOX0aabBLLKekUSdX+7l9IwTekKSHbmEa6rJEtcnIICh/l5x1brYkliIs?=
 =?us-ascii?Q?zuccI5VF2E8zpt2SWOdRza00KFoN/BsvF4Bw0cNpdT0AKvGdd/p0tkyRxeNF?=
 =?us-ascii?Q?ggVzB6ujGaXh17cB9aR4iMdB8NfEDaJDM6njCPrIluTWEa5UbwG07ql3EikW?=
 =?us-ascii?Q?tDInGSOS+RTz8kf6/14PEUPJrw5GhGm+kfKQi83mNfzj1FD3jBU5RZiG4fgw?=
 =?us-ascii?Q?HWkbifOSEYHlTbYCVYEoyrda+syeh22TVxnGS/Wvg3bo5vA9X5KToNcvbcMN?=
 =?us-ascii?Q?bowjh3GFylqdelwAHrLVzAt3O/PEMeve+7p/tHwQV5ghSLMEI2fiq6l1i/W2?=
 =?us-ascii?Q?kDzG7TVXzX+0F+DQS5FI7b+uMK+iVCbZxQ330dYr0XiKoB6DLHfhCvD2zvYt?=
 =?us-ascii?Q?QxKkjVLoxh6jvO3mEo4aJ5dN14r5g7pPFwwhj09SKxlwHminN8sIBW/5/Zqb?=
 =?us-ascii?Q?0ayzAuVmNK+KdTI3rgTtwNGcqe/AItI6pdJkbkojt5DyY0hCzMURWwcEkY+F?=
 =?us-ascii?Q?EgFuSc6u5Z8usgQm3dF0TbmywhTHv9as2E81I7M4VBpJC16PKyDDq6ypPuTi?=
 =?us-ascii?Q?gfME67QfQw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bc78fbc-8000-4f7b-fbc2-08df44a12230
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:51:36.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RzIux3BJ0C1jpPu0681Ww8jc1vMQSf5lwdUIlVDQDVN7678zHVEUzs8bU8vzsnmYVRnI7efoZlAO/bRFD319AZ1ch+U1BFZbSAAgfMWsPQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0853
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 11:51:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250429
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Recipes that use systemd don't need systemctl at build time, so this
dependency can be removed.

It was added in [1] but no rationale was given or is obvious.

[1] oe-core e9444649f4 ("systemd: Restore mask and preset targets, fix inst=
ance creation")

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4e91abb261257abfc23acbb87f3d08ae5dbfbb5a)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/classes-recipe/systemd.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 5d8e6086b2..df464baddd 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -21,7 +21,6 @@ python __anonymous() {
     # Inhibit update-rcd from doing any work so that systemd images don't =
have
     # redundant init files.
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        d.appendVar("DEPENDS", " systemd-systemctl-native")
         d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
 }
=20
