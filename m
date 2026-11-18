Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.119.1795018092285151700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 08:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nluYYywF;
 spf=pass (domain: est.tech, ip: 52.101.65.25, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szmoI7LQKL+Nbu6MM0L0I2Id6eJq7Y0AATFxbJiAH+PvXjiBHh6T3z7uprWszzI1TRiS8rOh3mRVZZV0V5Iwgkjt3k7V89I2l6EDlmN2nYabsdapjFI48obIKlzxeEYGWjenX9B8miiS0MapOeVW+UBPfQ1Z/k3fKdss/F5GYbyyct+YD4JawnbAOhkNvujRDevZrvrnH3cBFZE4yL6cVtNWf1HjonIPbse3dnnqiPB3plY6hZGoFlIerpl6Holps2KqeIqNue4CV9PApec9AEe9pA4gZogz8o2+vGDUSavgaIKhx5Lzn0FUjBQB73xXQ1S1L1vzJi1eKjj/kpAxhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/s8iSMceKcaKwSvMX1Db6Yv9WC7G/Bj0ebUpfHrOLyQ=;
 b=Yqt466mg8D4vDG3aJu2jK/DhusgMrpJLTFgo4hvIPE9tpX4k6cNx/70Zp4hefK6FK6DMPQaF/0ADHdQhRYt4a9qAJgnyW/SFcZz+I8i1iEG/7AuiBiFM/ZVL9auQI+emjl49DIikVhp1TWUvUqvjb6b0hUfveA0qOpLJs7Bjy+FpQ0aCm+cOuhYxPKsewYzIzITldnQPvJ3nN2QFNqQxXgQk5ZVF9BH2DAsaDgDo+eRgptLCHAJ6kZcgzRth1qFqOf0TS9rGjYwz5vOosdvAYmgKjd8AM6cj6U1d6CB36rlA1KyfOYHLTjqrzEUCb/60ylFsHy30HeCnxk76EHb1GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/s8iSMceKcaKwSvMX1Db6Yv9WC7G/Bj0ebUpfHrOLyQ=;
 b=nluYYywFk8GfqIYh7fpfNZG0zWf7HTXWXCD58FKrIsqeMWwOj0gEaQGESmWx/IUWfEaAi+hWwbP+Ejew6OgRoP6HQP75cxoSp3IHb6AF7eygOFl8sLDOPx9fjKobRdcC1yDiEgF5hp+drlTMlVwjmvmHXh6m8nAhAtOu1/oylNjVp6/6qjrfyumeTtVp8nnHQG/OADB+nMMSeuJTeH9ckHIJF7UWZ6iX8micC2ftj6efbt+xv7expKawuNBOAsB/aEMENgBfASUuESaqutzi3aUszaaNU32AEVTYOibGPkU1ws3Ssq9WZHR+39hzc7pZe/zvNSgFlCBPqirvrIz0Eg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2372.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:47c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 16:08:03 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 16:08:03 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] gstreamer1.0-plugins-rs: drop S override and fix LIC_FILES_CHKSUM paths
Date: Wed, 18 Nov 2026 17:08:02 +0100
Message-ID: <20261118160802.24904-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261118063416.18496-3-jaipaul.cheernam@est.tech>
References: <20261118063416.18496-3-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0141.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::11) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2372:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b774919-0032-422f-0fc6-08df458e2003
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|261009223027099003|261102123227099003|10067099003|261026140227099003|56012099006|11063799006|261021123027099003|261021121427099003|261009223327099003|261009220027099003|261009221727099003|261009221227099003|261026121527099003|261028144727099003|261022105027099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GIGpV6L3Y1ecA69F28f4E7PK8vMMQZY/utMIrDO+9e9zRP5FJ+DaNIMM7ThPJlDEMOt414YxhAgpzXXImR2eaEPsSl9yli373ZhfUi6ls9JLN4NoX8zpz37Qd9J7dX8sHDO7SS7VnX5ftMl4DD2K92GpR6M4yzuzDuncRmAYTli4D0iW7bAJF468mVfMc5OTHYFjoKAo/jky8N5LpD6UE9rfFNxMSQueT+ntuL6soZjkAq1mTnh51Kb09DyxCngaScEwJ3GmCBUHaHh83bZifFY8hHPYWElpbUzk2nHjA5HXOQJPKwgAsiGWqxmbX1rtan67zI5WOakdq1vQhPUN5TavrUwQ/gULpiC3z0roPLTCotOzsKqPJ4d7fU601B3jip/hBIeQ02C6UW14VWsnZyx2g8s6mQLPwUEu0eT82ximZ4Nh7zKE0CcNQztrzf4B/K5XqoYk5U5bDmtEvaifyf7rD92MiQi+AlkZNw0D4jqoDjkDYALTPYzDhVL4swkBo6yh6nWrpE9I/Pn/8ahbiZXjxbO3cKqtNJ6cCIZmSxB8IzMKEg20Ur2COoItnq/+RaNS/PI+BSnPsZY/mRyLd6RHAFSwr5GYu0gx2mcld3EaKRdaaV/ZpcZrd3Ib/mxMxYnPlrqn1WMFzoStJYUZ5hAbOIS6dBuJb7FWBz1Uasc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(261102123227099003)(10067099003)(261026140227099003)(56012099006)(11063799006)(261021123027099003)(261021121427099003)(261009223327099003)(261009220027099003)(261009221727099003)(261009221227099003)(261026121527099003)(261028144727099003)(261022105027099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aVCyrli5T7B9D0sIE/y1ar2KF2YF8NQ41WbuEpXNhs/ajGp8j1X8DVXB2sXv?=
 =?us-ascii?Q?947sE4NJmMOBKqRykcybxklo1flMwBWw2X6QAk24b/iaoixcvCvQLk9tKPZM?=
 =?us-ascii?Q?iQt0YYQv4IP4DAMFZZUdlPmUmqeFLLRk+AHhTgQQD2XA7zLb2NLz5SLS7Rkm?=
 =?us-ascii?Q?a4b4TKrZIbGNpa5RdVPHUZAfAaAjZH9rB59zNSAUU8ZD+KMZdmtAv+C8e/89?=
 =?us-ascii?Q?+u96c5A8bMdT+o5ySA3KxG+mwMnLRVOzj0G4asVdqYQ2YtbLIyqHsYMjpRve?=
 =?us-ascii?Q?e+oaUKwifKubgFTBrikBipoZ92QlRSYZEjyrgPwkmpZ6ZBCycBcZIxVdESFV?=
 =?us-ascii?Q?BqmfRxnE2MXzjT9JsRCgCWMdmm5vdbPQRYIwakK0oASqGQkUqIKblULxZWrb?=
 =?us-ascii?Q?DuM49YOB/djcs8s4AEhmu7DuDQPlbLQe+A/vfCUWCu1BUcYr2ixqHZ2KLxr1?=
 =?us-ascii?Q?arSkooPF1LWMwYNJrY1egEsfSrLbxR0wo6ugra2AYyVGTCKrDZgIZVa5okxS?=
 =?us-ascii?Q?yKFQDnnM+y5WDbrpfqqNm5oh8GIdSZh63QzS655XZcU6L35nzyrbicMqdOcz?=
 =?us-ascii?Q?bjrtY+BZO+QDL5WxNNN8mEEEjO8eJe5wcHcXQU5/ChWsEIKmeNNjJAHHwiHk?=
 =?us-ascii?Q?X9MLVo74ErKGkDFhe3lv8em/kUYjP4i47FXAySyaSzIv30x+aomVEXSD8b2M?=
 =?us-ascii?Q?F1H8eavqhyxaRLnsqFESHBhcEZvqRMic79SVgT+zKUQv1Py+NM0lqGSt6jMg?=
 =?us-ascii?Q?vs8BlphIVdVhdv8CQu+L1DdkY01zhxiKVVYHihdjwika3GTv6MNsa2Xuh7Ab?=
 =?us-ascii?Q?tKIItMqdw9uc0y2gMPkxNNkL/2u7o/NXKPZAq2h0PdkJldCo9A5Jh9+p/FHR?=
 =?us-ascii?Q?ksD8ENDErWaMewzGmg8pywjPhS7y6mjgX2xq2Pm+s7ELUXoqU0+CPuAZ8L+5?=
 =?us-ascii?Q?mw7ftQqp2a/eIEPeg29yBWCYyTC2fdlRDarb08fUOu6ZEN/DGiJzfZ9ALP1j?=
 =?us-ascii?Q?uS7QYxTwt+p6PAd+LIFYcBoa2lOcHvvFLPKfmERe61K5T2z/YmCv89q+836l?=
 =?us-ascii?Q?hgfzJjqyzshAq80Uk6GN6ADWo37yDtWmE2gSVwSAHQ3C/J/ZcA54Ye8xM6p0?=
 =?us-ascii?Q?lFaELwP9Q56jDvslWJbFBVRsyW0QMj+Qijn15VU79hXZ7euWIidz83yQY/7I?=
 =?us-ascii?Q?NMX+EDT1RVh/yM2dJ3zFqk8YMZqnlgAZO8G39Z0ZsdM3/bG3iyvfvjhDQJ1A?=
 =?us-ascii?Q?wW9uIGiyzxXhQiyf/B9xd5b0mqjnIdDY+fdaCjihSXVTAuaFIm/tXqH30QSW?=
 =?us-ascii?Q?fUuvbkw4lXIr0cvSDMy3XRJLJ8nifnsiaT+BoDlh8xpGCnZ1V9LbJYEQFlfX?=
 =?us-ascii?Q?sa+q1HVL241cReZh/qFS2gGpkFvLLLBtqK3n0BOCHsS0//gqXH5+DqMLvB2i?=
 =?us-ascii?Q?to3Fjw+g6nYqZ/gn0R3fv1q9W2Givx0UGWxOR89VxY/CrSIuOb8w24JKpiDz?=
 =?us-ascii?Q?XWvkd4/pUOtf3LbLQtsoPLe7GGBn7WK3xcz0gPx4gjLgUjYpFTI3yKX+U0Vb?=
 =?us-ascii?Q?P/2aguXwpKTnDHwqHPancA3LJ3/Iqq3V26A8tuitHbyEr9/0Sk/chIrRKriO?=
 =?us-ascii?Q?tc/lguKyWav6jkOswGihApfhD4dKUpRC6V3exm1/iXd9WfWk5eJ+xnbW9Y2B?=
 =?us-ascii?Q?pzbBIV5aIHG1y9NMKc1imbffWooQGjBT/CC4yTZ/Pw38aZs7RQEwCGaRfBPL?=
 =?us-ascii?Q?7u+vO9HmDg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b774919-0032-422f-0fc6-08df458e2003
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 16:08:03.6014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIWXedkkVB1t2pp38LQ0RrVFw2wg7eNLLx4g1ZwFQQDZgYdQkWfo9fD4tarLJRMkvJy6DdCVk7sFvmFR/1emE6+3DZHAhiz7axaMoGDHbBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2372
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 16:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250569
Content-Type: text/plain; charset="utf-8"

S was set to ${UNPACKDIR}, but the sources are unpacked into
${UNPACKDIR}/${BP}. This was likely missed in previous cleanups.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
Changes since v1:
- Drop CARGO_MANIFEST_PATH assignment as it will set from class

 .../gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb            | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15=
.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
index 294e3373437..236b8e8699a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-rs_0.15.3.bb
@@ -10,8 +10,8 @@ SRCREV =3D "6302bea23b53e6461c104f9543df887a63b2d6ec"
 UPSTREAM_CHECK_GITTAGREGEX =3D "^(?P<pver>\d+(\.\d+)+)(\^\{\})?$"
=20
 LIC_FILES_CHKSUM =3D  " \
-    file://${BPN}-${PV}/LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab12=
3dad \
-    file://${BPN}-${PV}/LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540=
542 \
+    file://LICENSE-MPL-2.0;md5=3D815ca599c9df247a0c7f619bab123dad \
+    file://LICENSE-APACHE;md5=3D1836efb2eb779966696f473ee8540542 \
 "
=20
 inherit cargo_c cargo-update-recipe-crates
@@ -45,11 +45,8 @@ DEPENDS =3D " \
     gtk4 \
 "
=20
-S =3D "${UNPACKDIR}"
-
 # Remove the `flavors` and `ffv1` plugins that are not actively maintained=
 in the
 # gst-plugins-rs upstream
-CARGO_MANIFEST_PATH =3D "${S}/${CARGO_SRC_DIR}/${BPN}-${PV}/Cargo.toml"
 do_configure:prepend() {
     sed -i '/"mux\/flavors"/d' ${CARGO_MANIFEST_PATH}
     sed -i '/"video\/ffv1"/d' ${CARGO_MANIFEST_PATH}
