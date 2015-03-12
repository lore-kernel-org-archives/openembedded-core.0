Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2DC8A73B81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 15:50:45 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 16:50:44 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id BBBC72800D0;
	Thu, 12 Mar 2015 16:50:44 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Mar 2015 16:50:39 +0100
Message-ID: <1426175440-16095-5-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
References: <1426175440-16095-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 4/5] mmc-utils: remove unnecessary 'protocol=git' from SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 15:50:46 -0000
Content-Type: text/plain

Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index c54e351..bdb4fed 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -8,7 +8,7 @@ SRCREV = "f4eb241519f8d500ce6068a70d2389be39ac5189"
 
 PV = "0.1"
 
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc-utils.git;branch=${BRANCH} \
            file://0001-mmc.h-don-t-include-asm-generic-int-ll64.h.patch"
 
 S = "${WORKDIR}/git"
-- 
1.9.1


