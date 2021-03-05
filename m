Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.46])
 by mx.groups.io with SMTP id smtpd.web09.9906.1614939059106987221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 02:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e0u+51wq;
 spf=pass (domain: windriver.com, ip: 40.107.220.46, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPim4xeG2Ymaal5kxxUGJqMLxHJDpSf3bym4IsTFnn5cO3kTrcremOf+HNeL4w4+Y38Fjf0NZJ3JmAoMSGvQPTVIXz0D5OmiKw8KT8WVAH4sSP/KrAxhbooZJivu/jbb3LKHx9NAUv2esbX0CP6lQz6z6Ck5tfokZ9dMOugdvbC9sc/jYLaRBtfdMAkfZvip5owK123SZKOwFND9Wp+6vxtU5jwyM4ZaNAfAY6EAgu5m4LX+YNphHYz6/77HZxQ9KNlE6vZL2sQMcYM+l8vsEkeKLlkciISx1FnzwdqLNme2EHqfpk6R4OVwtVssBQJ4MLI6vHEP7WMA8wsDaDdeMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+l1a9jd7BfDdDmdc7RXxn2cJlFNVh7kZevYEUa80L0=;
 b=nnkRnbYuq8Fj0i8THzGAneZbpe9Rl+4Q7t3tXnRcwbp2CxDWmefkEiZMPaa9RVnNzkKL84fQcTmFMaeiJTyzsWPAHELtum/KD/yZG0yLou7fFwwkLKHebL4q1HGX1+N5oiIrXVBTuzS+5YB8pzYix60mOkCicWD2p0Uj5z+DOKgobB1xWsBEfp4wak/kOVsWUKoi8v9B5pqhwmlPVmZLBapL10M/ZavXCYBIgxVxCeFe3I033mNA4uyia+CUqer4l3JxdAS9681u3Q/VJ8KnoBuGCbN1w6U+qeBUjDbk5raO1TiYjxVT3RVcFmNNSWJg9z3ipkdmFN7JviDKaX05Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E+l1a9jd7BfDdDmdc7RXxn2cJlFNVh7kZevYEUa80L0=;
 b=e0u+51wqLxeg76L5FY4nq7PeMBQ7K1mfn/J7Y9RmEjAIsNN0Da5pJc+Gv3dWFvUapil58E4bY/HM+1eYc4yjGEjJc3ySPeT76bw7H6Gk0MXuKvrNo9VPyx7QF97rDpV11O2gLifgeOSE4gUSYXWDDb7TuMmDO9iLCrtZXcTJ300=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB3061.namprd11.prod.outlook.com (2603:10b6:a03:83::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.24; Fri, 5 Mar
 2021 10:10:57 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::d9b:3f7c:136d:e60%7]) with mapi id 15.20.3890.032; Fri, 5 Mar 2021
 10:10:57 +0000
From: "Chen Qi" <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] populate_sdk_ext: record METADATA_REVISION
Date: Fri,  5 Mar 2021 18:10:40 +0800
Message-Id: <20210305101040.822-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0112.apcprd03.prod.outlook.com
 (2603:1096:203:b0::28) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core3.wrs.com (60.247.85.82) by HK0PR03CA0112.apcprd03.prod.outlook.com (2603:1096:203:b0::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 10:10:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73e63ee9-8554-4bf6-6604-08d8dfbef7cc
X-MS-TrafficTypeDiagnostic: BYAPR11MB3061:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3061BEE09FCE1FC3670D1651ED969@BYAPR11MB3061.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nMSS/XujYWeYqihZ4jomxNcZF5b3BIA1SBi72tl4n0knTPdw51SwpM5Ix335HPguUTQ31w7FVz2ff1gVfnFXdXjcLl8UAcAu5GNJonS9GsydHKr8/qyPsHG/MyOUp1FKUbcLvbS2YZYNOFn9KlnucH3PnveW7dDN+tDyDWzQ4TKaVQFAc3q3t0CT07gkxuFcN3oXqZ+STaArRsByjhrFJ0bmHY5DVkRNJbGAZlqt6UriF6jwn24WOhKG03V0Qx0ehNK5PvQ939LXyvELsqFtQPQS/TA9UB2krVegZQ6kbSsFz9rJV8BzdG4cb17icAfIwpbc68iz3aVcCvciSNt6KzuGZLuDAFRES6PWzsFqt+p3KEMksin8l037wBigW+AbZQlpf7NOOXmYtFlON8sy52Si2UjNbJD0U3YGhfcq8kSt8HoJs1tOAEp8Hm+HagRpcX7yGPntdZx21gvjwQHgAOUYZVn25v1TH3ZsaYcskJte0C8mniivheLmesz8ZOJeHzYcg4R+htJFxUN8hSbNng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(396003)(346002)(376002)(5660300002)(2906002)(66476007)(66556008)(6486002)(8676002)(66946007)(1076003)(52116002)(2616005)(956004)(36756003)(478600001)(316002)(6666004)(8936002)(6916009)(86362001)(186003)(83380400001)(16526019)(26005)(6506007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?L2bm5T6b8/EatuNKAtzt0uJ8/e70vnpEVNW9/HzJzDL0aU83l3Y3kJt1xjwM?=
 =?us-ascii?Q?aPjaxPL8UUZVoVp72hb7u6NTIY4h18yKZCGRkt2Qwoxgz5slN3sPQl/D3RsN?=
 =?us-ascii?Q?I2g/CRSfp//ORZVchIOSrzNqq1EE0CLPD82rF0UB6A0qk1jkeQF0iBCG2Rs8?=
 =?us-ascii?Q?L2sNYNA3nWEr4txENIkRqZYgC444TMhpf94OEhUWaTUNNHrni1VlclDK7El2?=
 =?us-ascii?Q?MigmXtPwVqAODdfkZ9dvwBNipZcY5MTfRpAq41+4vKhmJuHxPuyPjDpjn2Ow?=
 =?us-ascii?Q?rqzt+aPbmELaEX/lvgKmSl95E3kbe6MlR8lGrtZ4Z0ddep4zEDwQwP7Cd3uf?=
 =?us-ascii?Q?AuBR1mXNs19E7YrrrfwZsaNHoUAc3pA+Wef4mstOtPX70AqsIuOsyPdtoEXL?=
 =?us-ascii?Q?JbmSII3Xsj9gOODa+WMIpthLVG93rVvvEeYvxK7QvEOkZsk7MUVaZdvyih3d?=
 =?us-ascii?Q?jB3Lv3yAsmEZemvVRLOGzkBNJ4wY0vNCJ/fw2kl4To8EoCKdfN81pDjuCjoP?=
 =?us-ascii?Q?Eu53LugyaQ2QomOIDjHSxRMA2SHxSe6eSDyHHApvtRMQ3sQ2FZ9+qZOnWKC5?=
 =?us-ascii?Q?Ks7m7L4JI9WeTzG79Z+unhnmG6TNtcokzDXFuS97p1BZVysSnw3uTZuGZ72G?=
 =?us-ascii?Q?OiAQ/xA12PBArbny0Uzs+qWKjccUtqj6JHApS5fswVBTA46xL5fjJXFIyxyd?=
 =?us-ascii?Q?SjROJzD4oLcS/h3QE1RDjsAHRPTedn7PWUoA4fPI4aWgBG6iJa60NbduB1+D?=
 =?us-ascii?Q?S8sTJtfonsohgxD0fZ5VoOLHnWFbWdJYavJBbk5q5kBi/2D12PIkEkNM0Z49?=
 =?us-ascii?Q?E2yQCjwnXXE7Ho8z3l2sQrKlB9zO+Kj9iKGXFpTnjOD41HE43whsnONLhRzm?=
 =?us-ascii?Q?d690W5deAtA1sAGdjV3h5thOhWxek3C7oVxs88l3l28+U1UTKBApQjb/ORbx?=
 =?us-ascii?Q?jMB3J9njuv2FfE5iykGK+BGKoNQZ0kV9brdKLsiYWzslKVOoLGaJR/CiyV/u?=
 =?us-ascii?Q?I6GTHuJ3GKxN+YX05552GIn85JH4EP3N3wonfcviGmrzjmiRmxnRexPh5MPW?=
 =?us-ascii?Q?rF0uUPNVKk5dF7pX3MFzzBe2MF75tgQuyLw9iilB/+e3DfAoQTvINV+cD0Gi?=
 =?us-ascii?Q?iZUZcT7VfoOdbM6qIrm33peLKuDdSSNNl6fXdg9f8YukguwbRKIlpyJ+z2Tj?=
 =?us-ascii?Q?mY75pUpXekkA1Y6wIcrxj7GUIHbzrIFLBn7Qd1wvNDrYTpHj6cAJHmyD4Pv0?=
 =?us-ascii?Q?SL73ZZmp3HSlsRfi/KbcRf3g+uHWTF12nZdDfWcxmY/5ZRdm4PSzVv+Sx+a+?=
 =?us-ascii?Q?4GPTE0nsXeLMH2FIjM41Thdj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e63ee9-8554-4bf6-6604-08d8dfbef7cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 10:10:57.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vq3QXFcERYy9ITW9ofz8kAvKV/Lof8pwdxGNpZzOIo+KdDfKA0y7UV1namNDIM5pMix0nVXUWta0A+MvC4Y8Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3061
Content-Type: text/plain

As we delete the .git/ directory, it's impossible to get METADATA_REVISION
inside eSDK. Because of this, we meet the following warning when installing eSDK.

  WARNING: The base-files:do_install sig is computed to be 16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
  but the sig is locked to 6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in SIGGEN_LOCKEDSIGS_t-qemux86-64

So we record METADATA_REVISION in eSDK generation time to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index e6bf27cf38..9112ab6c5e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -364,6 +364,9 @@ python copy_buildsystem () {
             # Hide the config information from bitbake output (since it's fixed within the SDK)
             f.write('BUILDCFG_HEADER = ""\n\n')
 
+            # Write METADATA_REVISION
+            f.write('METADATA_REVISION = "%s"\n\n' % d.getVar('METADATA_REVISION'))
+
             f.write('# Provide a flag to indicate we are in the EXT_SDK Context\n')
             f.write('WITHIN_EXT_SDK = "1"\n\n')
 
-- 
2.17.1

