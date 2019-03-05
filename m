Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 100959 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Mar 2019 16:22:00 UTC
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr790057.outbound.protection.outlook.com [40.107.79.57])
	by mail.openembedded.org (Postfix) with ESMTP id D056E7CDDB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 16:22:00 +0000 (UTC)
Received: from DM6PR02MB4220.namprd02.prod.outlook.com (20.176.76.17) by
	BN7PR02MB4211.namprd02.prod.outlook.com (52.133.220.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.19; Wed, 6 Mar 2019 11:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=36IwtJOnJ3nCsXvr+Tj02xwIBPV7zZ48Fh2H4KdN9S4=;
	b=KhyaKcB6tvc9pHEi2ZJGEbxsoJTPk10OYfffmku1D5IaPR4UIqud9tmTdPyXdND7BkpJwQXyhA9CGst4b+maDnsuVMiW6egqREsQ1sdocJNEagYLVXbiqNqDP0D1hEh/83HO5l54AIjqhojSNDLMdfR21TO/BwC5/1Qt48Yv9XY=
Received: from BL0PR02CA0109.namprd02.prod.outlook.com (2603:10b6:208:35::14)
	by DM6PR02MB4220.namprd02.prod.outlook.com (2603:10b6:5:98::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1665.16;
	Tue, 5 Mar 2019 22:30:27 +0000
Received: from BL2NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BL0PR02CA0109.outlook.office365.com
	(2603:10b6:208:35::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1686.16 via
	Frontend Transport; Tue, 5 Mar 2019 22:30:27 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT025.mail.protection.outlook.com (10.152.77.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Tue, 5 Mar 2019 22:30:27 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1h1IZu-000880-Hi
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2019 14:30:26 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1h1IZp-0005Ct-E8
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2019 14:30:21 -0800
Received: from [172.19.3.10] (helo=xsjbsreekan50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1h1IZe-0004np-Tv; Tue, 05 Mar 2019 14:30:10 -0800
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Mar 2019 14:29:48 -0800
Message-ID: <20190305222948.18033-1-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(396003)(136003)(2980300002)(199004)(189003)(44832011)(107886003)(9786002)(486006)(36386004)(77096007)(426003)(1076003)(336012)(26005)(6666004)(356004)(48376002)(50226002)(54906003)(186003)(50466002)(2616005)(2906002)(14444005)(305945005)(63266004)(2351001)(72206003)(8676002)(5660300002)(106466001)(81156014)(478600001)(8936002)(316002)(47776003)(126002)(476003)(6916009)(16586007)(7696005)(51416003)(81166006)(106002)(4326008)(36756003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4220; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 133a4529-1ee8-4bb3-4ef7-08d6a1ba2ac1
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4608103)(4709054)(2017052603328)(7153060);
	SRVR:DM6PR02MB4220; 
X-MS-TrafficTypeDiagnostic: DM6PR02MB4220:|DM6PR02MB4220:|DM6PR02MB4220:|DM6PR02MB4220:|BN7PR02MB4211:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4220;
	20:1+hQQ1QEUpSGMCtVuQO78B0PxyJxpFfvElTlGdprbr1dxjODIWFx2RwbG+HNweKwbHPzJWE3SzUaiXyRSMYT+vqyGZj79QOmvF9Dy+hhVeZIHvGroaw3e//EvEcQFQjS6dEjTs/3sP8QSWD1vwALS9483OefzucdkDhUh5FmTC8aoqPjCjLBm6iyGlCejs1M/j8znkflMDRn1mBYV6md+UVwB+Im25G9ugrQZyFWdKKh1PU6dm1QLW4mdMYi5AeMkFFl0CTjC4258J1HrBPrVB+Y7TkdfQp7TwokommlFQXU29WdAzKwmWllWzaHMqLBV1LTEO7p7uTyBAjfIOdrIqs5rynTLkx0vNYpMt+Qtzf1H/EOEjb28Sn2g0A1qIBn1G8N+abuZjDzIKAsSO6ApjnMNO6KvX2VLgGa4CqN4X8VDeyVKIpVcdUPPCslSFsKQbTCZDHJoUr4Rq2iC4qXwPgU1W90UrmVQyGbM1FJymn0GEJlL1Lbw43M66W9xJUN
X-Microsoft-Antispam-PRVS: <DM6PR02MB42201DFCAD5939B7BBFF05E0AF720@DM6PR02MB4220.namprd02.prod.outlook.com>
X-Forefront-PRVS: 0967749BC1
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM6PR02MB4220;
	23:bLPqDK0vuHzBMoeTAx3b85gUGCPG9OohACzjh8KEf?=
	=?us-ascii?Q?OOa9lVmK9yLv4Mfe1yYItDWZFLOPA0y5nWeVIeXGJWlnAHNQI8kYbrwD88NK?=
	=?us-ascii?Q?QrlwnOsyR38WlJ7OFr3IuN/RnI2DdwySCUUyEr5dF0McXWxEelqW95k8DH81?=
	=?us-ascii?Q?xr8JEB0yWb6nqT2ceMfJVdKaW1q4qMZIUa6WQXlJVbWRobhuCLbxjEmZynom?=
	=?us-ascii?Q?2zomBMk+ijbKyVsvayRDbly0Lzi79PUahjqCn33NpaPnw06KfSKNtuIqG2N9?=
	=?us-ascii?Q?KTP/rc5tyuQrgV5dZSKwbna+VoUL56VYA3oHhOlpIWZ/5AP1NC9wxa7sip35?=
	=?us-ascii?Q?YCBKvHtYEcG48HyzGt8zik5hpXD7Sb78AcSuCGoZBW2z8I4n32HcRjgfuXdg?=
	=?us-ascii?Q?Rztntia/6GdXqKepq0aY1s3rq6Ym/dghcOGJuIsMCuKOcaCNa1Eih2kI0+gd?=
	=?us-ascii?Q?VxsxWxhdyGpqjpsyB4XkOWIohmLQyBxwLIUd4pGvRuJY/vCMFfetNBh5N6DM?=
	=?us-ascii?Q?H3oOJz8iW4Pg693NvV6AjmLm38Xgpbtt2cshOGUNbwO7OKQOQ9Hg45vsLbgH?=
	=?us-ascii?Q?pVDvABCA+e5OjBLcarcU/SZU1TIblqVCD4Ihd2LaupfcGufZzX9R1nfGpcgX?=
	=?us-ascii?Q?jt+ZEToGv7jfRN/x/QdHzN7cQg4ZsJLAPlfB/s2Kt4SwkUb/ZwrVsFV/zYDV?=
	=?us-ascii?Q?S4ay4v/5saOnC8lCLMtqFocOatBR88UR8ax2TDIRZy+meeB+sVXRotErB8Gb?=
	=?us-ascii?Q?pYgDFgy77eswQRw27xKLI1CBAsfbhH+Wyu8CO3dCFhh3cQwa9axilYCPAfVR?=
	=?us-ascii?Q?Xnd+UclYxRgGbEKuRnpi1tYCljucUhpJvaXUa2gQ4ZxFwmsO7+gcCHF3hNtH?=
	=?us-ascii?Q?WWRA1jgsmOk4ypuLeVpyUYecw+a9k2VjAzBKCirWixx8P+9wcNjUpnxIFLWu?=
	=?us-ascii?Q?SVDfrhRH6uUHHjK1Du+jPNwJDRxFD89Ad6R366wPxUNhlui0wNiLRXMPDI3E?=
	=?us-ascii?Q?7BLlkYnrcLlNe+RLQEm1WG2REvoxEYLCJRMHXaDk30IpWDV6dcafpv6qWHX7?=
	=?us-ascii?Q?ih9xalmQMaO0jG8StrhQFCC8cg+1l5L0AlERh6a+z1CrfOQyJv50jRAq/Dml?=
	=?us-ascii?Q?1pdsZV1QIE=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: bVRNCo0jf4aR56q1Px1l15s3Mmv4Toq9HswJBAiT2riSi+hdNQBL2h7G5ZQ0DNmpoZvzAf84aR9GHLOGGKtfjceYTiHfId3MwKzEJjQyodvG3UJH2ATpGeFvBogKEv6PwHngzs0w5iS3t2begBDdv9tIXtp1iMV4MfN5k65Ww7cUqj7zrUc6rBGJHSWw8cB3l/Amrik5DBvZ11LLA0LXj6faXAmsmkU0MbeZeNTiQhThcvpQJF9yVwqlh2MXvkg1lnGbUYtT23eV/wKRTf/giDVP6xuwZ1fF0iaJoD9F3vQP3s8Qt88qYIWJixgcFDNyaVOHrc1huAYFr+uQywkomNOvzwhmZUXoAeKQY6sUfdqty3sgms797KfP6nM7hl9gNqNBwGRwXpGWg8GyC9276Arex4538I0wdv3A8mwBT/I=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2019 22:30:27.1063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 133a4529-1ee8-4bb3-4ef7-08d6a1ba2ac1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4220
X-Microsoft-Exchange-Diagnostics: 1; DM6PR02MB4220;
	23:JOdgfr7A3+T/TbqmHaX2kxLcEHRZZkTAIzItTkz5SEFGYHKE2BRAHMJH1+basIjmLOKMW8PzF5sI7J33nZ3PsIXAWM4QdzIQ/EJ/zawL6aQ7lExkWRxBY8gGlMRUmWQB8PqZd1z7z563cGZVgMX5FQ==
X-Microsoft-Exchange-Diagnostics: 1; BN7PR02MB4211;
	23:RbzxOC7xbfWpshQNiC6y/g33fvadPi4DLzQ+Hz0w7IrVTpCdHhnzSp4tcie3rpoQjUKN4/YJCCURKD7h1XiTx4cSkmwHzZAzGqFQWoiEnC334BXAaSe11u4PhCGnHJNskgvoXygA+O543e5xOLEZUQ==
X-OriginatorOrg: xilinx.com
Subject: [thud][PATCH] python3_3.5.6.bb: Remove setting of PYTHONHOME
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
X-List-Received-Date: Thu, 07 Mar 2019 16:22:01 -0000
Content-Type: text/plain

PYTHONHOME was set in python wrapper to 'ensure that the nativesdk
python functions correctly without needing to set PYTHONHOME in the sdk
environment setup script' (From OE-Core rev:c5629268b0f8ae0a425c98337d13e8dc83107e13)
But thud doesnt use python3 libraries from buildtools like python2 does
so oe-buildenv-internal throws the following error when running any
devtool command from an extracted esdk:

ImportError: No module named site
OpenEmbedded requires 'python' to be python v2 (>= 2.7.3), not python v3.
Please upgrade your python v2.

There is no lib/python3 in the path PYTHONHOME is being set to
( buildtools/sysroots/x86_64.../usr ).
Taking out the setting of PYTHONHOME in the python3 wrapper to get rid
of this issue

[YOCTO #13208]

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 meta/recipes-devtools/python/python3_3.5.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 2cb6504..c2fe943 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -178,7 +178,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+	create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
1.8.3.1


