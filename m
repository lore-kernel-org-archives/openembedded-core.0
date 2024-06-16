Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CCF2C27C53
	for <webhook@archiver.kernel.org>; Sun, 16 Jun 2024 11:33:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.32043.1718537630717475663
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jun 2024 04:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6897d61437=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45GBQXCW011302
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 04:33:50 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ysafg0nhc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 04:33:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldkgCpjJ4Mt7RDyre/lrCpwSS7eVctn900zMdd4WjarSmXBXM+HnlWRsxPq89pfLs/sPbEjSfUG3oWyLLExPyLSjA7EsfXBYwh15FPvHV0eiX5WVuvpMk6Pu3H2DjAvbQX1LuR8OIWcOrMfsg6neuk2BvU0ceBkls7oF5q0FWgpEle8zY2QFqYy0qe6ZN6JUergE8t0A7T0EKOw1G3q5xNCcSzPhqXR3D1vh5xJAxK5kkhHB9eCCXg+7gbM3gLjWES/jE1aPnW4pHWVnaQITY/c/iSvnGgxRdO7kjgXubhOzJDMHtYEpEHdp0P2piJ4MxkVM6UDsvqFmYmobuGBFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X6aKC6tpp5q60TyCUSrReNQwnt1FizgHl68Jc7ZM//Y=;
 b=UXPnFL7UuGCOfamru5UaTFU15aSjUm7bjV34XH25z18n2V7Wvzf9v0ct7uDTxxR5vExleOzn193nBEVta/BvSbyJb3TyggUU8C2DN3Gnfbf1I2ryy5V2wR8g1REzWtU/biW3KUODBiRGLxlyzdY4rVg7iakZUQnzKo5c8+oFYJI6SrrSZmtvOG6weY/ArsX8wk/klBlSlIJymxdlYI1GHFTnIkOoLj/otnzU7jpnKsgfQyRePCs+zJdbjE3QpLwQLFbzPCvE2EJjVqGPWn7R2mjmF2j8S9SqWO00QqSuTcwetG4tNJYse1E0mn3r4BCzE50ywPu3o0tii5a+mSg7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.29; Sun, 16 Jun 2024 11:33:48 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.7677.029; Sun, 16 Jun 2024
 11:33:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] debianutils: upgrade 5.17 -> 5.19
Date: Sun, 16 Jun 2024 19:33:37 +0800
Message-Id: <20240616113337.607564-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240616113337.607564-1-yi.zhao@windriver.com>
References: <20240616113337.607564-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0199.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::17) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH0PR11MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bee23ad-58bb-40c3-8c6c-08dc8df83043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FsIs2NGXX1/f9nUdBGWIgfMW8iYYuH1uiQr4zMUX9j2IhjmMbHyiquxskKRt?=
 =?us-ascii?Q?7BJXTGK5wnKj9XJSTPXUCVYhPQostSVuyVB/M7AntJfw7UnTlZc7qZ9FZpb9?=
 =?us-ascii?Q?qWa79jPFrPLIGlbO2m4yS3CHWeM8bXGyr4My4BLtmI8eEK6OO55/3bYfRZgV?=
 =?us-ascii?Q?BLNHM++pIqNmz0TNq+FyGVcYv2Fz08aW4dl/9geJhrEaZ7qFHg7NN6j0ae2Z?=
 =?us-ascii?Q?IsxptGbrxdFlnkDizBTLQAlmbd9yx4GNl2UAUsx6lVIzXqoftiye1MBdOLei?=
 =?us-ascii?Q?Viort3/4ED+n/FeGYR0VU0vH1TVfi/hb0M7QlRupsMqODVzS4+lBVwpRf0gg?=
 =?us-ascii?Q?i/fNRgNhpwV9pMXPZzmvUUo4KR92sVDtcYharO2fg9k9Baq6rKihTj/FMqtH?=
 =?us-ascii?Q?dqv84Sm4ZMofJ3Wh+SkK4ZGgLVkVZCiyAIgrvj33xERP4Fhpcn9cpAUxOxjl?=
 =?us-ascii?Q?7cppAFMV0Hv8690XZ/Ej7vRhHjV/Rfs2Iwi4Q8/hBXN4m03AyAbJxYZIEknJ?=
 =?us-ascii?Q?npUvjCo+DaFOVFbRMZPNr8TFUzixmxl5abnjG4DAv4zF07r4+p+GZmvH+ILk?=
 =?us-ascii?Q?/NzXzipF38dRH4BIl0uRCI//CTi66QUJOkvgKONeQq8v8uN1raS6bDeELPxj?=
 =?us-ascii?Q?atxltJGL82X9Tscv7gVhHQDyomOVFDgBa3wp3hCh56BJNbI8lNxwgGqrjwLN?=
 =?us-ascii?Q?9lQZSwvIbDHfMVQCAf8J6Z/vLV57NM1DU4ku1R/WWNr7G/RxsOtDfVzSTQPz?=
 =?us-ascii?Q?44Lm8oMVZfatl0XZsslNMB4vGU1kIq7EdxDKV2mKCjtgjHYnjAih6ePoeoiA?=
 =?us-ascii?Q?K0DHU3maEC00pOeBkh9xiUHcTPc+pZTPM2wqHUezDN0pH6IYYcKIKSC3mQsf?=
 =?us-ascii?Q?QjZ7nVPnqFLfDqDVzKVMqsoeHu/hYonxgAoUVsIp8HNayHmODu3EaJHfHpqQ?=
 =?us-ascii?Q?I2KcsLFBryR53Uhehb4t9roBHwsEqPWvmqqNBjBz5fs6CZpMpSIBBHGY0+fi?=
 =?us-ascii?Q?+B2eUHKsNx5X9lzFztk/YxhwUY1iKb/TvDFq+K5hcAysMKcPSALz6tLRN4pI?=
 =?us-ascii?Q?szDJma6woAM0bi0VVDOujjtn1Nc2qmJLG7cTLr5L3Rv2K6Zd5WLYuymaJuAe?=
 =?us-ascii?Q?LjLe4Wg6BDuKOcGv5IuioEn+4exUKwqTIIoFfIxfVemSZ96kZxSUfe7LHJlC?=
 =?us-ascii?Q?SZUb8uD+xybbji3E1+qdHiAK7vY1COqTYhEUTUkbN7hve8enFv9/HQZe7ZBY?=
 =?us-ascii?Q?/WaODYML72d6OVjiScFZOuP7pwHQQb3J6g2uTCfhmQhGIXJ32cqp00TBJ0za?=
 =?us-ascii?Q?ZIuL6uQJ2yqUfK+pCKhEyuK4gfycgaukQrvqTPDhbb7mJGDm9a2JD9MJkQB5?=
 =?us-ascii?Q?Hw9LyFs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rIv27Qjmwm7c9uYAZJ82t23ED9/eSKdAKSde5pVFRk2YYaLFY4WecaqdUdgP?=
 =?us-ascii?Q?4xKF0c5LjCFJbleAQQsG5ZDT5mrV/Pe48C7NDyZOpqj5fJjJfN6e/TJ8eo5h?=
 =?us-ascii?Q?WE6wK53v+U3aC7c/b0VtZNxgRX3rnfHo9ia+/PMFUsHurOBOG1Q5NXn77uEL?=
 =?us-ascii?Q?24BcKaR3Blda7SRXYr6hmJ8gkTMKYsmNA+cmNoBW+4oycYUIbETkHrvi10hO?=
 =?us-ascii?Q?4ldBZobXBurkY2PK82pRcQQ+9EaB4U/PG/ZKvoZPCfjlWiDTpXhWDp0oq/1I?=
 =?us-ascii?Q?O95vx8I6ZaseTtqYQFFrDjvreuuSnwr+1/xNanB5+Dz9MZFSpyRHRkfgaKmx?=
 =?us-ascii?Q?SDSZkeNJS10oMTTsbm4kjGAparYSnZA9Fy3bi1OAVMfn92tYiq/DQQuy4w3I?=
 =?us-ascii?Q?W6drGywCNHF0aOdXuEYRoW0rzzcWfP4suA0P6J/KqPlGvBRxWWUXPOlvJZG5?=
 =?us-ascii?Q?Se+eNyE0A9Nv4uBu5T2hg/GV+RPaxi/Ms3c2VIfwMkxl6wNVxqB+GL+FO7fS?=
 =?us-ascii?Q?fOPpdfGse//R9aBURr0CQ1FZjf9Bpk5m80ZlbqlI8vEibx5xJ6UqXr9YTP33?=
 =?us-ascii?Q?0sareNSRs3qomQBfIajBlJC0+3XhBNMxSurOxULCyJm1HT0NEcyzuAf50tHa?=
 =?us-ascii?Q?MtlhUDXPtDylIX6rDwaUVgWfg8sdRL4QkK6q56Nmge03yAnBjNI2y4nfkvun?=
 =?us-ascii?Q?9k1BOoI5hnlAOiCDd7L/5kF7+p947v5jj4XQHyqF5uENqfmuGw23T4nm4rxV?=
 =?us-ascii?Q?muNLoo+dZzRmqacQlZRDLhVnHkic59iFNfvnf7hpKY+5TWC5n7/NW5olhlIw?=
 =?us-ascii?Q?cYSjYSx1TodcVFXqAy5CUViRsT8TP1/YbOBVVTPBW4ZV4kDbuO5SlJigJumc?=
 =?us-ascii?Q?krIhSsKX/gXGIcoQEmlsXYzHqvU2qGFvOc6JzSKtTik2gTO4Lh+0oK9UE3ft?=
 =?us-ascii?Q?tewmnTk70lUCoZHBYBUvG5eunYe3lgTGhfj+J/KSjmdH8IL2ffJbSjP4tuCW?=
 =?us-ascii?Q?ESkUr/PHmMRSJOh0AYCNPiTyW37IXQY3jw5k5Hxai5z6yJRAFwGQgMOQ5OW6?=
 =?us-ascii?Q?GS1+KrjrtZ3oPjwtJ6Y8EVh6bgXK7YhgAaZe1Pwmg4kmTBH1S9T1qkO9CSlw?=
 =?us-ascii?Q?nC0ZNdPnsZWwm+C5+ZjNDlb6mIR/xWJIWsGoneF7sKEy6tgIunqVbeeqYyqE?=
 =?us-ascii?Q?fqxhgv0otD6pKkFGdon0C8kz+fZUufLcTOtwjVJLNvFk3Qrni8slvNrJ6vih?=
 =?us-ascii?Q?I7vMb0XOxsJ3yw9pJqMDiBvm0PrYH50Y67cfHFF1X5zI9jH1FAaZMiwbYDwW?=
 =?us-ascii?Q?tZRR3JCmz6psxwGLVuAaP1j4PBWSBztfZ853GUIBsGYhzktZLIxhv+kIUq0r?=
 =?us-ascii?Q?oyUYkLYNMBmXopqu1iskeIATShsPQoqI0CEWJQbdFKyCWNpbCcGOGZ8VGIOz?=
 =?us-ascii?Q?+tMEMyEELt0AEmYoErDTwANRbrfsb/GF9BhTVLbgPesHW0x30CdUugNtccCm?=
 =?us-ascii?Q?IzLhf5T8WZ1p90uq1Q583RW1n96eugIIRIAYMeuw2jvauL7TxuGNG1pmKd/g?=
 =?us-ascii?Q?z552N5eL45SMJ5C4G30kgN63hkN+gTXmFK3+YjkM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bee23ad-58bb-40c3-8c6c-08dc8df83043
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2024 11:33:48.3313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP6Ke+Sc7/rab90hj3BllbkUfQC2UE8o8zfCWL391U0+AyEUB1+cC+1onnyIi9AB6WcjXMoX0e0Tzj7hL+P7ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-Proofpoint-GUID: TR6upNM_bRE9t0H7r2-pJ2NjUUapId2N
X-Proofpoint-ORIG-GUID: TR6upNM_bRE9t0H7r2-pJ2NjUUapId2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-16_10,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=980 clxscore=1011
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406160091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jun 2024 11:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200775

ChangeLog:

5.19:
* update-shells: Avoid duplicate lines when package shells contain both
  aliased and canonical shells.

5.18
* po4a/po/fr.po: Updated french translations for manpages.
* d/control: Bump standards version from 4.6.2 to 4.7.0.
* acinclude.m4: Bump DEBIANUTILS_VERSION from 5.17 to 5.18.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../debianutils/{debianutils_5.17.bb => debianutils_5.19.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_5.17.bb => debianutils_5.19.bb} (97%)

diff --git a/meta/recipes-support/debianutils/debianutils_5.17.bb b/meta/recipes-support/debianutils/debianutils_5.19.bb
similarity index 97%
rename from meta/recipes-support/debianutils/debianutils_5.17.bb
rename to meta/recipes-support/debianutils/debianutils_5.19.bb
index c5f25bae40..0fe9b1ec14 100644
--- a/meta/recipes-support/debianutils/debianutils_5.17.bb
+++ b/meta/recipes-support/debianutils/debianutils_5.19.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=4b667f30411d21bc8fd7db85d502a8e9
 SRC_URI = "git://salsa.debian.org/debian/debianutils.git;protocol=https;branch=master \
            "
 
-SRCREV = "baf12e98a02883d1b76081e32f2185ee3497570b"
+SRCREV = "295d7674cdd526f3c9ec9de76db50efa280a5df0"
 
 inherit autotools update-alternatives
 
-- 
2.25.1


