Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4952.1628670168349417847
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 01:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=WIwhCeG/;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3857d9322a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B8IBST015651
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 01:22:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=Lnjsl3aDvbH4iEfYLLXQpf0JCIxFwuZyrVcGsHWiWLE=;
 b=WIwhCeG/ACD4j0K8jDuqqNJvzBvil+xpvOoVihT+Goltlr7Hq/Z5k+RpLCFd48XHMy2u
 ms7eWtVdJTOcNh/yvFZ0Wx4Ghiby0Z/kcmjPFjuUsgO5eR4Z0xFnKnnycJ7eTVHGzOOM
 xqfaBoIdOA2GZy9FoAmDY40/4h3H/sSK6U5nL621GUeUrKkw1X0/4CP3jgDHAPQr6gTk
 6haFYBGrgdNKLAZ4EIROeo3i2lK4OqFpA8/F1S9CdtdtSEPTKH15AVS5wrBrLqqaLXgd
 RYY8L+KDUGKxiNMoowELlhmj8YcGEtYsmiNpFeoAgGOK+quiG09okQjY5acKaaEaroMt uA== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ac2xf87y6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 01:22:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpl4fDMUoNdYTn+l1PanXrqqB94X2/KM/eHoftK4ioT9sHMjm7OHGfS+W8ZROLCHJnHU6KMtun2Qhpk4eK+vro5KPoaM44GQOlrRca2Wc1d1gCVBvwC1+Tp4ZvSCgt79j0IiEvuKjAnb2ocf2m02pPjnGGuMXGj9o6N4cocgEMox+Pnpb+pVG9EOXwArKbnXuBktJClvvQRHNhpqrTE/ptE449vYo3hw6Xfl6gh755DFYZj7VTVcNe3iMWsofzYRyoO2w/5krQEI/7Of8ZEKcPmFZez7AuYWiuQ/c1USsUv39DVkyxCekuoXbfFZ4u7L5WQXMLV/PuP5ATrK+hmdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lnjsl3aDvbH4iEfYLLXQpf0JCIxFwuZyrVcGsHWiWLE=;
 b=B2LORpvzbegvH52xR5D9oVq4qVX7O6O2Zs1a7NTTKrMLGqqodeeETW6MOMiyUyHnVkK6U6HNKuMxAjmTOa/9vnBnyqYA9p2Dp2CcLcZ6pKZaRQnccTAXAJfVsAKQCd811lVLl4zRkhDz63gOrr2Wu/y1n8EgpvCwXtkkZdM7zXq+bWo4dPeXZWQ3aONCGq27A90yCO3d7zX4SYWFKi3HrwJLX4+xld/yn5GgJQ4HdBSAAlzgKn5qi596n1fls8MGqaumU45yshZxwaH4VY3ylUmacmpDqKBX09jd1nJV0nbgkM8sil2VrS57Ux+BgNnLvS+KJZNcMW02FzxDuQM1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB5058.namprd11.prod.outlook.com (2603:10b6:303:99::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Wed, 11 Aug
 2021 08:22:46 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Wed, 11 Aug 2021
 08:22:46 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2 V3] shadow: add PACKAGECONFIG for audit and selinux
Date: Wed, 11 Aug 2021 16:22:34 +0800
Message-Id: <20210811082234.82954-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <169A3243517C54E7.29477@lists.openembedded.org>
References: <169A3243517C54E7.29477@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR02CA0166.apcprd02.prod.outlook.com (2603:1096:201:1f::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 08:22:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d4afa37-de31-4844-d58d-08d95ca132be
X-MS-TrafficTypeDiagnostic: CO1PR11MB5058:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB505887F3E285A40B45125D11F9F89@CO1PR11MB5058.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5UH+4n7rT0r0HXIhycwlqqv1v2EXgFQXj951TFdllAOPavVgGrhYBlzk6hvw6Kf3p9gkncTujyt0qpI2IcFfU+5ZljMPpIVnCqY+zmJU0qz0K2ZXWy2cctWAbQq2NPWcabtHoWwOreRVJY5LE5nS/Q9/+W4P8F6mqtLhSaNzeEHnrRZ0UUDAW+8tMcKVTqtooOT65gGI0lBT2uk6Ziyt6OzktdVIQrICvdnPzGPzAfaW3fglLb7QiWb9IZyX8Ecf0Pvo0CX2cKV9tp/ZjEwxKqa88Ymh7hZ2y5yUnEEqib2bXcxlJpOI+zaa/yzjB+BjWfsjX1Qp5AQ5yzJn06nbM/hDEune+5hjeANmcyMZ/Pu57ZF+sJsXFAiQ8aLvkDc1hvk8yvNJt0xLmfwQel+Drnx1HsUV2xHsO1Cct2C+SdpVzVMVebREhW+vdZZFV8cVxDp8GiGEzH2ZEv69cPRwI3lJntep/J4RpfnEQdVQyjrMiXrcTiPefa7VAlrkuzBy9Uaf7/D4L8tfSh+E+A6UWShSfK3ygp3Aod/vI2/DXKs7YDon2NwHSn7hwk8UUu/vjTSonJPORlXTLHNVTdYp3Md0eaFf0gaFp2MvjU1lyhLCDLZmzZZEmCsVEB4EprR6N+N+5fOpA13dZx7bdH+qFbMZXiY4dVg+9fZaxilvYRgPi5x5stKYdC+pATOGFcMM/yHCWnzYAx+TPSmbQGi4uw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(346002)(376002)(5660300002)(36756003)(8936002)(316002)(6666004)(66556008)(38100700002)(478600001)(86362001)(8676002)(186003)(66946007)(66476007)(38350700002)(83380400001)(6916009)(1076003)(44832011)(6486002)(26005)(2616005)(6512007)(52116002)(6506007)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cpirashHJIAEFUr3nsf80bMNii2AHR+EfT/JHuyps0JRV8YEVwJ4y3YQiVcz?=
 =?us-ascii?Q?FwRU7oncOfReJENLnfgGVrTTo0XKk7ikXRVfz20Cxco/l8iZljQtZWlgGyh0?=
 =?us-ascii?Q?5SnpJ+QjYIAQYYgGvSjXOJVT7JiuIVqIgIZZ1UVTYPfb88lb/fOJWYVMzsZL?=
 =?us-ascii?Q?Xi16AnxzJk6wPnLGwEcm1sEEO1kqZt7H5qAHVZFMxEg83YrtzLg33ZAR7MBQ?=
 =?us-ascii?Q?HNpTGv6Ufprzd1id6AMrlMd6+Znca6bBRXMnNX3Ad5MlmsoCj6bsqlvkg2q5?=
 =?us-ascii?Q?jOaWLnEbOrSLUpkk9FFyl1EHE4Gl3P13LOABvndAmlECjyIQHBJbvCNqFmAw?=
 =?us-ascii?Q?0wSIR+NwI8jBnBExxNJCV3I5J/l6IroM+2IzfN1kzBCF6bANMkVm+u6smgw0?=
 =?us-ascii?Q?fKcTwUcLV0/8842kvb6ho++lL/CXDkYOAmUoXIHldS9N/HiBPl4FoQu3SGAG?=
 =?us-ascii?Q?wx5UWTP3lt4eNZgRJztGqhz9How/WV9XPJdmVLhmAiIsBes8PZjiQSeX6/wM?=
 =?us-ascii?Q?Yy507uQFnWph42gXrhR4oy9qsC7+UrZoKPdeaVX+Ooo/kFGXNGNQvtEoBvZQ?=
 =?us-ascii?Q?k16nzK/D5CsV6A7c9RRSqM4ijAE7bEU4oJkmQ6IBuoD8gU/MBunEII+Ry1Yt?=
 =?us-ascii?Q?+f6VP0wK8jsA3NNS3DBVg2Bv4ovDAOVVZN2Af5FiEzU1smsMmKt5xpMCc9gy?=
 =?us-ascii?Q?4a2SrDgNUblX4uNhTItsjnP5G381y8sXVLtgY5IgQa36O6IfnNv+WofwtXNE?=
 =?us-ascii?Q?VMt0Xcs9hlksdNJEp12PVrexbVpl/F7Ws4GN2oOh214O21HyjHN2R2wE3OyK?=
 =?us-ascii?Q?DazkyVzDGDzJllZN2MpX7EBuv66gB6CTuZKE+tgcKL6C+bAINFBm+A9qvwCV?=
 =?us-ascii?Q?B2cSYnYjMvTdTo7SDil/Gd7EwP9PAcPT+NH7IbMGwtawPRS9QXMoUzdiXbif?=
 =?us-ascii?Q?r7ypldNDVPdprUve8dIMNJxcdGMENlgYnGkqL3GnPvWd1o8DvFuKPv9P5l/u?=
 =?us-ascii?Q?ELhyAlRHeY7ugmx+UnZKbXEchGAJdiOyzigzbU1c6koj/IjAKrAWE50f/Kte?=
 =?us-ascii?Q?ImNLbMKtuAmnZ0GM+TvV5aNhowZONYwCNpgLQ8u5l0srdodjaqH19BFrGcet?=
 =?us-ascii?Q?qGNhI97A63JkSoseTcomJAI582YWgZj2A71ze3j6PsmhSs/p3TnsQmWdBRpI?=
 =?us-ascii?Q?gnPNoy3bj/2jtCWRBLb5/P6KyNzcgSuspoji7zszPXqAPWTUxLnFZz2Boa6k?=
 =?us-ascii?Q?wreq0cIZ/gzMg0c/PNtIve8+6ZcPDF0OexGCodwL5kDT5cYYT9S4EJZQkFI0?=
 =?us-ascii?Q?GLv8yQGeK7sIyeaY8kqyLk2d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d4afa37-de31-4844-d58d-08d95ca132be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 08:22:46.3022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARxUIfb0hej34a4JIiRyevVmEg/GTmMYxW1ZdFfD30gbJauc6Dby4SvAP++3NiW4DS1jeW7mJEslNDGp4ITnYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5058
X-Proofpoint-ORIG-GUID: jgCjUvxvsVJZl0wIaJ7ZW_xHhX_8z6eA
X-Proofpoint-GUID: jgCjUvxvsVJZl0wIaJ7ZW_xHhX_8z6eA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-11_02,2021-08-10_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 mlxlogscore=960 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108110054
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for audit and selinux rather than disable them
directly. This is useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2834509649..97ffae978a 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -46,9 +46,7 @@ inherit autotools gettext
 
 export CONFIG_SHELL="/bin/sh"
 
-EXTRA_OECONF += "--without-audit \
-                 --without-libcrack \
-                 --without-selinux \
+EXTRA_OECONF += "--without-libcrack \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
                  --without-sssd \
@@ -81,6 +79,8 @@ PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
+PACKAGECONFIG[audit] = "--with-audit,--without-audit,audit"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux libsemanage"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
-- 
2.25.1

