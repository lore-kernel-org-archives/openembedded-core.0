Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 093936B226
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2013 08:36:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBP8a4qT015921
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Dec 2013 00:36:04 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 25 Dec 2013 00:36:04 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Dec 2013 16:36:02 +0800
Message-ID: <d5166a224cee86b6092e82c1e564162a22668710.1387959755.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1387959755.git.Qi.Chen@windriver.com>
References: <cover.1387959755.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] packagegroup-core-boot: make initscripts-functions a basic element of RDEPENDS
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
X-List-Received-Date: Wed, 25 Dec 2013 08:36:04 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Unlike the initscripts package which is useful in SysV systems but
not so useful in systemd systems, the initscripts-functions package
is useful for both.

For the reason stated above, this patch adds initscripts-funtions to
the RDEPENDS of packagegroup-core-boot.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../packagegroups/packagegroup-core-boot.bb        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
index 5455899..2f60c97 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-boot.bb
@@ -41,6 +41,7 @@ RDEPENDS_${PN} = "\
     ${@base_contains("DISTRO_FEATURES", "sysvinit", "${SYSVINIT_SCRIPTS}", "", d)} \
     ${@base_contains("MACHINE_FEATURES", "keyboard", "${VIRTUAL-RUNTIME_keymaps}", "", d)} \
     netbase \
+    initscripts-functions \
     ${VIRTUAL-RUNTIME_login_manager} \
     ${VIRTUAL-RUNTIME_init_manager} \
     ${VIRTUAL-RUNTIME_initscripts} \
-- 
1.7.9.5


