Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2150.1793955086958824927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 00:51:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rg6ALIGW;
 spf=pass (domain: est.tech, ip: 52.101.66.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GKERD8PNuzmHUu0xedZXFq49enEluRKi/+Ku0TjuIRh6GgLuT4Nnd5yrQgOHYgfiVeI5q9nTaESor3Pfc8Dumspdo0C6c6OhYs9I5OPXrfTNoJ74sCQywrf3HybA9H5ldT/9JGGQ1iuUS6FkHhY1mqbP9A/IE8B97u1TSyZ1RjfX2cwrIkJQ8LuRNEHBgnpknn9Z3tgDdifWPbatDue4jbBVK6kE98jfmzZg7Crnkuhl5AjwTES3pt7GAsw5VFRp8DF3Yv5NpFfXO5jZGw6FomXA9iWYYgWwS9YFWUFGSu4OiKp6/xQWcVz+Y/dhMVgGk2pQdZVohFLNBQF3e86nfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBPVRR4kkx930WI8N8pevf5ou2IlaOEJif/+ylT5K5U=;
 b=SzYNLPYfSPYn9m/plF0BSg1z8gWbpVDmjCLIiAJZE0DlJ8bUqnfmBIcu76Nrt3qduDurejTsnEMwxqxuxw24DK5zpTIZIQgtYOUpC9Xxj5UORahhSIzjkeg1MniGxES1u+GRQZOhWAgPL2yHy1QdFulaqDfwYBALftFqdcmtF91wuDR5riIdHKj2JXDtBfIRPI8O/QQqPARES9UtZmitUFkir/4x8E/WbIVwxZydJYNJeHxah0LtypCrc11/W40Va3cm5VDO3aZMX9Bvbs3bQzQNNLj8XC7Lcdy22h5iZsmQEJTLef10z5M7KftlJ+ROXIg9H/LL3yYehdD1HdCLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBPVRR4kkx930WI8N8pevf5ou2IlaOEJif/+ylT5K5U=;
 b=rg6ALIGWDPiVFq/VaSiTYOqoe5Res8qAfZQ9D+iHvyIlsOyoXIfqOiLTaNkS7/e43MNKmIEUI0bqFs+Y461VQf5aysX7szXGz16QmhA4MWqJxSvhFoqiM4bNbEsXkXz4vqVzBbHJzEDDU+PahV15vP0ZK1U3NlX0hIaJYjQryhyVjGnk8ZJwnZQbpzmpJgf9XAVGqiiRvEUaSq2Q+RNB56LMpwkGn49kR2o4dyTrYFURbQ8vpLo1nP+FlteEskbSFIBZR1YVG4cL3gBqSJBBl+fyZl1lMUNE+kK94I4SvCW47HU6ydW0JmPmfTA5oYmfDHCuWozIbRpuqmPcM6Eplg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by WA4P189MB004753.EURP189.PROD.OUTLOOK.COM (2603:10a6:1d0:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 08:51:21 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:51:21 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] openssh: upgrade 10.6p1 -> 10.6p2
Date: Fri,  6 Nov 2026 09:51:17 +0100
Message-ID: <20261106085118.63845-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0341.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|WA4P189MB004753:EE_
X-MS-Office365-Filtering-Correlation-Id: 068bcbdc-651e-4634-2f49-08df3be32119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|56012099006|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|12006099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: QNfewQ3lgF/TFtJdHsdm4/foolEjAaCn8otgfu5PwnVPieLLNi3ZLwsZKHZAlW5u8HoDBHyX5Xs9exM948IuFGswIMNw2sp2nUy0dt4G+CZ3mKv8IRlEOYjnqmUfGHfINNtCCgCjjvan2NlQaY6GV2NGzTL5jqp3f8eMIOIaoo/EUcqHxulkoxzik6ZPC1H3woi+z6M7jSY6taBGHrJp2i/UOuECDU3SGg1J2pnONkh86hr1aaT5rzCYGLERrDBalwWnfE58O0QsirVjroiwshmLgmg0gMtT0edNEaVZi5DXvHSkrb4Pf+B4c/fnFc5ZwRu0ba6pVYnkxutzVXuQCSiqC2xXRO5L3fhaaXsuirR47HpTH/BXGpp6CbPXkxI2WG1iztXeKQKyXYBkRPjUkWPD2QfYLZAdoOXQ+YpFeZWLUBcvJAP/lByfsiHzHo5LLZh8CNVIgoH3hOGK1PeM/SsS0n88Zh0pXl8rHhUYvU6AyfZDBpjdjiYb7fIAVovQYNnS9g/ejatMpVGdjVQ4O1nV1suudKXHTAFVEJ8qMuzidnPkeqq3spJYNgLnM0o+cMQxwe/vdWR3kh+1W7jiGM9xc6+ei5uViiw8y7JLjjtSE7r7hhFyN5DlsxHJ8xAE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(12006099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+zjjX9Km0xcDPk7KRXHVBYDgx3MQl4HqQgM+1hbtjeMK2ba1Q2TNCxRsz+EM?=
 =?us-ascii?Q?eTMeiBbeIH3HYq5kYbMeGaeJmzJhWIgSSaEb9x98fLqTr6kjEofAIMJaN78V?=
 =?us-ascii?Q?7VSTl/5GFhzCoSGp4aeU3UoeKw5WGjXkwgwVPK09QgEsFsRPiY0DvwpecSeV?=
 =?us-ascii?Q?wN1adRr7KjJWrMlH/8JQWptjP97WZieKuD1fEIJ2Vmm2t50lUQ2KYPYT2Cxp?=
 =?us-ascii?Q?rAGvVzpBdI7A4ulZveJTM7t89eJP1AVeqARuU4IG0VAq6iM2vKxgcCAXBv9W?=
 =?us-ascii?Q?durC4JqMgAwZi40Zq21BHQKozrOHLEAOi5sT/FkyRMJlt3JPzWnbMNNpMbSG?=
 =?us-ascii?Q?08X0MDJ6Zo3/9D1SQNkafiLzob7rqJ9Axz2l+yw5x7lBv7+jXt5nu4KgxJHw?=
 =?us-ascii?Q?eHeg8eLM6NzEa9J00tVtTuK2wrnOUwU/NbjSHCpZxeCsuPUYmSI40YPMj2yq?=
 =?us-ascii?Q?85H1bCyYBR3GuEz3abrY06vfu6OWp8LOlrYF/3WBmBtAiM3deEhXF9S9nlBj?=
 =?us-ascii?Q?0NrR2DU0AJUxOjDI8wxqQj1lsHy6mf9RtTwxvftDKV5+OFZUXLCFMBoI8GI8?=
 =?us-ascii?Q?AMWOWzCisqobj3Ye+TOIQb/zDRI/J7/XV/r05Rzv14gumEMVsd1zTUowbfAG?=
 =?us-ascii?Q?2X+bbjKgDHinxss7BjRC78zB4aOtSz+COMEmAvv3tVLOqe0Oy6ozb+SWgbAG?=
 =?us-ascii?Q?o/4eZQ0jg2DJ86iKxXIiakxIKB1XyQnuUl40BFOFpnpBtJgyu6B+pNEc/c/U?=
 =?us-ascii?Q?/BiPNC0TIUV0h3NUVwFZVGubWAx4q15O3Amthuhla/sU8b92EeSzzfHI5+KV?=
 =?us-ascii?Q?8NUqvHSL8B+MjX/hcotBiie49LhMGXWn66TwnN/Ct7DdI+1/9PVDHhU+FwkT?=
 =?us-ascii?Q?H04vPEwV2aQcUvhRRmVndNRCIkbEM2ljd5j02Xx0SgM0bP7/n1oTxVkIzk5f?=
 =?us-ascii?Q?nXK3nwm/rd/TO4dWdXEEPXpKPOiLDQnhP8C7bVHWm3DmFcHDYDxrbANAk26e?=
 =?us-ascii?Q?F5sSoPGbwAWQcXSsbi94M8IVUoa6HsF+WGSlXLsbOkxMIE5w0bUCgyz1uCUH?=
 =?us-ascii?Q?CkaRTTbuQs0Z/U2rBX+oL9QvvvAF6pUIXDyCm6arQMU7y3LXIlPGMVpd2R6y?=
 =?us-ascii?Q?E9fsNVtMcWccBEBbWzes5V4ODx3qcBMOeb6eO/7VLlTdmR0jXOf+Mu4TU3WU?=
 =?us-ascii?Q?lTwRxP77MHy2a9bAMyO4ZSKPMbZDYJzK9r9211pKsrBcq/hYdImIvKDTMdja?=
 =?us-ascii?Q?pMjZYYF5gb0HYu+LzSo4Z9+ZYkHoOduY2dmgkcJFgaD+TqFO5N/v2ixz2Tg5?=
 =?us-ascii?Q?2zgayIPQ4YZjcj6MlOcGTLmNCXJeTZI9YAqrQYjBKSM448wRTx5uKb83jgQX?=
 =?us-ascii?Q?7epZ+G7ZjzVpr0Z+IZ4nCf91Sa90nI8sVuhMFtsl0uBwiUM8bIA8oU0FU5gI?=
 =?us-ascii?Q?3wlUbKmXPRr8DJty2CTp/IzOgotsAzm53HoRZ/rsPAnDHishpdedTCqsqENK?=
 =?us-ascii?Q?bAN5nEqaUT1d6IqM6Px8Nn63ezycw/PEmRNaJkTT3Rws90nRDNph2VEa2XL4?=
 =?us-ascii?Q?9vfHUljXcfwxQhLy1BPl/fTNbuog+Voo/X9tMeVQCnzA5iw7Os55a+s2wl9R?=
 =?us-ascii?Q?a4Zchd2ie8TbVOCzG/C87F2DjFJhv9A8ocj95C8HpLaM+OEJFDWaHhhdgE5X?=
 =?us-ascii?Q?+O3vF3Nv9YoCHBmorJxdiksNb2ezoEXXuel9H0GyXK/0T78J1SjDpJC8pgdJ?=
 =?us-ascii?Q?f2SS4KXIiO7zPnD1ZuLpTukhZ0q1G3w=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 068bcbdc-651e-4634-2f49-08df3be32119
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:51:21.0291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/veuK2WKaXKS1z7FmfkyUZFcggI9xSKyCe1r1m/dXJqoYPf9HgIDNSZE5Als3AjwdJOYnbTHKI5DloIRjN0Zw0I0o/GBk5Ax81Q7+GzYRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA4P189MB004753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 08:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249610
Content-Type: text/plain; charset="utf-8"

Release Notes: https://www.openssh.org/txt/release-10.6p2

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...1-regress-banner.sh-log-input-and-output-files-on-erro.patch | 2 +-
 .../openssh/{openssh_10.6p1.bb =3D> openssh_10.6p2.bb}            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_10.6p1.bb =3D> openssh_1=
0.6p2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.=
sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/ope=
nssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patc=
h
index 902ac7411a8..46bd7e8d3cb 100644
--- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch
+++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-=
input-and-output-files-on-erro.patch
@@ -1,4 +1,4 @@
-From bea215955125b39c802d2a255cd08dff4fa6298e Mon Sep 17 00:00:00 2001
+From 715dcbdc4724618a4224a4ee78bdf9bef0cd26f4 Mon Sep 17 00:00:00 2001
 From: Mikko Rapeli <mikko.rapeli@linaro.org>
 Date: Mon, 11 Sep 2023 09:55:21 +0100
 Subject: [PATCH] regress/banner.sh: log input and output files on error
diff --git a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb b/meta/rec=
ipes-connectivity/openssh/openssh_10.6p2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssh/openssh_10.6p1.bb
rename to meta/recipes-connectivity/openssh/openssh_10.6p2.bb
index bad22b879c9..24a91029492 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.6p2.bb
@@ -25,7 +25,7 @@ SRC_URI =3D "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/=
portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-err=
o.patch \
            "
-SRC_URI[sha256sum] =3D "a9dc9565dffe8640f64d863cd29a32bc4a3dbdec0566a7fc44=
c5d6ee767d5f39"
+SRC_URI[sha256sum] =3D "9ae44872090cf2f06b3cf9ff147e7f16f309671340763ed2f9=
9248398ae29d5b"
=20
 CVE_STATUS[CVE-2007-2768] =3D "not-applicable-config: This CVE is specific=
 to OpenSSH with the pam opie which we don't build/use here."
=20
