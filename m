Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 11910 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 17 Nov 2018 09:06:55 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760057.outbound.protection.outlook.com [40.107.76.57])
	by mail.openembedded.org (Postfix) with ESMTP id B1CAC6C132
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 09:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/dP+phgrk78YWHzz4hCa7xDUoPRq7nVQNoSVkymfAzw=;
	b=VyxH2QZ8oGLaXOB440SWKY7APjM227i55dR5rBZfRz2lAmKTL9HFHdZnmWdRpUwNcuKlMTOnoIcRbq57LxJyUnxVFXeZ5McHwFqJeI/4SxioxPOmlQ4aH/9kwqMRhDFGAZQA+LHPksHxwHV6zjo4NC0iEdzaKX5oJ9FhF9YXMFs=
Received: from BN6PR02CA0036.namprd02.prod.outlook.com (2603:10b6:404:5f::22)
	by SN6PR02MB4333.namprd02.prod.outlook.com (2603:10b6:805:a4::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1294.21;
	Fri, 16 Nov 2018 19:32:00 +0000
Received: from CY1NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::209) by BN6PR02CA0036.outlook.office365.com
	(2603:10b6:404:5f::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1294.25 via
	Frontend Transport; Fri, 16 Nov 2018 19:31:59 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT023.mail.protection.outlook.com (10.152.74.237) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1339.15
	via Frontend Transport; Fri, 16 Nov 2018 19:31:58 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:44551
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gNjqQ-0007Yp-0s for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2018 11:31:58 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gNjqK-0006L6-TU for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2018 11:31:52 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wAGJVmvg028904; Fri, 16 Nov 2018 11:31:48 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gNjqG-0006Kf-JR; Fri, 16 Nov 2018 11:31:48 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Nov 2018 11:31:45 -0800
Message-ID: <801c5623aef8f2128b54f45454ed67aedcb8f56f.1542396610.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1542396610.git.alejandr@xilinx.com>
References: <cover.1542396610.git.alejandr@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(438002)(189003)(54014002)(199004)(16586007)(446003)(426003)(316002)(126002)(486006)(26005)(77096007)(336012)(2616005)(186003)(11346002)(305945005)(476003)(50466002)(48376002)(2351001)(8936002)(9786002)(50226002)(36386004)(81166006)(81156014)(8676002)(66574009)(6666004)(5660300001)(106002)(106466001)(76176011)(6916009)(51416003)(7696005)(4326008)(2906002)(575784001)(47776003)(107886003)(36756003)(14444005)(118296001)(356004)(478600001)(63266004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4333; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT023;
	1:x3m+sUpnC4tLSRPUaf3+ODL8KHp89Py6zrmoobLekYIYEOrdITLYCBrqr5vb8kCjqZ6ohijR7D5TTMPex9cnj1aQ1r1qU8eW4ne0mFfLtTJaYlHdBGxp2d7xLVh3F4c6
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad6614e6-19a2-45dc-d723-08d64bfa2d3f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	3:ceJ1SI4LfvO+AUYS4he2JMuBXWX0oD5oDSpQXI3gA1QbG9RqHd+xCqzeHTme6/C9+7P2ZsaRCBnee3zoNtT5581lEdcYlETXkOIencCMTlPt3EWpcFyuuz/MYb9qcuUrzhtQ3B7t9OkPz1uhGMf2C504lmgkzgK5h1goBhzWkgsmmIekpIS2iKHZ4x0efBchJ/PI9JVE9i40ozBLLGdchM7DXfUKVEvk77AI1wjDv04ls5GDT1iIKnSeC7oUEmcvrF/3BOL6XpNE9ZzQjysPSM/Y1hpGeGETt/BbWrCZxartwCEUPA7xJgwXncyAcB2SGQxLNt5MvQUJ5aRZ0W+VvrB+7mQT9+4WVwNicl0/pzY=;
	25:XXwcu92iYmCJox6lImP0rnM4TkEC9mexUT4hWr0AkKqjutUQgal63+54aa/fddzOxmRHseIrLsXNVGWlpjFMa6jKOpby4YTl5fukj9IjlpE+0BCeOAUrhz8lJ/8R5G2ZPn3+vTJQ7ev7ZQUmFUOPFhJpsP51hT3lJlz+lIVCvsv0Wec8sUeS9IJhE7zDfPBg6c1usbS6XyNUPzsxd47D219iwFEw5s9l+onlBS87L/+4Vn7U0G6kp+xG7NeTURd6CxNfPtO6mF+5Gey8+KDogTmy8nowsZwS4X8JEldWwCpa6QoDxC8vgTPTU/Owsmm3Eju+tUAB60dA0FbSK0ImlA==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4333:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	31:hm639L0738CwS1FnoRfRb8wv3m33t7oRymVg0AmTe1rleIrSN/z6kHXuiA5OcIHnOIRVSAZdY4ilLVDI3pER/Hk0otxtBqrZTU8pT9dCYAAEUbbd+EiIMMxTy0EnssmsChKMn3f6dUr812mNHV0vmrmEfJSdiqzmDl3sAeuhnOyCMCPCi24vTdKv6IsqBeC40EGjPElzPrvdugA+ST0Myn0zkskeXGwsbvtgVU/qLXs=;
	20:svBfaj9/Bh6XwXO7bx9U0ncBqUdoI/3yt9J5kQvTz8fG6dR/sTMrdYbxAuSD7i48c9ARKnF/rXf64HGOCk4Wm7rapNRJGHfiqfWxwFhG74yZ30VTKWjDFV6l2CXZ7ex7TqDA62LMLLGTM6UJUo/VPJUm/zCkWeH313woBXAkLoZEOqCnEs4CvRi2ZKxE3FNXi6SXhznRagITDzC5z4kf08d2Z7YhjU3Kcze4RY6RIsKW0WBknQJZ6vefGexfUXVcoAEG9ieg6mD7i1gQ4pbSDB8l8iwSBSbt379S+6C9jY7RkbXtUA0rYHkHOpfRocMHSDRdecUqj0z8cuZo5aLpF5JryYqXqW+QZuvpbfQj4NifMOUprX8P/qZoIAoa5zFMSJVxsnKMaKPqZQjlZKAXNFmmIeNSnuEFWv2k/V+cT+RsAEcBzyVrj3GgS1Nrw3rFHtP02zhEE7izmyOsRzQfdxutCc+ylQV4kgUHwpDmyDHGbgN31D00u717bbR427th
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB4333C2E33A057E7480BA23ACACDD0@SN6PR02MB4333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(85827821059158)(788757137089); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93004095)(10201501046)(3002001)(3231415)(944501410)(52105112)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:SN6PR02MB4333; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4333; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	4:/kF/r3K/h0J8pxQYG5jKY50ySHYihFkDb5UCjR5+8mNWMRhnImdKzqIBkmaxhfaEmZ72TkVkrhhcxGsp/S/MIs6/ljyfp1zIMQUg/0EpDbYMchKdb5qzmE4+Igun69F7YslUxfGtuefZ/xO6jT1DOxyG38kp6q4gVpt/cm3PjIHYAh5LoijySHgOoDMwIkSAUGzAhW6k1zfNB1eD1NWSxRJflKwFDc7S/TERlI6useRWlSyZJ9aspNSdvuQbK7hmzo96NGBm3k8NrRIdZ1orLceU3lIZI2cEVZ0Bs4ABsUu3Iu5kQOhm1TpP0eAAxhmQGu5P4Jj+y6QrNDppQcIhpq6v2AiIztZYMwxqjbvHpdNnYydZ1kLLExYXFalUb3eF
X-Forefront-PRVS: 0858FF8026
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN6PR02MB4333;
	23:qlF5fbO5adHDDgHvHEUjBSjlXZ9yJMpLp6oQ/pvQo?=
	=?us-ascii?Q?iT0p94LkKN59rYfEYLTloms7PLrPfgNuaV86RF2djsMkNCNkK05onwkWkeGV?=
	=?us-ascii?Q?bH36u2GRuIaFnHrbdXgqBg0QGVp/b16/4AwqV28Z+qQ/NvqVhal0lVUWIqJ5?=
	=?us-ascii?Q?2wC72a3+lV51JzQ3Ty6FktHT17dopyj2ZA9RdYQWXjBuVv/nXuQUn7zmFVbO?=
	=?us-ascii?Q?JenK4JtutbTu/qWvj43v60eoYzdrveT0rY+7yXBP26A1tJJG+Ifdzr9ts8Hb?=
	=?us-ascii?Q?35PWF3xSgjMStf0kxB4DbpAfZuMYX1dwhn8oXcAmc0RRRfm49//LBDNh+hAa?=
	=?us-ascii?Q?0QlpVHyhvfEY0bTHNwFRlOweek4ZK7gqE+EiCMsDib1SWa8KFWg91mPBWfv2?=
	=?us-ascii?Q?o+tjNDYc0CfQhylhp2ocWal6uG1rkw2IHsS6xCf7wohIFNKRFBD3srSpevi9?=
	=?us-ascii?Q?76QZuWGWmfC1UC09AFP0o7ef362Do6+IMh8GXYHcaVvE8Mb1HLMJzCHPfmWm?=
	=?us-ascii?Q?DV2KYPYQk2rSFTY+x1Hj+53TOGUqnP6qFQ8dW5kwVbSxGu7yfRi1SdkvXL7d?=
	=?us-ascii?Q?4flGbxWEwuXP0Q+VULiPaBFc0rDqC5PpZbnomc23DAeNaDpZ951I0UFlwWG9?=
	=?us-ascii?Q?UfLbjvtGWutvZjXiGoqKw7V5fE+QuLYXOm3AVHrv40KaG8FH3RA4fI94/rZ6?=
	=?us-ascii?Q?iWYHRCJigKKAkxeaL+XEoj6XyRmJb1cLr37Fzt+y2JERSmXaGvWYlQQXcC3D?=
	=?us-ascii?Q?QSB9FHROumOa/tH1m0w5MuGxo3WL857qVfOGBkTNb9hnyATuNNmB+esZhUcS?=
	=?us-ascii?Q?42jKIFpAW9l7zNvj80dV8mJMIktWYA57H2XUzmgkfb8+7cQw/TLDjSNt4PaP?=
	=?us-ascii?Q?MZNghIdzCI5d9WYNIBavS3J7oOczRkubLven36uL/2BeO5Gz20/IdYnj87Et?=
	=?us-ascii?Q?unP+cHmbD36vS3E1LBgi1gTUlWf6bqnS2fleHlQUwUqvFgd54aGJV+s9AjXr?=
	=?us-ascii?Q?JEgNLJPP1FXJ6ZGVknOS+jJoIq83RApsOx7E2gnG2PTvYgAqbtJNhcE+kpx9?=
	=?us-ascii?Q?BOcLo1kgO53IyxMnpvsrapvyT8jH8TEx8dl9udN9pjraZtdmzpXSSwMXI20Z?=
	=?us-ascii?Q?80WIjjbl0HSt5GBvk2Klle+Di+fsVi0o0OM5Dgz4Vw3UE8RJrk9Jy+2BFsL4?=
	=?us-ascii?Q?kXylFCfaSobXZ08B0qXPH8chf8KJjQhin7pLIZ1tg60CZrAq0Cr4LfxYyf1T?=
	=?us-ascii?Q?g9bV+zv9EAWKOVSslI=3D?=
X-Microsoft-Antispam-Message-Info: pcAtJEvQDXNYkWJCy7SrORF7W/ARz9jI0T+nVheE1ELc13T3MHjue8rQudcdWH4GyKG0es/qQjirckm0C9qvofZuYprOVeMeVimnS02BBvvJE3fLA9tvEg9QvBVrYJ5KTB7sQ3+Ivu3KYTmydTxaaoNAz5d9uDharIEJ1yqnldtCTPwMbVDKzR8+uxhsiAlS9Nc5lQxeBYKQbD73IysKdFEGQe4FLVcXdymVdKP1ZuSIDME9Ucf5Og8XwYP2NkATlPO1ayMernKMYyy55msng916IzRi4+gt6bgVQZQ9epi9tQg2QEkoaVHs1vZ7jcysukaZ7KWeWONWC8dOBBX2HdLOuJuFk6TVOmjythXj35c=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4333;
	6:7sRZTtQyRH0s6hWXmipdlnR7g1dBtAUNjSBQuhbtteGvJoaGpZhZIER/Jd7bDQn03T6YEq70VlgNVX4N7LGhpShg9mCpqFfIUS8EEmGyfrdG9LYXp5LkxC8TgJog9b7fwz4IFw4+RjqiUOSyPZNEA924LQXhv5sWHFpJbdBejRRCpeWdrJcMkt3cSGR+7LxUey61nKRSoX+5wtfu5OmnVpGuQUButIWvKtmw3zfCyzpsBWWJK5hwSdFO21B8/Z37NQ2VwRBgJ6EbkgNwxznfq9KrhEtRSCLSJDZrl24wFjZNIOQLHujKErMqWsyRcsHqBaT7fYuTNiO3fv5pQHGaYl7qScTPgF2pnpCJymgBLDVtD34O3mWm7wHiAag32fsTd7AMBLRTaHZNb4INJM50x9zrDiYQPWiEa6ZgpHiGDDjm54z1ha4QBkcSd1getfhfPvCAyF1gixhB9U9oI2ssrg==;
	5:9mZQJcaVnbQrfoPlFCvm3AF8jeDxPKXA04m3M00QzzhuoO+P3PC2KWRz3EdqOJgBTrYFo9JtVgDci7FQNq6Em98lidliAfyZM9RfQBQBssc//thc1V6Uk2jBGp2A1yi5i1R4M3ijCH93+BlHmDVURlILYszx4+davnG9d79mbc8=;
	7:irznUxu7C3M7IdLH66nz0xuBdQemf4iVKjqzQzLA48e5vgcEwzlhyLfOjFKM0o/tjkGGqIoHY+yKrqBv4fRIBckdduPAp0Fkg7QW1we6+3zIaUwNOwpyRfW4m4yOtjSH6pNnks8ziHwedz8U0m8/bQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2018 19:31:58.7257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6614e6-19a2-45dc-d723-08d64bfa2d3f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4333
Subject: [PATCH 1/2] python3: Adds instructions to the manifest file
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
X-List-Received-Date: Sat, 17 Nov 2018 09:06:56 -0000
Content-Type: text/plain

While there is a bit of documentation regarding building a new
manifest file for python, it seems that users usually only read
the manifest file.

The manifest file is in JSON format which doesn't allow comments,
hence why instructions were initially put elsewhere.

This patch hacks the call to open the JSON manifest file by using a
marker to trick it into reading only part of the file as the manifest
itself, and keep the other part as comments, which contain instructions
for the user to run the create_manifest task after an upgrade or when
adding a new package.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../python/python3-native_3.5.6.bb                 |  6 +-
 .../python/python3/create_manifest3.py             | 20 ++++-
 .../python/python3/python3-manifest.json           | 94 +++++++++++++++++++++-
 meta/recipes-devtools/python/python3_3.5.6.bb      |  6 +-
 4 files changed, 119 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index d5953cf..e6ae2d3 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -84,7 +84,11 @@ python(){
     import json
     pythondir = d.getVar('THISDIR',True)
     with open(pythondir+'/python3/python3-manifest.json') as manifest_file:
-        python_manifest=json.load(manifest_file)
+        manifest_str =  manifest_file.read()
+        json_start = manifest_str.find('# EOC') + 6
+        manifest_file.seek(json_start)
+        manifest_str = manifest_file.read()
+        python_manifest = json.loads(manifest_str)
 
     rprovides = d.getVar('RPROVIDES').split()
 
diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index fddb23cd..f7d4587 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -22,7 +22,7 @@
 #
 #
 # This way we will create a new manifest from the data structure that was built during
-# this process, ont this new manifest each package will contain specifically only
+# this process, on this new manifest each package will contain specifically only
 # what it needs to run.
 #
 # There are some caveats which we try to deal with, such as repeated files on different
@@ -36,7 +36,7 @@
 # Tha method to handle cached files does not work when a module includes a folder which
 # itself contains the pycache folder, gladly this is almost never the case.
 #
-# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29@gmail.com>
+# Author: Alejandro Enedino Hernandez Samaniego "aehs29" <aehs29 at gmail dot com>
 
 
 import sys
@@ -78,9 +78,21 @@ def isCached(item):
     else:
         return False
 
+def prepend_comments(comments, json_manifest):
+    with open(json_manifest, 'r+') as manifest:
+        json_contents = manifest.read()
+        manifest.seek(0, 0)
+        manifest.write(comments + json_contents)
+
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
-    old_manifest = json.load(manifest, object_pairs_hook=collections.OrderedDict)
+    # The JSON format doesn't allow comments so we hack the call to keep the comments using a marker
+    manifest_str =  manifest.read()
+    json_start = manifest_str.find('# EOC') + 6 # EOC + \n
+    manifest.seek(0)
+    comments = manifest.read(json_start)
+    manifest_str = manifest.read()
+    old_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
 
 #
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
@@ -402,6 +414,8 @@ with open('python3-manifest.json.new','w') as outfile:
     json.dump(new_manifest,outfile, indent=4)
     outfile.write('\n')
 
+prepend_comments(comments,'python3-manifest.json.new')
+
 if (repeated):
     error_msg = '\n\nERROR:\n'
     error_msg += 'The following files are repeated (contained in more than one package),\n'
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 5329bf7..685e3d5 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1,3 +1,93 @@
+# DO NOT (entirely) modify this file manually, please read.
+#
+# IMPORTANT NOTE:
+# Please keep in mind that the create_manifest task relies on the fact the the
+# target and native Python packages are the same, and it also needs to be executed
+# with a fully working native package (with all the PACKAGECONFIGs enabled and all
+# and all the modules should be working, check log.do_compile), otherwise the script
+# will fail to find dependencies correctly, this note is valid either if you are
+# upgrading to a new Python version or adding a new package.
+#
+#
+# If you are adding a new package please follow the next steps:
+#     How to add a new package:
+#     - If a user wants to add a new package all that has to be done is:
+#     Modify the python3-manifest.json file, and add the required file(s) to the FILES list,
+#     fill up the SUMMARY section as well, the script should handle all the rest.
+#
+#     Real example:
+#     We want to add a web browser package, including the file webbrowser.py
+#     which at the moment is on python3-misc.
+#     "webbrowser": {
+#         "files": ["${libdir}/python${PYTHON_MAJMIN}/lib-dynload/webbrowser.py"],
+#         "rdepends": [],
+#         "summary": "Python Web Browser support"}
+#
+#     * Note that the rdepends field was left empty
+#
+#     We run $ bitbake python3 -c create_manifest and the resulting manifest
+#     should be completed after a few seconds, showing something like:
+#     "webbrowser": {
+#         "files": ["${libdir}/python${PYTHON_MAJMIN}/webbrowser.py"],
+#         "rdepends": ["core","fcntl","io","pickle","shell","subprocess"],
+#         "summary": "Python Web Browser support"}
+#
+#
+# If you are upgrading Python to a new version please follow the next steps:
+#     After each Python upgrade, the create_manifest task should be executed, because we
+#     don't control what changes on upstream Python, so, some module dependency
+#     might have changed without us realizing it, a certain module can either have
+#     more or less dependencies, or could be depending on a new file that was just
+#     created on the new release and for obvious reasons we wouldn't have it on our
+#     old manifest, all of these issues would cause runtime errors on our system.
+#
+#     - Upgrade both the native and target Python packages to a new version
+#     - Run the create_manifest task for the target Python package as its shown below:
+#
+#     $ bitbake python3 -c create_manifest
+#
+#     This will automatically replace your manifest file located under the Python directory
+#     with an new one, which contains the new dependencies (if any).
+#
+#     Several things could have gone wrong here, I will try to explain a few:
+#
+#     a) A new file was introduced on this release, e.g. sha3*.so:
+#        The task will check what its needed to import every module, more than one module would
+#        would probably depend on sha3*.so, although only one module should contain it.
+#
+#        After running the task, the new manifest will have the sha3*.so file on more than one
+#        module, you need to manually decide which one of them should get it and delete it from
+#        the others, for example sha3*.so should likely be on ${PN}-crypt.
+#        Once you have deleted from the others you need to run the create_manifest task again,
+#        this will populate the other module's rdepends fields, with ${PN}-crypt and you should be
+#        good to go.
+#
+#     b) The native package wasn't built correctly and its missing a certain module:
+#        As mentioned before, you need to make sure the native package was built with all the modules
+#        because it is used as base to build the manifest file, you need to manually check log.do_compile
+#        since it won't error out the compile function if its only missing a couple of modules.
+#
+#        e.g. missing the _uuid module, log.do_compile would show the following:
+#        Python build finished successfully!
+#        The necessary bits to build these optional modules were not found:
+#        _uuid
+#
+#        What will happen here is that the new manifest would not be aware that the _uuid module exists, so
+#        not only we won't know of any dependencies to it, but also, the _uuid* files will be packaged on
+#        the misc package (which is where any file that doesn't belong anywhere else ends up).
+#
+#        This will eventually cause runtime errors on our system if we don't include the misc package on
+#        on our image, because the _uuid files will be missing.
+#        If we build the _uuid module correctly and run the create_manifest task the _uuid files will be
+#        detected correctly along with its dependencies, and we will get a working manifest.
+#
+#        This is the reason why it is important to make sure we have a fully working native build,
+#        so we can avoid these errors.
+#
+#
+#
+# DO NOT MODIFY THE NEXT LINE!, IT IS USED AS A MARKER FOR THE ACTUAL JSON MANIFEST
+# EOC
 {
     "tests": {
         "summary": "Python test suite",
@@ -1119,8 +1209,8 @@
             "unixadmin"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/venv",
-            "${bindir}/pyvenv*"
+            "${bindir}/pyvenv*",
+            "${libdir}/python${PYTHON_MAJMIN}/venv"
         ],
         "cached": []
     },
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 31f8ead..1e6ca0e 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -264,7 +264,11 @@ python(){
     bb.parse.mark_dependency(d, filename)
 
     with open(filename) as manifest_file:
-        python_manifest=json.load(manifest_file, object_pairs_hook=collections.OrderedDict)
+        manifest_str =  manifest_file.read()
+        json_start = manifest_str.find('# EOC') + 6
+        manifest_file.seek(json_start)
+        manifest_str = manifest_file.read()
+        python_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
 
     include_pycs = d.getVar('INCLUDE_PYCS')
 
-- 
2.7.4


