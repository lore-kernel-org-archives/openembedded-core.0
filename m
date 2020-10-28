Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.43])
 by mx.groups.io with SMTP id smtpd.web09.5873.1603874697618879069
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 01:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=UkdW/tqj;
 spf=pass (domain: windriver.com, ip: 40.107.243.43, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUVRR6rQvUL3IGuEQIQ9h6YL1Jc2Bc6tUyIU0/LwgQBXrhuS8hQOOTnbVb1GkqrSMg57z1xVaora9f9cyYpUI44vXwnW3CPMRYTylC7gAdNHFwaTc3Mxfqehh7klNlJT6uZYaCnYACSSNZ7tkrTL4rZP1hE9Kj5JMrrpd9zG/wVGxaZKBWWPqFWqM7/1Pj6qBKIL15lr0zn1EH9U5AEnqQASI1Bh+TWgrnmutoPzix4sSqg1/aY8OCoSXr2u77HQ4MaQ8++JGcFREyJ5+Tqsbvrnb7L1TNpmtPoJ2XhV9HGVPPbf+PdTpxIRNB51FvP9YLxfU+vR87YvgO1vPUioMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdiMRb8PpRrQalbRjrX/6P0FJiu2c1BKZERD4hS+MHA=;
 b=eZRk8g44OyuxOKR+UQSUA8Wi8+gPGup6h284scNzBA4LNpvzYt21XfmkQXSDZwLjxIXVEmzGVdh9bi/wqJ5a5S4C3Ia1qK6a2aWlb4GD07dp+vFtkeAIMomTb7E9kdQltUovjjGiX7X+ZLcH3HCIt+2SbSTJO02Szmn0Ymr6ZZOU7uOtPupLxbB2dmf1gktMYZK2Y9858vFGMBIYMzo96BRYj8t8s2u/BXbBvR+CfEPjgkwZ91+09v0LcAfs2yuWxx8mLThPSOrCqxX3WmkoMIp1wGef6oAIAyG0DVV+CQ8dAuTk2/HTxecQcAgU9L4XcyiWcpb18KrajEkm+w/Uug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdiMRb8PpRrQalbRjrX/6P0FJiu2c1BKZERD4hS+MHA=;
 b=UkdW/tqjrYkCYxGdFl8pT1vB/H2Tdi8lJBMs3yNhfyJx7uhihz+7PDlzcYPHowZ+gkQr3gSHGfotDZOevWgsQF5m0exjNIOpXwGYOSmUXvAbOISEToLkR0AwsFBiCVA1N1WZMkH4P2yxVbKeta9coODAfsKIQr+35wrhvrGfgCE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3213.namprd11.prod.outlook.com (2603:10b6:805:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 08:44:56 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::7dc6:b76a:9576:a252]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::7dc6:b76a:9576:a252%6]) with mapi id 15.20.3499.019; Wed, 28 Oct 2020
 08:44:56 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] timezone: upgrade to 2020d
Date: Wed, 28 Oct 2020 16:42:48 +0800
Message-Id: <20201028084248.24199-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:203:c9::8) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HKAPR03CA0021.apcprd03.prod.outlook.com (2603:1096:203:c9::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.4 via Frontend Transport; Wed, 28 Oct 2020 08:44:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78fe4a34-d78a-4aa9-0927-08d87b1dbec3
X-MS-TrafficTypeDiagnostic: SN6PR11MB3213:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB3213324B7078AA57377EC2E882170@SN6PR11MB3213.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+W6gB/KunFnXSNsuMb7J3I8rKVg5eUr1P+ePm5hfFCmngHxmrF93ypNPilhHYF7ev6ohcjLJHVm7Q+0mnrjiOuCAoon9vgdHD2JkgXe03v3SGvhJ16LOuzU24edRSoPyPeYmfhbTcOaAbYuZwsvpm+HwkwFSDZO1w9hinQRki7wAwf5pXTlRBGoDotWLFzFR3eaTTmWi+cS1mPf7KVUxo/eN3GJYpM7YXAjbcDlJQvHIM8N7ljcEYt7ikiq4/Zpvd/yxkz7PDi3vAqvBHuOoIdtCizsyWZSXt0gjFQLcLapYe2rvsw2wGEIQixZUarNx43ckr+oVu07BKF+xMWRx9a9YgS/ZXGRSzC/h1ZIwO/BZpargbIqfh9NAajJH6lhut9VHKFJnVJVncpGMq3/Rpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(366004)(8676002)(966005)(8936002)(44832011)(478600001)(6666004)(36756003)(186003)(5660300002)(66946007)(2616005)(16526019)(66476007)(66556008)(956004)(86362001)(6506007)(6916009)(1076003)(6486002)(26005)(52116002)(2906002)(83380400001)(316002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iLKjVJJium24EkIZ5KCk3IrpN1YkyZyqLxKGmSbpSobYSIdEHNU3vMBCQ7WXieM7mcF5svHZfAa/jKc9Z29PSFA1MJLUOMZJq3m+Fezk3tW7AuEkU32XV93GzSFwqsWgyWHpTRawX+zDC3QXpcPUsQ+T/0/JcV0ANFI0mmuBQx3S87Hb/P7QySFajT453SR4euSyt1/IJYnHJncBcqfeYh0bmgtfa2o1/AvQ0AHWU6f90TXta+yMyK8zeqTAvXGEK1acBrMnGosMktfzWct1XnPwcfEPGYlMXodJ6e2rFbIuGWo1403hojQEq2VqAEGc0gZuXeQ11+MQgAKKpEc7FI5xw+6yjoi52bSyNnFRnczB2S4/mEiBkVjPoM/+Gp4VaBTqz3df3t5pygT6lXYDVDxKHNQQ+qqUgdOlZ526b6XdjdQ8vD7KTzhloDKdUxdao/cHHSPd6y8fu0qNFGRiA7FDyenza56OBKf1EcNKr4d+vL8w/0ROhAdkRdh+cwmQaUFs2WIkXhaL8807qjvujzDxp7Y9bzrzVUJVYY3T2i70DEn2s6oNJlbOiVEMcJKz1PdK6EPKZNPUu+S8d+3KVA6vlWZf8EKUujTN6B9S2DumdZ3AgFxxvstezLE622FuQNkd1unLA2zrueunAOyd1w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fe4a34-d78a-4aa9-0927-08d87b1dbec3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 08:44:56.1903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjRO8QLTdf5DTPrftlaIFdmrzRz7Ep25hZaXJS9/49QgePSUVi/2F6ctb0O/9eMqKBrsefmr6/ENUpUnktS7/p+8FJxbPJuusgMjQguk37c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3213
Content-Type: text/plain

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 8eb17c5eaf..5368464f30 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2020b"
+PV = "2020d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,5 +14,5 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "47eff8944de4a64f7629b851e4a32338ab12c9b73edd62063795167ff1fe43da"
-SRC_URI[tzdata.sha256sum] = "9b053f951d245ce89d850b96ee4711d82d833559b1fc96ba19f90bc4d745e809"
+SRC_URI[tzcode.sha256sum] = "6cf050ba28e8053029d3f32d71341d11a794c6b5dd51a77fc769d6dae364fad5"
+SRC_URI[tzdata.sha256sum] = "8d813957de363387696f05af8a8889afa282ab5016a764c701a20758d39cbaf3"
-- 
2.17.1

