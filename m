Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E6EDD7844F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 06:08:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA6690TV022062
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Nov 2017 22:09:00 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Sun, 5 Nov 2017 22:08:59 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Nov 2017 14:10:17 +0800
Message-ID: <65d80809c9fb47b22474f86b52c8a334d05df329.1509948552.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1509948552.git.Qi.Chen@windriver.com>
References: <cover.1509948552.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bash-completion: remove rfkill file that util-linux provides
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
X-List-Received-Date: Mon, 06 Nov 2017 06:08:59 -0000
Content-Type: text/plain

Remove the rfkill bash completion file that util-linux provides
to avoid conflicts.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/bash-completion/bash-completion_2.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.7.bb b/meta/recipes-support/bash-completion/bash-completion_2.7.bb
index 7877e51..f519b3f 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.7.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.7.bb
@@ -25,7 +25,7 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in mount umount; do
+	for i in mount umount rfkill; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
 }
-- 
1.9.1


