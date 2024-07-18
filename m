Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F4AC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 10:05:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11903.1721297100191270514
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 03:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=792985b9a1=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I9TniW003753
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:04:59 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erhj0c7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:04:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sU7EkF9bbo0+TtkJoZl0lBe8f6aTwL0d1p9bxiAmxJyJ5b3EDmPmTjlGeMwvr9E7o/luPTTwdkvZPX9t3RPed2T38ShK+6o98gI+l4r/gmLgHfmI0GZgwAo63X13L+3NlatEiuj/d0DvCmjWu3USnrlG5MwU8S3g1UEAv578Hf8BnNrtBOKQKOzEGkLLgeNZR/4HgKw5UkBLM7t7ddylqrbPY2jgRKQfpgmwvM2K6qHQOR2/abq2uNzlf4otxb3Og8Nx0LYprB2RddcABbOhBbccBS8ExTlbTsE7fs2xKyBkOVBaKO5mfmuAgGCm8Wty9w82R+YzOT+KaxC63JU1Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2C6vNqCCMWP9HXs1LP6mnIiNfAMXjjLxlgVFyat9t/Q=;
 b=Lt3Xv5BKbeR/uSXlRLjpW+sgRrXWKWLJc6zmrPnTeb83tJOiv+NR0IxJRTZpNNxMcgTy4PzXBF4M0JcCvvrMYSvDo/PGL2MpFU/FdwcX2gMm5iCvMHZpKQgLCcPemMYc6zrwVdQcg9aWMlg+Kc+qdRQ/PBkNJXEUBWau3XA3ZwrK6KPE4tZZJ1mMRiasAIyfi3ktKrSo+2dAQXWz005XlL4hNqAoPSKGU1An+0pwRTXgC5FqnWLcAee5uvLegkQCjkybZ1clQhIf64gkcFr1HfyF8hjFQ+q+WcVZ0f4C3NGANL+SPYJ7GVFBwZFTa1D9TKhcvxa6h44TkW5MB5lOyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 by CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Thu, 18 Jul
 2024 10:04:56 +0000
Received: from LV3PR11MB8694.namprd11.prod.outlook.com
 ([fe80::43a4:5136:b219:47bd]) by LV3PR11MB8694.namprd11.prod.outlook.com
 ([fe80::43a4:5136:b219:47bd%4]) with mapi id 15.20.7784.016; Thu, 18 Jul 2024
 10:04:55 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com
Subject: [PATCH] oeqa/selftest/reproducibile: rename of reproducible directories
Date: Thu, 18 Jul 2024 03:04:40 -0700
Message-ID: <20240718100440.1555319-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::24) To LV3PR11MB8694.namprd11.prod.outlook.com
 (2603:10b6:408:21b::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8694:EE_|CY8PR11MB7732:EE_
X-MS-Office365-Filtering-Correlation-Id: b45185c5-c65c-460a-fa79-08dca7111302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?aREj/awKalIASKbqwOCrQpCx9uWJ7TojQAA+f5j1HnIPj7RDg6M/gM17kMsQ?=
 =?us-ascii?Q?gLVwKBB94GsAprU/BEB4NqYQm+FbfOtcPN2gbdOauRjuYv+LAF2y7LoGUF9M?=
 =?us-ascii?Q?pokDbJVCOE5FWk8Af59lLMfF9XM3iu98cbcMDMJ/hPBTTeVNt46657KVqu7j?=
 =?us-ascii?Q?mgR6FYB2XBF69mFak2R/Z+OMEG+QQ8Seodpoma8MM1av73n5ObMP1IudCAcV?=
 =?us-ascii?Q?Jv/KNqRAwgvNwkz9RxDcd2XiJDCzc4YB1/zJr/IA6bUzSEIVaTbDeKuD0E8N?=
 =?us-ascii?Q?GpSG9ErYIyrltKER33K9387OgMFseT15UGkmy8OWD6EC+LyLSGpZGYcnbA0p?=
 =?us-ascii?Q?mu/9h1r6EQBBwRjeNp2PIkItzzm+cB7K1jacaSnyeiEp9nE7JG3muMHv/YuJ?=
 =?us-ascii?Q?vVQ7AmMf4XG1unfvmdlmtno26tlKbEaH1sRQj5/d38JuFgBWqu1mf89+auQk?=
 =?us-ascii?Q?/K04ourh6ArhVguuPnSWlauLPEYn4OyKeHN8J9jpXqpnb5Hmi0iORTKsf1wX?=
 =?us-ascii?Q?/APTkNur+F6cPuGktP8QbfEhnWGFuMFEO6mVCdQbiQ6Y0SuzkuC+2KVDDamn?=
 =?us-ascii?Q?MkycKHj+5+MuJJ3O5d6QL6v2Nbo1Vt0p9GSs+OHfjNSeZK+lFB3maO+koMlk?=
 =?us-ascii?Q?pOesfamFha98G3ccepDIiTpB7Hc0CRWO4NmDHkQglROsWmtcIY5KFNMwPz1H?=
 =?us-ascii?Q?nKsiiS597vd2GDaEHhpmLmD56izZ3l8BBksAenpM84aorFaOruGep1a9YYbw?=
 =?us-ascii?Q?uEcwxhPaI0bMY4PJ2xaAtPBGGFx3x+/axwMXBV779s+BKwOdr9shgH6HCp+X?=
 =?us-ascii?Q?YafLngNROSLWwvVCri176ywH3D9uY0HgiBp7iQ+MPYkiV/4hIZ6rQANAZSwa?=
 =?us-ascii?Q?uGoy09izCi5HIRE6SUGGdEOd2+1EtrQ8WdzEglXiCYzkv3uDoTDgI/uJ66z1?=
 =?us-ascii?Q?BsSlfpQ7uVxWXWjXpWbhYK6FOK0GbifRcRiNtrPb26pXW+i2jNPGmPOI9n0H?=
 =?us-ascii?Q?tQ5bnaqTNqbwl6PkH1O9SF77y2C8kl9hKhkPat4+LZ1s3i7elJWhU+omoLHr?=
 =?us-ascii?Q?AfXlnRX8bG03xK5EWluHnJy3xZi+WWNI85p6KzAkG/bI8UMToWPLBdW3xY6H?=
 =?us-ascii?Q?QkD1MtaPEzDSJwWLObrS25wYVp35uy2LshwQVR97BuPCASUiLDJYru4luDxy?=
 =?us-ascii?Q?SrQlfGLTsXA2Y3HNnwtEwKD3/oxiYsGBD+RN/9DJDjey2X9fTqBpfhYNID2d?=
 =?us-ascii?Q?RkM7W1ERT4uiRxExEyADXgnAt9q1wDqUZ+IeqbOVr7hLN7oFLU9EcvrIUbeg?=
 =?us-ascii?Q?RrvAX3LIJtLQbmzQqBXgzjPEiJR9CQLPuSRYpWorcoCTWL/89Q8MXKlPFe7j?=
 =?us-ascii?Q?M6lyfnc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8694.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6UE0i7BUbQMh9HOHnpHsMsYNU87DV4WaAU1smAMtRoy7BBd6f5xOrQAaYTdr?=
 =?us-ascii?Q?OJIaULNtJt5Evf0ph6IvRgHaeS3gZGEEmPnA1q14cswcmDr50sxEmnfKkHoh?=
 =?us-ascii?Q?cIMSR3YTQs4Me/OhtazjoOkwUWimM2Pw4EZLAxlgDegiJgMUiiWw5xyO9PLl?=
 =?us-ascii?Q?oraUVITRPPptdNL4FpOcKoy7P/pLEDtR0CA2jvtf1+1PBz3/DX+BbFiWt6zS?=
 =?us-ascii?Q?TH+phIfb9CD0zPppGybIkbQfQd5wgkKoxuExtSmo7chf0vdVVEPeUWJdSJzv?=
 =?us-ascii?Q?kV7p8TPIs8zPLW5tjDiHlHXRe/vPTQX3BVEjqwrtWciMNDGnNA/4VOvQA6si?=
 =?us-ascii?Q?PQ7ZBdWOLLUh02VylZGIsqwtO+D/k22sui86/NGRnldJQiqyTACLzT1ABh1I?=
 =?us-ascii?Q?Jxqgko7DKH0VcvPDY9tykfOEgvqX8crvGbqUrPtvDBcdcXtVy2SiEAH3QwLK?=
 =?us-ascii?Q?Ar6QyAbAXVO57mqZDJ0vGBaVMMHEmP91w8Q5d3k6Guu1HqkWZjBadl9tky7R?=
 =?us-ascii?Q?G02ZstqoimFPQGXkSnjz0Vs4/tLq97keNeqISZXit5TZpvDJtSMCIRfcZ4fh?=
 =?us-ascii?Q?ChsLUkwfp0iu6ahm830Aq9N679hcbcTrjZ2hIc8Vk68T1svuoivmeXpiAyaU?=
 =?us-ascii?Q?JbjlBUIEXJc7KuPtm9qystuM9SIP8QAHEZwNrZ81eGOZv84jAF9CyaUVPCks?=
 =?us-ascii?Q?ur5nZLSu2RVte4oijSEtr8zj5cZosV8LAdr5XHjALHaqAWYs6G6lB1tz6FAX?=
 =?us-ascii?Q?OLebDu2DWh7Vqpy/d+pJsUZ45xodiTtem3A7YS2tBVEAPPWKQ+F2nrIIgDBj?=
 =?us-ascii?Q?xV1yF0XJvtPsVqd9NEjz+TmhpiaCOmvqk9EBtiA9hcx1ys00J/+MUp7UNzE5?=
 =?us-ascii?Q?y+EbCfr19oIpdNslMUq5NqZyrvLTV+r/h8QTjcLBHhp94c/yq37NjJIGNhLD?=
 =?us-ascii?Q?1xDqo+urg7FTSXzTpIbTOxNcIemYEBFMekC0kbn9TJ4MOHqGCURyfAnwFbeS?=
 =?us-ascii?Q?75+Y31OuWxlBCHYZXW8BjeYIis08sZ3lvzabAcPoenIVcHpnfXL+i5i9uGZU?=
 =?us-ascii?Q?OaNeEE3cgmQrCkdBtiEXc2ugLnlUAIB5HGUJOT1ogx1PxXwLWhtTAwG1hlQM?=
 =?us-ascii?Q?qGdUOfbuwGHxuNIpq0Kxoseu+6uWPp7JqBg6cgY+uPejYcTk8aaCA+Piroao?=
 =?us-ascii?Q?YLujBuVMQksawh9OJjrObzwFPVoKBAjUjoTz9j+aEq1r3wXiEyJb3idhAI4c?=
 =?us-ascii?Q?pRYmQnbB9D+BdWUP5Hzj5qv8qid0O8slH7I4WQZDTErpwo/2WJUd038PGGbr?=
 =?us-ascii?Q?BiKF0HArrbylb1HgZKoSMYXH46cGwScfPigjguUEroN0aJyBK0OYJvqqlqix?=
 =?us-ascii?Q?rdx04Suz/oFiZOh3KBxbgvnxaebxIbKmL8mP/W2yohCw+qBYqAwxa7A1TdxV?=
 =?us-ascii?Q?HSOyoqgIJDDvZ32aSTqAFIsTGARFnqgk0yOdySdUWi+skmWx/1KE5f+12dwk?=
 =?us-ascii?Q?R5DKhnKhATpBcqVTCY5Rc17fgL580HklMMyKuDf9cEsAsDeiTCtos97lF4cg?=
 =?us-ascii?Q?GFlGOZMHR99hISN0YNE8BhUqPMOwMs3qIP6+uUUPuDO2rhf5fQBxYNr3Xu+a?=
 =?us-ascii?Q?XcWU7qRuk7Vzw9aqB8eOIS4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45185c5-c65c-460a-fa79-08dca7111302
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 10:04:55.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o0+7L1HhrWDrKep1LHsQQZsftw0vGVj9oljZSEYTjcJvtrDkoKVp7PbOhAG6d+hNVkriAXZtzLZH4aj10e5GmHDSsxe1fgvqg+ZGwEqFlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
X-Proofpoint-ORIG-GUID: kpUOUeSB_eb_VNP4ZuEeeTCqEbtkya1y
X-Proofpoint-GUID: kpUOUeSB_eb_VNP4ZuEeeTCqEbtkya1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_06,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407180065
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 10:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202196

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

We do see a few reproducible issues are depending on the path length of the build directory.
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554

The current implementation of reproducible tests having different names for directories but with same length.
The build directory names are changed to have difefrent lenth.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 7c6cf3eb1f..6932b0c2a5 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -276,9 +276,13 @@ class ReproducibleTests(OESelftestTestCase):
             os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
-        vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+        # The below bug shows that a few reproducible issues are depends on build dir path length.
+        # https://bugzilla.yoctoproject.org/show_bug.cgi?id=15554
+        # So, the reproducibleA & reproducibleB directories are changed to reproducible & reproducible-extended to have different size.
 
-        vars_B = self.do_test_build('reproducibleB', False)
+        vars_A = self.do_test_build('reproducible', self.build_from_sstate)
+
+        vars_B = self.do_test_build('reproducible-extended', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
@@ -333,7 +337,7 @@ class ReproducibleTests(OESelftestTestCase):
                 # Copy jquery to improve the diffoscope output usability
                 self.copy_file(os.path.join(jquery_sysroot, 'usr/share/javascript/jquery/jquery.min.js'), os.path.join(package_html_dir, 'jquery.js'))
 
-                run_diffoscope('reproducibleA', 'reproducibleB', package_html_dir, max_report_size=self.max_report_size,
+                run_diffoscope('reproducible', 'reproducible-extended', package_html_dir, max_report_size=self.max_report_size,
                         native_sysroot=diffoscope_sysroot, ignore_status=True, cwd=package_dir)
 
         if fails:
-- 
2.43.0


