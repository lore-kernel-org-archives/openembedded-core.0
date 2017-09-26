Return-Path: <alistai@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0046.outbound.protection.outlook.com [104.47.38.46])
	by mail.openembedded.org (Postfix) with ESMTP id EECC36FFC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Sep 2017 00:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FLrko6B+QRF+PylRO30Eni9LGq9F2wqDgkSI86dpW6s=;
	b=23j74CjVq5rnECNSp/zk23wbyopn2nMxOAAG/jKIXajKzy3WDEFVP4VqXFKHOSCNHaL+rl7Hex3M0fMsPH/VeW9uljSx2IzSo+OwVw4DZbO7q0wwJP2hB9LLYuL8wFYSvQwB8KCydCpArJDB97REsZs2AOHbMrLgjK1boM4gF18=
Received: from BLUPR0201CA0037.namprd02.prod.outlook.com (10.163.116.47) by
	CY1PR0201MB1929.namprd02.prod.outlook.com (10.163.56.27) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Tue, 26 Sep 2017 23:18:56 +0000
Received: from BL2NAM02FT010.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::202) by BLUPR0201CA0037.outlook.office365.com
	(2a01:111:e400:52e7::47) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.56.11 via
	Frontend Transport; Tue, 26 Sep 2017 23:18:56 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT010.mail.protection.outlook.com (10.152.77.53) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.56.11
	via Frontend Transport; Tue, 26 Sep 2017 23:18:55 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:41610
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7v-0005yO-9H; Tue, 26 Sep 2017 16:18:55 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7v-0000Cs-6O; Tue, 26 Sep 2017 16:18:55 -0700
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v8QNIqc7029908; Tue, 26 Sep 2017 16:18:52 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1dwz7r-0000Ch-VP; Tue, 26 Sep 2017 16:18:52 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Sep 2017 16:15:05 -0700
Message-ID: <20170926231506.13672-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23352.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(305945005)(63266004)(6916009)(36756003)(6666003)(47776003)(4326008)(1076002)(8676002)(50986999)(81156014)(5660300001)(9786002)(356003)(107886003)(2906002)(81166006)(39060400002)(2351001)(189998001)(77096006)(8936002)(50226002)(16586007)(33646002)(5003940100001)(478600001)(106466001)(36386004)(50466002)(316002)(48376002)(54906003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0201MB1929;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT010;
	1:ZAgKIl3iG4C9AH/mxMWlQ1HawQj3HtjN1CviroaNZdf+Z8R/wPK4Qlwr8y8g7KQ5U5L4Zuf3wVZ35va4mTN77lG7SFX1SH43JI+Cta7M13Yunx1U6egQGFeb3gIsl6OQ
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68d0ed34-dad9-4a16-f0ba-08d50534f5b5
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY1PR0201MB1929; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1929;
	3:5Kv0G3RBf6+Uvgq6x2jgg9MIr3fqKXF0l5eC2vYFmSk7NUrnxe2CPf/3PDFYZh813hbWPSRipF/iUlbUQlgrF5iWVrGdYsoxKWMF7drYO+welROMKmHbzftKNmb8moklzrKnzmwjotw09g/1ZHgg9Gl2BdJCXalkaPAkzgRfvwBe8zgCh4e56nDAV5+Afj/i9qYZFoyKVGZGfjLULscW0SSskM+KiiwfZ6wDaowkXKJG75slpd5oSeOujkhSHEZ6wBwD8rKfo9fnDzakTkEfRPmXclXfp0emBUgf0hnwEoadQl2rtT3nTsdd5/zPE/6bxR+91ZfxuwpvsnhntBKBlK7kr0/xhxb5zx1CKJ14wkw=;
	25:i49xTNLl/2iXwyG2CgHThPpB+C3jtC3RbkaN0uR9v8IZlnZOT4YzI9m0tbkLzWzH7P50LODrxR4FNUHKUC/qZZmHwUSzuLZ7IWJdydgZbVe5uMbmdWJDSS3HYMCQpXNUXHHhwsCewQHYIhxyis89/h8WXLbfX1HXM49i5KqaUh/lR0mdkEhJ2OrZBD8+8GTty6Hmuubx6Msi84dOXMl2Ay+EE7i76MrH/GSjV6yVYpP3wCXSFJQZPVLMcypJFyt8S4WqLKJZUKFQSzEBgKRixfNTmY3Iob2KxBbJe8YVlD9eO+0BaozjluZj3R6nKPapG7pOEchzvXVMGyKoWjH2eQ==
X-MS-TrafficTypeDiagnostic: CY1PR0201MB1929:|CY1PR0201MB1929:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1929;
	31:56i3YDcAjvDOJaawnTok1tUy0FcKf9sta4cNfjsAIyqPxtyY6JX7cAbqeJemJ6lQWnoQ0YfpT2jdR39N8+xQtl+alZEo0sqI9FbKAE+o9D3IS4RfAtbgIVSLGZRMOzYVCQOqBPZ/4sjmIL9+F15Zkza3E7qsVFAMaLM40AhlezJLN0t+Xwg2ooBDjjzYPO3Kljn6FrRNYmpj4O7mUPgg1oNP5Ig/dpK83prMII9NxXQ=;
	20:maHm2WFNgtU/MFbVqxt9TeIui325EcwmuJiro+xdHODHgXTV/RcAWU2szQklHaV+xcCmIqccC+yA8GYxa0Ed94mOBbFVmLdk8KCsous8skBJqoiv7AkGOPR7XY7O6gfag0M6TrAHM+GMOL2B3V5znfJ4+LdPEZdrhOk4FtEfz+Qcxyn1IOMTAZdrluWIp4VoyxLx1rw9MmJLICHiyvz8iQps65+Zydp9O35G2nC9jxieHMr0WJiFWIpPMyHEf9m7I+CY8XNuGP5CAYvDknhGSmwAw/Mbqon3SZj6s41NDZRhMy5QliySKZtqWioykMOgOw8l/pR9V90PiUImlqbMuytJVYduM4T/idVQTl6PC/nZKpjnrIlPF6EsRToxRKVrPX7MQkRFgUBIWkv1Zis2nHygewrCiOcR9pUZN76PXx+2YkIRQqV1wpWHCrXsKKx6Jkfo57RdQBaATk+Nm5TLaQqJBtJN3xu8E5wqZqwT/Z6g51vAoijckK0yGIz54en9
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY1PR0201MB1929CC5414C99608EAD5EDFEDC7B0@CY1PR0201MB1929.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(93006095)(93004095)(100000703101)(100105400095)(3002001)(10201501046)(6055026)(6041248)(20161123558100)(20161123564025)(20161123562025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR0201MB1929; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR0201MB1929; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1929;
	4:NNcAsFWGLF6Ve2k4xtB+1XFctKc3L6b+jxG3ef/AgNpkBVr0jMxYRp34drm1iFhPYnEYVokIcBqHmXxRKvOa4OvASV7L4awmi0qLOAm5hMfoHJVDvVK5g1G4AtnY0U49ek07TmWouL//aFVSxzfXQ8/GD7oFfbn1mwPy5DwPk9Z21SpoZsHsLRTRl2N7c/EqpWAqh2QsnpLVzEE1e+OrtCZjXD9kSwsye6V+d6uTQcTMdgUWvk+4Ww1yX3qxoBavW0B2ZCJj9lkDUwI3zGkkP3at7981I/MYPNfvJXziajw=
X-Forefront-PRVS: 0442E569BC
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0201MB1929;
	23:bVeLfOFCGEMwOpG9XS+7EIhrOOeeh5PRqkQ98l9?=
	=?us-ascii?Q?mowpGsfQ2LUI9icQSPp32kw1vYNvXg1GvL8p74qGlleJguzuPHqmysDVIDnp?=
	=?us-ascii?Q?XXG52xGnnVnwPoFtc72mp+raqmdkSG9HEKRFfTjqf8LNCuuH99d/fspRB2Sa?=
	=?us-ascii?Q?f3DyYuqU0CTxzcEZkySpsRvyLYDpxVC8eza4NCXTUjYGB4adkBSDOkaPBInf?=
	=?us-ascii?Q?eo/+IJtvggiwerMft3bHiSPmfxsN80q93f0Cz+XqajrVrGPFmgjoKdxOYw+W?=
	=?us-ascii?Q?AEoPYZtWnwLIIEQNgKahZLC4D1leadWGYYyswYx/cKSXtQzgw2PlXPmT9vml?=
	=?us-ascii?Q?fp3ELKnsgx0keVpYVIMpcuWKJH8CNPHDO512OFhGxoE1JEntOlZqFfGvwO8K?=
	=?us-ascii?Q?q5HQeQJ76oCC6OQFJZShCh1VeKLqT88cUOZjf0DPpX3fbiOhOzGqKUGDE1xH?=
	=?us-ascii?Q?RXNsfdy6rQW7EibBPxSVel2Zs2k19IP6ZTa1mFxuK/+2Mop4PDc4uYmtA5ZK?=
	=?us-ascii?Q?KymG5mFifNjg19G02HVEWwzy/hmajS6PrP1ViqPfTqShWX8uCvluTtoyOgyV?=
	=?us-ascii?Q?SMXf6+LcT6f9G+DbAnENXqGy5SbuOSDf0dzLGzL8+kgDkZ6ZgTRMUokwfppv?=
	=?us-ascii?Q?4XNaCuBKjsEWHXZXciYNuaueICgmwqhqiXQHWKJN9ZgMa80+BIkE1CMrPCMS?=
	=?us-ascii?Q?uJ+Mi3O+1rj4QS5jV397ubLAlskiYYVp6No9XJG9TVX/Rv1GSmySwrUatysB?=
	=?us-ascii?Q?UwROAY/ycBylw90KL3w4A4ZYxOE80mCmj2HEpb9aab51DMQgIy0rS1xAumCj?=
	=?us-ascii?Q?aTf7W91klsL18okRK8mXdyEF6efjhLJWpaHPElXMA3OjoqT24EyOJoPgspza?=
	=?us-ascii?Q?6PFZZw3gvAzeEuizg1Tc0NNQnNfzCol8bMKoboWKJKyHvbhyGrAXnQn6/MJM?=
	=?us-ascii?Q?YYMedT6SXBLZDnbDEtWO62gKHn0PrC3R+04YBfUesyyCAnkvgMGUoifDhp9P?=
	=?us-ascii?Q?SFKHPbLp/7CxEoYJ6T0/9y4EkY/53ebZl+FRjqF0/ji5FfQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1929;
	6:FjoF7NTlN+28+og2ZaW/uKrapPLGhsqPZf942Tp/t7Yv1hm1WqlNhBSjRLqk8zLdDYqdXINTybIgMssG0aM7zAqZXMMxIZUfdzN7DyojURg3w4ZOi8NZb+PZPVZYLDXqWSUAbiJyXYKO8XiuA9XpYTWxxbIueW11bW1RZhUrFdNZJ9gY9x6EzS3XKmvq11x4FS/lPK5saGcBRaDgon9D676/LPVNFy7ofihDXjfANQCaKzQEc5du9v8eHuvzDAbsnQorwMBE7FFsWU4gpeLM4MpNtFNSJmR1C0v4ccm5SlF+EapvNNvQsE9ZxDuHnmWhwISysNzq7a2+BZNiqeSf4w==;
	5:Vj8L/NNj5MHjOm2zQu81QBcdJbQG5xQcNvgKFgiDF7NotP5Qz6h4XyGtCYa13Y+xiZjtKd7rvcfeiWVHMe6g9/Zoy24SoKIABHDMi4FZbLvKGZH4su7OCxirLPFL3FefSnwwH5btoagGNTYyjmS/7w==;
	24:98Sn/D3qG15R2icyrLTwZ/6kt5bXRPCXSsqt9RXu4PJD3qJbAN0MxNnNgZSazahHYZ4yEHoel57PyJ1J1zBjy7h1kYhBbEPqwXB8NkViLdY=;
	7:6MGVE6nzeL+C6bxFiiiduAwZ8E7qF5zs7IRzU8gyW3PfQPc03e7sKWlBPypt/eFNhOjomdS4AZTa+81Y0RbtYcP2dkRHeG2vdZNGvKhSV0o5Q1MF13twWJDu7KemqBu5xy+KnjPCjQOxrVLBD937dNmyKRBLujmqAfHnqQuuL/t07sFDCUfIzKUA2f+LSucENB0Qf+gUhNwZcj7rOSgK51po8b9JP1tyK6375pvU9Mg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2017 23:18:55.9854 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0201MB1929
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0201MB1929;
	23:OGJZAoQ3hJ4MLgTaAMagz9HxY7YnEWkCW0yzkQovU2WIblaR44ugzRNa4QBrETpw6bnOW0kfuwoPFCqq3qdPIIRn7B5it0Tgq0uOheRnesadVtpuR3jhibyQwUhy/mAR7HPBsquNPFUgJ4kYFrsLTg==
X-OriginatorOrg: xilinx.com
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
Subject: [PATCH 1/2] runqemu: Allow the user to override the Kernel option
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
X-List-Received-Date: Wed, 27 Sep 2017 00:33:22 -0000
Content-Type: text/plain

Update the runqemu script to allow the user to specify a Kernel to boot
when calling runqemu.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Ben Levinsky <ben.levinsky@xilinx.com>
---
 scripts/runqemu | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index df76270904..c3719a86f7 100755
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
2.11.0


