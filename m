Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 846 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 12 Oct 2017 23:50:03 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0059.outbound.protection.outlook.com [104.47.33.59])
	by mail.openembedded.org (Postfix) with ESMTP id 2093A77F76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 23:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FLrko6B+QRF+PylRO30Eni9LGq9F2wqDgkSI86dpW6s=;
	b=KIHbU67QWFk8pnS9orRmJnsE53V+l98d9qPjP2Xk7aHkl4uNRl45gQKT3g9i1AtdrFYvL8firODCVRRu2msCD0jzvudjatsCiKgt/JSANV/BwG+M6xItsyqciVXYM+z5TlP9xDnVKXMVgZEt+CamdPk7b66gICB4Z/331VvC+pI=
Received: from SN4PR0201CA0040.namprd02.prod.outlook.com (10.162.76.26) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.77.7; Thu, 12 Oct 2017 23:35:58 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by SN4PR0201CA0040.outlook.office365.com
	(2603:10b6:803:2e::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.77.7 via
	Frontend Transport; Thu, 12 Oct 2017 23:35:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.77.10
	via Frontend Transport; Thu, 12 Oct 2017 23:35:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:40703
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n1B-0006rZ-2s; Thu, 12 Oct 2017 16:35:57 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n1A-00041Q-VH; Thu, 12 Oct 2017 16:35:57 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	v9CNZr10007794; Thu, 12 Oct 2017 16:35:54 -0700
Received: from [172.19.2.220] (helo=localhost.localdomain)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1e2n17-00041F-OS; Thu, 12 Oct 2017 16:35:53 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Oct 2017 16:32:01 -0700
Message-ID: <20171012233202.1281-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.11.0
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23390.004
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(5660300001)(47776003)(2906002)(6666003)(2351001)(106466001)(36386004)(50986999)(33646002)(107886003)(189998001)(63266004)(478600001)(48376002)(39060400002)(1076002)(36756003)(356003)(8676002)(50226002)(8936002)(81166006)(305945005)(5003940100001)(81156014)(9786002)(4326008)(54906003)(16586007)(50466002)(6916009)(316002)(77096006)(106002)(107986001)(5001870100001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT059;
	1:gnYXcdrblPTEtUvbFxgxfTMOWKvO9PTESOyARM2vKkophY9objtRQZFnbNVVmV/JhxrssicGc9CvttMDD3/4U2C1xBy+RwWQW/zfu5e/BlfkfGfKcaxDxpbzjk5htCkN
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1a529a1-9c56-4cc5-5d26-08d511c9fd3a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254152)(8251501002)(2017052603199)(201703131423075)(201703031133081)(201702281549075);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:Wq+agQ1Or2WVGrgL4IgSH26laOxh+LkIOM9r7IOmIT6fQ9zEHZrd0ayc+dlycvSai9FA77oHzg0ZWu5tUFguGTOi1Hot62uC8jTG6obNdqQmNuLaAIFA4mQvwcdnmfHgs1QUqv2Jkx2Rk1TiMWnIFINOgXijvxrn++7No5vCfqca+NJm1sfvR2nCQZ8yFcqvxibJmt2qXzFI6N7oxCzM7If4A7ybWsv4h7Y2kTQwlcTaUlzl0APOsj+vdOPlO1Wp4VXzxwI7nwxghXV1JnATKj/T0wv7FEFubr9xgCB8Gp1g0EBDMCxbQ9LnHbhDgENnd1EOWcfXfRkmbKp4bEjM2zaUnpNt5JZUni874F3p6Bs=;
	25:BQsNmEN0WwGOnnlOXZCyIPha3/SU9vw7LHXNhiv+bfZ2gPoMXw+ezIhBtSsVVcmiDdObYctWKIhR4kY/uhI0+Qj+6gAmdAe9t/6RdnkVTXzBo8peLsAG+01OWUKCvRFaqVDadlYb99mj8WA/SJz4Nmk8g6uaRQ6lL5Yib2E51IJkXA9tspGazp/4fJkgdzh2970F+HecdcwGSyuVbzKNHY/sRasqGaY5TmFNsJBLHs+GM+jkKe/j7vfUW9sXO+2nZvov/wk3DvZkRAD9FKpacAkKzbWK1XKnXQwUpG7KvQ5F4BpHSGKx6RjH3Z8Tz9AeIanaYdWmp2J94gyK2lC5SW/zRQk19X29qDWilvnDFdg=
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:QjRug+uFfPsBjXSPVXrn/zn5w7+GfrKSOhDIcVAbg1y0pBVoyqtZCb0Mxf03q50zpLO8QmKYKmFkNAFYhkStIt3UmdllTXdwM+QOubej6333f19j39jjsPqGQD2oLHQ8DlvpNgEvlT4n3uZG3TMY10bdpTLiYL3bCPtZdl2Nbdc2QW5SFgKzRy2hWr0QIUG6x99v8ZDT9U6nTaB+qL1E09ViBHclWagMjBMMVr++XEQ=;
	20:HpIyAmlJBImkLXr+qLSubCZ/89+jAXmEcsZd5rMsknbI16bfSB9NTBxfGu8GQ2Jl6CBrxtW5Y0pQjjUPJSNt5tAxgDMby2wW8DLrXmu0Jb2L15UBj6SG7qq4zNS1bnGeIX8TUzBXMoYzhViK0OTKgxGqpgpUNHYwtcZg/NoWnAZWqJPa0M30QRj4YBL2bZT5a1SmR5a4w8+lvVYHpeDr/IiB72mU3+3+Wl8FIZQ5cDIYBRmt/jMDn5oIjbfkRjIshmBpYnq/2uxfz+1MPc3CKBcSo+Qjut03ITdeNBgr6MgD592fp0MiSd/FJHTts/rh0bE9iKFywMf7z7NH1j7QEPJ0O41d6739cBkUH96TDWtUv6Zk4NeueqUiN3COOIiEPxIu79GHNSr1dT7j6qpQObWJOiQaUCOV4cZvOwmJ0QSa6ADUdwhLIL5PZm6/KDcsJb13HqMBFdxjQkuxcfxR7P8/Y60PwlEgd7dWRlxhTVwx4elHous9aGyzwNpGCPqa
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Microsoft-Antispam-PRVS: <CY4PR02MB33819A0A464C18AC427119FADC4B0@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3002001)(100000703101)(100105400095)(93006095)(93004095)(10201501046)(6055026)(6041248)(20161123558100)(20161123555025)(20161123560025)(20161123562025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:QKSVVNX2EjRd/Z4e0Zb0GuIhTPVAfnqHXk6wsyjKHiMLcXw1ueFUxdOdh0r3W0KVF5ujPdDBAFcmtYSalgF56K+8CIJO6oUtaZIcF6P9yJzFzFaNhViTCnw5vCmLJWXzuoziOyJOK6xR2iIctNKGMvrSw92i7zGswddzaYx1L1ctM9Nzlg0ZNTr8qNuHt9rwUqoFCSc0HbCkv/UenBSZB/KwO2whQl9qYl4H4PxW+iJMhkQUOdpR6zu8yBCubhAeoOkHqzQ/bzdy7qxj7NWckP9l5rl4XzRLJl/BxmjyvuU=
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:8IQDnyQ8LtI8LS7ELdapwEqOEBC1D8ZaBRWNOMK5l?=
	=?us-ascii?Q?R8Ouj0/ehBIqFu+WYAC1hk5oGvSlb4gQZZJ/PsJ9NFwe+pj1HaChnt2zQNwo?=
	=?us-ascii?Q?9j4vX7Q4g6Y4Ds/phil3fRJcATy0I3CajUNEZU3sI8iDyJS/EIKLEad0Gymy?=
	=?us-ascii?Q?qUI3j28MfTgKZ/oTqh/L3+Gdex7BCBNoFg+HmhY175xxxC9MEutPgFHPXatm?=
	=?us-ascii?Q?CppZobsxf86k1rPMF5uutHLfW56UKJG+EGWVm8OTLx87jTAnd5Hg6rkOAagk?=
	=?us-ascii?Q?HLrcSDRSvocefFU8+agOVnWOlqBrz1qzJgCyQi/uFX6fUa3jR8qKApimlXhT?=
	=?us-ascii?Q?it0ZiXBrAefMDnCnZzxTy7C4qu9Ib3/87wuHMVNIxv3N+2UliOhUiRkMWIwA?=
	=?us-ascii?Q?eUbcTkhLTUnLTIKeHF1B5exydDhvXDNijAPwf5hzPxxnswRpn3y0JiurW+vY?=
	=?us-ascii?Q?quo+htBuONXq4v9aS8CJqg5+uu3Og5ItAPjlQ+ZtwPhy2WNnHJuoPR7aXOOa?=
	=?us-ascii?Q?Mp6fX3hrC14gWf2GXYFRbfWgCGAzZ6B6XuBRgtbHk4RzYJNDTox0t1gQHkYq?=
	=?us-ascii?Q?e3VPiLcTrIgZIVzisHRfZ57E4hHwehiRVTpH1ogpiBwysYYa1drFSqnMRYey?=
	=?us-ascii?Q?FhAbwHrDmsijW4Ge4NrHlqKjwMD4OZt8xHUZIZClgUpFkT6WjT2lMgOHjXml?=
	=?us-ascii?Q?R7OevV9fLAB5uYoTqTTwbHjd3L5yQI2vgfwYm+3aun5UNm8AFa7JnDG3eHMt?=
	=?us-ascii?Q?ttPVKvvJLtKoJ3GW4DRnT4XssWkDBaOk6liFpNGn358SnXzXLt+4lE/YNDfk?=
	=?us-ascii?Q?H1JRm5qHRWE5b+Mr6fdtqznWA0b+zqq971LUAA9QSyULVduzafr9qmTMFL8o?=
	=?us-ascii?Q?DAWp4ZpyRwvlFVTJU66eAj3vycacKF6Pysm3gqvkUetSfeOWZmsOD7Wl3MCr?=
	=?us-ascii?Q?+eYcT2rjFMjU5sUIkQ+uYhwbtSODH/nC1Bo34wQpLTh6I3LDyocE/PXC9+Yf?=
	=?us-ascii?Q?CtIiu1e1bRLpRzrdfKhOEKtYJ2DdWdyevpc3CKCCg+lgrCGE7DyCwqQcFckS?=
	=?us-ascii?Q?Ww9dyrmEVstCLdYj7RVSwWz0OK9SJrdZWRV3bvqHvcIB7UfaftV52KrxtTyz?=
	=?us-ascii?Q?/shwQegekPICnhrFs7QuJw8CRZOccg0Tqe09zwaHA6aLnsh8JM4lA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:FTnR0lPGQ3obna271ZDYUy8ZIbfP+tXhaWHT6Xoasvw5V9OvhU10BXTjWsD7m7CHvFMJL1kRBNigA21EX/4fQWP9BdD52O5q+M0upPtMT18n+bmzvlu/MzLSM8En0OEXmjKegpk66slwLyjcbUGO5NRfAoQDWL/dkJ/DLjbS/+nfGZQYAtbqY/4GXN5DfRPak7kjjZNvuy4bM3rTNpRxKIlivBJQEiNodT2U2E0hGUYTCnhHW9hWKa+B1TSatl6PZg8ggVKrq7YnEKaVea2UyPztGmn1HIczujN/XgpJmk7FvPTu6wr0i3Myw0QYqoI0Vpgb1tXyaohDMyWRg/OJIw==;
	5:+WMLkOGziYn1w1RIZub0jPZnmTdXgPQPkOAKA3COSJ6oDi2azAdWgNwgZvN0Jx7omnbMGcEBpy33yTHjXyJkSqPRSPnIo2YzmWUFhHYEsdobJJe/2aaJXEiHAeOO48VAQgX8MD5ywuGXsCi58i4GMj/COU0Fu1qt1njh7vsdXvw=;
	24:qB0+v5BgBd60fLCanDdwIPWC45Ujk2RTUzNg0FUxzkXb3DSDMt9Xwl1jQ6ICpH0DXYPpjwezkm2HSmRUZQSiUt6dC0dQfNjAmk2JcZG0u6Q=;
	7:R3ZtTJbREavS5rDfad2wjvR+qinWE1tgTXdT2C//rUQ3uUTsvHDZoCRcPXxsnlNHMXdTlfw15lIpNytREElx8kClJjU8XqrsFVtQI+U4NLdlFoTdsl5uziIxGd1hK6GniaUbXxbBpvfCq4shqVGt65/vcDVrFGXK+RmklFeC+2loznUbrXjNlWkhu41UdbxqTMbDRqgXaSJUR9j/qgQb2znkqvhCV7TBCbrmJXG0azA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2017 23:35:57.5633 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
Cc: ben.levinsky@xilinx.com
Subject: [PATCH v2 1/2] runqemu: Allow the user to override the Kernel option
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
X-List-Received-Date: Thu, 12 Oct 2017 23:50:04 -0000
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


