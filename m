Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 222186011C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:50:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3M5odLI011146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 22:50:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Apr 2016 22:50:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Apr 2016 22:50:34 -0700
Message-ID: <3f6dbb5b91ab09dcdef74353d2e680b205c2c724.1461304177.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1461304177.git.liezhi.yang@windriver.com>
References: <cover.1461304177.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] grub_git: set COMPATIBLE_HOST_armv7a to null
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
X-List-Received-Date: Fri, 22 Apr 2016 05:50:39 -0000
Content-Type: text/plain

It doesn't work with armv7a:
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [reboot.mod] Error 1
| make[3]: *** Waiting for unfinished jobs....
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [halt.mod] Error 1
| make[3]: *** [cat.mod] Error 1
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| build-grub-module-verifier: error: unsupported relocation 0x2b.
| make[3]: *** [disk.mod] Error 1
| make[3]: *** [gptsync.mod] Error 1
| make[3]: *** [eval.mod] Error 1
| build-grub-module-verifier: error:build-grub-module-verifier: error:  unsupported relocation 0x2bunsupported relocation 0x2b.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 6919c9a..8f8c5ed 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://git.savannah.gnu.org/grub.git \
 S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
+COMPATIBLE_HOST_armv7a = 'null'
 
 inherit autotools gettext texinfo
 
-- 
2.8.0


