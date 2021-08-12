Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29778.1628809193082926453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 15:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fPfYQARw;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3858d7d225=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17CMQ28x011382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 15:59:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FTC9baJ4zqwiqWwCBeyo/jIn3dI4F4Vsc0zZzjEIXNk=;
 b=fPfYQARwYnWdogY4Uq90biXLrHj+9vBTJnGtvjYoT/t0aUp10//cb/pBYgsg3o1R/Txv
 2omEdP4/TSgHlYl//7OxNb2DK1ekzmeOAX865rV68nlH5KoWMScOtCw69goXOIiuSTrF
 O28LaZw+c//W2ijhfCwrnmkCV3CWaj75jBKVIzTsD39rXPkNyAnlKJpAFHtMgXZl7tZV
 0c6Xhrg4w4PkWrQ2//wVI4lAYXSJF0016ViLDC1vB7qI2MykSFAOzKkJ98Ugwmrp6A/k
 k1BTbcDHq/lEq146R2f15OPvAA+2Vx8roWHte/VHytBbWSWok455sq0PkJiEpyy5M4A7 pA== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com with ESMTP id 3acucv0r4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 15:59:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpxBdq4+vEO7A4QCLCTodwNgEqv9rIIyUOY0bb2lOFHDiatZjwt28+eOS3rmEbE+LWwzBKARKXgA51se/YS92YbD7upViZZHjJnCgyNn9GGPP7F8X0ywbtfypHkft5EWRMYsRhDUDZWF2EnhCuUjOwHMIg6FMYl1FePyOC2wTMr6KYfRpbreznCOx+0AWsziXDftrtHqIhhul2vZTLOT6gJop11rZZ6Hc+eySFf8cgiz41Gz3f/uuUVNTJwH04ntdMuRWx5OwQCP2xXY9yjF0L3ElnNgqISrHzxpN2f+fXncumHwKWmlUVwrivI0Rxp2tjdD1fUzdqj8sFob5cn4Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTC9baJ4zqwiqWwCBeyo/jIn3dI4F4Vsc0zZzjEIXNk=;
 b=KE+sN2Aq1ppc52wck1bqPLk7THVOK9eU507AISKUHef3J/vObEqcMI3kk34P+dcaLm+ydsG4ezowL3ZJqS9q929Ru+QSnNihgesP31G6TNjpWLe/adWx0k2FGSYeJe+w1UNm4UeQ0VPc1subv7yKf2EFfieFumNzEiUtsna2wJuDhaVJHMY2/saXwRHhHQw17ouhQZCNcksFILCZFZ5U/SMkMFSPpkMZ1q6FSArTJd2Rv18LdXJ7GzIeWpQeeZrUaIdp33GcfsSZngRsSOkYKzLQO7bshuYOgF7NGamQ9ZEOk/dPDefC2+hHnAMIdjaAqNDHvraisw0qPl0R1envpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2821.namprd11.prod.outlook.com (2603:10b6:a02:c9::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.18; Thu, 12 Aug
 2021 22:59:50 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::b162:e9cc:d6aa:73b4%4]) with mapi id 15.20.4415.017; Thu, 12 Aug 2021
 22:59:50 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] terminal.bbclass: force bash for devshell
Date: Thu, 12 Aug 2021 15:59:31 -0700
Message-Id: <20210812225931.130938-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: SJ0PR13CA0129.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::14) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by SJ0PR13CA0129.namprd13.prod.outlook.com (2603:10b6:a03:2c6::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.8 via Frontend Transport; Thu, 12 Aug 2021 22:59:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5eed2f56-337c-4a32-013b-08d95de4e360
X-MS-TrafficTypeDiagnostic: BYAPR11MB2821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2821D2490235407D86F3705188F99@BYAPR11MB2821.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RKVcdJVIz1z7i9g/V7UvKYFH3CrLnn4lh53boaw8syUsQaWMf4Ylxf5X0RtBfApVM0u0D/o0N8D1/ZWduGcHgnZbbBuGSr4UP3cy2fa5hOvj4ovu1ad5TqlFLaIkwyZvwZUMi1KsFLv8KupB0ojgb41dDkxiBiO+KRWRLCajrGwYRU+PpA2iGMSR1M1NsonkYqooTitV21mpo/3k1B/d1JsuVe10zaN/Ttw/xush7OU36w9NvGOvCHo0OFMbiKXaC1wqYbuk12MzFGMpKlsykk2cvf6rWgM67IL+yUu4gW3KUBALot6N7Bt/95vw9oZKceRPtIIOFB74WlQcUg8dacHq54sg8r/aoNVbcChHOOpEVa3hhGSMb8D4WSdl9yuIGNvM5tYn6nCyPOI4AGxhD1srK/331CwLvvP5pTArNIgUHT26hlkYdBL6f8wv5gHSkna8KKc086bnvTw15MUw53wupr+uVBph9fwYURcIBoDvqNr6gUx25gAYNer66m8TLpc+rWPsE5iCHatJWijTCpu3O+YVOf8RCsR1Crdnwqk3lVhCdEWvIqBlpsMqjzHk6J7bCd/XMEG5PikfsTyQpHyJBbSFSnBu0VkqKWITW27ujZplUYyTmaH1RY9SJjwXTULsBtC9rRp89bFVW6TZNqctnY7f2o+NPUKSeGjZm4k+T0RI3czzBY6M/u13qLHMDeQ84qmWvow+ZbaOoATqKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(346002)(39850400004)(396003)(36756003)(316002)(83380400001)(6916009)(38100700002)(38350700002)(186003)(6486002)(86362001)(5660300002)(52116002)(8676002)(6666004)(44832011)(6512007)(1076003)(66946007)(66556008)(66476007)(6506007)(4326008)(26005)(8936002)(956004)(2616005)(478600001)(2906002)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4xe5wj7no1Zo3Aamo2BzH7Cxn3i9/7C6/yE9cuVxV8HhLMmCXb5/QMWiGesX?=
 =?us-ascii?Q?/Jl2RVy2QT5RTuGdfpD8tDUWRQUIcMredoCcwx9uDGucR6dFWXjutteKX0L0?=
 =?us-ascii?Q?vg8XlnzlylNy3bAz6igmAHnYEt4BcfpwZ0zSA9qb/p8TvVPPxWhJMZ0n38St?=
 =?us-ascii?Q?3LdafW5PgKDp1toVB54SnUp7VvbX8q/cEOOpBHUBPuFJ0v86kQofigoz2DDu?=
 =?us-ascii?Q?a8PHtGQve1rf8y5IJJGeVMgfEgB0SxvIHDM9q44rR2rX4y8CHg0oymu5JW4n?=
 =?us-ascii?Q?2ZN+x01RkrBwa+bJPjIRrKRzGqRVB9/+GPVIBAJzlHrwdTRmWNrzHX7oG49n?=
 =?us-ascii?Q?zyaIGl8TC2VewJQS89S+UJSZWJoMSk5MJKh4RCykZXPyZUjoG5dVk1XFa/Je?=
 =?us-ascii?Q?FCJVVAFdtocYn7jYmXSFDi0CGmDZQJIN0t5JESsCCxWHb5yYRy7b7wiBJ0mx?=
 =?us-ascii?Q?9AhYNp71ir9CwRIT2kHPkPfB6SAZPLXAkbcxxBGSAcVf6iyC4PRJRRosxh5G?=
 =?us-ascii?Q?UOZofdZRufdm0OURRXt6yFLM3dvFZmPRxikDveUv0wJnBdyCSbNuLqfCJp5E?=
 =?us-ascii?Q?5SRbobNgPjZUX/XVxjQkoAta+9fuPUZXHMxM2/Y0Y872BjvC3eqtnYozQTyB?=
 =?us-ascii?Q?FkOqugIZbKGKZjDqes6d669GanXTpowEayzahP2yo/knRjxZe/t5/ioaCUk8?=
 =?us-ascii?Q?0dctfa3FY5oHoLaXXH1dw4oItiWfpttiQ1zwXpIn+maC3Tx7pwpBCAu/Kl3f?=
 =?us-ascii?Q?uKH/jbu9P7ICM8JzCGX8xHPtJRWQ7ucpCCfhvXnpINOvJv10qX/K01lBDMrb?=
 =?us-ascii?Q?3fp08QfqrjFUfPwXjlnbOz5dWZFV6TTIEuInaoKpsGvs12n2eRUExAk7jMYn?=
 =?us-ascii?Q?PkvYPITtjb1YUgWf/YOibY4y5O7j4QoQMRJyXFvumsFWOdfNx4AsyUanBXjO?=
 =?us-ascii?Q?HqdGiMLO3BQztS17aYbreY9rYBgWebqyu88AEjyGEaNQNR8WDk2fAcRFQs9/?=
 =?us-ascii?Q?KC9peXgjhr5X0VhwzSCY+cLIyu7qNjwjvuZGies3VqC4UkFJFRopthlOkBcB?=
 =?us-ascii?Q?J7ZViqM4jK2leYMsyxsk1KZmsP2meybgGVwBOb4IQ3YIS9oiy3+OqPSitj1n?=
 =?us-ascii?Q?QDRYRJ5QSFVjXGWpQQeJeDqme4SgRy/D3/B+JGv+ZVwaJbkO/Ywy4Vl6KOU+?=
 =?us-ascii?Q?As+73GxqFdj2njV6NQD1UW0GVt1kdtYDJ3aeHB5yM2jPoHmaGD1ITrjX56S6?=
 =?us-ascii?Q?BRSAhnBlP1J8iijBxX90lC8DUqlM1V60Y5DVwzFabE+0aOjoYb5+g9M9tQnh?=
 =?us-ascii?Q?sKvyQAKvlRkGq5tPCD3rb3jd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eed2f56-337c-4a32-013b-08d95de4e360
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2021 22:59:49.9831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ff6a9xYr28I1q8kpLzdHS7EDXFWEr7UM52N1tgslvkyevVNm/DPRDvAWvCCBlhGXc3AhyQrEVKSZmjRXU2Vy/kJAUX0eIUWrDez7GXQotnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2821
X-Proofpoint-GUID: 6JWrWPgF8FCWHdypA1QTktpQZdtm3OtX
X-Proofpoint-ORIG-GUID: 6JWrWPgF8FCWHdypA1QTktpQZdtm3OtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-12_06,2021-08-12_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 mlxlogscore=816 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108120145
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since shell_trap_code in build.py sets /bin/sh as the interpreter
we will die a silent death if our environment contains things like
"export -f bodilyfunction" and /bin/sh is really /bin/dash.

Fixes this for the case of devshell.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta/classes/terminal.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/terminal.bbclass b/meta/classes/terminal.bbclass
index 6059ae95e0..a564ee7494 100644
--- a/meta/classes/terminal.bbclass
+++ b/meta/classes/terminal.bbclass
@@ -26,6 +26,9 @@ def emit_terminal_func(command, envdata, d):
     bb.utils.mkdirhier(os.path.dirname(runfile))
 
     with open(runfile, 'w') as script:
+        # Override the shell shell_trap_code specifies.
+        # If our shell is bash, we might well face silent death.
+        script.write("#!/bin/bash\n")
         script.write(bb.build.shell_trap_code())
         bb.data.emit_func(cmd_func, script, envdata)
         script.write(cmd_func)
@@ -37,7 +40,7 @@ def emit_terminal_func(command, envdata, d):
 def oe_terminal(command, title, d):
     import oe.data
     import oe.terminal
-
+    
     envdata = bb.data.init()
 
     for v in os.environ:
-- 
2.25.1

