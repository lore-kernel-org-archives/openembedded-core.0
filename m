Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25270.1794827826394116264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 03:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=yG5/L/mH;
 spf=pass (domain: est.tech, ip: 52.101.83.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w6rZdwE46H45H/TPJtgmSwvwWpBg4LrEWKWYrardATwi9xmwUFvjhe49XWQ6G8i0yYWuyB29OmICle7qk6kLdEGzgUw4rWWvcRUcu7XZhc2rD6y+HXtXwSHZn5a5Os+ExWK0HDXzMMeU2nPQiipHXkJVYNKntYoJ8dt5AbzPIg0MhG5Lyn8f5OD+ENdzQeD04N2ayllHfNZq71f04KBZGQLRDqN0XFj79dLJvRaqBOeyZF6s1NixcvSAF32v4gwaQltarJhCVRG+6V35d+FWkaxhcN3AHtzoDYI0Y8eIumEGfYue/yLO5xoLXTRNGQa0pgqkmbQOzTPRG1OcLrxXbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3ica+8TxT6bjj2n5dXf5x1hAoCck2v3yhDZaGVnOvE=;
 b=xGbohiStuvo/mbPDS06Fvsg0Jcv7k2wwUaI+O0cIIzzQbaMZvehFBaSDyQpXAy8TwceZYtvwq+EJTJ0ENOs3SBedNkMOKqN+NHT5HoP7YuE6UC5kn0f2bD0R2yt6ByZ3D4NxaaJ0TCJPJ4PXP4emWnKHjFHyFyWH5kugPQGakLi66SqnJg16YcW+YyvRZ0LOWq52qUvkj1PrrRDtzyf+vARZA9em+X0Xjo2Y5hDqX0ocvYRE9fmpUjT+j0EEU40YjEaQ6kEm//D3OdPmccnmyMb5MifAOo+y5mbWI5tGxCXN6mMOiDmFqF49VcqRDZiAXBmpo1ss+c9RIsuTTz0zTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3ica+8TxT6bjj2n5dXf5x1hAoCck2v3yhDZaGVnOvE=;
 b=yG5/L/mHWXGw7R0rNvLfnQzoaoWYS1Dow5XpJKvunWjLywTxuQQBYjXOMdGkZndNjmiSkrwhnYP0SkGf+6L/MRiJWzXgIvwToHEJPFOnvrcjq/s4bJZH1t4BECU3wcs4yAHQH7SRPPWbMHvDkPSwi0RoVHnS7LurKXjNvlyQWNSj4nTdn8QtWcQ5u41vtfQHLFRQvDgtmYGBFqkZ57RAxphht7cvDwz5XaKjAv1ECrImfmWjgFrqYddbSzAo7aX4bZ42B+N2P7pHUqs2BD1kXd446wdzwsNkyODe0grD644lB8CdyhZ9UHF4ydLEM04c/QmABJ4583YB+6n14CyP1Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB9P189MB1980.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:37f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:17:04 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 11:17:04 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] utfcpp: upgrade 4.2.1 -> 5.0.0
Date: Mon, 16 Nov 2026 12:16:50 +0100
Message-ID: <20261116111658.7745-3-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
References: <20261116111658.7745-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::12) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB9P189MB1980:EE_
X-MS-Office365-Filtering-Correlation-Id: 5473fe67-651e-4d0a-10f5-08df43d324a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|261102123227099003|261028144727099003|261026140227099003|261021123027099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: wwm37gpaEcrAh/qYkGG26NX8QNgeMqL7aMWVZe/xz8wUZVyqLb7H72ySM5Ab00csX/PdEtx8TK8PbpV0blyfUUaHKD3r+ewKqtgAV/YiPYMH6RYLmz6kpDW3dRb53YTGZXWuV/EwXXlUJQiBVrRI1OHUi6JHzmxWuFk8aaxzEWtYHs/ZSK4wWpe9QXnVnfgbafpK6H0f4mb/EwI6ilHqnGGOHqib5VqZMM8Zlfqhd9PUKZ02sXVgcLEG4rJ2j8ncjZYheTJrMjM8O5M2wS1DB3dQjw3RjXTll8KSJ7ylxz6yJShQP9c+E+1rrpPz/0opZHMrk+5DE1lgLkFBBIJ5L6ZjaIfrMQ0YAGyzx+sE2r172PKQ6ipfP0sX6oju9u9JEzZoaenb6CeDX3igartCtJVM8/ZYIMf/Ma+6xBVLBkYt+gqEKDA305OobiMt769zSCuj+LC4qBFbT30zqg15K6YoT6Md4qcJXrAC+QL5G9a+l00D3pV2Hd3s980QkOV9clQ+tVMRf9PLuvKAGAJPYxCBYiHd08ZacQZlskZIVreNtry5yTHQkWZfpMWzcjJ92AY2er4xPZ4+co+rdmQh1SYlkk6rHYZ6LqQZS1rvKH44Xkp9mCZg2K42QhWeY+QQiEhk3TiRspa9stKvjlDf65+6qtDHvzUExQUiF+qFTCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9bRlTMudcNRbrd9wr2hAZFkAcDigan1Xbt0zmaiOmvp2Sk+pz+/TmrccxaOj?=
 =?us-ascii?Q?f5zMVFU8OGXJrykm9rKFFHbIJe/QWAHkyGWMyMIKEpTKkwf0NR7nCYifaZ2Z?=
 =?us-ascii?Q?bk4HfCVYqw8Z5/bGabDAqP7c2hGAq3luV0dyjS2TuGPb/X8y9RMuZhiflIMp?=
 =?us-ascii?Q?srmtQizunbH59qwJvlM8WI/5OGOQocKm6Q2ubjFdvgCE3fxljfibC0brJeXf?=
 =?us-ascii?Q?dWZcubtH/YcQuH344S0ho+eph2AG4bslUGsgxzTEeoPgRWBHH7YskpAEeIDk?=
 =?us-ascii?Q?HVOItSequ2f8YDqhMPCFqemE0LbvpP/pwsf/UadSmJkezUNJBAVKtya/FFkG?=
 =?us-ascii?Q?3pLieXMq0lmX35XFUvuDRKhF6YuJ2oET0k7OKKRSMmlEKez/BGx7f9MvvQHJ?=
 =?us-ascii?Q?FF9gmlzN2tiiAvrvnY/nL1eRv1tDNpBNux+RfLSdQAx+uoogHzVzo/SjalfX?=
 =?us-ascii?Q?GwwWLdq2r4hGQeQIBqH0piNYiVPmOjsfHdmVniePbyU/NZC4hqNACwD6jNU2?=
 =?us-ascii?Q?aQpkXDkz7upFDXjTCSWhJTG8rKq0JlwnYNuKP4QFvqv/wnAufoDluwMky9N1?=
 =?us-ascii?Q?hIuVmJBwC0ChnqwlC78zaDCd3fxbWVKHANfAo1jtes289KmVViRJ3tc7Xzvd?=
 =?us-ascii?Q?Ih+LDd11K+NAyYr+yXCBgxiZKmWFpv/GSAwKZ1Chs6DSATZ3VuKjfH/csjcV?=
 =?us-ascii?Q?2U0dHIYR2B+/1FqSPGLJG+OKO2EeTzjFooQx7612Zkdl+3/p98qW90jCevoU?=
 =?us-ascii?Q?R8BAikeZ2R3JmpfvEDVqbqvkgEEaJFrMe+tHY04PcBq813D6y9MgKHrL3dlz?=
 =?us-ascii?Q?8pegfNhGJd/d8KUWMv7ryWQR8yKSns/Cd33xLuYbgH8rzMUaSfPlkowDken6?=
 =?us-ascii?Q?hiHTUL62ch4IB/OxBK1TocGmOQBNiFcMP/Y53LP7kuj5/r3tmCnImspuGH2N?=
 =?us-ascii?Q?IjN/5qNQmXi9jUz1ddzVr6Q6M9GcccC+exRgD6qE98Cpxqn0h//BErDwCyhl?=
 =?us-ascii?Q?FMOQ7jskHlP2IztpltbIQM1xvYq7eLHi2tLiT6cj3bLGmrCPpD1roG8ZVMwq?=
 =?us-ascii?Q?VvugE2D9dwICxXkne0mldMc8b7X7yvIaPTG0M8oZ0O0RF1uob4IyHJckMNPl?=
 =?us-ascii?Q?n1XH8t5GbNKCL3lRJBK73/V/ZwjL6FNHlHh4vS668Jg4VthbGhq+8qSM5/YW?=
 =?us-ascii?Q?w0dNEf+E1XzfUZwir3UKT00F0aRoud1wp6vosjp3fZDFWqEfPrii9tQU/pP2?=
 =?us-ascii?Q?EfG3Idd9Pgt/dA0Xu1AnSAZUXq1WPK3fw2Tw8zn6saVFclirgobPM5npOtFe?=
 =?us-ascii?Q?9HX27C9HRqmyfLKskVzUTuend2z1xPXxx0hZFxo9UpDZ9kMzfAcY8ZgDqIT2?=
 =?us-ascii?Q?U3fTMHwEeclHzBvp5P3wdC1XmZB284DjoaQtkKQHCNhvr/WlTDFzO6BkULan?=
 =?us-ascii?Q?xskOTDRFRblaRMYb8IGP65kqD9nySSJq5LMZ007ofkkRUZzZ4rnrz/K2vtu9?=
 =?us-ascii?Q?Zo70pWn6TU0enx79JdvZeOezOwY329bcUGicnPOdWtxn7stIJJ9/qzfun9sl?=
 =?us-ascii?Q?0ZizycmfK6iDwcaB+b2X0CY4k1+cbm3rkukOtc96iaQBF3X3XtoQ3IjHpDEg?=
 =?us-ascii?Q?+cF8nbGbN4FOskAg9fKflzzHqoJQ2CBoahIJv1r89uGAvBotnhI9i018VgiU?=
 =?us-ascii?Q?BVGzhMj3danITLHhxWyw8iSIu5/IMjXqgGnwqCUjt5U6nsuISnP4Cw0SakBS?=
 =?us-ascii?Q?a6BGfVjV9Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5473fe67-651e-4d0a-10f5-08df43d324a5
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:17:04.3100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jCK6FKzE8WxY5MtVa6O7ZkI38Tjug+f4vQNXEBjGpuwnrLpy9kh/g2eBoUNcbPF5x3ni4Zv2jhNZDN1+uSxxkTxKdWi8+esjBmWD6nFO0mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB1980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 11:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250330
Content-Type: text/plain; charset="utf-8"

Release 5.0.0
iterator16 - iterator class for UTF-16
replace_invalid16 modern C++ versions
advance16() and distance16()
prior16()
peek_next16()
Fix -Wcharacter-conversion in unchecked::next under C++20.
Modern adapters for "valid16" functions
Checked replace_invalid16()
replace_invalid16() function
is_valid16() function.
find_invalid16

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../recipes-support/utfcpp/{utfcpp_4.2.1.bb =3D> utfcpp_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/utfcpp/{utfcpp_4.2.1.bb =3D> utfcpp_5.0.0.bb} =
(94%)

diff --git a/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb b/meta/recipes-sup=
port/utfcpp/utfcpp_5.0.0.bb
similarity index 94%
rename from meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
rename to meta/recipes-support/utfcpp/utfcpp_5.0.0.bb
index e891b7fc57..5cfdc8d40d 100644
--- a/meta/recipes-support/utfcpp/utfcpp_4.2.1.bb
+++ b/meta/recipes-support/utfcpp/utfcpp_5.0.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De4224ccaecb14d=
942c71d31bef20d78c \
 SRC_URI =3D "git://github.com/nemtrif/utfcpp;protocol=3Dhttps;branch=3Dmas=
ter;tag=3Dv${PV} \
            file://run-ptest"
=20
-SRCREV =3D "3d1ff6dbf54e471c846dff55dda6c8ee10c0ee5c"
+SRCREV =3D "3218d78a228e45b362d5b499d8dc9f60e6ce2e59"
=20
 inherit cmake ptest
=20
