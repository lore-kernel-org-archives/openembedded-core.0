Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7404.1793699143233205897
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 01:45:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=azLrz6ie;
 spf=pass (domain: est.tech, ip: 52.101.83.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KppDRIIs2MquLtiw4yZWHe33zLz5mFma3RCzKgySTxHI0gaZDE8F/G/BdWS1rvLjUXXBn9S9NhZ/elwuFONgr8oziG+LCrXW+A0arFz/dFRj+bX7tpnEEqoCa3LghXzCoJeYXNbSWFZCMELcyZHWQQ0EM1OMK4nDaxRqVPa1stQso5mcIAQFYz2qlopJAXU/9IJpXcNMgGjL/dRmgXEpKMGDmmB58ZdPlsv8lgTGEfWjyQ6RV+wFAOoyIay+Gn/S28jyk8GfdgfTKD5cLr65HKiXIN6nF8FsCcQJRfcRHFMmZN2Oa73KguUInVNUqheuWxZi2dSqL086Ss89nU5CPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOiJmQbJnm9kZu3FlUj19uQLaVv3mHqoLucppLwtjCU=;
 b=QMtdxjFxcJc5NsSwlxBVgUUBDLIs7oUKr618UoR8ftR4Uu4doui44sSk36wRpqUvApbgxjksKzpOjVtRvmKzx8F1IbahikQYMWOsehcHZpbHB4Usf6S4qx4tTb9VBCiq2OgYny6p4jEOfN4Rq5jmmccJiSWv03ARhlKP6BaVY9RWfwpPaQoSBT3vcfyZUVub2XFnIyOvMEfYA0lpKkrQEysy9PPROkJcheZLaan2X+WzfqNBoSk9TzZ8Lny3rVhjllhDa2sHGxpr5os+mJfi3c3vVAmi6HrYvMPTDhGS5Vb0oe0qBD3VU+vT0ywoS1JQgVPWYuA9AzcnxJZAyZnPyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOiJmQbJnm9kZu3FlUj19uQLaVv3mHqoLucppLwtjCU=;
 b=azLrz6ietFIDVKfHcmOxDwEOukB9JFdxznvIve6OcW5XdwSxPSDtY1C5exixE9RbhLVBUHFqNOuYQCMOh9esneWZDyzqPllkH5/uf8zbIv/b/HyXwdJ2nQSxCdwLdqiFgLPSLMCp8QIXCf2VzBYdZ//98Ml/6oh8b85WYJ03xM5/KfBlRKHG/dVAD3WcFEPIFGYJssYaoJT7AElO8xaAya+20G8Wg0ZQDLkNEPNZLeNPWdmIXpMwdIJ9dZuunMTM83vWBzzrhXQn7RSBBJ8HGReI6RUHNdY94ETKcqyLqJN9YVLnfaM/nF5rG/ltJo7mFy/63cGd6TtT9LcjuHCodA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by VI0P189MB3614.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 09:45:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 09:45:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] lttng-ust: Extend recipe for nativesdk variant
Date: Tue,  3 Nov 2026 10:45:30 +0100
Message-ID: <20261103094531.39610-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
References: <20261103094531.39610-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR05CA0002.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::7) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|VI0P189MB3614:EE_
X-MS-Office365-Filtering-Correlation-Id: 19973f4e-1913-4751-be73-08df398f35f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|10067099003|18002099003|261102123227099003|22082099003|56012099006|11063799006|261022105027099003|261021121427099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: ZODLlwxj0yRBM6ULzvg32mHnmbJnqRLtfcEbZBgf6FaQOdG9F+2724FSG7jaZqLtvxz2lpm84he753I4uNPD1VveB2uCsZkDy9rarRklkHjoq2PEB+Gttua4TMuWNPinSbKX/k2rroJk13NWf7JRs2FD28HXZboFdPHlHqsAmHIboiRWrIO+zj7m+roRBYE59qCJHeHiFwbRJGjFJsN6kf+CM6Tsep5U0An2rJgKsxDMGqwU4COjUHtmhj7DzCfbHDEsxjNDQ1YnDvdem+HYuGoVZNu0JP1fT3Ox8ot/nfhI2qlbdWls3VNL6WlrUZXDCY2CRkvX6WgLXhTpyt5iRXPz2KI4CHNZeuPSxdIQE+WZ0VfTUz/oonOglnvRELE34N2fFx9ArIedqwf0Dr84fWVrKSEFxrIqqcIMU0jSxRrHxLT4u8s1FMS1IcH6eOIvtpMqrzTg6RRXwaSRRgSdQieCiUXIZNoWFEMBfSsv6QHJggTaK8Xm5gXBcAGXtf2IJ9ZA+YSI9w0mtop8bveogtNLrymniyQry+pZ3ImTJbEuqrEsVHG+jRQ0xMUuhBh68F/NADg41wvv1No+OUadHUPyDMZaaFsclcFkUUftLlzTd1X5mio//1XSrMdYRY42DI0IV1dQ8HBtekiF4wDpT5flb0/gI8gGRq3lE/dRv1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(10067099003)(18002099003)(261102123227099003)(22082099003)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mybKhDJzP4GkN+4Ecrc7GeYLhxsG1ogN4E3NINaUkGZJ6kdPUY0U4XjZQslx?=
 =?us-ascii?Q?crTKuCT+a/kQHU153nBeMiyrvit4McsI9VEF8QSsFJL7kKjNYOdl5DyonTSE?=
 =?us-ascii?Q?Y6VUb+nJwjDtTqpeowDSGt4xa5/gScpI/FjxhiSUJYplchnnV+qinp5KO3rM?=
 =?us-ascii?Q?sMyzlTmCzsNdHz3hyBG67tyMmrqU/Wrs1LDomJ9yQeWzunAIlUz9Owf8RpZ2?=
 =?us-ascii?Q?zgfJK6TeHd+tsKspuA4oU36VrnzVAojI5vYyQEStKHPk9rJwJqUif+PPKljG?=
 =?us-ascii?Q?QfBTfnZdz0sdJ5BGJlyH4T5uol/O5/+8aUJ9J5VlHeA5mz/SDNUlhHipfllN?=
 =?us-ascii?Q?xrktzy9joXwv7n8Zr8xQod6Hlt5GAWvbt2ZZ1zA8Z9dfMeoFLMIYYvMhzrYy?=
 =?us-ascii?Q?hB7fqM1IniSwaWKENqPJ+zP+Dt3l3n/bKe2BXil9czIeUzkFNxUmzgSz2rND?=
 =?us-ascii?Q?yn0qUmQLDQ05x5dvl1Z6XBfcky5YyzZmc/4acUx0MKhaRxrFrzLO+u8p1z2e?=
 =?us-ascii?Q?EAc41ivA1iStmN4LI2aIeefAMw4nBUTayqRWoBnZ4u+J0Ui9nmmdMfbohpRB?=
 =?us-ascii?Q?Kf4xK7Q3x6NqpDZS+4IpjPC1EhdSa1m3lb6RLZzkgXMIDSWiCWyCn32FNm+0?=
 =?us-ascii?Q?cPZO78rZlf5DErqP0JJPuGqVy8dvET/3fqd+bC/md9NfAKPyLNRF3diGpNDE?=
 =?us-ascii?Q?rVbEzvb5wSZd5T3l0OFghmqgSrAhiVsufHYu4g3ixlULNj2vC9cS2T1tJzxq?=
 =?us-ascii?Q?02wZrFU0p46Rn6/pLyH0JXElvi44f9ruF8XPCJdKRFJ9XcSvKzWBtRkb0FMU?=
 =?us-ascii?Q?cFynggDLHR0+0Vnnrf5W3uLLm71nWGt6ruZgam4nKnsF9zLwRHMEkXQc1sS/?=
 =?us-ascii?Q?tZvxGljUflbvss4+ZT6v1Nk68VdJgNs0z0bGxNXPDOthw7gpfnZ9ryxrzwwm?=
 =?us-ascii?Q?E5cR704d4dV0QaJhB1XXale40PIhBbgwXSKjUyO0br9CdAymwmEsftBNDNx6?=
 =?us-ascii?Q?qq4Myu+g3eY3TVIHKzHrC6+2tr9vSoYsocaYSKQG8cL5/M/08PqjWk2SBX1H?=
 =?us-ascii?Q?OnYeoGynScJv5irEkmDmeM8xj8OC8ZpIix7WpC86iAWZFKbZtSkEdSb+DGiY?=
 =?us-ascii?Q?HFidMOrZABG9J9NUHWaH467GNx8EBN3X+1kDKpQ2kBXfrnC8lSiYZvby+T8u?=
 =?us-ascii?Q?iHoRl+G81PebfOy823GofTlO+MCFLg0gfbcP1YjJx97THhdnTA4LweEXemKD?=
 =?us-ascii?Q?/qpU/pQyGFpxarxof8iCpT+4HkvqnRvDn1VeHdtDYWnyDQq6bE+SXCc1bkAW?=
 =?us-ascii?Q?tWd9ef1NH96tBTYEDqdWxtWgrklvXGp9maHGj/Y9VCEfm/QHtnRg4uWOzsv/?=
 =?us-ascii?Q?ke4hYK7OY53D/odOrZrlOHhzPvGMLmS8ntSy2cMmypqne/dsUaTo54NwNhsf?=
 =?us-ascii?Q?J9aSS9kVNoyUZXvkSom8cmUvSYM1MjoJp5OWCWcf+CaGRs1OT4ar0xF8xJBm?=
 =?us-ascii?Q?cLq4ySvWHfY0aKv0024tip54bh8he2EMuRRosC+5VG+qXvayr71EMDqyyLGh?=
 =?us-ascii?Q?Jtj4TxTdhKZWOhG9JH2k8WkUnI4TYtmYH0tYHbPqUgIVjMl06pKVGwZ5feRz?=
 =?us-ascii?Q?WtafzU7pHM7ZcRNTR7VHXpNvjLZRLV6eRBala2YABa2NSiYZ5BrDKJ+a1EOF?=
 =?us-ascii?Q?qxpslzygOkCjWpwn++GPvW0z1pZBg58VPeov56zWObL/Ptb+QCz4vdzFLoJQ?=
 =?us-ascii?Q?S9M1hR1KFQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 19973f4e-1913-4751-be73-08df398f35f3
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 09:45:35.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEleiLTQMvIbI3B/idwqSgg3O64p5pKG2weVQA3xOWxVbsAFmXkkzk41AoF596Xm6htS/80JzoVAo2JXo3i2c22R/vh9tVAvqxpJiTSTvfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 09:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249272
Content-Type: text/plain; charset="utf-8"

Extend the lttng-ust recipe with nativesdk support so
that LTTng ust can be built and included in the SDK.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb b/meta/recipes-k=
ernel/lttng/lttng-ust_2.16.0.bb
index abc701cb79..78a7ffd558 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.16.0.bb
@@ -43,6 +43,8 @@ PACKAGECONFIG[examples] =3D "--enable-examples, --disable=
-examples,"
 PACKAGECONFIG[manpages] =3D "--enable-man-pages, --disable-man-pages, asci=
idoc-native xmlto-native libxslt-native"
 PACKAGECONFIG[python3-agent] =3D "--enable-python-agent ${PYTHON_OPTION}, =
--disable-python-agent, python3, python3"
=20
+BBCLASSEXTEND =3D "nativesdk"
+
 FILES:${PN} +=3D " ${PYTHON_SITEPACKAGES_DIR}/*"
 FILES:${PN}-staticdev +=3D " ${PYTHON_SITEPACKAGES_DIR}/*.a"
 FILES:${PN}-dev +=3D " ${PYTHON_SITEPACKAGES_DIR}/*.la"
