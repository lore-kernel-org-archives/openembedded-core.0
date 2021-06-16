Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7044.1623848204652415947
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 05:56:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=g2KBjY2l;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1801bfd119=paul.gortmaker@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15GCp915013292
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:56:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3970drgnkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:56:43 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15GCuhVU022945
	for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 12:56:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com with ESMTP id 3970drgnkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jun 2021 12:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrIOfvh7HkzdEKDFyOj1WFejdp9HDOaHURn/v9wAybpy2JgljrYNWTEp4pcT5yhiRvLlPK2XeqQlzU55a/PK2iGkP7Qj+w1WFKh0qw4Jb9+8NNd2bidxe+vkruTI+ipMcybDHlgHsW5qx3qh+8ldYDJna/bM/OX/fhn0ma9CD2gU9b2YnNMgTVlezVTxUQZVsZfyzu061pJkv4YuU36ccMetb2t1yX/srRoQV8JiUdA332vC7ox+h5LGMCc0llpwWyUvphpQehX501nMuseT+3lWnr9erF7dWeiht7qOYTdeXsin6Izb0jPDOFQXWBt8DQNF6YjgxEIAMoYZeGcKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+f2fZOdrgQXp00WyOzPVZHaP448ot8Yy8NiSyDe7YQ=;
 b=DDN/Wpw33anVZYcFiPOlzL0xbWury3J4R7jdH4RrTL2jtsfxM+myJFuwk3o3OWXZmXWpjk0gsMiPkV7ZWKNi6Wfq4/cadhNcj71geD9IaG5mF1ePpmDNrvlXDr9jMeW7xg/zFEDspYPtaNYtkgeO4eUal8bXrGhw4soLRI0vg4qcfTg3x9Em9+BEysPvT9sE35YfnqS+Yue57f/2VbKHjHKYReO1InoOPkQq2S+mNFr1colc7p9LOQtnJazQt/vGT6xYuElZmTLiUBS3w2stuaGqyYytts3cSdgDStK4hMV6TVqiwMXDNhkkrEPAxgqD+/F2k1Jt/V0XAqgt0byLlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+f2fZOdrgQXp00WyOzPVZHaP448ot8Yy8NiSyDe7YQ=;
 b=g2KBjY2l4iRgGXDGFMr5E/AcBqaYvGVvhLpOHRwmDpFEUCYmkffSyZSzX1WlOb74hWDWt7ToGSbQrN5pccig6pDD+oXRsA2Ffe10XX/uuDcGGug1AhXYuT3YEUG4X587NuearK0bqvtYGSHTNe/7pvAolBmrhKJyUaq0mi5Lddg=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
 by DM6PR11MB4234.namprd11.prod.outlook.com (2603:10b6:5:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 12:56:40 +0000
Received: from DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::1caa:f0c2:b584:4aea]) by DM6PR11MB4545.namprd11.prod.outlook.com
 ([fe80::1caa:f0c2:b584:4aea%3]) with mapi id 15.20.4219.021; Wed, 16 Jun 2021
 12:56:40 +0000
Date: Wed, 16 Jun 2021 08:56:37 -0400
From: "Paul Gortmaker" <paul.gortmaker@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: swat@lists.yoctoproject.org,
        openembedded-core <openembedded-core@lists.openembedded.org>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [swat] ltp failures on autobuilder
Message-ID: <20210616125637.GH329557@windriver.com>
References: <1687473EDD63E45B.21776@lists.yoctoproject.org>
 <168784123C10B53A.9125@lists.yoctoproject.org>
 <4ad336c92233e088ddf898daf2afb4955ca43256.camel@linuxfoundation.org>
In-Reply-To: <4ad336c92233e088ddf898daf2afb4955ca43256.camel@linuxfoundation.org>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To DM6PR11MB4545.namprd11.prod.outlook.com (2603:10b6:5:2ae::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from windriver.com (128.224.252.2) by YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend Transport; Wed, 16 Jun 2021 12:56:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 014f2e1d-082b-42a0-af01-08d930c62f3e
X-MS-TrafficTypeDiagnostic: DM6PR11MB4234:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4234823780AF8D69DC7B8707830F9@DM6PR11MB4234.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MLm8XZAJSecsmczRrHqPTWqHanRxFEshRxXUg/da/J5FD++pBdzBHe2nnCR1Cl3IaIKWIFU1pC1Q1nvorZ9eD33DljyAtabARAxW/uI9ErmBKorj3GYD8kDC5DgEb7V1SVBjyU1/auEMSKT/D5meD0yO7GuXeTO099ZPYg5upznjdFwPeiz9eoqWQ0omhtTrt5TBhC8mTuvZZHa2rXCRoZKfdD3oEjXhXKR1RHt10KFgUkgV7QePDaR1jeFZZ6+bGneCRr3TRIJ0k6Z6gBiEHk7KaIuAx8PxkiQ/PfHPjNtASvwW0V2+dGWViTm2V3P97PxMQJ4ef27b07uVfxkmcsc5OI5Qxwn3ShaHD5esJcUf0OoM3Xy0eLGiBbpG3WP4q7gpP6g8OBU64VWI/WftrvV7CtD9zxSsD2YZ0DTeC2Z3ISkxF0XZ9ruIDdzbLHSAIU/uvQf+Cu149onwKLtS3vtJbaHtvPXKSA6yUy4QdaO+nZ1CQlsEm0ISOEPHdGunefLQva50akMroV/15FGkJnuZ0H8e251Acgb/OueqCqFYVtKKuNRrjc3N6zhvapylrMYr/8M/aDXZJzoHaxksyzE1YZjJw0KLH24OVn3tbkWG/xV2m6GJGzyPRGQraogrKkKjeadTRkhG5DN/IoaW6jMDfGZG/a86Y9bWmZ0vRvSlD1efqilA9R6ThRebyR4cfRP73lBak1DYdPPoWtD7VxfCWIEfNkvxHL5NpoG7klKVKRWz0A8yhLrbjsDtJjYGfwqvkdSvrOhZPS2wVnnmRiMcAh52U2kOHixtieXp62Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4545.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(346002)(136003)(66476007)(966005)(8936002)(66946007)(316002)(6916009)(86362001)(52116002)(44832011)(107886003)(66556008)(1076003)(2906002)(54906003)(33656002)(956004)(2616005)(83380400001)(478600001)(4326008)(7696005)(38350700002)(38100700002)(55016002)(26005)(6666004)(8886007)(186003)(8676002)(16526019)(36756003)(5660300002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6M/o6E77jvxZe7fHdW3uTvsRoSD6Rl+Sfk1Dtg49OCgiFyafqeb1BOAnNLcQ?=
 =?us-ascii?Q?OeJHdGX1P8xrgZNp+twlpyOU9F9uSCn8xBd6odV2wRloMnPFpMInHEO29a3O?=
 =?us-ascii?Q?UpjZ17sl4Ov9gAPFZ30tLdFbqomstxPGNnR+uJwDo9vsM/eOo3N51lQHDxJ4?=
 =?us-ascii?Q?jX66cdh3RTrer0MknD/cBSpyiC+91kMMjBglpFUTDFL/Ml24PITDQ4yLhY85?=
 =?us-ascii?Q?Vi2SOGJ2XX7D7jkAOh7Mg9AlyYJGCmjbdDMP4jrSF+T4ZPuJNCdFL0f1ZBM4?=
 =?us-ascii?Q?hvUdp6Yy5sVm2Ytz6U9y9XKNlOha2c9Q6ZBpcS0zdU+VWdZxsDAAa34lEKlZ?=
 =?us-ascii?Q?H5GwT0bhvzdlTFGRYcRthcUna/OScI3nSRvcfe174KW5Wcrw6yYqwXWNJ7j5?=
 =?us-ascii?Q?+20bfPPOItvMHN1hAW1XRcz0UKV6Vubalhp2gY4ug063tl9SW/XzQhrOe6tQ?=
 =?us-ascii?Q?G03PjwflnfAgrEp4TpvtBq1/utKY29tOQaOJJjKvbPK6L2wk0BqtG5PtLlHI?=
 =?us-ascii?Q?5toitzxxP+OYFSZixb+d9050vWGsAGHOozohj26jIkCdxM3qFsCAHx3wyg+I?=
 =?us-ascii?Q?6gyOBFoMN7wlCUb1Q1pmw6LnfeQt2/0ZaRHT35PN2xW5BqkQ3bbybCDGIEiZ?=
 =?us-ascii?Q?x0fZDM38F+cX8dVzrWsmFfny0raR38gjPOkPL4vxBl88Mhe/SmGgrScZTmUe?=
 =?us-ascii?Q?v/YNYcjErNztEq8XYlVcrb61anW9vn0fMCm+pFrWru5tWLlcDY31TXfJhVxW?=
 =?us-ascii?Q?YjzNklRLA1JeqUH/YCHgVWrevCSo9/jX49Sl/eYIiv5PZVyu1l5UnmTubdZD?=
 =?us-ascii?Q?eljfgtO/Obbo1wALO/ATlXKHOyZnPUHXTRgJ0uY58tway9w2rZ9zLmK4FDAo?=
 =?us-ascii?Q?z7TGMbfZdT+oxHJwtFt3Rrn7+/89GQ8+L0SVJsPkWIfMnlsfYLEXDiCE5uzO?=
 =?us-ascii?Q?60NYN+6k0T4JoA879G35QuaShXSL0BNi8NnzpTavElWyVf94pO7bnm2f3kOh?=
 =?us-ascii?Q?NcdQvn5Zgx2tv5QuDckllQ9Pq10b697dhqhKoqreVyItjahNUH29Rat5uIgW?=
 =?us-ascii?Q?4jGmXN/Iq57y3hfG68yjxlI9VXqzRXNb7eBrKtnGoWPf1Sr4XQG7gn9yh+Am?=
 =?us-ascii?Q?3rUqr1NiT96VVPCBnkUNJFquyUAQ129vYAl+hCN6O9B43gulks2SP2MzTQxb?=
 =?us-ascii?Q?H7CdNwhDQQ9ahl1f5t359jcH6PcAumH43tYj4k+NQI/9z/bst6tVwSYL6eFd?=
 =?us-ascii?Q?reVfusJmLJ99/eGHGS3QrR36yuvG4vJUmoMPD04ekOfJDhDacysBJZEejALl?=
 =?us-ascii?Q?i9lcVsSHzXAF6h53n/WlvOXe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014f2e1d-082b-42a0-af01-08d930c62f3e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4545.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 12:56:40.5185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLRnsC6yJ7D+Cz7qr9HX2pY1E0Uph4jYWlQoraJ+54EqFzhdJI9T4O9QvkmyS23PhHvILfihMakp7vu45Q3vePMLUTnj35oaKnIVSETKw5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4234
X-Proofpoint-GUID: WX1yhUUWhr5iudVhzOmmgRssgWd1Py8-
X-Proofpoint-ORIG-GUID: gZ9BMkeJHfNv7U3LY5MSeSfL7-uB6AMK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-16_07:2021-06-15,2021-06-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 mlxlogscore=899 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106160074
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[Re: [swat] ltp failures on autobuilder] On 11/06/2021 (Fri 14:19) Richard Purdie wrote:

> On Fri, 2021-06-11 at 12:36 +0100, Richard Purdie via lists.yoctoproject.org wrote:
> > as a .cfg to the kernel and that still reproduced the crash. However:
> > 
> > CONFIG_DEBUG_KERNEL=y
> > CONFIG_CGROUP_DEBUG=y
> > CONFIG_SCHED_DEBUG=y
> > CONFIG_DEBUG_PREEMPT=y
> > # CONFIG_RCU_TRACE is not set
> > # CONFIG_X86_DEBUG_FPU is not set
> > # CONFIG_CONSOLE_POLL is not set
> > # CONFIG_DEBUG_INFO is not set
> > # CONFIG_KGDB is not set
> > # CONFIG_KGDB_HONOUR_BLOCKLIST is not set
> > # CONFIG_KGDB_SERIAL_CONSOLE is not set
> > # CONFIG_KGDB_LOW_LEVEL_TRAP is not set
> > # CONFIG_KGDB_KDB is not set
> > # CONFIG_KDB_KEYBOARD is not set
> > # CONFIG_DEBUG_MISC is not set
> > 
> 
> Isolated down to CONFIG_SCHED_DEBUG=y being the line which somehow "fixes" 
> the crash. I can enable all the above apart from that and we can reproduce
> it.
> 
> Also, I changed gatesgarth to use qemu 5.2.0 copied in from hardknott and that
> breaks it. Dropping the 27 CVE patches "fixes" it again. It is possible it
> is one of the CVE fixes. Continuing to try and isolate.

For the mail archive trail, and for those not follwing the ongoing
research on IRC, we are hopeful that this fixes it.

https://lore.kernel.org/lkml/20210616125157.438837-1-paul.gortmaker@windriver.com/

Paul.
--

> 
> Cheers,
> 
> Richard
> 
