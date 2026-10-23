Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4916.1792754996519089873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 04:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Gp6l0aYD;
 spf=pass (domain: est.tech, ip: 40.107.162.66, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyBpxyuf7LNWtDcIih1Gh2bn6mw8nN+RTQ3jQU6L0BXavSMBfDu0lAHnye9p5+HA0MX7L/U2P4w3R47jSL/q5Plxa6g3+5y90lm1HXsEcYLyH+mGPy781Ciw2Wx6fjo5ys7ePRL9ZyZykNQiNqRMhjBMTG+7HxJqIoFlyHhc18GoHB5mii8ffu59RlpZMmdjDugjr8RxE1wRfrsQNsbD6o6nbZgCryQNtInHpDD/c44I4HfFDkryv+bC0hGEq2wQh9x7DzNKP7qC93FkyzhVvhomrH6550BM/XC+3bgTMGV3ujP1zlNA1ddt1yzhPFudYtfbey0iCur1vFqEg9fQJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSfpkPJTcTn81a14Dk7dDjb4uMaDdJX+LFJHY8sm1e8=;
 b=SLEsPBLI4P9I1LQhThX9nJSMaPcxFICrGa/R5DQR5b7YSvAgxP3owr/pKXLRGOhaWAOjmW5x6RSOqmtb+3PfhIsmGR4J9icK/0O/U28URFNWQhRwmfn0qTklbnSGfFIdn4PCmqbOTfHdwcpXsaRczAV+cFYrEXJPrTH6FLl93AJJbgMD13Qe0Bce+4moxPlC5FAwAHRK9Vu1CM8iQIOJAs8urrZnTjBLKXhzzC8yvnngfdHC2kbUIHpJ8qx5F1BZzAdldeTAdXu89Il4/GgJurjYy2HyC8T/SGH7gwYLOn3Wfq2FRUNBliwdbUPxdxvwm2QxPKpMOfX31sZCbkPlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSfpkPJTcTn81a14Dk7dDjb4uMaDdJX+LFJHY8sm1e8=;
 b=Gp6l0aYDsMCA6X2cu9lULZRHKOYNSfWxWLCweAE9svIs/jU2NuJIhCJR554kUgwDviAqU3H5OIW6rn+5nTv8ELHXzjL/9kF64Mp9czZqtXpd2hnuzYpD/Yic2qx3CDfwDqitSN9R7qj7bZBCXHoi+nOcz55vPk2XEDEx50CervxcC3o+8Zg4irRz8JE2Xm/bNzhUmWqbUwgauYoiLmjvoqNLb/ZisTcj7D2O6xQjY4kMfsvuAUc1nEOVkP7BlM9LvXC/yYTMgGFbnjnZsqoiH8CrLhhFMNAAdevNKgFFa9AqpBEzwZ6KkeJ88l8DO9o+DeZvuMynsmJYqtASwb7gsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DU0P189MB2091.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3b9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 11:29:51 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 11:29:51 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] python3-hypothesis: upgrade 6.169.0 -> 6.170.8
Date: Fri, 23 Oct 2026 13:29:44 +0200
Message-ID: <20261023112949.77631-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU7P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:10:551::25) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DU0P189MB2091:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a4b481b-86e7-4dba-4e45-08df30f8f3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|261021121427099003|6133799003|10067099003|18002099003|261021135927099003|261021123027099003|261009223027099003|11063799006|260925021311599003|260925022911599003|261022105027099003|260925021911599003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: 3mOBDfdBYL6JeSB5vHgq0J3Vbey494y74QjtR5YZK6uALf1NN43nl9+qo/7nEi3CncWHJfxEdIKEpJ+1VuTJYOcRnDWndJuDqsPwNGIKZ0m2BNfsWrmM50074iU3ezfjpVBFQATj6RK4ssc5m43GoEyX/Zig2itl5Gdmw+hJiJv2eWb8VNHWTSEDw7bSutyLHjx5D1LnX7t7DyGSKB0iYGPsjvpH2WNutYIqPUkD3gCqoyRo05tiPmpVvZkjCY5xw6XIQb5Y+bQEABy3dS97SK7EBghQYItXI7o/8/Oyicl9+2IEozirl1viFQTdFtIjV1t4xq3h5spWu5XixFKzrLUy9EZ/SDz8oBeTllOWQ77I92r0FbtNnwnI7OrfbtJ7F8i+PnFxiTqB418HN9TkBmT9VCCODUv0xxCIe1J+3BNcNNGNHps52bpk4k1YXya4oGTPS4tZpIN8Ch7vJXJQN8vczwH9kZYI1gWaodS0AuAFcW1KGFR0lvQvY2mBcJhMxiUiIqLpdYXdZXmB4oVuFgs7lCvScCTV6tQU/jPqSyf/HGkVC+9wjECoQxOCATNoT+N8paPIeOVJE7JLekrVPGY9K2cTcRhsFsHY8mCJRzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261021121427099003)(6133799003)(10067099003)(18002099003)(261021135927099003)(261021123027099003)(261009223027099003)(11063799006)(260925021311599003)(260925022911599003)(261022105027099003)(260925021911599003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKwVqtN9/ZHJZv2aPYHK2/63qnbw1yxjb68JZFyUN6d5/2WPY9ammEOq7qpR?=
 =?us-ascii?Q?nIDg71TdgAyLUINt2UDqO3L5H11yTOeJgPke17VTutYBBaPyvVeqOiANErwP?=
 =?us-ascii?Q?NxXjaHqvqS3dycniwxsb61ZlodiS+Q5/4YuwfsW0ba5TIlKJCthnX8wZpbzU?=
 =?us-ascii?Q?9nh2Sef987pZlW0eVRiucjZ+tnBIIdYW60pMzUzPLb4R9AiGeeavLP4ixpr6?=
 =?us-ascii?Q?7GGZIu0F/tlGZsP5NhcOIRDqo3C/bxTM0822MuOjL1UIGbZWOyaK1wERIZGc?=
 =?us-ascii?Q?kQg95g5HsNbNKjjoRlNDjbvLW+fNQRgKaMePg4OHkgqFI5rsUXGqeX0aE3D3?=
 =?us-ascii?Q?gAYjKUlR3CwCQSRSQGjM+jXcsgOrBrZhkHgPs9wV2QW6e5BzBlKv5Vs1gz5H?=
 =?us-ascii?Q?7lIOm2e9DhbPRyqv6ROuHGySnjJqVIDcYQAk6/Jc5KbQOgZG5gvfR1V7kcUS?=
 =?us-ascii?Q?pC1+zyWVbjUVzbTzc9w807DDycjJyH4Xis2PWzXhAh6Y74zX44qAvfxS/idw?=
 =?us-ascii?Q?YnLOgOL5dVmvpkL6rR5g1z7TI9pO98gx7pCYHzvOt7hb6sAVRTaLTzZLZd87?=
 =?us-ascii?Q?aNFF0tPqBZS2aGl/3D3lOffFM67iSd0YI9ORGe4excqlzKM5faBLo8DOEsCs?=
 =?us-ascii?Q?fi956B1LBeweIU1ttN61LY6C7GiSAEGKk/ZC6WqNng7r+PMs4khq5u3ggNBb?=
 =?us-ascii?Q?1AfEZXkcdMyVYwRGlZfD+/dOlcTmfGbi+75MU31mYQ0HIlHAcmpJLgxbhmrI?=
 =?us-ascii?Q?lVoMlQBdHTAwUdwtiZWdCaXIV9fQvizA7SAW8xM/cPGbuc22UeMj6yoHYCl/?=
 =?us-ascii?Q?MqP2Bfv1scnNeRKnYnqjcb36LfzunMPonTlkQq79Az/EG0qUnLPhonA8uMxE?=
 =?us-ascii?Q?dCXTikAMKKX2365PaXUs/lFeu2oaEEkZrNYrTdPlHHUtviVKXvU+b+ylBwLk?=
 =?us-ascii?Q?WtzL+8nQGHOMhS/62S1cW2h6z6cLG1lOecmOC6aMWPIvCOMgK+2P3bvxLFQf?=
 =?us-ascii?Q?0WYVkfOFwGudn4Wil3LZ6vUea5ecixhKhJu1QLIoJwKexG7sIamwn4zXy7MW?=
 =?us-ascii?Q?an5vDtUDlwBxBd0BsNqCKLNBJqXb4RMqqYR6Zu7iOfEI0vgHcVswo3SQNXXU?=
 =?us-ascii?Q?aG5QKmfHo8yb0k7K7bunu86xRBGTaS7B0bHcokjDx1FqQFl2hLY9GS3ImtR6?=
 =?us-ascii?Q?HImzhWpjK9/R1TuFzcpQnokijKQT97J6a9rOjU6bxz3xh5IARr4C8h4PslUM?=
 =?us-ascii?Q?11yO3F7UXz12wf3yUXxVTagFDl1Amf9eQP5ffrh4MjI1FqJ3iMDswCvYsMsg?=
 =?us-ascii?Q?cYBTnL6lmYAzrI9IlUMMLJ79gUzxQHxKthahD3FnVg/9/skxZzURJ6EEQ51e?=
 =?us-ascii?Q?YRcrFCkEw7k390bxNy4L2rLo3QlgoAPTMefzXcya9m/crpKfs4XfXBrl0ayS?=
 =?us-ascii?Q?XyDpWaPrQIVemNvjhY9Gzi9ImLrhlKwIddrrbS3oJuYlm1ZSBOM9w59o8iko?=
 =?us-ascii?Q?vBeWDrPh2lnznsVq/G5DDWkZ4rLrcDCYMljDL0UWoazEHepPcVTBqBhKndE/?=
 =?us-ascii?Q?ro+09pGS6WAC+WzVcmS6oW9ae9zOOJL2SCNHEOOetdaBY8Yn/S4zZWovbUx4?=
 =?us-ascii?Q?vD6Qit0zmHDwX1x5IPWvfXA7uH9PRqUIoBXvcmH8MVFuk4qZtlphwLV/OTfT?=
 =?us-ascii?Q?E7s+nrOgY6OKA7Oxifv4Z/n8cAjRFfYj1gvuzkK6VvduefEbWorewWlIeNLK?=
 =?us-ascii?Q?SG2oYI2B6Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a4b481b-86e7-4dba-4e45-08df30f8f3ff
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 11:29:51.5729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWY46qEb7L3Qjgyj0+zDnxIBVwK3zWRXF8/6GQl0fN45hMPU8pffRwTeAUVyC3k0MuwkH7CaDVwAv2NpMMqDPr4y5sBC7sTcMdBwQt7ZfNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 11:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248542
Content-Type: text/plain; charset="utf-8"

ChangeLog: https://hypothesis.readthedocs.io/en/latest/changelog.html#v6-17=
0-8
CompareLog: https://github.com/HypothesisWorks/hypothesis/compare/v6.169.0.=
..v6.170.8

Tested by running the python3-hypothesis ptest under qemux86-64; all tests =
passed.

ptest results:

PASS: examples/test_binary_search.py:test_insert_is_sorted
PASS: examples/test_binary_search.py:test_is_minimal
PASS: examples/test_binary_search.py:test_inserts_into_same_place_twice
PASS: examples/test_rle.py:test_decodes_to_starting_sequence
PASS: examples/test_rle.py:test_duplicating_an_element_does_not_increase_le=
ngth
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
Testsuite summary
TOTAL: 5
 PASS: 5
 SKIP: 0
 XFAIL: 0
 FAIL: 0
 XPASS: 0
 ERROR: 0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../python/python3-hypothesis-crates.inc      | 22 ++++++++++---------
 ...169.0.bb =3D> python3-hypothesis_6.170.8.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.169.0.bb =3D> py=
thon3-hypothesis_6.170.8.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis-crates.inc b/m=
eta/recipes-devtools/python/python3-hypothesis-crates.inc
index 57a1c2c29ef..8df55363010 100644
--- a/meta/recipes-devtools/python/python3-hypothesis-crates.inc
+++ b/meta/recipes-devtools/python/python3-hypothesis-crates.inc
@@ -12,17 +12,18 @@ SRC_URI +=3D " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/ppv-lite86/0.2.21 \
     crate://crates.io/proc-macro2/1.0.106 \
-    crate://crates.io/pyo3/0.29.3 \
-    crate://crates.io/pyo3-build-config/0.29.3 \
-    crate://crates.io/pyo3-ffi/0.29.3 \
-    crate://crates.io/pyo3-macros/0.29.3 \
-    crate://crates.io/pyo3-macros-backend/0.29.3 \
+    crate://crates.io/pyo3/0.30.1 \
+    crate://crates.io/pyo3-build-config/0.30.1 \
+    crate://crates.io/pyo3-ffi/0.30.1 \
+    crate://crates.io/pyo3-macros/0.30.1 \
+    crate://crates.io/pyo3-macros-backend/0.30.1 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rand/0.9.4 \
     crate://crates.io/rand_chacha/0.9.0 \
     crate://crates.io/rand_core/0.9.5 \
     crate://crates.io/syn/2.0.118 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
@@ -41,17 +42,18 @@ SRC_URI[once_cell-1.21.4.sha256sum] =3D "9f7c3e4beb33f8=
5d45ae3e3a1792185706c8e16d0
 SRC_URI[portable-atomic-1.13.1.sha256sum] =3D "c33a9471896f1c69cecef8d20cb=
e2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] =3D "85eae3c4ed2f50dcfe72643da4befc30=
deadb458a9b590d720cde2f2b1e97da9"
 SRC_URI[proc-macro2-1.0.106.sha256sum] =3D "8fd00f0bb2e90d81d1044c2b32617f=
68fcb9fa3bb7640c23e9c748e53fb30934"
-SRC_URI[pyo3-0.29.3.sha256sum] =3D "700d18fa267b73b9b521fd7e13580e2f446916=
f176cacee1ab63fcc8191f1655"
-SRC_URI[pyo3-build-config-0.29.3.sha256sum] =3D "7b3fc0c4d08f6bb10e71fe39d=
fb9e2f59c6eb6854e22ec8092f50c69a4499adb"
-SRC_URI[pyo3-ffi-0.29.3.sha256sum] =3D "dfc0b8e19df29aad7086cf977bb0c2a2f1=
43e30567eb113e9cf72b62ca698330"
-SRC_URI[pyo3-macros-0.29.3.sha256sum] =3D "6100e8a4b5eba53afaa5ed078364851=
a0b2499c553a44c31026b929049b49dc6"
-SRC_URI[pyo3-macros-backend-0.29.3.sha256sum] =3D "6143877a16e82b5a727b712=
7ff4cd86858a24a28d745d72f43e6f227c7b1bdb3"
+SRC_URI[pyo3-0.30.1.sha256sum] =3D "229ca13b8a15bb0d1487b81ab975bfcd975134=
16499a8312011b6036e42e0de4"
+SRC_URI[pyo3-build-config-0.30.1.sha256sum] =3D "70130e2b6dd1ee589a8788026=
a429561ca5c40fa7a2fa7914c2282eddae24700"
+SRC_URI[pyo3-ffi-0.30.1.sha256sum] =3D "5e7ff73c555c286d212d4ce7e5fbda845a=
973c4f61bd5f160f5f2c3c2a04d1c4"
+SRC_URI[pyo3-macros-0.30.1.sha256sum] =3D "c46d2e5862c7bb8207e3b639f713dda=
3c499933444784154c11d013c5a691b60"
+SRC_URI[pyo3-macros-backend-0.30.1.sha256sum] =3D "38b89f066f2ae72a2aef52d=
1537ca2fcd104440ebfadee06e97aa90738a25b9b"
 SRC_URI[quote-1.0.46.sha256sum] =3D "dfbc457d0c7a0759a614551b11a6409e5951f=
6c7537be1f1b7682b9ae9230368"
 SRC_URI[r-efi-5.3.0.sha256sum] =3D "69cdb34c158ceb288df11e18b4bd39de994f66=
57d83847bdffdbd7f346754b0f"
 SRC_URI[rand-0.9.4.sha256sum] =3D "44c5af06bb1b7d3216d91932aed5265164bf384=
dc89cd6ba05cf59a35f5f76ea"
 SRC_URI[rand_chacha-0.9.0.sha256sum] =3D "d3022b5f1df60f26e1ffddd6c66e8aa1=
5de382ae63b3a0c1bfc0e4d3e3f325cb"
 SRC_URI[rand_core-0.9.5.sha256sum] =3D "76afc826de14238e6e8c374ddcc1fa19e3=
74fd8dd986b0d2af0d02377261d83c"
 SRC_URI[syn-2.0.118.sha256sum] =3D "1b9ae57f904213ebb649ce6895b8a66c66f020=
3b9319718f69a5612a065b1422"
+SRC_URI[syn-3.0.9.sha256sum] =3D "d78c8dee4c7bf0e14673097256fed6142ce9d3b8=
5a408189d07482442145823b"
 SRC_URI[target-lexicon-0.13.5.sha256sum] =3D "adb6935a6f5c20170eeceb1a3835=
a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[unicode-ident-1.0.24.sha256sum] =3D "e6e4313cd5fcd3dad5cafa179702e=
2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] =3D "b67efb37e106e55ce722a510d=
6b5f9c17f083e5fc79afc2badeb12cc313d9487"
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb b/m=
eta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
index 0e7d97705cd..e40ed0d9dd3 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.169.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.170.8.bb
@@ -16,7 +16,7 @@ SRC_URI +=3D " \
     file://test_rle.py \
     "
=20
-SRC_URI[sha256sum] =3D "b65749d7f7a2fddfb106bb57c9902db4ab25ce8724c821f4af=
50cc58891a6b7b"
+SRC_URI[sha256sum] =3D "dfc56ceac35d825fb6a85fa3ac36a598fee3101d264a39895a=
62f78c1cc95521"
=20
 RDEPENDS:${PN} +=3D " \
     python3-attrs \
