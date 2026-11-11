Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7494.1794396278315459600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:24:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=R0nkOHBU;
 spf=pass (domain: est.tech, ip: 52.101.84.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvHJYvpCqv2RtjIopVOn89cXw8HjNPS/Zgr+pX1neSwbU7CkzgfELz5fCw39I8IL8MN9flxevxUgThO56Hz3Qms/BruxzX9BFc+okP5y6gLx2N4dN0fXLtIqk8FAV0gw/vc4eJfWe6kIRGeTSuYd1ZLfETGbc84ixVmE53PGc+tKOm7CsHKjVPX5rikDXHZKP39K33NdwtfmqEAo337owZJHWoGkBh0ndOoCwxdf7cHxjfItqLLhjeM3yXIGV9qm7Ftx/Qe1LYkM/k8BuR+XYcCMixxnjDY5LC7b0lTQ9ADsZv8CMD/4JcSMe5/odrCLoT6mOn1On4vXPV5S47OdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzA0zb+ULEPmaJPmzkTtMoWOYS2F9soAuj5t/Ey1MWA=;
 b=eUPloT2bZcZ9Q/qNxJ3pFOU7xMbOFCtl1lb5Vm6jo+xAjxJbHqCrEcYhDc/hKqsznNKGNdT8lqZ0/7hUhyGcy20oZqa/NM/gUCBQ0i+zgdJHZp/NyDt9AMlD7s6Qf2KHsZAApfaXOBv+8rDZyAgE0PV7o9GCZbKeW4wtWUvpv1OC4wNJq2gmg1JUVWuZZownPOvVNfgYBEwpO8KmgLtwjHNOnTOa6oY0N9p8vtcTyFAIGBBom7XcEPcSyIRHSOVhCIIrQpFhYe6xuUKUeljcWIRsoYt7nhvmLF3DyF7L8r+pkZd9yDqX5CiBl0uGetavYA3xOkbLJSV/p3n75CD19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzA0zb+ULEPmaJPmzkTtMoWOYS2F9soAuj5t/Ey1MWA=;
 b=R0nkOHBUgpRfE+vCyc96nC3BfE0BoMKvayr6+a0Yl1ZU2YaX/n2A3NGyYRT9J+Xf4JYU7NoiqAt+RbFEd6UNK96RD0j+GSywMqWah2O2ss5XVWFUs83bUzK4eGRTtgI3kza009Iwzvcmkb7TzXwOxul4OoZfxvY3geG6/6SMjM2INDg0U7RKThU5iYzs49EmY5RtNYQBuaQLZg0ZZc+HWW0tpQUPNPi/5t9BLLLQV9bI9vnwVrtKQmmC6mEAbWIWajGZDvprhxo1kcRzkrFEV/c/qHnCCYqAq43WvqE5iaaWB8Blr6lHerDsMDnB5KCtA5zrkpE28JsfAOn1sKJ6ew==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by PA3P189MB3204.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 11:24:36 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 11:24:36 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] libxmlb: upgrade 0.3.29 -> 0.3.30
Date: Wed, 11 Nov 2026 12:24:26 +0100
Message-ID: <20261111112426.85977-6-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
References: <20261111112426.85977-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DUZPR01CA0254.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::26) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
Return-Path: jaipaul.cheernam@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|PA3P189MB3204:EE_
X-MS-Office365-Filtering-Correlation-Id: 3569a2b0-f45b-42ca-e418-08df3fe65dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|261102123227099003|261022105027099003|11063799006|56012099006|261021121427099003|10067099003|261022113327099003|261021123027099003|261028144727099003|261026140227099003|261026121527099003|261021130227099003|261009223027099003|261022115727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: gvQzBia+iHHXIbsmID+QNewAvX7Kl+2owYVivFNiVzezRsKz9vwCYI3FE5ty8EPOxSI7guo0x9qA/ponHTXWABUd7SPRzT7433unuwoHFL91mTwsjaVxb2lHjqlvFMFD7qk2rfSLYwyLskdOx5Ks9WGxM5c54GhKws3aFm+vemZQrW8tCUzz2/QdevUM46UDfRJRaZMwZfc/RiXlpEil8nAKrG+VIuWlmjt2pipdvUSZjwRg5nz00TSkaO4Ayas112u1fhXvPKQPDy5B6H/aBnn/wC+4pAy7iXLVeD42OS1XAIp1+pwZg48X/PP9JweOk4hkUDkb+oVRwo8n2QFBLpzu/KZv3vhyjN8Qc7MO6HPmIi0+SV2+g4sbMQwh1iHeKnBclZWRckA9sHL9gre8MIsu34duFhM2BGdXSDc4fCk2adOi0VdkUAw5/hsn9i8d9R2gEDDR3dKLgfPVEHxJ6DRkF9YARVY+pG5Pg9xprIHpwWbgIteUdOU3jq+fjC/bg4nOGgJ4VsShJfd2q0+3ozzu8bx/AFrHSQFL6tzLbAYyHOqNDeZbrFNNnJ+1r80vCoXXt3JVLpcJHYQ30OUEc/GwNPLjQmmgcyluMVIj7L58JeouJO7Wgq0qNBvCyKpaIylfLJG+YPFoKo718AIOVKc2Un1lmrKuO/NWYf5qF1A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(261102123227099003)(261022105027099003)(11063799006)(56012099006)(261021121427099003)(10067099003)(261022113327099003)(261021123027099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021130227099003)(261009223027099003)(261022115727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PFE9ys58PBjyssqDbB0zZMON9dhNik2wsT/R9S5kh6a32R0R5dkithNzjf6o?=
 =?us-ascii?Q?rCnikNLQVv5h28IYttMrfKZqj+v1P4S0wxueaP/oe/bI8IzwmxGwXAmvoh2w?=
 =?us-ascii?Q?ZblGbC21VTo8jPhJo4bxHY15PEgG2ZMtXZ3bHZijLXVTBGoxRyPwBzn3nkOI?=
 =?us-ascii?Q?mY7WkLcb87+eQVFVym22uXoDir5CVOr6IiwjbAkHD2ZZ6lZWoA4ZgrnAC6C/?=
 =?us-ascii?Q?WIWdXQcozakWWCwZ3pxSldglZFmK6cmo7BpbvHakWF9q1hZZP4qRBLmWfhIq?=
 =?us-ascii?Q?mThHDMukmN3J/cSjlnObiSZS3M/pFeO8mHD3/jqu9Gi6XqYx2IyP6shBER/w?=
 =?us-ascii?Q?VkBaIA/Lx6+1FLMYxW9nBnSzBwsVbz6Es4p4y7/ntUpPU3tn1WRhbgIS+Eg3?=
 =?us-ascii?Q?a5z+Wdy73URJqpVtGYJBWZXMmQ5CHyt6k2oodflJ1sOcjYNJrjb/oGcaoYvU?=
 =?us-ascii?Q?KP51BLrww9wB+rkeLoMeT4fgJ7vuPi33DJ0Bv7hUBMANaoPjaNZpk7gmxSH8?=
 =?us-ascii?Q?/wbNPv2ax1z0nNzKbeucZjkrYUYAPbMomGt1KWD+GOWLi93drzajVJgB5An2?=
 =?us-ascii?Q?RUhcESVXmH9zIHJ47AVlqD6YOGZ3xuJlCGfy8psl7uf8nR6YUtMWWZNtaZB8?=
 =?us-ascii?Q?rNa0+eNpQ4KgVkIQaYRghQBUk5vADqoAAoaEhwHKqsOTI5ZtLAn2FoXXw7KP?=
 =?us-ascii?Q?QJcUndQkre6jWEbKIREWOonyjzbtcKMrOqftA/0q1/YV0KN17n0prSb2tRD9?=
 =?us-ascii?Q?bkQWvlNCf6HFsX2Qi7UJbCeLlsv4xla8UYIDJmY8jYW39+rNi1e2p61a7qdd?=
 =?us-ascii?Q?f5vZIOGwPAkcuIb/ZdZq8eL+EUxxOo87fLTyzyKGaPsu9fDa2bxEfL8XMRQ/?=
 =?us-ascii?Q?OV7JbQox9ETloDG1VmOOjmbeamgavIQYCNLCGcY+zG81ItJWN2eVs9jgjEBy?=
 =?us-ascii?Q?w+hsFraqPL2cjg/DS2iAUXd4fYZs6SdeRtAYolCKlEI1s0qxwx+/wr8sfMwu?=
 =?us-ascii?Q?2MbHENNK/CyxMS7S2ecVxruuL4S3BfrG0CdUK8a4sO7j2NgeWlkwRjuoS+Wy?=
 =?us-ascii?Q?4x2UrDYBY2vfQNwWMidKHgU0/QnTMyYSMs9EbigmCZ25+rEPR/NQlK+O6DdK?=
 =?us-ascii?Q?zizkl249kOEVCBNhRcEr/6KqAosliNk6VU3Mv+m4Dxeu6TRPcOW6CJyvhVuA?=
 =?us-ascii?Q?j/IweFwjg8qnNqcAANd41YFK/LyQQzbIqUJCYN12RblnOq+eVuM9QdyEohU7?=
 =?us-ascii?Q?Lhyc/D+bCVKQIzZPb+pcpVHjZZ2HHKlQ/+BZV0fDUB9GLr3kNNhW4ONK1Uij?=
 =?us-ascii?Q?DL3HH6Z6fmhNeKScXLoM4zXucuS69SRNPAk4j+79mSrRYMKksySl3wzYCgZy?=
 =?us-ascii?Q?ykLyddj+7lNpuY0nY+7ILbcWVoqiXsW/XjuiFJYFHXaIoQa0LURHZ2Kmy+23?=
 =?us-ascii?Q?JUZb71nOpaMlZVkcwFnhlxTMAAWn0XnCC4AyAa5XG6N7NFCH/1JA8lXSPQAd?=
 =?us-ascii?Q?ovvte3eFzVRjHZG05oRZKG6L3HdEDA+5lk5swDjFhpG8lI8CZhaatKt+pwgJ?=
 =?us-ascii?Q?mZGqWxJuX8XLCGH0DE19hc2DbhP4DvNo7USWw58XQzU8f0g207AzcVJwK2fH?=
 =?us-ascii?Q?Q+//HihT/bYNGoL5+12MRoscawce7b0gJXC5d9m+a3cC4j6YQxStREj/GbYZ?=
 =?us-ascii?Q?2QcdMBvZNRAlLIqfcwjIBYdpbqsGMcte9kl1Qz63yizhIm5wr48S9aoi89uW?=
 =?us-ascii?Q?PSEQtl1Jr51iL4tBo4ODUJ4xbWVnP3s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3569a2b0-f45b-42ca-e418-08df3fe65dcb
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:24:36.0264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EYjlljJ2b+W0Hl07YLqg4IFbHBIbSFZHai66U5ggafzEvu4gaILjI8DfOeHx3vjvNFJzsOlV+rksDBqk/8StiKpn2sR7/H+AsOfwRScjVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250021
Content-Type: text/plain; charset="utf-8"

Version 0.3.30
~~~~~~~~~~~~~
Released: 2026-11-10

New Features:
 - Add support for the XPath normalize-space() function (Richard Hughes)
 - Increase the maximum number of node attributes and tokens (Richard Hughe=
s)
 - Record in the silo if the node was added as external info (Richard Hughe=
s)

Bugfixes:
 - Convert xml:lang tags to POSIX form when required (Richard Hughes)
 - Fix OR branches still being evaluated after the limit is reached (Richar=
d
   Hughes)
 - Fix XbLzmaDecompressor reset leaving the stream unusable (Richard Hughes=
)
 - Fix a bound value losing its level inside a tuple (Richard Hughes)
 - Fix a crash when a query value was never bound (Richard Hughes)
 - Fix a crash when searching one silo from several threads (car12o)
 - Fix comma-separated function arguments being parsed in reverse (Richard
   Hughes)
 - Fix escaped tab and newline not decoding in query parsing (Richard Hughe=
s)
 - Fix literal backslashes not surviving the query escape round-trip (Richa=
rd
   Hughes)
 - Fix mixed-type comparisons swapping their operands (Richard Hughes)
 - Fix parser depth leaking from one failed source to the next (Richard Hug=
hes)
 - Fix unbound query variables silently comparing against zero (Richard Hug=
hes)
 - Fix unfinished predicates being ignored at the start of a section (Richa=
rd
   Hughes)
 - Fix xb_query_context_copy() silently dropping bindings after a gap (Rich=
ard
   Hughes)
 - Fix xb_silo_stem() returning the unstemmed string on equal length (Richa=
rd
   Hughes)
 - Fix xb_value_bindings_copy() aborting when a slot is unbound (Richard Hu=
ghes)
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch | 6 +++---
 .../libxmlb/{libxmlb_0.3.29.bb =3D> libxmlb_0.3.30.bb}        | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.29.bb =3D> libxmlb_0.3.30.b=
b} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode=
-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.=
c-hardcode-G_TEST_SRCDIR.patch
index f0db37031e9..82ec03bd642 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST=
_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST=
_SRCDIR.patch
@@ -1,4 +1,4 @@
-From d4aa8d857e1b18dff8bc23cc810c56b4dba3aa95 Mon Sep 17 00:00:00 2001
+From 361bbfeb5b7bb6d89a022986746f8063e6df25b2 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 795167d..ab2b582 100644
+index ddc4c9d..4b46161 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -3329,7 +3329,7 @@ xb_speed_precompiled_func(void)
+@@ -14,7 +14,7 @@
  int
  main(int argc, char **argv)
  {
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb b/meta/recipes-gn=
ome/libxmlb/libxmlb_0.3.30.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb
index b070cbf99cd..16089a31878 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.29.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.30.bb
@@ -8,7 +8,7 @@ SRC_URI =3D " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV =3D "d942cd68a7d78e35b312b9299e69f68f9cd2e503"
+SRCREV =3D "35e0ece96ae9438ccdfe9fca5f11c161e396a481"
=20
 DEPENDS =3D "glib-2.0 xz zstd"
=20
