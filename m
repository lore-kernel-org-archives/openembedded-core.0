Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A352C54EFD
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.25])
 by mx.groups.io with SMTP id smtpd.web11.7865.1649864117416085188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=o08CL353;
 spf=pass (domain: outlook.com, ip: 40.92.68.25,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+4NMWnBqOn61y48tDFXUj/jqXPOeZBHS76B39PeRSCBzh6Gv0Nj2NVzG2o8D9ycVkX62urAtYVi1sUkwjz2Q3xmx9b5kbSUUrdu/W0k0tJ1zleDNOkrPpC9PdtC4tLTwI+MJJh9I6GlOJYV5HfkyMjkOVsc8+mcIxY+fAI6dX4EHUhvUmD1EFa3qiTM7AsYPmf8IXT6hKcJAmdTarS+GfnpCwh7bbIVTY68BD3z8c99mFo3ulIOrsVradS7EVRWkUP3/rPK8vjvzz+Dg5oJ/6hC8tfrMeHYASSHyBiW6IrqVyixoeUo0WbyYkn5eeYQB/oitqcv5qPA7vOZUn+RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NayUkniLwF7BAWiX+Xgz2nQgYviEzbH8c1P19o1xGkg=;
 b=jnbVgDs2+PcnBC8IC8J6YQ+pUcmQdJXIIwgeFSr8+zHmh9w0VCn1YgsNWVrnfsOLSAgcEISfCoN0Bzc0jZPl8i5asg3QS650K5eDdbohzbS8ldkX+f8sj4iBxtBHXWCKpsSdznVlCO7a5ZVICbvJl9UffLWA73ERt1urdK1Vf5uSzgvfrG2Ra/JvTijWqPkIi+QOHYMW96PB2iapifbp80+aDxjOnJJTZS9XYzd2l5VtgJUI8w1s82bJF+YtaC0NLVDC5WujulE5PRDO3Q9O8SIbm34cPFIZK3JMzSTXYycyyPFzRcrPfXlhARjUmuM/vioyDjiXKrj4I1d44vk/6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NayUkniLwF7BAWiX+Xgz2nQgYviEzbH8c1P19o1xGkg=;
 b=o08CL3533I2gIUlnVTNkIqVeX7//DU+mASOawCvNgFBOv2k5GlXFfnoFa3FsG7f15ZUwc9VsYGsInETUSAGbBD+VVe6iMhQ8HI1f4qZxLcFAEQ6VzSe9tGIjUInSMRTEad3sjA8Jv4wi8E8KZgc9Y6wQtLDx4MFLsd8dVMgG0UTTDMqt/OZMdTNZQLXsA0uZkhAH42mEcxB+qpd+YH79Tsds1112rM2p6mqdkqoYLM/CpZBbGdFOnosHLi+o1X/xH6LR23j3Y8xI/k4VPCq02GwSm9PMNkoEwJceOC9qIhT/rNsCGnUQpbjy28zVvAFtjgrFhRtoP7+M7A3RbxgDtw==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by GV2PR09MB5865.eurprd09.prod.outlook.com (2603:10a6:150:ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.30; Wed, 13 Apr
 2022 15:35:14 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Wed, 13 Apr
 2022 15:35:14 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 3/3] gettext: add MIT conditional as license
Date: Wed, 13 Apr 2022 17:34:53 +0200
Message-ID: 
 <HE1PR0902MB1801A53DF9307170BE69D304A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413153453.1765744-1-kweihmann@outlook.com>
References: <20220413153453.1765744-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [5ddehjtdxte/6If3As2s2hfnMTx7aqZg+DEXfac0/q2fLzc8wxxxJ8fuwZ5PBjCN]
X-ClientProxiedBy: AM5P194CA0014.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::24) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413153453.1765744-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8426eb2b-2040-4f86-634c-08da1d63343d
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLtJcfJO6uexqRC3Y10nspacI3i05y+ryhtP1ocec2wCiK1Dpg/0kTvC3o9Ptrs964PVRk/dvaQjMnd3fzEPZM//RX5tfyCQQPlYEsLCUaI4vWYBtJPaRhEYgeJ2hAs3xwjdZ58AF+AzwSXjBUfgvagVE8PmE5KHChVGuZVvHqQpZmz291+FF00ldtgFukdQ3Mbg/6C1/d1UFS2znO7zs/UlkDdSws3vq+VVxK0nLEtsUTLkDpUp7jxFm77fiEXbldJmjMpkD2lHKsLfVR6gMvIbP1w2JTs2RJ0Nzc3jdtqyj2TzsVb4q7Mlztj9zBliLs3KAINVfWu/DR4B1MTPDhCjgeoW5tms6Nwju+cwLNueU5FDXR/DSBHlr0Rw0lsPbh2a5CGJ+8mRxkuuYQC0zzn1ggoFt9cSTPolLxaTtsKsSmrjpsaBascqNm1UE2Bkc5AYkQZm8IVy7HXhKl5WYIjVlUVacGOjjx5EbBSCYdcoJKUaVKRnanEzJYrjfLhF/g0W0f0+Hws7W6rZWQuRfJn3LRVBJbF/BT/AytecyhpNYh0O1T6qCPQ9eKtXOtSnztouDfpiaicHn7eOJE9s0BbnMa+hHTWeFcHQdAc0KkSLCL5yFVsnnQ1qCp5vFMsvnxRTFg9usND79BkatbkQHV2vwxpWhn2bhV07aJtb3730Zmj0UEwQQtrYBTTrmBj5lVryuMFTYNjpOprJmpsJEutcJedp/TpJqkfb9rzBhbrYeBnfLCoVA6XXrglS+8Sics=
X-MS-TrafficTypeDiagnostic: GV2PR09MB5865:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	526ACjjuzbjtSwvqEtuxQ0rwBoVCzXjFdEpTffWVtvne5O9BsB7j8Lm66Mo4X0stJp4Ux1xrDDZAkC6qu3qc8gUNdVz0bA7ppZej63g/bF04N7lti5uWd+wdD39x3GJvTtpasmlIHF9L6WxBNnwrX2BcZYbDW/9xLhmDW+6JHfwPigU6G/YxyXLbeDD/2IqTqOl04i0BxctSFst0wrqhGEJpBlzMO9RSAG+vT/W3qYGjbeGPr0YNYIJ+nLHjOt7tGKW1216vSgw44eYMOoh8mzsEXiv+rAA1/jwDcE7gZJn9LJpqUmtEi/nzvdJ7hwNluJxxX+ITmmEHpx1sKmoAfbhU03DmVYGWxuosX8tGnevD+d37pj1ZXMZq/q4TGrK5xiG8BKyZL//pmouM0NKJXXMrOPwqhamI3DxRK6eHpBnWKT0zWWaXECPL8ZGBa8kjG9PEa3riQCvK87frSnA//RLdHb0gBlCd+VcMuj9/+VpekHuamHYNDvP/YXib9cMmvSHvB+0Lte+IM+dD1UFG6LuV1bG5yGDW9a7ADXubrbH84tY3mFASwLx/xYmHKSrIe2/E8m+Nl0/OwjaBUjLZWA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cIpPF8jVZI2pmQvZdP8CXu+ydsrnR+oQwPY8Jm3pEXDC8zbG0KWH//aux6xo?=
 =?us-ascii?Q?Jhl+N84HFWobO+rnyDswdwB9Yzif8alhQ/kDUI32QSDzXqhvA4mZtedMixD4?=
 =?us-ascii?Q?Kml6uXLaodAsijzKASydAeP83DDlkDj7OgwpAbjYl1sBM0UFFjlWmR7GNMWV?=
 =?us-ascii?Q?4ZW+es4wFfnnuqkVFuZJEGFR1DtQ9vZZbh35idkX6/fOxtXqaV64khQlitIw?=
 =?us-ascii?Q?GPJ0KnG0jnaGcL+ZZHaYYGrsqNSauoMZRV/TGkuJHDCN5GUGEKTRvMAseqIs?=
 =?us-ascii?Q?5w0AWxdFUtpNK8mpB43QJHCDjg7uH7WbaeoACCE2KcNeunmVDRQU/6N+Mdrz?=
 =?us-ascii?Q?kSK5Wl1cvCUV0o2/6CM+HajvVKYHWAnbm8c6uTmLJ0aP4HrLdpta9H2MsVH5?=
 =?us-ascii?Q?C3F7Bt2RQ5HIZylfDGDcISKPHjynddYmNaB9LLrmuAMfiai4bxWxKMNfcQhU?=
 =?us-ascii?Q?W85tCjho+Nk5QxGosBlcBQYgpNPFBbzAcRxt3zkh9ZStcAf5c8MZF2Sl6CMD?=
 =?us-ascii?Q?fvdz0eevQnDIg7hWA5QsPqzGIibV0bqCj+DkJigIw1UjpX81RyU42se/dS9Y?=
 =?us-ascii?Q?+gtPod7GrXuMSeOECUwAjeNwegWRnslyn1Con+rBLu3jcE7gjLfEqEBMm1Qn?=
 =?us-ascii?Q?9MapD3rjQfjQRpPQji1oO4Y5LtZ6lgUzBpxu4Xakacrwx4l286MdwvMk4/7Q?=
 =?us-ascii?Q?oAjSoaBqOrl14t8E271FNJXd1y4Ka8xHqU/2Nk4C4CxpSFbRe11aXpkXLZnG?=
 =?us-ascii?Q?GGNHnTJLKBdNL9eIb2tLr+wSqhsjcPwxqF1WdqEewaYUkZL1tkp8wb1PuvUe?=
 =?us-ascii?Q?QTzPnyK9rr5tEdc9CjsDSwTEbJQAgfiILMtGOC84KogydfRIksm6uKJqmbvR?=
 =?us-ascii?Q?fq6eUJWUoFIy9RflfuGKsS3HQdTmPs8Dp9ViQgdyOHziI/8n99jTEM2e0Xrv?=
 =?us-ascii?Q?xlfLdB/qT/FjQybuK6JizowfiflAuwDcbas9FGqAvVgU8hieffXrGPorOOrr?=
 =?us-ascii?Q?j+dq/Dg0v2HOoYFeI2HC4KIaWj2pbU3WQbw9lIMBct/cro/OKh0oUr75n41h?=
 =?us-ascii?Q?OboLW2O3vJ5EsRLqcm1y6BjDgBbraBbeJjxgs8J5sOMA7N26HNlnQu/v8nyR?=
 =?us-ascii?Q?z1V0wxcT/6sbs5JT2mhdPNBMOUPwjeAdpGtnJvJjWOK9d2fnFhFIw8VN/q0K?=
 =?us-ascii?Q?U8Rgv6495v8YkDFnHFZrdleZRdmQM1Qz7QG1tKlj7AHZpeU9opHl88Fr6Abo?=
 =?us-ascii?Q?WhgnAtyG9rRR150bvsU3REYMP+E1QHGML+vnxyHLNGQx7paX5ppKGfiNR7Dt?=
 =?us-ascii?Q?vTfFgLO+yUR0ZLKAEOjCyS85LwoP3L+Cct/w8bg0dKVdaXYTBcPq30TiLkOC?=
 =?us-ascii?Q?AZj78ORL0u7pxqkQ3SkDsXoSdDsuEST4K3QObggveSbjdqp+1OSrOWgndCC+?=
 =?us-ascii?Q?GAUMoMlFpcWaqc0anZHLJnET+Ju4iNo3+Jnbd0fVRkgokmYvqKeJ+dSDnJ8p?=
 =?us-ascii?Q?HtmmiMAou6wFJFg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8426eb2b-2040-4f86-634c-08da1d63343d
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 15:35:14.4721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR09MB5865
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164335

depending on the actual PACKAGECONFIG some
internal vendor copies of libxml, libcroco and glib will
be used.
In the case of libxml this adds MIT to the license.
Reference the license statements based on the actual choosen
PACKAGECONFIG

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-core/gettext/gettext_0.21.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.21.bb b/meta/recipes-core/=
gettext/gettext_0.21.bb
index 30c1955d86..364e6a52a1 100644
--- a/meta/recipes-core/gettext/gettext_0.21.bb
+++ b/meta/recipes-core/gettext/gettext_0.21.bb
@@ -8,6 +8,15 @@ SECTION =3D "libs"
 LICENSE =3D "GPL-3.0-or-later & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a71=
e"
=20
+# without libxml in PACKAGECONFIG vendor copy of the lib will be used
+LICENSE:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'libxml', '', '=
& MIT', d)}"
+LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'libxm=
l', '', 'file://libtextstyle/lib/libxml/COPYING;md5=3D2044417e2e5006b65a8b9=
067b683fcf1', d)}"
+# without croco in PACKAGECONFIG vendor copy of the lib will be used
+LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'croco=
', '', 'file://libtextstyle/lib/libcroco/libcroco.h;md5=3D915a46e7307c2f7f8=
d2b9c503fc434ed;beginline=3D10;endline=3D28', d)}"
+# without glib in PACKAGECONFIG vendor copy of the lib will be used
+LIC_FILES_CHKSUM:append =3D " ${@bb.utils.contains('PACKAGECONFIG', 'glib'=
, '', 'file://libtextstyle/lib/glib/ghash.c;md5=3Daf89a160226edf0b276b61838=
88037d0;beginline=3D10;endline=3D27', d)}"
+
+
 DEPENDS =3D "gettext-native virtual/libiconv"
 DEPENDS:class-native =3D "gettext-minimal-native"
 PROVIDES =3D "virtual/libintl virtual/gettext"
--=20
2.25.1


