Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53FF3731C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 09:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5O9hrLm000881
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 02:43:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 24 Jun 2016 02:43:53 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Jun 2016 17:44:01 +0800
Message-ID: <5e83066cfcef86ada628d2332e551e56cbb0f05b.1466761342.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1466761342.git.Qi.Chen@windriver.com>
References: <cover.1466761342.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] bash-completion: delete files util-linux provides
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
X-List-Received-Date: Fri, 24 Jun 2016 09:43:53 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-support/bash-completion/bash-completion_2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.1.bb b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
index 9877720..4126262 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.1.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.1.bb
@@ -25,7 +25,7 @@ do_install_append() {
 
 	# Delete files already provided by util-linux
 	local i
-	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su; do
+	for i in cal dmesg eject hexdump hwclock ionice look renice rtcwake su mount umount; do
 		rm ${D}${datadir}/${BPN}/completions/$i
 	done
 
-- 
1.9.1


