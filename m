Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26364.1631519123821184138
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 00:45:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=grNV4GUo;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4890dbbd43=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18D7Q0Lc004837
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d3QUcX8r9EnHTyLLT6qESKVGoQ5Gct3gfJg8iUx7mF0=;
 b=grNV4GUo0B8C9k2UXKk6t6fHKjwPNiYFoHG5RkXeKB1v2TWv2FSo8WPGd+jhRo1ULzgF
 gh3nrtcA/ygfp0iBRWKk7KMGe1dyycufGlS3yzJP4b3ac9nQrFuczRIkhlcNZSFjGeNQ
 LzZ1LgKg4zg5CCI0PIVMWYmwHkTI6tSWYzdZOxNSGefRZXXofx0xgfeYPV/sFIMzSW1P
 t+GTaoiENi2rDUi6+0U2Aqjbr5i+4GrilFP1RzH0vMtxhoqYxp4tC6VjRcnPFbkXIJtf
 jiGQdQj5kLxjNLZp77l4rw820zOP8UzY7sWHUCR6ehMQs4QLAMNvXfq+e/mWcn87rLSU jg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacggst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:22 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18D7jLvN007051
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Sep 2021 07:45:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 3b1dacggsp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Sep 2021 07:45:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PHpYJi/W1bPSImQuZpyxBQoiw/kRWP5NU0c+mHTGFw80VewmPkz9vfvRvwqm/7QapJLr1e9a7QUR/gBQpApzb765X62mLjNDSxZn32iyoHIEGoSd745WMBS8vDasp14rIPQBCYoOFx5C4OJ9YOrEInUOJ1m0b6oE816VBMZEDQaMPCSdhct/OC2cM55WrDDlVPNA6gzofGUOgJE+uMmsIrZ4LIG/TUoIQSv3eF5l4Vrj/jj1CzFDfI9X7gr8Lv0+O86SIvZg9mrNyHsfMW/9N4SDw0lilRVSgPPIPDRh3g9X1CVxhwWdunfg0/oOXXsdbZVbc/7xca8RSuBgt3ToFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=d3QUcX8r9EnHTyLLT6qESKVGoQ5Gct3gfJg8iUx7mF0=;
 b=WGBZmwyRICzDUdZDfqfdDd6W5z7PWJLBMXgIrxVd7jd9ujIQLh0yoZDlrjOMe+hSwbAaYEY68Elke2HtDMZmAyQA3OvRB2HMbTu9aYBfnHLJBqZAhSags4+UZOZOXcdXchjlvj7ikFULQlBfpVVs9tRNeJUANB4Fauobh4TCPcnUB/SspuBjZHhkE97Jqzo6cRUT5errUCCV3R/vJqsWBZx6rtp+GwgJ2ZLLhCgv6rr6UE0ppjcOZNSuRGxYvDUoH1xiRkkAu5URHDZ2xbTKZ7texrLP/rIMF3ltaFXKcty9onX3lgQGKXzpSyu9klN1C90jIn3nAadoqTAchIu4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB3628.namprd11.prod.outlook.com (2603:10b6:5:144::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Mon, 13 Sep
 2021 07:45:20 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.018; Mon, 13 Sep 2021
 07:45:20 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org, ross@burtonini.com
Subject: [PATCH v2 0/1] oeqa/sdk: assimp.py -> cmake.py
Date: Mon, 13 Sep 2021 00:45:11 -0700
Message-Id: <cover.1631518973.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: BY5PR17CA0068.namprd17.prod.outlook.com
 (2603:10b6:a03:167::45) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from ala-lpggp7.wrs.com (147.11.105.171) by BY5PR17CA0068.namprd17.prod.outlook.com (2603:10b6:a03:167::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Mon, 13 Sep 2021 07:45:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1dd897-099e-4589-f379-08d9768a6f82
X-MS-TrafficTypeDiagnostic: DM6PR11MB3628:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3628DE6C831D0A63B556C418FFD99@DM6PR11MB3628.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0H8Lgzb4j31jdkcq8KPPHLuYuIvWZqRdpyO2eT+GlkbOywymYtPVbBk6lQwznAAS76LFi3ufNHcxOaVAz0gzes5k/myKQpuqsDaZyUJHDryMF118ThHKYU8MHZauIo1vhRmgqR8aFUU7sPD++rUsoTIdeHQ2s2h9Go+3Nd0DkUWh8tZBU5SgPrs2xXZ7yzwLKWp+WsRje/e84ABexRwg1TKcZRErs0Qow9m2+UsAwUSjjUc8+hHqug6AJewXg+mLBs5KrUYekVyp/79i46+uIwy6kMnj+xyoIdgj6LbLWE2sV4THtLJAGbGYR/czbTO/F4mP8DoeTdorY/Oo1VuzYtsoT1vyqCPKzqiORKOXkXCYSA2ObiYBtFW8kG+zpFyi8teRAN9/DoTBhIX9I4NDbglC+xkqH+Xi/jw+JJZ3p3TabXisDpn+fTtkPljSJTtQ8zyAMDN22bYyF7GrIrvQejUY5kDbYVcgI6NJ4anZZpHV3Pxkr9LK8ccM09LFHRapvM3APAslGx/uW5k1GcTiis8ptoig5kfXJVqV4/MolEKX9LVgwadOJA7T1N3IVS6udaNBeaJNwijIUa0udVrRl5pHo0X+wULRP3k8plp197l2l4Ytwh7OzlBv1K8DwHFonJd/KYkCYUsVcBNRNd9oQh7CbqdxWEmk+yG7M2BMBIHMk9wA46S2SZ23GyOyp5bdXLoem4Ed0x81jupISiA1Hi0fCMEdFoyWA4kKVKL6OVfOV9i1gj4GGl3Qy1WaUN90cjgIGM6dZlhuLqPPbzghj2AGsgkWNN83/8a3UlNbG60=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(6666004)(86362001)(2906002)(83380400001)(8936002)(8676002)(508600001)(38350700002)(38100700002)(2616005)(5660300002)(6512007)(66556008)(956004)(4744005)(186003)(6486002)(36756003)(52116002)(966005)(6506007)(66476007)(66946007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cNjkZBPq3gBd0a3f6evsrZ93gqEk9WxVd0VsKg9owUaNR0arWUOohvw1YeWK?=
 =?us-ascii?Q?wGVfwEGWL+y+l3lfORwJoh2xz8TQlTo4dOhY3Zh+BKF/VBRwnvTKXLFSsxt8?=
 =?us-ascii?Q?mreYE30cs7qxoX7HWpKqsvgnv2+7OFHcN0unohPiVkUmBRPhXubaFPJOVM1w?=
 =?us-ascii?Q?S98dPU7e285dPaZosMGvKwdJdq74Nzl4VkG0rJSe//q6HWvz2R+iQuLKkkmj?=
 =?us-ascii?Q?s7QejHorCdU86wXG1FVo4h3BmmzWEw5CIdRmbdP4OE/AMRV+3IOaAq6ggYIo?=
 =?us-ascii?Q?F0gYVOK/vUKLBqaufBzOiTeT1srNwR9CbwtAqB6/pTh2emZcujmakHm7Ah3f?=
 =?us-ascii?Q?srY46r8DWbAdIqVHoQg5xDuwAFBSrea+O4+xFiB2aU09XG3kpLeu9TtmAGm3?=
 =?us-ascii?Q?EwZuMVkvhwmBQTdjzSfodwD+1pPkYTR1jn4ycsaq4mXnExWyfID2PuVDA1Kv?=
 =?us-ascii?Q?L72qqgrmm/bRsiu1BNHo8FxA3lyInDpnDgeTSmxyf1hu0lGSPicGZqT7oVda?=
 =?us-ascii?Q?ow9fghmto+MSZcXVAK3G7RAyFgkLtQVhMdWx4ZUBL/wJvf7d0ywYSwc4P3jm?=
 =?us-ascii?Q?dx7jUWKzRizj+DRcmcOpwdW0vtNMXClIYyeKk1o+hPf2Wv43Q728gzXaGR7P?=
 =?us-ascii?Q?vxqRbErDXCnN1Ocaug728JPChIh22oU/wolxjz4odVTCEic/EtctB/u1TLYp?=
 =?us-ascii?Q?9DMNJ9oz+slFBQ/B+dUrWRp0lD3sNzK0IJDpue5Dg7pLq2JaT4SavhZ2CX47?=
 =?us-ascii?Q?Zn9hvs7CmtAYvK5peUM5PbtQ5jnwaPZF31vrswdh86o38uNbS+0IKQzkWTJ+?=
 =?us-ascii?Q?/Ir4xLluDVhulgUellHCHyIvJGj2qhztYq/HXrhYd5f7YvCCadbZ9d5jumW0?=
 =?us-ascii?Q?6XWDRDkiFm4UKEQLp8db9gRFCZVMY1qDu0zQeubkbXgsD3ZtVPZ+7NooZgDe?=
 =?us-ascii?Q?1D4AH7c1N8AAVyva/XOm+0/VJt8FuEUqasFxupaTNZ288xLU1KIaAHFoAEnK?=
 =?us-ascii?Q?s43PhFgCyq/x4ii4ZghD9Mizm5r6UfQcB8tRW6WhdCAeY/Ie/hLnHO79cjWS?=
 =?us-ascii?Q?XaS3ejEB+DbU95EZ+f7bo0payFqJQPf0Qk87+mTJObVOvxYjjpWXSxuo/z7F?=
 =?us-ascii?Q?vWW530pZJycsIAr2X+rFc1N64SHDW12x8rVO4kQgKrS/G+BuEJ+JjedXKJPn?=
 =?us-ascii?Q?Mh1qBI2+/Hqfbl4NdgCTasYE5iKdQlZuI5994ZdgjYsMptJjtLUB+LD3Y5Nb?=
 =?us-ascii?Q?1VBa8/mTueemJYwy8lby/LgwZGW+3UeYs9/7BBt6k4OU9tBkeI+wgdcB4OF8?=
 =?us-ascii?Q?R26TqqLzk6X0/7J7pO9D2kO4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1dd897-099e-4589-f379-08d9768a6f82
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2021 07:45:19.9596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6RCOZFqY7P6mA2Nl4AoDlTSUOHtj5RwBBuUfJj2lEAz0heZjK6is80GydHpUch21JIaHFUJFtprV9WG5sss1/kFAzGrh2YpYVZ9o5fSwC8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3628
X-Proofpoint-ORIG-GUID: OgjPQNX-K1SlRnA00wYqOLGys5MgvwoA
X-Proofpoint-GUID: JVF2LcoVkD_1nMadZbDlDOZNjsUz0r3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-13_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109130050
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

* V2:
  - Fixed Ross' comments:
    1) Keep -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON
    2) Avoid "/" in os.path.join()

// Robert

The following changes since commit 50154869b496cf63a4fae2c8278350fcf9a2591d:

  binutils: inherit pkgconfig to address libdebuginfod depdency (2021-09-11 22:36:27 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/test
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/test

Robert Yang (1):
  oeqa/sdk: assimp.py -> cmake.py

 meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{assimp.py => cmake.py} (81%)

-- 
2.31.1

