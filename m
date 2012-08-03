Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Sx7La-0004Au-D6
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 04:10:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q731wsfl010697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 18:58:57 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 2 Aug 2012 18:58:54 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Aug 2012 09:57:27 +0800
Message-ID: <1343959047-24613-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
References: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] libxpm-native: add dependency on gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 02:10:38 -0000
Content-Type: text/plain

libxpm needs xgettext to build po files. Add explicit dependency on
gettext-native.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
index 9eaa212..6830216 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
@@ -10,7 +10,8 @@ protocol."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
 DEPENDS += "libxext libsm libxt"
-PR = "r0"
+DEPENDS_virtclass-native = "gettext-native"
+PR = "r1"
 PE = "1"
 
 XORG_PN = "libXpm"
-- 
1.7.7



