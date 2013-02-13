Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5j4h-00070d-Hu
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 21:37:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1DKL1ch006164
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 12:21:01 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 13 Feb 2013 12:21:00 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Feb 2013 14:20:59 -0600
Message-ID: <d068367a2a26ac1fd31a26730af7f04c9d669f92.1360786008.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1360786008.git.peter.seebach@windriver.com>
References: <cover.1360786008.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] pseudo_1.4.5.bb: Finish fixing linkat()
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
X-List-Received-Date: Wed, 13 Feb 2013 20:37:11 -0000
Content-Type: text/plain

The 1.4.4 fix replaced possible double-prepending of chroot paths
with possible non-prepending of chroot paths. After significant
evaluation, have settled on a single prepending of the chroot
path as a workable compromise.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../pseudo/{pseudo_1.4.4.bb => pseudo_1.4.5.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.4.4.bb => pseudo_1.4.5.bb} (43%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb b/meta/recipes-devtools/pseudo/pseudo_1.4.5.bb
similarity index 43%
rename from meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.4.5.bb
index dea607c..e99974f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.4.4.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.4.5.bb
@@ -4,5 +4,5 @@ PR = "r0"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "ae18a1388c032ac910adbf8c3111fdc4"
-SRC_URI[sha256sum] = "e72cb188fd8efb9eadfb5ce571a45a99245ae312eb9830cb9a9726bb25e47c17"
+SRC_URI[md5sum] = "1b8677f7730bd4c51daab7727c35123e"
+SRC_URI[sha256sum] = "e36360e4899467ac842fece894177cb50207671a90e0567ffc74c144fa377f51"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index efffc95..b895d2f 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "363a94bb851046f62648d7c96c749e899bd0648e"
-PV = "1.4.4+git${SRCPV}"
+SRCREV = "011b401fb6be38d739215e455588af4dcd707e17"
+PV = "1.4.5+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



