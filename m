Return-Path: <alistai@xilinx.com>
X-Greylist: delayed 1951 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Jan 2018 23:26:30 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0046.outbound.protection.outlook.com
	[104.47.37.46])
	by mail.openembedded.org (Postfix) with ESMTP id 80A9B77D01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FQI7btN6b+HPmOshUc9Ifbo8ZVDdfk/XjX5HHMdy6MM=;
	b=zYKy77vh8t5/OMY6xu6wwjIhUW41zURWdWk7oLh4+W0KQrGQkgrxduCwE23DQjQqZ8QCQBbhEa+7ILZA29fo19BCpx4KDjBt9DT2DooTbRRNmDQMfDHrFh+nYXubkTFkjpMiTFUpcxBvsZhNToJrOFQADPqw9NvRT41tMg6JY9c=
Received: from CY4PR02CA0023.namprd02.prod.outlook.com (10.169.188.33) by
	MWHPR02MB3391.namprd02.prod.outlook.com (10.164.192.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.386.5; Tue, 2 Jan 2018 22:53:59 +0000
Received: from BL2NAM02FT023.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by CY4PR02CA0023.outlook.office365.com
	(2603:10b6:903:18::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.366.8 via
	Frontend Transport; Tue, 2 Jan 2018 22:53:58 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT023.mail.protection.outlook.com (10.152.77.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.345.12
	via Frontend Transport; Tue, 2 Jan 2018 22:53:57 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39472
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>) id 1eWVRU-0001z9-K9
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Jan 2018 14:53:56 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>) id 1eWVRU-0004C0-Ik
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Jan 2018 14:53:56 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w02Mrr2i031655; Tue, 2 Jan 2018 14:53:54 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eWVRR-0004BZ-Qs; Tue, 02 Jan 2018 14:53:53 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jan 2018 14:49:35 -0800
Message-ID: <20180102224935.23756-1-alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23568.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(39380400002)(346002)(376002)(2980300002)(438002)(189003)(199004)(81166006)(5660300001)(16586007)(50466002)(2351001)(47776003)(48376002)(106466001)(81156014)(51416003)(8936002)(316002)(8676002)(7696005)(6666003)(106002)(50226002)(2906002)(6916009)(1076002)(478600001)(9786002)(4326008)(107886003)(36756003)(356003)(63266004)(77096006)(36386004)(305945005)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3391; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT023;
	1:8qmKPd1mCs9nEYcip3Pyjj/CSVQ75oz2AnYRFS1nVlzF1FFYa2wzLEJqtPJQfR8zq0wQJKYXkOCjMo9hw3vHsGJRvMdQtkUqGNCQa2JRaQ98NYVkDL1wzFH1kP3dI+v4
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb8a2f23-0000-4786-b9a5-08d55233b54a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	3:RwJV0arr5u8ESwQc4nkRuRzyRb/T7VjkfOfXu+pgMegtqlLR66nBRAKMrsnxnOdNt34g4+gPTQk1iY3TjWeOKutT2FagOdSp7Niiql6/C6lJCm/BITuWQkNSx8u/KV+uym8QcgL/EV1INFpvo5nnyssG04pberlMxu3XM0zBr3a/rMaMBxj9JZMP1X8Ul2lRyaRrvoQ1jDXXWSu+vI8Ukt7z41QBJLBNUctfL/l0lPDRoGCzMKZBcLx0pJDemUfyQQ3viCxEVkDVRjqX5E75TcT4WODoVKajd1HyFMfOkWYg4n1nU9wY4aFudCUAbbmdEQXzg5r/jVFQSxv9jd6giYFNuwrKATBfdglzcvXhYaE=;
	25:wYc5fZaO24CSOcuGy1szjjR2RKDK3Xhf6nEZqsfGix1c4tuxO4pxe5XTLaZCWPe4ZDqLMhHnOBVuhFxzltIT4xCH27eLgM6rbrKDLx6qAv9+dNBBkhf1kB4bCPoBU+9mZyU9eebAGnYDOp2joQ2qZ4sy8R0uNXpxn7xT+k3igctPcoJk8536gdrI1R/GzivlK9keKuOGLb0Hzz9JlD/lA7RNTWFptMuR6jSy6dy6PZxtdswDcWrrjj6OoxBwW2xrYbCI3VVL170bb6qCsPax4QIuPm+9JaSCW7/nSQq0UklqLL91KenmqsF11sIKgIEICOGKjNN1ALscRw3tUbC/vA==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3391:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	31:o4kmGVTYzJixQKqTE1ReHdx493YZKG9tO8lp10qgpIH75MOcF9QbdnllXEdD+CBwkXozfFT5RKU0j1A66a1mzBXHa0IAv818nDXpp8Al54VEWHST2QfQbwrCwzUWTh0KZFlQ1D7DsI4GPCh+S32coNJ98xux81XVjzN4Z93RXx85jgbBJOptzkQLb4NJzNXk95Abj0SvAVZSeXVy3gVYZnhVnmOQZ1v5vsBpZSidEPw=;
	20:lqLHjXNm+p0Io6eGEfiw6Tmeor1l5JqNWDV1AgaRn/wFeOodrq74T4BvIRfCDjKhckmdwFIicTexvugHl01qZOELxwImP3NAAcOH7ePd3iyJ7KBZSAgDcgSe0Hvhf9cEOeZ54E7hmpmOYnydRlVCmWHfTYYmwQ6dp55hYvlh5Vpmvr9PbqV838kp9hJgoWkWTnnkEQRKgX40ASESb0tjzd8ToVqKqa5zjtoI0f7SVS2i2seRzL/BbWP/2cgRP9mevoRrl2coiqllX4SEN/RI/uJtdurpCf3lddKkoy0Q4aRiOwu0LXjS9iJqPihGD27KnefFNbU6ma8v9La0fPzhEuS7y/fN7VGnJO6XR3Wvn1BikEem0XUGrjWpmax8+UyvECMGUdhilYRlzvcmQTm+BsBRHvDgyofg+kj5AlUVIFZFZ1iJOmJJ0nG0t9vIAjyfSKes8LEIikeBouxTqWErik+eUcUJno4tb2NUPlnQSfl5ZqA5xfTbqROXEmLzypaB
X-Microsoft-Antispam-PRVS: <MWHPR02MB3391149F1A9925DD4A6F0F4CDC190@MWHPR02MB3391.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(944501075)(93006095)(93004095)(3002001)(10201501046)(6055026)(6041268)(20161123564045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR02MB3391; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR02MB3391; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	4:K2+GHr3U06pr/5znkkyPnxajSPfNmCrSj7kWAstWbsGBaP0EhT867RUau69Vpu0RinO2StlfW4zVjGKA2Kg9A2e3Fdru9bqs9aCoGoJv0HLY+b1VbQCme5jYb9xpXwFYLF8ByKciAto5/GbahbGyzvwv5LR7zkxBptr2JmQQ36H07L1uteWTibS80b+vIJcJnw43N2TYdtZUU+MF4FWVnl/EaTn5Yn+N2RaoyNT68A0ie555ofCa4x3vfZ8vEZiR3JxLcsoAeYYTBkRs3LEWUl2tMr9+u27IQlDYbMiDmSbYThBvLZphLlXqzKzNiOUI
X-Forefront-PRVS: 0540846A1D
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3391;
	23:/pLcn7kU/4XjpD8/xgILVxzAC0pg7IGDGamyOUw0s?=
	=?us-ascii?Q?ZJSiIvMkqWrl6bL6cLipv2cwUC7xkdOCf5/jRcYWB/hlMEneDvzeordkCU6I?=
	=?us-ascii?Q?zFbsbYuL/snvcaMmFwKbNAbRsZTwj35skdICGnS4HCc98mcWhKtJtMyoeeq/?=
	=?us-ascii?Q?f6X2omH3twl9lNJfZ8bU3Azw1ZK7NecB/FURZnXONDaqnR7znWemcolxeJyI?=
	=?us-ascii?Q?Lj6bkIvmNdpKIxfww4LsGJx+2c/ePclmDMvgd563kjbcENhH/lq8tV3LEKzl?=
	=?us-ascii?Q?oZdIzC0wvDJ2cLSs/ocQe8W8gl9Xob1vNYeQs1S5GJlHmR+ISaTmsS5PSXhS?=
	=?us-ascii?Q?qwXAaV7jkcxLuDmxjzLINKyDF45ZBl5SleC1/WOOGgs2oJCT2rRPdgTsmjwQ?=
	=?us-ascii?Q?goL8UIC1OkNd7Pz8G3qr3M/IUgBVg7a1dOTWzORXiubhx9IIDhBCAGbHtqYr?=
	=?us-ascii?Q?wT1lrux68yHye1A2KIorDlTfGssbscxKyo79Ocjtb1Wx0G3b26rhaLI5ETao?=
	=?us-ascii?Q?tkpXcUUP0OE4gxxXRXmbrl50ZvAMc1pR1fdgnYxkW6PKr7huyRnh0OYxDfmV?=
	=?us-ascii?Q?NFcYGblfp+APQfsPK42oQ7fz3TGm91rnhVmmdalI6B1VPPU6PTa8myz3/TR1?=
	=?us-ascii?Q?EDJ8QuUabPD3QC1ZT7nZNw4AkP1P5wYySBJNuHyIaimH6VVoN+7+u1tsPdLX?=
	=?us-ascii?Q?TjxvPVZ8KJ+3mkuwAu+pYmrDnpsab8QcSMMx9fKZTW4khqGcpg2YYK07Y9kv?=
	=?us-ascii?Q?UFBpkSpSAhz35tfDZ+lHol+8+eiMFV914QNL4dtwEzhOUje3E2xc91Al7mrQ?=
	=?us-ascii?Q?rrRGGajlnvDj4I3XklPcfLht0/yvFeqwUt2qIA/9y0nkY51Kjvc2JasBoj9i?=
	=?us-ascii?Q?2hCyh9rbBVEfEdSAUrmf/dLD96QGDHaA45eUvoaA3jqYmHLqKgmMU5odKBuf?=
	=?us-ascii?Q?CS9M2gnGnX5Om7R6TPGG9LgMMSeYUj5zOwkWiI3fQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3391;
	6:UegKYe75K8qmFsl6S7ZOr/6XVqocmZkByC2zmBEYBQeioHLEeP2OrwnZNejc8fj24IEllx3g/+0jlFGGdNw89l8ljseQlougAvSqBAl+BFvSFshLP54njI+/SYj/GznOfINDNSBuB5IYQ/CvJ+4k0z7PwSwzOERVyMYu0hivNW81hzNyIAz0iPTryKd8WYTfnCmvAWeyOi/6ES/fwvcb37NS2sInKibCaOtoOTe+a3OXA4wnjmq1ZyEF77b8FFvzzqXNmx+z8jqSF+O1Zv1RJRsO7TJdQlpXruHhYZ3DW6EtvTFxgYag6aub7OoWS36iK8PLchiI0YFRCIE4KKxJeGof6Oob/+5R/jvs1bH6S6Q=;
	5:ZqUErkayljYPRDdLUNzOxMfKwNVcPZ4roxZNnEARLP54/kYSaPP7YnP9Yz2Wf8hNWESWIhWsXMumiQa6Ed8y49a0SjEjsqt/MePd0Y9c1/vLt/f98rKWZ6J7Tcca0CnlSgiyEUSX3Y4AxR+fMz7cLAQFWNTvoky/r6KjmwamAIs=;
	24:sXCxZrd5KrVYBEpBmpnpRJKEzJ5siRKoqm/c+qiTimKeCbDIxzLiuTveVS+Bwk1Ix7WLxxu+RxFppm7Ua9C+MfjpKtiB1ZB/mbJLmzw52MY=;
	7:kcJMj0xNtWaVIM9isxJrOmYcH6uAIN4gtiZhQlUfBoulYFjCpZRXHTO5aj+4EWIF+QJ8Wwi4fU7bZYTyZNm4/xH6ZvJE0y5ujxa1pbNfxJBgS+8ZQ6I/zRGT6s0D+fIjlc8EzrNyHKLj3kEyvqs97naCiMu8yiVk1prmK3QrVYo9LBSUfUqjqfER1pHgFnV73Bigs4zauHpZovm6+gavu6Gn8x82pmY9BhmOy/eCSduAF3rN5+rSExlv9XwYeVso
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2018 22:53:57.6176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8a2f23-0000-4786-b9a5-08d55233b54a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3391
Subject: [PATCH] glib-2.0: Remove python3 modules when building for mingw
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
X-List-Received-Date: Tue, 02 Jan 2018 23:26:31 -0000
Content-Type: text/plain

Commit "glib-2.0: Add python3 modules required by gdbus-codegen"
(26af3b4b33a34d7e53059b07236f9d5aae5e004a) broke the MinGW build of
QEMU. To fix the build remove the python3 RDEPENDS for gdbus-codegen
when targeting mingw.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index fbc655a012..f8e803a90a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -121,6 +121,12 @@ RDEPENDS_${PN}-codegen += "\
             python3-xml \
            "
 
+RDEPENDS_${PN}-codegen_remove_mingw32 = "\
+            python3 \
+            python3-distutils \
+            python3-xml \
+           "
+
 RDEPENDS_${PN}-ptest += "\
             dbus \
             gnome-desktop-testing \
-- 
2.14.1


