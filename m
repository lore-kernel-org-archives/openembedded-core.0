Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.7031.1623848530475376100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 06:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mugmNV18;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=18018a3c74=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15GCvxeG021568
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 06:02:10 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0a-0064b401.pphosted.com with ESMTP id 39728b0k2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 06:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O4G3NX0lhuaqo02XbetEbOytAZiRTAyijVeNKVIOp9vtxKGFRN1mtnufgBR1Ynm9OVXRWe3UiGfVgTahkOogRgjF3LEToUqXJ5w2stTOsJVegW2U6rsPSUc/XEJIBIgGfnzCXIjeLtoFhSYVbjfznLzk68Irv90FVRDNMsnkS1voGD/E1fivlFHhn/BgNL3h2tiKl1Jejlo5JapIs+yu0yoArCDQ7l6aR4pYukAI2Ugcx++GoZfU1NvkYY+KB+0FF1D6yqgTamI+7knIGSjIQz8xaxASKRzlkcH5SyJcsqYC9wAa7LToZfOQvqpmdXTpnSHeStFYY+J+zuI+kheVbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEibJXg55VIHPoP6bxHNmlAZ0uw8efft7tD187Hv7hk=;
 b=lIW5nBUoj61JnQ57P0ksKPl3VIBsVP7pObkayM0bFunTybK/HOAXx22nuaXF8VeJ1fXjnvkfvcvKPohqd/y3r7P0GcnSQOu2zOL7fhB/oBm1Tg5f2JUBjQRQOMBjYiQUp2bdP0nIRh8YnXx/Fnz40EdpNVabKG5HDCZHTG51Cyag0BpRGxCFPWHKeik8lWcyHB6jxhxh2+FRhvpfxeK6bw9zY0svY9U20JTQFdaYJSsEmcRoy0IVwA9JkoumT3P5OtYcIrj5gDZB2LXl7YJ0pKMx/vzLs7TAI0Dpfw723J8T4c3AaFTHRzVrv3NAQaC3cdWSMsaAzDOjJZi4c00ILw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEibJXg55VIHPoP6bxHNmlAZ0uw8efft7tD187Hv7hk=;
 b=mugmNV18m5d5yg/Jr6zK64UKmjJQp7De/eb6etIAswruYAedkX7eMeC3ApbtpSG12nZYLV9dq+Ek2fydqVDxFRDHKq6B6/b4jmHaZnWY6AwK/LmIv36H6OChGnsk6o+Si3CQrzicHiYP8wXNqVZYB0m+KGgkPlJ9Fd4Crs+pDyI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 16 Jun
 2021 13:02:08 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 13:02:08 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] curl: cleanup CVE patches for hardknott
Date: Wed, 16 Jun 2021 09:02:01 -0400
Message-Id: <20210616130201.1386572-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: SJ0PR13CA0119.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by SJ0PR13CA0119.namprd13.prod.outlook.com (2603:10b6:a03:2c5::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.7 via Frontend Transport; Wed, 16 Jun 2021 13:02:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc726c44-e9bf-4bf0-aaf8-08d930c6f2a4
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766F6A974078E9E4F8E7EF89F0F9@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yHi8+mF3UI08ilXMuMtblPRqKauCBFY2mIOtrdVchFHLnKeMGrJ0jRfEkRoMF+j7XTcmWUsJhpxVpb2vvG6zTboUMtXjEF9+DBZh7oDMDe9ErFbE7s0wLBbHE+HKoWqNN8VA2luGehfFni657SB/WKt8zOTWOP0UcEv9UDfhHOHgN5svMfQP5R9kBt/N+6o52LWYI3DeWXGoNMz/KFYXMEqQVO/vbiiIEE+nwg2YzDYS8Ymtu4lFOPcRhUirVtLuNpWJQvAv4o54JP8iqcpqA7u9s4/MyTjWbDxtPqSfrF2azZyju4OTijONCIE4e2WKFP2MhTdhYRVS8Z1TnKTXVtrSndf7QoqVi6A7viRbCZQbgGD0pI1McyQujeTP545vm1FokTcGRWsy4yq+bxHVXKLdmDTOC1lvXqQee9wn2x6WgrTJfR5T8R0Xllkhiv3dt76x60mbTjJ/oRgct/yxoYhtgSQP8zN80qfc3DEPAvk9LTSYXItHD3bH1wJRkua95iOPpbib1gid1dnYlM/IiAaNPtyAR/O16LZoscNfCqR4o1X1SPhGkdMNEKGiFiURYDlwOHlvac/Txkt+NlrQxaVGafpTqIoRzK86+h+97pZ0hugIBrjZzTjkIbq7CwSNi7FBdg+lFAeTb40/+mNiWnkxhg7OjzfVh1E9B6dY0oC5zs2eDZdUof//zpgjP73ONiLtD8RYAX0puOVVTwZRP9WS/fC/KPdY5IfnXu2NBbS/icMu+vB4AMfH+ndlKnU0QbLB2Z7J06hH9Gqy/EbaNB7Wywjxy5EAVZ2r+JX3vDZ/APqUEg3C1pv8jS8v4Uuu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39850400004)(396003)(376002)(6486002)(8936002)(956004)(2906002)(8676002)(16526019)(6666004)(66476007)(66946007)(66556008)(26005)(1076003)(2616005)(186003)(38100700002)(38350700002)(86362001)(44832011)(966005)(6512007)(36756003)(5660300002)(52116002)(83380400001)(478600001)(6916009)(316002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6elYWT+2UsyDGwGW70k2HxSFBwCDg2B4URhO4XMav0Q4BLDDCoJ99epnr4Lr?=
 =?us-ascii?Q?OM0g/wG+KOJUMu4NN/JNZqnTwm8KqoQJGbmmcvF705NVYLWcjXvZyb4/cKYB?=
 =?us-ascii?Q?qIkoQBuiRTXMzSS8OwBKdETzvFhQheGTKZXCYOr8DDCNSJrJ2Wzh2eS5s4Cc?=
 =?us-ascii?Q?kww80BCn84rWEyktSRH9sPXWgFZRhdUwBCVHOVKhaVeD2dlftihLdtGDDtbj?=
 =?us-ascii?Q?f6haAvcfn+IqyNBimh5UKsy0HFy1dGADLtZJTZ7/5gjD5Oyf2jUGwSAkHXrG?=
 =?us-ascii?Q?lQzLYMD8SIT0KcFFCGO5lcQmMWPbMLr9FqB1qUyJ3VBnL0W58XUDTArWnWTz?=
 =?us-ascii?Q?uFw2fyuHsNJcxiIs4gpRw2G2Zibl3Kt7S2YMNIr6z3q7pDFZeTE1zzUtIunR?=
 =?us-ascii?Q?C2Mvj36AfwX9lcJWcid2lb6n38UN4peLi1W7dThMnQXedgY/mqo8iqJ0objh?=
 =?us-ascii?Q?fGOncoS66bdu5PfYD3fF4ql8nA2cdngfrtmplR54Cqc3oXNUtGvBWN9k45La?=
 =?us-ascii?Q?eBjL/vYxpJ4aETADNGwuVX4BpjeMday1rysUpsXnpe44v8q5ERiGy8zQ2JZ/?=
 =?us-ascii?Q?//41tCHtN+RQEYTKXCx/j2qLgIC5kYCzG0FDSjFnIlKIpK1kv600DXLjLYKS?=
 =?us-ascii?Q?0KBGoimfX1ZAVC6zCvhzpTrsqtT+d5S8PJQPNfBEJET4u3TLNltm+YeMYgdf?=
 =?us-ascii?Q?GhuUzCcMU80qBdYLPT41iDgSwxrhpwY6sq679o51xc3telUTjYRZFl2dQ6ZL?=
 =?us-ascii?Q?29a83S/HLIP1rP1JZ41c7E/NW8XhDBQ60P/+HSRGAngzVaagMMyJRF4ZHEsw?=
 =?us-ascii?Q?jhjikTOcjTyMZIeIToeqL//SwF9cdFxfjtz7caX+Dakxe1eq8LWO8PrL86M5?=
 =?us-ascii?Q?2mv4qi30YT6E8/cNnt8U3K19OLaUOnH1XUIZce22ub0zPJP/IFqx9AXXyss1?=
 =?us-ascii?Q?3nxFEfRWG9gLML1rnz4yDZp3DJd7O4BCzshTbvPwx1bCrvOVzjTiy9bfnO3N?=
 =?us-ascii?Q?dEVHR0LyPJ5pZ7Vc+n4k3Xl0pITCeJSX0Z8vGG203ILOrQ1vJnt6OxtO7q5G?=
 =?us-ascii?Q?zwOBWJoYmNRcx1wSlyHzaId1uJ1EjAzNZ5v+3P/0yzgY6qPKNEFP/VdYDvbJ?=
 =?us-ascii?Q?B1Nd7uB0M83C5mcNgXpcNOov5HER1Lk/y+rNWVLIrvMjCqyfELawstUTcp53?=
 =?us-ascii?Q?nMFKKPLrLEvfGg+VaKH2xzQPpXSb1bOwP9yjb3KNKn7NkJpNbMtPuVTBn0dK?=
 =?us-ascii?Q?95qOZ1We1AYKAgFfWxf1fnikvOQOwpRCvYVArZXeBn9BRXi8CnxjaC2LDpqR?=
 =?us-ascii?Q?UxoEHtvc7wfbBRhjiIFgY/uR?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc726c44-e9bf-4bf0-aaf8-08d930c6f2a4
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 13:02:08.4010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6x6N+xCcXr3wuSggcZf8sJYmGFRGRuzpU1ZUZF9LdMKc7C8YZfwzHYPckg+3GZzIZNmpKwOXVK038tdAi2Bv+Wgge5pi5DauBnMnpohz254=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
X-Proofpoint-ORIG-GUID: cX02_x_DdVKE-Y0YVwTx4Y1Mb7sTDWQ2
X-Proofpoint-GUID: cX02_x_DdVKE-Y0YVwTx4Y1Mb7sTDWQ2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_07:2021-06-15,2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160075
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The patch backported to address CVE-2021-22890 was missing a bracket to
properly close out the logic in lib/vtls/wolfssl.c. Fix this so to avoid
any surprise failures when using curl with hardknott.

Also fix the CVE designation in the patch descriptions for CVEs
CVE-2021-22890 and CVE-2021-22876 so that CVE checks run with bitbake
correctly detect that they are patched.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...oxy-argument-to-Curl_ssl_get-addsession.patch | 16 ++++++++--------
 ...p-credentials-from-the-auto-referer-hea.patch |  5 ++++-
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
index a0c7d68f33..1e0e18cf12 100644
--- a/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
+++ b/meta/recipes-support/curl/curl/0001-vtls-add-isproxy-argument-to-Curl_ssl_get-addsession.patch
@@ -1,15 +1,14 @@
-From a2d3885223db9616283bfe33435fbe9b3140eac7 Mon Sep 17 00:00:00 2001
+From e499142d377b56c7606437d14c99d3cb27aba9fd Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 1 Jun 2021 09:50:20 -0400
-Subject: [PATCH 1/2] vtls: add 'isproxy' argument to
- Curl_ssl_get/addsessionid()
+Subject: [PATCH] vtls: add 'isproxy' argument to Curl_ssl_get/addsessionid()
 
 To make sure we set and extract the correct session.
 
 Reported-by: Mingtao Yang
 Bug: https://curl.se/docs/CVE-2021-22890.html
 
-CVE-2021-22890
+CVE: CVE-2021-22890
 
 Upstream-Status: Backport
 (https://github.com/curl/curl/commit/b09c8ee15771c614c4bf3ddac893cdb12187c844)
@@ -25,8 +24,8 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  lib/vtls/sectransp.c | 10 ++++----
  lib/vtls/vtls.c      | 12 +++++++---
  lib/vtls/vtls.h      |  2 ++
- lib/vtls/wolfssl.c   | 28 +++++++++++++----------
- 10 files changed, 111 insertions(+), 51 deletions(-)
+ lib/vtls/wolfssl.c   | 29 ++++++++++++++----------
+ 10 files changed, 112 insertions(+), 51 deletions(-)
 
 diff --git a/lib/vtls/bearssl.c b/lib/vtls/bearssl.c
 index 29b08c0e6..0432dfadc 100644
@@ -463,7 +462,7 @@ index 9666682ec..4dc29794c 100644
                                 size_t idsize,
                                 int sockindex);
 diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
-index e1fa45926..e4c70877f 100644
+index e1fa45926..f1b12b1d8 100644
 --- a/lib/vtls/wolfssl.c
 +++ b/lib/vtls/wolfssl.c
 @@ -516,7 +516,9 @@ wolfssl_connect_step1(struct Curl_easy *data, struct connectdata *conn,
@@ -477,7 +476,7 @@ index e1fa45926..e4c70877f 100644
        /* we got a session id, use it! */
        if(!SSL_set_session(backend->handle, ssl_sessionid)) {
          char error_buffer[WOLFSSL_MAX_ERROR_SZ];
-@@ -774,21 +776,23 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
+@@ -774,21 +776,24 @@ wolfssl_connect_step3(struct Curl_easy *data, struct connectdata *conn,
      void *old_ssl_sessionid = NULL;
  
      our_ssl_sessionid = SSL_get_session(backend->handle);
@@ -501,6 +500,7 @@ index e1fa45926..e4c70877f 100644
 +            infof(data, "old SSL session ID is stale, removing\n");
 +            Curl_ssl_delsessionid(data, old_ssl_sessionid);
 +            incache = FALSE;
++        }
        }
      }
  
diff --git a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
index 6c4f6f2f48..c02c9bed68 100644
--- a/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
+++ b/meta/recipes-support/curl/curl/0002-transfer-strip-credentials-from-the-auto-referer-hea.patch
@@ -6,7 +6,10 @@ Subject: [PATCH 2/2] transfer: strip credentials from the auto-referer header
 
 Added test 2081 to verify.
 
-CVE-2021-22876
+CVE: CVE-2021-22876
+
+Upstream-Status: Backport
+(https://github.com/curl/curl/commit/7214288898f5625a6cc196e22a74232eada7861c)
 
 Bug: https://curl.se/docs/CVE-2021-22876.html
 
-- 
2.31.1

