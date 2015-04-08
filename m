Return-Path: <nathan.rossi@xilinx.com>
X-Greylist: delayed 856 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Apr 2015 06:03:56 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bon0090.outbound.protection.outlook.com [157.56.111.90])
	by mail.openembedded.org (Postfix) with ESMTP id 6297D60043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 06:03:56 +0000 (UTC)
Received: from BN1BFFO11FD030.protection.gbl (10.58.144.30) by
	BN1BFFO11HUB017.protection.gbl (10.58.144.164) with Microsoft SMTP
	Server (TLS) id 15.1.136.16; Wed, 8 Apr 2015 05:49:39 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BN1BFFO11FD030.mail.protection.outlook.com (10.58.144.93) with
	Microsoft SMTP Server (TLS) id 15.1.136.16 via Frontend Transport;
	Wed, 8 Apr 2015 05:49:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1YfinN-0004QV-EZ
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Apr 2015 22:45:01 -0700
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Apr 2015 15:47:56 +1000
X-Mailer: git-send-email 1.7.10.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21454.005
X-TM-AS-User-Approved-Sender: Yes;Yes;Yes
Message-ID: <a2991e0a-7cdc-49b4-8247-0caa77d26a8a@BN1BFFO11FD030.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	BMV:1; SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(199003)(189002)(70736001)(19580395003)(50226001)(19580405001)(77156002)(62966003)(450100001)(31696002)(86362001)(87936001)(47776003)(1496007)(48376002)(74316001)(106466001)(110136001)(2351001)(229853001)(50466002)(104016003)(33646002)(6806004)(50986999)(92566002)(46102003)(53416004)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1BFFO11HUB017;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en;
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1BFFO11HUB017;
X-Microsoft-Antispam-PRVS: <BN1BFFO11HUB01790187AFBABDF8DD051B3F1FC0@BN1BFFO11HUB017.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010); SRVR:BN1BFFO11HUB017; BCL:0;
	PCL:0; RULEID:; SRVR:BN1BFFO11HUB017; 
X-Forefront-PRVS: 0540846A1D
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2015 05:49:39.6638 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1BFFO11HUB017
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH] python: Change python 2.7.9 to use libffi from the system
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
X-List-Received-Date: Wed, 08 Apr 2015 06:03:57 -0000
Content-Type: text/plain

Changes in python 2.7.9 from 2.7.3 cause issues when building the in
tree libffi for ctypes. These issues primarily affect less common
platforms (e.g. MicroBlaze) that are supported by libffi but the python
overrides for the in tree libffi are not able to detect correctly.

This patch changes the python 2.7.9 recipe to match how the python 3
recipe handles libffi by configuring the build to use the system
libffi. This brings consistency between the libffi used for different
python versions as well as with the system.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
The main reason for this change is that python 2.7.9 builds are broken for
MicroBlaze, when build the ctypes modules it fails to detect the 'MICROBLAZE'
platform, despite it being available in the libffi source tree as well as
working correctly with python 2.7.3.

|   File "build/temp.linux2-microblazeel-2.7/libffi/fficonfig.py", line 33, in <module>
|     ffi_sources += ffi_platforms['MICROBLAZE']
| KeyError: 'MICROBLAZE'
| Makefile:490: recipe for target 'sharedmods' failed
| make: *** [sharedmods] Error 1

It seems that this fficonfig.py file was added for python 2.7.9 and does not
contain the equivalent entries for all of libffi's supported platforms.

Regards,
Nathan
---
 meta/recipes-devtools/python/python_2.7.9.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 0031b8f..7918550 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -1,5 +1,5 @@
 require python.inc
-DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
+DEPENDS = "python-native libffi bzip2 db gdbm openssl readline sqlite3 zlib"
 PR = "${INC_PR}"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -32,6 +32,8 @@ S = "${WORKDIR}/Python-${PV}"
 
 inherit autotools multilib_header python-dir pythonnative
 
+CONFIGUREOPTS += " --with-system-ffi "
+
 # The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
 #Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
-- 
1.7.10.4


