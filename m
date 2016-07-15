Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5B1731B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 01:49:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6F1ngWW022187
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:49:43 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 18:49:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 09:49:37 +0800
Message-ID: <4610f4939e316352261529976bd492bd6bbd6971.1468547302.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1468547302.git.Qi.Chen@windriver.com>
References: <cover.1468547302.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] sudo: upgrade to 1.8.17p1
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
X-List-Received-Date: Fri, 15 Jul 2016 01:49:42 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/{sudo_1.8.16.bb => sudo_1.8.17p1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.16.bb => sudo_1.8.17p1.bb} (90%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.16.bb b/meta/recipes-extended/sudo/sudo_1.8.17p1.bb
similarity index 90%
rename from meta/recipes-extended/sudo/sudo_1.8.16.bb
rename to meta/recipes-extended/sudo/sudo_1.8.17p1.bb
index 0981084..614ad5c 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.16.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.17p1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "a977449587dc857e129bb20555b46af4"
-SRC_URI[sha256sum] = "2d83826fc5125bf073acc203dbda1cf2abeee017090ccc9dddb0431a53d5064d"
+SRC_URI[md5sum] = "50a840a688ceb6fa3ab24fc0adf4fa23"
+SRC_URI[sha256sum] = "c690d707fb561b3ecdf6a6de5563bc0b769388eff201c851edbace408bb155cc"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.9.1


