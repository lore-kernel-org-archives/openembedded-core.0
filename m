Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.42])
 by mx.groups.io with SMTP id smtpd.web10.3806.1608690224367140091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 18:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e+X/a3YL;
 spf=pass (domain: windriver.com, ip: 40.107.237.42, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdOAIhHr0ObcvXDlt7tHKaaTE07mH4YABj7y9aH8m2hPYpxAy0lpuQt5aYm8qI/a5zjl76qhIqLJjQWylX3SoBL2sdyeIUUU2ItRoiwxI3dTdGRVYmiJWlmF/x07B0ceMn8ygIVfzUZageMZI7/3IvNw2hfeGDX3FX4chPW+1NBJgBafO0c5JDDhkxhsF1VGNQXtDIXMxV5QR4ylHhlDGR0yUZ5SBOETakgqJZ6mkqraVNDU9eoq8T8GA/SP0tG13A2f8z2Xv6Fr60Ml1iIoNK2qCB68zyQdJmZ0TF3bNk+SVAgmwVS7DptnadSJntdgSdCpM+X6fSDwAr1UBW3vSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjAmdet2Z5NY048tL0x3pEOaxEISK06ot8aaGwctZuo=;
 b=a3oitbqQQYPfmYzRN7iK+/WFX//HNgUHY6bEVlMBBCH9Sc3yz0ItHE5KIiZXzDONq+tRUrf+aGCfnLKJovYgC381ly8EHq52o7EjkHSKE9kMStJVKIXattu1JigkYG4eAzENRtXj2E/x1ucXb1yv7j+HcWvEWKQiThQMKfU54rQ102wFjJbYbie5qyhGsxXwj3CSDbH9enH7fp/bcU1cAx5dGBqKOBUE8Bq0xZ0aqrQ/Kagr9VWL3hsJ8Y/ZVOf4EIsSl2iv1w0zXOJ/8ooS4iHWpdz6Rpboz6ec1fYObxeJqRobeptNI4lrmQaAIw4/HRPigkArJAtU7RB7Kvxalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjAmdet2Z5NY048tL0x3pEOaxEISK06ot8aaGwctZuo=;
 b=e+X/a3YL+Acd+eV8yeEF6aiLO+lS6nmAhMa9fqkCATVIrznS3z9d5BW3iBDFNVXbrdOXaylTIbl+iaNoOjF2Q5Q2Z5cYgZoIdoKTTXJuegV/aHCvgXze9/5J75sI1JFcF9PcKiKEI2Kab04q4kCNFqsE80sGsVQ7kV0wfU8NSG4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1264.namprd11.prod.outlook.com (2603:10b6:300:27::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.33; Wed, 23 Dec
 2020 02:23:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3676.033; Wed, 23 Dec 2020
 02:23:43 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] libcap-ng: upgrade 0.8.1 -> 0.8.2
Date: Wed, 23 Dec 2020 10:23:26 +0800
Message-ID: <20201223022326.231003-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201223022326.231003-1-yi.zhao@windriver.com>
References: <20201223022326.231003-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0186.apcprd02.prod.outlook.com
 (2603:1096:201:21::22) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0186.apcprd02.prod.outlook.com (2603:1096:201:21::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend Transport; Wed, 23 Dec 2020 02:23:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1e2aa3b-581f-4ba0-3a96-08d8a6e9c4cd
X-MS-TrafficTypeDiagnostic: MWHPR11MB1264:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1264F92D5CC223619F23BF35F9DE0@MWHPR11MB1264.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:497;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Rmn5wc48Dq9E2gbzQ7WnarG31VC35yeNqpFx+7U4SyHKbXXy5v+r5CEpioVhaSFYhhAeBx8KLhTj+ZSJ8jza5eVnzrkb848JkERW5XYD1gS/wu3mQQq9sofcphR2/N8SBuW0tW8xuU4xILVMyzWVeUaEY033ZZuyPLyFrsMNkGJ1qpj80oWLNBzuMwCP29wpvjS9GC8fmxLKkATPG/cKmRu84zaCupXGdG4WuKSi9w0uxaJt3LQWaYabxLVB+vDYxkqVFnn2rH5LJqZ0SQil8RBc7APiiMNcB7a4aitNj9B6DcBQUQ4MIh11r1F1i+VMk+FRANjo3c4A2EaEQyI2pBcy15fhWUEPktZLhYdnPjS9VyfTxWehSz5kunGWg54NF6UuVtIvhEWyEoYCYkkQ8eFfNTZxpVnkQm8g0hP9TsZJTZbJpV0+Quz7WEMrmjPKtUij+lwJqM77P7BN9LSW1w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39840400004)(346002)(366004)(376002)(44832011)(5660300002)(1076003)(956004)(2616005)(6506007)(186003)(16526019)(52116002)(6512007)(6666004)(2906002)(6486002)(26005)(8676002)(66556008)(66476007)(66946007)(83380400001)(478600001)(6916009)(36756003)(8936002)(316002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OJ6S/n1yQZPIRGfURfidByhYe9nxYn3S8XLsleCJudAVJGF5aVB92CKbXECj?=
 =?us-ascii?Q?S0VY0XnJJ2u/DA+0fD885fkp04GY3SoEbRiigj4uMqmsudji+ntZrkAG19vP?=
 =?us-ascii?Q?k46mb2r92ZJt3ggqEZPGFCqPynaAAdQgB/6ObeZ5+6BJTmpZzcjMoEfMteLI?=
 =?us-ascii?Q?5m+t5hit/PsAdI5xIKb28dNF42bBjml8Re/qe35tnYLrd3zzKqVE6tBkd1pK?=
 =?us-ascii?Q?it9oZO/pHttD2MJl4SLnSfrf1goJZMMKK1gYzwKWYYDQR679FkvFfVk0L7wE?=
 =?us-ascii?Q?LEVTA+QhF9tgI3qo9wGfl6zZG4Ihvy4/+Y0VWKIIT4s0l1ENdKm+/WUfoW/h?=
 =?us-ascii?Q?rp9E7yTvpobpUscBcQ/r/QrnO7MekW8T5//8HhJwfNilYapakEa78axthwVI?=
 =?us-ascii?Q?ofRLlbEK8TxsuiIvUhNZHoXLHvE94mbdEl7MfTH+1qW2QpE2pb+XHEVh251K?=
 =?us-ascii?Q?xea9frI/YAgRMy67oAm4L3LA4xALvmvmkWARcLsabOlXN0vM0uWe63I8Wupn?=
 =?us-ascii?Q?MtbGyKmKgqk+XHiRdY2PRAOwRzjpB7lx8k4VFDClxVxym5fn4IPBp1Y6/QJU?=
 =?us-ascii?Q?xp66hw2V4H4VgdL/5Vp5TWNfwXAvol5v+0a4jZDAAU2q7EF4aypY9GKkEESw?=
 =?us-ascii?Q?QeuZOC9RN2pE0hEVlTzV/mCgbo5Tm3he03BimlJVEhsABNfPNvc+eP2uxSW2?=
 =?us-ascii?Q?zKg/6PxTPxRkNLy4vKRInb6gz3tdA0AT+UFHNK9+cjniidS3QqZGE5jw2FgQ?=
 =?us-ascii?Q?YPLdC7FJRScQuyJ+FlRMyl3fDhWC/fM6luhYEMAPAJ896KFqKeXEm1zXc831?=
 =?us-ascii?Q?ODuZLnewc2ROUiVTbuiJA4DcThhmmPH1/vCQl1V51DZfp4sw4Rs4WF0O+2oe?=
 =?us-ascii?Q?Y82bTMfyjHRUg8raPANJngAPJ4nscchRBHcDQkqMs9/Tgv6Lb4TU4xmjXPat?=
 =?us-ascii?Q?3P9v2TwZ6CFBKW6x7gBnRs2Hcu1z1WMG2MhmPE37S0Dr6qUjtYVTdiAFqI+H?=
 =?us-ascii?Q?yHVW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2020 02:23:43.0995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: e1e2aa3b-581f-4ba0-3a96-08d8a6e9c4cd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TYEnLNwlqVCqtjjmsD+/MpYX/6Z0rsHr3XWM5GWdW6WAc77xlC/LhkAoZBAUJ8CRvf5TWY4UH9rbU2Ik1DUtQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1264
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

SRC_URI update: http -> https

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../{libcap-ng-python_0.8.1.bb =3D> libcap-ng-python_0.8.2.bb}  | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                  | 4 ++--
 .../libcap-ng/{libcap-ng_0.8.1.bb =3D> libcap-ng_0.8.2.bb}      | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.8.1.bb =3D> libc=
ap-ng-python_0.8.2.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.8.1.bb =3D> libcap-ng_0=
.8.2.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb b/met=
a/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.8.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.8.2.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-su=
pport/libcap-ng/libcap-ng.inc
index a312b602ff..8c52b5d0b9 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -7,10 +7,10 @@ LICENSE =3D "GPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f \
 		    file://COPYING.LIB;md5=3De3eda01d9815f8d24aae2dbd89b68b06"
=20
-SRC_URI =3D "http://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.tar=
.gz \
+SRC_URI =3D "https://people.redhat.com/sgrubb/libcap-ng/libcap-ng-${PV}.ta=
r.gz \
            file://python.patch \
 "
=20
-SRC_URI[sha256sum] =3D "f06b17aaca029e245c9a26c698c6cc8a1cf42b58483d93e94e=
e02b478bdc1055"
+SRC_URI[sha256sum] =3D "52c083b77c2b0d8449dee141f9c3eba76e6d4c5ad44ef05df2=
5891126cb85ae9"
=20
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb b/meta/recip=
es-support/libcap-ng/libcap-ng_0.8.2.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.8.1.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb
--=20
2.25.1

