Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 477A472D2C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jan 2015 07:52:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0O7qeT9026322
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 23:52:40 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 23 Jan 2015 23:52:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 24 Jan 2015 15:52:43 +0800
Message-ID: <1422085963-7453-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] dmidecode: add powerpc64 to compatible host
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
X-List-Received-Date: Sat, 24 Jan 2015 07:52:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
index 3e3a350..b5151b8 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_2.12.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.bz2"
 
-COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc).*-linux"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
 
 do_install() {
 	oe_runmake DESTDIR="${D}" install
-- 
1.9.1


