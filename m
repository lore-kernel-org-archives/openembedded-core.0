Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SKGby-0001sW-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 00:10:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3HM1UkE020786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 15:01:30 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 17 Apr 2012 15:01:30 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Apr 2012 17:05:52 -0500
Message-ID: <f3dba0da61b57e74a957505fb2e22eed729d5100.1334700265.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334700265.git.mark.hatle@windriver.com>
References: <cover.1334700265.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/1] matchbox-wm-2: Fix incorrect update-alternatives
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
X-List-Received-Date: Tue, 17 Apr 2012 22:10:58 -0000
Content-Type: text/plain

Update-alternatives was pointing to matchbox-session, and should have
been pointing to matchbox-window-manager.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
index 9961728..4aad3a9 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pa
 
 SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
 PV = "0.1+git${SRCPV}"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "git://git.yoctoproject.org/matchbox-window-manager-2;proto=git \
 	file://fix_makefile.patch \
@@ -22,7 +22,7 @@ inherit autotools pkgconfig update-alternatives
 # matchbox-window-manager-2.
 ALTERNATIVE_NAME = "x-window-manager"
 ALTERNATIVE_LINK = "${bindir}/x-window-manager"
-ALTERNATIVE_PATH = "${bindir}/matchbox-session"
+ALTERNATIVE_PATH = "${bindir}/matchbox-window-manager"
 ALTERNATIVE_PRIORITY = "10"
 
 PACKAGES =+ "libmatchbox2"
-- 
1.7.3.4



