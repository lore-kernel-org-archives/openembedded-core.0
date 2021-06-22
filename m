Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.26.1624383474132376503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 10:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DCSJ7YOj;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MHXOPV003370
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 10:37:53 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 39b47h8ksb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 10:37:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVPKtDCOgz+c9T52RE8a0yY5J60ZKVbn3K7tUN6XKCtflgdKR4U312vnZCM5OvcqsLCp68P9VNRri2Cyq3CGj4QtFAjZq47rlmKSW6BU7OFqtGBkrRFTiZJnxmXOzfx2OvUvngtFHr73zDUQlw7uRgFkH2Q0hCElFHzu3PXCSlFcN5CVbaf6dgBclhf4si27920Yif/fx0IFf46NTrgmWtcW4Yw4Lq3HnNdRc4vci7MMkHTmOg+JB7/YfRMKR/iFUhfnK709uTlQO4iLUwKKj4YY31xmrejfC4qi+E0gqFLVBP+D/czuk/ZSg6HVMo2hFEgH3mGnWA7PqoTj2FyR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnOHwWzIaXJJbDy3rk1u2oDoGEOH3E/+kglnT/IC/uQ=;
 b=LQgGh93Qfb3Y65zORiXWgESaEPpFLPpdKzLFlmqD86wXx0KEgtPf6vH2NrcVdllH5mmkJ48RfAERSBy2fszfCaAan1vSt1liM66SL1Hm14I2gvCvl28tlOxpP5oihnAjMS3PV0Isnq0FAUY4bbpI3mtU05jQ/++EszXTv89sbjGa+ypGoYI4gghDV0PgHGdBq71go+tkHyn0cUz4jNpci6t9UdxCAdkk1YZakKrOxgJEJYMTXU1r2ETqzisnGmeT1O/kCCBjeGl+guqWYLrylsT5a3wdSSZAvsz1xXEKPUELLV+b+Vhxa0UuawTgZp+4yYug6vXeVPNB+nFpOEWkLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnOHwWzIaXJJbDy3rk1u2oDoGEOH3E/+kglnT/IC/uQ=;
 b=DCSJ7YOj3933zduEtvKKXgVz7YnVFAbYRTvXoc6Uu0X9UX3kIWSmA4bHj0XED7wd3WKG2hVWzA3xljDA8kqqtOzQAX5Iq6ofsHJpsYRhxPPHlR3XpT4gx9NIHpc4qJZK8I9s+PeGTDMiM5iQ+vkO9R46im64lbcdOcoAYtYwOrY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 17:37:50 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 17:37:50 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] python3-pip: upgrade 20.0.2 -> 21.1.2
Date: Tue, 22 Jun 2021 13:37:42 -0400
Message-Id: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BYAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:a02:a8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 17:37:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a241981-14b9-410a-6937-08d935a47502
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4800AB53D5FA5BD512667F8F9F099@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5REVrPeKyewg7vntiCboC1RNHQeHXETArktMTB8O35iAXyL6LNQw8g8s2Hla901FaZA4QgvwVqgXP+q/A5MIDAY76cOzdJMcOpaLTo9Ai4h59Kk5zODrMsWR7smkPHw1qaVk87EdTVSJH7IeQQhNFlMxJY+touOW25lUrC5PtO0JyPH4KclUzHlC7cVXMgHExXC3wkSPasj0vBagAM+aoMv2bAGTHAXuDdIzSvm9o2Hl3VivTKPhJ9UY4gG/t55Dk+DARiE+Wo0gDssZUQelslZFA28ZODMtsZHY8SpNDxGbNNj+6FuBhcTa4NIQ7KVT1SEoulTYZEl3lAT2bWG30g53lB2CnwiQZU96PJz9ZaLfYTfsK8yPW1wNjFS9bKdmEi7KsnVO9Dgp+iDL734B2PaP3bLf+CCNomvqgg+LrTWvS6l+2xXKofyMRwwDSmMFjswiJkrB1uio98WT9wnBg8gzodRITM9dpbmThQrohYyGGISlDf5WcifCNyGDIPQSg8DtxywMheJNBn4+dbN822eoHUn7y09xrQj19TC91lFP3bt1YJ0dc4i/OJoo/Zl5Z50gGLZ/sznPkE42BJ6KCX2QKc+afXR8fimSqjeRuIVswO6AGvTbVPx2nNzQZNECvRjn1gM6pCX0Cds5McytU3jl43eyph64CC3UIzp7l1BBETBPmNKHTgd8fLCTv6Ub2ni8VIslHK31grE1jMTSrLh/rEatDcmr0xD5cMJRXuvnZm20SED6SpWLcl7p33avOU+CsTvz8Tx66mXA0jAKk0Wq+4mHv+emgrW/lXOIys34LKJkV1eBQvkiIWgWzi77ls+jImjGJu4Ls2ntFbdMQF3P9S2zwuJF2Ux8eHhsEec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(2906002)(956004)(86362001)(478600001)(44832011)(6666004)(2616005)(6916009)(83380400001)(6486002)(186003)(8936002)(66574015)(1076003)(6512007)(6506007)(52116002)(36756003)(316002)(8676002)(66556008)(66946007)(66476007)(5660300002)(16526019)(38100700002)(26005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUpkeG51Q1VVZ09WNS9uWXZDYnZDTDE5UjRKb2JGN0pncmgvODB6Um4rQkRU?=
 =?utf-8?B?TENzd1JRV293ME0rWXBNL1NFc01rVHZ0dmlvcDBtdGpXS0d5WFdsSCtiVlI3?=
 =?utf-8?B?Sk12eXZQLzJFNzY2SWhsbTZLN0syOU8xWXMvME92VXljaTdJNHBUYTlyc3V2?=
 =?utf-8?B?WllFeUplSkRlL0RYZFIra0tYamRMY3NZS0R2UFlyOWV5cWV4RnVtODh3S0Uv?=
 =?utf-8?B?WW03cTQrTVJPQUhUWVAwMlVNS0JjaEZZTXFxQ2NnZk1DMVRQWWFXSFZ5ajNx?=
 =?utf-8?B?US80NGthWFIrVVY0TFVISUFITWFMdXgzR2hseTdJRjh0MzFFdGhXdkFmYk0z?=
 =?utf-8?B?b2V2Smt1VGZxbEpQN3FVYVNQc0hJY0ErWVZ0ZExzQ0JXMmdQV1dZajFFYXVv?=
 =?utf-8?B?V1ZxMkJneU5qd2lsZ3BPTEhxYVE1VEc4MVBjYUdmOVdQQThjUTVzaEZwUkph?=
 =?utf-8?B?ck41dEo5Nk9TMnBOd3R4SHFIcXpBOGFXNytZdVlOOTVqaTN4MW5FYTcvQnpQ?=
 =?utf-8?B?amNKRVlDSVVqYTdodXBTcERHNkNMMmM3WEZYQkFpTlVONnFYU1RBRWZmYVJ6?=
 =?utf-8?B?ZUc2T1pLdGlPVnV5S29xYVZ4VVNZbXRldFUzLzhUdEZTOGpWVjREb3huQlAw?=
 =?utf-8?B?VHBEWG9XNjJRNUw3TVVQaTUzRitDdzk2aWt0dzVackxxb1FaeE05N2NMQnJT?=
 =?utf-8?B?NUFGL3ZrYlZNYnZRbmFacmM2SGVGaEZCZ2JmQzA2SWk4bktqVk00anBJbmp5?=
 =?utf-8?B?SG1PZ0pGRER3cVFtNEVYSlA4ZXBuWFdWNGJsaFRTdG1tZXFOSmIvRFFJRGF1?=
 =?utf-8?B?bFdENEJtaWFrNmh1ZkZjSCtBaEYwSjRTamIxOEJCWGpMTVdXaDFvQXB6eTZk?=
 =?utf-8?B?VkdWaGd2L3hLNGVkWE5Xbk1mOER5cUUwWHZ1YjBLcUJVZXJDcDVaRzE1ZjlX?=
 =?utf-8?B?UFNSbWhoSk5CRUFlVzVhREppR1UyRDV1SU00aURCaG85dzFKaXFEM2RUQ0VW?=
 =?utf-8?B?NERIeWRzS3JNaE9BZGtta2Vid2RYVzROdGl1ckRRcUc2UUFjYnF3NW1NbjRH?=
 =?utf-8?B?UFdRSHkweDJ3N3F6UUVBaG5YYUZ6THJvMkZvenFaUytkdzFBdCtsMThkWm5S?=
 =?utf-8?B?R3FpOUNURkJsK3l5djdiajI3SDE1QzlrQTR6eGpYeGhBb0NqODZ0Yyt2ZWs5?=
 =?utf-8?B?YVJ6K0M3cUVEdjBhN2VEeFhtd0dvbXVnL1l3MFBjT2UrVjhoa2JxYWF0QTZ3?=
 =?utf-8?B?SmhwTjI0UG9lR21BRDVuZW1oL2lsU0R0ZHdibjFjNHRLQTdlSVByZHRITE52?=
 =?utf-8?B?UjZvVkdtdE9MZHlTaEFkSkZWRVBZS1NTUGdNd0xmZ2tUenRzVHAxNTFzMWw2?=
 =?utf-8?B?Q3k5L3h5UjAyYVZMR3gwL1I1RldBcWFQK1BRaEFxUERMQ0JObUJkVitWZWxV?=
 =?utf-8?B?SjZwMkZyUkxiV1lEUUR0SnNYVzE5cDFLRm1rUzd4eGNRRFZGSGt4WnNMNmlW?=
 =?utf-8?B?N0p2SDliNXIyUXpzTG1xMUFsUXh3MlB0VlJOeGZ3VTN3b09oNHV1aVFJaTVx?=
 =?utf-8?B?MHp2ajB2MHZqNmVTS2tqaGdrbG8rSlg2cXNENk9aSFE1eGJNNDhEZGRRRTN5?=
 =?utf-8?B?LzVITTdtRDZLWmZRNm9IOVBobjJyVEZTbkN0b3VVZi9CUnFzZ25NajA4MVpC?=
 =?utf-8?B?NE0wT1IvM0loSGpxR3Y0bXlQdXhGYVROZTlQVmMxeEtOYzBHQi9wMUVuMlVw?=
 =?utf-8?Q?EDZ8fMjWOOPAydq5XikmC5Eh5fE6poC5c6QwmNE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a241981-14b9-410a-6937-08d935a47502
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:37:50.5425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WH8bArVlnjvOIKXnG8mHAU7OJKCj1F/Xtzu/QSsHSI7fXuLjpKRVhu+ZnxS2+PqKf5cE/HjY0ENhDjhg/UrbegtmH4nEv5YnjBBJ0zN7o2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
X-Proofpoint-GUID: 3mnDiRntwuzDBFgUB_-QllOO_qq6EfBb
X-Proofpoint-ORIG-GUID: 3mnDiRntwuzDBFgUB_-QllOO_qq6EfBb
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_11:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220108
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MHXOPV003370
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

21.1.2 contains a fix for CVE-2021-3572
(https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb=
30b)

The LICENSE.txt signature changed due to an update to the copyright
dates, but the terms are the same.

Also update 0001-change-shebang-to-python3.patch to cover all files in
pip's src directory, since we need to ensure compatibility.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-change-shebang-to-python3.patch      | 128 ++++++++++++++----
 ...n3-pip_20.0.2.bb =3D> python3-pip_21.1.2.bb} |   6 +-
 2 files changed, 101 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_20.0.2.bb =3D> python3-=
pip_21.1.2.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-pip/0001-change-shebang=
-to-python3.patch b/meta/recipes-devtools/python/python3-pip/0001-change-=
shebang-to-python3.patch
index 00cffe169b..0187001168 100644
--- a/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyt=
hon3.patch
+++ b/meta/recipes-devtools/python/python3-pip/0001-change-shebang-to-pyt=
hon3.patch
@@ -1,32 +1,30 @@
-From e7a00e9b5104ae2fbcea32a35c85760b77fae7e5 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 23 Apr 2020 09:42:10 +0000
+From baa85a4dab2e8d64eb25d1181b6420db25ce919a Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Tue, 22 Jun 2021 12:31:46 -0400
 Subject: [PATCH] change shebang to python3
=20
-Upstream-Status: Pending
+Upstream-Status: Inappropriate (OE-specific)
=20
-pip will drop support of python2 from 21.0
+Despite no longer supporting python2, some files in the pip source refer
+to "python" instead of "python3", so patch them as needed to ensure that
+they correctly reference the python3 binary.
=20
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
 ---
- src/pip/_internal/__init__.py             | 2 +-
- src/pip/_vendor/appdirs.py                | 2 +-
- src/pip/_vendor/chardet/cli/chardetect.py | 2 +-
- src/pip/_vendor/requests/certs.py         | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ src/pip/_vendor/appdirs.py                    | 2 +-
+ src/pip/_vendor/chardet/langbulgarianmodel.py | 2 +-
+ src/pip/_vendor/chardet/langgreekmodel.py     | 2 +-
+ src/pip/_vendor/chardet/langhebrewmodel.py    | 2 +-
+ src/pip/_vendor/chardet/langhungarianmodel.py | 2 +-
+ src/pip/_vendor/chardet/langrussianmodel.py   | 2 +-
+ src/pip/_vendor/chardet/langthaimodel.py      | 2 +-
+ src/pip/_vendor/chardet/langturkishmodel.py   | 2 +-
+ src/pip/_vendor/chardet/metadata/languages.py | 2 +-
+ src/pip/_vendor/requests/certs.py             | 2 +-
+ 10 files changed, 10 insertions(+), 10 deletions(-)
=20
-diff --git a/src/pip/_internal/__init__.py b/src/pip/_internal/__init__.=
py
-index 3aa8a46..e1ad179 100755
---- a/src/pip/_internal/__init__.py
-+++ b/src/pip/_internal/__init__.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- import pip._internal.utils.inject_securetransport  # noqa
- from pip._internal.utils.typing import MYPY_CHECK_RUNNING
-=20
 diff --git a/src/pip/_vendor/appdirs.py b/src/pip/_vendor/appdirs.py
-index 3a52b75..ad3f81d 100644
+index 33a3b7741..60b9ef5f7 100644
 --- a/src/pip/_vendor/appdirs.py
 +++ b/src/pip/_vendor/appdirs.py
 @@ -1,4 +1,4 @@
@@ -35,18 +33,88 @@ index 3a52b75..ad3f81d 100644
  # -*- coding: utf-8 -*-
  # Copyright (c) 2005-2010 ActiveState Software Inc.
  # Copyright (c) 2013 Eddy Petri=C8=99or
-diff --git a/src/pip/_vendor/chardet/cli/chardetect.py b/src/pip/_vendor=
/chardet/cli/chardetect.py
-index c61136b..a497e98 100644
---- a/src/pip/_vendor/chardet/cli/chardetect.py
-+++ b/src/pip/_vendor/chardet/cli/chardetect.py
+diff --git a/src/pip/_vendor/chardet/langbulgarianmodel.py b/src/pip/_ve=
ndor/chardet/langbulgarianmodel.py
+index e963a5097..97ea6cea8 100644
+--- a/src/pip/_vendor/chardet/langbulgarianmodel.py
++++ b/src/pip/_vendor/chardet/langbulgarianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langgreekmodel.py b/src/pip/_vendor=
/chardet/langgreekmodel.py
+index d99528ede..4a127ea83 100644
+--- a/src/pip/_vendor/chardet/langgreekmodel.py
++++ b/src/pip/_vendor/chardet/langgreekmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langhebrewmodel.py b/src/pip/_vendo=
r/chardet/langhebrewmodel.py
+index 484c652a4..676c1a711 100644
+--- a/src/pip/_vendor/chardet/langhebrewmodel.py
++++ b/src/pip/_vendor/chardet/langhebrewmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langhungarianmodel.py b/src/pip/_ve=
ndor/chardet/langhungarianmodel.py
+index bbc5cda64..042eae70a 100644
+--- a/src/pip/_vendor/chardet/langhungarianmodel.py
++++ b/src/pip/_vendor/chardet/langhungarianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langrussianmodel.py b/src/pip/_vend=
or/chardet/langrussianmodel.py
+index 5594452b5..564b02e58 100644
+--- a/src/pip/_vendor/chardet/langrussianmodel.py
++++ b/src/pip/_vendor/chardet/langrussianmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langthaimodel.py b/src/pip/_vendor/=
chardet/langthaimodel.py
+index 9a37db573..c97487959 100644
+--- a/src/pip/_vendor/chardet/langthaimodel.py
++++ b/src/pip/_vendor/chardet/langthaimodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/langturkishmodel.py b/src/pip/_vend=
or/chardet/langturkishmodel.py
+index 43f4230ae..7e710c371 100644
+--- a/src/pip/_vendor/chardet/langturkishmodel.py
++++ b/src/pip/_vendor/chardet/langturkishmodel.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
+=20
+ from pip._vendor.chardet.sbcharsetprober import SingleByteCharSetModel
+diff --git a/src/pip/_vendor/chardet/metadata/languages.py b/src/pip/_ve=
ndor/chardet/metadata/languages.py
+index 3237d5abf..aa2ec7c35 100644
+--- a/src/pip/_vendor/chardet/metadata/languages.py
++++ b/src/pip/_vendor/chardet/metadata/languages.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # -*- coding: utf-8 -*-
  """
- Script which takes one or more file paths and reports on their detected
- encodings
+ Metadata about languages used by our model training code for our
 diff --git a/src/pip/_vendor/requests/certs.py b/src/pip/_vendor/request=
s/certs.py
-index 06a594e..bfa7839 100644
+index 06a594e58..bfa7839a4 100644
 --- a/src/pip/_vendor/requests/certs.py
 +++ b/src/pip/_vendor/requests/certs.py
 @@ -1,4 +1,4 @@
@@ -56,5 +124,5 @@ index 06a594e..bfa7839 100644
 =20
  """
 --=20
-2.24.1
+2.31.1
=20
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/re=
cipes-devtools/python/python3-pip_21.1.2.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-pip_20.0.2.bb
rename to meta/recipes-devtools/python/python3-pip_21.1.2.bb
index 99eeea2edf..fd7a145205 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
@@ -2,14 +2,14 @@ SUMMARY =3D "The PyPA recommended tool for installing P=
ython packages"
 HOMEPAGE =3D "https://pypi.org/project/pip"
 SECTION =3D "devel/python"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D8ba06d529c955048e5ddd7c45=
459eb2e"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dc4fa2b50f55649f43060fa04b=
0919b9b"
=20
 DEPENDS +=3D "python3 python3-setuptools-native"
=20
 SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
=20
-SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
-SRC_URI[sha256sum] =3D "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa49499=
20675563a5a6967f"
+SRC_URI[md5sum] =3D "a867fd51eacfd5293f5b7e0c2e7867a7"
+SRC_URI[sha256sum] =3D "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff74=
97357b9ebd19f79b"
=20
 inherit pypi distutils3
=20
--=20
2.31.1

