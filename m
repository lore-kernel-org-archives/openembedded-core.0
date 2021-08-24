Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2543.1629828662241873603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 11:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Q28DzKEg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3870ab4e12=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17OC09V2019681
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:11:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=pjbfNG3FCQxDaAhbJBxKVofS9P+8IMMHdxm527Ajvns=;
 b=Q28DzKEgtoXW5d0Lg6juJsWZysTkcPT2lwbKYE2HerSoBswpBCqV0MRrn0ZfgZCvjCr4
 oxhaPmqHPfudTZjX6BuP5UZx2n1P0l15E9b6lby/rv61OjfH101q+81q0O9SZe1kPXgE
 syB0t5Wl6WtfLm2yx50UWfsc6IbcSBWQoRr2B6C//vANtbfPIngMUFeXJUtEFS+B3kC/
 4mkBFDiLEZsWZ1hUKeuRE7XOLnX6fpBxEnoAKuanUiqPmRaMimtvdHwxmM92mDMWiKlm
 iBR5H6hVnMQNCl60YV0KLYSauBwWVAgT2IozaMZJJxCsNmnQHVZ5mw5pppqOdq2NeJ/d UA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com with ESMTP id 3amtg3gh2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 11:11:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZnIcBXX9VFoM0R6YgnMfEVyUDlsaSOA7U/y1he45I/urgNTa1/1fcCJbtwIZCxRFWIUcvB9iNjif0c0yxWycPzLqbdPRyz9eq+uz1ZZ/qCL2te9b4JxTL4oaZSioOnPo5NFa/P7A4kzxZomwQLojVDaXzeWYFX0dJI1E6CuFz4AbdXpUtrKwL7KL5PrdjieMFUNgPQybnSGTPiz4Z4UKTV9UBMbGFb+OV+57uymQ4sy5bSM+nfd0CrLrl5l4pY3bjRiCEa/7NVIuMr7z4hrx2OjDzS8CbsxMiD19P55qsX/mQVHdW3vIFFalLEMffI20WTZepKEgaqhej+LcObtqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjbfNG3FCQxDaAhbJBxKVofS9P+8IMMHdxm527Ajvns=;
 b=b+YACZHOVHsCsK/epPbd/YmMF+FohNpJsw3MH6Sa9M29ItHSGGgdf2GKhFnZFWTuNmMVMtucgwghQHskqm3yiJadHrv8rb80NHA6vdKXDQlkbBIoKvTwCKKf6YZTuga2F/1Iorb22TIlXhjxvSuGbnAv0FNLd81st5o03t+jxYML4X7qPQobh1X9Mk4sy4HVckYW7JZtsOBUoQ/sZ3z7hmZIV8yeMHwF/Vd120Jkz8oZKJUp8NWWsQTQTfZ8ba2l57gSZJWL3wh6OJph7hT5OV0itjltQobNWX3D7zxlolLJ5aR/7KcnZLVA0YSu9ZXq+pa3nhVqRChO3NwqPOHYyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3111.namprd11.prod.outlook.com (2603:10b6:a03:90::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Tue, 24 Aug
 2021 18:10:59 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530%6]) with mapi id 15.20.4436.024; Tue, 24 Aug 2021
 18:10:59 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] bluez: upgrade 5.60 -> 5.61
Date: Tue, 24 Aug 2021 14:10:39 -0400
Message-Id: <20210824181039.463888-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BL0PR1501CA0014.namprd15.prod.outlook.com
 (2603:10b6:207:17::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by BL0PR1501CA0014.namprd15.prod.outlook.com (2603:10b6:207:17::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 18:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a43c68-e0b9-430d-bf73-08d9672a864f
X-MS-TrafficTypeDiagnostic: BYAPR11MB3111:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB311192E311A921FF2A8234749FC59@BYAPR11MB3111.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yEGa+WYjzCQu+8fCKHDC8B/yYAMRZgfLVh/8EKLtjeyacqEbGQOkBlLuVyUeReOhvP+uN8buuY2cBljUkpyYMPjQSXPkprMALjRBJsZlEQUH4EcIspstxqPMH9wZCjKUxZwoH0QrWtlITUpi4djLyqUdlDm290ECdSmsIBLFf17m+oqPndrXPWpcf+CBADjwYmw1obw0qAloMqqX/i6UOL3KinnjEXxOiBhysN8gKfEMD97RuXw5xF9rkPZdgk0/D9o7+AIFkGZWmLbqQS+zKpA6/hupBAbUnszJasOC8yoffKLFdGugrncAi4ztJubEfkQcp1ATAWboavcjSzNEUsNVg4LBqodAq8Ljrb/YHfn9KsjmhN+5DsKqPTwBzz03kCcN+hlEuFFyY3jG/hvD0e1Fz2C4SYiRRCjyVEjUr/NmaWHf/DUAJIaPwu/pAwRlzKXBYM1YWZJ5B3WxTRda7O1C9jgi/062RfJRda2vKPvlO6BZUCsf0TdWIxYP4nGecadL2/MxBvSOEnGQjwO3SFNNJga/E708WhQyJOEjf3x3qTZh8XKvFEjGJHeQoa0pi/VYhAx+H6TgE0BUw26W6uiBDgW32ARC55jxe0p2STBHGASuzegGcBSAzVcgkrfYjQrynxSWOCVzIqJWwK+fMw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6506007)(2906002)(5660300002)(508600001)(316002)(8676002)(6916009)(6666004)(66946007)(8936002)(66476007)(6512007)(83380400001)(2616005)(1076003)(6486002)(86362001)(36756003)(66556008)(38100700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UzyerZQugaroO3mGUuaWOmBD7wHsWyZMy3zanmNBHgMLkNwuDBCaAHCiapWH?=
 =?us-ascii?Q?PZ7kUp+haHZKAccRkphpJZd45yWHBXpX0pyCobEIEY3qAKpuk7IoZB6MXtTf?=
 =?us-ascii?Q?KKJ5RxUiO715Jk/HdE7g0deaEnxq60GrSs0p973vdW/EWCeP0c5/xrcVdeLT?=
 =?us-ascii?Q?ulXKsPwBB8g1/OPv7SYZdx6teYa4nScoU4l1TJsaiHuC8Oci91pjLf1Q7ek2?=
 =?us-ascii?Q?hdK3p3VLhTvCvwhmtWqItBX8FAWq5BdbzCbx8hbflKGJ7eqqrNu9pbkqKrL3?=
 =?us-ascii?Q?2TeREXNEcDmOl9QYd2LwOAHy74Zl09/phUsojAnvCczbZDBHLEHwYwA1ii5B?=
 =?us-ascii?Q?5kZ6htqozzxdtAf+eR9DHYscKwCot1dZVZ4QoYb7ZfblDxOawy87zu3MrOYV?=
 =?us-ascii?Q?6V7uyqG6jcer8UzCcLnXY/CSATs1MR0DIqsFLLVPhssCX+CwA2aYIKNAgOlw?=
 =?us-ascii?Q?a4ieBoFbQupNgryqRO7LffYijr9ox1vjhw4MsshRdZubWlRtJfyk8FgDCcyg?=
 =?us-ascii?Q?65vgI3Q/u1w0d8qB77PZ26u5XBVW/+zJBTGgXHCLL4WO9hqIEzTMZWRy7m3L?=
 =?us-ascii?Q?X0ukoUe0wrTVpVtqK6TSnKX4JDrKKfc5pCccRk9XkDlOKT947HzpseSbS/E0?=
 =?us-ascii?Q?v+5C9zWxuj5cIS9FE62hRYeG2N7u01n23vwU70mayVahYwVcnWOW+Odq65e7?=
 =?us-ascii?Q?qBo7zkF7bQJTL6mnZTNJBzw7bwpDbFlHDZ/OYl7fdg7DD9RsEcUuGMgkZZ22?=
 =?us-ascii?Q?m+e+wxi9Fy5ssbKBWO1bF3xy+TBwD6760tauC4AL9NHS0Ybu9606ilT226/O?=
 =?us-ascii?Q?Rm/qhrP1WwgxcZ1pJNPqM3EEMIhbjqVSVGtZ6u7h6Dt8j/6Lck6DABFEV21o?=
 =?us-ascii?Q?ZnV0GHdTTPhgx+oRcaxctVCt43Mc2NJumq7ovJOJEPB73WtbQiH9nMrpxw7N?=
 =?us-ascii?Q?ucPxkhD/fLpoDe/54PlCeSX6ng3t0LFo9dqxLVEVdD0upCuTuGQkCXQgBeAi?=
 =?us-ascii?Q?V6QHpxVztD8P7yWU97SMsVZhhns3k8lzTGKWXPZXfLTAS26act2pJoloYNTy?=
 =?us-ascii?Q?R5OAjiiRS48XLEAqkymc37duMq5qIp46HMDgEODhY+jNq8ZDdab+abgR13U1?=
 =?us-ascii?Q?SkFUQFdDSWor4njgEUb1vNGCaV3F8VQ1sJQbmQkRaV2ly2UjtV2qsDZdVP2I?=
 =?us-ascii?Q?nW5qaf051vCidncr+w5MHX+ieG2qov4MUgmzTt1tVJuRRDAd8uNkf+1n5C+h?=
 =?us-ascii?Q?urZQJ0nCGi2IJCf3xX7frBUO9uVOr5vmvDtZL2gFhJhVZXs8LsbGGp3BCh/k?=
 =?us-ascii?Q?Io0s/dB9misqrRddYXa5ss6spHwHUnVV2mzEmY8MC2rkUsPkCYLWyezf88w8?=
 =?us-ascii?Q?sFSiZS5LPGQeQoBBSQzgPidfkHpS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a43c68-e0b9-430d-bf73-08d9672a864f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 18:10:59.1135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DFdGEbWnibO0kyaVlWz7to9U7Cw6rio9LZFg/kQGsYP4VftWE8+BlsORh3UxS0GcDX71/1fPQvRjEBVDx6lqQ4jO+4C7RhAzypRAx2usJuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3111
X-Proofpoint-ORIG-GUID: Rq4peGE3FyzqWN22uQkwaAq2d_yzBl-x
X-Proofpoint-GUID: Rq4peGE3FyzqWN22uQkwaAq2d_yzBl-x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-24_05,2021-08-24_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108240119
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

5.61 includes a fix for CVE-2021-3658 (bluez: adapter incorrectly
restores Discoverable state after powered down), as well as other
fixes.

From the changelog:

ver 5.61:
   Fix issue with A2DP while waiting for command response.
   Fix issue with A2DP when SetConfiguration fails.
   Fix issue with device removal handling.
   Fix issue with storing discoverable setting.
   Add support for Central Address Resolution characteristic.
   Add support for admin policy plugin.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../bluez5/{bluez5_5.60.bb => bluez5_5.61.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.60.bb => bluez5_5.61.bb} (95%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.60.bb b/meta/recipes-connectivity/bluez5/bluez5_5.61.bb
similarity index 95%
rename from meta/recipes-connectivity/bluez5/bluez5_5.60.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.61.bb
index defa0c15cd..b2e5dd66a9 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.60.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.61.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "710999580d01ee59ec585e5e7c07fd94eddedc001aa26fe7464c546f9d945304"
+SRC_URI[sha256sum] = "83afd6c52179554bfeabbcb538fec2eb6be90a8ac3c40871b49d7ad8b49c423b"
 
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
-- 
2.31.1

