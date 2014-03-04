Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 603C06D284
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 14:17:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s24EHJm8009874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Mar 2014 06:17:19 -0800 (PST)
Received: from mark-t5610.wrs.com (128.224.147.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 4 Mar 2014 06:17:19 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 4 Mar 2014 09:17:08 -0500
Message-ID: <1393942628-31667-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.147.123]
Subject: [PATCH] mc: Add 'inherit pkgconfig'
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
X-List-Received-Date: Tue, 04 Mar 2014 14:17:21 -0000
Content-Type: text/plain

mc's configure script uses pkg-config so we should 'inherit pgkconfig'
to ensure the sysroot is properly populated. Currently we are lucky as
mc DEPENDS on glib-2.0 which inherits pkgconfig but we should not rely
on this dependency chain.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-extended/mc/mc_4.7.5.2.bb | 2 +-
 meta/recipes-extended/mc/mc_4.8.10.bb  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mc/mc_4.7.5.2.bb b/meta/recipes-extended/mc/mc_4.7.5.2.bb
index ac2216d..0e4434c 100644
--- a/meta/recipes-extended/mc/mc_4.7.5.2.bb
+++ b/meta/recipes-extended/mc/mc_4.7.5.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "bdae966244496cd4f6d282d80c9cf3c6"
 SRC_URI[sha256sum] = "a68338862bb30017eb65ed569a58e80ab66ae8cef11c886440c9e9f4d1efc6ab"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
 
diff --git a/meta/recipes-extended/mc/mc_4.8.10.bb b/meta/recipes-extended/mc/mc_4.8.10.bb
index 09cfa3c..511771a 100644
--- a/meta/recipes-extended/mc/mc_4.8.10.bb
+++ b/meta/recipes-extended/mc/mc_4.8.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "eb4bdc23abd4fdfa14911d53d65c8186"
 SRC_URI[sha256sum] = "5f4166fe78fbf4b42f51ed526ca7f79fea8c77d04355c2b97d4df2a6bd2a1b1a"
 
-inherit autotools gettext
+inherit autotools gettext pkgconfig
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
 
-- 
1.8.3.2


