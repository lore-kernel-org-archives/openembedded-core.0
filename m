Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UIEHK-0006ir-Rv
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:22:12 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2K84tSs010929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 01:04:55 -0700 (PDT)
Received: from pek-usp-9.wrs.com (128.224.162.26) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 01:04:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 15:49:31 +0800
Message-ID: <4bd4027d61d99a9f7e35537fd94190b6a837431c.1363765543.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1363765543.git.liezhi.yang@windriver.com>
References: <cover.1363765543.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] perl: remove the duplicated RDEPENDS
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
X-List-Received-Date: Wed, 20 Mar 2013 08:24:34 -0000
Content-Type: text/plain

Remove a duplicated line:
RDEPENDS_${PN}-module-cpanplus += "${PN}-module-load"

[YOCTO #4064]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-devtools/perl/perl-rdepends_5.14.3.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
index 87d7a32..62712ed 100644
--- a/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
+++ b/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
@@ -383,7 +383,6 @@ RDEPENDS_${PN}-module-cpanplus += "${PN}-module-log-message"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-build"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-corelist"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-load"
-RDEPENDS_${PN}-module-cpanplus += "${PN}-module-load"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-loaded"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-pluggable"
 RDEPENDS_${PN}-module-cpanplus += "${PN}-module-object-accessor"
-- 
1.7.7



