Return-Path: <JAEWON@xilinx.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
	by mail.openembedded.org (Postfix) with ESMTP id 6FC347FEB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 00:13:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lvb2pyvZylUnPjL2YgFjcYGxa03XYX4j/GEfLfyVcNTZKVx2GxMYzqc/zcLmkxfE0+LFIM3D/f3/dJoAtUdAmPyKftLS4qJZ5yJXnfpEk/jvk//7Rqdhw3P50b7LOhHybNlAjSIRfBTEi8V7cweS0rpwu2gwsTkToZtNwE0vUq4E0z6AVMkwKx7tjSDTzwfcNdaG8d/3FmXW3DaqxTpArQ06dpFDxehZ56at3Ug6B3wv1ci4LThaJ0SRL6AOf7MGxMRT4YadmipZZhWES287nAfnZxgHil6jYdk0l7beNW3ylNzbSb19MT43PR3f0P2gizUBwPwzy+FCY/pO6rNdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=66C7gRDdJLM8A/eFSrvvhtSbETKcjx4hL2qkmPKYie8=;
	b=YfIJdtAhfWeZ49eMgi90zJXrqv4dLmAd5QQLA9dGLbfaBCWxJNbT6ge+NjAMrgh2PGHBmjzp2leixL9omrIZ9XEqXEv/sBdM8MDcn9T2lCv8tByg1quVSY7wtIVCfhaPcpWbXVLY+4J7okWWY9b3h3vVuYDH2xIqqUEfsA/QfznRjcOXvAtLMNkHRHe+x3/LrmjdPwsQaKtyuSXGP+DJ3gThqvRxeRZ074OgU5vOtosgAk84V/p6QQ3Cdp9iB2ELQ1osK9oZeciXbz7+2bpsSig8cTNVVdrlefO9MZIQ8T5j/TmvJq2i9H4iVQEzcWt3ZAyyKi3cyN4PnkA+6gHbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	149.199.60.100) smtp.rcpttodomain=linux.intel.com
	smtp.mailfrom=xilinx.com; 
	dmarc=bestguesspass action=none header.from=xilinx.com;
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=66C7gRDdJLM8A/eFSrvvhtSbETKcjx4hL2qkmPKYie8=;
	b=tdBEb9Gjzq8eTjcHcz5WDdNewbmjfmFbZcDk02eXVlD4beqxS9NVkYOh1So9ufLrjkt8obuWGgqFeBr8N73hIHmi5aBvhSBeVta8Y+uXDUH588wW2Nph8yMrYBVKia0Xdqfro8XON/nb2OtSmgHtSlmAjlvKYOkgw+5h8BOYubg=
Received: from BYAPR02CA0048.namprd02.prod.outlook.com (2603:10b6:a03:54::25)
	by BYAPR02MB5333.namprd02.prod.outlook.com (2603:10b6:a03:63::21)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.20;
	Fri, 20 Sep 2019 00:13:42 +0000
Received: from SN1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by BYAPR02CA0048.outlook.office365.com
	(2603:10b6:a03:54::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via
	Frontend Transport; Fri, 20 Sep 2019 00:13:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; linux.intel.com;
	dkim=none (message not signed)
	header.d=none;linux.intel.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT059.mail.protection.outlook.com (10.152.72.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2263.17
	via Frontend Transport; Fri, 20 Sep 2019 00:13:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39269
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iB6YN-0007bV-Ss; Thu, 19 Sep 2019 17:13:39 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iB6YI-0000yx-Os; Thu, 19 Sep 2019 17:13:34 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x8K0DUbM002555; Thu, 19 Sep 2019 17:13:30 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1iB6YD-0000yM-TU; Thu, 19 Sep 2019 17:13:29 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com,
	manjukum@xilinx.com, alejandr@xilinx.com
Date: Thu, 19 Sep 2019 17:13:29 -0700
Message-Id: <1568938409-5070-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(376002)(39860400002)(396003)(346002)(136003)(189003)(199004)(356004)(14444005)(70586007)(47776003)(50466002)(81166006)(50226002)(8936002)(8676002)(81156014)(70206006)(9786002)(486006)(44832011)(36386004)(36756003)(5660300002)(478600001)(51416003)(316002)(2906002)(186003)(26005)(106002)(4326008)(7696005)(107886003)(6636002)(16586007)(336012)(2616005)(126002)(476003)(48376002)(305945005)(426003)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5333; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7e0c6d1-517f-42e9-0ad4-08d73d5f64b1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328);
	SRVR:BYAPR02MB5333; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB5333:
X-Microsoft-Antispam-PRVS: <BYAPR02MB53335C488CE0D891608B0762AF880@BYAPR02MB5333.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-Forefront-PRVS: 0166B75B74
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: TshC/tUHF/ixhzbqUcS6j/SDqNmpOY1Labd8uKhrpK1La++IgPh5BK3cGGKkdh9NRS+DPfQA3K2ItFMy28rtfte9i7hTltlxg5Ffs76VEj6bJjm5krUpno+ZJSXG6cnjCIywBsFoOqETix9Yo/qjGQV7sToO5qlE3OO3MKxm4dtBlc3AIDaLEfo96JoYmHfavqwEBFC/Z+UJz2qPYC/GtI2yEZ9KwvcdK3cDFBEqai+EZEkAyTqZljjBSajkmHwaiIxxrysFBz7RY2m4ryBULUld2/UuJf2blZeN39Z13H3AMNiX0pjeURGyAqyIvOlaQylj7vTv6S4wXzJf7uMitcHmEqayqnhUIhqUH8g05uGcYWoKbcCleKihf9H86f/Er41yXpkue8xUBxZi5UUZyPltNKCFfzoW1yebsjDmM/Y=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2019 00:13:40.6247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e0c6d1-517f-42e9-0ad4-08d73d5f64b1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5333
Subject: [master][PATCH] standard.py: Not filtering devtool workspace for devtool finish
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
X-List-Received-Date: Fri, 20 Sep 2019 00:13:42 -0000
Content-Type: text/plain

All devtool commands right now are filtering out the devtool workspace
bbappends in build/workspace/appends when calling parse_recipe. While
this may make sense for devtool add and modify, we need devtool finish
to include those appends.

A specific breakage that is caused because devtool finish filters devtool
appends is the cmake/cml1 flow where a file is created in the WORKDIR
that finish needs access to, to commit those files. Particularly for
git packages with SRCPV in PV, SRCPV is only changed to 999 when using
external source, hence when creating the cfg or cmake config files using
for instance bitbake -c diffconfig, these files are created in the
git999 workdir correctly (as in the devtool bbapends, we are inheriting
externalsrc class). But when devtool finish is run, the devtool appends
are not parsed, hence SRCPV is not changed to 999 and devtool is looking
for the fragment files in the wrong WORKDIR.

Changing the parse_recipe call just in devtool finish to not filter out
the devtool workspace.

Fixes [YOCTO #13533]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9eeaefb..e87b433 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2011,7 +2011,7 @@ def finish(args, config, basepath, workspace):
     no_clean = False
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
-        rd = parse_recipe(config, tinfoil, args.recipename, True)
+        rd = parse_recipe(config, tinfoil, args.recipename, True, False)
         if not rd:
             return 1
 
-- 
2.7.4


