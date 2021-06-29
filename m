Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.9410.1624978638983524206
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 07:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=byR7bqzm;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=281492f5e1=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15TEo4KZ014342
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:18 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 39g5a800uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 07:57:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSRmME+1wkbD+6hc67UjRUrw4d6aANJlSnf8OSSy7K5A2vGT6JanoQjuaRlI6rNX2r/Mf1TbyW2pEm20x3zeCv9CyOMmRo/JEU0g5KMt2J8ux8DyVrT+SYDBWFmYhtdYzlZ33ny5sverjOdIQxYflmx3wgVZR2hcecOMFsDXOSr/YotIVPtwB4yfNBdVY9OwlyJQCXfEuFFRMnOIP6pKpHd0NFMxX0LXmLcqnimZFOq6zIIQUsUqsdXlkgkXjCtuAlBEBmvxHMGpqNpRnNEuDy2bdg9Cai0NF2ixdhu7ztcZe8RNgvKnalsPGsEjuVESf3XT1QCJwTJ904uP5yIuPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTfT50+nOZiGgDB9oWP+kxfNCT/InLv0taIBM4iP8Fk=;
 b=JqjfZK0Ap7ltpURRSpDr6QtqD5G5afrXiZWjEbK9JyCbiCYR2C/shiItEkQ5+RuA57PCDk+rT1JpfG1sAdRS2C4irUJh+0+Yow/f2iGzcfsI2HZPz/DIgLnLu4ajXGaWdkUt765l2VBW13asUcL8l4FvfVpaH1jWEIQ0NIJoSYGbLi+Twl+eNRABI4Plea9bTReXu3Pu+ibGz0wLNhoM6n6hiUqsOUKBJ06hGHCd7l0U2fNpwXMxa7MrId3NuRBJ1g/W3NjQyVallVsPpIQZfTr5XtHuPWbpAKR9vKcsqGghejo1pJHWXai2hCjJpCFq4legibYgp4dUDnvH+ICQzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bTfT50+nOZiGgDB9oWP+kxfNCT/InLv0taIBM4iP8Fk=;
 b=byR7bqzmBNR3jDWGljmRR+2NGPgR0aEc17dGwkmAkLe4z+0P9tCG5nGUO2UA6+OM4qhdOjQf7VPDom0u4Qby0gtWGMY17g4jDq3aDAZG0255d2LPAB2i4vLo9ZSWPdygXxW1SVaV3RoWVW0Ig3oAd4oJGD010vtlL81g5HPzHJ8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Tue, 29 Jun
 2021 14:57:13 +0000
Received: from SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e]) by SJ0PR11MB5085.namprd11.prod.outlook.com
 ([fe80::c0d8:4c7e:53dd:6b1e%7]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 14:57:13 +0000
From: "Saul Wold" <Saul.Wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/qemurunner: add support qmp cmd args
Date: Tue, 29 Jun 2021 07:57:01 -0700
Message-Id: <20210629145703.979269-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [71.238.119.71]
X-ClientProxiedBy: MW2PR2101CA0013.namprd21.prod.outlook.com
 (2603:10b6:302:1::26) To SJ0PR11MB5085.namprd11.prod.outlook.com
 (2603:10b6:a03:2db::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yocto-hs.bigsur.com.bigsur.com (71.238.119.71) by MW2PR2101CA0013.namprd21.prod.outlook.com (2603:10b6:302:1::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.4 via Frontend Transport; Tue, 29 Jun 2021 14:57:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e52c735-fae7-4218-6f61-08d93b0e2d7a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4401:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4401FCE709EFACF35A6358CBEE029@BY5PR11MB4401.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jWgcmg7swzOh2p05plu7+PcfY/R2Z5b2qxjseZHRMOVHfv6lLsG9ZfUmEUV4iF9YMMLXgssLnlF5u0M58uzTjnxZePuvcH5DIaUDp4+Ks1jrp/TyJCBBX0noV/L3YbrBAziUfwod2Qc87ZTSmxAZAw1EUZnV2kX2EOaKnxoz/WG9a4q36IOwFCBpQl7ZVnGTHWS5ZxsckB1T7kUQ0bOYa6Yjp3ZG14AJX3NVEnwMVh3VuabMeo5hWYJfld5uZsJ9uC4IpTnFUlnVw65BbPckpT4KaQJUP85qkSE9X91Ch3ngVStbT69/cmE4FTY3v0E+V2d1yF4fEXBZLLWyl2hr9rmZXQF+JnQdXZc9IPcpTGjWf6flENp2Iwouep1C/ZGkyvXwqtTsN/iJLVBBDo1vpZPyQtG62sF/ETdpSrdGnlDw2iRbo304vyG8PTYC871NTPIFP1xqjKPNQGrIt3aZ2faJ1BSCMeACdsup7AWKeB/nGtqkN3KzHrLlnnY0uxWOdVy6/WCV1n7Pa2z/4fOniOSrQuYP8t8H4oApXAzLrpHezqw+xeu6orL6lfPicZLhwFngTav6+9ad8oqGLcw9W1sHaAj/U+3vmzKpl9fM+IPRl36vNpcNZx+vcSxUk47YCMJQEyPSHpA2mXOyAdcVKZjtpGRL0pykxhKJltmWZ6FzUtNFSsguYNT/3/JgH2Pf9sEyLJCOfDcwmptlrlJhew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5085.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(39850400004)(376002)(346002)(366004)(8936002)(316002)(6512007)(6916009)(38350700002)(186003)(86362001)(26005)(83380400001)(38100700002)(4744005)(52116002)(6486002)(956004)(6506007)(66946007)(8676002)(1076003)(66476007)(5660300002)(2906002)(16526019)(36756003)(6666004)(2616005)(66556008)(478600001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mfm8atq3X/UbPt3DIFDYcvsCGD4ydXNbmsKKi3zlmVvRT4ssc+IBKKqscbz4?=
 =?us-ascii?Q?uR6WQbjiNQy3yckO7JPDPIyOnHMNfva+SDk+VxF09VW/G+qLHNlAcfxLTik8?=
 =?us-ascii?Q?rkQMTD/RhKcQb4Adz89MapDpbK79ZX3KK68MwUUUSlUnaR2UUvuh8jQPNDWt?=
 =?us-ascii?Q?ickbV6boTUewVaMowcBznJXr2reJV5vnaF8y93wFSLGL7uoFlZ40+chHtXZx?=
 =?us-ascii?Q?0cLZ9DO9AcZgRIbult/gfenq0K4Gap0tGTJiyyuP9XUkhZa764LZ39mb+5xd?=
 =?us-ascii?Q?XDOm5vdiOa+hlN+ILrpefXPVPid5Go8nWTvSCnEJ8gdNsfaDbK6781KQTe9d?=
 =?us-ascii?Q?4WzFtjIgeVAlNEztAEJCixjdkYhCJKe/VGmCFTOBADwFdKl3e4qFPb0ULC76?=
 =?us-ascii?Q?yaAHUfjDqiNU9ICQyzuaossx73Vf0yLUsIWkmYcFiY4d52fvWCW7GbiPQP6k?=
 =?us-ascii?Q?xKOXaNq58cSKC6BEjyfqtUNOweq7g0/P462c5FqnpKtM3orgeqwOpxCnFoh1?=
 =?us-ascii?Q?RsuVJ9H+Atyuxyo1LEBL3VfmVH5AT3VM5CLlL0zCxNb4yo4QldH1jfr70JK9?=
 =?us-ascii?Q?jj8iMbR+HXnmR/a9dRoQEexMgFKJegsPLxwYKDw+LirNVNt5wDCbFClrx6g4?=
 =?us-ascii?Q?Cmjvk/cGEzvgArdBbF+nZZ3XPAw067HK/4kMDsdIUGoIIzGvMPVzuIaPm0im?=
 =?us-ascii?Q?Lb+vB80NpS44OKPMY08ynL+NugwbU8t9Pafkuf5WY2ATHNAk29acI4VJSIcf?=
 =?us-ascii?Q?Y6zc9xWOopSh+Hkc1Aj86NuAmyfKyH9YWq6dijLoOVJzglwB4m3uo+HChVVq?=
 =?us-ascii?Q?7Zd6W9tnBy7pzzo1L8Ob0DpnRg0zO8JwZXSSjWPgIHBdV6MgYE4MViK+DGGX?=
 =?us-ascii?Q?1R0wNThB5hCd0LnuhxZsfbKFhl82+Bg1dvnxITP3vAles9Gp+I0FOO5MDGPl?=
 =?us-ascii?Q?cMLmNoj9KXg12/RVM4tm4yrgRpAy62GyEhCxyl6AhZoXKyKveqUuZYMNF/xu?=
 =?us-ascii?Q?EIKtcHlnSbgLt0UW3dMzNayM9k/uBFXoLGGGMD6tWh39ZC73Ia7W7JCqIgjJ?=
 =?us-ascii?Q?tdOyjM4Klnvhf8IOBrN+YR4lj/PedMUNYmWJngzXv8wyoo7BgXLGf81vgXj3?=
 =?us-ascii?Q?0dAlQZ+Rw38r2QGYDzYW2OYbNnp/o9IFbPWUquBEZUL/IIuA3PT+CIWmqEY7?=
 =?us-ascii?Q?Z851+bpBTj9tFb88MDnW0CXr3iuhIqbcYO9l9le6TfGCjHzPThVKKaPn+HGO?=
 =?us-ascii?Q?EG7/wHMKMyd2wa6eTaiCdb2+RX5IWZV+D+DTWy3EVYv70+6dgBM8DCctJs7K?=
 =?us-ascii?Q?ECnUVZutZAkJJIWPmcic2zbw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e52c735-fae7-4218-6f61-08d93b0e2d7a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5085.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 14:57:13.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sw5I8n0cjKvyqPyamhc+EputKAZWEBvaAZPjuFoTHCKYSkDNctuda6Ng7wTSB22pzCdH0+OSE4iZeLbtC3Tsyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-Proofpoint-GUID: xSPIWP_ccXZyasKYxC3yNo39tt5Cz-HK
X-Proofpoint-ORIG-GUID: xSPIWP_ccXZyasKYxC3yNo39tt5Cz-HK
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-29_07:2021-06-29,2021-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106290097
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will enable passing arguments to qmp commands for
those that require additional information

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c7f78603179..10c54d6afab 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -602,8 +602,12 @@ class QemuRunner:
                         return True
         return False
 
-    def run_monitor(self, command, timeout=60):
-        return self.qmp.cmd(command)
+    def run_monitor(self, command, args=None, timeout=60):
+        if hasattr(self, 'qmp') and self.qmp:
+            if args is not None:
+                return self.qmp.cmd(command, args)
+            else:
+                return self.qmp.cmd(command)
 
     def run_serial(self, command, raw=False, timeout=60):
         # We assume target system have echo to get command status
-- 
2.25.1

