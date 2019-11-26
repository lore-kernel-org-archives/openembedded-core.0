Return-Path: <ckalluri@xilinx.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-bgr052100136047.outbound.protection.outlook.com
	[52.100.136.47])
	by mail.openembedded.org (Postfix) with ESMTP id 15BA87FC97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2019 19:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ghtXIEInwpOotz7uYZmEij/BG6eV+W2Aa1J6l4UUKmasxZkWBV/ZA9+vyxE0AAnPqjQ8oOxYimtKjMSJ+Qu50KwuHpB+cXnC/gGTK1g+39rPPkOXOFLF230k7nCaGqn9BVcfImHNlFLshWzwhWRdCZzbgkXrDk266YKcoPCxqQHsa4G8ZDyOzcG0ikXXx3Qn8LXz4cvfTkyyYK05bOuW1db10zN5yfa+HzX/ws5dCdEWJzdbB8uBrHOjxVxmR5ZsZ6L79t57WDddpu0AMzep0S4ua5tC/KuDGfmyqntxE4kP9xijrDN4Sk9N7bOGbReLkQHZWgBPoXCOypUyVyV8HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7BsBrG5+aeGaA1T0y19qMcfkBWgpO5eHj3cdOqYqEpM=;
	b=mYmC4WmVIaN/aeHQDezClmTCuI361vVS9odnxNHvQo95sjMISYCdlS8I4SHjMGdjFhWBCMppeJCZQN6AnPBDILEDi9CRHXj3z1mfopWT13jgPSB1HFina30JmJ8AWgMToBaFfFelyqeqRVDVkpeXJw30DriOvX7E41Ne42H5/HC964hVSlgCuQdlpfejGqeEEDoXjPY75+j60ZbDTuLskoVWYJKD2TkhvfrXC255o0LoyVDSF3bJkayyVl34FQYezay5dbES4I8CUhLJL493VdEzjUEdWOE4EOGM4nLiz4Fc+Xvg/B9ullzdc+nywripgRaMuPSDrXQIbjxXLEN/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
	header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=7BsBrG5+aeGaA1T0y19qMcfkBWgpO5eHj3cdOqYqEpM=;
	b=rpfgKAzFet8eB5IwrPSrj1giIPnTwb+Ql7oqrwtYex916hl+XkP+Hsn0AG0G1OVObJzMwAF/0ZEYvpEW68vL0na+MP97IQZeodasc7XS1fsVWmobGkNLn5GyVGEStuPAbWDkHqRO0lGiCyh2OKR5fCojcfy3+BbIrh28AuulE4k=
Received: from BN6PR02CA0031.namprd02.prod.outlook.com (2603:10b6:404:5f::17)
	by MWHPR0201MB3564.namprd02.prod.outlook.com (2603:10b6:301:77::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17;
	Tue, 26 Nov 2019 19:43:43 +0000
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BN6PR02CA0031.outlook.office365.com
	(2603:10b6:404:5f::17) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2495.17 via
	Frontend Transport; Tue, 26 Nov 2019 19:43:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2474.17
	via Frontend Transport; Tue, 26 Nov 2019 19:43:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkQ-0000WI-Oy
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:42 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1iZgkL-00075W-Lq
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Nov 2019 11:43:37 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1iZgkB-00071D-KV; Tue, 26 Nov 2019 11:43:27 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2019 11:43:25 -0800
Message-Id: <1574797406-21583-2-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574797406-21583-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1574797406-21583-1-git-send-email-chandana.kalluri@xilinx.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:SPM; SFS:(10001); DIR:OUT; SFP:1501; SCL:5;
	SRVR:MWHPR0201MB3564; H:xsj-pvapsmtpgw01; FPR:; SPF:None;
	LANG:en; CAT:OSPM; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1071881-5ce9-4931-f716-08d772a8f1c2
X-MS-TrafficTypeDiagnostic: MWHPR0201MB3564:|MWHPR0201MB3564:|MWHPR0201MB3564:
X-Microsoft-Antispam-PRVS: <MWHPR0201MB3564B5FC0ECEBB81763A3A5DB0450@MWHPR0201MB3564.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-Forefront-PRVS: 0233768B38
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xb7XndNxL8NocpCZqRC3m0I7IAjxz+jqkB94OAvT6gG43EIwnjvcnuJbGzbS?=
	=?us-ascii?Q?90ceefQ3fs97Wo2xbRJSCzTkvu3jI77Viqm0hzycfkO6I6/O2OLF9xoyaeQ6?=
	=?us-ascii?Q?Ph94B8yVKV3l+obo+24krgQoI/3xAYpIZBMXk53Q2uDtYz+6+Woktyw8daap?=
	=?us-ascii?Q?YjTP1aa0BShBHfbhxuh7+H1YBmDGn9K9aQL/J1u+gPjhSGqVia5ukjQYOpfS?=
	=?us-ascii?Q?oHaUqidV+aezFkMB/th7MhWZsehKF968AK/+FUUi0kjhDxfBrU1WVjbGMmNX?=
	=?us-ascii?Q?cxSqAchYX/kOkzB0CBS04IKb3EL0cg3fButOkc3rEPf3nSp7/qIVimCZTVd0?=
	=?us-ascii?Q?99T+skn9ykq2u1vo6mYygN+dZeuOf/2OsRe9vmm7rL3IHer5kZPauCh0tCpy?=
	=?us-ascii?Q?Wav/cMN/NGPvm96iEBcTW7gXGiI+2KlIQ+zp795xwjM2JL07UlJwcbmEtGsQ?=
	=?us-ascii?Q?URjaL5uDxyZy/54LHh5Fw4SvTG7png2vSBCQgrWOeVUgcmRVvrdS18DNBvYQ?=
	=?us-ascii?Q?KNrxPBdnVCx0WY39xd4eahLZzUBr7XAQ/HyK18piG/SxXV4/xWtqMrSkbwPE?=
	=?us-ascii?Q?1rHnYf1K8r62/DZGVwFuG6fN0WwYPxEbPL2iEi87IWYSvhePpad6bKgKctqP?=
	=?us-ascii?Q?lGQfE1ytQrkxilsA55/ynMZNK2EEIUPmjspCes6fWOWv1oO78Mwvpr45w2E8?=
	=?us-ascii?Q?pHa24vUgT4V79/TPHHHoUbaP6G0ync2pnan9rhETj5xfG/U3XVa/se6TueNO?=
	=?us-ascii?Q?/ICGWkzbRkOK2Zq/1+5p7SzJGB/iKp3EwyTZsatfrdCLSJiSCvc9HiPL0yGx?=
	=?us-ascii?Q?PpP+C2k+w1zJtYL8Ypni2wlTxD/C/YT577BiYi9G+zI4eY5Ke3c6Tsb8Fdnw?=
	=?us-ascii?Q?8zvKNu3yOPsABE3sbwGo0FGFvE3BOqLP8wVtSUG2CwGHLpZS7fuZPJLu89E2?=
	=?us-ascii?Q?MIoiUL1qzwjez1Z/NFg4SILeStrKHmv/Ki5DBl4jfoxHOVUPoaLDt2MPM1XF?=
	=?us-ascii?Q?FeI6?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2019 19:43:43.1202 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e1071881-5ce9-4931-f716-08d772a8f1c2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0201MB3564
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [master][PATCH 1/2] reset --remove-work: Modify the remove-work print messages
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
X-List-Received-Date: Tue, 26 Nov 2019 19:43:51 -0000
Content-Type: text/plain

reset --remove-work: Modify the devtool reset remove-work print messages to
provide more details.

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 scripts/lib/devtool/standard.py | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1c0cd8a..10a29e7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1931,8 +1931,8 @@ def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
         if os.path.isdir(srctreebase):
             if os.listdir(srctreebase):
                     if remove_work:
-                        logger.info('-r argument used on %s, removing source tree.'
-                                    ' You will lose any unsaved work' %pn)
+                        logger.info('Removing source tree for %s as requested'
+                                '(-r option).' %pn)
                         shutil.rmtree(srctreebase)
                     else:
                         # We don't want to risk wiping out any work in progress
@@ -2282,7 +2282,9 @@ def register_commands(subparsers, context):
     parser_reset.add_argument('recipename', nargs='*', help='Recipe to reset')
     parser_reset.add_argument('--all', '-a', action="store_true", help='Reset all recipes (clear workspace)')
     parser_reset.add_argument('--no-clean', '-n', action="store_true", help='Don\'t clean the sysroot to remove recipe output')
-    parser_reset.add_argument('--remove-work', '-r', action="store_true", help='Clean the sources directory along with append')
+    parser_reset.add_argument('--remove-work', '-r', action="store_true",
+            help='Also delete the working sources tree (NOTE: will delete'
+            'unsaved work')
     parser_reset.set_defaults(func=reset)
 
     parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
-- 
2.7.4


