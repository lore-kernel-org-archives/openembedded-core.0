Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B77896E2F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 03:08:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBD38AJU016367
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 19:08:10 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 12 Dec 2013 19:08:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Dec 2013 11:09:03 +0800
Message-ID: <70f3a82522c987860cd74d02c456bef90e81e878.1386903269.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1386903269.git.Qi.Chen@windriver.com>
References: <cover.1386903269.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] base-files: Fix CONFFILES
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
X-List-Received-Date: Fri, 13 Dec 2013 03:08:11 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

All files under ${sysconfdir} are configuration files for base-files
package. As this is the default behavior for CONFFILES handling, we
should not override it in this recipe.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index be3921a..a978da0 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -142,6 +142,3 @@ FILES_${PN} = "/"
 FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-CONFFILES_${PN} = "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname'][(d.getVar('hostname', True) != '')]} ${sysconfdir}/shells"
-
-- 
1.7.9.5


