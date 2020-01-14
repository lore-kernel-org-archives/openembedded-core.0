Return-Path: <Oleg.Polyakov@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DF957F94F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 19:30:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 00EJUBZS007382
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 11:30:27 -0800
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 14 Jan 2020 11:30:12 -0800
From: Oleg Polyakov <Oleg.Polyakov@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jan 2020 11:30:10 -0800
Message-ID: <20200114193010.92629-1-Oleg.Polyakov@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] vim: update from 8.1.1518 to 8.2.0110
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
X-List-Received-Date: Tue, 14 Jan 2020 19:30:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

vim-tiny: update from 8.1.1518 to 8.2.0110
The date in the license was updated to 2020 and
a trailing space was removed from one line.

Signed-off-by: Oleg Polyakov <Oleg.Polyakov@windriver.com>
---
 .../vim/{vim-tiny_8.1.1518.bb => vim-tiny_8.2.0110.bb}        | 0
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0110.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/vim/{vim-tiny_8.1.1518.bb => vim-tiny_8.2.0110.bb} (100%)
 rename meta/recipes-support/vim/{vim_8.1.1518.bb => vim_8.2.0110.bb} (100%)

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1518.bb b/meta/recipes-support/vim/vim-tiny_8.2.0110.bb
similarity index 100%
rename from meta/recipes-support/vim/vim-tiny_8.1.1518.bb
rename to meta/recipes-support/vim/vim-tiny_8.2.0110.bb
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5a1bea6985..ec7ad443a4 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -5,14 +5,14 @@ DEPENDS = "ncurses gettext-native"
 # vimdiff doesn't like busybox diff
 RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
-LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=f1f82b42360005c70b8c19b0ef493f72"
+LIC_FILES_CHKSUM = "file://runtime/doc/uganda.txt;endline=287;md5=909f1394892b7e0f9c2a95306c0c552b"
 
 SRC_URI = "git://github.com/vim/vim.git \
            file://disable_acl_header_check.patch \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
 "
-SRCREV = "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
+SRCREV = "e05a89ac6399a8c7d164c99fdab6841d999a9128"
 
 # Do not consider .z in x.y.z, as that is updated with every commit
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+)\.0"
diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-support/vim/vim_8.2.0110.bb
similarity index 100%
rename from meta/recipes-support/vim/vim_8.1.1518.bb
rename to meta/recipes-support/vim/vim_8.2.0110.bb
-- 
2.23.0


