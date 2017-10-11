Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 953097757F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 06:54:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9B6s2Er025973
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 23:54:02 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Oct 2017 23:54:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Oct 2017 15:00:01 +0800
Message-ID: <2ad4bfde8d9148a9d229ed3a584f2104a3bec289.1507705024.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1507705024.git.Qi.Chen@windriver.com>
References: <cover.1507705024.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] own-mirrors.bbclass: allow other settings of PREMIRRORS have effect
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
X-List-Received-Date: Wed, 11 Oct 2017 06:54:01 -0000
Content-Type: text/plain

If we inherit own-mirrors.bbclass, other settings of PREMIRRORS in
our project would have no effect.

This patch modifies the setting in own-mirrors.bbclass to allow other
settings of PREMIRRORS to still have effect.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/own-mirrors.bbclass | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 0296d54..a777835 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -1,13 +1,13 @@
-PREMIRRORS() {
-cvs://.*/.*     ${SOURCE_MIRROR_URL}
-svn://.*/.*     ${SOURCE_MIRROR_URL}
-git://.*/.*     ${SOURCE_MIRROR_URL}
-gitsm://.*/.*   ${SOURCE_MIRROR_URL}
-hg://.*/.*      ${SOURCE_MIRROR_URL}
-bzr://.*/.*     ${SOURCE_MIRROR_URL}
-p4://.*/.*      ${SOURCE_MIRROR_URL}
-osc://.*/.*     ${SOURCE_MIRROR_URL}
-https?$://.*/.* ${SOURCE_MIRROR_URL}
-ftp://.*/.*     ${SOURCE_MIRROR_URL}
-npm://.*/?.*    ${SOURCE_MIRROR_URL}
-}
+PREMIRRORS_prepend = " \
+cvs://.*/.*     ${SOURCE_MIRROR_URL} \n \
+svn://.*/.*     ${SOURCE_MIRROR_URL} \n \
+git://.*/.*     ${SOURCE_MIRROR_URL} \n \
+gitsm://.*/.*   ${SOURCE_MIRROR_URL} \n \
+hg://.*/.*      ${SOURCE_MIRROR_URL} \n \
+bzr://.*/.*     ${SOURCE_MIRROR_URL} \n \
+p4://.*/.*      ${SOURCE_MIRROR_URL} \n \
+osc://.*/.*     ${SOURCE_MIRROR_URL} \n \
+https?$://.*/.* ${SOURCE_MIRROR_URL} \n \
+ftp://.*/.*     ${SOURCE_MIRROR_URL} \n \
+npm://.*/?.*    ${SOURCE_MIRROR_URL} \n \
+"
-- 
1.9.1


