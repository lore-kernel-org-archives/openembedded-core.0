Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.82])
 by mx.groups.io with SMTP id smtpd.web10.3483.1615452390900489360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 00:46:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Wzuh30DS;
 spf=pass (domain: windriver.com, ip: 40.107.236.82, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BMWFYhSWedylgLVQ5DQFnZAZaPPxvMCsJhG/qGtxusCttLycO6MSmgYSvoGuafBueWhmC2bmN9Yiut2oF97IbOv/ZWCBxju/sQQJTQzEWHTrZAQK9kFU0HXACb3qpFy/2q/uY/WyBLn7dC5eOfsuqClVuzhtBJdGcqPMUL5TpN614wF1i9+UrUC2yWoqHQafCHJ5XZDLNF6sLGKWvZ0Bm0ccYB82KPoekoCrO+9zmPoWRCXE0OjjCK4SLy1sCI0EDDwHsjT7W7ryurP48zcyyLH84TCJwx/a4pKS+5WzvPC5Fm6Bx9kxYvZ6uA5weDyqgZuScU69PtNxgOsnod7lOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU3WF/v5BhV/amoaoG8XM7ATIzM1G1itKAAVqksiCyA=;
 b=XILVMKeAtTddStO0xCVaoY3y5TxLKA8w4rv5M/Sgd7mwK3z9EliSYsQumahoWWuXqm4f4kPir7QUMmWrY7J9CUA/EulECVQkAMrEvAmkivW50IdjWhKtlm6//oTU3dQiAao4OHOn5n+Z8AGVJCCFMqM57PQuLFDeQR3qwFFxsZZSptUgz1JDDSiYt5I9rGtEc8onwCmxEX/kXZsWQbym6/SUeSCMNtlIdlSxGbXrXwkueFSCcT7KI+mPQ2rVfDm6P8vWxUVfsE4lOtlt273OpFKqQGfLDSmd4A77l+4wFM2boQBbvsAN+Q5p5s5R/53Q90eJFe6OUVb/q8ht7xf+Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU3WF/v5BhV/amoaoG8XM7ATIzM1G1itKAAVqksiCyA=;
 b=Wzuh30DSIa53ZlxCA66psIAV1YyBTSKtEFqCiGMQCjdZhg4S7oyGg36XxJ+nCL2Fj+aCwRm6OQbnQS02ZiEFMPzvBZ/Q8Ai/YuXnEwMqvGSgIiEZL1Yxye4iVhdDuVAE1nmKuTg94x+v6VWInkCMZujKQaSsN6O8BlY5nWzyK74=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3736.namprd11.prod.outlook.com (2603:10b6:a03:f6::10)
 by SJ0PR11MB5040.namprd11.prod.outlook.com (2603:10b6:a03:2d6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 11 Mar
 2021 08:46:28 +0000
Received: from BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9]) by BYAPR11MB3736.namprd11.prod.outlook.com
 ([fe80::dcc7:5da3:6cfe:b3d9%7]) with mapi id 15.20.3890.041; Thu, 11 Mar 2021
 08:46:28 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] image.bbclass: deltask do_packagedata
Date: Thu, 11 Mar 2021 00:46:21 -0800
Message-Id: <cover.1615452338.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BYAPR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:a03:100::28) To BYAPR11MB3736.namprd11.prod.outlook.com
 (2603:10b6:a03:f6::10)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 11 Mar 2021 08:46:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a92fe4f-bef9-4dd8-79da-08d8e46a2958
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5040:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5040DD0400B8008ED3D05BC5FF909@SJ0PR11MB5040.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:425;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2rEyRMlKJBu/yxLGwQo8qcm+pK1rTd+TBV5/HMvgbZzwmGjGN5j5JEsmHRl3935MeP4yHbaWLwMDQKLJyiNebiJJkHXBgERGTp+60LYEnoO23b8XH5MHZC3nRIHKZdjELSUnDF3fAwm2G4Rb62ulek1Vqic7p6d+cBZwZQFC3CeWOWsoXs2htqNnzARY5dxsbdFnQsmGsDtXsu5uOu615+hb2yFQzMUW0wvGYniSH2lwBGkjsuKBTt3ngDOhAEb9K6xlNQ7b9NVo6N1ZAUlnjXgp1bLRSfA7vsKESlKqzDJ4uG15uzf/CqWVg122mKprqjqyQnP4U2VPNmBi3qzUFwSeA/+x1f1aCTEs2JDTugrkhRhSTtIUne6Ff3CiOGrmTZ7v1DqueXKpHJXl63Nx5uJ+7OjlVnZ8tJSIbZJBYbspsyRV5AcDmS2i6pqzmCy1/4/InJVNztjivK9wS6fHi614DP5EwpakXACRr+SLezDsED2IoSRBq4wkdeTx12EeWV4yNi/nnuyuHP9wHRYJe/a1coZ4JDQ3lwla4x3itBTc6liDB0aEUapBPSkfWu0+ifgHu4A8iiSh9gKGsLaijrNcglOhNq1HWcvdZ98znt0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3736.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(36756003)(8676002)(8936002)(478600001)(6512007)(5660300002)(956004)(4744005)(66556008)(6916009)(966005)(66476007)(6666004)(2616005)(6486002)(86362001)(316002)(52116002)(66946007)(6506007)(16526019)(26005)(83380400001)(2906002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?We1TE9KHF7ba5CP86kk4A5MpEM++nrz/IE2+oAIlGCS8XJs9IwyoRHFtpcjV?=
 =?us-ascii?Q?AP7+cI4CreK1TrR8GqksOl2Da55LR6WlHId2/ujh4tUxLFN5rnwMRC4z6XfW?=
 =?us-ascii?Q?ymUMD9jN0dJ2yXh7KG+i+R0sclsG3xXfoosjNaA/dIcnbJFJnVuaaaD7Cy1p?=
 =?us-ascii?Q?eEjGvUCk4D7DXtNSrrbhdV5QaysEwcMfSau0A7ILIy+AYFBlhOd84OQ6YM+7?=
 =?us-ascii?Q?JIfSMXigGeXFRxa8kx7tgB1dMhBFcUCzqCAr49oHxxxPVqdUDTmA1Jc5tqIr?=
 =?us-ascii?Q?glRi5uJg0ZWXkKb7jsGuLb2BXZ2xu3SFrBzK/cd0T5FvqsPOvAZd7MSyEgXK?=
 =?us-ascii?Q?f+X4kSkg5dZXxH+/jilkUWKWTq1lwTQMVKiDNg+n6sU+Vq0jhMDeaKmDQIl/?=
 =?us-ascii?Q?t1c32p0zbCmER4TtDOr8AATZsrdDw8EU3vAfEiTbBHsnwfspZcs9QjjVInTO?=
 =?us-ascii?Q?lwjDenkcf/wHJ4a0fcliQXkLuxwQB5RQDtdJac5945+OYZ2cr0ZRIDKj5Env?=
 =?us-ascii?Q?Q6uKkwPRK3iQEJKROjiLfVCgWHyWo9fWXT987JNjLUEdRKAIwW6ZpQjumGcj?=
 =?us-ascii?Q?hanEtVPzu0JeTIgS1omjuyhbOZdUWjwrrSbaYx1OS0azpzkz0tFK88VzxoGz?=
 =?us-ascii?Q?vLoTRshOlMUtdCNekae2J6BptwQsEq+WNIVbmhPE2ieatCkNSTBux6buuJVK?=
 =?us-ascii?Q?Xm9zdWITuk2nd9a69yMgqpBzE0eN3Yc8tJfOP9yEfE61kNloRRyvK7shRMOy?=
 =?us-ascii?Q?lvWWLlyupBZKFEUiEm3qxLdoQpRVzgvQ2V9kWddG0dYC0IJEY7SFImTaVFi/?=
 =?us-ascii?Q?zHA9/yc0Px0iv6lI8fXtT7pAGo+blJTCUYs71colhOKLc41JOcFo5s6Zilm0?=
 =?us-ascii?Q?esHC35tEdEr1DoAbOCZoRMoFufz0YwgZ4FjUbSWuTW1dQ5Zl4W4RqUX98WCb?=
 =?us-ascii?Q?ru2D1Kt0gd5D4794Tdl/VJBHlOvCPQtcNjhkGOLTzCfkjAAkl1UwH9XWClZn?=
 =?us-ascii?Q?0WaEs2pKxljfEb8WuHOWRaQDJqXBPPx57wv1eIWl5zsTCMfI5a97uqhoprjL?=
 =?us-ascii?Q?iMLK4mrDssOV2DhARgD1zzddBmd73A7gjGk+1p6ttoHOwJwNRkSJ+C9yEI7b?=
 =?us-ascii?Q?2C8Jiws1qfLb++c8fTfme0+Mti74ed7ngh951b3yBJXBRM8ln3uZL66n25sM?=
 =?us-ascii?Q?+eyhlcWhdNq1J1A9VHQ9/BuxuDuXVxxZuOySgokAHvfjmi6ZNRvzVs6WToc9?=
 =?us-ascii?Q?+aZrUmH3LEKEDJi6+U9F56CRWLoOdkF6ZMXYqJ1d27VyyNVdaoM8nj0SuCRZ?=
 =?us-ascii?Q?pDf9SLNr5uYjmLmMuB1lbwRa?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a92fe4f-bef9-4dd8-79da-08d8e46a2958
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3736.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2021 08:46:28.5485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yw3tgsms8L73DYtd2GkJ69KuulkFXWbgpY/mk+SIl8jhCzc+ybdbSMUQrF9VGIqJIO0vIQ3QUae9S1TwrPLEF9eeOfWK2Djt1NSVgDwfMYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5040
Content-Type: text/plain

The following changes since commit b27bff26a9640dfdfba4fc711a9b28acb4501d2b:

  sstate-diff-machines.sh: support rpm, deb and tar package types in analysis (2021-03-10 10:29:44 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/image
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/image

Robert Yang (1):
  image.bbclass: deltask do_packagedata

 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

