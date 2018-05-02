Return-Path: <prvs=6532fe5e0=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id BEBF174753
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 20:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1525294182; x=1556830182;
	h=from:to:cc:subject:date:message-id:mime-version;
	bh=fBH2eXNo5IlB8S1pg7hu5EAx9y6pAOmXNyrRcQ6qgAM=;
	b=dfBgs2oAgsPWNUjoG/AjR0EbcfeXkQld5A9+tPQDQ7jvHSHNY1tpPff5
	+O7uAJ+HP7x9OkfvDkcGcCCxaGPQd9g6vwhGNp3hXsxFt5Yy7CVJJg5ZD
	525fKEOwgnDfdSku6LiE8RUn+BA0VQ7m0Zg4U04dyanpVb1llpYfbCaTY
	HOjZFCWPZ1vA2hwMTIEsrWfLHphqbYiU7SUFvyQTpREGfrKVJ5RZ111vK
	XkOzm25qIogVkra2UwPg+P6Sozt1POgq1z387yE6cAs2AmvI1+mnLMV/0
	oTuyqzaFoPuW7pgeLy8wD09XOVTuBrG7594DaGDRv4C7HGyWGy95oGCz6 g==;
X-IronPort-AV: E=Sophos;i="5.49,356,1520870400"; d="scan'208";a="77951687"
Received: from mail-by2nam01lp0181.outbound.protection.outlook.com (HELO
	NAM01-BY2-obe.outbound.protection.outlook.com) ([216.32.181.181])
	by ob1.hgst.iphmx.com with ESMTP; 03 May 2018 04:49:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z4lQCVhcuoblpGljMAGYZvftGzEfmSLW28MD2hd4bwM=;
	b=CsqJoyz34nnNi0AB45SUJdnkYOhlsW71eOn7JAVELzRr1TtpreKDliuz7mZRedWKPNhGL7O8lL+pyPzBWn9V5h39LBCDPUm0HhbXv+pxxrImmfgq+azFKdxQe/YJzUGGUR5kh32XxOdxTDLOGwEANJGoE1GEYka6upB+meGZqds=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
Received: from risc6-mainframe.int.fusionio.com (199.255.44.175) by
	DM5PR04MB0412.namprd04.prod.outlook.com (2603:10b6:3:9d::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.715.18;
	Wed, 2 May 2018 20:49:24 +0000
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 13:49:07 -0700
Message-Id: <20180502204907.137185-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
X-Originating-IP: [199.255.44.175]
X-ClientProxiedBy: DM5PR1501CA0014.namprd15.prod.outlook.com
	(2603:10b6:4:9d::27) To DM5PR04MB0412.namprd04.prod.outlook.com
	(2603:10b6:3:9d::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0412; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0412;
	3:a8UAM7sDU+xO/UqHEA2nJqCUvDO3bYNIKGmFBH9ruUWeeDezsk4YJJ/KTlDbH9wqbpkjRfn8KmRadxUmIn/89o8JS6l7HjC9v3kbEnwnOq6tHSR8CuAa+O55pFKAMxNljwr4lQUzkNhFFaajhLSWT+mTXK+gbWil2vExLjn5t2yvSGkIk4/h44Obe5YueKmWBl0R121/Y7P82zZukuV67t6HTTzF5OTHPFQMMuVXRtQxgGJ8DVjVS0tCoHj80h3H;
	25:ntVr/mPdF/LkaYDK81rmHPSxevA8yUUYC8fpk1rXvBDgFB/eTkzw3brvPK8bwTpARSrAyEvOJ+Gs6lxvKIafIWar52dX9Dodoj4VdS8oV75dvfB+YgZa30/CraAaqtlqnvRnG6K3iggrdN2xgevAcr+NE1EelkE4Esyk97kJOMyf9pLmxfiv2BoQEAhe5EzbOm7HqH/rV9PM2i5DFMUIwLAL7oH69TattdRlmIw88hgugGcmEsoU4a8hciOcKvGau8T4WfoDm1aUb+G7OZuKP67bDwIhN6IfnAdO6Es50NtLCGv1IWvTgMNA7s0N04bYYiKMQXj21dCW55T3I1TLTA==;
	31:8TyWM2pFKqThbNYGnumVc/13XxMdzgjYYyNcxcPpwayr3lt3qZsZKIm3Tj777AXDNUGyUtE/HR21ze/DdxoSchBXr7+qQXeaxH8sXrbz/+x96jaOeNp77/h/AMOCQxARRpRdN2EPh9diGcdKRangKL5yuWTNX+l+O5HWknS58u588uiw2e/gMS5mgbrFYstge4r7gCkVSYHhaJcI7Z7bOaT9wXDzWCqrKKmvm7xEKOM=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0412:
WDCIPOUTBOUND: EOP-TRUE
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0412;
	20:x24/uYXPHuaKazgDsBN8L36jFeAr8fZ4tO1BAhz+2/2ZsOOLgD81XWDVwSKhnPzWCuD4tTE6GD4cPIV2PxdiOqDOEapFpiwqQbDpIpVuc+LcwoXV+RxprWoXyXmyEUIF2/uZyXuGce9LnxCErsBU1dyReBkfMCVl8StZoBIG6aRasCRnlq3cRq602PXNzMKKD4WKSEQ6+WNVtqS1d2+1/In546WlqSuF09AQMTmLH5OR+2IKmjJv8yfOTBMxwmObeozoxLlvkUL6ih2ji9+dDt+4w5pUbWmVgMt5dE0bmKm5O7let2l4nkZnAjw4vYcqHOFk2/VS1t0l9WrOPNSh7VPEQ4o9joNs0XDaSTP3N5OMFKjG1TSpZAZc4td7x096qb0F/MevSX/CPTBGDU5WazoBlKUuiIf7ZQtrbzy0pZYF8uC1/lucPp14ABvYBQ13q2zE5JDS6YSU7VH+ZoeDJvgQb2kGNP0iV+1PW7Qnx5OXGccV2Xiyi5Ok4ZgeY7MV;
	4:lxNDz/hn5PdRz0SDPngrn5z1ueYuqWXP0jvBIRMhMso15T2iOvEeCrkGKyiNmofxJzsc9ALYk9R6nCQpDYS+gOcOmymrlzBrZ9nLGtroTiyARH99EeFl0nuFGbM6VZWWsZx4d8IYVZI/FG/9T2gsQRslvc65MmhTvsZwkwZk1QJD/fryjsTuAqwoTkSMMRz0HWkIqt/t4p1cydB/0p3brURRmDg/FnZyRWJq9UetuQELnWX9mQSpZW3BHhXkp6dzoz0G/YqFJlhuPuO9qHINxg==
X-Microsoft-Antispam-PRVS: <DM5PR04MB04128668C8698878B686E75990800@DM5PR04MB0412.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3002001)(10201501046)(3231254)(944501410)(52105095)(6055026)(6041310)(20161123562045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011);
	SRVR:DM5PR04MB0412; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0412; 
X-Forefront-PRVS: 06607E485E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(39380400002)(346002)(366004)(376002)(199004)(189003)(39060400002)(575784001)(25786009)(86362001)(50226002)(106356001)(52116002)(316002)(51416003)(81166006)(6916009)(6506007)(6666003)(386003)(53936002)(3846002)(305945005)(48376002)(47776003)(6116002)(6512007)(66066001)(68736007)(105586002)(16586007)(2351001)(8676002)(2361001)(2616005)(1857600001)(476003)(956004)(7736002)(50466002)(4326008)(72206003)(44832011)(1076002)(486006)(26005)(478600001)(186003)(2906002)(5660300001)(16526019)(8936002)(97736004)(6486002)(36756003)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0412;
	H:risc6-mainframe.int.fusionio.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0412;
	23:w79MQHf+g3mUm+qDNzs9RA7K2HW7PUjA6KrWZQl9b?=
	=?us-ascii?Q?ou2sqLUmITLF6fhQGki/PzKX+L/u9QsfXPSSjnslYLFQuHKbnEcIrNROe8FC?=
	=?us-ascii?Q?VOi+b3RRPcNL0hXuFiQPngzc4e3YvMe2jTOXJyzDrBYKyGug1pNXGJ8gVz1T?=
	=?us-ascii?Q?jW80WmZ0aYtqMZmSZkdMmsFbYLY+WXSAoH3m70RW9eCEegEcmOZBm0mFD7nI?=
	=?us-ascii?Q?aNElVB2Mh8BePl+WDttiUQNYWY+A4lJv4KmkLyfmZ9HzDyv/Zjj/vGwiREfT?=
	=?us-ascii?Q?drUu0khuFrXtd2UK3XhNpjGyCL6gb3lIcW3Uo4wkeeTMc/SqdO3iaVF+TI+T?=
	=?us-ascii?Q?mqpBP2JIVR0jP7p+i+4rc8YKjuxDIMNbOnGChhQm4w9l7jdziwaD/EazXsqb?=
	=?us-ascii?Q?vBcJ5ejfdvhk7SSnt3jv/Ow9Fug0LS8THAqfsBNRjk1o8/wWBOIxPLfoHIrp?=
	=?us-ascii?Q?RIwskj5+BlO5wcBn1mLIf68OM+XJszSx58B6cO0iJ9RfplkAzOxb7AS777oi?=
	=?us-ascii?Q?BpmsezK4AYdlAaE29jUA61+rUXP/cuRPE2b41xwq/ugfShy8DVu+11Z1ObHa?=
	=?us-ascii?Q?zwtgu1+dUMtLdKXyjSOSRqKLRwjOHlTt9Ryfd04CRzDzeczd34iZjRigCuvl?=
	=?us-ascii?Q?LWs3eE0m39l1IM+WtFr2H7y56rv26Kd+zY+Ff4DyRGhjIzuKbo0zaSsnF0VE?=
	=?us-ascii?Q?3gIk8utjpeBSLHDzTdP3lIqgCMucZV3qjqOV/JpJoa2EuMdp1WY/5WvEuTjk?=
	=?us-ascii?Q?9/wYtWHCgLQWrW4jVTLgMFKzOw0ARF41/CZipJbBGO/XTeUz2BAFirrC2f9m?=
	=?us-ascii?Q?tJFdk6pQ6jueuzA8niIewHMd2LOLp7PnI+YEmljfLjw5aHAOT6RPdfY2UZUV?=
	=?us-ascii?Q?iAsLB5pQowNdViXBkNIs/dm1RPsUmjNUppHXF4T9k//1DAucFOFUK3AL0Z+U?=
	=?us-ascii?Q?zvJ2/j3s7IqAvr/kySYZUURfGYXL7j1eOGYEX3zLTF/f772MgrDlg5KnxjJB?=
	=?us-ascii?Q?47L7fnBylKaKsZiLX7k4DXOROdvyqCA+qcutl6KLBKUHoHvDNHbwCBMkcIbI?=
	=?us-ascii?Q?4CkPQ8YrHpJh13c3hwcvfQSP+h5dSX3gdZnzjbARzH5m2m3DUSQoebVI3nMA?=
	=?us-ascii?Q?/otMtQ9BuyHcYYlzkFbaefikmk/uXU58QUs51FVjFfGPkOvlSvu7cY06VS41?=
	=?us-ascii?Q?f992qI3NmTozjkJBI7KzN9SFcdeTpFlv6GgJWiaS4b71M9BdpNLu7YVNhrmx?=
	=?us-ascii?Q?0aK7H07O6iNsaMFJ5/zrDlfKwHwNbahZki/8ioiLoBNGPd9fw8Z+kyKC1Tgg?=
	=?us-ascii?B?dz09?=
X-Microsoft-Antispam-Message-Info: GUXbNMdH7irnqCOd7TRcCCYab9xl9Lsjh4wUkghR1UReN8wpyFBYh5+dNDiccByzo4pskOuKwInrNiXaVwF5wlgWmgBHS69HeOmEpJyMcTYww/+D3JGFud6S/ws1ikkCfXFSrKruYaF0YCWftnN/Txa0wgdU13pni3610pD9mMO+Tj28Euyz4OdeD6/hzbZc
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0412;
	6:KP+ki5cgY5tjvR5DCE5ZdrYQRVw6KNFygiA/4ftIbolsUCudhCPn7brVqROGE6cnckf64PXhSvq+asqUDnNUGWz0aT4sEGixrTedaQosW958012CduXzXweR51/n1B24dPcNnzmNYaCyPrcnxY8LiIXSGm0n5/O8bKEZz7wzLaxGPwQiKU80Ev2Xk+1PYNOtf5i4GOEmZEDZFSiB0ULY8VwjE2cpBSMrIBvBihRM9mrm7SjOIxUdqSBPvVa0TL3z3QosgdEemHEd73MdY6VIWtUh47PUZqksct5wasBzV/8ugwfpk5GW94RELUZ7XGsuMnAqXh/udNLrLkTrhleKVxOjmLnsePTUxTDrGhL/Gh/4KWVlEZV0q9wDgixprMnC1jTwkgi2t2P5JXHhBjXEeECZXaOu9LLIQxCq+7eUOPMbuWMjNdYa2qtITCihoaNRKD3vu1sHa5nfHfwiMBkURA==;
	5:CKfQ+drf4/XOUeAOoXQJlMbbKKDsNdeb8cP65lEZegsuZvEFVcswy8bZY4t7SAJwzT0+AxjDRu4D3U75fSBBv6Z8Mgfd2FckAzrJ9IECsV4SVDnYAn3/xIVEaZSKBkdlRgkDIwIbVNsOXlKu4MhvGMJ22kWRpiQ9GN3VWBis7z0=;
	24:v0m9h7HE+XAO7WBdnpRGwH7EndJQU11PcMGaUc96eRgSc8+Mf7ysGI1lU2oJaOF7+0eZsHzT2C4N3R1qHix0OVCVe43FDVJgYSvYXZPR/0s=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0412;
	7:facncbFW/RnnHnK17mKopJP+kfkz5nkDIZgVU0CI+qiVnMzGHKydfL1Eyf2iH5hfR1e77v72nJvHWPK/uSuH809VZFhK1gJ643kLwTi224LxZXnEnftpxeYuvmF6+uCHB44TQBPykX8zyy9HidpvyrQiXenCpGoE+8DtbdxVI0E3QwNTEPx8xklNmY+pZx+ycILQoQknuMr9WsMVW1KQXcqXcdQ+Yc7QMpmtgQQM3rCMYW0wGERJr3AV3uyO5Mey;
	20:5Jd4BtaOMiOHGT56sn2jGIu9eDAzkIYUftqjuE75GjR52zsbBxL5MZ5TKT9OzSxKNV0ypBwkOuoaCtLcovfKUCKrkeWzUKCH3x7oGtzQclrwTqWjsKh0//yr9im1OYsZ4S8+FOz+B0CjvKcersmBrMlx7VAqOqkOhicrNm8CqjA=
X-MS-Office365-Filtering-Correlation-Id: 39b9d35e-a02f-474e-c3db-08d5b06e3085
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2018 20:49:24.6319 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b9d35e-a02f-474e-c3db-08d5b06e3085
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0412
Subject: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Wed, 02 May 2018 20:49:41 -0000
Content-Type: text/plain

If the user has set numa in their MACHINE_FEATURES we should enable
NUMA support in the kernel config.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-kernel/linux/files/numa.cfg  | 4 ++++
 meta/recipes-kernel/linux/linux-yocto.inc | 3 +++
 2 files changed, 7 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/files/numa.cfg

diff --git a/meta/recipes-kernel/linux/files/numa.cfg b/meta/recipes-kernel/linux/files/numa.cfg
new file mode 100644
index 0000000000..bb0f9ab20c
--- /dev/null
+++ b/meta/recipes-kernel/linux/files/numa.cfg
@@ -0,0 +1,4 @@
+CONFIG_NUMA=y
+CONFIG_ACPI_NUMA=y
+CONFIG_NUMA_BALANCING=y
+CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 3bb872a32a..e8fb38b8f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -28,6 +28,9 @@ KERNEL_LD_append_nios2 = " ${TOOLCHAIN_OPTIONS}"
 
 KERNEL_FEATURES_append_qemuall=" features/debug/printk.scc"
 
+SRC_URI += "${@bb.utils.contains('MACHINE_FEATURES', 'numa', ' file://numa.cfg', '', d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
+
 # A KMACHINE is the mapping of a yocto $MACHINE to what is built
 # by the kernel. This is typically the branch that should be built,
 # and it can be specific to the machine or shared
-- 
2.17.0


