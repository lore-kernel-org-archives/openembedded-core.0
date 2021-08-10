Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.5333.1628584322413554750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GqCi7Zp5;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38560e51b3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A8Ua5J011141
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 01:32:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=k9ew5oH05qnoGcCtOcKfvOJDct2aYE6gPOOb7AZVPco=;
 b=GqCi7Zp540TCKHjArQ5r61PzAQ2LZT+TasYHmYkQrDoGbQo1PNYsB+AjjK8Hcw+xdxcS
 v+mLRf6o0BtJm5rs9OpC00+SpLObh+CD/wYBaJVy/5fjjybbTGv9CHLCp89jCgBTAJrV
 UsDjwDnWnALls7E4V2j8RH6/c47+1wUefGtzdZMnJZKd7hoVGza8wD3t37Nku5AzbrhI
 cRRE+bKoErs0nn1Bf2uokahqqwDiDcIc1kUAPh0p7Mjk2jpuExmdqFFv4blH4DZnWmKv
 uANI/QrwdhBSfcnH8L0QsH8tuBNlOMDWoAK5K5r2Jpcw02ZXxW6oI0cvkm16FHP2dVxN Hg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3abjr3g3hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 01:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdIgjiJwlknzbtpYwqdHxFbhZASJisc0MGuEXeF7r+zJk6yMlkU+zEB5QxuT9eUKTEMdkqFA+II2yZHHZr8gGJOqhIRDFPzhpNpkwkm496pb5dBYZ0SAaeAZr5KoZF0W5M/fwQqDJhmJJT3NLqBKWU1By+d8Twi2wt0dDKcxkAuiPqgf5o7ttiKqVOXkLpHYZaKrYa5xmpwuI5Hjl4308g30xPtRChOc5F3rSl8T6GRuHHK4vUjd3UWlwW0TAmhaMvGkym4WHdEJdRaraKxhMkU2V1bTv8WG7ZJyPqOWt6JfTUWd8t4DSgn+mGb3HHFRveH/qtKXRDcd6pQvcy50ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9ew5oH05qnoGcCtOcKfvOJDct2aYE6gPOOb7AZVPco=;
 b=mPIhyQbd/SQGG3bBw6gQIPPQ+fJbYEP1fSgbj90ena67x92uP6xaK4TPzjputqxxGXU+L8Ye4mU7fK5f1jlG0gTP7xPpA9wi86l+WC8q7jVkm+VmhLg3lIAAqzUtwBjM4HC2oicHmoqoQuz+/7KehyOnQ22AuI1y+JKgHBXVUdKfoj46dtWSK+bb3GlV+n8HKWAY7zv0qa7BmOsqYwDR33E47IaBcRw3031IroLM76oSFsjDdb2G7r2iEA6zAhHyn3/Ssqi8OLMMD6oTTNvAauyOcWUlAfHpDyf9nsi+s8uNmolcyZzTmZfsaiphukml6bmU9iYw7r3K8VT/MOLTwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1376.namprd11.prod.outlook.com (2603:10b6:300:1d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Tue, 10 Aug
 2021 08:32:00 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Tue, 10 Aug 2021
 08:32:00 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] dbus: add PACKAGECONFIG for audit and selinux
Date: Tue, 10 Aug 2021 16:31:46 +0800
Message-Id: <20210810083147.23455-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR03CA0054.apcprd03.prod.outlook.com (2603:1096:202:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend Transport; Tue, 10 Aug 2021 08:31:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73359000-8520-4936-711a-08d95bd9522c
X-MS-TrafficTypeDiagnostic: MWHPR11MB1376:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1376D66A945871A32FF1E3E8F9F79@MWHPR11MB1376.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3HWm7FuXiw38SXZijFp88sRSkc85pc2/HKldH4GPOGkxm8BYqhvKhvl81/o6k45Tuvous0eH+Xz7cK1WXnbYNYLlKUhA0ZPEDVd3ZZjL4iUUy1gLyWcHtG6O2n6tpwQoHyFPBy0szROXT8zHGpR94YrPevo4cQqcGNbbKH11r6zr80V4KTBHdqSUGWnU6HtLitl3ZvqcioBjgrv8H5cBVc7VkfLm5ipsSRMfdQorRQ7JmLMXFbV0DB3hqLAf9JS7Wx/Cfh0gbTvVd1ikOrVJN6dn+07p4I9LEA3sE9+hzYrzatq9ZuPVrZ9Ur/9o7QWLEfvkyDHFJSqqRURWID+rWkGRZubh09xbniQORIClxRJ/uu1al9RcU1O96OjT2cGlNQEAme5SI+A/mIRWloBmI+7V3siNjWOMado5WtlBN+/7w2wHXZ9cnUF/KHOzCs1T+LgGyIXskntYR88jjFhDUTdSwx9J4WNSZ1O+9AiU5Z2fJ265qimHRnaBdQ2gjSPYdTrRAmcIqfr/AtEwdlwtyP2W/oad4ltHHtndGHYCPmyVZ2+LcjKYwCcpb0x+cRn2CChvMG76m/aOhqlVSsdFO5YxT5oBTGEGd/BwMmxU9jfwC2fTJC7X4KM5LiV6Q7937UzLu2HC7hIDe4vcb3mhOdNu4ZKh+GBnGT1rHS8yKRrOmW+8/T3Y2SvwAoUMJYl0tuQeur0MadYAFYvZTArxwQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(66476007)(2906002)(26005)(66946007)(8936002)(66556008)(478600001)(186003)(6916009)(52116002)(44832011)(6506007)(5660300002)(38100700002)(2616005)(956004)(38350700002)(6486002)(6512007)(86362001)(36756003)(6666004)(316002)(83380400001)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ly6gEoxVPns182acqiVHv7k9L39Kt8nO257dFC7ypbFRWf45Li2Kqvo/X9b?=
 =?us-ascii?Q?jQoKbYNHkWsAYW6kLmm/lLtQ0v6XhAVt94L47CZxtl2MRPFVMN0hnF/+b3F0?=
 =?us-ascii?Q?Byu+nCfbleULCjOZJ0nAzqMOLH+LRHgOoyd5FWIMC/AGK/ICS6Y0ulkg0XG0?=
 =?us-ascii?Q?RX9aMe+ZyFAPr94aPB+8vpbphXN5y7o9S8Hzdf9luUhUP0jw3YrYysAq6jR8?=
 =?us-ascii?Q?0ThCp0eTGKV3u8vHoqtEef3XmO3M2JKq01xichR+yIEGBXyG2h7gLrTGvpJB?=
 =?us-ascii?Q?GWJbIxX0Z8Isx0xT0ezPoV0N6ogFtHWyjxYV4Dg++yy8O2CBF3urVOXExerB?=
 =?us-ascii?Q?Cg427EYsn7Uw0HcZ/qgfezC9+YO1IjFm0EZRj05az/eZjC1DkkLqZARJ9w8M?=
 =?us-ascii?Q?bvmUOnHKpDjNR/f3QSKBaTPHIp5LSxPBlQgnQtuLQ6weaUYy7IxCc5YESwJE?=
 =?us-ascii?Q?WtySK8xERFOjT+/gD9MXuPSv1w9NqHCdJEQRSiaMq9xuSU/WMzq7zplxFVZM?=
 =?us-ascii?Q?hBl7+Yqz4njS71BbU3mMfjayGRdO0BAVioj57d2VMlP7d1BV1IA02lx9/2lM?=
 =?us-ascii?Q?e9o3xNsJw9XmlRrtCYfjcJBy1AYEoYGOioV1umVW3CgsjOvqdO313CU+rbtO?=
 =?us-ascii?Q?01tg9TSbmFKtSmR4BsvaDEbR1IF94Hml7dgDRYh0p5uRH6ggqXvNqDfy+lY5?=
 =?us-ascii?Q?vuHysZU6V8FXgolaJPlE90L3Pyzv8URBfNhhFEWEMo799LxlVPNlaSbQO7R8?=
 =?us-ascii?Q?0nI/VRHpAIhwI0MSE7/6ufQ9jBBZYIQqRhR12YZXl/3LuUlrqFdmTxbIoj4S?=
 =?us-ascii?Q?L2SvT7g6a9w15LaFmZ5tm5cKO3TV+WbXeJgzOSJgeQQzUgP4paaRbei9a30f?=
 =?us-ascii?Q?ELnS00/JArtHhpxa8ex/ezEY/WxjpuWMrILZ/Ml9eov338svFX0vV79SJTbz?=
 =?us-ascii?Q?kPF0Ey+gh54mFbdChGCxv9zMfEGDrYu1+BAAYVLZ+/E4r3isRPdrjhfHI5Zm?=
 =?us-ascii?Q?wZTXO+ps75zwE3BJ5DDrZUt6Dmhoch95/3Cvd4FJLGxIXMD9qTCiPZ6y8w6P?=
 =?us-ascii?Q?mYDDsu8P3T6wZ+oA4SFPZhqYAU56lIF66ElcATTlpdWmYMEVrjwb+7iUuDTQ?=
 =?us-ascii?Q?TK8iGBVV+pwpHMrwhI1YQ0arDLsQlaPcDm4jEV8MPO3YFryTT30gEinSnB64?=
 =?us-ascii?Q?SP762c0840gTqPwBfN8v/UVkXzk05HvepWvZy/yTVX3UJ7UDXJwHidLhoE1x?=
 =?us-ascii?Q?hj5mAli3QNiesehKZeI3+eVpuxveV8GMYKHXb0GW0TnQAhQj+Gqf4a1086PT?=
 =?us-ascii?Q?Ze+XeSd+YlIEry+mAMNHdF91?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73359000-8520-4936-711a-08d95bd9522c
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 08:32:00.1130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7eFi62VRoM+UB+AOqL7vpfP408LqqowaJVi4tNLvBcH5mXR33rKCvVgkgZsMMMUerQuJciWweH/To4NRBQS9zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
X-Proofpoint-GUID: po9qhlLbQUpES1HfgVtazWltiB7NGWS8
X-Proofpoint-ORIG-GUID: po9qhlLbQUpES1HfgVtazWltiB7NGWS8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-10_03,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=894 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100052
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for audit and selinux rather than disable them
directly. This is useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-core/dbus/dbus.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index b237476493..f0eeffacc8 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -15,12 +15,10 @@ SRC_URI[sha256sum] = "f77620140ecb4cdc67f37fb444f8a6bea70b5b6461f12f1cbe2cec60fa
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-                --disable-libaudit \
                 --enable-largefile \
                 --with-system-socket=/run/dbus/system_bus_socket \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
-EXTRA_OECONF:append:class-native = " --disable-selinux"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
                    user-session \
@@ -32,3 +30,5 @@ PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd
 PACKAGECONFIG[x11] = "--with-x --enable-x11-autolaunch,--without-x --disable-x11-autolaunch, virtual/libx11 libsm"
 PACKAGECONFIG[user-session] = "--enable-user-session --with-systemduserunitdir=${systemd_user_unitdir},--disable-user-session"
 PACKAGECONFIG[verbose-mode] = "--enable-verbose-mode,,,"
+PACKAGECONFIG[audit] = "--enable-libaudit,--disable-libaudit,audit"
+PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
-- 
2.25.1

