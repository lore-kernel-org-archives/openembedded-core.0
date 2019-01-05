Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 82559 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 07 Jan 2019 01:02:50 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820088.outbound.protection.outlook.com [40.107.82.88])
	by mail.openembedded.org (Postfix) with ESMTP id A34846B8AC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 01:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mCNXO/n5GChmkUu4hft1/tQKcFEHVJaSH1P9IN8RE1g=;
	b=BYJsrBtsDRBPh4+X0oaTkASAMfWof0p99Nsnpj0GA9M3BzhjEwLtrW62OuL5pQmU8RwgkB4tfG9jgxKyx4wi6NdG6+8vq4aL/Wj/4oOFygm3T3pGUNhb/YeX0bWFPeeAZs4/Q2y5+VTzT7S2CFz7Cd8Wrm7g8zBU59GRHrczMwM=
Received: from MWHPR0201CA0032.namprd02.prod.outlook.com
	(2603:10b6:301:74::45) by BYAPR02MB5224.namprd02.prod.outlook.com
	(2603:10b6:a03:68::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1495.7;
	Sat, 5 Jan 2019 21:17:06 +0000
Received: from BL2NAM02FT052.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by MWHPR0201CA0032.outlook.office365.com
	(2603:10b6:301:74::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1495.9 via
	Frontend Transport; Sat, 5 Jan 2019 21:17:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT052.mail.protection.outlook.com (10.152.77.0) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1471.13
	via Frontend Transport; Sat, 5 Jan 2019 21:17:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45141
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gftJX-0001hp-Vj for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2019 13:17:03 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1gftJS-0001e8-SF for openembedded-core@lists.openembedded.org;
	Sat, 05 Jan 2019 13:16:58 -0800
Received: from xsj-pvapsmtp01 (smtp3.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x05LGv9u018364; Sat, 5 Jan 2019 13:16:58 -0800
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1gftJR-0001e4-PE; Sat, 05 Jan 2019 13:16:57 -0800
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Jan 2019 13:16:53 -0800
Message-ID: <1546723013-27417-1-git-send-email-alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(376002)(136003)(346002)(396003)(2980300002)(189003)(199004)(5660300001)(2351001)(107886003)(478600001)(51416003)(106466001)(486006)(4326008)(186003)(305945005)(63266004)(50226002)(36756003)(77096007)(6666004)(426003)(336012)(14444005)(7696005)(106002)(356004)(8936002)(47776003)(9786002)(48376002)(50466002)(81156014)(316002)(8676002)(26005)(126002)(476003)(2906002)(2616005)(6916009)(81166006)(16586007)(36386004)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5224; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; MX:1; A:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT052;
	1:MIfq9xORXgu+c+TOv1eNrOuWbyY0c9kO1p7+FbG3/sVqg6TfUw6iPb+Gx8OApkzrC4xwyUN2isINfdSstODfjB2EGNjJzSnmCzd4e9EHO/Rkgjvi4uccLSURC2aviLbR
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d4384a-f07d-4cb8-0356-08d6735324a5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4608076)(4709027)(2017052603328)(7153060);
	SRVR:BYAPR02MB5224; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5224;
	3:9eCbhLARoPEDemQIHMR12OPxXbCqlWy4SBJiqoGEB8gg3O2NOQhIdJhENorMOlXslOqYWWRwQNm05kpR0AU5Ayx3orUewdrPFSQuKF87bsz6lwaNZ1og8XndXcgeRDkM8uw46181a6QI45Dzt4JQAzKFQbHXORg4wb34nwxl2c7cGBsy6x/jx8wxJW0zdmwi6/VBZO1AETQVWCbHmDB9YYzqLVWt36vsj2qTLOdy7/DORLue+4v0XBFp0C1lnvSwXvv0shBjT2+2J+m0xKz/V3xiqxPe0PY+3qElFQ7uYupfPCxXvU/ix979FxEHDvDCfNsRBh9HfYZ59gSb5vmWIKnYKsEDEcKT/tBgM4chbyyiyqXN6U2Gk3HjIVQUjjzs;
	25:MkC6LF6VWev2BPc8xKvPsECNOcBcREzF8WKuGsQHCjNKQ4Nc0z0KQ9Qt86F+z9f7TFRwVT5Ol9ZprStZ7nBevhXFpba6z1SlkKV58ReqlHnoOTnuunxRCJbTEAMytyrlbyZpUxpNIqockY9k4RS4gsg9dPHs79i6rtMHICBkZVisZ1HYbKxBL9OiBvDn9y9P5FJ0s2mO376byEd/YAFfpwbJkg3Aq9ot5IGx+mVXNgIdauSmQhL7HqtTms6+rI6fVJZ0g6qI6z2VjVitWNWFIUMDRFAkuO5fKI9mWd2LEbcTb5kJRGp/N4+KEGqCZkCR4p3RKX1DzGgARxBgQ+pIww==
X-MS-TrafficTypeDiagnostic: BYAPR02MB5224:|BYAPR02MB5224:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5224;
	31:EslWWhA5iDZwdJPgrF0NMq84P2SK38MXU7HD8alpkW0c0rNNDGRYvzv/mdfRTWFSjPMPA4MOOgluEkUsKan4pE16bTv83kEetetQMrAnvcB5Ywv069/wGG8CPUeW1SPcoPFtm/YqstR4HHTNHABtW2d5nKxr6VipjBnkSlQcuz6n5f4vat9HciMpuQ/YsV/khGY2WhU70NbkO337AxNPEZTMJr+Ei9QVXA4/FAL5PCQ=;
	20:M1noIzsmArAbD/oG6hEJsmB9hk2MzBz3S0c3kCsGn+NOm1Gkm6H8HtBJGRBaNs6JB3Z+0giZk5fSsNgOzz3990zdTSKS5+8XcS7u9zaB0esmwUg8xG1FwbxLdTJ8Fu+iSKm0MDPj9msTsmyLveWsRJ1ZeeGokeW8NiCEjgAB2SMRVq5uHGbAwaJiJ3kd+XC7GfAd8qBRH4RG5ccpOIX89Ya7Uup9iXer07Nj9Nt7S4EfSHaZx3xsPPrT/9fM9IPbJrEIDG4MrA2RMH6nrTu2kmiixygs4EyHOhTgjbZ6OLzwFqHOqhvoCFdId8sy26QfLwQkzJynIptvqTzIoHkY4eUUdyqeSoJxUiaNY1hQM4UDuXU7MLE7+eAbFy7SsZ2WQo04G4MIwaLRvobtc/TVOPD/FCMuK0aBso8K/Yfed418gPgDXxd5tit2qd7DN5j7Ml3eIH4pBgllqxL+u2kxfTuduoUHyS43joduTKMiVe78r7hW99cOElwv0Evdp0yM
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB5224CB7B81F7B70B8C4C16BFAC8F0@BYAPR02MB5224.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(10201501046)(3231475)(944501520)(52105112)(93006095)(93004095)(3002001)(6055026)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123558120)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB5224; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB5224; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5224;
	4:0A2LwgXgRPQvLTOwMVE4mB6U1eyESMy0Kvy6DYvN0V990X2IARZs1DR++BOWLLzXB1/ht721/PM2Ssu6G0BNe/iv3EBlwQdNfKOOdthvS4S1MtmY/xc8En595zCpVg4ibybi39ocX+2u7u0daGSvyeMbL39qCxX4UEMBZQMbe7qNziwNj3n6jtpStnJxCNd42JyolJedaDAdWnjmhlIanJLo4RBwdsGEVgaiYaDfxZpDGobWs6TZGfylIkhyZTI18HcmnCBhcDQ2MBk/kQGIz3RdHVq+dUgbwTByTDUq4YpyJ2H+rXiqsRh4SC9GsdQE
X-Forefront-PRVS: 09086FB5C5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB5224;
	23:jzmVj79gto/Y51d8P+2AnevbEfCDT7tLvoQOQfB+a?=
	=?us-ascii?Q?RWhPrc7FqA4bfUdIy11MWPKjRZT15ue7wX5Sk+AfAcyljGV9q668zJfTgGY8?=
	=?us-ascii?Q?Jh2eXuA7r0TA/QgpRVzO94IjCHjUafSrhZyxVZzq/spg6qDRi18x2ypq0rHo?=
	=?us-ascii?Q?m/UbxBv6tzvJBbVy8zM7QretXhuRoa+Lpq95dj+Sf2uGDxUgUG8Jg7nRL7eV?=
	=?us-ascii?Q?H7Ws8KcA7f91CJeDjmdhc0c+t0JPL54xmEVxRuLHZPOGA0xX+eWQtLeJNHs6?=
	=?us-ascii?Q?fLa7m6nhxArmxJIXqdJk+qBBdv6zj3MaMUvenudhqxtSBU4fGUaJKuotr1bf?=
	=?us-ascii?Q?ajAejFeikAJYm3LeAZLEi8amIgGQcCnOJInQfbXEJk/HWn551FLYOeOR3bRO?=
	=?us-ascii?Q?PDF/QExguFeOur0CGlmij8/pjLwfH4s+XeZffrc5u7mAyTRsTF2Tcon2Fc6C?=
	=?us-ascii?Q?Z6G8wm35mb1nSu0ql0nAJYI3z5umnjSrBCRQ8oceuAeKRcn1sgGUf9Q7YwRj?=
	=?us-ascii?Q?hbxDkah15gdU6ImHlrFoGHYAjH+DPa/QbnfZNLzBBA+FEwn0mTR+x26mUagg?=
	=?us-ascii?Q?gbAS3rzzaOpm7XpRSi2AyODnfXh/i8VEMMWPCr8lDTAQOPuaTAy0k+ZMWfmp?=
	=?us-ascii?Q?8XnTzH2BrRqNOlJ9LQv2LY7Hlz5aQkCq7jBaCzHrQj528L9IZtks6R5q3YdT?=
	=?us-ascii?Q?joKXzoF0ZR8YfhtYrkkkcpQwNZk5OijM4YqnXW8hoEHGTIixPffDKRymXmyr?=
	=?us-ascii?Q?RmpwrsbEb8cw5WH4tRfzDAqHnw9ATreKh6Y1+7i5M6e/KzHHUU5KSnDUUfYK?=
	=?us-ascii?Q?79Pru4KF2NAUekwAK8rvJucq6X+W4DNbVuuBZQ54O6ccDRYwzDc2lN3pBQ1p?=
	=?us-ascii?Q?79OBIeydYU6f0J5vXRB9udy+xMSi2p+2QH49qiI/DDssCTJFE0U670mdqMQ+?=
	=?us-ascii?Q?m/fG/E2yJtarBp0XdfJwo/x1Txkgy6pms6lJdUu7AVJrcsaGm2PKKWx+mfI9?=
	=?us-ascii?Q?qMQI0EQPQEN/2xDc2oCSXoXPrzG2cgV79BWKYoRxD7LDNbzzSS+vbJrSiy+c?=
	=?us-ascii?Q?1YI3rj2UjC+tNNUTzVm5UrvTOm5?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: kw7MKzhYs0SvFJ6dJ8ldq61g4Gz0kUDyFvBhhZFp6z/YiaEGRYwfXpepAG5fqmDd2QZnqlf3l08ZYRxdRMY7XwJizp2ltp229INC1pCHWPIzOxhpzuVs0MdLmqRM9DlGWhrsWtTmSQej/MWF8Jdxrm1V46vQtWa/P8ccdHo/dxE/azSGehAa6mhWva6qsooReHhlghKAm+Vf4iEXkm9rZSmwGZE2Fza34gjtiFIGctrp8Tt2TIz+Z4T5/9Uck/2zWTdNNNmbydOhL1ciOYrM3dMXu8j/N7v4q190qEv34MbPgowhkC3+DyGBApRYRPtg
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5224;
	6:3kTg8Dt9+ByE38zLvR75qEPRcfBXffaRvCbUU3GZGTQB3IYNmt5zfbh1mnmuUikMlzCCHbtSOQrQT/uAr0OH/3cmcjiwtupS4DPkydLcKu0k1ax5y5oJp7BA5fFkZxDkUWdKFzDlv0MQQUq7Gfd4le6B2z/iyKdABWmsLNulKs+yHQ3X1vorQGDzAvo/Tm7JVfRgRvOM6JfE6TmPLkHwlXacyBtW7c/ml1vIf71ycbEmj/d8D6DwSkWrH+nL36bc5EEb4ssBoFbYHuGc9PXRQq2WKro5N+0QQo2UbcwTTAW6R72JXr08PSybsnf+uhRW9ZyRuZ7Moi6I7f9qgQjGOZMT1FAulQcHk0Ufj3wRS43OGrIsK5NVNXM7TXhX8pKLrhsJmEln+HBWhzG/jplpMjB885cPGrcvDKcmoyi31R7txw8Kq2OnY4DkjEOUGn+JZiVr6kLTFPHlNM7NeFvbwA==;
	5:vyxcgFaDY0vtKorPiZYYsGTX3hLu6ZYzLRTx6jaG3izZ76OOcce7wUFLZ4IpDRUo98vJsZiFOeujkuaXpLFp7vm+RBgeGHgZq18eFQAhvsN8ugtiKKhgsu1nEvdTTvJduWWb9M+TM4OCvKWORwIhZ7WRcDiMAxvqeYr1EuSeSLh/fZ9y9dbVwOE/SzhFVLheKqyAjmhSUnHzJBz2k0WRzA==;
	7:CjBgdkMboMPtVXxxs0/siREm5DnBZmWhr8osHXFld4dNKiAdtMp61RcMPFLzTrSdKqk8mDPQ8KDQDy1Oh558x+1gDGPMZzY/My04fqkRl79FKRnyjMD2iVg2433pJvOSuXpEdh67TVUb5MogEm+K3g==
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2019 21:17:04.8621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d4384a-f07d-4cb8-0356-08d6735324a5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5224
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB5224;
	23:n/osXlGe4kx9M7jm0bYbEvd1aH7XQx1oB4wvr6T59hbnm7P0zJZSleomV13K7eYJRvsocqWNw6QLeAymBi8H7+37Pz22A5AjlrGoVg0pPJgCDJOTsOj4DXaEIKLFQTyHQsh86Jb1ny48gSS7PQItxQ==
X-OriginatorOrg: xilinx.com
Subject: [PATCH 1/2] package_manager: Avoid looking at other multiconfigs for dependencies
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
X-List-Received-Date: Mon, 07 Jan 2019 01:02:51 -0000
Content-Type: text/plain

When creating the rootfs, we look at direct and indirect dependencies
and then after processing them we create a link for rpm/ipk/deb packages
needed for each of them on the deploy directory.

The process looks at dependencies that we've already seen to avoid
copying them twice, but when BB_MULTICONFIG is enabled, the dependencies
themsevlves contain "mc:<mc_name>" in them, so duplicate packages are
not found if they come from different multiconfigs, causing an error
when linking the package file since it already exists.

Check which multiconfig we are currently building and avoid processing
dependencies from other multiconfigs.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/lib/oe/package_manager.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 392fe7e..444da5d 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -643,10 +643,11 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
 
     taskdepdata = d.getVar("BB_TASKDEPDATA", False)
     mytaskname = d.getVar("BB_RUNTASK")
+    mc = d.getVar("BB_CURRENT_MC")
     pn = d.getVar("PN")
     seendirs = set()
     multilibs = {}
-   
+
     bb.utils.remove(subrepo_dir, recurse=True)
     bb.utils.mkdirhier(subrepo_dir)
 
@@ -660,6 +661,10 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
     for dep in taskdepdata:
         data = taskdepdata[dep]
         if data[1] == mytaskname and data[0] == pn:
+            if mc != 'default':
+                depmc = dep.split(':')[1]
+                if depmc != mc:
+                    continue
             start = dep
             break
     if start is None:
@@ -673,6 +678,11 @@ def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencie
         next = []
         for dep2 in start:
             for dep in taskdepdata[dep2][3]:
+                # We shouldnt care of other multiconfigs
+                if mc != 'default':
+                    depmc = dep.split(':')[1]
+                    if depmc != mc:
+                        continue
                 if taskdepdata[dep][0] != pn:
                     if "do_" + taskname in dep:
                         pkgdeps.add(dep)
-- 
2.7.4


