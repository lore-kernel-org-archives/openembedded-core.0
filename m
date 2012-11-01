Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TTsiS-0005c1-91
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 12:13:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qA18rNl0000714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2012 01:53:23 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 1 Nov 2012 01:53:22 -0700
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 16:53:10 +0800
Message-ID: <97f30a7d4fa7b7ed6a9992512f5c727af5dc4504.1351759577.git.Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1351759577.git.Xin.Ouyang@windriver.com>
References: <cover.1351759577.git.Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0: inherit pythonnative
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Nov 2012 11:13:40 -0000
Content-Type: text/plain

glib-2.0 needs to inherit pythonnative because it will run python
scripts to generate codes while do_compile.

This has caused problems on some hosts(SLED11.2) if no python-xml
installed.

[Yocto 2843]

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
index 10c0b61..5181f9d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
@@ -1,8 +1,10 @@
 require glib.inc
 
-PR = "r6"
+PR = "r7"
 PE = "1"
 
+inherit pythonnative
+
 DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
 DEPENDS_virtclass-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
-- 
1.7.10.4



