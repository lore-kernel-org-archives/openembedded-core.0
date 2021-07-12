Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.7677.1626073365068750114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 00:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WSDDSs53;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2827f332c0=qiang.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16C6xHxk003782
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 07:02:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39r4xe8ar3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 07:02:44 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16C72hb2011856
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 07:02:43 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com with ESMTP id 39r4xe8ar2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jul 2021 07:02:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSA7dA0nO1ejxix23cLBtbbchULeU7E/W+eGHIF4Tp2JqZsEpOXcnHQCnKngHFMBogkNq8a8PYlnJdA2s3lyFjunykqDQ2ZQ1GXDxi+0k6x45R8YSKb9a0sIcb3wCqfdqzrkDvy/riRwW3NVnD3c7DsP0rQB2gGOdHQb3+28YnskGQdUNYQCLzytPgSUcY7Rg2ELsoUWQlSQ/HKHdFl8+NWcUuAvhWEd07mq5r7vkOKM93y00BubNecZCTJpt/j8QCiUHsqX3CuL4d4jkNRyLmeSYh11cDRYCycg3MgidkJzbdtIz3tbuDCc5Ri0IgimaZj70g/IcgMQizqwi310IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJe4vuF/sCpk0H9CedsQUcjyxq0mRMynHCRP59OpfsI=;
 b=GVrVvIVFr8XpHz+1OVg8rkltYS8k6tOn67KDkWsqC6YpG9Rg/b0CPIGKLwFtUznSX3xAWU/dkvzW7u4xpHmgE2GdZYTXHOdkAgUaLJUwNLbAjPDEeV3rhUovrl9hfBK5TYhjVfVv91Yi44E41/ZU2XB90NZrUCCs4DG+0B/00eykV3Nyb32nMhLH+GIhCAJWSbLeCnCd9M1U/4Ao4OJkn9+erEeFJkRO9lAMfJTUvOqsv+neYJTvSLQ7ONo2/BdCO7O0KYP3/29038+uzC5cInjeron39+pMYSO9jWOuFz+qvaolZvo5A0ApKigCW1txrI7OF/djCNI5D77Xi1yynQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJe4vuF/sCpk0H9CedsQUcjyxq0mRMynHCRP59OpfsI=;
 b=WSDDSs539YNZOYEx1U7LSWwu/MDCPlEJegSm4peW3IFf1/DnYnyUJiQBZsgApMDfcWdv+/3wr3OONk9LxFQiK0klzylUwkI4EdM6f9IghIoJA/JF7WwB50NmyqXJ45sUBNTuBS3EWyi730lOysS4nC5C41ojrNmYNeuHa/G7Nq4=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12)
 by BL3PR11MB5714.namprd11.prod.outlook.com (2603:10b6:208:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 07:02:41 +0000
Received: from BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b]) by BL1PR11MB5478.namprd11.prod.outlook.com
 ([fe80::a140:b563:8725:5c2b%8]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 07:02:41 +0000
From: "Zhang, Qiang" <qiang.zhang@windriver.com>
To: richard.purdie@linuxfoundation.org
Cc: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] kernel-devsrc: provide gen-cpucaps.awk and cpucaps for arm64
Date: Mon, 12 Jul 2021 15:32:25 +0800
Message-Id: <20210712073225.39726-1-qiang.zhang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: HK2PR02CA0163.apcprd02.prod.outlook.com
 (2603:1096:201:1f::23) To BL1PR11MB5478.namprd11.prod.outlook.com
 (2603:10b6:208:31d::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1-vm1.wrs.com (60.247.85.82) by HK2PR02CA0163.apcprd02.prod.outlook.com (2603:1096:201:1f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 07:02:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69c9c5ef-c864-411b-ed7b-08d945030a84
X-MS-TrafficTypeDiagnostic: BL3PR11MB5714:
X-Microsoft-Antispam-PRVS: 
	<BL3PR11MB5714416B61B8AF99F1D7F08DFF159@BL3PR11MB5714.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zficAsozvTcs4MSZtrgnAmy7Kyv8cJ13XZXKBc2yB+9NUMaGZyKFbWbmiMN6/JR5yrbWxZyb/zxGoXbp3ei7ca6mVtMbRxMue/P3a9CEpjFsnFk38fSyxv+ynGY1JtvU4/XdTnnMSu53oAMX4MqanKBPgmTSi43EhkQoBrEa+etPYc7q8JPBYSNylkVhQrOxIkBzK/Qu5rFYAQCycHX/LfEUu6DTOV3g+QYQCXdMocv8BOWSF6m+O7MN/dWYrQIj06uYvAu8B9GCviKUAFt7RV9VGs32YkqrIINQvcGP5v2gZX5V3p9AkrP/KI0twBfwGTqHqSNzTxedZMo7l4m1zJrS55b+RXVr7oVuMV//7q5aQ1bpSMg1TWol6csSg5LOQ2OObDpEGpzjx4G9pwQk/5MVqbvkaEeDA31Bh4uO1jARSVwaIr625N+mOF3reFJ8m3fQvDvwEgnsVgi0hrbVyTsyKqWPMzHVGGUyEfMX326+b0/zTI4N8tlMRHbnlLhGQvOCpybLuDDmhRlYTMLpBAwVIf9L4pcsMMZxZj3kY9tz8mWRzOGHueZU5u0ze/0kE/+D1FhBFB3BFxLXo9+go4kJpeMu7BF9nAZsUyEHFt28lTdBG16yeRekyrIaQw/GPakDEnQXsd5Tkb+EmqEHZRIzkM0SwFeFK1m299wcxAs9DlBF6nJIGLp7G5gYXV/ibrHoBJ1omHT+5apsjzAncA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB5478.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39840400004)(346002)(366004)(38100700002)(38350700002)(4326008)(9686003)(316002)(6512007)(66476007)(26005)(36756003)(4744005)(66556008)(186003)(2906002)(478600001)(66946007)(5660300002)(956004)(2616005)(86362001)(6486002)(6506007)(6916009)(1076003)(52116002)(8676002)(8936002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oK/BIob80Bxhfq3hpjk4fYefN6uAv4ZTyaO6UPG7bnFGHrWw97tI0DHguffV?=
 =?us-ascii?Q?zYre4NJuJ7JiX3hNnwZXWdAvR2s4hmKfWwxteQ4LRGqqlIQ9gHhw7oi+UsAQ?=
 =?us-ascii?Q?A0peUdVX3ee4Bz48CFOmGuxR78w7HoLba7e7n9BiwgJygNTem9tOj+S32Ord?=
 =?us-ascii?Q?3wtQHDByPSk7ic002waWULu1Kkqnbc0XHGykzyjdYFC7Ygj9A/TUYZqJhquc?=
 =?us-ascii?Q?brTyInZbPoXDMkUarQZynZSwho/qBq7ILFsLgqqLjJQqjMX/MTt/1ccvxAjb?=
 =?us-ascii?Q?IJVE2nfSQd/bM6wgPkf55f380qqXUUa4Wg4CW4MYCq+2zF1b/31bXQ5BDycM?=
 =?us-ascii?Q?SZ76IEuR9G3YOe0LQC3lcgvSRd8TbXR6/6V1Sm4svUqZ7M9g9FvHF8zrNV6A?=
 =?us-ascii?Q?OacDiPlMgZ6qX0cSpLestTcyDrqliR4bjCmbRJI7jQWusXfKOrZl5JSc95WD?=
 =?us-ascii?Q?UddYXQFnSXyNeIOqU2wN+Uubj0CEg8K29nrfr87f1aE8cF1eghmnSXcI74lc?=
 =?us-ascii?Q?sVZqM1RO/dZqCzLLzuA7LbJKWVSphF0Xl3oOsnXWSwE4g3mXuAaZv1cjHh8Y?=
 =?us-ascii?Q?bnPHX/3OymGCs/kCGiV4WgcTW3lziGc/din6miR7Y13FIfbyE7XnxHigfqN6?=
 =?us-ascii?Q?8O8PocWhSKhLdOC1utKOO5KQiN2VB15XTIvxkvNm9yKVYXAgtlc3tVz3G7ZL?=
 =?us-ascii?Q?LgD4uhBUJmMqIrce22whxTEsbnL+1DkdylP7+V9rX1qq+VpXis7Ns9RxkJpE?=
 =?us-ascii?Q?aCtUAdRyn/EH2QPPmHAatwZ4v+ESRPclkzHmeiuRmKj2tXvzGubpARmL6OFA?=
 =?us-ascii?Q?nau/BkKDAbhb47q2zx8kFFMci462MuHEn0C2CEArkpeDa9I+BZpPd6OBDxa2?=
 =?us-ascii?Q?Yf17AjnMdJUBy990KfLnBc9+gWBWaAvCclGgJHxrmA5R4mQs42aBfRKyR0VW?=
 =?us-ascii?Q?1RKIeY/fbEqFNQoWevLaso8c9va9HASq6yok3nyq1MM3P24OvPCY6wIMxXIv?=
 =?us-ascii?Q?AnaoDVXqorqGt2lb922bWp4KFmagg5UKkMfreMvzczSfiwg9E9tZyZ0bh/WP?=
 =?us-ascii?Q?hQDHRJE6dPDiC8zHvWfcF3KOijwQ022U/hcu6yAPerzkujgE57XMfx6eva8c?=
 =?us-ascii?Q?zz4G7fDoqVxkT6/vqFr2eoCCuiIlspJaqEL+3BSO+bYeprWjw/6tewzVLDEB?=
 =?us-ascii?Q?kizF3mcDsMmZBYnfE8FnXOuxrJbq7Cw78QefG5GDWrIItdnVCi2YmR3GY26z?=
 =?us-ascii?Q?jmaKQ1feq93vDvMnM357i+oRmOBZqS3vyVsSGg/8Z+/GmHuQROruQR2YbV+q?=
 =?us-ascii?Q?20ZSlLkHU3kRs3xQ73iOx/3P?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69c9c5ef-c864-411b-ed7b-08d945030a84
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5478.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 07:02:41.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xC0ZWWhUzA1qO/RUHK8qKlyvCW9H+76nkYVQBSv3nNvEgYa1TfMzPZ1WtzXJNz7zJmwg+FCoQ4HCbv1rkyWTcrskVsx94lM4CKUCO0jm9B0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5714
X-Proofpoint-ORIG-GUID: uxVchENGOcJsrwntbn5g2sqkq7nMyYTG
X-Proofpoint-GUID: 8FU5TnSp3lVA7dz00Nzf0Fu1M6xuKsVS
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-12_04:2021-07-12,2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=764
 clxscore=1011 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107120055
Content-Type: text/plain

From: Zqiang <qiang.zhang@windriver.com>

In v5.13+ kernel, when exporting the SDK and make scripts prepare
the gen-cpucaps.awk and cpucaps be needed. this change is based on
0c6c2d3615ef ("arm64: Generate cpucaps.h").

Signed-off-by: Zqiang <qiang.zhang@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 84e99233e6..b4af622d57 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -162,6 +162,9 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/note.S $kerneldir/build/
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
+            cp -a --parents arch/arm64/tools/gen-cpucaps.awk $kerneldir/build/
+            cp -a --parents arch/arm64/tools/cpucaps $kerneldir/build/
+
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
 	fi
 
-- 
2.17.1

