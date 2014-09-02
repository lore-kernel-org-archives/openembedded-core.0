Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A83FB7136B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsRN8004019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:27 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:26 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:54:02 +0800
Message-ID: <d2ab3c765ea471ea5bbf394de4aac8cdeaee8486.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/26] at: remove dependency on initscripts
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:25 -0000
Content-Type: text/plain

The 'at' package actually doesn't have runtime dependency on
VIRTUAL-RUNTIME_initscripts, so remove this dependency.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/at/at_3.1.15.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/at/at_3.1.15.bb b/meta/recipes-extended/at/at_3.1.15.bb
index a465a76..1080df4 100644
--- a/meta/recipes-extended/at/at_3.1.15.bb
+++ b/meta/recipes-extended/at/at_3.1.15.bb
@@ -7,9 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 DEPENDS = "flex flex-native \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
-VIRTUAL-RUNTIME_initscripts ?= "initscripts"                                                                                                                 
 RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '${PAM_DEPS}', '', d)} \
-                  ${VIRTUAL-RUNTIME_initscripts} \
 "
 
 PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
-- 
1.9.1


