Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E769D6F66F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 09:14:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s279EoM6006522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Mar 2014 01:14:51 -0800 (PST)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 7 Mar 2014 01:14:50 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 04:14:47 -0500
Message-ID: <cd6968a088a378afb3ff56f98ed39e68aea53e9b.1394183376.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394183376.git.wenzong.fan@windriver.com>
References: <cover.1394183376.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] dmidecode: add powerpc to compatible host
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
X-List-Received-Date: Fri, 07 Mar 2014 09:14:53 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index 3fc75fe..61779fe 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "http://savannah.nongnu.org/download/dmidecode/${BP}.tar.bz2"
 
-COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc).*-linux"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" install
-- 
1.7.9.5


