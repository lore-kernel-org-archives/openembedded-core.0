Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.835.1624387269490097212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 11:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TS9JsYeD;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MIYjoX015732
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 18:41:08 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com with ESMTP id 39avpmryjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 18:41:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGKhAPyZxI+hbVpgqfH8ekz/EaidzA/BQyWs5H4T5oXnl73I0FqFoUd61z9FPYdxMXDZ/e4WX7qMubJhLBMYrMCabADnoYQeqNYKm1Zvn+Qb2C/RIrO/8GdBaUNDMjIdtmANfpZdmJ37OPlOrASB1ZaCq8qNGbVMt5LXPq6Ob/C85RQ5bnQCZtbh0H89vAHn7gaImnmIPEDOEZ1YljgcAQFO+hn/w38O6ci6CTkJp0F8h3ldwCNNewZqMZiytoEKDJ1T2MmWU0dt2IEj1jtROZKF4pFC5bImrZ8VDE8TUkdIz2BFqiYEz8OEF/MRKcB6GLrwE8dLGSocoOf74zGyvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8F9yfkMdrGqJ5glxKCmg3GOJvc7Ev7UB72hblIUzH4=;
 b=FHebOZUnCFPsbfKR39700Cc0z1vJkdK1PC3f7/ujppv1f85B5mHqeyk658+xUNW6ZQ5IEmfYOKS5tgG7OvpCcLjp5evs0J/2qfe/tAKbTLhERdyUqld2XBGoWmgtmxN4YumcgrSgq6fFZ1xhqmDEZX+0c4op83b6l7XxW113yfqVRJoXFCUH+VF2Zb66Ix2yxApen7ekw7tEgkENVG6yjlS0Ltj46ajOQx88883rZ3BVx5pcYRDvB/GMO9x0+vSILCSPzaZS/8FR5q+T1US8fad6y4j4gf7m3qZNL0LLDeJqsVLChVhoBHC++aV0dSHU8A4KfeaN/C3upDIbwNQo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8F9yfkMdrGqJ5glxKCmg3GOJvc7Ev7UB72hblIUzH4=;
 b=TS9JsYeD6ua6WLBzXqNG9VsMWE5e7Plb32Tz8nhYcpDHp7xsQe2yrjoZPUjOp/ZLYsioUrwBOHnK1uCg61A0/teTAwhPURKSq0Z7O8HLDLVG5A0i4Yi69UeUu7TYMTRkPBzj0578sh+uZuMqNkVrMu1Zuht4piXs6tBT5tlN1/E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2904.namprd11.prod.outlook.com (2603:10b6:a03:87::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.22; Tue, 22 Jun
 2021 18:41:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 18:41:06 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-pip: upgrade 20.0.2 -> 21.1.2
Date: Tue, 22 Jun 2021 14:40:59 -0400
Message-Id: <20210622184059.1366900-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: PH0PR07CA0056.namprd07.prod.outlook.com
 (2603:10b6:510:e::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by PH0PR07CA0056.namprd07.prod.outlook.com (2603:10b6:510:e::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 18:41:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1dad9e8e-d707-4e0e-ab81-08d935ad4bbf
X-MS-TrafficTypeDiagnostic: BYAPR11MB2904:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29045410091E05B236CF94929F099@BYAPR11MB2904.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iI9fu+FYTZJvtfrmJ5mt9fy4RlL7PdGhbC+ptLTwvPvpxSATcvSveR0EPRr6tYUxFOIpCh9EblySWl4sDpAxsea0A7SqhydTecdRfVL4HdaNKM6BYSK8JCQcgFMZ2TqTUvzcQTXaL2Bt+hY18VQwK6aQaRNy7q1Qy1EiwOZqcqw6jMF8RBc5saHB8IssmjLynJXFcDWN7fMrhTiwHMbO+Lz7Z2bTREXG+EAk6KR4fT4XUp3LI6ynwVMRJpoxE9/iAYtu8iPIF5WpTq8PXToDNgJl5s72btiEBkWEQLKGSm5dF6IAKbgrjDqL4aKZ/4G9OOZQK+wLQtCjwRI2NltKWbW7mpwxRUIL/rrovKP+7Om6VOjaXYLiJUTGOgPGbSbWFSSYivXir7oK3y3CBGKTy0uRJwgT1ou7/8m95kH050ek9rGDxfrTKtsNohClwgLWEzuRzfoSOz4bjrMXNx2bYaIEgDYaTojTCv8YyGASXqDmn3edPc+5zPufujWHQq6niKLUb1JaUF4Y5J7qKzDay34goTu0HFOIApquGqGEnaz/gQ14frRApB/AxLKFDGvbClXlZTMA0WyVTLwjTx67ZBt4m0sDxX3OTdrLY8/XPQEp0nGzjELF3MByIN24Ae0U8t53d+QpUDllPrV/E+xMwPsD6Zk/Et0m6WUw4aEagAqcZuy3hJKDzomElBzEZrZIxLhZgyZVonsPHvVEtcSsEzaM9rni1e0QO4PbJQozYA7hvmokyFVc6fO3hxChRHMbHe6Lj7FfXU+LVr8IvqKPqq7hLCGAWixDwdlGO3UpCqDH8tIOIhysH1itr7s8+LcW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(366004)(16526019)(186003)(26005)(2616005)(956004)(44832011)(6916009)(52116002)(8676002)(8936002)(6506007)(6666004)(36756003)(86362001)(2906002)(38100700002)(316002)(38350700002)(1076003)(6512007)(6486002)(66574015)(478600001)(5660300002)(66476007)(83380400001)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cDBBL0I2ZCtGdkNGdzBFREc1N2tnVWVwc3BUelNsS1RBdDVzc29VTDM2ejJY?=
 =?utf-8?B?SldiRDFLWEZFNEtXMDR3NEJnUnM3enJvV21nSDcrcGVBVnB5bFFYTldLT3Fr?=
 =?utf-8?B?UlNDMzFNWWl4ZEl2ai8rU283S3ZxcmZ1c2xmU3JUUnlkK0xQb3drWTNKZCtl?=
 =?utf-8?B?Zk4ya0dLaUkxei9uUDNMYnplN2NIb3NxbjdkRDRQdWhGaktmTS9rZ0IrSTNi?=
 =?utf-8?B?NjczZFlnNk5pM2JJNlZnbVkrRnk1RERxY3N2RU1KemYzMWVTTGRoZFUrL2ll?=
 =?utf-8?B?L005OXVtaWNWVjBDNkY3S1FvMno3Qk5uR21JUXN0dTNZY3FVa0NRKzFKQ0Iz?=
 =?utf-8?B?MTdQQ0JoNVY3M3A3eTdXaDR0KzJPUlBTdE5JWHNSTjhHdTJjSUc5cStLSFF3?=
 =?utf-8?B?Yzg0Y2NhVkxQQm1oVmwzR1p6TDh0VnVoTUVQdk1Bd3ZlZU53NDdCT3BDVURw?=
 =?utf-8?B?WjR3NGxyTmdEZnhyeUY4dFhnNmtPWVpUSkVMbjFKbkM4RUdlUU5tdEdWd0dE?=
 =?utf-8?B?MDNvQkl5bHprZm1CTGs1UjhUZ1BBUFdtU3NSM2tDM2Q5WWtmeUJjeTNDZ0Uz?=
 =?utf-8?B?TktjcXlrUHovVUFvUWRnY2V5MXBZTW1nMGxTMUl3TmMwZFdHY3hoc3ZmcVdP?=
 =?utf-8?B?Qm94UTZ0bTBCN09lZzIvbnVwVHdyMUlaejdDZEV4TGp3KzFzcFczeHhFVW1m?=
 =?utf-8?B?djRZUXZFR1RqRWRiOEpIN1FTRlNiTzZIWWFrd2l1QmFPOE80M2pWUWdVWU42?=
 =?utf-8?B?bnhjamtkc2RPVmQvNStydlJGSVhCYkhNeHJET1QxbVVQbFhaNzgra0I0dDBr?=
 =?utf-8?B?QjM4a0grZTIxYW9HZ1NWSXN5Z0RUemNCVzJUNk8xTE1FMWtkaUdpcHoweW5x?=
 =?utf-8?B?bU1xc25ZLzNWZnZKWlpleUxLNFQwNVlhaDhGOEdUeG9JTVdUWFAyUlRqTHVC?=
 =?utf-8?B?MERNM3JBd2wwY2wvbTZEYkY4elhjN0ZqMW9lTVlERFdVQ3VaQ2p4aDFTZmVN?=
 =?utf-8?B?cWhjVUo2TlpmT0pZNmU5QjJpald2RlhBRWhWZDJnYnBJUkpuc01Qd3VSQWVC?=
 =?utf-8?B?N2dOSHByYks3MDBsUmUyb1I3TVRQT0owendFOG1TYWpMeU53eW1RbUVtbFFN?=
 =?utf-8?B?VzI5NW02MzZWRHRqSU9RbHlJOHdXSDlrSmdKcDZHcS9hV0tITlZ2UDlxN3FM?=
 =?utf-8?B?RURmQWltdEowbUpRNUZQcWVud3lTd05sUGpCN1RENjR6czc0S1plbHkxUEw1?=
 =?utf-8?B?RXJtYVRpL05VRnA4TjFqOEM3TU5DeDNkVStYYUFxYnJPajRTWktFaFdTUTdz?=
 =?utf-8?B?NjVuVmxabVlzem1SczJJKzRJa1JTM3d5YmxsT1BzY1RHeExEVk9WZTBnb21o?=
 =?utf-8?B?aTRoMnR5U3F0bkd0YmRITkFheHRJOUZtdHRxS1dGRkt1RzFzdGwwbUdkRmsw?=
 =?utf-8?B?RXc4am00ejdoRG1sWlFUZHZqZUg0NGJkbjl5RXFJcG5NeHV3TTNkcW90aGlW?=
 =?utf-8?B?S21hM2E2RmJYckIzU2VUUzlka1pHVzQ2OUx6YzdiVnBnWXkyT3VUaVlvS1Rk?=
 =?utf-8?B?WnVHWHlMM044NW9ZTGFIelgwbStFTk9mWEU3UWoxS05Ea1k4aXQwK2F2aFpT?=
 =?utf-8?B?aVBXY09vWjU1ckpCYWo4by8wQ1R0TFYxWlc0cThSZnJYYjdyK3BZNHIvbHMz?=
 =?utf-8?B?VDNNMm0zTy8wS3dtRkZGdENzSUZ2N0Q5ODVDS1JYaXMvWU5sYTFsQ2hCaENy?=
 =?utf-8?Q?XYQADDJlkr71JD7Ki+neKLTDE/QJPfyKM8p0Fnr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dad9e8e-d707-4e0e-ab81-08d935ad4bbf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 18:41:06.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9VhhuvrEtB09agOynq7X5SCmO141x5kQiY8jIlvJ+IjJi8VP/d6rlewfXl81YFz9weP6d7rBsx5OPhyN1z4BPjwjPyrmeXZtGOKhOUsYVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2904
X-Proofpoint-GUID: Erj2amYTlaqlpiHbUbJOOyVPwITj97Hs
X-Proofpoint-ORIG-GUID: Erj2amYTlaqlpiHbUbJOOyVPwITj97Hs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_12:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220113
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 15MIYjoX015732
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

21.1.2 contains a fix for CVE-2021-3572
(https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb=
30b)

The LICENSE.txt signature changed due to an update to the copyright
dates, but the terms are the same.

Also update 0001-change-shebang-to-python3.patch to cover all files in
pip's src directory, since we need to ensure compatibility.

Finally, fix the ordering of the "inherit" and "SRC_URI" lines so that
devtool will correctly identify that there is a new version upstream.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../0001-change-shebang-to-python3.patch      | 128 ++++++++++++++----
 ...n3-pip_20.0.2.bb =3D> python3-pip_21.1.2.bb} |  10 +-
 2 files changed, 103 insertions(+), 35 deletions(-)
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
index 99eeea2edf..7367dfdc21 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
@@ -2,16 +2,16 @@ SUMMARY =3D "The PyPA recommended tool for installing P=
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
-SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
+inherit pypi distutils3
=20
-SRC_URI[md5sum] =3D "7d42ba49b809604f0df3d55df1c3fd86"
-SRC_URI[sha256sum] =3D "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa49499=
20675563a5a6967f"
+SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
=20
-inherit pypi distutils3
+SRC_URI[md5sum] =3D "a867fd51eacfd5293f5b7e0c2e7867a7"
+SRC_URI[sha256sum] =3D "eb5df6b9ab0af50fe1098a52fd439b04730b6e066887ff74=
97357b9ebd19f79b"
=20
 do_install_append() {
     # Install as pip3 and leave pip2 as default
--=20
2.31.1

