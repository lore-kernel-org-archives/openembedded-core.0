Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7A719767B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:18:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7H8IBhe029827
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:18:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 17 Aug 2015 01:18:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Aug 2015 01:18:10 -0700
Message-ID: <8ad15d0c325757c26b61cd517d4cbd4d8d7e4fa4.1439799468.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439799468.git.liezhi.yang@windriver.com>
References: <cover.1439799468.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mc: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Mon, 17 Aug 2015 08:18:13 -0000
Content-Type: text/plain

Fixed:
mc-4.8.14: mc rdepends on util-linux-libmount, but it isn't a build dependency? [build-deps]

And enable it by default as Ross suggested.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mc/mc_4.8.14.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc_4.8.14.bb b/meta/recipes-extended/mc/mc_4.8.14.bb
index 3b6c2ff..3a593f7 100644
--- a/meta/recipes-extended/mc/mc_4.8.14.bb
+++ b/meta/recipes-extended/mc/mc_4.8.14.bb
@@ -17,9 +17,10 @@ inherit autotools gettext pkgconfig
 #
 # Both Samba (smb) and sftp require package delivered from meta-openembedded
 #
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "util-linux"
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
+PACKAGECONFIG[util-linux] = "ac_cv_lib_mount_mnt_new_table_from_file=yes,ac_cv_lib_mount_mnt_new_table_from_file=no,util-linux,"
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
-- 
1.7.9.5


