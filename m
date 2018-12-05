Return-Path: <ckalluri@xilinx.com>
X-Greylist: delayed 41685 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Dec 2018 12:15:19 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760078.outbound.protection.outlook.com [40.107.76.78])
	by mail.openembedded.org (Postfix) with ESMTP id CB15C6D546
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 12:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=EYoNuQwja+gKvVQSi6oPhsVjLDTsmBTHInlpYCLOExw=;
	b=g1PuV4VgsI2NvtXgTgotoozs2AulzAh1WYtrKTvAfcZesuFkZZifr0zqmjnOk4htruHkATeao6KG9216SrfAzxpCip4WNUZRbySmnUcrscF+KJlMSAg2fKbYPsbOa739ReBdBpKkivKsVNSUEuqTHzedWkWDaJgTFjsyoWTNDyE=
Received: from BL0PR02CA0060.namprd02.prod.outlook.com (2603:10b6:207:3d::37)
	by BYAPR02MB4325.namprd02.prod.outlook.com (2603:10b6:a03:56::26)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1382.22;
	Wed, 5 Dec 2018 00:40:34 +0000
Received: from SN1NAM02FT016.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by BL0PR02CA0060.outlook.office365.com
	(2603:10b6:207:3d::37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1382.22 via
	Frontend Transport; Wed, 5 Dec 2018 00:40:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT016.mail.protection.outlook.com (10.152.72.113) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1404.17
	via Frontend Transport; Wed, 5 Dec 2018 00:40:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBr-0006rn-A5
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:23 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>) id 1gULBl-0007rA-UA
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2018 16:37:17 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	wB50bBFa005871; Tue, 4 Dec 2018 16:37:11 -0800
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1gULBe-0007qa-OL; Tue, 04 Dec 2018 16:37:10 -0800
From: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Dec 2018 16:37:06 -0800
Message-ID: <1543970227-15416-3-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
References: <1543970227-15416-1-git-send-email-chandana.kalluri@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(136003)(376002)(346002)(2980300002)(189003)(199004)(54906003)(486006)(446003)(126002)(16586007)(50466002)(4326008)(316002)(5660300001)(2351001)(426003)(50226002)(11346002)(81166006)(8936002)(48376002)(107886003)(305945005)(106002)(2616005)(8676002)(476003)(36756003)(9786002)(81156014)(106466001)(6666004)(51416003)(2906002)(336012)(47776003)(7696005)(76176011)(77096007)(186003)(356004)(26005)(63266004)(36386004)(6916009)(14444005)(478600001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4325; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT016;
	1:teXpi8fJZtcF4S8bEncEPZMgy+dSC2W9bFNEsw7uLpku0CtDmYblbxko6Tjic+Q00mrQfjCNbEkOJGe5n47lZoiV+I20B/LDOazukE2g7RLevP0msqKVAZ907d73nR+H
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcb9251e-cc13-4206-2cca-08d65a4a43fe
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4608076)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BYAPR02MB4325; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	3:VxDnW57K+Jnw0wXNqVneLUt6ACqLGyScRVnLZeFlNKkcqLCowKGP8u7tBeLcyPUTYYolhCHttRAuiJqKdw/VhGIUIQOFs1er6ly/sDL5oRFXMIgHbmvZcqNUsl/NO9tdFkdS5JzXl0Tjk2I4uTNRTg+Ij8QzZ4I90OG+0wJUSOxyHWizqAaNmKMOYnGMK3jtSgfIs9bbghosEeNymFtyTcBfEvlJxDh23f6awqzTCxax6g47vGyg/Kk0WhvLms196jBp1QMr9jC4mEN6jE8CoZHSRpcqEM1HkdDl1lrvsGE1vCtTbJgwNk2tlSkGdAXzjflU246AVSooAkaS/1iwSoNruiqA/Vh/cwlJd0m4jEc=;
	25:hFeNQsJxaEF6SEQCYd/nWdiMrz48NSQqUD1iqZxoSvnIM0mUU8oYmnO0lmJqriBo1P5spysHlw0gsyNp7ebZrvfgsfXS5PiRzI1XAcbW5Oyby9YuUXjzdcuOHepSIiJAcbzgmN2FYFU/skU9bsOhH0kSd4c5ahKsicX2gjbgeoC306z2tccDex92hyMFMGW9pZN3+kJfqcvO8BarnTZykMkF++xFfRqmSOv3LedNxT545ziC1frntEXwsQfugiVi+qv4QypQVfs6eDTasOFY899ZYp5aIP3G9EwBk8kYF3dJ1JToSI1wzYXYbBlZ9kK6k3DNGlUq/fdBSeoGMqR3YA==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4325:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	31:eCVrS9MTlWIZ3nAmZIEzKYomxlC9uVH0B0T/YsYY2c40i7hSipIgeLnsba3rDIfUPH1OxHGpNVtxFiROrDtq305aIb83eqnNW/0AhzZrR2crTYDFby6C8C9TUv3MZ04qOa87b2TlA365YMG7/gFxB2v9r5DPqEfRdnBzjaxd/p+hLXPxV3nJTHTUyF4DEbGq/mgqCgKuDcmVtqd9v2tcrELBOu68Y41j6SzyZVQl96s=;
	20:hZJw2wxWJlf7vnrpGGoJBMGdBiY3NJb7WcDS8G/x1VZ4EsB8vP2x+vhYhh7IQM9WE816eMbbY/nY37bO1nroOYcaVcNyR9GUGKhFxZVTK8TzckqGzDQn4m2lw1tlhuwTswN5QEOtX0CvnFqXjKcSgoNRRJAmcSJq0eJkuUERxOyUzxSKTwv7txlcvn5gjQoeKj5Kt5F5DqT4T9s9dkEMOuD80K54ZM488DIrcLR498XUEhQw03rGXt2gtkwFKQG40bsxHdyA6Z15P/EtIZU0yZzUjKWjUd+wfmBw+AW3YWbGrNLeqE2T6oJfjy2fGnsNwycY0zOPYAvk5fDHEgHQCpyewSaCbKfVrWas3EIBX6y0XUcLRVIFNBFiVmXmsdGheSt4Q9wYL5xd2C5/mJZSYFLXG69GQxFK5kN9Rt+IP7yzOpqxfEf69chYxXmCjV357N/zihoBUVKZjHq/9J0r1YRqolUznxYps0pDqbJpbn1sjPurWpO4C4bH9gFsSYWr
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4325B586A049B8D79CF8B177B0A80@BYAPR02MB4325.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(3231455)(999002)(944501518)(52105112)(93006095)(93004095)(6055026)(148016)(149066)(150057)(6041310)(20161123558120)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4325; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4325; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	4:51h4mHc5XM4R4KdJ/U9UPXsypIyglJ6TCNgt1oA05Pi7/vc1M2e8BceNrgMrkmS4UIHek8yMIXDPC/JtH2p//M9vFZUCXrPu5Gtp1UmZSJsOgTJr7bNfJwsJB5yZgJUqS4TtAXc0Y6N7LXSxDIKiWr+c2zxi3AgEe221xeXSgUQC4y2ieV9ISgTSbSQRBKSN5eYQxMDK6kz07by6J07poyzhwyshtaW7YW2Iu7fKZdN6WCMoDN3g2auUoUO9dxKRn8iRv3clGqbIWT2VAFP74A==
X-Forefront-PRVS: 08770259B4
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4325;
	23:W2M0+v/mrgJzHz0mDPdT8GcGr9KQLwGPO+HnZG+KU?=
	=?us-ascii?Q?wqdr+nw/fZicHdiOfxjZsrqxmpsG0GYSR5HVwKLB1ismsIuHMeMjLavtk/1E?=
	=?us-ascii?Q?rPjYx3/phClRAl3lu2+zuS6P6F9I4DHddmijgzQA2ToVUxyzJSDFqH6NAvJs?=
	=?us-ascii?Q?3URgoRE+gEYydjJySUPTilfp2w4ptrR7AW/RP+7v9eTVyC6eWxVavuZ6fmI5?=
	=?us-ascii?Q?ZH9tw+N0zxrC05Xz5k6oZr0Q+hvYZICgDNui/Q3Epf/6rWpK4wTqeRbnY0Dg?=
	=?us-ascii?Q?ErZoyxWLVoW8zy7tz6ZGMGNlenmeJNUdm0DLR0F3FW4RlssHKqnlLm/WtpHS?=
	=?us-ascii?Q?mWr1zY5wgEQ+16OQdeIDjN5kwTQ8jNxsqizqt1otHEbB8YQuVMZgzFv+IwL5?=
	=?us-ascii?Q?OfBEklE0qzAMo8bUAXiryXRSKxdC87Y8V3nGgot458F3tY9relTrUmMEkh99?=
	=?us-ascii?Q?e/B1UdEWYVLq5GXT5Q/wlGrPf7lfpSlSU0BucY17dnqTEOSw4ylt1wO90tBj?=
	=?us-ascii?Q?ukeoLrb7bWMRF6DOeKHNY9xUjEyCrtGTAGzVn6PN9EE2b6IG0MrQZZsNAAyd?=
	=?us-ascii?Q?6c3AxDuYJDpwTgfsC9FQi6TOm2a7VVhI4B7t+GysTVknrs9mCX55zf0HKURK?=
	=?us-ascii?Q?nJwNaQm95/ARbYfGt37sa4F0BZ6yFIx0cPkrxd/gEZOvviKs9umffoQHeMYA?=
	=?us-ascii?Q?HhpvbE6a2yy2WB6VjzgW5U8cyC1bYb7WQW5NwCEoOZIZbZPn0IL1jFdI5zW0?=
	=?us-ascii?Q?R8xzOuDunz78FUX344/B9crzDxzV5eeE6xjF6WT5pHlxMH61Xj0mphp/V1RT?=
	=?us-ascii?Q?rEXVrD1ThIH7WzUpuH4vgE+CSXtEST66zuzFN/r2tTwaB+/OkZ7ceFofZ5PP?=
	=?us-ascii?Q?PP1g0PfC5jVwg4BXe6zlw+GJk2gdcDSg7SYJaCdnuNzNhB859onDNJcW822g?=
	=?us-ascii?Q?7frRyOwfWZm+RUypiH8JyjfQdbc01AEsLB5RJmAxreAcx3jk5Zh6NigdFOlt?=
	=?us-ascii?Q?ktplBVaE0E9D4OLcTPnpZvwVNiwnMh0uORy2pNSjROx5Xxlqpu+hfWw5V30r?=
	=?us-ascii?Q?Bkok/DFlQgyvi/lTDM9xx0uGgFLm9d11pSxolDV/Eilp/+EC+kCx5vKEqbgQ?=
	=?us-ascii?Q?g29elCDd40=3D?=
X-Microsoft-Antispam-Message-Info: AuqvSpdcpYb/7VyPxLidpMYs71smkKKL+U+VtRuO/ruCE3f1EWqQxvotw/6hGCz4P/UUaTC3+qU7cshUhP60xLBDOAnpXSPbdbWTkESzJxzanDjI1ALQ9ZCcyRzwcvO6Jm08ZmVneB+YoQajJEMGncoUlZiltzTZhUgeZg/97nDho36sYG3YMz2fe3pNjta/12Ka8ygvF5UuukYwzJWUPo3CnsdppPm7UkaIBQODeNBHq31ZhrEQritcqOol4OgfBS2KF0Zy5e3sifjVo7sRx8h7AKyksjThgt3DIsYfV75TCAyNxlqbztXWjMEIuiWEV5ka9wekfM08Ec9ksYVnv/iQBH03xrL1QGI+uFZ9bBg=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4325;
	6:vwnjkfJgZWi2F5QH4+ljxL1D3a3+5VrE7VssuGrTkTEf2uGhEfujBLA5ce9z32vrUSGGtl1SYhwku8tc5l5CHdwTU3mxigFpmxOzqqf56hiTu1REl9W+sYseXZaEBO7Y+6Zov4u6Dxj8MXN0oL1VcmtHp+R4INAoKltGeSrkJTcjNNpxaeujurfZ/rSA0zM/qH+F+AXah0AHde8YLVfx00F5wTEJ1hYZkv/Y9MYtbxgfif9/EeexnNWK+8wxaKYS3cCan0xTG8cqA6g/0iPbXuqlyh8cgxKzMBvIEqHqNGhukY59w+LNZaCGx+B1wVYe51QcNfH6mJKOo/itkYjmhVvdvZdYoBLfg/FbQeB2YF+pFZJtvRYwY0Kvclg2tJLMDaJ5pYnOv2dogMwUyZJogkvTKWlam5hDhlH8xKQO27iMWR3AEqAFvRfK6AlVKCv6wYLwWnyZR0wqW10bp/IALA==;
	5:U45FEqwqAzl4fXmT5JKdubEK8fnNzYcmIwmeA7po0XiB1WfB94aXE12651ZN9ZyYu1pQXGj0rSq7kzoh0vyLm5h83CmArbBCIZ9qkB6/jIADHpffoe/Xa8+0TKLTw7JqmOjP6QdIp3TjEoch1UFDIIn06Fkf7hXyaMWFRWCyPVM=;
	7:DJcBvdUKnyccmPRdnp3WZNvZZELet+bXn97B6NYA1UUhd/99TVvntiDV/iFQNIUIOc7papeBnn4kO/+1sAvjb0Tfbejh+eOqA7/SXxBjcLTLze4jNFle3j0RIFVAwwc5Q2vy1qhWG76XKgIAMXcNFQ==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2018 00:40:32.9939 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb9251e-cc13-4206-2cca-08d65a4a43fe
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4325
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [PATCH 2/3] devtool modify: Create a copy of kernel source
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
X-List-Received-Date: Wed, 05 Dec 2018 12:15:20 -0000
Content-Type: text/plain

If kernel source is not already downloaded i.e staging kernel dir is
empty, place a copy of the source when the user runs devtool modify linux-yocto.
This way the kernel source is available for other packages that use it.

[YOCTO #10416]

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 scripts/lib/devtool/standard.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3a8222a..06a0619 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -567,7 +567,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         with open(preservestampfile, 'w') as f:
             f.write(d.getVar('STAMP'))
         try:
-            if bb.data.inherits_class('kernel-yocto', d):
+            if is_kernel_yocto:
                 # We need to generate the kernel config
                 task = 'do_configure'
             else:
@@ -594,6 +594,14 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
             raise DevtoolError('Something went wrong with source extraction - the devtool-source class was not active or did not function correctly:\n%s' % str(e))
         srcsubdir_rel = os.path.relpath(srcsubdir, os.path.join(tempdir, 'workdir'))
 
+        # Check if work-shared is empty, if yes 
+        # find source and copy to work-shared
+        if is_kernel_yocto:
+              workshareddir = d.getVar('STAGING_KERNEL_DIR')
+              if os.path.exists(workshareddir) and not os.listdir(workshareddir):
+                   os.rmdir(workshareddir)
+                   copy_src_to_ws(srcsubdir,workshareddir)
+
         tempdir_localdir = os.path.join(tempdir, 'oe-local-files')
         srctree_localdir = os.path.join(srctree, 'oe-local-files')
 
-- 
2.7.4


