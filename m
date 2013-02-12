Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5OxN-00082A-WC
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 00:08:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1CMqA7b006686
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:52:10 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 14:52:08 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 16:52:07 -0600
Message-ID: <e1dc88a318215d79561408dc41598b9bd2387184.1360709138.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1360709138.git.peter.seebach@windriver.com>
References: <cover.1360709138.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_git.bb: Bump to pseudo 1.4.4.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Feb 2013 23:08:11 -0000
Content-Type: text/plain

The pseudo 1.4.2 linkat() implementation had a broken edge case
in which you could end up with chroot paths being doubled when
using plain link() calls instead of linkat() calls.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../pseudo/{pseudo_1.4.3.bb => pseudo_1.4.4.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.4.3.bb => pseudo_1.4.4.bb} (43%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
similarity index 43%
rename from meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
index 8f25bd0..dea607c 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.3.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
@@ -4,5 +4,5 @@ PR = "r0"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "ac943153aa78e210e2d0db7c85845db3"
-SRC_URI[sha256sum] = "0ca12a319c0ee87d1c8b2a4310c36a6d68d8d4b8c9c7dba00bace1773baf18e8"
+SRC_URI[md5sum] = "ae18a1388c032ac910adbf8c3111fdc4"
+SRC_URI[sha256sum] = "e72cb188fd8efb9eadfb5ce571a45a99245ae312eb9830cb9a9726bb25e47c17"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index bbdba43..efffc95 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "a01d7884e5f3acba1460cf6b500d28390e7af9f8"
-PV = "1.4.3+git${SRCPV}"
+SRCREV = "363a94bb851046f62648d7c96c749e899bd0648e"
+PV = "1.4.4+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



