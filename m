Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.6318.1631261302804566181
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 01:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Jf4PDzgA;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48872e2802=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18A7rGVw008323
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 08:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=q8bFLJgRhE2mpoq3QqnRKmwcLpXQGanghzWHvL7URIg=;
 b=Jf4PDzgARoIcqk0W6Yz4PV6nq+vWCoT5ToMOPUzoadbS9+KPt7kuc1cRTMwN0xhueFvV
 DpBL2i9XsvWSr69i64MDaFd9gbxnx0wmeYlQsFQ3B5BAiJ+4kL7U4fP9qBek3E8HXQ2x
 4pP+2VE+RHlNothQBAi2SSU5G2m9Lz+yFaWEIdkCSkMTLZxB8FH7ES8FyvmdThHPLV0f
 icVcoBVxM7lCOE4g77g+G+hQRBqyxwJSEqavF7rlSxmUZLw09yPeQzD7wq9DBGFgxAHU
 wzo1UIRxxfVUXLEnqYyiyp9wqHxxME88uLMfMpJBBc0UczFWNSD5DS7/xaIz/P9rTrGd jA== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aytea0b7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 08:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl/zej/Dqbl1GFNaQPNP3EGv6RaA9G31ys36Yv3esChC2eLoaQKUR1mr05Oxn1r1oW9a6lJj1lGlMljbrlGLJXsrmRud36s9TnFKa1iI7KPnzYMvwcF069FhiPphIBV6i/4YP4ROSCeP8IvyE3rTU/ABjzncILJet9CitRewEdgnB9YlBifQ0OCv+R4kF0Q4mwuO05O4aS0pt/3CXSODDEr/WIsSzyv5ohu0ez0xt9B1nIQj0anbCdze6ni/0aTR04Z4MoQFqpMuOB5zKCtWdz0+3Uwn/AmN40vmRBNVMrM7ny39lQnulZB8aV7muOlOlOFG113XvOrRzuIqhMQtvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=q8bFLJgRhE2mpoq3QqnRKmwcLpXQGanghzWHvL7URIg=;
 b=eQY5JAbhmg4CvSFS9FxLa1DClvveQ7YDYdCXYSfX3XGuQ7JvNEdihA7hvM2ZH0bFFspHLAYq/b06VrKufJi13WAtGt5XH4zDx9npWdWNCZRMgK0ucxi0RkXsFPMStcNeQPOfY+BlmRb0vZqoQ2APmlvd+VC5PcTDWuYB7oMkNW4SIGQKOi8bn7qD0RhURB5ia/XaASouECmH8Xv/YfdGCouuDbyrHO++2K5jnlIHQOHdt5fq75foPDttucHsQreUwSDqBULC28wqBZNlGvwm5ctBya6P06M5Nsor5A7d/H5raCk7XFuTXlTQaTZEvCyhYbnjyw+lLdo4tFQLtkax/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB4105.namprd11.prod.outlook.com (2603:10b6:5:5::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 08:08:19 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:08:19 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] oeqa/sdk: assimp.py -> cmake.py
Date: Fri, 10 Sep 2021 01:08:10 -0700
Message-Id: <cover.1631260941.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.33.0
X-ClientProxiedBy: SJ0PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::15) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 08:08:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fe1146c-2ca0-4d2f-622e-08d97432266c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4105:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4105EA69C7FE455B06E5BBE0FFD69@DM6PR11MB4105.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wn4plCxXpWUHTnBs/qq4+eCwoKD0LMJ5wFrQZQa4Nr9wdwA8HP066xL9zc+Ru9dULFlEfa+CJUbzKw+Q1vc0g8hnsw1VLcS10PHLkklNZN75IDEpVMO+uY99P9c5QHEgjGVp8V9hSBSMASJkZhSVFYQKE1x0S+CRSlKl5KAKLWXWjzYXT7eSw5HyFmdo9cTRBEquYn11JjK0naSergAJ6ypzvUzU5O4ksLltRucCSQScQjfC0ImzTLqZ4EDT8/aOGeId7FcqizmPMmB5QdqdimxNEhVUMPHPld85Mj+tKuzUH5EUo3b9smPU84Vmg5DA27JTP94DQnDzA9jCysoE0bgytBgnLb7S/s+uJqcanIckO4IpPpnuco5/p8bMS3J/iKfbQ2rz7+DjeKKxc/uwoG9yZRzetALWWi3VYrB9lmhDgYy4esRtZR8gwDFoYt6dhAlw7m3LF9V0ozN3AbxzvsWC/VD92cIckYo2LmICTXhiYYa18vX4tSvUxyC48tPJ3MGprXoig5VSJe8MnwoEjF8weZXvaaqJJO8apRNMZ8RXZcYLBTr+VAZzA8X0dILwGGrpyuOSuew3pOqi1Y+ETo2gC7/xP6ifc2lLKnnpUKmyt9fkAtmZL9WzvuYKv2YRk2iWp8MbTvy8tlud+ag00W8d0Qnp71N4ZgwRhiVhZUmR0y0hiC8hIhtAB7fYt7VKbn4uJNI8WYsLjo1w5aAxIKGMvc+pMUTBJwGx+fSykePgC7rS77KEc2Ia89BrXnGFWWA2OLefckYU2aZ8coLXMrmZivqy3Gg/CIuh/5M87p8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(396003)(136003)(38350700002)(38100700002)(6512007)(83380400001)(478600001)(86362001)(2906002)(316002)(6506007)(6486002)(966005)(66476007)(36756003)(66946007)(66556008)(8936002)(8676002)(4744005)(6916009)(52116002)(26005)(5660300002)(186003)(6666004)(2616005)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ECwcM4Uk/KtCThxhznDPvDhcjaCaaa//JDB9MvQt2fK/Q1r/IDif1N2KO6H6?=
 =?us-ascii?Q?5ZBcjS3WNhzT9f4avBZOkTzJGyyTmLBBGH4eCfswWupFQOmdajTHwFlhJFB7?=
 =?us-ascii?Q?I0k27g+p52qUG9aOQo52uMTEmvI5QpICqdEsIX73W+T7gKbznjbLQUQwkozP?=
 =?us-ascii?Q?H225MvZpTTlLGtgcGioGMrkjGbxFcd7evSOJ8+GZEjMFUDkrNYEpRJ+Kjtkw?=
 =?us-ascii?Q?n3CVCkUurTg6Y9PhoTIwL9CL45yJO8FzmIeI1EAhQPyxpLkO3YY6EFWIwsXu?=
 =?us-ascii?Q?/cvRLYU3yUS3cyR1yaKXUJYARFTBas5dHo7ucxEdlVeRxQjlag9H2olxBSBQ?=
 =?us-ascii?Q?wONGJQKpEPh6e6o3vAIMBRpR2wk+OwiiaUf7bPnULv+nbRNuFf781FItL3Sh?=
 =?us-ascii?Q?fEwDqSzGBaOf4ziA6jKrKv7isuFLfAp21FcXhmmKI+73Q3JGLaZJxuXbfFfo?=
 =?us-ascii?Q?r+2mp6kN0irzqDhenmRWmFi3yh5BT6ZVOUq/e22HBN+qye4Rt9a2zb2iqMcD?=
 =?us-ascii?Q?e5Pwsg0RQAhCO0ikb5wUKT7vp5JVC5Ufru+iAWUvetx8jzGWO/jUDVjdLSGJ?=
 =?us-ascii?Q?O4QrkkIFzhyX+48MFHklLLpNJghwBf7a1+GC/xnseDQBikwxj2zIFJeMcPbd?=
 =?us-ascii?Q?GQ89FT8RJLUnsRfUz8Cd3y6Fa2DGS/iHfGQAW+jy4CkOZ2c6QvHN2q3y5AsI?=
 =?us-ascii?Q?LLCGzJTynRLhADFcukstAD3+WgeRP/1a/3ph8pVn6v7XfcSCrpqdW44XhTvK?=
 =?us-ascii?Q?DWCrbiuWYbPNdBaCBmG+u3I0NACQzmYQDaf5Fll79AXssi8GxD8RcqOZr+rR?=
 =?us-ascii?Q?jQTgJxbq0em/h5LLe8rbAxfmEw4pmc7HysLtEdKnH60Yq+WL0j9qZLFTWNGd?=
 =?us-ascii?Q?sc0C2xGOM8ojNEVPLpYLdJAwyjASbnoKq1NUsgQkYDX2HZpeEk9egEPLSq3N?=
 =?us-ascii?Q?+dmP3I8+Y8TYM3ANVwOf53+U2wAbqtRtxX1Stajc+COc76Nh5vjclG0/ea2J?=
 =?us-ascii?Q?0jOQ4RIasE27mqev/Qd0C+dsinLMFj2GWUw5F1YXN3B7YTNP45NFMiFBVhUO?=
 =?us-ascii?Q?K4G6vWwLWd5nigOp+DcYF35eLZYwHuU42BlWP+XCE06NPke6YfNZty7vxMSj?=
 =?us-ascii?Q?LcQPaplN8hfNp4EsMQ2MZgD91mjKh38suv+qIAXkRdvGBQU0YVOfb7zB85ji?=
 =?us-ascii?Q?X0uxn+fgbD1zT4SQkXoKBc0qbiSb161Uqio5BEA6+qpkn2Ssm8S+mBl/qOF6?=
 =?us-ascii?Q?+wnjfRHY1uXIZqKNaYWkWKbmfaWLuuPXfG50dmMekyod2U4MJJucH5iL5zUW?=
 =?us-ascii?Q?L59lvaLCNhi+IxAzT/XeR5CC?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe1146c-2ca0-4d2f-622e-08d97432266c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 08:08:19.2873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJpiYHlCrnoS1gPrmI/IKK3+JvQ47GUTnmRrmb7Z8B929V3Z9E4awOsIRV314rqaA+jcHBMkA+2QWaStm+CZne6+HZkxRPOnrw/c04wBwao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4105
X-Proofpoint-GUID: CPMrTTrn9JFDPiHhJtxB2hOljo2yMG4V
X-Proofpoint-ORIG-GUID: CPMrTTrn9JFDPiHhJtxB2hOljo2yMG4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_02,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=748 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100050
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* Test info
IMAGE_CLASSES += "testimage"

$ bitbake core-image-sato -cpopulate_sdk && bitbake core-image-sato -ctestsdk


The following changes since commit ec20e1a0e0ba61a7615b361bfc9d9dc58a91f9b3:

  create-spdx: remove trailing comma (2021-09-08 15:32:45 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (1):
  oeqa/sdk: assimp.py -> cmake.py

 meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} (70%)

-- 
2.31.1

