Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.25.1624383474621107835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 10:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LIlhn51r;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1807ab70cc=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MHXOPW003370
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 10:37:54 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com with ESMTP id 39b47h8ksb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 10:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fy66KUbn48fIV615EUoCeEDU6fU6a/hWttrDdxMJM2ceoNtiGfbnrEoOHU4qWOmCfvKYpw3ou+QHqleiB2jxhYBeo3brJHQ23eE++NrGQCYVeG0d42o4nC+PnaA/wGSzj9mKUgVebKGinUwIX9I9SqdO1psyoEESFsqpQ2x15cIl2oW2k5kycTjvJ9zAWw7qXSR2J7K/+j4gBplIVrk/RmNLgJO1flDUnyxsBVvJMhlojB84y9FoZoeyn201+vsV0oPTcBlfDw85qNgLiTbFCoWbgrHLZf8rgBGzJ5fMjrrAgdPMSC1Lh21d5I2SRNu6cuKwbLf7BqoRYuccMjZtQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9BxxUzkpY0FLww57GcwxPfKAwkC1hs/oeDcWRcrY+w=;
 b=Dpg/yeFGVqLk00irF2qTIxlDp1eSwd2uiANALxsCi9acZ2Dt4XY6OdbgxY4TyyQn3o5RDVElsp09x4ymJRUB3+Rra5gewO54PeXLCWKbyKap7h3K+BImrzr7CqKdYYY26ttulo9kW9IIzMI54CcN7nx5etp8haGAkrEqZXbWLSgg+AW7lAMozGENZG9voL8dlfhh5FhXH/CamaN62DXuxCqX2II11vXmRR6B3PyDc7ZLGwoqTqnZeFFmte6KsMHo4k0YeroLCTrlfdiF35kTrcp+RBeRr1SZxfsuVZBQVrBv4qKppdci4bn3M8FABmaOWx2Rg0WYvfo0CvxxhizA3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9BxxUzkpY0FLww57GcwxPfKAwkC1hs/oeDcWRcrY+w=;
 b=LIlhn51rP+2SGSFVUn+McH5txIqJP7O4BRc9bkJnWmlNGJjuPfhb8iUeFNRGGzngGUWkWn6WhRHNm+0VWnBwbIVruThNf5UXshqUxmgyTGNUZnQZ44XjzfOFfT7eCfEXMHgK62GLW0sD2gc/6gmkpQNfBXt8d0GWK1YojgoIIZ0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Tue, 22 Jun
 2021 17:37:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::b5ac:be57:85a9:f240%3]) with mapi id 15.20.4264.018; Tue, 22 Jun 2021
 17:37:51 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 2/2] python3-pip: add multiprocessing to RDEPENDS
Date: Tue, 22 Jun 2021 13:37:43 -0400
Message-Id: <20210622173743.1231362-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
References: <20210622173743.1231362-1-trevor.gamblin@windriver.com>
X-Originating-IP: [128.224.252.2]
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-fedora2.wrs.com (128.224.252.2) by BYAPR03CA0006.namprd03.prod.outlook.com (2603:10b6:a02:a8::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16 via Frontend Transport; Tue, 22 Jun 2021 17:37:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e3db1e6-1e47-4e2e-ce56-08d935a47569
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB480080C5CAEACC4637477D029F099@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sE4+BPWwottlo7ZGYHjLm+ENbTRm3I0diw6n8jCLQjyL2tGlF9u2RPoW72gDDAANRo/SszYEVoyG47KBwIgIUXZSQkbjunfGf5XJPrq42S/QP27nlmFlNjZTEtRXep5FYp6wF46GSaQb0Z8pY3wbXOBWdVbadPyj6mBSpZxuspaa5mwFSIwYh4SPvxz0kuukdu4J50dG19RtZ80z6UXXtq1bYJaHUKjBAzO0TBFsOTbI/Jr0Z55sYj6uxjmUD0tWY3C9D2zWl4hUWLcAcuUq8/Jk+UX2MErGjJ/fMFPnRYax7HSSX5l82lOUrz7q7HJujgTxze9YRbD7asKjZY05tPRfHfQaKMXGg7xvnie2mONKEewqdeqB3U0lM2GieoCSmML8hCOrPCE3bgAqVlExnMd8zfzeslN8JHVD/m6Xd3ByfaKrdGqpay4JoaUMfYF90l7vicIgELejnMo7i8MwC/rt/jArzlF155RKh21jDkwylQueydqcxuX8oRqlm2dRhQm3yAPcWdxFY/N9+lnUR1e2pWguz/Yzh/DQs1Bixsg4YEm8ZQx6nkKbUi/aga52xDiobedpQCNLTPtMx86BTd1eVR5tpj8yx+dLYRgsB0MTo7FLLpwoVd7vVQA9IJXLP3kN327guZG/1l/PP4Xc9NghZQA0HfZQulD1pZjB6MVWFX2IqY/BU6oGNNz+d02fZjltsUhkP9Y2ni7T0Bk88w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(346002)(376002)(396003)(136003)(366004)(2906002)(956004)(86362001)(478600001)(44832011)(6666004)(2616005)(6916009)(83380400001)(6486002)(186003)(8936002)(1076003)(6512007)(6506007)(52116002)(36756003)(316002)(4744005)(8676002)(66556008)(66946007)(66476007)(5660300002)(16526019)(38100700002)(26005)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+ojcJpcdfB/IUPJcyabzE25Tpdw5W72lhJO1U8HkdLkqahvujRooBLgh+14h?=
 =?us-ascii?Q?oJ78JaajdCeZioJ4VaiQMOPZqKCiioUrONkBQwnbsM334pFz5FApN+d54bKq?=
 =?us-ascii?Q?U/jzklEa6/+KArPBeeF4RuLE5UFY+D8nnzfzFEoytkYk83tQvV6OyBBgE6mL?=
 =?us-ascii?Q?w47xoUDaw4ru7T7JP/I339ZH1qZsTztSJgs0Wdy3cc9N0b9p9yXsYz1fUBEF?=
 =?us-ascii?Q?0SSwZSAhOzbQ/5NZZJDLcbLLzB7TqxCuBOXYjpD9avFL9bftfQtuTiuJnSKe?=
 =?us-ascii?Q?CY9P4jO0MtgtDEp/qCKo4LJGrrbofsVjLmL4cVMOVXszTwdtDyafynfqKqjH?=
 =?us-ascii?Q?1NWEOgNYZpP8OBuFyuxcd/UhsWnatQDR+vQOGvGw8N6msaTo2VTf2nXw/qes?=
 =?us-ascii?Q?LyEN6+kLMpJsy97Yf6YOuOJXfW4olUxk2k8y7XyUeYdxWBlVrurxuGwnRvx1?=
 =?us-ascii?Q?W0h/UeLQ5USSsGWJCvH/3cSWm27AeamM0+GrE3AyMrUur45mnCWMkdQB2pcH?=
 =?us-ascii?Q?z6btBNwxlB+iDRh46uABrP3ZIa3VlcLVQssMM6qw+yxlWEiZIbRez1ObO2TN?=
 =?us-ascii?Q?gIUkpUpH8szLcpcwWDhBczkmUEh8MwJCx45NkU+3VHApo2LXg5e5+eq+nIoW?=
 =?us-ascii?Q?VbmgVUZCUmd76uOosZH2Pl0sMoH8BcoDylNbhwap/afbYD2NP3rZ88J2IIEz?=
 =?us-ascii?Q?G9X7jx/OwXd6tg/5JHDimxKsLNGSNG5R8IL+3uD+KG9BT4O+TqaUcshFzcM6?=
 =?us-ascii?Q?tvZ0JchW1bvIPov72RrI50lkx++gn6ohjm2iosWVXNbyDPVHiwtu8+R/lLyy?=
 =?us-ascii?Q?awjj5xFPB57t0ZLffzfWAsgvb0IxVmBOLEhbzmXggg5QVL0T2PJufAKyrTNv?=
 =?us-ascii?Q?5acsOpwzaFZAhgHpP2bQD1gkJUgIfx75W2d7ZpR0sSlRW9yjMZvaHXTVaSmh?=
 =?us-ascii?Q?ZVn5QTgs2oyoQOLT6Ccec7muL0ER5iNqhgxstzNHIZhkmjor8u7EqNx2XgY4?=
 =?us-ascii?Q?JbATJ+shiN54lQkfeGEu3I/XBU6BaCngXRkZkCJtBNNnC8HQ+6I0DBvBS7gT?=
 =?us-ascii?Q?zwXgl5KosPDD1RXj7lKdg9IMX3qctFORafnIGSusbL/29aLpfFWzMDg0nkSM?=
 =?us-ascii?Q?/J4ENd5DzQyfdDMr/h3POO4UCtLa5Pb3SHYVEez4tFA5F7AbFq6ZvlY749SQ?=
 =?us-ascii?Q?L4tJwiWogs4P+6QKGfvO+fSex4l0jZyZbLl1fOoj9YzK2F/ZzAzOfc/Exw8z?=
 =?us-ascii?Q?5Qg9zthRbsG2CjKI/wShZ4nO93jZ2yWRq7peaSygtJTgrEK9ojA0853yPvrD?=
 =?us-ascii?Q?+12PFsjA7WrHRcR3yXemhB2X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3db1e6-1e47-4e2e-ce56-08d935a47569
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2021 17:37:51.2451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uW/3ui+HmV2VMUEHnfPez+7jT5xQAyxxU4jeaqxtw9EprmeHk+5CUNcAAO358DRvcOP98U6xpkt575jtggI0OGvotqsx3AGZgx1ffzjvQeo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
X-Proofpoint-GUID: P5_eI7uLLLptFJEu8gqguP-c39pUYZp0
X-Proofpoint-ORIG-GUID: P5_eI7uLLLptFJEu8gqguP-c39pUYZp0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_11:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxlogscore=850 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220108
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Without it, simple invocations like "pip3 list" will fail with a
ModuleNotFoundError for multiprocessing.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-devtools/python/python3-pip_21.1.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-pip_21.1.2.bb b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
index fd7a145205..2dc628fc29 100644
--- a/meta/recipes-devtools/python/python3-pip_21.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.1.2.bb
@@ -23,6 +23,7 @@ RDEPENDS_${PN} = "\
   python3-io \
   python3-html \
   python3-json \
+  python3-multiprocessing \
   python3-netserver \
   python3-setuptools \
   python3-unixadmin \
-- 
2.31.1

