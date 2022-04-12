Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7C01C47095
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.38])
 by mx.groups.io with SMTP id smtpd.web10.7802.1649747425691171876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=hPlN8jqK;
 spf=pass (domain: outlook.com, ip: 40.92.74.38,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl/zwbACcFENAsUXQteagA0XmRgX+BN4bJ6xe/d0RIwjwhkKrvaUgkOUfKxyyVqfdnKQp9j7l9EFI7ltewRGuLxMSQ91CoNm3GUwtAahNMEj6Ga0p4VnU0zkGmYZAusl/bas93D27xWnzkJocQKwlR1qBiRjoKi/zxfOaXJIHWKsQnoxbZDpbxq57wx+vwRuGhAUMa/iJ4gcZfgtuQqJvM46OkRO1Hw+HcnF1WIX6RmU1INxYqiEVwW1EbGuUKFpUiM2jyNOXtlpuW2cVhqJHYloup9sQa1oSNK7v3kXEsGcP5IAG3LN+CH3V7gqiCLMVa7S5EpDABK62LpXzzt8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vn0z5Nh6Xk21Jvs/R4CNcGE/fQdz19x1nSMMW0KZaGk=;
 b=CzOR8WWUDPjKEs0/DTkePCoxOlB9GpqtsrHoQYcb2cgOMNxo77HV+ddjCTiXxKotldMoZL25e/ymIyPf30ftStFiwpNcKBZUW8jbue7VGScCztmS6Cs0wFNIEQGlccBERFterIXh31XsVr3bqYAVJNINsNbXtBI5dFewXc8c7AFaiC7g2/7oiAHdJWKwrjC2+kT8mDl290E2zgmrZT/hkcFk4tc+Q2sR0aMwEheK/HGfeXRmngIVPOsEWV5RqMRnVzLROEZTT6+QB3qB9/Iy6lg1NMXWSbe9OJ0y6kLTDafd8HCBcY0z5y8PWycyMS/8y6VlK69M5Z+NcOM5+Hj13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vn0z5Nh6Xk21Jvs/R4CNcGE/fQdz19x1nSMMW0KZaGk=;
 b=hPlN8jqKEh7jJfSuCwFC01o7LDkt8g/bsHohoakGJWXveWaagNIWmNzK8YDHLjdQtEyz5mIrS6DYmLXjkSUjZIXl6FhNjwz8audlMT+3XSdpADFVewCtSajPCKdHd+BDJWYTKCp+YzLMXbUe9pP0jgO9aiGv0x1owr0HV2jALgdJQMthjH8QNKWttrQ3Jd14+3h7oT6MKZxfeuLQnPZAsnKYIXocWxE+DIkZUrBJ+cxqldYBQ2VUzk9UJUfYW/NVw4lGVlEjijAErfC3qGNwC0WZF0eH9/a6RNDmhQZweNGGnNQv7zEu72LW8HL/se7T1BN4/OrbJKWZehEC3LVDmg==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by DB9PR09MB5034.eurprd09.prod.outlook.com (2603:10a6:10:2a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:10:23 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Tue, 12 Apr
 2022 07:10:22 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/4] kern-tools-native: add missing license
Date: Tue, 12 Apr 2022 09:09:53 +0200
Message-ID: 
 <HE1PR0902MB18011FED903951FB9551572FA8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [VEZAR0dL9MdLJrziqzVmwXsLuEutAIlXHYCl6wqmuGb9l2AQk1ahToHxAF4GfcLK]
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220412070956.1117150-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0be4658-cb29-4701-9ef7-08da1c538241
X-MS-Exchange-SLBlob-MailProps: 
	KBSGuA5p8vDO0nlCL4I1kIdhfY3cYlguoZnBJwYsWVkjWCjxCHk10wSOX2VWn+qLtou3E4KAjtXm4z5T2jtz3SEYhxSrjJ5w0ZI5rOiAelxzv0nvhA8pSqFyKSQyhMldtvRD2kpL2mWkQIWwETKxYkp6/e30cbJIZEBX6TLyQRjvUnslGydyv6wWOS89+6ZifOVvPI9t+vnlqZZsgWAKQOB3bXFViyEYzpTrMEqFfyftz5v2TA/qhCaFEAzhYk3fMoC+zrdS0rIUOXncgVSS6BvY43inNBUzZipEXEx7Khv4fd8jCnJ+QFQd4tpd4wv7vPmg9Z2ih6QzTbbMckcREmmIKykAmG34KMlMov6gofXlmJwiwuih/hEDq05sFykHXTAUh/XIoTxMMW/tO7otABOuEcllt1so1euNPVgrfdFVDHD9SYxVW+35DmsjMN1zLOQwYLxuHrzY+Vts+RIj7FIgBTXEBcrV5qaCTjIjvyKQFs9zJY7sXqH1XcspkMht7RYMhThc7MI1729tjN5hU+OQ3WGLcy4Sl7MUZ3QcQlR97UznE4HCyXoQzGiLm2uLtJ33bBv9o6lhc0bm0ZMN3mdPhMMONC+9783RsUfMwqwxlgscwPsgFQzQWG3heIMiPt8BpAD+o/L975sJG+B9xs2Py5pmmMViffED7+cbdwcmfGJ3RcW6NEONO3sXMJ/0cGtUHBgWeQl0kbbgp0sorJdzBl3qjKpU90HcHPWm4wy2l2d7fHX94BZ2xjXGAeaAi1PXV7bOCd36PUeTiUKBnu4BnY/B/LgFraQHt375hnA=
X-MS-TrafficTypeDiagnostic: DB9PR09MB5034:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kvLts4X3Bm2VT9XGcHK9op1EZ42gEQgs3B4ADh8ElrvR8PNHkCNy/wzLeON1EI4MPQf2kqZ7iaxVJYQL+2o7srqOOBu+BrNjryAlSpPudmUU0U/dqCiSBnog1DiXeKeWff+wb5/YocZCYs0TqmHmdIeiC0wyX1T0adz9rdH+x9/7LKQ54bRT5322K3Q1y6Zr/ce0vSGyXLph5HPjy7pwugRmoqUSi/t5FPSMoaBl+lknL+Dfuljp/B8Ym53mAKCSiiDEHZYFlE2l7OFuh0SYlFFna98xKvocq9nMDgH+nfRcZee14o80oaO8WrJ2SXLVGHsbPo5yxe2/+NFR0keaJP51nrcPMrefur3DUxFoEwiEgVzJWHYCa1Eyv1j0F4a59xKxWcvcAEm/UZ9zEqXrB17vet9SD7GB3lMGnJObBls2mqgKqX3i24VQi7waF2EC7W/pUlmETHGpyKMRuXuybYfcY8uyLC0wSvvhG1//FQz3yB1vyhitc9L6cqzCqP7E7IfPHnH9BYHIbBCGRr8BFyI78JX7zuo5LdGnBVsAeGCAezxbHDfHI0xCzmPwt+ax42WMyAOPRamHyH5+zW1nR+wQ2IZKbd8mz+Sx9HLgBT/o6nGgRQoIHr8M0XxA3Jzs
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sc8r+zZVmoOdYTt6EHPYmxWOYSTxnOqGwxSVkyRNSUBcZBAB+MoHXY7rVRHk?=
 =?us-ascii?Q?KCRKzbx78pgOqg19enJ/jo3RW/+o2Wxs7fjYjimu8O9SM2KBZtax1+AQUPjl?=
 =?us-ascii?Q?kxLOtCHsZvM/HUz3q2KAe2h9B0YnV1yWAx0vc6hEIRQA7510QNIqa/b92o/f?=
 =?us-ascii?Q?264+sMaem5JIn+VpOmzvuVrMjv+bP0ozV41WnczF/Qk/WEIl2lMZn2DCMFJb?=
 =?us-ascii?Q?1JT5Yx3g9tig6a8Xcdn/u0tbhhQ8564YgE7b8FoKBMkSjNi9R9KjXITlh7qU?=
 =?us-ascii?Q?JC1w44nKyrQs12e4G3Weg888G30dYRLJ7XzHKqMd8O914nQJ0qy4bskxjMZF?=
 =?us-ascii?Q?+1n+meZFlb0mwYFmdymhRLzXRlvL0pfn/k6QFWI2P/zcnYfctfLofBmFKOa7?=
 =?us-ascii?Q?gk23osxh3KGdAtIgy3MXbFHHozNZs1dsylgKzcgQxdmxIzsozQlFxOBIiznp?=
 =?us-ascii?Q?5rImnZkgRtPUT4fidAbwBsdGXs+O6vthy++3OKq9jAJ58mB574iLBYL0x6Xd?=
 =?us-ascii?Q?BYGZchqobuow6IGgIZ7a/o25b6YXykhSXx7ZPgIalnx6314e/27KqKOYJD3W?=
 =?us-ascii?Q?b0PcGcaEx4U1OWoZn3LWFrQ5OqDTOYeRrESKDZqzf1GGKtxZrYIKZvZt+5Rq?=
 =?us-ascii?Q?dc3ZWKQg8Vl7c1eW/15e8NPIhmyhUYxZxK/fI99Wanl3awdYiemfOyhiceff?=
 =?us-ascii?Q?uf/DyNWDOIf6QdKDyk4uRYfj6x472xu9NYygb0wZg2buuHCfpZlKJXZnJzc1?=
 =?us-ascii?Q?KXTUH3Ucio+3XZkebZDp6VF3bOnmQVgFNuuI+R1P3C9EY8acSPMCPCDuQjDH?=
 =?us-ascii?Q?uF3OzfzjXT3lsHXUiqNfUHfI2NhN2Sdwzk34S6u6tNivk8TxwPn+Bi6mviQG?=
 =?us-ascii?Q?i06K4xaoxnEpeLZ546FlK+xYXsaWwaK1gt82bOT2oPhl6yWqToGqRNKAqJ/A?=
 =?us-ascii?Q?kLzB9VtLosmYAY8f9hzgcS5exdN/0ln/pfpAs9NOeW+srXFetAlPsn/FP3zC?=
 =?us-ascii?Q?hZN5QJMvj5h11rCChRFgDs1E4+V/tFCaAiNnhUNPvvi3usfdVKLJupqzJLb6?=
 =?us-ascii?Q?+kAC7Gyo19f0DdO0xmwlSNMXegE9oTOsMiR8vnNmIxfrWLyHzkbwf7CoVRCI?=
 =?us-ascii?Q?R70CDp1tMH2d7UGlcqTI0vrHFGDsj9ZBPeiTnU4s5WBdI0/AZJZjKK5V4KnK?=
 =?us-ascii?Q?VSvwgAGVwRkWHLoT83L187zDGaEejx2cgcex63Lq1lBnpUnDP2F/QEs9RfcE?=
 =?us-ascii?Q?ik12/1sxCid3aEyRdigrTFSuAAOhoiZrFYN8WHAwM0P1u+/nwq/dChhAjLKu?=
 =?us-ascii?Q?hZjG7AtkFT7Mrn4yYMM+pdKglBVPsuCag3JAs73o7WYKgjy6P7Rmq5HUBG0E?=
 =?us-ascii?Q?yI20CQxHluaWJ7HIDyqmCBvsSP2qo2cngN+INRXzQGKAZBR0xbuNtnygWe2d?=
 =?us-ascii?Q?sTcacZVsgWZ2qTzSK5B2cw0Di9tE0rIpm/L1KxsJxOooY2BhIK/R4FcMSPnR?=
 =?us-ascii?Q?v4YV5O5KpAwVOIM=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0be4658-cb29-4701-9ef7-08da1c538241
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:10:22.5797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR09MB5034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164255

add the Kconfiglib license, as this was missing in before.
Add MIT identifier to LICENSE

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta=
/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 0dcf1281f0..a6ab9ca56d 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -3,8 +3,11 @@ DESCRIPTION =3D "Powerful set of tools or managing Yocto L=
inux kernel sources \
 and configuration data. You can use these tools to make a single configura=
tion \
 change, apply multiple patches, or work with your own kernel sources."
 HOMEPAGE =3D "https://www.yoctoproject.org/"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://tools/kgit;beginline=3D5;endline=3D9;md5=3D9c=
30e971d435e249624278c3e343e501"
+LICENSE =3D "GPL-2.0-only & MIT"
+LIC_FILES_CHKSUM =3D "\
+	file://tools/kgit;beginline=3D5;endline=3D9;md5=3D9c30e971d435e249624278c=
3e343e501 \
+	file://Kconfiglib/LICENSE.txt;md5=3D712177a72a3937909543eda3ad1bfb7c \
+"
=20
 DEPENDS =3D "git-native"
=20
--=20
2.25.1


