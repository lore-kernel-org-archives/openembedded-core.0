Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D165C3DA7F
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 07:01:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40547.1723446071399101701
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 00:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=895429e4d8=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C4p3eZ005180
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:01:10 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wxcuhh44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:01:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Akw97YLaKkY2NhQ7J+9I15LxhDCOyyPJWrizcmjs8uQ02XcIDnBvLkhF4ic1/fQGXuQVI1zzBqc7y8y5o680YT+a0EprF0UjR4LRRN4yYpeIWLbx5BTSl0OR9lgBWx9dsmddIkzzXLf1n7IeJZqLNAaz5JFXzHDo3eB8LO+zHNkKmjSRbm7IinpGQAjCDmt64P93LmGXOw5pLFUMWmFM3RTbo8cjte5jWVfU2bYY+2B82EM+wz24QjIxCvcMlJlOysyTdPEvTyBLkz4B3EqH0vxOuh6yc/L46eeNl3IC8X+lDap/Biwqw8N/Ys8xAjHG3pM4kreBvNtDkVuLOcmiRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRhTnQChaaq9WOninTqxJQB7jYLc7Lo00kRR8DGafAI=;
 b=PWIHDHNcg66ATG7jrx10vCuZgvcsU4zw1WxwRY7wCPhsTWsKzyR03DI2Ii1AbUGNLqR3mK7fziGKro2RCgWXYQZ7h6Qh08PTHouNBSxmAxAv5B4UoRQlkx99BaxzVBamEDJbdSt3E1pzMqjSaPQwMYnJzftwVy5boOgxMULs1BcsD9qjrmo4D9K06KZNMJjdU8cRh4iEibBLTP+n1omUu5ddqqUvV640pqXedkRChct+z+AoTq/DT9DpVzqrA4eGHu2MlZK1DpXf+xhg6RbrNR2YJ69b2Hwn65fcgWU+jqN3JQajbMQIFjHn9xRpnvMyT9m/LhmkJUdYoTUYFGlRfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB5862.namprd11.prod.outlook.com (2603:10b6:510:134::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Mon, 12 Aug
 2024 07:01:06 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 07:01:05 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] json-c: change SUMMARY and DESCRIPTION
Date: Mon, 12 Aug 2024 00:00:54 -0700
Message-Id: <20240812070054.93602-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7d2bb8-993f-4c4a-0f1e-08dcba9c8913
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oMjg8f/KL9q0ITv/kPUq8/E7osoAu0jl7xUQA7Sb+lIG4rP28UGSrsddSX4L?=
 =?us-ascii?Q?Xq5P6z9CKoppbN62xsV9Z74njkUVA7Cxnt3alPCOyEC0nGuC4asUBB5KLLqH?=
 =?us-ascii?Q?Gq7soJkpZ8JvD/jy7A47l8i4spamJTfUgmMmmAK2NRvZJRIRPwbPsgLtSpUB?=
 =?us-ascii?Q?2oWz83bj5xVG6h12cDOJZ8S7l3m5daag+gvuvdW6s4WYiozfq59xEQAWJktf?=
 =?us-ascii?Q?1pZn+l9MOakV9LwuzKhl1vhprGUF28Y4NMPh4ziPka+Rd93To4Vx3CjAxPxt?=
 =?us-ascii?Q?JrHi8mLFwJShaWIaVY78S3bAcDeVYxsg/fXxXWqgr1+0hF4r87g6DZg90dlI?=
 =?us-ascii?Q?Emd9fRq+KcuGcOl/B8lrOPoAHOT8R+xctykVHUsV46N6RTrZHQyLrwTnAtTC?=
 =?us-ascii?Q?h7yjtcZO2HFndD79ZP/FM5SRlI7qrtAN7yekYmgBd41frX4XGYS8M401jsvO?=
 =?us-ascii?Q?pUiw7PkDF6s7tTzgT7G5CcoZKU5XmhJqYlloxPcXcxsUMecCBgAO/L9B2LFO?=
 =?us-ascii?Q?qg0fV9uHSXvRYp/ytePDNL2b0Tt17hQXQUOZgTQfKYGRshnpVVDNs2wEhqTl?=
 =?us-ascii?Q?VPeOFhEt3km9MQwxKLg6a5Hmvvndz90BMWeQLJzPirhNq+HqxKATO9IvAZNH?=
 =?us-ascii?Q?M578PlhZNsHghHiynFIcIxeJrJzjwafvlmCsUh9/TkwGQ3HzBpJLK4UFhKKS?=
 =?us-ascii?Q?GGmjuBWu7FYsXGdXAyWI3sbyaWmdfKEFin0THJI6X9s5up0tNbKQOZ0QJCtO?=
 =?us-ascii?Q?uYuqXpPvANmJ99gDyH3uGFrMrnG81A0XkB4u2B9kyLKkhih/e7rCGZuHugU5?=
 =?us-ascii?Q?A1A6uKYR1rFffEmhJkMVmQSiSLENOOrY/ed5v1VvW3WhBPOTY3wMMApMhb5p?=
 =?us-ascii?Q?b4z3bJBCtzAeabmIOfnsOLYFaSy2HDucgdBQHDva2rnt555GcefyvEYG7VBH?=
 =?us-ascii?Q?PlPq7w9sVt8JZDtiEKCC5Rt6pgzPvv4lVQRjMoW87t2EFts8U8B4iwNwU/3f?=
 =?us-ascii?Q?QVUzGvJzh3zxLRu3VpDD3b2/7I1/NTifDBnTAwP2fOCWhdUT/ptWUBiedf2U?=
 =?us-ascii?Q?Loli6Iica60JKp+Tr/sguO56PZaBJ2Ca2ZBWBi40/HmYCDqCj+K6eZDqRnMa?=
 =?us-ascii?Q?pku0fghPOWEjepfmDWiL6Qg4BQ3Nlc2weqcA9K1Wusph1gvNmmpts1PXJomU?=
 =?us-ascii?Q?4EU4eKFfsjNgDZqVAuduZFRHlzvA6Kn3kpPWBQrZnRZ3y/JJ7d+OcY3f+jv/?=
 =?us-ascii?Q?YEXexpMM1Z1DviH4/pqNEbVrrktLT+fMB3gtYst03gt1tvxv/E0VYiM78EKz?=
 =?us-ascii?Q?Z0yKXOMFVnsdRNC4eIltZ85oPeg0ChI/MX1rtpgoCn2o0W83yMnue/yG+KFS?=
 =?us-ascii?Q?QPLDtDE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rYFzw/psKDyZ/07a2rcewfRef+S3bBUvxBLJ5zVKkVj8GqVDalkrD0y++x1b?=
 =?us-ascii?Q?NEcVC1TQvh/U+rAxVX1wN8JIDvX7ADUQqnQs+ZHYLZEy+XV5suZeba84CJBE?=
 =?us-ascii?Q?cpZhNISQkfCQRwTuMzwCjs8Z6Jbni55K5MUeZMoJTmDDxxqoJKhyAggA0GEP?=
 =?us-ascii?Q?MCKbToxFnhYVoAheUpZgI+MunBUp22BpMdn1cBexXYBs+lWN5Wlsydz7WvS9?=
 =?us-ascii?Q?CI2ZGHV6czCAf252/5q6w8T0YbErXWZtcKFXrLC2RxW+fePogSYu7y7ocfwY?=
 =?us-ascii?Q?tOphKdbmw/TDZeZ4Mas42LMptvIiyueoEXKyU635naL244Jhs6Z8IRqndnLe?=
 =?us-ascii?Q?SYsrgXl669VsLoSY5AEc2bv4V64z9jKAUIpYmFOgYFEOx0zCLv/ZHARU0+t3?=
 =?us-ascii?Q?oBGETMI0vCDHrZ1/bI5Em0WAYZk/UoSO5GpMoso36tQHAV0NYbLzKDhKkJla?=
 =?us-ascii?Q?ffXGYS1/T8vAmkSE9hs06vh8V2VwJcH98ogL6CbmNHiCeG0LhuZ+rvhbk7ru?=
 =?us-ascii?Q?6ZDsyWjFuQzeYmw40mGHCFOkWnMFWwZ+PX2EwNoPLxRJnK5yp3yKzJ+rZXUJ?=
 =?us-ascii?Q?KUHe9nmGP422gAIx0MNcXo3iD+ZQ4EBmELyvDaLXygMXjYkwIwxtO4DPij2N?=
 =?us-ascii?Q?VVhePOvb/mAhdVkMiKQS+5PnIGz2Hve5rv2TcgCvGYBkz3hFBSwfsvYJH0xZ?=
 =?us-ascii?Q?X80iaYbpCmCNnrqbak66RwOhc/wSqPAiir3/6nWP/sL1vyjBdbMHRKHmFBFq?=
 =?us-ascii?Q?G2pg3mG0ykhuQzX3QRpSaZInod5TxhnttypSDNfMOdya9kl6KFVxsmOpRR3W?=
 =?us-ascii?Q?5wZvtfTM5+zdgk16jennQvhTdZBmI4+7RSAR2SzxnK/QSRliSnw3C+RpBPdS?=
 =?us-ascii?Q?tjadU2MUV/qoLetgUjgFWMYg7iAOC32xe+gqXkSUCLp+8e4Z0Fz20Oaj/hqR?=
 =?us-ascii?Q?MS4TUARt11k42v3FUgVJsdoS+9p3EDdlglHmOvP5AvOdjcBV+PZDfAn2zmBl?=
 =?us-ascii?Q?ftCJo5bRfEZzCeFKkz6Joj145ZbGj62tjhE0l+zLpH5P6yKY5XjJ75cy9D5N?=
 =?us-ascii?Q?wS6wOqpGg60QoGxbUVNSjhQ+Nsmz3lakFAjAITFH3ogeF0jOH5th3QTMMdY1?=
 =?us-ascii?Q?96GTWN97V92SLFWtUy/X4E4+Mr64XaRtBKpsWHVowLIiamqQnHPqDGqmlwg8?=
 =?us-ascii?Q?WYDeA5SozbSZlIgMsSNsjJrb9SkMXQh9YDY5wWMbmzbFvq6OYQmwgjYyl1BG?=
 =?us-ascii?Q?0e9HDcA3f51UqmPI0lsw1Jn8fyPQd/X96eXA1bPGtHdLrSjZKIoh2uGUQ0c5?=
 =?us-ascii?Q?qR1CFUWeB2b1oUdTQozifFZ15M42SgglJSPC2JJ76/RpNTfkYe3ExxoVURGK?=
 =?us-ascii?Q?rQ9qBDeQi686pDLNbujYgm0RQP5DOckMKWJ993ZuQSSg3VG+zqFcK6bzXe8A?=
 =?us-ascii?Q?10wdg9KBXkMv7u6XlfcjcHeuhkE8Dc7SnhjrWyAt/JPIXmcU2XWPxZ19A2vj?=
 =?us-ascii?Q?qkKCX2WYecBzxY6QSWyfUfxuxrTYq7gyXP1+aZtyXDC2mvyH9K2yQaXp0vKl?=
 =?us-ascii?Q?vHlRqKyzbuNYsHLyBWmRrjVq02txlZlo7fnJRElI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7d2bb8-993f-4c4a-0f1e-08dcba9c8913
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:01:05.8756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbUSPNERRhDy1/UTiGeIETWbWQ7MU++OzR3Am/6QSL8ABR5SPhulzFWi4Kmn02le6Ax//nUlp+SAgcbARCs/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5862
X-Proofpoint-GUID: V2JsE0n2cbfwRtgI3D1OotIbnPRV-u91
X-Proofpoint-ORIG-GUID: V2JsE0n2cbfwRtgI3D1OotIbnPRV-u91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408120052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:01:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203201

From: Chen Qi <Qi.Chen@windriver.com>

Change SUMMARY and DESCRIPTION according to json-c's homepage
https://github.com/json-c/json-c/wiki.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/json-c/json-c_0.17.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.17.bb b/meta/recipes-devtools/json-c/json-c_0.17.bb
index 20bcece768..92ab612175 100644
--- a/meta/recipes-devtools/json-c/json-c_0.17.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.17.bb
@@ -1,5 +1,7 @@
-SUMMARY = "C bindings for apps which will manipulate JSON data"
-DESCRIPTION = "JSON-C implements a reference counting object model that allows you to easily construct JSON objects in C."
+SUMMARY = "A JSON implementation in C"
+DESCRIPTION = "JSON-C implements a reference counting object model that allows \
+you to easily construct JSON objects in C, output them as JSON formatted strings \
+and parse JSON formatted strings back into the C representation of JSON objects."
 HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
-- 
2.25.1


