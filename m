Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14.1628194709054275736
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 13:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jYg6t1B/;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3851219bca=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 175IhLt1007982
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Aug 2021 20:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=tjsMbRIkb0mbknUvu/7XlOFY7cltV3L+bZZx8JUd4wE=;
 b=jYg6t1B/h50DVfuwVMswblxnBqm1nPW4246pXCd/8wK6DgtRGD5gAhucYeGOef/xxray
 uhiOyT1Sd2T43hb7fnjbq0hgzbuNldzTNjAM3jbYqOImMLbOYgNwlCSgyWkdqIhnIxbf
 sCCXK2ruzQbz5elFXan2cgFDzMMC6RPMQfJCuiHVnhCb4WqZnW5rf1WWZp7vf7LVh4wL
 C+sop53jgqGpl/Q06ask2/EoRTIAxrseeDvqT5frc/VrA+aLTB4xikCxK97+7VW7S8l/
 rINnUT5Db2+ZuAjVIhvCqwTA5QJYXYA23Z9gFJRtVmDmGluG05I4Otv5AIK72I++rWQI fA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a8nh081vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 20:18:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b4ptEYXuzzAwmC8d2FHbNpNhkuOISPLiixOpvQI0v+FP9rxYR1mil80k0bokUo0FCsk+bgVd2csgQgpW0awmbDsH145W8AGTGS7BuHMEAXNvV8jfKfX9eLGDEIbR9KuwnJSfnSze8448H8x4Aw3OBUfJaezMnHefXt/f/qeA2Cm7AcTaHS/7nud50Le15CaS6ZfyuZqkUbKC7pNGl1enw+hRZabGORxvA+Vae+CwlwEfdPLPbLn2dqteIcjstsQjNTyURBzMKSFYIultWBantTqJZLOBdZc0I5WC0fm0NvbSSM6I97UyhaUa5OgqIr40Iw5M4JeL4yCvbSJzHKabfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjsMbRIkb0mbknUvu/7XlOFY7cltV3L+bZZx8JUd4wE=;
 b=gerHfKTYIhFGPgVpHNHKm+jPqef0EOufqizwSCrDCRcB7tKpLReHcpCNf90mpDVrXr5vAsvYoHpP+ahtjUdTcPk0eTePw6j6ChUiEuAWf5/v+ZK41HXrmWjgo/TFoEXciThJVMWwVKJavRCS39uzcJ8N6xXS05sQlOuRlhD9t2y+uGqk6Rini6lGj2pqyijsTvHikdAyFBNKGnDq3ANJ9kdyChSpi+twjJHZApzyHdOk0jueRxNFWKtCTA94vKDaYjqiAjdgv9YY1//RwVyuXgLNzfHLXzvlS8+O1evyINSK3Yz4MxibezKdtafrAFJDnF4GSp09cqcytMlME1pvlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by SJ0PR11MB4797.namprd11.prod.outlook.com (2603:10b6:a03:2d4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Thu, 5 Aug
 2021 20:18:20 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4394.017; Thu, 5 Aug 2021
 20:18:20 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] icu: increase command buffer size
Date: Thu,  5 Aug 2021 13:18:05 -0700
Message-Id: <20210805201805.83727-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BYAPR06CA0016.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::29) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR06CA0016.namprd06.prod.outlook.com (2603:10b6:a03:d4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Thu, 5 Aug 2021 20:18:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2af87f4c-fd2f-4b4c-4a87-08d9584e2ae9
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB4797FC2D8A80302B457052D088F29@SJ0PR11MB4797.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:256;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Y+5+10sERSdpeGDZ7i7MY83yDvhm48a9AzJOpC9NxUJuDUzjYp1RLPSkixNE8aKQ7XVqEFjLNlZHcWDAzQvmyAkGsSObXejRiDSvNe7QpwEmV5K3VNKXhPq3sTTj30JBt+PSqVv1wT0PbgJLdvucDZIvOy6CWi1ts4DfIm14zOfh6OmH8fovELiHzPF+HmMClak9zEys3DOyJTVYdsw/eOwYK0N5jFw0TuuCmlE8wB/AKapk3cYa/XTTP8TQ1HZZwrMwrrPbNAOOefIhfttrCBeu3P6aY3dU7TzwhApNdMHMjWUWmoVvTjMB+k27VXoWA70of5fGpO3WC+IH8/BTUmkKwh/gWi4QvSnF6TFgiSgA87uRbw7ks73mgIsiLutm5SX951o5OmmfYAjcbZH+pjzJHfWY6WfTxByBot46E3/+2vfIrA7OR4h4NLFry4gX/rC4iy4hn9pp1Y9yG6hgKK22rR2IidJVR463Yle+aKfRBC6j5vkVwraYqpxZoIFnr6J/193PUo+fQXIWsY53uKll4CNPetmecWlGMyUMhwOiHCVQxUdFBr1WFC89rqBIDQ/hiK5ja4Z+db9xXDySKBeW476+SaP+DePmNwjnABRbUvJOLtfgP7n2nmZt8t31EQV9JcxepvzfKF32ajT5Ax3wKnp1zQMMyO7nE6I74AfIrO6mi1laUBNJQxHhO22HuUg2KARh80MidkSdiF/BNw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(346002)(39840400004)(52116002)(8936002)(956004)(2616005)(4326008)(38350700002)(38100700002)(6506007)(6512007)(316002)(5660300002)(36756003)(186003)(86362001)(478600001)(26005)(6486002)(66946007)(8676002)(6666004)(107886003)(66476007)(66556008)(44832011)(6916009)(2906002)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Kp4uDjNr/Vg/MxC8a1F07jgBNXG5ldRIm1P4FGKk1vrNRHn9k71jSUnYMAH4?=
 =?us-ascii?Q?98ndh8Ybu7gNd+cEf1a7ZzewCgR9czBStJ0pD3nOzgJLPoYcYpghC5EHrLLN?=
 =?us-ascii?Q?xmMFCVsFSKNv5NsE+C/Ar6uisSnstAn2/fwBUphLezXiFhoOD91SjUj6Wx8a?=
 =?us-ascii?Q?uSrh7MErx346/U4Ei70fU/dXRwtdiun6H2qcIGotBqKRijvQsOgYNf9E/xvN?=
 =?us-ascii?Q?ROSVeRLFdoaCO+gNziqzeypNRAdo5BDGYY/bXvb25BG3HyqxFjjL/DIdNGvq?=
 =?us-ascii?Q?0vNSk7Dcd6oTN1hsw9OlJtlHTj1GtO6aNL45WhikBVdsN8TOob/uLWKNqamh?=
 =?us-ascii?Q?hNqOuIXydW6zrNlWE6smOmHnk2R856zCm1jcHNht3+/KQTnua00XhJ+DtTy5?=
 =?us-ascii?Q?VhjH2RKyVfuGTf0moceP6eFplNa0iYCP0tbt6qEEZ9YrTZg1EOooOmnqfq7+?=
 =?us-ascii?Q?cCYlVB6HYCY6mnmpFWMmPpEzUzGR6b6T8hExIZLZouMfnS/8M8CxIOjO1dJE?=
 =?us-ascii?Q?4CD/LwBd0ptghnOoS21lhlohFRJPqO34Nxmyr7kjJSqZ8MmJjiY0xyIIdRDm?=
 =?us-ascii?Q?NYxCfUkxdvf/2PueTGZAzOinsP1F3LFInhuqCa7podZONzmEdjdBL4UyVFRA?=
 =?us-ascii?Q?pSQCIjygT3ztJwrQForw3O1TVb5+f4vwMwGDNdCBW/Zizi9QdCxwfynWHqAo?=
 =?us-ascii?Q?Cjpxt+0B+/e/N2ZtTIzoZ4WOMq8nYnSpuvS8pYVJly/7v6Ko3BiX+S3Y6VhF?=
 =?us-ascii?Q?uhBoVqYjWJzvVOikQgByZoR9PsBfY1yhaF8aOZLItI5E6R7BQr1R1YH80lkz?=
 =?us-ascii?Q?8t19ebBbj7ur1zhdLPFCSc8W5F9diFWAjmY2w3XRuUn9PKkSaaNA8Nq9vtZq?=
 =?us-ascii?Q?/Y9VDCi4Wnq8JrIm4ICgMrLk3t5/3e044P85miNl7Po5o59YgafYPFd8scpc?=
 =?us-ascii?Q?k1S1eSxkfEM2KADSw4nuta84NE03J1HiBrFFrV0ZLP/LgGl87HUW61Gn0K5w?=
 =?us-ascii?Q?b5+0w0UYMmSymZ6hoTNJ74xnXyFS32auFERY+Sh/xaz7aAlRJRNH/4aeEb3N?=
 =?us-ascii?Q?agqDu8bIt/0tLKH2SnUsjDoYcuK4TEVho49vjZNtE8VYK9Bpm8uCvtYe15ZP?=
 =?us-ascii?Q?8LlkEUxwbwPd1Vdodg+FfKV9kqv/rCpJgz8RNNvexouUws3d/XeJKXPNNmKD?=
 =?us-ascii?Q?5omKVdOo5vtm31FPiq6T0v2YLMwbYukTC/hnqtkn79WyzzmHkxtIR76+Hbc+?=
 =?us-ascii?Q?aLQKdHCFVXt/+Xo71r9b3rlJEi+TggK2xYKznOr3TCm9eu6VbtO/5Z0Pa6gB?=
 =?us-ascii?Q?9VU2TrSIrTdMGZiSGUDsAlXB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af87f4c-fd2f-4b4c-4a87-08d9584e2ae9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2021 20:18:20.2140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I24QfCWm7dFKMjHqDopSTzbDEG2F0aWhenWoU+d4ksZpnFyTWGmpNgyC3GnrwamKJZrW6uxCKj+sxB1ScPSoIVa+dZg92KkTsHSzBxEkBbM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4797
X-Proofpoint-GUID: Jbycqg3AHABP7kFqn7wd6tFYz6Ctrqa8
X-Proofpoint-ORIG-GUID: Jbycqg3AHABP7kFqn7wd6tFYz6Ctrqa8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-05_10,2021-08-05_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=860 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050120
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Make cmd in pkg_installLibrary() LARGE_BUFFER_SIZE to avoid
pathname truncation if the install path is longer than about
150 characters.  For default compilation, the U_ASSERT does
not detect buffer overflow.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...pkgdata-increase-command-buffer-size.patch | 41 +++++++++++++++++++
 meta/recipes-support/icu/icu_69.1.bb          |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch

diff --git a/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
new file mode 100644
index 0000000000..14d17f9742
--- /dev/null
+++ b/meta/recipes-support/icu/icu/0001-pkgdata-increase-command-buffer-size.patch
@@ -0,0 +1,41 @@
+From ab6b1acdeed76899f8227c38ab7e7675c7673ff1 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Thu, 5 Aug 2021 09:23:48 -0700
+Subject: [oe-core][PATCH 1/1] pkgdata: increase command buffer size
+
+Make cmd LARGE_BUFFER_SIZE to avoid pathname truncation
+when install paths are longer than about 150 characters.
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ source/tools/pkgdata/pkgdata.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/source/tools/pkgdata/pkgdata.cpp b/source/tools/pkgdata/pkgdata.cpp
+index 5ab682e..d4b70ef 100644
+--- a/tools/pkgdata/pkgdata.cpp
++++ b/tools/pkgdata/pkgdata.cpp
+@@ -1131,17 +1131,17 @@ normal_symlink_mode:
+ 
+ static int32_t pkg_installLibrary(const char *installDir, const char *targetDir, UBool noVersion) {
+     int32_t result = 0;
+-    char cmd[SMALL_BUFFER_MAX_SIZE];
++    char cmd[LARGE_BUFFER_MAX_SIZE];
+ 
+     auto ret = snprintf(cmd,
+-            SMALL_BUFFER_MAX_SIZE,
++            LARGE_BUFFER_MAX_SIZE,
+             "cd %s && %s %s %s%s%s",
+             targetDir,
+             pkgDataFlags[INSTALL_CMD],
+             libFileNames[LIB_FILE_VERSION],
+             installDir, PKGDATA_FILE_SEP_STRING, libFileNames[LIB_FILE_VERSION]);
+     (void)ret;
+-    U_ASSERT(0 <= ret && ret < SMALL_BUFFER_MAX_SIZE);
++    U_ASSERT(0 <= ret && ret < LARGE_BUFFER_MAX_SIZE);
+ 
+     result = runCommand(cmd);
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-support/icu/icu_69.1.bb b/meta/recipes-support/icu/icu_69.1.bb
index bfeea8d2f0..00c22372b5 100644
--- a/meta/recipes-support/icu/icu_69.1.bb
+++ b/meta/recipes-support/icu/icu_69.1.bb
@@ -107,6 +107,7 @@ SRC_URI = "${BASE_SRC_URI};name=code \
            file://filter.json \
            file://fix-install-manx.patch \
            file://0001-icu-Added-armeb-support.patch \
+           file://0001-pkgdata-increase-command-buffer-size.patch \
            "
 
 SRC_URI_append_class-target = "\
-- 
2.29.2

