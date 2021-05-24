Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19935.1621840230750412152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 00:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A7uTGTBQ;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077818ef51=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O79Ihj004791
	for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 00:10:30 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2177.outbound.protection.outlook.com [104.47.57.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qrtb0c3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 00:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKHu+CDFvJGVybpyZ2Zj4sv6m+2YeGVursPPQyrqi1A+fbXF7Nsm378cqoiWlN0HdCVmRxsmYOmM/za8oCX3OuGfGwFmRi1ZrdmILy+4sDBYEOoz/uXpe+Vw/EyrUOqdxpwBvDaRr4Rou3mueXlfTJZr7hOn12DDmRvQRmlHIsuz74amb1CYq7Ka5RIpM4sw0gtWDck1gKJAoeWve7QwaEC0VJNhAG/VdtJyyoq4M7MW97Ag/W/n3+9AKTquJ6b5ViT+TKSIFIEcUHbcNeeVmGADW+omlMCk51RD+x/ZuhEuQyrFMxEUNCSkSrZ6U8qcUypaTLXXyFPaF3sjOHyUqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9x4OMtpy10z+aS5xOS3hoDto9PYMIzBVrmsYrC+6V0=;
 b=nMZegEiThy0PsX3XYEtdo/7FxShrqj1DbQeg/ZQL7teXD4KQlkHc0GGZGvT12KQHqvhrANlmj2Gh+Yk+/y4DKlZGE/4mIEM3iIBQDOIEnLLSQhHouf3NdwUYRjdrTtd2ThwuOy/NTq8PAAlgd5kjeVEvs3B24lDu1f9emwKNApremkg2JJ0LZA1hRltbt+iv5ngAz2Zg/jjR8Tz8P3yHWPinp6LNmJWdbDLk7YSEUkEqEMw/LXfPsUY4j5lyv6MpdfxqP4RuGAGr8s0xIjrtLgQvxUEt15svmTVAQuD1ZpeMP1w/Ozi/mnw3yggj1VmTyAmWepRw/u/nTCCJEgdGsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9x4OMtpy10z+aS5xOS3hoDto9PYMIzBVrmsYrC+6V0=;
 b=A7uTGTBQZBXRbxGgOVnXkyrwKmw0PLC12KCLpU+ZmdYBz2Y+2pyo/+fzxDdkAgicCiuCfOAdfNzsV6jlIDxF9hHU8edFGbl6/Ig0v9X9IkacD+iDyU99j3xXbvjPWR8xkeSurTOP0/pi6xFgn9TuRO0e62GWa04vfHgBBwE0eHI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 07:10:28 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 07:10:28 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH V2] rt-tests: update SRCREV
Date: Mon, 24 May 2021 15:10:11 +0800
Message-Id: <20210524071011.10041-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0021.apcprd06.prod.outlook.com
 (2603:1096:202:2e::33) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR06CA0021.apcprd06.prod.outlook.com (2603:1096:202:2e::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23 via Frontend Transport; Mon, 24 May 2021 07:10:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4342e43-0b06-4e2e-363f-08d91e830299
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4305235E0D8CCC7B8CFA9507ED269@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:989;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wWzUjJ7ArbQtHMqr9egZGHIXINJ/0ecy7BFOJYKG0Xrgw1aYKsJqMXbbaNo5Vw9AO24A6FQ9tRQ3MM3xVnwCNdzQnrRDc1pB+jqq4AFxMmsDiHd0hmFGpJoghUK3i2HqIuyqgFIIRImy1vZhq8kSp1FafGW72gEk2LkMwZPte2GcesGfaBdYHVlydthQ/oNGjX4Ht+kwZDxC6DWnhqiB/tZIIkz/Yf02ozXDN6QSORBfaPRp8AJbjC/uFpjkiQa9gr4YiwaClgJx85t4ek/aG+c72DxBJrDdGUy0wPnUHeQErydaCMVxctGxnhahb5WV95rASVMxX8QoOthKcMutVKvTtiiSalNawA5wmgxMQQ2F7z+h9fiz8YfjhMkVoSVfMPqlJiqE23eQ5FP8zYEG1u3LKo6BXp9miKiVrvw0gXRB1ONWhY1ckp8mo1mqZMEVFttL/XB8H1TiDjOodRZsABIz3OeRJhB1WOSIGGQDcElP2BPUP36cfJiBQA8TibfAbtdytfF3GqSm/IVkamp+IDIt69sQtCLDlaOwVSmpUjv4z5e3niBcVobdFA9BGayqitvhm8CnnOt+eRG4WY7F4dIfZJ4KgaxJAKizOHmUiMq/uY92/bmemItcqTOkD+ytU3OpiYXCL+EAzN6rXA4gR0bNky2mqCE+Ld2r/rHIBFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(366004)(376002)(39840400004)(478600001)(66946007)(66556008)(66476007)(38100700002)(316002)(2616005)(8676002)(956004)(8936002)(2906002)(26005)(5660300002)(36756003)(1076003)(83380400001)(38350700002)(6512007)(52116002)(15650500001)(6666004)(16526019)(4744005)(6916009)(6486002)(6506007)(186003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?/TtysaTs55QxOE2SVA8dGG/xFQawSgd/BbQWHEwYQPm/6Lqjhggo+eF6Dh/n?=
 =?us-ascii?Q?N6JTSnejL5JfZ7qetnwpPxWuKPh6PqSqzeRImvcatQKLQwCrSwbNSPqtSv8b?=
 =?us-ascii?Q?dMJdFVCTI9tL/jh7mWfNnasuCLBZFgLxZenUfvAVnrz7TSxfHnObReBpixep?=
 =?us-ascii?Q?gbDi0Gdxy6sLB9viCw8LRe9FQmbeoAXRlU4Z4T8N6kZSwlOe7uNzjn/u1EXQ?=
 =?us-ascii?Q?WIIVKQJFrpDOhYsvGwZ+F9ksKY7O8svLoblubGlp3vtkBOBksMWvJqv9nzF+?=
 =?us-ascii?Q?b3hmpkC07g0ZzxeXjBZpZWSaoK+97DE3uf2lR7beZBS57ZnoKVfXbfSvF3sX?=
 =?us-ascii?Q?8NEwAZ2tyd245N0HPUbfnPLVPkCGCO4tHmWYKTAxVMFD0KiWNX8MabS+GcR6?=
 =?us-ascii?Q?U/H/006dVrvtvf/qOXrq9Gbr9eqouD9wrM/62W5kJXjuve0f0KLDa5jZD8Le?=
 =?us-ascii?Q?XplOohbSBlctNZQgPnTgu+U4Iy5m7iCrlkPkOunzOmFK2EiNA9BCgalHkZgi?=
 =?us-ascii?Q?wjViSocit4wdrOv7/E10Cva//n08Q9h0wF67szvbRhzkFByL+3IZJ3Re8xeX?=
 =?us-ascii?Q?x31kZ08VwGh70to+0VKg3MWjvnEGawiiIftKeK41SUHxjFhC0ozL5kHXxwEu?=
 =?us-ascii?Q?IoJQUpRFKVNWwk0FNXwiGPXQdI5QmO2enCY5l0FV7z3FPSTl9MqS5QJGbX3o?=
 =?us-ascii?Q?/1i1sgALgHcQ0QBl2xwbjJlWFehkkKXgpE+pSeqqc/0XvPwfIQlbzC+URydA?=
 =?us-ascii?Q?H79RQbOCL/SOWYVeuwDBs4n2bBLxZkuMWzqJaLy9i8VKfbKhetacZ7eb7Yi3?=
 =?us-ascii?Q?Tw528+Nwz3xP1jO4sjtQYAyqZ4bFAusuf2HargF5gSX7KPgzVb7JVFXUpFg9?=
 =?us-ascii?Q?nGMqshVyUd+9gi2bIiRJn7ggF4gXFbVv9lATkJsXN+SaDU880hIPLeOf1hwn?=
 =?us-ascii?Q?lgS2pYX10wRR2QVIW5gFO88UbD6rOc7EphvdkGp0xsJY9UdJJ+AGE6VbZPPK?=
 =?us-ascii?Q?2Nq3PPsz8YgtSWI/vPsMQK6z3fXfB2SWDNM6rw46MKSirLJ8jfOkOtJnxomu?=
 =?us-ascii?Q?tb3MBrRCwO0/nkKu4K6EZkIrSgreN9V8ijQ5RNJouuB31+7+rsAYJ4s8uGQ7?=
 =?us-ascii?Q?KtIRb9ozMIn39fPsKXoAimd8+OCtG3KqHyypY/iXX6Zlv6aIasMEZ7VQ5pSW?=
 =?us-ascii?Q?bJrP7gdICF2AC0ewIB4dedUr1WodOnGEAcR4i8a3qm+JlDAM6HFKqjPuK/Mh?=
 =?us-ascii?Q?Jym5MnTU8Y5oIS8TAtNYG0dN0RuvBOFBg6VswUG1UHfZ1xoMoNv08Z7v3XaO?=
 =?us-ascii?Q?QbbVC6Xs2Rmu1F8VAYzMrqCf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4342e43-0b06-4e2e-363f-08d91e830299
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 07:10:28.5828
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y9+6IIaEyKLLmCP6Bm45wtIXWiRCfUZlGD1V6w07uJfoFq7jKT3wKtLNOwE1Tq9ZwqhKHqJezMr8cZ95PQfSSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
X-Proofpoint-GUID: HLyBIN7BEyCTsTtIw81dNlnXUX8Srwc7
X-Proofpoint-ORIG-GUID: HLyBIN7BEyCTsTtIw81dNlnXUX8Srwc7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-24_04:2021-05-20,2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240056
Content-Type: text/plain

The commit '6af88067da16c6e69243b376c3b6454ec694460b' is not available
in the repo any more. I think it's due to some mis-operation of the upstream
repo in the past few hours.

Update the SRCREV to use the latest commit on unstable/devel/latest branch.

Also, set PV explicitly and remove the obsolete comment.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 0c89bad91f..e97140add7 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-# Version 1.8
-SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
+SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
+PV = "1.10+git${SRCPV}"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
-- 
2.17.1

