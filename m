Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA73C5472E
	for <webhook@archiver.kernel.org>; Fri, 23 Aug 2024 01:48:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7470.1724377705885583490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Aug 2024 18:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89658b1c4b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47N0fVSe026506
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:25 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 412ju6x11p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U2ilQvfm2/O9toHugW+dytiayLlIJ7wSDM6xYpAp8K5Y1ut/KFz4sG3k42/mM/7dyc9OxZluwCBbAacfpRlpc/GeQxN/9X62I6ZvUrEP7jVrnTORBGQAB2ctMUIs3ZFBZNLAGaL/SiAM4YON53xdc0WVkasg55MNpn9E/Tz8TrsO8ZVOTbxbx3RvOO6B5SAJDxtKzQGorzosQIVtet/iNaVZcrE0YYe1pzkBf2oajBur1QKrKeXuWHpbmICIDq3DkXr0GaICkdWOM+a3SCjEQFf+UMIJMG1ZYk6DUNYCDF9K9MNGlxiOALm3M054G0jHV0Wy1XCND9yS1z4yT56LlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEU6lobC2KTMHpDt+piBUbJ1AdX0V2ZBPjwRWyFOrn8=;
 b=PNLshNJwPyaNrgzHidIT99+Z71ZEyDWgwbIbvkK278gan3wCL4StJ+gi4bieXKlLzyyNn30erhMdT33gdWXVJRQjw9UDvrDE/DMpP//gF2Sv+O/CUoBolAmn8JkvmhDcG0vM2x3C42xEeir7Q9a7x67OPGQylpUPgfOJKzxlTyp7gYMNOKDcO6+YdA0NiJoKU1WAEviBiXNj/t/v5yvXdZn+R+VuyLFFitAlub6aHwYQC6q05pCCN9GNkn+UwQprpndADXJRnMUq1T0t+P6jNGdbJTTrqQoNWcuqXj/wRZgaXK2Q9AH0pp91hEqaqG3yCeHhmzenH1UkcVhDbJA3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by DS0PR11MB8114.namprd11.prod.outlook.com (2603:10b6:8:129::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 01:48:23 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::db65:6dac:6f2b:a275%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 01:48:23 +0000
From: Hongxu Jia <hongxu.jia@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH 6/9] bash: 5.2.21 -> 5.2.32
Date: Fri, 23 Aug 2024 09:48:03 +0800
Message-Id: <20240823014806.4154590-7-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823014806.4154590-1-hongxu.jia@windriver.com>
References: <20240823014806.4154590-1-hongxu.jia@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0285.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::20) To MW3PR11MB4633.namprd11.prod.outlook.com
 (2603:10b6:303:5b::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR11MB4633:EE_|DS0PR11MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 82fb8cbd-9cfd-460d-189e-08dcc315ac23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W4lt2o4DAedt3lIbrzBklTk9ZzmNdGWOlB5d0bjqvGJW8yVdknWAAKJiJwc8?=
 =?us-ascii?Q?eIuuchkQLRmqR4LB4QcJDdj691JFVaD8/90sSwvGUALD1W+T81/3y9u6QUEi?=
 =?us-ascii?Q?Fs/9WdUKMt7sdYISFMzJMGY/9noEowqOq75tGgRjzPpYxA9qoMxuyVHfYx/X?=
 =?us-ascii?Q?kV/X3CSeloOdMa/mwTlExbFWAE6w7ae2xZzIf/XB/sWctUjbFr8YvIkYetLx?=
 =?us-ascii?Q?tLPz5VECTl2Mw1lz1AfgGKfKJQdezbj77Gz8XDh/fJZ5RKErnMW7Y+Lo9hZf?=
 =?us-ascii?Q?UMmYCYvaHJXCpXGIkB8nOoXwUwLwNofEQjiPELNYsWNQINgT0elxuJ1lyyJO?=
 =?us-ascii?Q?qi873cm44up0GE/Zw10CHJmApsbQwZu7ZhuZWKki16WxtDyiKKUOkYP6kfuH?=
 =?us-ascii?Q?PyyPEtnGdpdLlM6zIdYb9CITXaez9A7nF+ouWFUNxXfhTqQmBQR0gtK4U0DQ?=
 =?us-ascii?Q?Tkh5GVbeF2trQuFoGmu41NEr/lItO6S9+wQH2RoQKm5T7CzWEK7+Y4SIAlbV?=
 =?us-ascii?Q?nW4CBfq2BqrXm/yjJ9Ss5cB27GyiBBhPR4s2FLTLqsnEi39azMgJ2U+cIDJw?=
 =?us-ascii?Q?boeN5eDOaHGCUYb2CvCPUZmXkhvGTb+DlQqXea3M+RcTnexZZEM21WFAbVVD?=
 =?us-ascii?Q?l7OEWvsN3nu0oi/EsEVfVtIJUBBGJ4HXTCVqYa6nUytgkhwpC09ivs7YfSx5?=
 =?us-ascii?Q?zyn3F98M1s9Kx0tTAjArn76e87GsXISKWEwWA9SvXEr3W+ilrwtPTm5N2h8F?=
 =?us-ascii?Q?q8M1kBr2Ec/lFNRrmKFQGdRcCrCAY/1vk4dWGDQVY2SkAa16jetHbUT6CZAC?=
 =?us-ascii?Q?3cbKfKY5/iKI9LvTc+Da+53OmY0Dw2LHztAxoPi94kYChsluFPgDXAoKWzgB?=
 =?us-ascii?Q?52cU2hfFRenSVUfpgxgDD/ocAHtuZTXaR4D8Y1BjK9WEYa49mT+AJzPXHUeE?=
 =?us-ascii?Q?BmRfdMTfvgkI5XIjcknu8nqLC72lPDzakB1VeHLQn/nXwwONo/dEtWHuuTrp?=
 =?us-ascii?Q?+3FiUGTvSudyi7rI5N/Ou4hNjvkCs8KwSEUUYNMSmPcQfhg5wpHTh8y66Hpl?=
 =?us-ascii?Q?mqnXX7Hv1/I7vLJhsElgp5y0POULAawo5ryFZ5ko3TdPTIOg392hag0oFtK0?=
 =?us-ascii?Q?ES3IT5QYFMg4V3Tzd3URxAxtjzOP6Wt1JbRJQAPZ2PLG4u1KWxqszIGeuQEq?=
 =?us-ascii?Q?ljtisuP1BLR4g6XQDKqcNASzQv428HntfAW3vkQZ5i9+GqiSd5MMVJBN90FD?=
 =?us-ascii?Q?t9F8LfLnK8Q+/G/o439BHKyZus9g9xj9Lg+zcMYj76IZzWz5FGJgl8CosePp?=
 =?us-ascii?Q?gbUGRDe5iMi4urPtVIgSmlMbYsI88tdaxyse3m0aUve6GDj/HzWIhhhxxI59?=
 =?us-ascii?Q?xMxLzm0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PCUXjRSjnKGtA9w3eR3h8jkleLjajmGuRtK1JPcQ9NwBg1LBtvbetlrC9gx7?=
 =?us-ascii?Q?BXdD20cQKhlDk6e+ddSsq3CHcko3b2MRH7r7evK9MU3BgJ8pUkoP8gVd411B?=
 =?us-ascii?Q?Z5EDrCCaknUNdl7ZW/9V0ANMxma/Fi4kzS1SaEDToinorP5LatFw4WmHLVNQ?=
 =?us-ascii?Q?pqBN4mNBtkozjKJtLw0s1iAWYhOcBQcZRoOwoKyZprwe7YNmz/yROq9yYq+r?=
 =?us-ascii?Q?4YRSgZcuuwJ/QnsvKLCBGunwH6CTNdNZuC0HJBXvhPD7/BvSXyHCd3nFOAjK?=
 =?us-ascii?Q?pqJ1BFzOh05sdn4iCp22mGlHBfxrJQ+wjXWbYL19uYMgAWSRLNSlPdupeiNK?=
 =?us-ascii?Q?U5SujRpwQAWDjgaAy4sADH7wG+lH2PwMIoRQgxgSsddyqUw4gisqDqC3jOnO?=
 =?us-ascii?Q?lPZ9HjnXx22O1DIxX6kmP0oDiEWUw+IGz6w0kHH0mGylTJh85zo9KEGdiqkj?=
 =?us-ascii?Q?FsMzE4HO8UEb6J5BwChIDGEtAE6dJsrpD0YiQOl6r/ire0FiX+yzOkci7OFe?=
 =?us-ascii?Q?JkPAdV0c6u8W6coD9NcCJuWc6a2JFOTEsnePZfSHCEYbyqe78/6jQ5WtpR2I?=
 =?us-ascii?Q?TIr1Fo3iXmPMLULZyQGe+JVuKoQ/A+ePsMEpAOPzg0DYJzSKd0i9Pyb8GQ2L?=
 =?us-ascii?Q?juaTEUxVbNEDHOWJtcbThU33LEbwnNG5fCY4V5dsV8Ffe3ftIBqEZP9IREO0?=
 =?us-ascii?Q?0hVNREPEtgxTxjnWQqNyFhiELQsTJwm+ZHt7+vnqHkOwkSWBR4XuZtX4bo0F?=
 =?us-ascii?Q?j110ySC3zewr0PMhNCcrrUwJX6gUX3a4p/8+G4yscvQ6n4DLs2ttEt59H349?=
 =?us-ascii?Q?/PtY+FJ2FFva0uL56M4Go1RWnySlvvcWT+wZxrjp/dgnj3l5GvEdh15Pwd2O?=
 =?us-ascii?Q?Zm1oRhNzIjFVMyZzY8Gh1VqZicAZwuFo4zUohgJh1RrJ01kv5L/iCIqYLmET?=
 =?us-ascii?Q?RyRpi4tuejboXsBUrF47eaikfnbD9xNiHTJQ2BNe40AvkX/SKtjr2jNigwvP?=
 =?us-ascii?Q?y/x8LwW9EHMKhiKhZAurB1NTqylCaR9PA7PtF6antFVLUydvXMrtkMELtwJt?=
 =?us-ascii?Q?T8Ml0CTSihGiTUtOAIJxXDbKmiyAqPapsEmtQu5DK831GQk5Q21oud46D7WG?=
 =?us-ascii?Q?v21zZ3taCQ1RU+BMf93RrnAUZfQtfENYFpUa/cdARM0qv1wtPB9M9QLYjcMy?=
 =?us-ascii?Q?HFb+APe11KgHjAluMdsXT26SkLvEKoho0l4cbcdPBKnHUQQHF61lq/SbwpUB?=
 =?us-ascii?Q?Im7oDUCd/8sFHieFwtX/2brUqbth1s/xu+f4TN30nJ59gOLx8LNAsmy9XhJF?=
 =?us-ascii?Q?ZlqNyhVBFKWUPqoYeyRM8kLkI7BUs1MNV//z7b2UWhNSoYU3U4mzvZIM8qyP?=
 =?us-ascii?Q?6k6AOSd3/6d7IsoVu7YqWe+FW2QViXQRmgxR8Lyr68/zma1ik2ArTJC3r2+l?=
 =?us-ascii?Q?hg2w0zmbOeKciGT3fK08GWsaZEKWVQAHXJDKSVszvNAwnpvAqxZZ0DPh5v3P?=
 =?us-ascii?Q?YsXgLflrflt2z4dBAYFXdWKCaXHlJkUHSquT8WQNUlVf2yXW72O799sE+DzF?=
 =?us-ascii?Q?Av6hSyZBHJL2IBBahQkJg7mtpuUgx33GEbMfk89rZKImaqMX8DtL6Q6DK1O+?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82fb8cbd-9cfd-460d-189e-08dcc315ac23
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 01:48:23.1572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUn/ryST476bNaleS3jRZC2+mUQC4xvPQR4bJkbwHcoyai8JTKrd0+h5Kp+NOp8YoOQrJOEda9ih1eLvRjogdrTFRhZoD1oyIOy3ypCegEQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8114
X-Proofpoint-ORIG-GUID: e5HlovAUtYmAMD9v9MX8v5UL9NeDvmEI
X-Authority-Analysis: v=2.4 cv=VdWlP0p9 c=1 sm=1 tr=0 ts=66c7ea69 cx=c_pps a=JZW2CxG2E6UWpsn1SfDs7A==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=Sv4y0yS6AAAA:8
 a=fvaPMweRAAAA:8 a=9Wbp7B8dAAAA:8 a=pGLkceISAAAA:8 a=7k6cPk4qze5VMvZ0TOMA:9 a=vLJxBx9RkQav2PiS:21 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=I7ze7AG8jwQKfjVvUIqj:22 a=vJ2phfYHA-_bQipmD_nH:22 a=BESxJfN36ujmTJQqZ0Zq:22
X-Proofpoint-GUID: e5HlovAUtYmAMD9v9MX8v5UL9NeDvmEI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-23_01,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408230010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Aug 2024 01:48:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203673

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...T-handler-while-waiting-for-a-child-.patch | 21 ++++++++-----------
 .../bash/bash/0001-fix-c99.patch              |  2 +-
 .../bash/bash/build-tests.patch               |  7 +++----
 .../bash/bash/fix-filesubst-errexit.patch     |  7 ++-----
 .../bash/bash/fix-run-builtins.patch          |  9 +++-----
 .../bash/bash/mkbuiltins_have_stringize.patch | 18 ++++++++++++----
 .../bash/bash/test-output.patch               | 11 ++++------
 .../bash/bash/use_aclocal.patch               |  3 +--
 .../bash/{bash_5.2.21.bb => bash_5.2.32.bb}   |  2 +-
 9 files changed, 38 insertions(+), 42 deletions(-)
 rename meta/recipes-extended/bash/{bash_5.2.21.bb => bash_5.2.32.bb} (90%)

diff --git a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
index 77d770b364..4e73edb9b3 100644
--- a/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
+++ b/meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
@@ -1,4 +1,4 @@
-From 721d5be99eb37d31e48bd66d61808a66a4c5ab84 Mon Sep 17 00:00:00 2001
+From e4b9493ae4923595ec3ca67f85322129fb3056cf Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Mon, 30 Oct 2023 12:16:07 -0400
 Subject: [PATCH] changes to SIGINT handler while waiting for a child; skip
@@ -20,10 +20,10 @@ Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
  6 files changed, 43 insertions(+), 32 deletions(-)
 
 diff --git a/general.c b/general.c
-index 85c5a8b6..65e2ee06 100644
+index bda39f4..94a5339 100644
 --- a/general.c
 +++ b/general.c
-@@ -262,8 +262,9 @@ legal_number (string, result)
+@@ -264,8 +264,9 @@ legal_number (string, result)
    if (errno || ep == string)
      return 0;	/* errno is set on overflow or underflow */
  
@@ -36,7 +36,7 @@ index 85c5a8b6..65e2ee06 100644
  
    /* If *string is not '\0' but *ep is '\0' on return, the entire string
 diff --git a/jobs.c b/jobs.c
-index 6b986ed7..262d78de 100644
+index d3e4ab0..903cf9c 100644
 --- a/jobs.c
 +++ b/jobs.c
 @@ -2718,6 +2718,10 @@ wait_for_background_pids (ps)
@@ -96,7 +96,7 @@ index 6b986ed7..262d78de 100644
        waiting_for_child = 0;
        if (old_sigint_handler == SIG_IGN)
  	set_signal_handler (SIGINT, old_sigint_handler);
-@@ -4136,7 +4144,7 @@ set_job_status_and_cleanup (job)
+@@ -4141,7 +4149,7 @@ set_job_status_and_cleanup (job)
  		 SIGINT (if we reset the sighandler to the default).
  		 In this case, we have to fix things up.  What a crock. */
  	      if (temp_handler == trap_handler && signal_is_trapped (SIGINT) == 0)
@@ -106,7 +106,7 @@ index 6b986ed7..262d78de 100644
  	      if (temp_handler == SIG_DFL)
  		termsig_handler (SIGINT);	/* XXX */
 diff --git a/tests/redir.right b/tests/redir.right
-index 8db10414..9e1403c8 100644
+index 8db1041..9e1403c 100644
 --- a/tests/redir.right
 +++ b/tests/redir.right
 @@ -154,10 +154,10 @@ foo
@@ -123,7 +123,7 @@ index 8db10414..9e1403c8 100644
 +./redir11.sub: line 77: 42: No such file or directory
  42
 diff --git a/tests/redir11.sub b/tests/redir11.sub
-index d417cdb6..ca9854cd 100644
+index d417cdb..ca9854c 100644
 --- a/tests/redir11.sub
 +++ b/tests/redir11.sub
 @@ -34,6 +34,8 @@ a=4 b=7 ss=4 declare -i ss
@@ -136,7 +136,7 @@ index d417cdb6..ca9854cd 100644
  a=4 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 3'; }
  a=1 echo foo 2>&1 >&$(foo) | { grep -q 'Bad file' || echo 'redir11 bad 4'; }
 diff --git a/tests/type.right b/tests/type.right
-index bbc228e8..e0a66745 100644
+index bbc228e..c0c1c8b 100644
 --- a/tests/type.right
 +++ b/tests/type.right
 @@ -24,15 +24,15 @@ func ()
@@ -164,7 +164,7 @@ index bbc228e8..e0a66745 100644
  builtin is a shell builtin
  /bin/sh
 diff --git a/tests/type.tests b/tests/type.tests
-index fd39c18a..ddc15407 100644
+index fd39c18..ddc1540 100644
 --- a/tests/type.tests
 +++ b/tests/type.tests
 @@ -25,8 +25,6 @@ type -r ${THIS_SH}
@@ -221,6 +221,3 @@ index fd39c18a..ddc15407 100644
  type m
  
  hash -r
--- 
-2.35.5
-
diff --git a/meta/recipes-extended/bash/bash/0001-fix-c99.patch b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
index aa810f7d4e..abd83d09af 100644
--- a/meta/recipes-extended/bash/bash/0001-fix-c99.patch
+++ b/meta/recipes-extended/bash/bash/0001-fix-c99.patch
@@ -1,4 +1,4 @@
-From e9ed388e760ec33dcf9e72c639946c0d0abeec26 Mon Sep 17 00:00:00 2001
+From e8ec2d75a52bdc93c83a679a71a68f4033033b8b Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Wed, 19 Jun 2024 12:57:39 +0000
 Subject: [PATCH] Fix C99 problems
diff --git a/meta/recipes-extended/bash/bash/build-tests.patch b/meta/recipes-extended/bash/bash/build-tests.patch
index c1b9b8261f..4cce1ba993 100644
--- a/meta/recipes-extended/bash/bash/build-tests.patch
+++ b/meta/recipes-extended/bash/bash/build-tests.patch
@@ -1,4 +1,4 @@
-From 318b762837c2ad25319caeaf0320eff613b64daf Mon Sep 17 00:00:00 2001
+From c3f58f8b4f7a359b9d9dd97a45bcaab50a89d224 Mon Sep 17 00:00:00 2001
 From: Anders Roxell <anders.roxell@enea.com>
 Date: Wed, 19 Dec 2012 17:18:31 +0100
 Subject: [PATCH] Add 'ptest' target to Makefile, to run tests without checking
@@ -9,16 +9,15 @@ Signed-off-by: Anders Roxell <anders.roxell@enea.com>
 
 Rebase to 5.0
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  Makefile.in | 24 +++++++++++++++++++-----
  1 file changed, 19 insertions(+), 5 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index bc97049..937ce39 100644
+index 0b4df73..7e2a34e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -943,20 +943,34 @@ maybe-clean:
+@@ -958,20 +958,34 @@ maybe-clean:
  	fi
  
  recho$(EXEEXT):		$(SUPPORT_SRC)recho.c
diff --git a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
index 60f1852316..c5082ee355 100644
--- a/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
+++ b/meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
@@ -1,4 +1,4 @@
-From 59ddfda14e3c9aa6286bb4c4c0748f7c1324a65a Mon Sep 17 00:00:00 2001
+From 16951b74971c7fd38fd036dac1410a9e53cbe736 Mon Sep 17 00:00:00 2001
 From: Chet Ramey <chet.ramey@case.edu>
 Date: Fri, 7 Apr 2023 00:28:46 -0700
 Subject: [PATCH] $(<nosuchfile) is no longer a fatal error with errexit
@@ -17,7 +17,7 @@ Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/builtins/evalstring.c b/builtins/evalstring.c
-index df3dd68e2a7e..6612081cd646 100644
+index 53a7c0b..c5075cc 100644
 --- a/builtins/evalstring.c
 +++ b/builtins/evalstring.c
 @@ -753,7 +753,7 @@ open_redir_file (r, fnp)
@@ -29,6 +29,3 @@ index df3dd68e2a7e..6612081cd646 100644
        free (fn);
        if (fnp)
  	*fnp = 0;
--- 
-2.40.0
-
diff --git a/meta/recipes-extended/bash/bash/fix-run-builtins.patch b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
index 2fa388302e..05d0859821 100644
--- a/meta/recipes-extended/bash/bash/fix-run-builtins.patch
+++ b/meta/recipes-extended/bash/bash/fix-run-builtins.patch
@@ -1,4 +1,4 @@
-From 0c4cab9594c96c2dc435a8d9724605824bcbf917 Mon Sep 17 00:00:00 2001
+From 15601c71b073a604ccda25c7f14f0bb12e9a3b28 Mon Sep 17 00:00:00 2001
 From: Dengke Du <dengke.du@windriver.com>
 Date: Tue, 19 Apr 2016 02:57:45 -0400
 Subject: [PATCH] fix run-builtins failed
@@ -16,10 +16,10 @@ Signed-off-by: Dengke Du <dengke.du@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tests/builtins.tests b/tests/builtins.tests
-index 9d77520..63f3af8 100644
+index 8eee43e..71c9eee 100644
 --- a/tests/builtins.tests
 +++ b/tests/builtins.tests
-@@ -109,7 +109,7 @@ esac
+@@ -124,7 +124,7 @@ esac
  
  # test options to exec
  (exec -a specialname ${THIS_SH} -c 'echo $0' )
@@ -28,6 +28,3 @@ index 9d77520..63f3af8 100644
  # test `clean' environment.  if /bin/sh is bash, and the script version of
  # printenv is run, there will be variables in the environment that bash
  # sets on startup.  Also test code that prefixes argv[0] with a dash.
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
index a9391d6cac..eb29e7d836 100644
--- a/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
+++ b/meta/recipes-extended/bash/bash/mkbuiltins_have_stringize.patch
@@ -1,3 +1,8 @@
+From d11685286144c2e5630545e435d11387b2908fd0 Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Wed, 14 Nov 2012 07:55:09 -0700
+Subject: [PATCH] bash: fix mkbuiltins build failure
+
 On hosts with FORTIFY_SOURCES, stringize support is required, as it's used by
 the macros to wrap functions (e.g. read and open in unistd.h). Those wrappers
 use the STRING() macro from unistd.h. A header in the bash sources overrides
@@ -13,14 +18,19 @@ stringize support, or to not define STRING() at all when FORTIFY_SOURCES is
 defined, letting the unistd.h one be used, instead.
 
 Upstream-Status: Pending
+---
+ builtins/mkbuiltins.c | 1 +
+ 1 file changed, 1 insertion(+)
 
---- bash-4.2.orig/builtins/mkbuiltins.c
-+++ bash-4.2/builtins/mkbuiltins.c
+diff --git a/builtins/mkbuiltins.c b/builtins/mkbuiltins.c
+index f505ebd..b5b2eed 100644
+--- a/builtins/mkbuiltins.c
++++ b/builtins/mkbuiltins.c
 @@ -28,6 +28,7 @@
  #  define HAVE_STDLIB_H
-
+ 
  #  define HAVE_RENAME
 +#  define HAVE_STRINGIZE
  #endif /* CROSS_COMPILING */
-
+ 
  #if defined (HAVE_UNISTD_H)
diff --git a/meta/recipes-extended/bash/bash/test-output.patch b/meta/recipes-extended/bash/bash/test-output.patch
index 0ffcc24587..3225907b66 100644
--- a/meta/recipes-extended/bash/bash/test-output.patch
+++ b/meta/recipes-extended/bash/bash/test-output.patch
@@ -1,7 +1,7 @@
-From 28eb06047ebd2deaa8c7cd2bf6655ef6a469dc14 Mon Sep 17 00:00:00 2001
+From f5cbd5a4954b89857c9e397cacceda552484f5d5 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 15 Aug 2017 10:01:56 +0800
-Subject: [PATCH 1/2] Add FAIL/PASS output to test output.
+Subject: [PATCH] Add FAIL/PASS output to test output.
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -16,10 +16,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 10 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run-all b/tests/run-all
-index 2882fe0..e21d026 100644
+index 1f74923..ba36a1f 100644
 --- a/tests/run-all
 +++ b/tests/run-all
-@@ -33,7 +33,16 @@ do
+@@ -57,7 +57,16 @@ do
  	case $x in
  	$0|run-minimal|run-gprof)	;;
  	*.orig|*~) ;;
@@ -37,6 +37,3 @@ index 2882fe0..e21d026 100644
  	esac
  done
  
--- 
-1.8.3.1
-
diff --git a/meta/recipes-extended/bash/bash/use_aclocal.patch b/meta/recipes-extended/bash/bash/use_aclocal.patch
index bd6870b386..e966b037a2 100644
--- a/meta/recipes-extended/bash/bash/use_aclocal.patch
+++ b/meta/recipes-extended/bash/bash/use_aclocal.patch
@@ -1,4 +1,4 @@
-From d1bf23817afffd5917b74da6946e0c3b7e63e336 Mon Sep 17 00:00:00 2001
+From b3a64702fa1978463c01bd5d9fe711e4628aba1e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 28 Dec 2020 21:04:27 +0100
 Subject: [PATCH] bash: update 5.0 -> 5.1
@@ -9,7 +9,6 @@ as needed instead making it work like other autotools based projects.
 
 Upstream-Status: Inappropriate [OE configuration specific]
 RP 2021/1/20
-
 ---
  configure.ac | 43 -------------------------------------------
  1 file changed, 43 deletions(-)
diff --git a/meta/recipes-extended/bash/bash_5.2.21.bb b/meta/recipes-extended/bash/bash_5.2.32.bb
similarity index 90%
rename from meta/recipes-extended/bash/bash_5.2.21.bb
rename to meta/recipes-extended/bash/bash_5.2.32.bb
index ccfe5c47a7..b159c0232f 100644
--- a/meta/recipes-extended/bash/bash_5.2.21.bb
+++ b/meta/recipes-extended/bash/bash_5.2.32.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNU_MIRROR}/bash/${BP}.tar.gz;name=tarball \
            file://0001-fix-c99.patch \
            "
 
-SRC_URI[tarball.sha256sum] = "c8e31bdc59b69aaffc5b36509905ba3e5cbb12747091d27b4b977f078560d5b8"
+SRC_URI[tarball.sha256sum] = "d3ef80d2b67d8cbbe4d3265c63a72c46f9b278ead6e0e06d61801b58f23f50b5"
 
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
-- 
2.27.0


