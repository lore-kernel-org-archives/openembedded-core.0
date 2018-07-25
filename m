Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 10697 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 25 Jul 2018 19:37:13 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0082.outbound.protection.outlook.com [104.47.40.82])
	by mail.openembedded.org (Postfix) with ESMTP id 136466086F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 19:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=IqDXfyIQwerSiTHN4cXn1wXxbRWev+2xIURAAbOjY/Q=;
	b=nXlnmq8dYBqV61qixbvoR29tTqxMKdrH/MX7CkbPTs1dolZ0BbYNBrwWyG748EQkpl/uIvU+jP6c8QVU26KHWX4+2RqnrVQT6oZxyrFu6dbPhmyOsucU6fUzXgPtO2oCmHtyaGOntq3LG+vv6DEI4eksIZbPSdDFvQYk/MZZip4=
Received: from SN4PR0201CA0050.namprd02.prod.outlook.com
	(2603:10b6:803:20::12) by BY2PR02MB090.namprd02.prod.outlook.com
	(2a01:111:e400:2c1c::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.973.21;
	Wed, 25 Jul 2018 16:06:13 +0000
Received: from CY1NAM02FT024.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by SN4PR0201CA0050.outlook.office365.com
	(2603:10b6:803:20::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.995.16 via
	Frontend Transport; Wed, 25 Jul 2018 16:06:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT024.mail.protection.outlook.com (10.152.74.210) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.995.12
	via Frontend Transport; Wed, 25 Jul 2018 16:06:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50486
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fiMIl-00078e-66 for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2018 09:06:11 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fiMIg-0002m9-10 for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2018 09:06:06 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w6PG5vnH015115; Wed, 25 Jul 2018 09:05:57 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fiMIX-0002kn-Ml; Wed, 25 Jul 2018 09:05:57 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 09:05:51 -0700
Message-ID: <1532534751-5871-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(346002)(396003)(39860400002)(376002)(2980300002)(438002)(189003)(199004)(8676002)(8936002)(81166006)(81156014)(356003)(36386004)(63266004)(2351001)(305945005)(478600001)(107886003)(36756003)(9786002)(316002)(4326008)(106002)(186003)(26005)(6666003)(426003)(48376002)(6916009)(336012)(50466002)(476003)(2616005)(126002)(486006)(14444005)(5660300001)(50226002)(51416003)(7696005)(106466001)(47776003)(16586007)(77096007)(2906002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB090; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT024;
	1:26Dx1x036R8WZsFIwoc3NBEGYOKoSg2VT20rIcezE+lLESDNuaZLHqJxP27ce/2RKsqfUCnXONtT51tF9OStiFhJPR7wL3wiCiPyGiysQLdx+XI4q5sNNiNWkPFrJIqC
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54e74915-b116-41f0-13f9-08d5f2488adf
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600073)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BY2PR02MB090; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB090;
	3:O2Jae1L2DOXLXWTsIkd3iWESR380sfMxPGFVI6uhjxJBoPmvYz5gSEcbyjrYRhacPMlvSDZjAve6bGgtAIaeHJbjLCRBo+m0he+FXfyYoXJm04e92/e/Du7M4WyZYju8opN1NaJLTKqatS+IM3DfIHKRGOKZUYYZjJCNpCyeYxT27wo4W2/RDRKzsr6jBc29h9Ns9T3eQonMxT6XnsXAN1gXxdu+o1K9fym1Uvvu4+H3Ekir31y38gIw2KgybawPNASgncB9i4jHENSDl0xHk+51D0TIYoiWQNO2hr5ibMJtfsZwbWVuALRl84zGu5R9mAy8bLdBKBQ5DjNGjIH3VvFo9MXNLrxnGW9ZPN/uVOk=;
	25:2FM3nyk+KB6/xIeR6iO7mmoSlI54UkY79ncNWtozfflPp4HVPszrd8TRWhKSFywaUIZvYytTjdjEcyCNxMWWZbG/BVuoE6WFQu2GL1PixM0uvWeTNZeAhBoycZVU4MRE1HW3IG8wGvGMJUCz9aEWlzKNRDkSInamvxu4b3pdnBR5U8BvkKGNMYrDV+vRPgODimqmOEprhtu3BNhNukK8NBnvZzry/x1Q57H9nHF5m9BHbVPilSt8aCBmQo1Y/D8kko/KlKLUrwRzEwcisayByt+3IJ3iWOEP+lpR0p1uFcrLYujnGAedvUTam6ETUZ6iyU9Au891kMyA2y80FLyT/Q==
X-MS-TrafficTypeDiagnostic: BY2PR02MB090:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB090;
	31:gxVUr5qQPt9/MkYFlKlES2I2RZXbRusaV1vzFr4TrB0ArbuL7O+qnTrlq2Vl0WPV84IX5iStH9N03U+pHDP5P2nebWdqhMpzy6fXc04GvDImF6dG03fC86HsIiGCg36HeHqKgHwW5sd4R13lGrOftUT/6DgTidbfvM6HfAvoZy7bS+t49LDiRCyzjvexbnCLpsG0NJdCwAFONTFApclPxrD0TIKU4k/FUYkmmT4TJ00=;
	20:IyXVuTWHn3CqAnDh4UisvhQl6XlL9TTji9BIRii0L6+i5/rsC85/iSCE6kODZqOiGoeB4OuBcSAM6JvcK50q5uAC4qrb1oCwRlwlKunN1CZNhBv5IovMKlL9h343sSw7f0L3qOTM1qOGT0MpJ5n0U0tVq0jVVlZoZtcZsjpUSlKdsgbqyGU0URH9ffGc88jidOICvd6O2E6kDKa2Oxd1tPgi4bsG6TXTCh+sFtkINGKNc1A9YhQRXAgD2ItM+eUtRU3E6ICxW2RaQnizFouyZKbkmAg+sn0zK1XC/YuMEkS0P4QFOfHh4L+Wbs6XB9aEi60WP3NDnkyGlB/DIxR44Agct6Q84g2rBMomQmbTMUqMxHBvJmjK4QMrSklbhHwEVloFh/8VYFUtR3KC9nH1WtsFI9crysHExHDqe4pSnmdpo1aDGSNKGIQPFgPv76/S0bCe3F7wbPYhjOTGzYxuJqt3Bl2RWXU3HmbyKJqQplXEejYLdTh4tpx2pfpUSlzu
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB090EFCD6A87B69D7193F519AC540@BY2PR02MB090.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93004095)(3231311)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BY2PR02MB090; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB090; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB090;
	4:th21rzrdeDEu7AaglhZtJa0H7jyAO3c5TTsbNP7rlpcvtY1T1mSME6lF2QcW1mBbsFHkr0pmXs7mSK4W7aHwnsANhrSv30jbGib9NMsaEi1IP4gwMHaIirUQfNMEh42h87Vslwqj96w53VfCTZDzcjp1KvlEY3CwACPJ9oxZ75k7lNIelHJXgWey4BSFiaEneUVNR67h8W8mIKOBjLdbmPMZkhteWAvuBfUB/N4LIvkxjZHbWs+ry9bnvSVon1QC23+yFqtT7aEcoyip+zlq1dWtc1f1rgR9TDdKzfzTfHWWRm2e/bK6qXZs7e5BtUjC
X-Forefront-PRVS: 0744CFB5E8
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR02MB090;
	23:JIsv0bjpIEHVdQ4/i1yU3YspfcBcszOFHkZW1hrTNv?=
	=?us-ascii?Q?GjVg5/ez92JbdCH0/SV0dZhf+oxMKOAFlIqJoObEBRI4ENiDOYpqEnEkvBRC?=
	=?us-ascii?Q?06zj8hhCoQ2QJemN+QVL9EOHFpW44XVobqiugEbUjtIPiO6EkABhUWbox/dD?=
	=?us-ascii?Q?6qRKNVUEVLJY/BBVL00Q7PstxSQx5cYggCbQFWmu0ex8Q9rptoZ4ZPdn8MdN?=
	=?us-ascii?Q?3ulEgVVIqr4aaP9+jzw5Bw6Vw226nYarwI/FrBUqfb4A36M2LJ86z2rIKio6?=
	=?us-ascii?Q?ZtbnANJ4kakEmm5637Qti/0+IVnOvq9rILAlFSwgNn4GZ62CUZz4/zfDQ8UB?=
	=?us-ascii?Q?87ns4UPuK4SZhoa5GfAs4WMnHV95jP+jJ2ZLxmA9ypYKqSow1hR8CSAjKF9U?=
	=?us-ascii?Q?IAcdgCy0UF5cfPgDGjkE/uMWE1sXQhVVCW0L9ewn6CDTPHgFehR+i5pEvdhU?=
	=?us-ascii?Q?yTuOAbSL8zY68vhuqHHVEU7NXW1SpxygVybiHL73RKAFCiCp/fzJojv4CeZi?=
	=?us-ascii?Q?M3DTqIyOfA6SnJs+8NrAtRP+/m6XxhFaBbAdO1a7YBHX45QOSMrlXuI2Ee4S?=
	=?us-ascii?Q?PX8NbhXCs+49Zth8Ig8tBAQhBsMtk8VG29Y6idJuWn/NuiIkz+WEouMDnOOu?=
	=?us-ascii?Q?MaaIZCJkgNA53v85EntdMN9e/cFESgoR8rimUJQvSG02HqepR7ObBvKvvS/J?=
	=?us-ascii?Q?ygmK7OnKbkMmn3A8vMzp1InbGNWBoksYg1gisIxZi1Jb+gfVyQh3+nKV6alw?=
	=?us-ascii?Q?GnC+KzpfGrZ1EvknuWdpWqwCJyu11oqX1p8ozWh0jfrLkac5r3Sro+3tviNf?=
	=?us-ascii?Q?vo7PYJtvcG+z75CLibeEtm6VgF0vrSN/2Drf/yvbo1GoEiLMZpvbOJArCrhu?=
	=?us-ascii?Q?1Sp4lVYohfWldPcAJZpA50awEuO3+7jPccb6d0aXh7CmfKKJjqwQOMWuv/Hn?=
	=?us-ascii?Q?bDXzZhGugeAm1T395TwqatDcCBowunIRNQvs/puyLxBb9F0BWHDhEPVMLK9f?=
	=?us-ascii?Q?kY5MpPjRFKs8g29fbLu8cgVXFL3U8p59I17AEpoVS/kv8lhSu3blrnGQaZko?=
	=?us-ascii?Q?KzMX/1gJLrZ8eq/NQFHogbWNZhG4XCf9Y100ymX5WtkIuk6w=3D=3D?=
X-Microsoft-Antispam-Message-Info: z3/pejDHOb8gLkwxP42UXDCNIF8CZLwcqEXLpbjfkUYmdKGjpdD9HaGf1xqyCqrO6dKRNNJSmhUbhYXLNvshUzXdqTq5Pwga3bPRres5Md/eiW6qcBPQYhUIx7Sd4gHse2wrSL5rqcFIg5e+fshGnqS7dzquaY95hGXRM7lra8EfERkQHPPRRKmpph/Hc54oAwvWHKAP/cEBCmZJHGiok1J4wqjeqy6hOfJAgiQJFjEevwEAG+mgmt+X5h33u7KVnFHT747d3LELBuOIJA7sN2uPwmXng2DFdXorCYBJ5Z8rZv/Uv1yTq6vTFcWtEehFp9KNhC2JREjVmhJ5aFbJbhs+cJ0p9s9YcWjFR4pegQU=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB090;
	6:gu+ICZWhbsKZFuKhi1vbeGPpIx6DLfKStC3pyad4/5mvebbyWKsR8GwnL4iJIps6uWKSyG9aHz1gA1/wT9uSsGGVhS3gmakPQDD6xtEO+8BmasJmPnW65jPEZFZzCVzk6OLGbRjiOGAS2PtdNTk8Z4t4GBBtwpNGkDhMgp9ZDnzhJIlNBVINIaFmz2cET0b2lIu08jGrkIhybRmhhrViYB0b5NyKz8WyvAoGOQDaAnzR+f9p2OLdcli8K4TE5AjR8LL1CXXt0IyVlSXFs+VSS6PoypNNVnLXSDIaO4sFKQHWT5pGsmI4MLDikA/IDlYkT7kfeGOHaFcjuCPG/fln2M3EnxdMoe8ezbSfPikK7IW0MAJS7GWiEe8PsW+37Ph40CCEFGubi2NN8bQU71RakfepEG+uL3QTyg6q0VNYdUvxVzEWQ5bKUxokHtdlPKiLVrh1WGzMN7lFHHQCyFEqLg==;
	5:+NLbXk97Zxl93hmrrLsuRTv8sB317P1G9A8cD9/famuUplplNGWcWS5SKHqV/YJn8J89CfSgP6ktd7jCI4+LZrV5JNjTdLPsyfykzSt/sdVimyH324PFYFPi12R5jQ3NRZ7ntDgvBLGsRxzMrDJf9bWNAWuch5wrLw5v8kX6hek=;
	7:eH8buTUwaL0J6HDRrUn/mmzR0C5X/bUP7IfTikkP9T7DyS8Z+d7F1jqqj0GqcLEC2HtaXYIh9YBEniP1GgroMv7PRB1eI+ad90qWvAr8vujnt7DKRIznP3+6Sv5yIyR/WaIsPtYPINlv7PGlBCeDXZDXg8ImxPYElpqQ/U0afh4by5bmMYXU/yKUSEBj3mWt3tfD+OHn+mko4QQNWnKYTHETMDLuskwUGlrz93cfgvFn7gBaroXrezECUd8nR7P0
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2018 16:06:11.9235 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e74915-b116-41f0-13f9-08d5f2488adf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB090
Subject: [PATCH 2/2] multiconfig: Enable multiconfig dependencies on oe-core
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
X-List-Received-Date: Wed, 25 Jul 2018 19:37:14 -0000
Content-Type: text/plain

This patch enables multiconfig dependencies (mcdepends) to be used on
recipes using the following format:

task[mcdepends] = "multiconfig:FROM-MC:TO-MC:PN:task-to-depend-on"

For the sake of simplicity consider the following example:

Assuming we have set up multiconfig builds, one for qemux86 and one for
qemuarm, named x86 and arm respectively.

Adding the following line to an image recipe (core-image-sato):
do_image[mcdepends] = "multiconfig:x86:arm:core-image-minimal:do_rootfs"

Would state that core-image-sato:do_image from x86 will depend on
core-image-minimal:do_rootfs from arm so it can be executed.

This patch makes modifications to bitbake.conf to enable mcdepends, and
to sstatesig and staging.bbclass to avoid conflicts between packages from
different multiconfigs.

[YOCTO #10681]

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/classes/staging.bbclass | 8 +++++++-
 meta/conf/bitbake.conf       | 2 +-
 meta/lib/oe/sstatesig.py     | 9 ++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 41df883..27b012e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -256,7 +256,7 @@ python extend_recipe_sysroot() {
     workdir = d.getVar("WORKDIR")
     #bb.warn(str(taskdepdata))
     pn = d.getVar("PN")
-
+    mc = d.getVar("BB_CURRENT_MC")
     stagingdir = d.getVar("STAGING_DIR")
     sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
     recipesysroot = d.getVar("RECIPE_SYSROOT")
@@ -443,7 +443,13 @@ python extend_recipe_sysroot() {
 
     msg_exists = []
     msg_adding = []
+
     for dep in configuredeps:
+        if mc != 'default':
+            # We should not care about other multiconfigs
+            depmc = dep.split(':')[1]
+            if depmc != mc:
+                continue
         c = setscenedeps[dep][0]
         if c not in installed:
             continue
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index e28f3c7..f68954c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -877,7 +877,7 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
     sstate-lockfile-shared prefuncs postfuncs export_func deptask rdeptask \
     recrdeptask nodeprrecs stamp-extra-info sstate-outputdirs filename lineno \
-    progress"
+    progress mcdepends"
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 5dcc2f5..18c5a35 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -150,16 +150,23 @@ class SignatureGeneratorOEBasicHash(bb.siggen.SignatureGeneratorBasicHash):
         if recipename in self.unlockedrecipes:
             unlocked = True
         else:
+            def get_mc(tid):
+                tid = tid.rsplit('.', 1)[0]
+                if tid.startswith('multiconfig:'):
+                    elems = tid.split(':')
+                    return elems[1]
             def recipename_from_dep(dep):
                 # The dep entry will look something like
                 # /path/path/recipename.bb.task, virtual:native:/p/foo.bb.task,
                 # ...
+
                 fn = dep.rsplit('.', 1)[0]
                 return dataCache.pkg_fn[fn]
 
+            mc = get_mc(fn)
             # If any unlocked recipe is in the direct dependencies then the
             # current recipe should be unlocked as well.
-            depnames = [ recipename_from_dep(x) for x in deps ]
+            depnames = [ recipename_from_dep(x) for x in deps if mc == get_mc(x)]
             if any(x in y for y in depnames for x in self.unlockedrecipes):
                 self.unlockedrecipes[recipename] = ''
                 unlocked = True
-- 
2.7.4


