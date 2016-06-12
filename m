Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3D856FF5B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jun 2016 02:20:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5C2Kip2024189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jun 2016 19:20:44 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.144) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sat, 11 Jun 2016 19:20:44 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 12 Jun 2016 10:21:01 +0800
Message-ID: <f639515aedf07fefaa54650bc831978c20fd4f27.1465697985.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1465697985.git.Qi.Chen@windriver.com>
References: <cover.1465697985.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/9] sudo: upgrade to 1.8.16
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
X-List-Received-Date: Sun, 12 Jun 2016 02:20:44 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.15.bb => sudo_1.8.16.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.15.bb => sudo_1.8.16.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.15.bb b/meta/recipes-extended/sudo/sudo_1.8.16.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.15.bb
rename to meta/recipes-extended/sudo/sudo_1.8.16.bb
index 042043e..0981084 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.15.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.16.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "7cf6b9b76d0478a572432bed481dd7b5"
-SRC_URI[sha256sum] = "4316381708324da8b6cb151f655c1a11855207c7c02244d8ffdea5104d7cc308"
+SRC_URI[md5sum] = "a977449587dc857e129bb20555b46af4"
+SRC_URI[sha256sum] = "2d83826fc5125bf073acc203dbda1cf2abeee017090ccc9dddb0431a53d5064d"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


