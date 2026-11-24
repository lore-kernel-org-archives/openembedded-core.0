Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14142.1795510425247227134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XQu5j53Y;
 spf=pass (domain: est.tech, ip: 40.107.159.45, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygxyTZJZoC64QR/xWXb2QpyilmsnkVRQMfjUXzbkTEofoG9jYredkkJSmSbkYcsDBWD93ftlqejJQ9Pei4i6JPTMICBx5oFh19hv8LxOXYWcNA+4aOPSGGN0I+Lnhi7GxxPkMmz9Qp55A5xhhOJGBhgNYL3Qizj6A7s3TYI1qAUK4UqeC/P5aFQ28qFqcgUmOmKq1LgpZOm7yjjTG9dzJbgC/6zlm348238+5obSIidvF2RiHjMFOzmeRZOMF2Qdf4lg4zysxFgxha0ZQxGaCDwLlYYt8TR8esOm41LoPWt4UcWaXJT+TGXdDPHMQeGcIyO7iKXB/9K5xRsOR6iTnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwSpEieJ6guJH8q2HMh+FFN4vbQnv5cUZPy8dPmgZuw=;
 b=RS8Z/vvHx4y63kPvDGCHEf8ERVBV5j+A2IpIVtf7C+CLD2tt2vM/JTUy9T/Hl2YN/V3RsZxD+X898ecHiHcUT0VH+g1XiakUp81vE07ulvrlKigc2NHVRGCayAZJszRHAK5ptndq4leTLPpk5Je2aXKe1nBJd8U/EeYzed0DADMNy3iNtbxJpKMUeOhGUM4/APTmSfpAqBtMt8FyPG7PslrBqGdfIoU3bhGI9mSmKes7+oR9WqlAa2S0FSQO8b1lqYexKpvDv3xHkxXsVM5QcgABBez7yfSN6AYxNniHNKbszPDiqgj/TspsvnMg4bRyvSO+OPBh8XQWjNn9DrKU1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UwSpEieJ6guJH8q2HMh+FFN4vbQnv5cUZPy8dPmgZuw=;
 b=XQu5j53YjvNtZjX9uF8ZsqhN7HdO9bEmn9itPqBHFqgX4TT86jUePze3Qf4QMuuomQ6YoWxtxHYVqgLVC1w2a/VYxZuYaRGMxk1RhxKM8V95//GbfTT79BomVuJQWQ+0364ct50rz/w3Vu4YOUiSA+lbCH4FK7R/hmofS+0d5tyaSC/yEWB9DLYTUetDjIeLFoj/gnnqisW4QCCidEJkkhspH+6+nM6p/EF6nXwQp1g6lIs+Bxah8Fp4w3vvgW5ftPMpnef4NO+zJpxmqa60qYj6oUOp/6gL3StVqRt68xWoU8C2onpzhZmtrxGYFgnUDHBypyn2b3QuS7j56qtlBw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by GV2P189MB2211.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:7b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Tue, 24 Nov
 2026 08:53:38 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 08:53:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: adam.duskett@amarulasolutions.com
Subject: [PATCH 0/2] dnf5 patches
Date: Tue, 24 Nov 2026 09:53:33 +0100
Message-ID: <20261124085335.68851-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7PR01CA0041.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::6) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|GV2P189MB2211:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d09a42a-a403-491a-1ddc-08df4a086e5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|6133799003|261009223027099003|11063799006|261026140227099003|10067099003|56012099006|261102123227099003|261028144727099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: g7hPTNcPCK4VQ3rRa8bGZGm4CAxcH7x8U6m8o8loaVcItiDf1nOPe2cBlbCej/EZUMqYEPapFA7HznyubEdMs6pkXQsuNePeHww12duPKGAi8HkoACM+t4jplBy79gK8IyoNq1IXIHYL19eIP4REgETdqRHcvagz56g2bm/WkUVEu9J5nuSGN3ipp2d+WTY1mYx8lmOzAGVJBL9RaQCcCmBcQ/srxyWiwR2zWWqWVm2GZE/KBNHP+vuoTzluoza3SsFfBS7sn3kzVVrt8gp+SGRtwxpbddZunK0NM55x27X5Iak6ogdIyqFKx+jNY9jvDujtEd/LiLvlv8BMlqgdp0W9Ad9NhXnaZmkG0UJsnQvXJwSLIrIumcnwnXGAdG46kEDmu3H4eMgWUA+2KVHa9ee4+nRtmEgaFO7XWEDeiw1ZuddrK7qxk/OSpgAC9WPuEpcipVlv0WZ/CDG4+eDk/64fag4RE/FRzMRhV1kyKT778QZU60+bN/4tX41nxAR62hTlAgx1B0dUdULpoSAcDtwInbaWO7VBp15pl19g+DH3rTMmAXU7z6yvWSnY6wju38qSOrPK/DllUau5W/34XWG5c8iOj8EObLQc4PcB3F34aLHemPobgmo10OKlkJ3Owi0VnjkDn5BuY8ZxgSehKkzvk7sRXtghHqNNOEl24HM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(6133799003)(261009223027099003)(11063799006)(261026140227099003)(10067099003)(56012099006)(261102123227099003)(261028144727099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmT/4Nf0KZ/JIPmxCJrD0REEs9djhAHNoZKia4WGYncKN80axNSJ5Z57Xwag?=
 =?us-ascii?Q?3cQ03ei+omlnqgiwH9NOLyOMIpTKHlyceVMznbpqMPI5+T6v1u328o8g7hVJ?=
 =?us-ascii?Q?bUKkyiZPWQNoUCckMWdbNiM+J4pt0iZ+mqgZ4O9SsmPHsoUTXwjEq53Am6zE?=
 =?us-ascii?Q?IjpDuDGnvCRtEDLLwVclMt1VevyKSQLuiBoTKQf9Bjqrk3dgniVUPEKBYZNl?=
 =?us-ascii?Q?Pdi7j4Mm2QxYIWATRm4XHMrG7ICOMXK8sQ1UqrJeM5mMijDYnVOSsIrRSooE?=
 =?us-ascii?Q?CGl/HOLpyLQME1hgBfA0nfj/X4vA4UQucPuZD35sHISNJfZnPHaCJnAI6+w9?=
 =?us-ascii?Q?GAUlS9GxyCOQqmAU7Z7nERjgLHhm20sc2i+jTv6pFGzErMAwOseytsLlT1Z2?=
 =?us-ascii?Q?lXR+4OoiBxLVfBH8NmgRbgb+tYrtmd090+YTtmmGkav1aMzsHXc4+gMbnOX/?=
 =?us-ascii?Q?p9PgM3DX8dSaC03kTOMymvDLrBrY4l+tVoc6f70U1OEUeUptxJyimgdLfi7l?=
 =?us-ascii?Q?BR5mX2pREw1r0Mz2VMbl4YgVZDYHSWlA0AUrtPm6uaQ4xwdrHyL2oHHzaosO?=
 =?us-ascii?Q?SGzVJtZeegAY7cukeiN3xBt0bqySYt6VgJojeVqMiOR0zx+aSB+o4XUXFeFW?=
 =?us-ascii?Q?6Jl+AGszdHUaVPgQAyFI+iQHVoi/9gCd+7mE7vgEzv3CLv5c2pBf+nYNYVbr?=
 =?us-ascii?Q?9SyptwuUXHF4gFaf7a9kgXkpQWxdlxufdytuGAw7c4vkgAU6Nqgv3o8lwUEn?=
 =?us-ascii?Q?6bXokBs66T0cyxApQeHi+YAjt4iLse+sEWz+iUlwiRE+wFsx65B5VppOOt+M?=
 =?us-ascii?Q?jCovVX5scjXBQs6eNVLtoBm6QqT/vK24r2UvAurmmB5+zVQdQSyT+2kWP8fG?=
 =?us-ascii?Q?KUMGRYGhu1c17Lx6sCmF1lFUVsyT5CCpUEAiKuYyoHQrdSmW8xpNBuhVXsVG?=
 =?us-ascii?Q?euIwwTkfQ2tXuitDbVsF2yT/e1USYq2CKdAIFzK7lFczKQMcZepN61YcsLFL?=
 =?us-ascii?Q?V6jIVENRmUnWOeveE+UYPrwuw65rNB3q+hXTSw27ErvSw1ckNvTJFXug9Ami?=
 =?us-ascii?Q?/OVmFCv7z1Ft4/q4Gv6XftcY0doqcDplUICkQ93qmIIiNQNePfXArb+iXpNn?=
 =?us-ascii?Q?K15oSIGoSA6Lcj2g3XvGi9XC2ny7guq5KfkwbFKE/teaqeGr8EwD63tt8idm?=
 =?us-ascii?Q?I85/7q+RysR2VRYi9CQoKky71jZrWOdJi3DuZ7nvppWm+9QpuXE6qGQZq+HN?=
 =?us-ascii?Q?v2y7bRhE1CFu+0stQyXpmJSU1RuIELfIbbKDxVLL4G6c8TDLZlG+4ZFObRqE?=
 =?us-ascii?Q?Rp+pfUOz2eneOELdt1gqlpv3dZNJvmVEucgc+kub5bTL3GhcpJ3kI3BFQWCl?=
 =?us-ascii?Q?Bo7tH4dm9EmgMpeSoeaCWU1t98uhcHex6O57xktzXcAd2LcpxmtZFzc/t50u?=
 =?us-ascii?Q?xkqwOJg5aAJNQoPFpdiKmdNVWfyqYVL/NQbM6nhxwQmC8pyKl9oMb83L29Ji?=
 =?us-ascii?Q?AjA9R4i2z/XcJlTY3Ly1VVwS6cPDSjKGzVDGNJTROgWXyB9DbZGQLWAnUukL?=
 =?us-ascii?Q?S3x83P7BQREQqdBBOeZCUrlSmN1JBUzNlfaOoRwgFiGTYdzQGCikzy9t91Rh?=
 =?us-ascii?Q?gM6DWF5xKEftkFVsqoZcFfXHmqpKO2WxuIwzW7z6Rg1bt1NxOk3V4NyWwmVA?=
 =?us-ascii?Q?iGDi369ZDxFfUSUmZOvTCE/oA/6b5aqS4ieAmCw/rLnQY1YYo8HPSvYaqXrP?=
 =?us-ascii?Q?3IrCenOmmg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d09a42a-a403-491a-1ddc-08df4a086e5f
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:53:38.3516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdMg33SpxDT0YxTs6RxiOPzWyxo+pNZaW0T9mAvDTgYYOqi0maSn5VEbNh4Jht/4cFvy/rgrGs4Ewh2THjQ6y/PWrUznhEfzQmDN4Q93rXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2211
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250979
Content-Type: text/plain; charset="utf-8"

Jaipaul Cheernam (2):
  dnf: Replace systemd unit dir patch with EXTRA_OECMAKE
  dnf: Update Upstream-Status of bash completion directory patch

 ...rdcode-etc-bash-completion-directory.patch |  2 +-
 ...-hardcode-the-systemd-unit-directory.patch | 29 -------------------
 meta/recipes-devtools/dnf/dnf_5.4.8.0.bb      |  2 +-
 3 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Do-not-hardcode-the-=
systemd-unit-directory.patch

