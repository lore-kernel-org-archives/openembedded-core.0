Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.25419.1631508594138790314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Sep 2021 21:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FGBy24Ch;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=48906cc4cb=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D4nrgn031576
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 21:49:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=zRqgRaFye60TOkyEzwRoWW5LZTs37bMpG3HqBbYLkng=;
 b=FGBy24ChOD6FjBAyqYlX6neHu+ECJB+m8vGyP2ekbUSszFd6Lw3dHUwCmbwcssRtLJel
 0f3cObW0urOv14oGEyBUcgV/keAk6of/Q0X96g1utzBixtVVP2QUAEsSaLe0o9i6XKTi
 vu8YjGfFoW/DpuAfjn7SaCwuISYvVPUHGljrfc5EYxgw/aifqMZUVBt6Zc1gniBlZ+9d
 HKEu1+FTJ6S6Eeg73qNMkajYAfRdrmiMFPDH+r8dpiGPuwfXH3dL0/hgkUEHo3RfplEq
 XWpdp4T67jUbbLWFcUXrWq4zcvlqSrLcQ13MSIbBfK/qELVmTq89qgIKVoTdAsYkRboN xg== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2172.outbound.protection.outlook.com [104.47.58.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1qjw86r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 12 Sep 2021 21:49:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BRjVbMWn0C32k4r51Ac7kYUu+lX3dHtkWi5cJZVxkTS4LSZYLvxa9+UGiaE8d5t0DbMq9V3AX5cwU7re/Jv9Krw2pa9XAJV2chZKh578gqZ0IJCQxGC3aVIaj7P1QIV5ca2x+pt4xHs4b2P6Sbx5aEH9fbbXZd0nwn/a5A+LU+Ir+sYUKwR04CxqqFQS7Xp5peGxt/IvtBCoH9jtpW/ITu62Awgzc7jSyLXjK7RGjOFNx0BNkW6eesSdrRcveUj42NoeCYIkem5SCn4N3O37y4n08LG6yXJD3ZOPki3Dra+G4SlZpwYbK1IEVCP08Wi0Agd83LibT3FqavqXFfGn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=zRqgRaFye60TOkyEzwRoWW5LZTs37bMpG3HqBbYLkng=;
 b=gOruHmoNfAoJH2Br9krrp1bOdHGbzjzgqhjA/wLJUU3De9gGCoRrpbxm8PyPxhL8emH3Ryw2s9IxSkA0GWA1HI9HowzamLMtkfvixPHFZeKju0ZKlKgvdAx2OUGyCz27/oolVywa5Wj8YCZtqlwdsvWIaQIW0+TCcfHKGPFJ1iEIPKbpcckaSpzIGY9oe77KAkTGlEA/UV2Apmcs+pYR+6yYm40LkV1gN4Lul6y9GDrq1588/yaUYwHHsIbHJydGF3RKWqI+DGix/PVwrTcVzqlzpO39yrm61f7Tf8+0aUq4rF1jnqnbOsHJJ4okZZrXuYPCQpY8EAkEZaCXbA396Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5665.namprd11.prod.outlook.com (2603:10b6:5:354::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Mon, 13 Sep
 2021 04:49:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d0f7:e11e:9176:b999]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d0f7:e11e:9176:b999%5]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 04:49:50 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][hardknott][PATCH] cpio: fix CVE-2021-38185
Date: Mon, 13 Sep 2021 12:49:35 +0800
Message-Id: <20210913044935.30958-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR06CA0018.apcprd06.prod.outlook.com
 (2603:1096:202:2e::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK2PR06CA0018.apcprd06.prod.outlook.com (2603:1096:202:2e::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 04:49:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 899e16a3-b165-4371-205d-08d97671eb67
X-MS-TrafficTypeDiagnostic: CO6PR11MB5665:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB56651EACF5CBCFDFD2E7CB00EDD99@CO6PR11MB5665.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	J9xRZmOXYMydRQOupzSrTd3+zfJm4SzekHFZ49WEs/JDitVktcZ1YS0eg+lFZcZPo3EXUylKV896vX7xaokZKjPRr+64D6pEN+c4A9Ja/5urxpieAMZ/3ibBl2m554esLLc5meXvj3TWV3RlfzSjT3AJJZV2X6HSWkisSuPsE8hoEI5la/HEimyZ4bVuWCWCoaLMnJ9TH3Wob5jx9GV8ykzIaLg/byyTDyKv2yl18aBt6Vs0pL32kXrhKNL3auptbyevMSyOHu7m35aksWVBrF8UmZE7YzsWZa3mDKqu+8ESN95KR171wjI9u/92EzYkH6hHJEJrwsxMBUcGLL5ReduiyFNmZe9ab1QHZFmncpGJmJi3rTBayGV5BO/IvPNjR0gMi74+dIOpOFKSDDV283c6y4v1FHg2xQcRo+F7PtF99AyhImENrOnPJyCKPiONPQAF6JYCem43rnmp60p1pvHD9Y4ok9Qwab3oD5FgD+Y9xpAy5nmN9DVEA22NXjXu8F23aCByyU5uXZtHaWrYCA3EnCChm4LlPFVglP4pe6y6weNdCm1K4w6WyfjUY+wosS9ITjZkg6d8jCKoqlx8YF2xaLUmOEZqfIsqViS50vAlbqEVcYXR2UHudlFCyscSPZB4oJPs4BqcF+OO3gjeKV59toJhvgVN+Uc3P4f04a7qVPLSk1RcHOZFEjoUAMJYL5HtgVYxCqrZ1e3oXTE9Ug==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39840400004)(366004)(396003)(346002)(478600001)(8936002)(8676002)(6916009)(83380400001)(26005)(66556008)(36756003)(186003)(66476007)(2616005)(956004)(30864003)(6512007)(6486002)(5660300002)(6506007)(6666004)(316002)(38100700002)(38350700002)(1076003)(2906002)(86362001)(66946007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i5eGsVjR02WJAH7z1+1Phz3i0YHnRCwuJNz3K84N/Vh+Kp3819Xy9LnTNDO0?=
 =?us-ascii?Q?o1H7YJHDsd78bb+OfU2hKw8pwdyb3JnVYYOaAesIP0xRrtTmbbcnwii8el7a?=
 =?us-ascii?Q?EInWyoPbCh3Jv2yI6aaQiQ3eR1AO5V4baCN8+tJQi+CBYkBfryAhju38F4Du?=
 =?us-ascii?Q?ktLyU/pg62abEls0r9t3aaI3H/vy1yg0giY+2ScOhD9QCcTf0cB+TNO/xa5c?=
 =?us-ascii?Q?REDMySobwB7TF/U07d4KSTKV/f++Fb7Q3+wE/F0KD7wEYAcQ4Ux0xyQslBzv?=
 =?us-ascii?Q?bKoEkO9mVV9mqNrY0DUfMNLS6TrvcdUHiBkLmhUBGfthTjMnnxRfLO2EpB4u?=
 =?us-ascii?Q?2WPtaZo29T7ityfjJB/VAZThE/YOPc5U9hZlCb88JHBJOmNmEOMduLDazKmL?=
 =?us-ascii?Q?eNKLIpR+dMdpIuNkP1UpibFzpe8c62+BRZKxBojY7KyENNQBFYwFmjUDwL7P?=
 =?us-ascii?Q?QqHVFf4IP6MENXQ0U55WqvRCNzRb4Ab6+gAWSKo2Dw8M6244m1UYM/SsMK24?=
 =?us-ascii?Q?vyxhEH3YvQkYCKsFQ/yzXJspqrirdPzH9pzaYoiqGBJIfjr6u+C2BTlAb0fy?=
 =?us-ascii?Q?mmQEB1FQosZXGRFwTG0Hn1RPfsbbBVqw3dr33DHohkjVXJQi5qLghAMhvacu?=
 =?us-ascii?Q?5J2rnxKEueeAuylk8aK7ntG/FV8xG2Gk12VQi7iQsCzWAMaO/kvaekXsuqz4?=
 =?us-ascii?Q?UwL2mXaHYGP9gR1hiGhiXiWROfHfMCf0JLFcdYy2XNfPglQzQp6b/pn/Dhrr?=
 =?us-ascii?Q?mCJ5FRg/mrtHFIlF/AygxfqN0vuaOWJa+mGU2F/jp53veweh2PbomLekMMAi?=
 =?us-ascii?Q?DH0AtvpADYIoaf6QIP/YF4QZ9onYLsJ9owGglnaGyUg+/9P1cMsaK3D0JRy1?=
 =?us-ascii?Q?RQqrGCVKnwJEDWrUrkTMzz3bwvdfc6Vhilf1cSpipSE3OlIJOJIb/ccXAioe?=
 =?us-ascii?Q?yOwXh2JPhif5hjQMRMLnDHilp1pOMNilHRwuRTXHiuVdfReTO2/QuKqGe4MI?=
 =?us-ascii?Q?+X3MHJC7l0QvVWCZuXx6suPsOKvDnWekKtsbA0tXmbUuNx+1XgaJpA3bC0j2?=
 =?us-ascii?Q?Y6qW2zsa/ezbrjQzufZFX9mJ/U3lStMcFUiyMx9wjoMg2d8ArCBX/sPzrvmK?=
 =?us-ascii?Q?zrZtqqrUSAIrbxbvWWe502c5oLzVq9LPboRXGuPX88xF6S2qYrg04g1RwcrH?=
 =?us-ascii?Q?upEJ1rEkaHAfp6jpmVlrUUmnuIyNf/Py91Ci0B0QF0yO+CSJ4nv5oSTeyVyQ?=
 =?us-ascii?Q?tjhRiphVvM0MbbMrxYVkTsstE3CErm69+4tWpAn42XxOn0i+LsBbfQpWyABF?=
 =?us-ascii?Q?SZZyOFiOArHnzR0CPIkqPDZo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 899e16a3-b165-4371-205d-08d97671eb67
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 04:49:50.5697
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mu+9TuDgOecuzRyqj2a7cy2uh0d+zp/rWIfPzTrnKFFZ034kMhsZsAHHeI/16zzS//riWZNlY94IqMGvFIBywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5665
X-Proofpoint-ORIG-GUID: _YpGkYyfJgZ6kMwyk4R1isIk55gJ2va_
X-Proofpoint-GUID: _YpGkYyfJgZ6kMwyk4R1isIk55gJ2va_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130031
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-Rewrite-dynamic-string-support.patch | 458 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 2 files changed, 459 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-string-support.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-string-support.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-string-support.patch
new file mode 100644
index 0000000000..93ed05184f
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Rewrite-dynamic-string-support.patch
@@ -0,0 +1,458 @@
+From 0cdda8baddbbc50a4212e36a470053ac624075bb Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Sat, 7 Aug 2021 12:52:21 +0300
+Subject: [PATCH] Rewrite dynamic string support.
+
+* src/dstring.c (ds_init): Take a single argument.
+(ds_free): New function.
+(ds_resize): Take a single argument.  Use x2nrealloc to expand
+the storage.
+(ds_reset,ds_append,ds_concat,ds_endswith): New function.
+(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
+* src/dstring.h (dynamic_string): Keep both the allocated length
+(ds_size) and index of the next free byte in the string (ds_idx).
+(ds_init,ds_resize): Change signature.
+(ds_len): New macro.
+(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
+* src/copyin.c: Use new ds_ functions.
+* src/copyout.c: Likewise.
+* src/copypass.c: Likewise.
+* src/util.c: Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2021-38185
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/copyin.c   | 40 +++++++++++------------
+ src/copyout.c  | 16 ++++-----
+ src/copypass.c | 34 +++++++++----------
+ src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++--------------
+ src/dstring.h  | 31 +++++++++---------
+ src/util.c     |  6 ++--
+ 6 files changed, 123 insertions(+), 92 deletions(-)
+
+diff --git a/src/copyin.c b/src/copyin.c
+index b29f348..37e503a 100644
+--- a/src/copyin.c
++++ b/src/copyin.c
+@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
+   char *str_res;		/* Result for string function.  */
+   static dynamic_string new_name;	/* New file name for rename option.  */
+   static int initialized_new_name = false;
++
+   if (!initialized_new_name)
+-  {
+-    ds_init (&new_name, 128);
+-    initialized_new_name = true;
+-  }
++    {
++      ds_init (&new_name);
++      initialized_new_name = true;
++    }
+ 
+   if (rename_flag)
+     {
+@@ -779,37 +780,36 @@ long_format (struct cpio_file_stat *file_hdr, char const *link_name)
+    already in `save_patterns' (from the command line) are preserved.  */
+ 
+ static void
+-read_pattern_file ()
++read_pattern_file (void)
+ {
+-  int max_new_patterns;
+-  char **new_save_patterns;
+-  int new_num_patterns;
++  char **new_save_patterns = NULL;
++  size_t max_new_patterns;
++  size_t new_num_patterns;
+   int i;
+-  dynamic_string pattern_name;
++  dynamic_string pattern_name = DYNAMIC_STRING_INITIALIZER;
+   FILE *pattern_fp;
+ 
+   if (num_patterns < 0)
+     num_patterns = 0;
+-  max_new_patterns = 1 + num_patterns;
+-  new_save_patterns = (char **) xmalloc (max_new_patterns * sizeof (char *));
+   new_num_patterns = num_patterns;
+-  ds_init (&pattern_name, 128);
++  max_new_patterns = num_patterns;
++  new_save_patterns = xcalloc (max_new_patterns, sizeof (new_save_patterns[0]));
+ 
+   pattern_fp = fopen (pattern_file_name, "r");
+   if (pattern_fp == NULL)
+     open_fatal (pattern_file_name);
+   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') != NULL)
+     {
+-      if (new_num_patterns >= max_new_patterns)
+-	{
+-	  max_new_patterns += 1;
+-	  new_save_patterns = (char **)
+-	    xrealloc ((char *) new_save_patterns,
+-		      max_new_patterns * sizeof (char *));
+-	}
++      if (new_num_patterns == max_new_patterns)
++	new_save_patterns = x2nrealloc (new_save_patterns,
++					&max_new_patterns,
++					sizeof (new_save_patterns[0]));
+       new_save_patterns[new_num_patterns] = xstrdup (pattern_name.ds_string);
+       ++new_num_patterns;
+     }
++
++  ds_free (&pattern_name);
++  
+   if (ferror (pattern_fp) || fclose (pattern_fp) == EOF)
+     close_error (pattern_file_name);
+ 
+@@ -1196,7 +1196,7 @@ swab_array (char *ptr, int count)
+    in the file system.  */
+ 
+ void
+-process_copy_in ()
++process_copy_in (void)
+ {
+   char done = false;		/* True if trailer reached.  */
+   FILE *tty_in = NULL;		/* Interactive file for rename option.  */
+diff --git a/src/copyout.c b/src/copyout.c
+index 8b0beb6..26e3dda 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
+    The format of the header depends on the compatibility (-c) flag.  */
+ 
+ void
+-process_copy_out ()
++process_copy_out (void)
+ {
+-  dynamic_string input_name;	/* Name of file read from stdin.  */
++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of file read from stdin.  */
+   struct stat file_stat;	/* Stat record for file.  */
+   struct cpio_file_stat file_hdr = CPIO_FILE_STAT_INITIALIZER;
+                                 /* Output header information.  */
+@@ -605,7 +606,6 @@ process_copy_out ()
+   char *orig_file_name = NULL;
+ 
+   /* Initialize the copy out.  */
+-  ds_init (&input_name, 128);
+   file_hdr.c_magic = 070707;
+ 
+   /* Check whether the output file might be a tape.  */
+@@ -657,14 +657,9 @@ process_copy_out ()
+ 	    {
+ 	      if (file_hdr.c_mode & CP_IFDIR)
+ 		{
+-		  int len = strlen (input_name.ds_string);
+ 		  /* Make sure the name ends with a slash */
+-		  if (input_name.ds_string[len-1] != '/')
+-		    {
+-		      ds_resize (&input_name, len + 2);
+-		      input_name.ds_string[len] = '/';
+-		      input_name.ds_string[len+1] = 0;
+-		    }
++		  if (!ds_endswith (&input_name, '/'))
++		    ds_append (&input_name, '/');
+ 		}
+ 	    }
+ 	  
+@@ -875,6 +870,7 @@ process_copy_out ()
+ 			 (unsigned long) blocks), (unsigned long) blocks);
+     }
+   cpio_file_stat_free (&file_hdr);
++  ds_free (&input_name);
+ }
+ 
+ 
+diff --git a/src/copypass.c b/src/copypass.c
+index dc13b5b..62f31c6 100644
+--- a/src/copypass.c
++++ b/src/copypass.c
+@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name, struct stat *st)
+    If `link_flag', link instead of copying.  */
+ 
+ void
+-process_copy_pass ()
++process_copy_pass (void)
+ {
+-  dynamic_string input_name;	/* Name of file from stdin.  */
+-  dynamic_string output_name;	/* Name of new file.  */
++  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of file from stdin.  */
++  dynamic_string output_name = DYNAMIC_STRING_INITIALIZER;
++                                /* Name of new file.  */
+   size_t dirname_len;		/* Length of `directory_name'.  */
+   int res;			/* Result of functions.  */
+   char *slash;			/* For moving past slashes in input name.  */
+@@ -65,25 +67,18 @@ process_copy_pass ()
+ 				   created files  */
+ 
+   /* Initialize the copy pass.  */
+-  ds_init (&input_name, 128);
+   
+   dirname_len = strlen (directory_name);
+   if (change_directory_option && !ISSLASH (directory_name[0]))
+     {
+       char *pwd = xgetcwd ();
+-
+-      dirname_len += strlen (pwd) + 1;
+-      ds_init (&output_name, dirname_len + 2);
+-      strcpy (output_name.ds_string, pwd);
+-      strcat (output_name.ds_string, "/");
+-      strcat (output_name.ds_string, directory_name);
++      
++      ds_concat (&output_name, pwd);
++      ds_append (&output_name, '/');
+     }
+-  else
+-    {
+-      ds_init (&output_name, dirname_len + 2);
+-      strcpy (output_name.ds_string, directory_name);
+-    }
+-  output_name.ds_string[dirname_len] = '/';
++  ds_concat (&output_name, directory_name);
++  ds_append (&output_name, '/');
++  dirname_len = ds_len (&output_name);
+   output_is_seekable = true;
+ 
+   change_dir ();
+@@ -116,8 +111,8 @@ process_copy_pass ()
+       /* Make the name of the new file.  */
+       for (slash = input_name.ds_string; *slash == '/'; ++slash)
+ 	;
+-      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
+-      strcpy (output_name.ds_string + dirname_len + 1, slash);
++      ds_reset (&output_name, dirname_len);
++      ds_concat (&output_name, slash);
+ 
+       existing_dir = false;
+       if (lstat (output_name.ds_string, &out_file_stat) == 0)
+@@ -333,6 +328,9 @@ process_copy_pass ()
+ 			 (unsigned long) blocks),
+ 	       (unsigned long) blocks);
+     }
++
++  ds_free (&input_name);
++  ds_free (&output_name);
+ }
+ 
+ /* Try and create a hard link from FILE_NAME to another file 
+diff --git a/src/dstring.c b/src/dstring.c
+index e9c063f..358f356 100644
+--- a/src/dstring.c
++++ b/src/dstring.c
+@@ -20,8 +20,8 @@
+ #if defined(HAVE_CONFIG_H)
+ # include <config.h>
+ #endif
+-
+ #include <stdio.h>
++#include <stdlib.h>
+ #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
+ #include <string.h>
+ #else
+@@ -33,24 +33,41 @@
+ /* Initialiaze dynamic string STRING with space for SIZE characters.  */
+ 
+ void
+-ds_init (dynamic_string *string, int size)
++ds_init (dynamic_string *string)
++{
++  memset (string, 0, sizeof *string);
++}
++
++/* Free the dynamic string storage. */
++
++void
++ds_free (dynamic_string *string)
+ {
+-  string->ds_length = size;
+-  string->ds_string = (char *) xmalloc (size);
++  free (string->ds_string);
+ }
+ 
+-/* Expand dynamic string STRING, if necessary, to hold SIZE characters.  */
++/* Expand dynamic string STRING, if necessary.  */
+ 
+ void
+-ds_resize (dynamic_string *string, int size)
++ds_resize (dynamic_string *string)
+ {
+-  if (size > string->ds_length)
++  if (string->ds_idx == string->ds_size)
+     {
+-      string->ds_length = size;
+-      string->ds_string = (char *) xrealloc ((char *) string->ds_string, size);
++      string->ds_string = x2nrealloc (string->ds_string, &string->ds_size,
++				      1);
+     }
+ }
+ 
++/* Reset the index of the dynamic string S to LEN. */
++
++void
++ds_reset (dynamic_string *s, size_t len)
++{
++  while (len > s->ds_size)
++    ds_resize (s);
++  s->ds_idx = len;
++}
++
+ /* Dynamic string S gets a string terminated by the EOS character
+    (which is removed) from file F.  S will increase
+    in size during the function if the string from F is longer than
+@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
+ char *
+ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
+ {
+-  int insize;			/* Amount needed for line.  */
+-  int strsize;			/* Amount allocated for S.  */
+   int next_ch;
+ 
+   /* Initialize.  */
+-  insize = 0;
+-  strsize = s->ds_length;
++  s->ds_idx = 0;
+ 
+   /* Read the input string.  */
+-  next_ch = getc (f);
+-  while (next_ch != eos && next_ch != EOF)
++  while ((next_ch = getc (f)) != eos && next_ch != EOF)
+     {
+-      if (insize >= strsize - 1)
+-	{
+-	  ds_resize (s, strsize * 2 + 2);
+-	  strsize = s->ds_length;
+-	}
+-      s->ds_string[insize++] = next_ch;
+-      next_ch = getc (f);
++      ds_resize (s);
++      s->ds_string[s->ds_idx++] = next_ch;
+     }
+-  s->ds_string[insize++] = '\0';
++  ds_resize (s);
++  s->ds_string[s->ds_idx] = '\0';
+ 
+-  if (insize == 1 && next_ch == EOF)
++  if (s->ds_idx == 0 && next_ch == EOF)
+     return NULL;
+   else
+     return s->ds_string;
+ }
+ 
++void
++ds_append (dynamic_string *s, int c)
++{
++  ds_resize (s);
++  s->ds_string[s->ds_idx] = c;
++  if (c)
++    {
++      s->ds_idx++;
++      ds_resize (s);
++      s->ds_string[s->ds_idx] = 0;
++    }      
++}
++
++void
++ds_concat (dynamic_string *s, char const *str)
++{
++  size_t len = strlen (str);
++  while (len + 1 > s->ds_size)
++    ds_resize (s);
++  memcpy (s->ds_string + s->ds_idx, str, len);
++  s->ds_idx += len;
++  s->ds_string[s->ds_idx] = 0;
++}
++
+ char *
+ ds_fgets (FILE *f, dynamic_string *s)
+ {
+@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
+ {
+   return ds_fgetstr (f, s, '\0');
+ }
++
++/* Return true if the dynamic string S ends with character C. */
++int
++ds_endswith (dynamic_string *s, int c)
++{
++  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] == c);
++}
+diff --git a/src/dstring.h b/src/dstring.h
+index b5135fe..f5b04ef 100644
+--- a/src/dstring.h
++++ b/src/dstring.h
+@@ -17,10 +17,6 @@
+    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
+    Boston, MA 02110-1301 USA.  */
+ 
+-#ifndef NULL
+-#define NULL 0
+-#endif
+-
+ /* A dynamic string consists of record that records the size of an
+    allocated string and the pointer to that string.  The actual string
+    is a normal zero byte terminated string that can be used with the
+@@ -30,22 +26,25 @@
+ 
+ typedef struct
+ {
+-  int ds_length;		/* Actual amount of storage allocated.  */
+-  char *ds_string;		/* String.  */
++  size_t ds_size;   /* Actual amount of storage allocated.  */
++  size_t ds_idx;    /* Index of the next free byte in the string. */
++  char *ds_string;  /* String storage. */
+ } dynamic_string;
+ 
++#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
+ 
+-/* Macros that look similar to the original string functions.
+-   WARNING:  These macros work only on pointers to dynamic string records.
+-   If used with a real record, an "&" must be used to get the pointer.  */
+-#define ds_strlen(s)		strlen ((s)->ds_string)
+-#define ds_strcmp(s1, s2)	strcmp ((s1)->ds_string, (s2)->ds_string)
+-#define ds_strncmp(s1, s2, n)	strncmp ((s1)->ds_string, (s2)->ds_string, n)
+-#define ds_index(s, c)		index ((s)->ds_string, c)
+-#define ds_rindex(s, c)		rindex ((s)->ds_string, c)
++void ds_init (dynamic_string *string);
++void ds_free (dynamic_string *string);
++void ds_reset (dynamic_string *s, size_t len);
+ 
+-void ds_init (dynamic_string *string, int size);
+-void ds_resize (dynamic_string *string, int size);
++/* All functions below guarantee that s->ds_string[s->ds_idx] == '\0' */
+ char *ds_fgetname (FILE *f, dynamic_string *s);
+ char *ds_fgets (FILE *f, dynamic_string *s);
+ char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
++void ds_append (dynamic_string *s, int c);
++void ds_concat (dynamic_string *s, char const *str);
++
++#define ds_len(s) ((s)->ds_idx)
++
++int ds_endswith (dynamic_string *s, int c);
++
+diff --git a/src/util.c b/src/util.c
+index 4421b20..6d6bbaa 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
+   FILE *tty_out;		/* File for interacting with user.  */
+   int old_tape_des;
+   char *next_archive_name;
+-  dynamic_string new_name;
++  dynamic_string new_name = DYNAMIC_STRING_INITIALIZER;
+   char *str_res;
+ 
+-  ds_init (&new_name, 128);
+-
+   /* Open files for interactive communication.  */
+   tty_in = fopen (TTY_NAME, "r");
+   if (tty_in == NULL)
+@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
+     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor changed from %d to %d"),
+ 	   old_tape_des, tape_des);
+ 
+-  free (new_name.ds_string);
++  ds_free (&new_name);
+   fclose (tty_in);
+   fclose (tty_out);
+ }
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index f4df826ed9..c65d6980f7 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
            file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
+           file://0001-Rewrite-dynamic-string-support.patch \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-- 
2.17.1

