Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CB12C705C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJflB022777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:41 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:19:08 -0700
Message-ID: <c6ba65dc4b22e743a8aef32cf77b08c6eca388fc.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 13/38] gnu-config: add perl to RDEPENDS_gnu-config
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:40 -0000
Content-Type: text/plain

Perl script:
gnu-config/usr/bin/gnu-configize

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnu-config/gnu-config_20120814.bb              |    2 ++
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |    2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
index d67466a..af4afd6 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20120814.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-${PV
 SRC_URI[md5sum] = "bcfca5a2bb39edad4aae5a65efc84094"
 SRC_URI[sha256sum] = "44f99a8e76f3e8e4fec0bb5ad4762f8e44366168554ce66cb85afbe2ed3efd8b"
 
+RDEPENDS_${PN} += "perl"
+
 do_compile() {
 	:
 }
diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 00fa759..d1b0a59 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://git.sv.gnu.org/config.git \
 
 S = "${WORKDIR}/git"
 
+RDEPENDS_${PN} += "perl"
+
 do_compile() {
 	:
 }
-- 
1.7.9.5


