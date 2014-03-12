Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AADF06F7EC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 01:57:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2C1vrgb015906
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 18:57:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 11 Mar 2014 18:57:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 09:57:46 +0800
Message-ID: <44e8ff4550e2fdbd3c7497087fa9ad4625ff7350.1394589334.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394589334.git.Qi.Chen@windriver.com>
References: <cover.1394589334.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] sudo: upgrade to 1.8.9p5
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
X-List-Received-Date: Wed, 12 Mar 2014 01:57:52 -0000
Content-Type: text/plain

Upgrade sudo from 1.8.9p1 to 1.8.9p5.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sudo/{sudo_1.8.9p1.bb => sudo_1.8.9p5.bb}      |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.9p1.bb => sudo_1.8.9p5.bb} (83%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.9p1.bb b/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.9p1.bb
rename to meta/recipes-extended/sudo/sudo_1.8.9p5.bb
index b3c2086..b4d18e8 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.9p1.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.9p5.bb
@@ -5,8 +5,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "03773c373082843211c96df2c9187146"
-SRC_URI[sha256sum] = "c22089aa1023233bf27808e8f7611b6b4c4fec2d151616179e1898876703cd51"
+SRC_URI[md5sum] = "d3f1f1cfca6b2b06b048e1abb7d0227e"
+SRC_URI[sha256sum] = "bc9d5c96de5f8b4d2b014f87a37870aef60d2891c869202454069150a21a5c21"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5


