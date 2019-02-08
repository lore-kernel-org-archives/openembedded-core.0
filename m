Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790045.outbound.protection.outlook.com [40.107.79.45])
	by mail.openembedded.org (Postfix) with ESMTP id 125EA6BDDC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 08:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=YjBhRPgTTO1Op5P+y1V9bURqzhOubFbzaJbZMRHp7Aw=;
	b=t7gZlAuslHc/sA+IPuGaMJl/Amz7AWqEWlotCZ1GvkaB8s+P8+WwEy9547i6Sj4Wx4ny/tPFbPb2FYW+YcYhP6kd7QSVvUdz41WqS8DcaXOI+mD+DZGjxJcK9ES128+eh+6pJGtzH0zTokfcr82iEZY9E92jwtoFeYhZK6CMjiQ=
Received: from CY4PR02CA0022.namprd02.prod.outlook.com (2603:10b6:903:18::32)
	by BN7PR02MB5009.namprd02.prod.outlook.com (2603:10b6:408:21::18)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1601.17;
	Fri, 8 Feb 2019 01:57:50 +0000
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by CY4PR02CA0022.outlook.office365.com
	(2603:10b6:903:18::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1601.17 via
	Frontend Transport; Fri, 8 Feb 2019 01:57:49 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT048.mail.protection.outlook.com (10.152.76.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 8 Feb 2019 01:57:49 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grvQK-0003KY-RA
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2019 17:57:48 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1grvQF-0006gB-Mz
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2019 17:57:43 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x181vYXG029706; Thu, 7 Feb 2019 17:57:34 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1grvQ6-0006cs-20; Thu, 07 Feb 2019 17:57:34 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Feb 2019 17:57:32 -0800
Message-ID: <1549591052-12688-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(136003)(396003)(346002)(2980300002)(189003)(199004)(48376002)(8936002)(426003)(106466001)(2616005)(63266004)(2351001)(16586007)(106002)(126002)(486006)(54906003)(6916009)(476003)(50466002)(305945005)(9786002)(8676002)(4326008)(478600001)(316002)(81156014)(81166006)(36756003)(77096007)(107886003)(47776003)(26005)(36386004)(14444005)(356004)(2906002)(7696005)(51416003)(186003)(336012)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN7PR02MB5009; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT048;
	1:H+L1hr1UlQTFtJTPcTEih0E5veo9UlYadt8fiDtscApyGjEQ/S+6oRZy025UKUdnDqBud5X1X6CG7O0Ew8eh/4G90dJMttzTIoaZAcgUYproAqtzzJLxG5+ILVg434G1E0O77Tsln0mLua3w6lgUMo4OXm2cT8MUYP1VnkEZ+m4=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fb9a088-8b22-4180-a87e-08d68d68d444
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BN7PR02MB5009; 
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5009;
	3:gr8M83D/6w6esST9FYwQvwuT5cDGQh/j0fqWsTwH5ltLmsUTrudnMupUx42iZPs+PQR77u9Ddy4wTlYm1iLeklk6ZaZBCF45Ghpvx0b2LUvuli9DfgGhQbl/rfnbpgqyZetm+DlPOUB8BxJGdVRldUnF9vvIRXjDX9mOgIVgI3927gPn01+1gF4BwXYLHPti4lmoOCtcsGe3UfJ1Kp53dL8WC5lo2XOhVEEj4y73q/VPQ8WlEm6bcE8j4eZy9+nFktTLW0y1O4G7CN3NdsQdzS1IuVtRVVIo3Q+8vgHsSomZ+YzKSArUSRiYwymUwCPc+Hzki8hSsnc4X8qkUMNYRS86f3mpEdgSmfcsfh/1LYPu5Ib9WVTZo2F5j8yacb/h;
	25:U18TJGsCL7eqeeDOYj7eZVCl7NzKnG54D/PEExa7q+TmntV/JYcG5XBwu9anPhaqPefa1fuENuqS+pHphgFI4SRHkzr9AHC3CbbmDYm1sUYPsKbDatVXVXpO/QqkjPeLnTZ39F7psED/9QVhMFLcYydAf97ICPlIm2lCmSqNacgOw8n8gqZVbznYtrbPnTwQL8zwtAoDqJQ4AVxq6FkUwI1Lna9OWuovw8trYHdeBuS7h+/i9k9XKylRjAimYIXHh6HViaSw8UXtVN60y9Bo0Ly25Wx7oBH0ZSQ01IqQ1zAZ/LbZphsgVyRmClSBiSCvTfquJ4yxK+OND5PAJQRvDw==
X-MS-TrafficTypeDiagnostic: BN7PR02MB5009:|BN7PR02MB5009:
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5009;
	31:7Ax9GBnAU8RSUndSSA68PgjimoEer3zYrcozPKONZngBMTK1AW3wUZ6CQwmOo5tOiTksheRxpf2o5wMH98LEdsBYjaGo2s1idTGLCLSdqC440DAUuZboKX11dna1m0AfjgVmdwdHmKK8KwYFQPGR4VnchbSl2SEDmfYcZvzstLRN1lo5Ij/eHIKYr8fu0gccU8c7BuW/RuOxrHfbQRw2xtufTNDZOGlPCLA55OodVcw=;
	20:QbOpkzt+dBFzIXBRnkP9BUqlg/0yv5EWI5c32wdstMveja7wolHuWZDQIsb3aoBqA1ITpkhkeXv5g7sghIUIMTEHc/xcG48Arswl//k7JtPidBloM/B5OSCNGHWpCFRKex6t0ftuAaeHCJTvXOAJtJKFb60THRIKcnAz/74Iv9A/Y7E0jffxWChuGkZn1t8cFtazfVjfDCKnefSULgAyJlxaHAQc0r5eKuAmcgQUPV8EdqhscS0u6dfMeajRXYDP6BlBntD1MLLrMaLiVX+YP50H+UvYdrxe7Fqzppo3rFqssIiFX0uumV9w1SCg1ChiDAD7O9rFnva7r9RwzskTx7FaeuBvLU2nQ5qpNDbndzeYgrylUh55KgEDp/knq7x5ogIVezoStmXeSCRL1Vp52cAwxGUOHIn2y4ZSAxXhY5DHRBPl9ZqVXJ4h5n73dTKA/rHH54AK89EF0OHB8oXhm++0pHurEoEQy1aR3fKwpCyf3P3ylTQtC2DZTTsVY3ht
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BN7PR02MB50090BE9E8FBCDE038B6F4ABB0690@BN7PR02MB5009.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5009;
	4:JpXnNUJtlutT5gAcnQi9z2z6A3PzErkvCDZlnfjs1pzdadmIo4dBP271BUtjGcn2LD3s2SRcWXx0w730b1mZxPQcULMW+DQoMP/udROEWU6wp9ddnyIQfqlX2DPaQ16sFctogMw0YIVBnnR5EWHWmJnTYWHDVPUCa536ANvSXYmMNZfeFD21dHVDn2eZ4YtLaGFS3aRumCD834o19TbrVWO0aJKMVTOry4mJW1YKusI5jH7nAMKY9pR82MGlN+6mZP+l+KH7JHJayml0X3EGxJ8nsey47D1S8xJDhY+58NrQHFADK4IqnVuY+lw3ByXA
X-Forefront-PRVS: 094213BFEA
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN7PR02MB5009;
	23:1zTbAAbeUdDbQwsXSRWzLq2viZl7fBHwY7yYbSOIj?=
	=?us-ascii?Q?xkYpDThtfvjz18sekbiFPPYj20dTnHLB7UZL86FH6rLs7wyq+uj6j/ne2k0k?=
	=?us-ascii?Q?b/Qh7UXAbOoX7/3gLogZFe25EHV7/FCNx8TkSP+QA17ez78zBqmHF6yoDoY5?=
	=?us-ascii?Q?J9wUmWR0UrvHauaRQ+FcrhFbid6psx8yMr+5C54ORMsIaZZ+YtxmL34bVfyI?=
	=?us-ascii?Q?FdIOcurZn/MUFzikkkoUh3+1MVHjPaOJn8g0aDvnY80LfA1QjK/8l+2TmCHs?=
	=?us-ascii?Q?vBQVkGbVjSMyoykhXGWcaf1N4NSdRWrxvnvoM4TUHOrK38oW5JalebR1wFny?=
	=?us-ascii?Q?O+Bttcg3AbV3gH3FblGeMMyOwtpXh9/Y6SFr8rj0+rKYaEm+M9MtsqINFwxd?=
	=?us-ascii?Q?kTB7ts5XxYOypyB5ijlbeDLcNHSU7xhQMGfxDYshpZAAMhvI+t2bvpSpbmmn?=
	=?us-ascii?Q?ZPYdYt2bbEMMaJek5znnMPLwAZvzOfGft9t6R8qa84T89kLwPRHzOhQI0CQP?=
	=?us-ascii?Q?DA8+94JkBnT2MCjmNFrLTfJBSW3tyaVTCF3mTiB5uVd9gGx+wjjnL+aEDrcU?=
	=?us-ascii?Q?IL2VfqckVRYqUGX87wVbJUyL+zMMzaRKAxl8Fmp8pS5E0WQ/F63sfTh72NuK?=
	=?us-ascii?Q?wF+XBn8Kn1ewv6wC4C/joUF2fM38XPdJxAFC9qHmWMfzf+qG791r/3fA8xfH?=
	=?us-ascii?Q?Wttio5gMMF4FVtXnyj5BxXRNEpSpnZ91JZhIVYDSWvfeYcdCpOpDMz52milJ?=
	=?us-ascii?Q?vz+l90pz9caHjgOlODoN3MK4rnHc3AC16jRUplCCoIUO0qZopVxh99wyo42/?=
	=?us-ascii?Q?/Y3FG+kXs8hJ54Bwz9XIZ98w9J1ZJPkYCNHdlXTHWTWhFxdlFjYVkicGpfTc?=
	=?us-ascii?Q?DXB4ZKSq3v1i8QKj2B8AK9Pyfi/ESs2i7yL6KAn05AH+iaRoO3X8qqiWCb+2?=
	=?us-ascii?Q?0Pf4xbLMLAEAk/+7iCYuYiiTw7uTPJfdZI+d1qg/R8ngW0fUz75c1gSerKMp?=
	=?us-ascii?Q?wFKyKolaYUEJON4H7dQAvV9?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 38mHDEv/hMJ0OdnzcEZlQ5iIPe/Ulm9PiE7KAHZ/bkFVZkRF/BM6EJRtP7OR9hFRSci2EdGAQtcTelpaLTBkpKVJBpHK8w7R68JUTDdXw5657zhaE3F7jONGQsQ7lgOMNh/hJxKVs8LfbWxmvwmGzdp88byjwhzfjm/uXLK/rVuvhx28ET1fzsFNSiZ5BzQLliRBkDvLxGtjjti5J579+WQ/kRnLTyPWOudc1/cxz+sitnRgRUl855jb8ftHN0NVcM3kpFA8jB28ZAQyM287ql2sQrDJMNteFBFDLXCZG4I4gmpB9/s/cgc8AbX9qyIBtwnpZS/dtwfp1ZUfNwV0jvd5pYL/ICnvyPYflQC6OPJehJtn66GHa6d3nJYoOKJijHl8k8ran3nXuDtHl8e3rWdiQOsk6QA9uY6ZLKTWacc=
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5009;
	6:T0kVurf7HAtpDbLjY5LwbDsvfAOYHsCBZ7WZfp2fWzh6Doe/1sA3vuP3Jixvb1u/mKkzLkj+u6xrhvaJMOOzX6Bcy68ud8DYALgJX8wJI7uWdiLk+4BVtMT9wk8fxKvON+OySI3NOjMxwvZPNzHztljVOjbcSeJMboSuhqvJYE9+gXmpVX7Oap6Zl8Zeze9XF+81Ay50cjC8lhCrQpicAWt3vLwXJkr8i/t137DxQUnS0/AIYjqHNQckX5oucOBdoa6coioutaYtpRL9JrQ4BQg5xtHdBMUrqP5teEiZXcWWxGKAuZQnVPbRU5PJ/PIHtvjowxDgVIOaqltmTDMGEXoRX/UwvbWeHwDZiaseYbTY/GDezs50A6DEn+mjIGHn0ULRxpk9aJwA8s/SNc1hxvHkG+NiMvD4Dwz/TtEOYEBuN2ZxaQnlXwkWwtt9GQCVAav6xpI5TEzTFyuacE5HXw==;
	5:zeTJfNuGsTB/5Nwwsi6a1cIxhLQkdsUANQg2sCKDFe44MW9zN58xfydHW47uyTosnPdO/U+2WxD8vc+tBJ1gxGOuc0N+YwkFBppDzLCA/KKQHUybQUNkkNIP6s4sAXlzjlA9iVRpaL/s59KUkCCGqsE/vnrX5M8ssMBDr5LPPpG+lW9RN3i48SHxcPnTgp9Za6Kox2UP5kj9zkiAgFEW/A==;
	7:aBbEQa2NHgdJvz8uWhxTH+1yYoCilUM0KLl5Fs9WdE09I13UB6qcAHoBUbf7hxh5Yrik2Rrk/2GLp2urUFiWfzMBNxoftmlZ5wWZYcKjxNuu+Iu8PqWg0o1wLfzDQkBmnSMkzV6yIL/WpDeFnxG83Q==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2019 01:57:49.4467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb9a088-8b22-4180-a87e-08d68d68d444
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB5009
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB5009;
	23:4E2w3TVE9JIPw2bA02P7L6myw8px3KyU+BGIrK4JQVH341vKuWQRQiDeIIIJtUXDVs1voaw6J3nGzD/j1tOicgIcgh/slIIQN5x2Bc8yxds5XMaIoTUWthUsHRekd8b7DWTEcDbsqRSW0HoiBl3mWQ==
X-OriginatorOrg: xilinx.com
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH] standard.py: Provide an additional option for devtool reset
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2019 08:27:44 -0000
Content-Type: text/plain

The devtool reset command cleans the sysroot for a recipe in workspace.
It also removes the append file but leaves the source code as in
workspace. The source is not cleaned intentionally and the user has to
manually remove it before calling devtool modify again.

Provide the user with an option to remove the source code from workspace
by adding a flag to the devtool reset command. The --rm-source option for
the devtool reset command will also clean the source code from the
workspace along with the sysroot and the append file.
Ex: devtool reset --rm-source zip or devtool reset -r zip

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 scripts/lib/devtool/standard.py | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index b7d4d47..e3bb0d1 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1751,7 +1751,7 @@ def status(args, config, basepath, workspace):
     return 0
 
 
-def _reset(recipes, no_clean, config, basepath, workspace):
+def _reset(recipes, no_clean, rm_source, config, basepath, workspace):
     """Reset one or more recipes"""
     import oe.path
 
@@ -1828,11 +1828,14 @@ def _reset(recipes, no_clean, config, basepath, workspace):
 
         srctreebase = workspace[pn]['srctreebase']
         if os.path.isdir(srctreebase):
-            if os.listdir(srctreebase):
+            if os.listdir(srctreebase) and not rm_source:
                 # We don't want to risk wiping out any work in progress
                 logger.info('Leaving source tree %s as-is; if you no '
                             'longer need it then please delete it manually'
                             % srctreebase)
+            elif rm_source:
+                 logger.info('Cleaning source tree from workspace ')
+                 shutil.rmtree(srctreebase)
             else:
                 # This is unlikely, but if it's empty we can just remove it
                 os.rmdir(srctreebase)
@@ -1856,7 +1859,7 @@ def reset(args, config, basepath, workspace):
     else:
         recipes = args.recipename
 
-    _reset(recipes, args.no_clean, config, basepath, workspace)
+    _reset(recipes, args.no_clean, args.rm_source, config, basepath, workspace)
 
     return 0
 
@@ -2157,6 +2160,7 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('recipename', nargs='*', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
+    parser_reset.add_argument('--rm-source', '-r', action="store_true", help='Remove source code from the workspace')
     parser_reset.set_defaults(func=reset)
 
     parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
-- 
2.7.4


