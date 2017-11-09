Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1BA578505
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 02:10:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA92ApbH029312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Nov 2017 18:10:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 8 Nov 2017 18:10:50 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Nov 2017 10:12:11 +0800
Message-ID: <1a0e1186fffb606eb736ca50120d92daa9146e2f.1510193452.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1510193452.git.Qi.Chen@windriver.com>
References: <cover.1510193452.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] sudo: upgrade to 1.8.21p2
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
X-List-Received-Date: Thu, 09 Nov 2017 02:10:50 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.20p2.bb => sudo_1.8.21p2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.20p2.bb => sudo_1.8.21p2.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.20p2.bb b/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.20p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.21p2.bb
index 4f24b3c..acd0025 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.20p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.21p2.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "03da8e711caca6fd93e57751bfb74adc"
-SRC_URI[sha256sum] = "bd42ae1059e935f795c69ea97b3de09fe9410a58a74b5d5e6836eb5067a445d9"
+SRC_URI[md5sum] = "cd3993d910c713ae72e94beebd230b22"
+SRC_URI[sha256sum] = "74c5746cd33a814e2431c39faf0d76f7f8a697379bd073862e3b156cf0d76368"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


