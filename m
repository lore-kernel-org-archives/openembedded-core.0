Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3CAC5518D
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.102])
 by mx.groups.io with SMTP id smtpd.web12.8572.1649917843233514533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 23:30:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=TSq3n0Tb;
 spf=pass (domain: outlook.com, ip: 40.92.90.102,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LX2/CkaqZEBePzWGyZ6Q+kNK+AxSJ/VBex41HsmGwYvHoSF5qX4fWnGVZrj7Csq0rU9CgbxamWxXK8QFijFsepsRm+Pm4NIsMMUlepPq75hsrXGIJ4NO4hl5lRV6Vqfhd8yeQcFpvGO8fNXZDu7gyJKy9V6uLRhRlS4/T6ThjummvHMdB8ypxpjxojos+kuEol4+QQG7qlD88YIH0CbxaC107LA0ler5+rngi0Me5A6ikq7GnG9QuywdIfqXT7exLH+y4SGSNvtdy6iCXCvSyVEKjW9utDLldTt8v6/q/M7ray9qeqDm3ga6gTdtnGA82kmEEXwnLpem2QLL9prDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5YxWHe62Ckty1DU0O6WKdVghqJVxYVQNezxwBSVnJ4=;
 b=EZte6flupCZ9pabS4Y+C6Ga4iDJRhXWL38TyS+awHkSEV5bQopC+M21/dYk4FsNMn41r+D83Fntmku58qJm6CWoN6wE2SF95iDtE66slEmJoCb+gfjOxHBTaWOimiz0n9gJB0jAgZ3Ta+G5iLzkg9Xy1kJ12vCB4dN6am8q7kWMMBwbFeer4FZvLlfVxr/LyAWLs/pPrk2oN2krquZKRdlODQbxJEAzTr8URnPbelfD7AyLprgHaFS0beGUxFwsgBZPlkIpNhiqdcpiq4MhrHNu4Qp7EFyCPWukdkYmSdIlY986VVH3czVXpexHvgwZvujyl/nby43AxSZqlQtHu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5YxWHe62Ckty1DU0O6WKdVghqJVxYVQNezxwBSVnJ4=;
 b=TSq3n0Tb56K18FkioAnnQNL+MZdtmGdevZ8EqNO8Ra/miAsmB9fvfgeSEP30MDGSO8HPZ1TNUTD6t1PihHUb3irGrNPsMl2MS/nXALclRg7DyAlHqnQnKdlTpQuAZfUSkxjsD/9GTYHy0lr5KgZTHpXRWS7uDmrdjF8pdb4hsJ550WB+kG8GM8PySmjirPkA1cKuk0ft5y9z7FcavqNVaSj8iR/skJw7hT5pms64kurJhuwNao4igJPdUPr9yEhQOq8pUffSAY0cku45i2C+UYBFlY4VwZQknfSonlv8AcDtQB1K1IoP0zrIFfq3BJplT6CtfRIUxZaYBlHksKgVAw==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by AM7PR09MB3672.eurprd09.prod.outlook.com (2603:10a6:20b:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 06:30:40 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Thu, 14 Apr
 2022 06:30:40 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2 1/4] git: correct license
Date: Thu, 14 Apr 2022 08:30:15 +0200
Message-ID: 
 <HE1PR0902MB18013DCD66FDF4F866430A76A8EF9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [+r2xPU9wR03ubexIJgBkOJrct7VLoIkCvYYYVPBYAkpm2s0bqTrEv8OkMYbR67J8]
X-ClientProxiedBy: AM0PR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::17) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220414063018.2413225-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53cacfc3-110c-47ca-ef22-08da1de04b44
X-MS-Exchange-SLBlob-MailProps: 
	6rN1YWC+iUUh2cOq+DQcUfYo4iQopDoq9kD31/Qm9KDVVd+/Ix5DZP0I5WN9ondiYrnH2DNK7i3VnZNdLDgXg/iZ1ssEZz13eKVpG33FWVTPcj28S3f6dTK1IEcp6M93+QVwG3Ztnk+JJg1k0Ts+aFvdIXToPtcZnDHk86PK1hMvPjMuslkk0dLYRCoZP9JOf/zSmB+cCbZlNz+z7Ids9H2MhbeLTkowra9srPzgv6H12lc2PoCaPfrz6BvyJtlGDCmdbUGhmAt3LYodXznDFhbFGnc/HXlcdGMKMhEcXLFFuRxal1ZWIhc/WArS/mcX4MzeOoiADlAQSQ/Ws+aBbaAOfosRDCwyvCDvK2sgVCRY+H326l89LZCjJGOHo7egtPaytdihEjC7wtOWe7p+YgSCkPuK/CehsJg21HYdzvYqqOVNCWJ0zz6NGXSHC8SsBUwwhjyEgtjg6Tqh/YFsGdyqolwEnmZ5xC2UWQ1aOkmfNxIQMWqiIbxt0h5UTDfCQhFgwL7fhFEUPizmZsrOkq6tqh4vlMNfzLU3hxzGPsvV9K71XT1JmXtbBl3GWteAGV7F70i2bN3GTQen++1dXnJnhcHjaovgrWpQxQpCsf3uWP4oDd8zRaMn+VqOQtOLDfaojaG8kBjB5njH0Ab+oRnOO9fCKOX4jL2fGDC143HAnz3wdcMpDItMRW3yVthxwR4npElNkKrGnliDY3DKixArIEusMA+78SYqjUEUsJ85h5NvHvungLVm+4/dDjWHcTU8dHUf1jMNTwW9wfcKKu/b7QbZkdlW4z4sRh6P2Eo6EBuOJCtzpgBwIMtRVYuT
X-MS-TrafficTypeDiagnostic: AM7PR09MB3672:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ASTDSiryK4D/k8nFxxJ2+JGUTGW98EibVoD2qzTYajGDAWljp+f5GD9YWmnSzTWDLxbQgbcH9k8cjAvsRsabeuNqxVaZx7+sH3dEKH2W7BudTrcvhHO8XaVmiZxkOWHOvesFTith7b0QjYFavueRXQw78ZdLx06Yk7ATSRhduJWOv8WgxK9Hnglxbl2Ma7mmqKqLG2rZdJRLlrtB5g0Gtn2TgsJkc2SS2LKlqXS3p18HAGk4Pp3YcfN/8LJywiaxxQjlOjhedCQlyrWCmgknvEb7/eGhWfu9AJdUbjHaIy4bs2KHIQ/OdT+t9SlOZwQdhP7opQXAaVQb6ZI3Jn8jzB3v7A+brNf1Bf+ZsibI47O0/ldYmRZqTUSQB54duF3PQ8UCFsAmVBW2eyohHpI8h5Tiw+iNbsop+98hryih498xSsh97+XlHGTbNa4DG7JlXFD/947CK8tmNW2WNXN4F01tXY9P9Fdbdm/DTVwL/BON7EVPNI7UcC2FGN0S7/bbo6wZuV/knPiIzXKfHhXiWr2YX/t+F2ocUCdGqhEeJITzIXCJtmR9MDrtznoIxyBDzVa2Co48qQ5mceXoQcz01vjkgE3CXjzQ4LMIlEVL01CXEBnDrZ+n7OOwZHeJiF6a
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ilBUQAUSzwLzMOTg7yvfcX5mid4l+hhi808eovwlz7RyXRRO/b8neCta0WtH?=
 =?us-ascii?Q?q7jDdhU6FlHoVPz95jmrP8cRJAaWe7v/WuJJ6oSkUDP5gkgaoNsCufE1RoLh?=
 =?us-ascii?Q?2Zw0Ay6EW2PH9Y0cpmg24ZqaPfIquzz+tfwAntdYk5UY0Y+7b2FZPqufg/S7?=
 =?us-ascii?Q?KN883xvHwsRQYeVU/RvelQim0nZwELHT+S8fCqkibL7Pmy3SEc8drxLCyU60?=
 =?us-ascii?Q?EVhY+zMIEJlbJ/io6QtGw/n4SnsKSeMbQ1jm60DnXsZKarJ3UISGb8nbiRgS?=
 =?us-ascii?Q?NbTLUW9FUywSHCQBS1GuMZW/AZSw4jqHMVSgZb6lfweZ4zRc6YHIEX6AVs8V?=
 =?us-ascii?Q?jZ5MYX/bE6cKCnGeIKce4jTvToVZ9/3GdTYIc2Y5VjqJXDh9N0aPMOB6dqCP?=
 =?us-ascii?Q?DMTUIn6qsgi//mP0hCfOOpsCokk2fOMh6B3TMbhqDlolaMJj0Ko2IqH62TFY?=
 =?us-ascii?Q?0ixuwzk6FvUAPYRwzhPfBKsrrzcnCByrpeaLpUMdvbyzEw8fuD9y2RUSAUkK?=
 =?us-ascii?Q?QAJKV4oiepXYzQRkBLcidRnm27ruVcU1c9NbZ2neUQUxCSv5/0RdHaJ9rTk8?=
 =?us-ascii?Q?9DRJJsS6hl3qfxvndM2UIQCJ3eteieXxyjmW7UPYLqHvydhMcuQg6Kl+LQOF?=
 =?us-ascii?Q?NoLZ1CZcNCtmhXp6hikNpw6+TFdWOChI4dhVtkrdAJYZumhpdGts4NDvbW7B?=
 =?us-ascii?Q?YAGcMMGY9PuHD8E5IHFREJpe8Xht/idd/RfcRyqUrTAjp6BDvXVG1JIdRX0S?=
 =?us-ascii?Q?tQqweeVd1wuE+3MYmrSXTpj/aA9YZTORWPrswOoOOAJKs7BnSRnq0GKDE/MW?=
 =?us-ascii?Q?YcQROfsMvu8v9gJpAF3lbYggyMew/Fa2zByHhEzli/onFHJrH2ckf2l6J8mj?=
 =?us-ascii?Q?qpOnqmHsy+mEqdF8JP86HgfyOzP98d7VAPtNK00y/Z9jB29xKqIfXDLhMABe?=
 =?us-ascii?Q?fGPdnXIolf8DomQ94UIh6H6KV+jlduUNzKdrVijiv+w8MdL30ZoycEwmT+zb?=
 =?us-ascii?Q?DA90B8rc6l0MBCbH0WYfNBG3iAst35BLyleCn4mhRAkQd/SURIoxoHqwTzYR?=
 =?us-ascii?Q?H+LP/39nbZysX9KOXHIrQ/zhtOOIkeiPhvZkfpgorDvpIrRDfbP8Rth8Lq+z?=
 =?us-ascii?Q?OB65I5VsQK5wmrpCzFW6ktKwGmvnetNPaZPRq8ciYf/m0mPKbOuFCegjteBp?=
 =?us-ascii?Q?T+rAsXHASPjeAb6rV7/5BfKaPBOX8e0EFL7E7hlLeye09iYQip4UY4zxxspH?=
 =?us-ascii?Q?8GOckopRGI65WKcw0kkv/wkPjek79/bJA309WgWkHEcrGimCTkUuNeeoBQkW?=
 =?us-ascii?Q?T/gKGM8yA+7tK4//wLQyAKT+fyeRJ0auyzk4a7Cubeevm9vE0rfZqQsGMwf0?=
 =?us-ascii?Q?vwTbwxLJualh97kKUvposZ0/IyUE7PYnteR9b3XrLpiM+qhcuUQ2oZiIBby6?=
 =?us-ascii?Q?ItAi8SnP3xIcpiH8JiQpR1Len9oj22Di1hMIVn65RkKGZr3GdvM2nbF3fuy0?=
 =?us-ascii?Q?SgVTwNrERcpGgcg=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 53cacfc3-110c-47ca-ef22-08da1de04b44
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:30:40.2472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164391

by default git pulls in several code fragments not being licensed
under just GPL-2.0-only.

obstack and poll are licensed under GPL-2.0-or-later
reftable being BSD-3-Clause
sha1dc and inet_ntop being MIT
netmalloc being Bosst-1.0 aka BSL-1.0
regex being LGPL-2.1-or-later

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2:
- list GPL-2.0-only explicitly

 meta/recipes-devtools/git/git_2.35.1.bb | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/git/git_2.35.1.bb b/meta/recipes-devtool=
s/git/git_2.35.1.bb
index 47c2211864..918ff68bbf 100644
--- a/meta/recipes-devtools/git/git_2.35.1.bb
+++ b/meta/recipes-devtools/git/git_2.35.1.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Distributed version control system"
 HOMEPAGE =3D "http://git-scm.com"
 DESCRIPTION =3D "Git is a free and open source distributed version control=
 system designed to handle everything from small to very large projects wit=
h speed and efficiency."
 SECTION =3D "console/utils"
-LICENSE =3D "GPL-2.0-only"
+LICENSE =3D "GPL-2.0-only & GPL-2.0-or-later & BSD-3-Clause & MIT & BSL-1.=
0 & LGPL-2.1-or-later"
 DEPENDS =3D "openssl zlib"
=20
 PROVIDES:append:class-native =3D " git-replacement-native"
@@ -14,7 +14,16 @@ SRC_URI =3D "${KERNELORG_MIRROR}/software/scm/git/git-${=
PV}.tar.gz;name=3Dtarball \
=20
 S =3D "${WORKDIR}/git-${PV}"
=20
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e=
1"
+LIC_FILES_CHKSUM =3D "\
+	file://COPYING;md5=3D7c0d7ef03a7eb04ce795b0f60e68e7e1 \
+	file://reftable/LICENSE;md5=3D1a6424cafc4c9c88c689848e165af33b \
+	file://sha1dc/LICENSE.txt;md5=3D9bbe4c990a9e98ea4b98ef5d3bcb8a7a \
+	file://compat/nedmalloc/License.txt;md5=3De4224ccaecb14d942c71d31bef20d78=
c \
+	file://compat/inet_ntop.c;md5=3D76593c6f74e8ced5b24520175688d59b;endline=
=3D16 \
+	file://compat/obstack.h;md5=3D08ad25fee5428cd879ceef451ce3a22e;endline=3D=
18 \
+	file://compat/poll/poll.h;md5=3D9fc00170a53b8e3e52157c91ac688dd1;endline=
=3D19 \
+	file://compat/regex/regex.h;md5=3D30cc8af0e6f0f8a25acec6d8783bb763;beginl=
ine=3D4;endline=3D22 \
+"
=20
 CVE_PRODUCT =3D "git-scm:git"
=20
--=20
2.25.1


