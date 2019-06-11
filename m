Return-Path: <JAEWON@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr820070.outbound.protection.outlook.com [40.107.82.70])
	by mail.openembedded.org (Postfix) with ESMTP id 0F52E60111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 06:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gpCt59WDXGoDqtPiBDB/TCdHqQxDB6PGiqK/7cNrSeo=;
	b=BBtMOPY/9lGFTufhvMe8VN7hVQ9CLzTNrdi4LARhyuleBlOxE0zYMJIEA8OwQVQk7snnoLSHvFkXwZCIpb1sldi3TbudSBVIcav4d5GjBNRdKTFvH6PcYAFMhSOlaeChld7qG4DfgtqOKHyw7IJtZlKzlD4n94nXsMSyeSFsPM4=
Received: from BL0PR02CA0075.namprd02.prod.outlook.com (2603:10b6:208:51::16)
	by DM5PR02MB2684.namprd02.prod.outlook.com (2603:10b6:3:106::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1965.17;
	Tue, 11 Jun 2019 00:36:12 +0000
Received: from BL2NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by BL0PR02CA0075.outlook.office365.com
	(2603:10b6:208:51::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1965.14 via
	Frontend Transport; Tue, 11 Jun 2019 00:36:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT032.mail.protection.outlook.com (10.152.77.169) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1965.12
	via Frontend Transport; Tue, 11 Jun 2019 00:36:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1haUln-0000F0-6y
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Jun 2019 17:36:11 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>) id 1haUli-0001sq-3i
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Jun 2019 17:36:06 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	x5B0Zvho018324; Mon, 10 Jun 2019 17:35:57 -0700
Received: from [172.19.3.42] (helo=xsjjaewon50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <jaewon.lee@xilinx.com>)
	id 1haUlZ-0001ng-BK; Mon, 10 Jun 2019 17:35:57 -0700
From: Jaewon Lee <jaewon.lee@xilinx.com>
To: openembedded-core@lists.openembedded.org, alejandr@xilinx.com
Date: Mon, 10 Jun 2019 17:35:53 -0700
Message-Id: <1560213353-22828-1-git-send-email-jaewon.lee@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(2980300002)(199004)(189003)(44832011)(2906002)(305945005)(486006)(50466002)(6636002)(48376002)(107886003)(72206003)(316002)(126002)(36756003)(476003)(336012)(426003)(2616005)(478600001)(5660300002)(4326008)(356004)(186003)(51416003)(7696005)(6666004)(50226002)(54906003)(16586007)(26005)(36386004)(47776003)(77096007)(9786002)(70206006)(63266004)(70586007)(8676002)(81156014)(81166006)(8936002)(106002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2684; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; A:1; MX:1;
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 734f6a96-2dba-44f1-cb77-08d6ee04cdc9
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(4709080)(1401327)(2017052603328);
	SRVR:DM5PR02MB2684; 
X-MS-TrafficTypeDiagnostic: DM5PR02MB2684:
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <DM5PR02MB2684E39F79F3F7BA8AC97ADDAFED0@DM5PR02MB2684.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 006546F32A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: 4z86/vhBVibfvhiRpVZ8z2AORiENZl1BL7LHve39EvU/mk35FNYy4DQk39Dki7dCwh69cdHaPshbBJJi3B/8YzEFwm7vim0ShJPDWV+/EEVFyzmLPSf0E6+z6ZNFoY//OdckqtYzF5sI/H+FRgSgDUtjjoyP8u4ATZwVWh0ov20tBDM4A80JSJGZFYkbisuPsy/+7ovfPRBOW9/90FXmEkLa1Ruth+rfjt8SYGDlRIs1YHMyX9LSDG8xUW5wJcDj/6pGWFr6tNMeyUJhmBxgJObEqp5AeJNErWjmLfuS0Wil88gUqyxuTGi+CS2XfN7efHH/e3LiFqRbTITgj5jLkDc3sxEn9VNc5hjGpSvsfYw8+qihJVTeWquUl92OEZDVdJymB3SzW9LcpMIUZCYjTKeGJ+1Z1MVW+qjO4/Xkn/0=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2019 00:36:11.7606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 734f6a96-2dba-44f1-cb77-08d6ee04cdc9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2684
Subject: [PATCH] gstreamer1.0-python_1.16.0.bb: Override libpython dir
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
X-List-Received-Date: Tue, 11 Jun 2019 06:10:04 -0000
Content-Type: text/plain

As mentioned in upstream commit a2cf84affff8a78fdaa8fabcfa9b40be1936678e,
"gstpythonplugin hardcodes the location of the libpython from the build
workspace and then fails at runtime."

In other words, PYTHON_LIB_LOC was set to the recipe-sysroot-native dir
in the gstreamer1.0-python workspace on the host. Overriding
PYTHON_LIB_LOC with /usr/lib by adding --with-libpython-dir=${libdir} to
EXTRA_OECONF to fix this issue.

The error that was seen is:
** (gst-plugin-scanner:2343): CRITICAL **: 23:08:18.327: Couldn't
g_module_open libpython. Reason: ${project}/build/tmp/work/${arch}/
gstreamer1.0-python/1.14.4-r0/recipe-sysroot-native/usr/lib/libpython3.5m.so:
cannot open shared object file: No such file or directory

The comment continues and says "it still fails because it looks for
a symlinked library ending in .so instead of the actually library with
LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
we want, it will break again if the library version ever changes."
This isn't the case anymore as the package is deploying
/usr/lib/gstreamer-1.0/libgstpython.cpython-37m-i386-linux-gnu.so, a
versionless so.

Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>
---
 .../gstreamer/gstreamer1.0-python_1.16.0.bb                  | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
index af9f3f2..0f3aac1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.0.bb
@@ -22,16 +22,10 @@ UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspe
 
 inherit autotools pkgconfig distutils3-base upstream-version-is-even gobject-introspection distro_features_check
 
+EXTRA_OECONF += "--with-libpython-dir=${libdir}"
+
 do_install_append() {
-    # gstpythonplugin hardcodes the location of the libpython from the build
-    # workspace and then fails at runtime. We can override it using
-    # --with-libpython-dir=${libdir}, but it still fails because it looks for a
-    # symlinked library ending in .so instead of the actually library with
-    # LIBNAME.so.MAJOR.MINOR. Although we could patch the code to use the path
-    # we want, it will break again if the library version ever changes. We need
-    # to think about the best way of handling this and possibly consult
-    # upstream.
-    #
+
     # Note that this particular find line is taken from the Debian packaging for
     # gst-python1.0.
     find "${D}" \
-- 
2.7.4


