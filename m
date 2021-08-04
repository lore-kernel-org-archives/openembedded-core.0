Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5321.1628056484652955511
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 22:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aWCyC6Wv;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38508acf91=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1745siB8019544
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 05:54:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=sBYuNCz1QlaXuICJf7qdrR27+dmrMbpS7TOQwOv+mVs=;
 b=aWCyC6Wv37M8mCkes/9nAx4YphYMGa44BZ0fwVOnKqGOY7xuvHFLys5SpCHCMzZaYe7S
 zZ1ZgL6ZGAjiuxGBItdI3pxeJ0EclZ+/A4Ej/2/8rN974RgWTRaSkQe0aiGwfa2M03QN
 Kls/XPBmO1ltAVPzr3HxFHig1YX/eY06+0u7BzDM8Tz/ulv/gBGEQt5lFVRQBF4v9hQu
 HFgugZDvtgIS8yIpyS6yshoPeL/3Q6csphhgX59ojrSFb+T+eUGRq4rPHy+0iZbwcOsj
 5eptld7rwVUW5j49extZvUfunqBLT1WZVvHGYB4hyljuunuEwSLvqJSpwvjUbriKnleu pw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a6x478vdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Aug 2021 05:54:43 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1745shD2019395
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Aug 2021 05:54:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com with ESMTP id 3a6x478vdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Aug 2021 05:54:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fb+PAh0yBD2T/SSqOuMUWwu4LaawX8Sb/7uNhq1P/xLKPMuahgh0vPRfXX8PnTAPdedzkePQP2WGeq5ywll1YP8LiKJVkViEmYFselLVfonVJVhTZW8RqbDba5E8GbXuUdA4rrqaM6Jw4EYEPFfcgwbZgKfs9t9/6ZMMKLPscPFK35/MS81iEAjyymTo7L55ugAlfhouJgX5FLFX5IwnyWc1+B4WNOZJrpkV/kKJHgQbdfym2PX45jqVsYERNiSRhBCyvFYeduGPQ7CoBfnnsPW90vK9GHAKGM/YhWPS0AID+VyrjCIk8Bjw4NU2vWv/amybGA8ikTFqvmRFc3Vbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBYuNCz1QlaXuICJf7qdrR27+dmrMbpS7TOQwOv+mVs=;
 b=OLQSouJEbo33PQb5xLOEBVc/cDqRPSPuGb0NuYqe1SVQ5fpdwcXSb1h+fUrnGfGxwbiSvohS/x5NCMPXth1VZK2/PoJ4ohWH3RpPUoLL4bT814VeEeGZ6CTx4kVTYYkkgz08ca5dqxfJ8nfyJT/EDs+lEVuE/x+m8H1it8Q+gJwsN48yvfJF2CQO3Xlq5E/ubYYdVp4u35xtyPnggFHGqPYLZeTn7pkXpSOqesRQo+aZl4ZwF8tmRE1mT5zVkKjgWuUgGrQRyqPaumrzkOmSjr8ZoIIJ72cIQShC8n9c7xuywNXI5vzRXLxFshc0EAQZiS8GL1l0MpvvEsOMFNFcuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL0PR11MB3378.namprd11.prod.outlook.com (2603:10b6:208:68::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.26; Wed, 4 Aug
 2021 05:54:40 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%9]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 05:54:40 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] qemu: Fix DHCP broken in libslirp
Date: Wed,  4 Aug 2021 14:24:36 +0800
Message-Id: <20210804062436.9313-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HKAPR03CA0031.apcprd03.prod.outlook.com
 (2603:1096:203:c9::18) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HKAPR03CA0031.apcprd03.prod.outlook.com (2603:1096:203:c9::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.8 via Frontend Transport; Wed, 4 Aug 2021 05:54:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a86699f-d799-46b4-9c61-08d9570c5952
X-MS-TrafficTypeDiagnostic: BL0PR11MB3378:
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB33785972AEB62F64650579E9FFF19@BL0PR11MB3378.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:183;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QEncUqO+VO31EvJkcPbWuBWO5Uh+9CVpyVarRvQlbXOsVXd1E8b3NW//+OAzdqHPK7yeVGTLNdMHdEKytZLkyOpG1f5ib8458LdkD0IazAnXYTfBUef8rVbsdAq/K7Qu2JQpFOnoTYDtWejovFGBJjdu7ar4yzd+uFOcvhpjcXROltlnOtYx2w/zawm9H+HKnzxdQcmtlKwLfouNcblk4+ATZ/LE78GeR00MBBZ/3sjWYz1NkvWmropBMIdA5O3EkXDMjxGnmRsNYPxmuTeFeL+rLTC5Ik75isuX8JfxDHOA5SS4shugzD2ucxi+aq7R5L2hxJwnx0TRDGr7XnC/Y9eNm47TmUeHtOWE9eWUXMU+3CwZqRVGbIuoRDZxmiiBxSzKNObw7KcH7qYAYMqEIESmkpXMuGtPH+Nf3aQIWQQ8bDcSgxlui7BEoDcpBrIsOKfoBELKeJnLaOEhVQwRqUO9k9kEvjpnaU+SPUZKXwK2XxXZgS4/JJX3hMbAR7lkD33MgLGOIhYJ+9IPNnIAOC1PSV35SfI/3mLKOPLxqSg8MnJf7uPTtWuO0hxf8aY6zDwzQryYeVtREelRmSTfO4nvabH8aTHhT87jgY37eQ/X1YpdjY3k2N+NymrGt9atnkIN1xP0kVmQhslum6sl8ujQqu495k58trrhffbv7L1j4a6QgDjX7S9eprORr2bz0mtCn5IZEBVdzBMHe51+fbw+e4kLUQjYvlit0x0DheKt/zx56KReEwIf1R9eF2+oc1o9dwF9sXcQf+L8NF0hLu76KnHGdYsEKw4HYs5gNaQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(376002)(136003)(39850400004)(366004)(478600001)(66476007)(66556008)(956004)(66946007)(186003)(9686003)(6512007)(2906002)(316002)(1076003)(6916009)(36756003)(2616005)(38100700002)(38350700002)(6506007)(52116002)(5660300002)(4326008)(6486002)(8676002)(86362001)(8936002)(83380400001)(26005)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tXtoAv4xgPRX0tm/KQAGgedKocPkelH2IL7yy7QiZCszQwEOpzthFo28ntVd?=
 =?us-ascii?Q?eU0OAfCDZ3NulunR8XUAdV6xPZTqBdFpDK91ix0PXrl4n4phGNfe37fvseMo?=
 =?us-ascii?Q?hKCSzXmn3AfFvFBejjrQrDTHXVEfdHDZeKkpG4KB1eSsA+AOUzPLpA2ELLER?=
 =?us-ascii?Q?6TPFHq5jh/av9+Mi0zbaP2pBv+zO3JuaCZXPamU7gZ9h1A1EG1Ezrv+wBDNz?=
 =?us-ascii?Q?CHU2xuetpUhJXeLH3/fghspYKXWZ/ewn16n5xoTh2bxny0LDxEcCqFBgmXfz?=
 =?us-ascii?Q?Cq3oRep3VWiGYdEIIIb2GIT77/sUF/lYpXDD8BLl0mj3TdlGWSLKQRr5tR6g?=
 =?us-ascii?Q?oOMCX0ZKTBRUlMDUx9UDr5Vpy1glg6DHNB+gWxBEcQMDnRMHiQkJEuNswuI3?=
 =?us-ascii?Q?W0kSa0d8hUfLIoFntHhN6TqAvwsnHs1Kx3ftHE+e+tlLHrFOpJKI+g0Duj0H?=
 =?us-ascii?Q?3FBge2jFHJyw2cJremppix0wVVEKZI7vD8V3zYOxpa0X4Cj4Zk6PGWwbN0e5?=
 =?us-ascii?Q?41PQOmGfj/8el3V2wdq/3F0EFF6Pm83tHs3gCvw4JVc1Z5FsQBCZm5Z52vAw?=
 =?us-ascii?Q?OhkNwWiceVKYN//Frfl+2r0HYZ8tAfODMV5PqyQAwszhUFGaBxg2QnjGykW/?=
 =?us-ascii?Q?wsT59z0/a1FKTPAaElkr+zTk4UBOSqOlcQpLXaI09NONxLu92LQzr7ViD6tL?=
 =?us-ascii?Q?md4fc9b4n9gImlmjoqnaI5Ce1lnk6yAUnwwrLbsVoaOSldlDYOjH272DvRO9?=
 =?us-ascii?Q?zfQC/VTu/RwAUl0jAR9rxjm37U3MxBYg9K60TR3WZXyrI4jM1IWxSinTB1tw?=
 =?us-ascii?Q?VPMoYSgEHi6FPXWprwzKWhdvl88rNgfzPgkIhAzu1bS4+H1DPPoo7/mGKoVE?=
 =?us-ascii?Q?5XdE9kNL5U+OV1ogRs4Sf1mCHcFFdDlcKHVp95MnidEWBxCTJGhossTqQpnX?=
 =?us-ascii?Q?d64MfEFJzmDKk4T6uR7JKlpDa4dNcFoKebFviComam5eux9X+S31z2fCrH8b?=
 =?us-ascii?Q?OAWU+PabEg83JpHwfX7CgTQ/zcfEAuUayOnIOmt5rkZwT1ePOp73hk3Ze801?=
 =?us-ascii?Q?IY6bBfJKfCeD7I5P9F8ZhOzNPiToUNUGCjDfoeliawRE/8ErzXZK6EpWiBKf?=
 =?us-ascii?Q?yeBRcTwgkFlf4MAEQHEuWPuoSFhZOGexpFtxgvNm8e2Qn6eWd82yOZ3L4iTE?=
 =?us-ascii?Q?hTmlK6KjKmZMDnSvEMpnjtp04+mQ1RY64dQN1pBEv/sLo4dpagdBTgoGwU1L?=
 =?us-ascii?Q?fCTlNw36odhJYM+nuvJi2Tw5X3oPEJfCqifLIp9WyCm6cAzzMF8S2IghH6qM?=
 =?us-ascii?Q?QlsS7+GVLQ5+DHZnLmDknlLy?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a86699f-d799-46b4-9c61-08d9570c5952
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 05:54:40.1268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHw8vs14vEIIcZY/aJn5hjNhgeswQCX1i5VWdeOy6IB6Tx6YUy+KJIwPK5zKhhakwkkjfFscqgdzuhbOSj34ahyBGY1KOsiOStWDMgCAY5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3378
X-Proofpoint-GUID: th1dCZomErSECnsd5VCIn7YISjd9VcPA
X-Proofpoint-ORIG-GUID: hds6GIKSqF_I2XNHD-p67kxtQYQ91-4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-04_02,2021-08-03_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 bulkscore=0 mlxlogscore=862 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108040032
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

Fix issue 48
Reference to upstream patch:
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c9f314f6e315a5518432761fea864196a290f799

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...1-Fix-DHCP-broken-in-libslirp-v4.6.0.patch | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3921546df7..bed175e59d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -57,6 +57,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-27821.patch \
            file://CVE-2021-20263.patch \
            file://CVE-2021-3392.patch \
+           file://0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch b/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch
new file mode 100644
index 0000000000..480dcee05e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-Fix-DHCP-broken-in-libslirp-v4.6.0.patch
@@ -0,0 +1,32 @@
+From c9f314f6e315a5518432761fea864196a290f799 Mon Sep 17 00:00:00 2001
+From: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+Date: Thu, 17 Jun 2021 18:01:32 +0900
+Subject: [PATCH] Fix "DHCP broken in libslirp v4.6.0"
+
+Fix issue 48
+Reference to upstream patch:
+https://gitlab.freedesktop.org/slirp/libslirp/-/commit/c9f314f6e315a5518432761fea864196a290f799
+
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+---
+ src/bootp.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootp.c b/src/bootp.c
+index cafa1eb..0a35873 100644
+--- a/slirp/src/bootp.c
++++ b/slirp/src/bootp.c
+@@ -359,7 +359,9 @@ static void bootp_reply(Slirp *slirp,
+ 
+     daddr.sin_addr.s_addr = 0xffffffffu;
+ 
+-    m->m_len = sizeof(struct bootp_t) - sizeof(struct ip) - sizeof(struct udphdr);
++    assert ((q - rbp->bp_vend + 1) <= DHCP_OPT_LEN);
++
++    m->m_len = sizeof(struct bootp_t) + (q - rbp->bp_vend + 1) - sizeof(struct ip) - sizeof(struct udphdr);
+     udp_output(NULL, m, &saddr, &daddr, IPTOS_LOWDELAY);
+ }
+ 
+-- 
+2.17.1
+
-- 
2.17.1

