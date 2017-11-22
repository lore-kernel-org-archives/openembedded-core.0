Return-Path: <alistai@xilinx.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0060.outbound.protection.outlook.com [104.47.34.60])
	by mail.openembedded.org (Postfix) with ESMTP id A8E8E71BF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 02:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=b30UMV85QohQK4s34S/bT4FTZrFpgx1ZXFDBOzP5tVw=;
	b=MXU3vzESgO9HWS9KN54Sc5uLLr7KitqXxi96VX6cIqTfBgZutKa5cXCf1zK4pHEtNeTqJm+KJORx8j14xo43b5FJ1nPdrYFI84m4PQaBvrGyuzijMhOu8Zi0LnZMDZsXL3ogT6wlLM0qqhNsZMApiGHkT4ugNXGPnq6a2Aw4FKw=
Received: from SN4PR0201CA0018.namprd02.prod.outlook.com (10.161.238.156) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.260.4; Wed, 22 Nov 2017 00:48:12 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by SN4PR0201CA0018.outlook.office365.com
	(2603:10b6:803:2b::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.239.5 via
	Frontend Transport; Wed, 22 Nov 2017 00:48:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.218.12
	via Frontend Transport; Wed, 22 Nov 2017 00:48:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJD0-0000Qj-OY; Tue, 21 Nov 2017 16:48:10 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJD0-0002xp-Kb; Tue, 21 Nov 2017 16:48:10 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vAM0m3LT011218; Tue, 21 Nov 2017 16:48:03 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eHJCt-0002wG-0B; Tue, 21 Nov 2017 16:48:03 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Nov 2017 16:43:56 -0800
Message-ID: <20171122004357.28163-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23478.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(189002)(199003)(48376002)(189998001)(63266004)(50466002)(33646002)(2351001)(106466001)(50986999)(6666003)(6916009)(5660300001)(77096006)(47776003)(106002)(39060400002)(1076002)(81156014)(8676002)(81166006)(316002)(16586007)(54906003)(478600001)(107886003)(4326008)(8936002)(50226002)(2906002)(9786002)(36756003)(36386004)(5003940100001)(356003)(305945005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT013;
	1:u46KM3qDokoKkbplQTNBc3AvAg+ON+1bYJ4VemC/7pm+//yVcGXhD6JdW1GnTbqtjtmEog4nhSwOo7NzuF2U6ejpyLSg6mRE36TZJpuDpHj1sUeNBcgsihf8yIFxBQYs
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fec0a4c-a4ce-4ad0-e9d1-08d53142b50c
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:UECWIHJi4ZQnlOA1atomeJyhO6WuMOD46zSt+fgv5Jo6FdIToRzzQ2ms8zXgB65/nAmGXIrRagiXapXdj1tsS1k4PzZ3t7ykXB+JSXVDIeltCoqSIb92M2in4B6ynt+NazsvtOXRlFtPaUpsZUY+R/cAvz27t6d3AqjK5DyTTSanxdomKLwgnQvc2oJXzDjpMOedGFoMOo7FoowEzZKHzRWd0cMD4L0V7XQ5yEKxUwyFla9xsXN4TBXc9aLZ02eq6m1AJrTocbiTBwBjsW7IaeCikQ8QGPME/A1ikfQZurvnhDnUhxNxAuprM1UW3NW6ZcqmTM9O4sumESZC97GZG1zw6WycYU5zmqitjzCMGnk=;
	25:wfBsGdWnbiva5ABptBhLBO2HbEJZxvTBtTCrq4LuCSK8N84Sv8UmE2FAFl+KSfdRAH7dFlOT2eVeW43fG3WvQoKBiTBc5AvDMUBRRfqyxIEUffFhXXIf8jahB4wjmpLvOMUDABABlKGmEyc8BTk08NkT/8HVlpSvP+3dyiDT1ADd18zH3y3iDg4C58EgjAxjX1U0l817uWKOR2dMw9i2pFny+JaTo5u4t0B9BE3o+radCvW9UPP6zfTBTFNYyYHk0PDCtBy8893i9wzsTIw9n80FY2K+gtkLviBsVDTeml5fG/rutqVJkCXN+xa6jeFNumC3ixD6bVNc4602BFqW+fi7rRmtnEsH7oKJ0GMdRSI=
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:BygPf/WWJkFoIi6SdW4xuNtIKZQqu7IWcdN+uril4X3//72kjdtYX4hpToWg5V7QwIzy6XrS3+F3vakscLEZn/KVK1yaKfHvpA+UybBIax96p0iUytMKpv8WXGf1JV1Pc0x+b6JqziZzFmAyP9Q4oCo/q/KlBok6OVuj6kNjOQ3wh9Qn99eTyPAEjEZVL+rOvgGQNJvVIL5ZSNgO3P0tMQIAVFBBUykLUjZKcioK2hw=;
	20:/oFiMooSonZHCbdGke9t/pRL8Xcyg8umh6cnfQ/ConxNLRCBQvJ+IEFofvWKx0w9YFa/flz5WWmUM7BVGHth9CiEttZo7/dhiEYKYVADhIWw+U1rcI8RjVF09Y7g+jmWfCyBdamXZP0mh8dn8JcHQfMGEHCyECdE+/PDhlQHG4npwdj1XN0IttqRdLZgDS1vf+iUpRY70Wj8gPLGnWiaXZAH9KXJhAUKc1CWYiP37qEgoHdMVppNMlp0joZZxUf98xMG71YjrozIq/On3EPWgjTdJz3sReNt1oewzJpCOhQ1hGx2XU1fC7j/RdqIS9gsYXoOkKbOQ5fbJux3AvPo0n/WpOmTPSMXutMWNi7Ceag5b+8uhdFD/BHLsTtDlZ60Wmf08I4DgP+dqrJ0BmbOYmF8iO6UblN3lO6tTQFz9I0SE4q6TiXrZaqR2NZQq9ZnWwtcK0YqoMo2vQ9g4cD+E/A0KdtKpnAezIB6cohWPhXeV4RSm8xR6ul3TY2mnRqI
X-Microsoft-Antispam-PRVS: <CY4PR02MB3381462C71F0C8250360FC5BDC200@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(3231022)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(20161123562025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:fo/WDb7ti/hU34j50o9S2DodVd9lrXpiB33E1jJsrj4dP2PxWyo1zKdo6Kv4bojMJ2mR1SioCHyWY/5G+8VVUrCjTrbVsewgXNP4pJZSi9oZh7EWtZwhHwkrvsH+7FL7jz6OZS8wHdh15YcOpQeKPQh9otN1JV2uK/U8ln2SHH4qpoba+PfLZTZgVut3X3ilpDptPO8IHJSlqd98/hjizrp3FN6Te89FwknvKtF4ewZJxCRCAchOcKjHvzZQK9P425ymNjbrKBJl1dcS9YEIIB6nB6JMd3WmM4Kxo7n19VPHuvd1mWajU9hekT0/8v1g
X-Forefront-PRVS: 0499DAF22A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:b/Ep7ZyxKjiGiLPe1ZJdGIfq+9nAoWxtGpGrzatad?=
	=?us-ascii?Q?qSli2z3He8D1x+yFAZULhS4AveCG2ODAegdZKli9E0P90x9iuew7rt+/Pddb?=
	=?us-ascii?Q?TzcPQB2xvcJw+InsNZHwsNWKhYQYUuiqTuJl0tstRW9OFc3jb3wT/8JKhW/M?=
	=?us-ascii?Q?/ttDhWpOP+epLWX1pBets8BKIe3SjT1WNzIpAs6VkfzV62r3pItbvsTt80i/?=
	=?us-ascii?Q?VQrhoYteJfcS2s7gad388pEMfUFDFzHPyYiyEM+1gsEiM7RX78xmWpevER0k?=
	=?us-ascii?Q?ivKH5HfT3poQGSWBXR6ktGbMQqeVvD2MVuyk8AFaN4W9mpr8yG32rzsuUxzp?=
	=?us-ascii?Q?d/bJlFtT7jjZCR9SnYNygWSnyxuc783R24bAYzM3XmMa18KDg5dsQKI4FEtE?=
	=?us-ascii?Q?jkTgiv82IUIEvOGf8pXCpnKcJ7jQZXZbhZjwLvQyhdVRofLrMBB/8GI542p4?=
	=?us-ascii?Q?HNEYlr+ZGgP3YTos2WuNL83XXBZTYUAkuZFLuZgDX+f37PXs75+PRqZyBzR7?=
	=?us-ascii?Q?nA00wtvPz+b/0MEOoHgHuCLzn4y/Ztl3xtam3Yj0pmWDRyC1HBvj+58GAIsH?=
	=?us-ascii?Q?vtXkfO1594izZ45HyYSgPg53qaUSjoeWJsBVcoE1cHgGmpPQlQT62LK3w55y?=
	=?us-ascii?Q?8efuI5I4MS/y5eyHRpBbPYC5m07XQ2JyAi1iAABQYm+TAucjz+y9tNUl2bDn?=
	=?us-ascii?Q?W/CJQVoCGchj1dLTNfzCQ5vsbbQVcUTi9sZ2y+5qbTfRWxYpEbQBwmAy4Ffp?=
	=?us-ascii?Q?sbCo9WM2gOFG/I+rImtiM8AsIHR0vS2zynp7krh7t2BceYE+cj8wj0pR04wo?=
	=?us-ascii?Q?vbxq2tFrlFvyW/JxDyh5WF1QAOlCZoYdj7btqyCE5kKfKtygAps9UwjYwMyv?=
	=?us-ascii?Q?g8kYB7wMTpVWjLCtgiL7/OekR3CYk594wYz7ahaBccczTgfLFUlOcCEHcLjh?=
	=?us-ascii?Q?Z5MQYJipN6aZmlSpRUApfMmPCnr6Cm82CjyWLYxVpV69xAv1ASHNC9JZ5Rzl?=
	=?us-ascii?Q?dgQpzp1hrj5IK+wnI6sYQfyaXj1TfRDtFpCdvptp/3f6Q=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:9ISZD51G+H4rEfVayu4C3PukKo7YijGWLuFZD8ibZhDCNaGJDANfgJ2IwuWtUGNbG0Na0MnKEcC33usDHF4hWl4HnJZDKvV5mxblRJPsYtC1FF9OVdpUamqKcxVLuMFygCzcg5DMt1MA52R4ebWz9PekBcK/3CbJWTz+5slE81OB9VYEh6pGj+BWuUQjWL01cRmtdBIoO6UQyAkF75bMcXU1J/YK7Yb1f5QZQUGj6spNgCDnRJZyITAVaojRbN3utgPlKlq6XUbemKH7lr0K31OOJ33iWSSPO7P6znpXRcPQn5+ZhmSSLrJ0PumK3lgrEypGm0XVxuFpS7LQjzjydxnziZaMo8ha9DXYQj85BI0=;
	5:Eol8g2kb47SRhIe++HeVJcEhJKV7FNXjDRxXIpRCHnjqJgZD8SMkg7caxfLpKH9gkDvFCk3b4lWun3NkoqV3oYuXk/wIkie0NuD6cj8RvL2G05T/wXa9pp2PyKql/duwokRRM9RcFwmyd5kJqTTSBEt9aX1+MC5JGXLJQQV6KzM=;
	24:ax45tdUJPogNZzWpOh4I8C6AOkw564ie1/UsD5l9DQ5bwgNPa4YsaV0+8J7XfvhhFWICd3FjxPJFbMJNaLDWh9g0KbmzV1JsBlR4BYGnkXw=;
	7:7CBUTiwU3xwCZMcvgh0CmQVM47s8jX9x8sOaaSK6AlbnqB9F4E2/hsUH2QThI4N5nn5xXreKtaY11rqhAMgzvDkZzgOqhpY3Q4s9ZKR8LVhv891P1E1oiNOAaguACeSgV/1vZiGFJl55y8pQA21Y36a9/ee5k9NJHcDCRasjMljSXE7kQuYn3ct5ZNcC/0O1utwAbkuwjybm5vPwjC4qixGM1YfYPtLJfU4NtOrfH8PqbbP6KoR4Ib3cA6LgQuM0
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2017 00:48:11.6043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fec0a4c-a4ce-4ad0-e9d1-08d53142b50c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH v3 1/2] runqemu: Allow the user to override the Kernel option
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
X-List-Received-Date: Wed, 22 Nov 2017 02:21:33 -0000
Content-Type: text/plain

Update the runqemu script to allow the user to specify a Kernel to boot
when calling runqemu.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
---
 scripts/runqemu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index cd9443595b..44cf39f7f0 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -584,11 +584,15 @@ class BaseConfig(object):
         if self.fstype in self.vmtypes:
             return
 
+        # See if the user supplied a KERNEL option
+        if self.get('KERNEL'):
+            self.kernel = self.get('KERNEL')
+
         # QB_DEFAULT_KERNEL is always a full file path
         kernel_name = os.path.basename(self.get('QB_DEFAULT_KERNEL'))
 
         # The user didn't want a kernel to be loaded
-        if kernel_name == "none":
+        if kernel_name == "none" and not self.kernel:
             return
 
         deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
-- 
2.14.1


