Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 812306B232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 03:11:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5I3B9aO006024
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 20:11:09 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 20:11:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 11:12:24 +0800
Message-ID: <d94f462133f22212399725ac1254e513c9fb34e5.1403061073.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1403061073.git.Qi.Chen@windriver.com>
References: <cover.1403061073.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sudo: upgrade from 1.8.10p2 to 1.8.10p3
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
X-List-Received-Date: Wed, 18 Jun 2014 03:11:15 -0000
Content-Type: text/plain

Upgrade sudo from 1.8.10p2 to 1.8.10p3.

[YOCTO #6457]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../sudo/{sudo_1.8.10p2.bb => sudo_1.8.10p3.bb}    |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.10p2.bb => sudo_1.8.10p3.bb} (88%)

diff --git a/meta/recipes-extended/sudo/sudo_1.8.10p2.bb b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
similarity index 88%
rename from meta/recipes-extended/sudo/sudo_1.8.10p2.bb
rename to meta/recipes-extended/sudo/sudo_1.8.10p3.bb
index aa8c445..46d4781 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.10p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.10p3.bb
@@ -6,8 +6,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "5e5eab1036a7cc2c088ab0d9b6b6a42e"
-SRC_URI[sha256sum] = "ba6cb8db6dccdb92a96e8ae63ca65c410f8b61270b603ab9af4b1154fef379f1"
+SRC_URI[md5sum] = "fcd8d0d9f9f0397d076ee901e242ed39"
+SRC_URI[sha256sum] = "6eda135fa68163108f1c24de6975de5ddb09d75730bb62d6390bda7b04345400"
 
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5


