Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 64833 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 26 Jan 2019 20:28:06 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820044.outbound.protection.outlook.com [40.107.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 779837C420
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ek9FNEIgc6Mo1czWKwSsBPDLWqV2qO6KGZRAILTKW8o=;
	b=a0TCJVY+eDy583cvrqS3qJewxwHlkihocS591BVArbOzpPSNTw9jrLoKCOiUuHypWXMa6/NGMpnvYl+YcGVWit9dIHFcX8qtjg/BEvBMeDXgl4veR1bEE8dhg8GYxRoj5DpfnlOmQu5LpTdRnlelNnLtmRdlur1IqTSrKxiQL9U=
Received: from CY4PR02CA0013.namprd02.prod.outlook.com (2603:10b6:903:18::23)
	by BYAPR02MB4328.namprd02.prod.outlook.com (2603:10b6:a03:56::29)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1558.19;
	Fri, 25 Jan 2019 19:53:18 +0000
Received: from BL2NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::205) by CY4PR02CA0013.outlook.office365.com
	(2603:10b6:903:18::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1558.16 via
	Frontend Transport; Fri, 25 Jan 2019 19:53:17 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT052.mail.protection.outlook.com (10.152.77.0) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1580.10
	via Frontend Transport; Fri, 25 Jan 2019 19:53:16 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XQ-0007sM-DV
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:16 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gn7XL-0006ct-9L
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2019 11:53:11 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x0PJr4Pf005326; Fri, 25 Jan 2019 11:53:04 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gn7XE-0006bl-Ms; Fri, 25 Jan 2019 11:53:04 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jan 2019 11:53:01 -0800
Message-ID: <1548445982-25182-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1548445982-25182-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(396003)(39860400002)(376002)(136003)(346002)(2980300002)(189003)(199004)(54534003)(81166006)(81156014)(106002)(8676002)(9786002)(63266004)(6916009)(426003)(14444005)(336012)(106466001)(2351001)(36756003)(47776003)(76176011)(7696005)(478600001)(51416003)(107886003)(6666004)(356004)(26005)(186003)(77096007)(8936002)(305945005)(316002)(4326008)(50226002)(48376002)(2906002)(50466002)(36386004)(476003)(11346002)(446003)(16586007)(54906003)(2616005)(126002)(486006)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4328; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT052;
	1:vvTnBn+qY0dV9/krbHRwWw5htVN6r3OlAIuI4FmKyL2zsGA+gddmeAViqD8whNM+YQlgTGQLoFfW4vE02FEPf+gqh+cMygH+W48dfygkmvzfXnW8iuG9CfQceNzqp6cECxpJVnN9qP+/PXNqmQHxCA==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4ce59ef-c4f6-4536-237c-08d682febfd6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BYAPR02MB4328; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	3:b5mDyWTs3hMr0kPQxnYDdk5a8v4sUHQakJMQBnPspDLy7UOW4aa9mKvzPrZZ1qXm6Lxdap33qQs7iPU3AhauzlOnFYDGS7JVN3qJuVHwy7H4euAP5wGoKBMLxw9UVKiFK4DBX1K8dKMGV40vcu+MwFJZ2P+YCKVKCeplCA0123B9gRurhh8sem3vIwJxIpP/nOuxJoR0yo1is0gQsBfA5+GeqeW5K3xatAldQAnbRH95/1puL1iPeE/27329ldJuxJr5IKvKHtWqVnW3mz1HixNoawvCbDKTP5xlEXRMYfNTv4G26h6vReBRGpb/AhlVWkHNSNzHFNMpA7uByUeYs37k4Br0jRVFwfFetYdXOxXTnDzQXTKQRANaPs2sclzz;
	25:7NXV30c0ID3lZvCx/L8hv48kQWFrDOEaz9wNxrOZjsydmNqrFikWdiu+V8+wpHmkGU5ARpkDEImBpvXoX6FQvbNVn8zZXmDya+dh/loCwVFbfcKNZQBPia8+FGqb/9sjoyU8Aa0/d7bTQynovNNlAEenVTc8998Z4+gKblk5O7OtW4VCfC/t7f9jnlnFoQ/ua+FRfrfat3PN9Ozma9aTW7Rc+KrCXCF44Rz4e6j4qtALb5umLxZ/UwqI8WONg4XL32VZC5jwZ79WRs52EWBJyIXmBXmrRHX8zxOpcekyYUWVaFxetj4TShjf9G0yFot7Mh6m7ucZ+dDAyWgjIoLNxw==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4328:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	31:pk29K/UdolaQz78SI9FaY3duvAakNZqS0iCEjS1YIXuS9lo6IKwo95V4KkSo3ry57hK3NHbUCLPJkfHmNWzAbSEK53ekJlZCRTzBaSDS6Cg9qZMGPFUE3LskwO0ryws+M/oyLZ8YTM2lNR3vEftBBFuLuJMTJuu/H5cEkZJO4VcfjIxvHlAq9DN+9aBdabae67OghlL4LdWi1Tc2YTTyunY6DXXoob4AkIFzM2RcX9Q=;
	20:e3E0yZ9Z0szhK1uauDV8A5NNeqCCe06S/DlVg0oZ27c9A3S6N2Ua2gUb/+U/yziQTiGy93trUunHcqGRcanu/9lQaWR5oWf8mcLeNoPFjbgCpaH1oBgqWQ0KtClFG+i0aMboJGw7uauIWWCG1tMIXVGDOsVWTATlEFKgaveJaK/Cg1REBHk7q3RwMqvSH3k3epr0yuOMz8C339+glm7WNNYUlZrtHYNWVMOftXY2Wu2CGDQms7aU5L7lPSuHTEfiZ8QVSk8Oqx+Hb1CJSMcr7FOCUffhpHumhs8N84jdTaakvPDk//4/5rkrqRWOPaOcsTGAsUdp5RHVL62QLYUDTh12UHoV2uCBDAPNEptBgUTFS+clZ3EQ6sOYhlqo5kcIzbJERnvIVLFByXgv7LLyF0h5QncQcNMoTCErlbOBt1+xrvZXN+7bWLBeFA1I1bCJHmaCbCRqfGcclXPGqE52Q3m6CYqlSNgkx6lR9Qwp2hlHOzM4OyEa9lNY8+l0GNVl
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB43286726865DE3F5076FADB4B09B0@BYAPR02MB4328.namprd02.prod.outlook.com>
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	4:Ylmk7oUuA5dVNo8H+Puar9euJ11Q+CTkafznEcasT0NMHB4nmz5RTQCLAiwCVWkp5WQEbJCn5RC06BQkdu1tIH5P2fNziNrItGV1T+rkYLLZ+rgvsrvJwruHGWiaUToOa4onelWUdWG7amDRn6XysQ8GOhieEKqtcuV0aDnzt58iG2YYV0IoEha9ATqBVX5stan8UCqpDRTEozaHWF+327JKWNFFgj/O6oMrn5YjT3hj0oZkB3045Z+vdXcaP4Pr/lh2AVAn6aEflS2+iDaIjwyXRWvjzThvurvZegJMX5YdKWGQbLX1/NzQH6mydRDD
X-Forefront-PRVS: 0928072091
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4328;
	23:VAWX993hOVID/Bgbnvsqb2lk05evU9eHrrno188nX?=
	=?us-ascii?Q?XGbH6JB6lR0OZ8oq+sT5hviZn8BS9EfnNrfSYR6FzhQMxj7dQUc0tp8F4au+?=
	=?us-ascii?Q?BQqq+lllkDIZIlZ4XA9xooeaTLz3xDO16O8IMIZQBXQVqVTx27hsJBan/VzJ?=
	=?us-ascii?Q?XA6XicUaHIlhe7a5ivimYAF+Sf4x20rgIhAULfeJkW5tgdcLueS2C7BMIhf3?=
	=?us-ascii?Q?IG7MQYg3DnG1Gg9Ehsxxf02mJzAhndavAi3sLSzCcIJEbdz8ZX3+VkkVJ4Uo?=
	=?us-ascii?Q?0uU3Vledw36/6wwH6Ly0yq6u/saU1H/WyGR6gDeVToDOLrZ22Sf181cey5u+?=
	=?us-ascii?Q?Yyo5N0ZQkQxviGJmqvnL2u7P4VOEvKuDzHEbUUfW4CXQ9NkVZjWsHrHoHmvn?=
	=?us-ascii?Q?db5nCxI8UFNCnQmMGhuLvVQ9rqBscia7fosk7cleiBnsKmvlu7RfekDzpFNK?=
	=?us-ascii?Q?uO3HzKyLs4XSciNmpePELEU0LN01thn3H+ZRJCiW2nePaYwOgTFDGngxhRjy?=
	=?us-ascii?Q?K5iT0i/ibbD4iVfJrMRa0Q9TYhzowK986/rrVYkMPp6Cyf0nYh8vlNREMWnR?=
	=?us-ascii?Q?kdMxUi4iNQFrLytVdRwPKX3IY7bFosdmq1xXnvfoAH64VJ+xCO4f986A/66r?=
	=?us-ascii?Q?XcAroBTPsP+KqaMnuqa+Srz7NIImsYzs+/Yk9uE149Az4xBxC4TSScOepPGS?=
	=?us-ascii?Q?RokTO4emwSglnhnImzoqG4EcE3U0JaGJ2c+4rEo8mHIxfI5GbeMe5AtTXDyQ?=
	=?us-ascii?Q?5STyPH6TIiXqLSRqBFKdxX7DUHg9hbS4l/t8z2pVBKiSjYuF0mynt2dCLUrR?=
	=?us-ascii?Q?bdlOMR0zEACUKUTT50aa4Glgq5Xch0HESOWIxFKeczY8VEnEd4SNrXhnuXYm?=
	=?us-ascii?Q?x6+8SX9IUN7aWJGlfJ5Q+0J5SQINX5DXelnHvp6D9YINL4yDbMd94yWrYF6u?=
	=?us-ascii?Q?HHVO+YjHK7d4aRjPn6uStXrwO5l2TdiKo5uPhJUVqtPWi1nb2dP7v/eqCNJ1?=
	=?us-ascii?Q?+GH7icCovzO8lXIii6udCuDgi6myEgfQZxquGvrwuMeCKrOnv81/tftnfFH8?=
	=?us-ascii?Q?X302LgGb8HGREdH2I4NitXQNSyXABRuJIjmhCNcu3eIrTxM0TjL9O0pKyX/0?=
	=?us-ascii?Q?FKYcJ2S6Fwz9Lt5NP+SNN1pcFuzf0BkparDMo+Cxg9ndacSv7ojKtM+UspTM?=
	=?us-ascii?Q?rlAotKloZuTWGcweJrJw62bjtiNvhYhgj41?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: pjRl2DQpqwTzUO2q+b+8Q53GhhifwdmYyHePc6Xwtsl3SZP9nDFQn+8EDUmOGsTQ/LKsOoi41MN5Y/CEZF1raA7zmkeuNwP8m+sFI/J4+oOpbKVlcZmKLZC8g9LIZ4fINoq4okIW9NY3qtRcBS1GAG2uU4EiHLGvpQODWLVoxTBK4lcl32+YE1hU9Chw53DhArK0Wvp9jZXP5HOr8ASkP7bU/m0GctpEoJDK0oMcYIQqs4yACMhAJgVP8QjPs/DgOiv6Xc/JJhZUeeLCx5AlejFS9ALzUKhSv/QN531AFw2Jkf+aI+a0M84ZSLJJ8Wh9FhQAZZiEBFNIcBMyNoyW9DRF0Mn5HI8F3W79RCx9qICJMxL5NRywrzRWL6aS+IPQjoxiK9LjNA5qf+Pmj67vO2qKZwZNKPevdlJejCtBuLw=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4328;
	6:krRP8sFeuHPFD0Vw7Nd90vdcLFx2SDpm47cNO35BsWk0Xi41nZvez/aP2OXCFeTCmlNbsYy2A/n9C2N86BWJPnZm3a5WZ8YyVR7lHkyg1a5TpTe6NR1p/Hh+yMqsNUQWDoFtq7cDjBPfP2yhh7jqtVAjByjNgG+9fZ/DVeEvP93gpYb0WpT1uin0s793SGRq+UyhHpIJV1wJzoyqFMxqKq+9IKrHDRrpuadh1oC9x/RPyXWDHblRRSZadDJ6esP2q/TadQe/eWcTr9yc7MdMe2xer/F2JRBz+UQppgMR1RHqlXee+VNVTp8bvv9as/wjjqfJ2IBpHvCDf/YiIgtAKsq8trIWfSlVkgWyaJaUjDpAbEtFXIAzsuFytfBV/d6f8lFQWzeRtao7lbqxIp0dKAJc37NnEejuas1b0C0htkZ9lHFXnqV+qSeTSW+BU84alZ0jYWpoF87XYpFCp5GzJg==;
	5:G0J0HA6usyx8iUiGZjJKC9v3KkfRvyr0YaNuCEUNFVrXENx4s7pxjmx6xY5BqVRD8aKyWc5U+VCDew5EWGTbOlZJyeCNJ7P4zdCPpabb/foyuBBXPRn/BnLK5vVmpCgo2zl2jihVjWtDH2wGqaxiInapkZmJYzuGrjIc/xfTfdZ/hygKTPpZVNB47xM5h+c5xSeBgHXCipx844KZW2hnIA==;
	7:rbdlmKXoc+Keq4O8Wod0S10Nq/V5XuAJawuStzuTYHvbESyn/QLK/8KfuVOhgV3Afe8mNKBk8NvmTyoRqxfbxx8/UT1wzUDFHcPtFEPl+pP1+dW9J1NOIUMpbxl6FVn8gQfqT6ESLNH5AM+UTMcvIw==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2019 19:53:16.9548 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ce59ef-c4f6-4536-237c-08d682febfd6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4328
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH v2 2/3] devtool modify: Create a copy of kernel source within work-shared if not present
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
X-List-Received-Date: Sat, 26 Jan 2019 20:28:06 -0000
Content-Type: text/plain

If kernel source is not already downloaded i.e staging kernel dir is
empty, place a copy of the source when the user runs devtool modify linux-yocto.
This way the kernel source is available for other packages that use it.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
changelog v2: 

1. Add a check to verify the set kernel version by user and kernel version 
present in workspace do not match before placing a copy of kernel-source 
from workspace to work-shared.

---

 scripts/lib/devtool/standard.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ba1afa4..24a0168 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -572,7 +572,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
         try:
-            if bb.data.inherits_class('kernel-yocto', d):
+            if is_kernel_yocto:
                 # We need to generate the kernel config
                 task = 'do_configure'
             else:
@@ -599,6 +599,18 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
         srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
+        # Check if work-shared is empty, if yes 
+        # find source and copy to work-shared
+        if is_kernel_yocto:
+              workshareddir = d.getVar('STAGING_KERNEL_DIR')
+              staging_kerVer = get_staging_kver(workshareddir) 
+              kernelVersion = d.getVar('LINUX_VERSION')
+              if (os.path.exists(workshareddir) and (not os.listdir(workshareddir) or kernelVersion!=staging_kerVer)): 
+                   shutil.rmtree(workshareddir)
+                   copy_src_to_ws(srcsubdir,workshareddir)
+              elif (not os.path.exists(workshareddir)):
+                   copy_src_to_ws(srcsubdir,workshareddir)
+
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
-- 
2.7.4


