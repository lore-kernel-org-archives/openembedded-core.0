Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5324.1628584323619246768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:32:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MZzjF7gm;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=38560e51b3=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17A7dac9018444
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 01:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=5ufPKiXtPE5uvLJ0jOBK77MX6SO9boub7r/b49nTZQg=;
 b=MZzjF7gmWVZDLixb9ALX6eXHs1GeSqHYERJczfmGQjr6v1VSKrpusPeXfsYpV4S+sLZ3
 2vLz61ygzy2B5RbkubtzcwQ8bxemOjQWquu+MwOnPPdIISduYr2X0DLBGOuf6T4u9Ms2
 Xk6e8R9P/XKMPJdLlbyondmn3DHrtEdVMi10YYm/k0lI6n2dneCXaaZcDW6TLRiBzuks
 YdxJByJjkj1l8TVAYVu/7XhXMn+w0Iuxa1+5d9dgPVI3yY0riuNX1AG0eVbN8wXJrPcP
 KAlvCqb5qDvt02oAKO94I3HNjq6tT5Zlfsh+P3jkCeWKKFQJqlmSdoRIVWtu4pT8Iswe EA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3abjr3g3hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 01:32:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuNTXpNrZCAyZbuLuH5wIk1UohbHpVthcj68UoKlHyNCrxSZnUjkLfxmkkaM4Pv1F3pbiRVWBWPJPfIAE74mkdFeh+QI2fMnfGeBlH/qpxlU7ggoQ0FrR43eVXz4iCIZJmjXSrD1zKMezpBRoBhCuVXrVcb60qLm1pjTnN4RqPQhsJhTkUOhtQVALdFbHg3y2E7d2keFJivmOS3JR+Lpj5QUHzzX+IiQh0wZsJKLXJMDlRci+ZeD+APnh2oxN4on1CYjtB47/tT2qauf42tJL9RVJ2nZH6Un2bE04f8ZYKDWFhEn9Asv45nabFTflTOegWZY/q7QIRB2ArtRNNgEoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ufPKiXtPE5uvLJ0jOBK77MX6SO9boub7r/b49nTZQg=;
 b=dSDpT4IUvm5C7XKf+O0iYojQ35bXwfspKQiEVgS6LzmV/riYWzVUtncUb1YB53+wFjLvxN+pm1P8/5on5iUo7No5wDkjzmDA2ClshH3BLKe5roL3GG0Q56dbLA/tmTn4qy4MwsHBLm+tj7aA5hg9MChg5xFLZyBSzNezDa9V2PaJ1/wZ4IYNiJlGcgH37b5kJgU+QoiWLX4tWll3JkUVFcendXDO1zCrXs0QdAqBf9Gljed8qm+VD0T1FqwL83QDbOsvOpVuQXsQEbPg/MUrdkV+OxmylV+LRXg3bVdp3MqQRTCXE8cqpzBGQ7xaYwhAEr9o3LszrWLrcZJfS3cDSw==
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
 2021 08:32:01 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::fdca:2b03:6e20:2d99%2]) with mapi id 15.20.4394.021; Tue, 10 Aug 2021
 08:32:01 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] shadow: add PACKAGECONFIG for selinux
Date: Tue, 10 Aug 2021 16:31:47 +0800
Message-Id: <20210810083147.23455-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810083147.23455-1-yi.zhao@windriver.com>
References: <20210810083147.23455-1-yi.zhao@windriver.com>
X-ClientProxiedBy: HK2PR03CA0054.apcprd03.prod.outlook.com
 (2603:1096:202:17::24) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR03CA0054.apcprd03.prod.outlook.com (2603:1096:202:17::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.5 via Frontend Transport; Tue, 10 Aug 2021 08:32:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1993a9cb-9c03-4f3f-b4dc-08d95bd9533a
X-MS-TrafficTypeDiagnostic: MWHPR11MB1376:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB137638A95B9DBD46B70F1FBBF9F79@MWHPR11MB1376.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BV+0DSchS2OHyv/7dCHe3Fv2lGW5FbwobGGpRLwoaggrE96bfc+WcgpH+Xz9Yua2K3KAGYbpcM67UwuBpp/pVJCDhHUZ4nV9xvN3pcV3iUCt6DMyCeSqUZ/bZDavJer0zRTAL67nuRDB5DJGNAJT0Oks3YcmTBfpY8AzPeA7XDYCH0VJdw1ZQMsUip0eSPnv1twRO+Zl/hnkWT2Pq77I2Py3wUCeY0ndzFMpSntsg2NkGxsbjXm8IDiariNuArKHQCfwbQ/l8ATA/qFS+uJggmDl46Z8mq8OPPPNbngfzTcNMVBBeljrgYQKCx748PkbHfSO7qvHh56j9YGywB8+6zmDKeQ3B85KN8z9dmREC+15PRJz8O9xrV4eMEalGS0vs8Wkodtl49GN1wzQFSTHcZKidjKGJx6YnTSjyGUfutfS5wq+XjLz6bUbFohm3xBa3FuCSBZzVvqtDXHtOVsla9t9LowUA0dclzl8H5Qkz00kwBvzsd59Yx4DQDY5kVBaxbM9lBwHrYTAht2/0xkRwcGkWrz5kmW9M5yc7pufXWi1vyESctMN+bb64tnZJOwmubleZZzKZkz+/DctoUzQSZGRpl8JcGpx/EHUwgqsojcprjxUWpiGbCSwXc1TnIX6xAgUcjWrEn2CSFZEKLX7lej/sBLsEKhTwWt9V68Bg0HxzXpd81utE0mn1adhlozPNcdWnr84Nku/549ZHTaHAw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(66476007)(2906002)(26005)(66946007)(8936002)(66556008)(478600001)(186003)(6916009)(52116002)(44832011)(6506007)(5660300002)(38100700002)(2616005)(956004)(38350700002)(6486002)(6512007)(86362001)(36756003)(6666004)(316002)(83380400001)(8676002)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U8z1N4M/tlX4eEAMXBXwPnZc7/a0+i6DJWMgUFQ6WR05QwNELcaey9p6hZYX?=
 =?us-ascii?Q?NY8P35pzlYd4pqqweHD2I0LWtNukl1qwoIpB3J1NREzTBP7OUw+o98Zz+Ob9?=
 =?us-ascii?Q?4CWgQnn8/kyCS3HseZWtarJsw7x9XVGPyeZjbzPOe3HMiAQt0K8jsylIMMW4?=
 =?us-ascii?Q?0oLfLjIgaUubUK6NcyY6S06PblSYot+4RZBb7jTedeD+KOC4J5vZzPwWq2Pa?=
 =?us-ascii?Q?6DpwWzhqAEN+aOrfLwFKu9qq8DGw4EKednzR16aziUKTUajhO7SEt1WAvyS2?=
 =?us-ascii?Q?ZmYHf2O+OG6wGT97/j/Be4R8WAKy6EwaOcxB/Ru53+nRdR+tKcXLs+yrH6ya?=
 =?us-ascii?Q?zg+3RDjx5BL1gJBIZxHuApmmUSTBzRi9txcc9PtUqgXcJSlm9DQO9mV75dLC?=
 =?us-ascii?Q?Z8eoQs0H5Kna+P9Kx6DGgv2ZmqfkXdnqaBEe1HQD1rQmJ1nbVzwNcAPw3+Rk?=
 =?us-ascii?Q?xOtvcoMiAQa16xOr6y6/PBtAXtCoFrSrytpnT5iC/oB3x0t+g1Tr43jKM9q8?=
 =?us-ascii?Q?ypHMFwaT/XmCP6rA4v8y78Jj0TCfV0KhNDXYwTosNuqSrpgY7EmjY8YrFFjI?=
 =?us-ascii?Q?jF52N0XhpV8lVY9s293jv8OiB1NObszfB/UaiuNhRi4w8Hg2k20YbqWhZ8EE?=
 =?us-ascii?Q?gSNC5mNisXyLAtsJjPeWFmbxQcWilc1eR4KIy/1gzz2ja2bPFctb3dkta6KM?=
 =?us-ascii?Q?5zelc9J+nwznBaahoLAKcghjUjALgA6EJj8aCGfV3oEv+vMMD9krco4/oAbS?=
 =?us-ascii?Q?iJ+yBKUTHtBb4yz65fWYjH43cUDc8JSKz+hmAtYtbRkCxa4GIg4zPCjX0MGL?=
 =?us-ascii?Q?ETMD7yp8+l69gjHU078cAPUiqwubaZcTlBCiK6IWyZianjmxJS9KDFQUOgdP?=
 =?us-ascii?Q?lfUln8ysLxym2z9aWOShJjVTag5Ao7M4djpDdUDW3QdB91XmQujIrpvAxzuL?=
 =?us-ascii?Q?2EzPC35htD03HSImuEMM25v7murSn+/WVMfbZRirJbPfbohcYeO9GbMeW4Dn?=
 =?us-ascii?Q?OqTv0cNM0S+KMokCc+3l41vVk3hoZ2knQOvl5c3I2oLXSOFfjME1v7itkPmV?=
 =?us-ascii?Q?506s59EC+kfLuN3pmRtKAEQ1Cevvs9o6MmIOCivCRa1XYqzKt07grOqNpibP?=
 =?us-ascii?Q?yX1ixCaltmDPuf/7M5irLDVib2aBCCzxTwRDY7tLigC5lNvIbZIIc5hrLEhD?=
 =?us-ascii?Q?qL9uyVJ5H3Ar4vPkO1mtJa2tLE/Roz+jZG0R++bpyeAPZmtMtQPckTkem3du?=
 =?us-ascii?Q?HKCdNZ6GIOLsboBGogev+cS5FdyzaguUtnjOQZy1VX/kS+2JFIE0Zxd5f2Zc?=
 =?us-ascii?Q?5HDaM/PovknNN8y8pufV2Txa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1993a9cb-9c03-4f3f-b4dc-08d95bd9533a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 08:32:01.5049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5m2K55tBIUtUs3i/ca8EybshFDV8QNGeq/GXqFhc29POP3K5Op7CU/SugIGD8sW4ruJQWO2S7R7PpcBxZSq3iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
X-Proofpoint-GUID: lnYxCv4s5SbbGq7Kk9MfHulCMHquzc7o
X-Proofpoint-ORIG-GUID: lnYxCv4s5SbbGq7Kk9MfHulCMHquzc7o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-10_03,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=889 bulkscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108100052
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add PACKAGECONFIG for selinux rather than disable it directly. This is
useful for selinux distro feature.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/shadow/shadow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 2834509649..6968a06ea6 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -48,7 +48,6 @@ export CONFIG_SHELL="/bin/sh"
 
 EXTRA_OECONF += "--without-audit \
                  --without-libcrack \
-                 --without-selinux \
                  --with-group-name-max-length=24 \
                  --enable-subordinate-ids=yes \
                  --without-sssd \
@@ -81,6 +80,7 @@ PACKAGECONFIG:class-nativesdk = ""
 PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam,${PAM_PLUGINS}"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
+PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
 RDEPENDS:${PN} = "shadow-securetty \
                   base-passwd \
-- 
2.25.1

