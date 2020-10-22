Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.69])
 by mx.groups.io with SMTP id smtpd.web12.9262.1603366939614994686
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2020 04:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FMcPeZIb;
 spf=pass (domain: windriver.com, ip: 40.107.92.69, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bM5l3ZTOmeZoL1/vqlIJT7UD4ZLFIChnGBX5YgOKMDXW3brmVKIiOmnSDDV8akWScQTijCcsSJ/6R3hc9zSyPjmc3Kqz4b07QnvoZneAoVgCLTV6esI7jgpuy5fnitBrydb45RnmqyWiMfGnUZa9FuTNVD/JS21j4XcC5rQxCj4Y1d/DqCUE+sCAVcN3N1KrvzjgfBWkjnmCl4mOIRW+PxCQlcoPFy7J1EmnCh6VWWS6v2glZ1CefKzRLCYzjMouoZ2cEfS5bNO3pSG26Gr6OEUXShRmKWnKKvXZXC9KIjhrQBobvXs75nexRJj6mokU0JF70VueiejuYwI5N6UYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8z5eUwCK/EDRtNt3vhMzj9e/A+xMKy2jMyQGQqPtdNA=;
 b=UGmdG3/nsTnv9A7LpQa5ScvmIwOSBrBCmwed0YJJf185q76guE/i0YHxWbMD4265/XdVfo5r+Bqpox56PfuEveIIGBbp3cp2OOIUO03sx8/9VPgv3ZRg13ArgN+t1Abf23k2pFAiXUGP0wjQNP6SOoZL571A9zuF+TBUFjoXRtbiOEH4PmONLAvk++lT4ZFPuVncYAcc9VEFrQnxJEyVTF1xqq1mhvu1BJTjCpWmP+aLCk9QbvXWMod++8BoOpNZaPVi4vsy0dojlVgX4Ue3Fea+kTkWOBiRBBDILuS6nvza1AYlJOXokzb/+rz5uHh78tSQ5BVirRIEQHpoV8rmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8z5eUwCK/EDRtNt3vhMzj9e/A+xMKy2jMyQGQqPtdNA=;
 b=FMcPeZIb/UVtT9Is5pyywvelx4sbBEfubSqJd/AnyNfxz9AjT+9zfV+YR7a+KsG4ky4vnR8u3ljUeDLQZl6mOjshgpNKVvcG5hCX2RgVBj41mm9cg9yNJcdaMwqgPxLIJ1fL8g833oMSbbEUS/TAyR63Rw2dg/Aj2/Yaq7y8NSY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (2603:10b6:805:d5::13)
 by SN6PR11MB3117.namprd11.prod.outlook.com (2603:10b6:805:d7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Thu, 22 Oct
 2020 11:42:17 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::e0b3:8438:9d91:c16%7]) with mapi id 15.20.3477.029; Thu, 22 Oct 2020
 11:42:17 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] weston: Fix PACKAGECONFIG for remoting
Date: Thu, 22 Oct 2020 19:58:40 +0800
Message-Id: <cover.1603367872.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0067.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::31) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core1.wrs.com (60.247.85.82) by HK0PR01CA0067.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.28 via Frontend Transport; Thu, 22 Oct 2020 11:42:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fad625fc-8f49-44ed-b48e-08d8767f86b9
X-MS-TrafficTypeDiagnostic: SN6PR11MB3117:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3117B425376513A44862CC65FF1D0@SN6PR11MB3117.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:260;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OFK7PhCSHPro/GDdBJg3k4CCLgJuJwtGgeGgiUl6wia6wy2qDvwBpHg9VWH4oe7cEqsSY7411K4zaaYQLt1h3ckXuygJO/FTwLFHIJVlgcy1uJ0Tv2g3H++4TnEgULQJNPaoun8VO2iOTxHqZ8G6ElmMqDpjnxbH32iIbrXnH5xRh3Dg/ctg7eQrBPREmzWTgLf/Iw+FE4qxgDLvahqBhOYmjIk4suRQRuyoCJ/tAR8tTKITlbbC5jTH5v/FKHfXOdHshtsDOLXZnJPYR2uJjovk/S1WaIfXkVlQomP/DEYMDIvncP2U0XuzIgZtaIfGrxrE/FPvZ68P5VyQikFdf/VY1/pKllTtCGHytPZzQd6W6cgwlmFiC3d9yk/xSg8JSucOIQ4JPYMmLpwVYZpvng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(396003)(136003)(8676002)(956004)(316002)(966005)(26005)(2906002)(6506007)(4744005)(16526019)(186003)(2616005)(478600001)(66556008)(6666004)(66946007)(36756003)(66476007)(83380400001)(6512007)(52116002)(8936002)(5660300002)(4001150100001)(6486002)(6916009)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dmBTGXi+yjMTgsytYiULBmmkRAwkJNuFkKRC3fXxfJotezSagqAnm2DsVg+MHFAVkKiFKtvyoSYXvM6LWfkqgy+Qg6sDunKcwwfHg/xFfsQpimPazwzUaRsreWVnnbe0r8Dic3rU/zqTjv7GOZMBY3Y6Gy9F+xwrW/HOy+S9laTyUteHq+qlf6GK+vkwHV0RSTMLPZteoBGt7Xi2AuDX+BgrqNFqdwxJTBgmHnzHyLxCAtHa5SAguGuxl6fUO88ksHJ9t2Wbz6KGmUly+NQMU2D8l/WvvH00yX4z7JNkVzY7VDA4vtzvNAfjcgVb6ZyIPJ9fid4MtPsDEjYYARJhnqwN++2fKK56EVIqQB2uZdt7yx62qOyfygyKOgBxYcEbrHLUN6+EBo5ZRsSiHsNnYGJaTQAFrhAk03DRFKLN1rjGLgjDmt/1h+tJ/M7dKVZxHco7monqhYzHkMO6Tqe+Yj2k6DUGAqMH20D4kNYHEW7yZ6eeZRm1VdHTi+urBuIdaxjsqBfZJafg0CQjIJTR6pjCXOpZAnJO5xOPYpZbKg5IcRmLn9bc2CUf8PA/p6e81oTCwTU4Jbx6/KDbeZY3VF+izJUs5bUHSTDLnYAU1MAgQBt/Ro7ziD7vxbQZV+rnmp50c81LrV3gt0qjLjVpTQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fad625fc-8f49-44ed-b48e-08d8767f86b9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 11:42:17.4511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 46yRhd3HEO3Pv+5/0xop3A18dCIKXayf6qSRzFrbFPUE9jjq+ArelADuJHYGHbilx08peCdGlKIpUubiPcLqahYcJOzgQrX4By9rVKzQly8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3117
Content-Type: text/plain

The following changes since commit ea8ba9a15bcec7f5fbce1f40170298f87a808249:

  build-appliance-image: Update to master head revision (2020-10-20 11:21:50 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/weston
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/weston

Robert Yang (1):
  weston: Fix PACKAGECONFIG for remoting

 meta/recipes-graphics/wayland/weston_9.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.17.1

