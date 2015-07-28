Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2038976243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:05:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S95BPt000649
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 02:05:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:04:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Jul 2015 02:05:08 -0700
Message-ID: <f629d3d6e47782347bea424511ef6bedeb64f9a8.1438074266.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438074266.git.liezhi.yang@windriver.com>
References: <cover.1438074266.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] mc: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Tue, 28 Jul 2015 09:05:11 -0000
Content-Type: text/plain

Fixed:
mc-4.8.14: mc rdepends on util-linux-libmount, but it isn't a build dependency? [build-deps]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/mc/mc_4.8.14.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/mc/mc_4.8.14.bb b/meta/recipes-extended/mc/mc_4.8.14.bb
index 8fec0b3..81a8ad9 100644
--- a/meta/recipes-extended/mc/mc_4.8.14.bb
+++ b/meta/recipes-extended/mc/mc_4.8.14.bb
@@ -20,6 +20,7 @@ inherit autotools gettext pkgconfig
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
 PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
+PACKAGECONFIG[util-linux] = "ac_cv_lib_mount_mnt_new_table_from_file=yes,ac_cv_lib_mount_mnt_new_table_from_file=no,util-linux,"
 
 EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
-- 
1.7.9.5


