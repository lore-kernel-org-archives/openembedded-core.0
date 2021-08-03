Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.1055.1627965703231229598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 21:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YH55yWp2;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3849402d18=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1734bKCe022035
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 21:41:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=2C7Gl0V7Jv34awXilMykpAwHP7hPT/je7zxx1rdjsus=;
 b=YH55yWp2PSc7yFKFwmCmSskoGKZCEMY2Owtp9rMIfL5z2YwgUhFEln7rQB9xHUhcgXpf
 2U6eEebX67VdEHV8MNThwG2BeQnVq4LQ+pOluSQxX4Q/qRW2izRj6AwH9jQmHmlUBfSm
 TX3oEfwGTjQeg1eWQRiD20LIP95RhWSv9FkxF8TbSLrt/MXftczLKi6iSdaPXdXL3KxA
 3IO3YQsuAgT6KelT+pPVt5DeFtmFJ99uYVK3Yg/oD6i+/gwmXUMaTUHev6oDbNlmHOzG
 ACbDZDqWelxVfNctM7O6xScM153XrpOT6IiPmD0YmPdUvFLA+OREq5xJZ+BIDTVoKCcc 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a68kjrspj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 21:41:42 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1734fgBU030747
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Aug 2021 21:41:42 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a68kjrsph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Aug 2021 21:41:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lPEyObKG7zPJ8xVvkNiLU3ebSlUtTUdCV7Jb5XriLYAcn5WVFoLhnOBZziqhbX2Wweo31ZcajWoDU7cU5Np/5cATrAhW+q7asqlWAHEYPHZXhtWLTVGXpU5cps8oybpg+ZqJ3Q08rYqvsUnyxdcYKLk2hx/Zb49jXd1QL7Bgu9FU2Vum5BHuHD4kp9Th9FyEtmfcOTY85oWQ54wDKaveOZKhF5ZVtTZBLym1tmijnIN9lqGclDem77my5TKUcEZrGx/f+Np8MYGL/zYlJq/l2WlyA6lQnNZeEJwwri8LmkAg8sM811R3hIrSQu3rstnbpnNgFPjVxKqjeGHV+GxAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2C7Gl0V7Jv34awXilMykpAwHP7hPT/je7zxx1rdjsus=;
 b=iNlDOnqQDP8Z/uJR7p+aP3OeixRBzTItpLp/HRIb6hL06R+XLsqSDzJ3VvkQtok1MHUHc2n7vMmyxceGXEE8cvsa4DwncSEi68Xo47D+W2HjH0fKeY6ybpfUNWX92Oz6prf5n/FmQNKJP7DxivCY1ieRtLUhnQjRm9pVPPRLvHoQ3sWawg4S3eS785E16g6djG52zw13J/7eyUasOBk2MwFW3aq8rIcJfQddMusmtbiOe0KL+ztvAV3Qn6BfqZX6hJjWHn8K5ii+P8JSs8wK+K5gYPKzgjLdFczRcLD1c3cl5vp1sIKUt1M/LVQ5lhwavVQGDjWLCfbCziZWElvulg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by MN2PR11MB4286.namprd11.prod.outlook.com (2603:10b6:208:18d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Tue, 3 Aug
 2021 04:41:39 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4373.026; Tue, 3 Aug 2021
 04:41:39 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
Date: Tue,  3 Aug 2021 13:11:38 +0800
Message-Id: <20210803051138.30790-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HKAPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:203:c8::10) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HKAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:203:c8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.6 via Frontend Transport; Tue, 3 Aug 2021 04:41:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7f48d1b-84d3-418a-d359-08d95638fbb3
X-MS-TrafficTypeDiagnostic: MN2PR11MB4286:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB42865CF4B9649B7DCA1F9BFAFFF09@MN2PR11MB4286.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lZE++dM61O5EW5eEccl2fvrzu+yIkfUyv7NFsvqoHtdfCdQHmqNhI8MBgASgRZfMn6nsvT/JBlKZ1vfg1np7Lw/jHLaRmlCrUKyHzMa7n6xt2vWzF8PjuBQYtIwi68dgGrQbfKFXUeg+F45iN/r6P1eO5wRBsnJ6gQcVr9SMSjetuob8U7hE+RniO1zeIUu6Cx56PO34bJgxHxeHkuc9O5DcPVwmuQUVPnFLqZMdbk/nLZ3J6rfYfws4MzHovICbuWevnA5knR2raFyFxPgFX5MtEINEYYzxlV+rXCg+tDcuBWbB8tUVdbV443MZpNdUKDDdPQZWQWlGIQPbHfV7W+paELOMYAebdlC6FSAZAmULiKvZmDPy0Fy1cQ51kcZbdi8+RMWu0Ry7SOxhdf/VkMjecpBoniugRYDkmfvszu4qcGN68H/+qVg5Q81r6TT4c/Qe/GQiLg4zVSICMD8nkSIpXNRbrOqzEOVDPLHYzxg6MIGOzbS6srYJu6w4N6VCLVSO9NZXlgCNWQxc1ZdB4zX4qJFAwLJ+AT8M3AKmx3nLmJ4Ord0OXkfT91hLhm4sKgzVXL2yIKPe+jF8R5cXMZ++QpQDDwfK1O/GcNZ49SLpeymBd6YR93fG/O/7B6hlH34n4qsitqducH5/BwAlHYlkjMeulagTPRGEWwBcTM2ECTuMXTFggn7AOcCVDpRvk6NOYXz88VAtlTaT2zHvYRPItIX0JCSFJHfYbfdiBnIO2V/iRHC4eRuNxx01JDQSd/LV1UPK2fuhheOAsHjwFl3ZgM4yA9HOZjXWXAF2vrc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(36756003)(4326008)(86362001)(6506007)(38100700002)(38350700002)(8936002)(6512007)(6486002)(8676002)(26005)(9686003)(2616005)(956004)(478600001)(83380400001)(66556008)(1076003)(316002)(66476007)(966005)(186003)(5660300002)(6916009)(52116002)(66946007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YVUKTHXf0T4FwhvfBrZWiJ5N/cxWIIe2OAJ3RiHap9mC7EXpGL7/O1lmCttD?=
 =?us-ascii?Q?zzfprtX+vy7IUTB0YLAp2np6+BptfT/ppSvj+p0F3zq6OVUvMDv3faTZUUcf?=
 =?us-ascii?Q?iFocVYXX6iDEPGG2XFx90hg73Wxp10t+OxIQwGLFbF+HxyK+8Ma7bkMjVkgD?=
 =?us-ascii?Q?HluxD2S+U6lVEFEW69etFxxXVhkiXLsJRAFgFBVudtvFISaEgqOydsAiczTE?=
 =?us-ascii?Q?3dcbJJDbvlwOiemxWCNOUAzPM/i0yIiU38AD/B7ic7DXV6UB81zSOprMYOHf?=
 =?us-ascii?Q?kGVwXEyNY+Akb8rEnglzy0s4kC8p9t28lhe9s2nCoZKogt0kqj1XAIcDJgZh?=
 =?us-ascii?Q?LR/5BgAT6APqm0092kNB81MhFCdHbOIiVIF3oAo5EmEds+E5qehGyWvR9/iR?=
 =?us-ascii?Q?ChQxNboYvXiSaUua3HkZBzzGpVeDh3tnblEl9mlN3sEHwBtvdPJs24WKqPcO?=
 =?us-ascii?Q?4JRKGbRlLZzpHswEh0hnPMKMil4eTscg/oI17Gtn5nEO8O3qkOtFc/bEF1OE?=
 =?us-ascii?Q?gF0Gbavz44T3+I5jMNo46Xeq4UCo7MAXuTo5n616R0gJWc2Klnoxu3jCmzFC?=
 =?us-ascii?Q?3b7DTsO0u42L2QwcI5rjobe8o06jU8FFOabPeQWmY9L5DiGIxbxd3lwm1Ll2?=
 =?us-ascii?Q?6BQwVTyM6cMbCWbf09XaB6RDj/8IG+rFpxKIo0bQDw+tRRk5r3+nCFPGBcRb?=
 =?us-ascii?Q?/nNcozEH3yRUNNTl8BUEwpIt3pRj+j7rZHSd4Iar7zIVOZQBbtt+FizWHTnm?=
 =?us-ascii?Q?ogSd8yQPvgmufSQPPsV5cZu6DBBecRsGHx1asKeQAyrBr11Dlw7vJk4ZPUF1?=
 =?us-ascii?Q?jEqcmfusy1ak6cbjYOf1hugUCQI3pMPF5jRd6CLeKiLgY5X9S+qo0wqAtxLA?=
 =?us-ascii?Q?yAawrZZgmPeU0B8XnpO8V1dBAD9YXBg3cmbKhXYajfBSiG52cnFJUVFxwW4P?=
 =?us-ascii?Q?Lt9jzlX4qPFK+QaGswVn2Y3DjowIJl23RpWQcz2oDqcBJOz8aqfjuaW77HfR?=
 =?us-ascii?Q?DgsRLLMf4gi0HtMBLzncr+6ECfpd3VKzORK+cIzVeKj8W6C63VeZs8FDf1Pg?=
 =?us-ascii?Q?WlehJcZDWfUbJ+D4hQWTXeHgUoeGyG1HwL7ppuolUkaERpPhL1hPCzhpuhte?=
 =?us-ascii?Q?RiMo/9e27yWuOWlEv3Dc7jKqOT1VTl3Z8uGdtjNEdvOHRKWsFb7ix9ht+wgK?=
 =?us-ascii?Q?n2GvjMYDo0ZtklS5YS9C1+/H5HcsSX+ouVHhSpNqrza1Dkg9ljBnbadph0je?=
 =?us-ascii?Q?LncM8keCXGIDuLJfDx0VwCr1Y/jBeZyhZSPvgenTsDnTt0QHgIyqKOkY6GXr?=
 =?us-ascii?Q?UwSb84zvZjh9oOTUze5yEnTn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f48d1b-84d3-418a-d359-08d95638fbb3
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2021 04:41:39.3865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xazje50BiYb3ePKxiQNfmhM1kSOayrSELGz3W1iUHuIuK5MHCYvz93Fuc6fzh77I4TVZ2VF5Aio59reWjZ4ZfkWkIM0wrd6krSZEMTrwSCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4286
X-Proofpoint-ORIG-GUID: arDeJUuM3hjVNO2hFqlckZbIwhVFisFr
X-Proofpoint-GUID: aixhs-Mjcq431-nHX_RMuZic9DgSOlHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-02_10,2021-08-02_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=979
 suspectscore=0 bulkscore=0 mlxscore=0 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030028
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

The timeout for threading.Lock, threading.Condition, etc, is not using
a monotonic clock, it is affected if the system time (realtime clock)
is set.

This patch will make condvar use monotonic clock.
Refence: https://bugs.python.org/issue41710

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 meta/recipes-devtools/python/python3_3.9.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb b/meta/recipes-devtools/python/python3_3.9.5.bb
index 82177f4a18..f3f0237c78 100644
--- a/meta/recipes-devtools/python/python3_3.9.5.bb
+++ b/meta/recipes-devtools/python/python3_3.9.5.bb
@@ -73,6 +73,9 @@ DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/li
 DEPENDS_append_class-target = " python3-native"
 DEPENDS_append_class-nativesdk = " python3-native"
 
+# force to use the mutex+cond implementation
+CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
+
 EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
 EXTRA_OECONF_append_class-native = " --bindir=${bindir}/${PN}"
 
-- 
2.17.1

