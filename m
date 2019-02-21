Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 97218 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Feb 2019 01:04:03 UTC
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr720088.outbound.protection.outlook.com [40.107.72.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA687C6AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 01:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=s7sg/8BZESNyOx6iP+dVIsanJDgB64hWM9ReTBuYTdg=;
	b=i/ji0lgEH0HbcWs8DltYKtGkX66ke96MjXc7Ylspb/POs9f8QFUBUG8/+ptKiRxL4qN0p/Ulfp8e88fndlS+ERo5HHEPj4BYKVF8+oWe/CKspmAykymBRTOS67ZLscNysfhp6vYZ5BJ07D+k13DqUEIcoNmFp+Oi3w2A4Er0awU=
Received: from CY4PR02CA0001.namprd02.prod.outlook.com (2603:10b6:903:18::11)
	by BL0PR02MB4627.namprd02.prod.outlook.com (2603:10b6:208:4d::28)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1643.16;
	Thu, 21 Feb 2019 21:32:46 +0000
Received: from CY1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by CY4PR02CA0001.outlook.office365.com
	(2603:10b6:903:18::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.15 via
	Frontend Transport; Thu, 21 Feb 2019 21:32:46 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT047.mail.protection.outlook.com (10.152.74.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1643.11
	via Frontend Transport; Thu, 21 Feb 2019 21:32:46 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwvxW-0005kK-0r for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2019 13:32:46 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwvxQ-0002uE-T6 for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2019 13:32:40 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x1LLWWSW014531; Thu, 21 Feb 2019 13:32:32 -0800
Received: from [172.19.2.216] (helo=xsjmanjukum50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1gwvxI-0002rA-Dw; Thu, 21 Feb 2019 13:32:32 -0800
From: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2019 13:32:31 -0800
Message-ID: <1550784751-9142-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(396003)(346002)(136003)(376002)(39860400002)(2980300002)(189003)(199004)(51416003)(7696005)(6916009)(36386004)(186003)(9786002)(72206003)(356004)(5660300002)(305945005)(8676002)(81166006)(81156014)(8936002)(50226002)(106002)(36756003)(2351001)(16586007)(106466001)(63266004)(316002)(48376002)(47776003)(77096007)(26005)(2906002)(486006)(107886003)(336012)(2616005)(478600001)(476003)(426003)(50466002)(126002)(4326008)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL0PR02MB4627; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad6adfbd-c567-4dad-2d94-08d698441f0c
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605104)(4608103)(4709054)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060);
	SRVR:BL0PR02MB4627; 
X-MS-TrafficTypeDiagnostic: BL0PR02MB4627:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Exchange-Diagnostics: 1; BL0PR02MB4627;
	20:8exLhT3ukh7qm983x1MXMdRGxdpKdw30QWPwo2P146CHF6EsXhq/44e6L/HKT5IngJdeet9tAIp1oRTiM4hXe+FMUJhKLxag7OGz0m58tyZVVxqPV8tjhcnLcClTOtwAShwjTwM0U4+xZ4Hs6hAoLB3tcTbVXMjP3I9GAEw5tvnTL5VYTZqDJH4aJU/zG/fJU8sWtoiWGl/cFwB/gbLD2Y99I9O/DhIhw3i2UYmX/XkmtscCKkTjkRZDwVSiSMoQ0f6Zu5NgImP9MiURmxC3hI6W5890ruZVex8LRVhW8S+sEuHqceLP1HIR+CSqI5wgKpk4uxfPPZGZa29yOc4wA6AilF0Pbka1xi1QNrS2q0XHukE4kIrvwGK+MtGKIK4WovEnIldJ9tUkEqlub0vbveBPTs521I2LaaFLd1JfpK8WqVLeaiujWLPQ7+vlBLIFMIniJxY6baJGVqYaVypQ/03zw83G+Bl/7FFh591/begsqiuFhr/6wOCTVcoUuyuE
X-Microsoft-Antispam-PRVS: <BL0PR02MB4627D01256D9142C6AC49A65B97E0@BL0PR02MB4627.namprd02.prod.outlook.com>
X-Forefront-PRVS: 09555FB1AD
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL0PR02MB4627;
	23:QBfxb8h0DG65xAF2M/mTdFakkbMhexWWQj81JOEdM?=
	=?us-ascii?Q?8L8enUoeJPoIRq7dSJ1W6VkV1cXc0w8YaDZUPzR98OHWwyY7qIUPgSjahun0?=
	=?us-ascii?Q?i0VR7muOz43PFq2Lju+smEC7BA0KKLWT1xd7+jcnbHkFu31XbsNloD0JjV3U?=
	=?us-ascii?Q?WIWcS9wK51IuFfhMZ6YhKnorl6HnsmZCibMYZnQ8cvhyx+fBrFmrGU6KppNh?=
	=?us-ascii?Q?BQoy3WewtY0D19XqhWU4ZpJnOl/LD/q+vqYpmAhDlJQcRpTxEoDQvgZnUW7t?=
	=?us-ascii?Q?xXe2BUpP90LyK+LaO0cwlnzOAwi1goojU2NGZuhOtDp4zslz4lRLKpGeoTw+?=
	=?us-ascii?Q?kcTrWMBfaXa3YdsvUHDUCBrO5Vw4Rz5pojtMr+UcC0SV+AJyspk439uUTLiK?=
	=?us-ascii?Q?N+fZBdL7HM5sMmu2Vq9jPKceC+0cJY43DpDkWqxkTs2/Nh4oXOdOPQaYaB+p?=
	=?us-ascii?Q?VaATdyDQImnIDvJXelywB/Ve3MstK+fOmtZEl9ef99K+Yi+Q9P4wvZCzb8+X?=
	=?us-ascii?Q?6FvDpCclGw8aVxKMRS3IyVFblqqyrv15tDBK92bU7JSoqXnQYnigbOekbGFb?=
	=?us-ascii?Q?XLrQRLuQNIC+pO7swjKNmNdOUJ4rTHVfoRQsHqGt/oHbPxzz3mfmKrKMG8nX?=
	=?us-ascii?Q?JtR2pJAmfmOROrpKC9o1rYVc3OnOm6+L7oR/qGTrFyiBnB4zyYYRyWiJg89s?=
	=?us-ascii?Q?c8cbjm9Wp/CX+ftYnn168elBgjhElG0Cm04Uh+RI/pb4fvNsOhZkqI9pUeog?=
	=?us-ascii?Q?xmw4OOxQWsJAlW3w9+PIhgQQyMekrKaT20cakWBKogIuEmfVy+K+gxPeDG14?=
	=?us-ascii?Q?B2gKYPrb7TLla8p4kQDX9T1m3XeNjf2u4XXmOJcBYIYxYAircSQ+X2kkajwJ?=
	=?us-ascii?Q?eDsIf3mKL9zO4tHZx0oHUQwEwZjkcXqwk444AriPeC/fQfmd+toiUylBpFYQ?=
	=?us-ascii?Q?ZRs6icv3NpGaRNp6EU0TJ4qZ/ocL/XEiJYxHf07i29f7qjLtpf2lqSXwggbx?=
	=?us-ascii?Q?FoOIFkv2fVojNrv6W64MJvWmorAgoziHVmTRbyGtg89mv/PjdmEf0wvT9/0U?=
	=?us-ascii?Q?GEYDTM/3mPj6X2OPeG/BOjCSUuWDLn0ncsEsocCyQ8Hw1LyEwWSEUB+l+XZB?=
	=?us-ascii?Q?8GjSbFIpqg=3D?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: UmDw6IJMX8JtEaNER2eGcH2E0e6pp3HoD3S3jhspAKN0fqiusby308tu1T9H7oXqnhkL4KqDn7EQhlliNE8SH3OE9UDthZVBlMKOu1OLnlPnXQNbkY+qsbtRZITv9ZjImq88k4HY8sKN7+JZuwXIjgtDQuQWB7DqDrYiFWheSDPpFR0utOxIgpsToF0sd9vlYUY2iSi3emTFe0U1q3k3pfT3KmoXyeLKxGCrdIiKtdzvVAyHkwy16jBqoJwjFzr+S6KHNejwfjMzt+t7L5CHjKs2HhWomhU4kr/tLWZqzE6CY5hA5k6HkaehwC84toWKcUNpGi6M+XjqayMB2m/M1cE52f8GK3WOZlHNS0KxyK2x67uwRNWTev2dU3k/GLotlpUnYoCJPkn7BHjvkhqok4b1RmWEZ0sp3lR/QzCvMz8=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2019 21:32:46.4322 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6adfbd-c567-4dad-2d94-08d698441f0c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4627
Subject: [PATCH] populate_sdk_ext.bbclass: Fix the derivate sdk build error from an published eSDK
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
X-List-Received-Date: Fri, 22 Feb 2019 01:04:04 -0000
Content-Type: text/plain

When you install the eSDK in publish mode and then try to build a
derivative sdk using devtool build-sdk, the following error happens

| NOTE: Generating sstate task list...
| NOTE: Generating sstate-cache...
| NOTE: Generating sstate-cache...
| DEBUG: Python function copy_buildsystem finished
| NOTE: Executing install_tools ...
| DEBUG: Executing shell function install_tools
| install: cannot stat /core/meta/files/ext-sdk-prepare.py':
No such file or directory

This patch will fix the error by installing ext-sdk-prepare.py in
publish mode, so that derivative sdk can be generated.

Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
---
 meta/classes/populate_sdk_ext.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 40b0375..800e117 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -589,11 +589,8 @@ sdk_ext_preinst() {
 		exit 1
 	fi
 	SDK_EXTENSIBLE="1"
-	if [ "$publish" = "1" ] ; then
-		EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=ext-sdk-prepare.py"
-		if [ "${SDK_EXT_TYPE}" = "minimal" ] ; then
-			EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=sstate-cache"
-		fi
+	if [ "$publish" = "1" ] && [ "${SDK_EXT_TYPE}" = "minimal" ] ; then
+		EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=sstate-cache"
 	fi
 }
 SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
@@ -635,6 +632,8 @@ sdk_ext_postinst() {
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
 		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+	fi
+	if [ -e $target_sdk_dir/ext-sdk-prepare.py ]; then
 		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
-- 
2.7.4


