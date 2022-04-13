Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 697DCC54EC4
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.92.68.25])
 by mx.groups.io with SMTP id smtpd.web11.7865.1649864117416085188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=NOuTVs4U;
 spf=pass (domain: outlook.com, ip: 40.92.68.25,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvBQunK+5vip9paoB0i2r+klypfxqViRTiHQTygQBYMLsWo1JhIbtnjzn5hLNsuWku4XrG6mdfPzAFV+rkW1gqucUg04elea6RIuPFiw1D3BgxrBcz53TkIK51iRv9+vhC+MQorPyChArk5z/3+nnWxOavcKAh151X5tig0kN3qqNQMIJHioUBKctmHilPw8H95sUXbtPlDA4XbBmxj1l+nfIIesxrVvKQBIk4mS06jFdwShkLtEAxPjwMz15MpJI+rPaHN9ytCcCeXwLrqGMj3LWsRJOI2ZyVaQlChXW1CperhQJ9JchkZFNxguPzzCzCgfS3d/bmFkm11rx0HhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OlyTNEWrCorw4hwL7i7ugaprKF+mbbrASgqgKFeGGPc=;
 b=eT009nJCX6+8MQjMssTx2f5VpoVy+AIrrE7WMojnlw8nLqStAeFmtRDiVIvyz1/WWieSl+YTCwFYMHZP4nrdyStvs1TEO1gTa/HIT/KFFPs4OSj+i9O6TqHwy42xxLFPPn6nfp3Fj8vKE2p9+rv34WdOe+5lO2gHM0Po6lE6VxdyQ63CFUiHXLB++TkcMD2BGtEVsCWwFn55mgpO9VkP87lvkj99ohxphMcNwmkcnNwuEizKPAMfSajPJc5goAwKZJfbJNg2mJxr2lG06J0uKH5U9GC/xskBZjghnpwpS5GuZgm48VFRlimZc7KOUuDJsRYBBWC7C+cmC+gUfKy+8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OlyTNEWrCorw4hwL7i7ugaprKF+mbbrASgqgKFeGGPc=;
 b=NOuTVs4UDW/xVN45zyD5I+BjoQurcuHzaYCsgMavhnnwClMi6SSBBXxuDYiLGWWGFu66bh/8X034TfM4N89NAXp0cXdlU4M4e6mV92vU4HuxuvqrmqMevO69gXpDYkiAjItiHHYxnianFAKFYlcBXUSexEOHj8YsgKdn+BZRCO8IocX9ppq98WVSQ9yh1YF6fPilBWZYgcUMXB4mdqKFTwNVNfjNitUdgv+LJWGd0fSyFz8mrGYkzZgoiNR4vki9QUSYDjCsKVG1rU/Y4Co6w8ggXdW5mVwKrOgK4RIaoYDzHWrr1eprAQRdUpS2D5F4lwVctCfzoI2stlJabwwkuQ==
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
Subject: [PATCH 2/3] libidn2: add Unicode-DFS-2016 license
Date: Wed, 13 Apr 2022 17:34:52 +0200
Message-ID: 
 <HE1PR0902MB1801DC2E2A213BBB26C5ABC2A8EC9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220413153453.1765744-1-kweihmann@outlook.com>
References: <20220413153453.1765744-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [t0ishpsZXU7PXmsHhj8CFAsOKeYUcmyQJhp+U0NGcH3H3nINWTrYrHh9H5rv9+r8]
X-ClientProxiedBy: AM5P194CA0014.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::24) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220413153453.1765744-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a0cf5e2-6a01-4af9-b951-08da1d6333cf
X-MS-Exchange-SLBlob-MailProps: 
	SNmTuH/oRunBS9cV54giQaXBDBFFUJyCd1ng4cE61MlMFKWodl6WDDkeZb1+T4YWOtZpkgkg2qf5ReyOMteMrVqUxO9I8SBYnxjlLxI33AvouCjZiiBQxfxuJoHfA8nEGfWXH2MXp/9NxS+GgzIbx70/2c6qhlS5FwerLJUgsYO5HPxNQmMRb0VeStJslJKBJ7TrQD4iv5wwnLwX5jfztq55nSnIia1HLHKEPGxewNMxbzFy5Ri9oivbHWlUZy6wDy3I0P9Zp0TF7jkx3fYREp1l9Bs1/SE3Kw32u8UrMAJBm9LKFQl/LTAEf5RXjquCNDVA2v6OFM2+VqViDo8nMnw0iiLQ55Sj8YzAEglU/BkkSTBqJFiQVV/9ktub4JamK4MmZAORKe7guJBI1uQ9/DN0uY2K51CQLE7+ATiigJwiHazqzx9/GnLJ8eJP/SirB9WvwgabC6UANpGcLSNMj8ILQQVutOSBvAHjQn6aSfWpm1QPxdgnzyQMSFTS34TExa4uYry+CuvXxyEoURU9Lvda4T1wdwxTKC+rGyeKSHjmD1LCtxlV25aAzEI8+cT0KeCWz41gU89PahnC5Jt9UY+S6HWBToa2JSbxPL6RxKGOwk0x0Uim9dYekR1RhJmTcnDToAb7kASn6FO9QcJnADSYCzu42HIlR/psxzitcmPYIrysu+86QUvBt+GNBTYcvq6xa0INH6JqOjLz8EAPmjjlC+6bnEPqs1kcSsq3x42RRt9JcaQv9I9pnqqrGiTLDvePfL25imvFR5ItG/7WP5J73a8qqzQU0jHOwAU7DBG0BLg2TJbMaQjh7qjURO35
X-MS-TrafficTypeDiagnostic: GV2PR09MB5865:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gCUoDUOkJM/USBw24doh7nRP9S05pCZD3YDmdmCKvsHK6r8ZI0BO1YxPGUr7EiHqpcv/Wo8AxJVpdkM/hV+1TaG/tH27cqEa6ZWpsCb5vodAXfsdhh1lP4fI+RMxwp24VXblYeGXHUOm/6Wi8jj3eDyq2L3O1Il9qYko9YeE32V5+vJWE1UIC+fEeVfYv/k1DpeE0BcPCLaUUS+T5A6U65mo68950DYnxpI0me2edwK1JMnnWvA6MuxTxSF4u/CBvpmceYswZ0oxF5iE7eE3gOZDBsys6qdlcF+FCSYww/vl65WAjnLUyOavw5zJlVbo2knRpTWNnaJ/px60qr31Yleig2KtX7HGZZGUgThZrDhdM0skcHS6juAJlCuEOrqt6dDp9rq9w4vrINt/4gSEBVXBH6xNnH+eyhumTQos/I/Yanrrl6rQ7Unrmeos2PyF+D3xhecepjyUhCTBBVgU+yWmtEq+rs51Pc8H67MgXTS9tzCXmwDtVp1TbYLIX29QxrhUN78TFsVtcVl6DYgjdzf6lRySgXA2mEF1CaNu9NVTCfJqhlLIJpKLTkGFQJFk8Y+bwFtiDy6v+YRwskHY6sDyZ38E8+jjmbmIqovNWNJwuwjvy/ckir2GUkI3uWA3
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IcY6db0cOnIYUynZwh8rOV528MU8CelZiQB4975CwpBpQtwsylvp/9dYzIBs?=
 =?us-ascii?Q?S08q+/QJqjcCYh+OptM9hwjbY3AI8PEfRAXeXjjtT1G160J/CGJ1KzKgpF/x?=
 =?us-ascii?Q?If5NiefCizBvDZRprYXEPG5vIqfAmh7bQ0EBc0wZLo6saLwjUzHDJUOXFTSn?=
 =?us-ascii?Q?zU96t9VOYHtxdfuOCe2Gyc8AOLHuhBaPhwmbdowTDfFjBTPAepy62TpITW0K?=
 =?us-ascii?Q?wlcqfRoby28stEvl1ITUkhzbIVF0JnEPgAFsAYlmd5UM7UcOQvbwu5WJYHux?=
 =?us-ascii?Q?LDS0i75RKsQrhF05IOBgmu55HZe8rBmhb1tAtZNS5UzI45FY2H/mZ1+9w1wo?=
 =?us-ascii?Q?EfqFWU7g0kW3grOfAknIapjHTqa1f9w5sjbnhVl7CbIGW3vYVC/dd9t2bJrI?=
 =?us-ascii?Q?A2TaQgmsgrhj0wsjy/8akQe8iUz1WaksUa1eNYBLzCYHJuEndGLfFweORlxI?=
 =?us-ascii?Q?qOPuS0j7UhXdkhdnFCIyGv3EJxP+q8KWGKy75ATNK6ApJrWpRScKhGyPe08w?=
 =?us-ascii?Q?0dkj8bIBHhyNnCtfOawbL0JjasQ1/yuWjRUHDcNG7wAZLkV5RTRTk9lO9+Ii?=
 =?us-ascii?Q?gS91tT6kK+mTzcp3qCxr6pIQvnHM+Q8z0lPooLQo7ca92TAivPmefAs0oeoo?=
 =?us-ascii?Q?hBeYxIQgKoBSU5MPF1eMtzm+W6fkmXCJVHowu5PBMPmb5VMpOG6cvAOPGzIv?=
 =?us-ascii?Q?+1B2jRAUYYSgbhviezW7bcCSCrFpmbmqriiYI5/YoenZu9yoy5MbziO3C+JX?=
 =?us-ascii?Q?9+94TBfhyL4/ot8ze1KBTeQ67a+OgcSbWhsW51PYNvBBMHmPowD7g2FmfFXG?=
 =?us-ascii?Q?aZ0nYxqZTpKRWCo7zw6DpeaO3lNvaSkf8BnJhiXRYBGnXqgisUMmvWN9PEAz?=
 =?us-ascii?Q?5fQ8B8KSk6/Jbj9Yc7nXXJuatONfXzu8o0yVFeU1zAeVp+6GAYz2w+VGMR3P?=
 =?us-ascii?Q?X+H4Pr1JgDJB49cYtABJoVekdI/uFcIrg2cj4d/9YP7i0Rv0ggDfOoiwdWNU?=
 =?us-ascii?Q?IbLZh9qIwbzhO7cYuWyQNrBsBHY5lEFxgLHUYmyHIbvoFkX7uMwcJSm8uNnB?=
 =?us-ascii?Q?Le8TUNesSyQDcIcUYV9ZKzydFGfhsUr3yIxj0xhXa1aSrxhNJOt6wP+ltwl8?=
 =?us-ascii?Q?9EQWtr83oOxhYrmz82/DYhPZ3cQxDL2m9Z5Xi4snu+KtuwuALh4JRqCRSr/n?=
 =?us-ascii?Q?u/pkSA17RyO7QVA0KF4fN/Wf8r5mPAIDYlTrxg7JuhR3r+kbyTRaaNomEg9l?=
 =?us-ascii?Q?Q9gyq4ETAu9DnLjWGPE64HzY6D2J0X/suCuUi/i3K/KgaWouBOFt9XGctzux?=
 =?us-ascii?Q?d0PfXSfLiaTwNO1xmhOBahjEh0YDA7IYJ6rcP0Qjjar8mOczpCHdMOPX3m3D?=
 =?us-ascii?Q?pcWRnejcIvbpmVQzCDD3I0tXMWNWqYNN5PR5tY859S0ycGeyVgb8POIHe3ex?=
 =?us-ascii?Q?1AM4MB8+eX9e8k9ZvlV+iVoBsbkQ68EBNrj5Efho2JTU803hJhaoAaORm7Z3?=
 =?us-ascii?Q?psYgwwj5uDt0VtY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a0cf5e2-6a01-4af9-b951-08da1d6333cf
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2022 15:35:13.8159
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
 https://lists.openembedded.org/g/openembedded-core/message/164334

as COPYING clearly states that unicode data is baked into
the lib.
Add the license and reference the COPYING file for that

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-extended/libidn/libidn2_2.3.2.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libidn/libidn2_2.3.2.bb b/meta/recipes-e=
xtended/libidn/libidn2_2.3.2.bb
index 7316c031ce..e1b25b4b8c 100644
--- a/meta/recipes-extended/libidn/libidn2_2.3.2.bb
+++ b/meta/recipes-extended/libidn/libidn2_2.3.2.bb
@@ -2,10 +2,11 @@ SUMMARY =3D "Internationalized Domain Name support librar=
y"
 DESCRIPTION =3D "Implementation of the Stringprep, Punycode and IDNA speci=
fications defined by the IETF Internationalized Domain Names (IDN) working =
group."
 HOMEPAGE =3D "http://www.gnu.org/software/libidn/"
 SECTION =3D "libs"
-LICENSE =3D "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later"
+LICENSE =3D "(GPL-2.0-or-later | LGPL-3.0-only) & GPL-3.0-or-later & Unico=
de-DFS-2016"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d834ea7d480438ada04e5d84615239=
5 \
                     file://COPYING.LESSERv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02 \
                     file://COPYINGv2;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3 \
+                    file://COPYING.unicode;md5=3D684cf5f7e3fded35466794245=
28261a9 \
                     file://src/idn2.c;endline=3D16;md5=3De4b6d628a84a55f1f=
d8ae4c76c5f6509 \
                     file://lib/idn2.h.in;endline=3D27;md5=3Dd0fc8ec628be13=
0a1d5b889107e92477"
=20
@@ -25,7 +26,7 @@ do_install:append() {
 	sed -i -e 's|-L${STAGING_LIBDIR}||' -e 's/  */ /g' ${D}${libdir}/pkgconfi=
g/libidn2.pc
 }
=20
-LICENSE:${PN} =3D "(GPL-2.0-or-later | LGPL-3.0-only)"
+LICENSE:${PN} =3D "(GPL-2.0-or-later | LGPL-3.0-only) & Unicode-DFS-2016"
 LICENSE:${PN}-bin =3D "GPL-3.0-or-later"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1


