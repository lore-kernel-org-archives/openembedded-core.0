Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] bitbake.conf: Fix corruption of GNOME mirror url
Date: Tue,  2 Nov 2021 11:42:56 +0000
Message-Id: <20211102114258.3540995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

The url changes from the script accidentally corrupted this mirror
url, fix it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index d9c4b4e5ada..790f2f7a8c4 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -657,7 +657,7 @@ APACHE_MIRROR = "https://archive.apache.org/dist"
 CPAN_MIRROR = "https://search.cpan.org/CPAN"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
-GNOME_GIT = "git://gitlab.gnome.org/GNOME;branch=master"
+GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "https://download.gnome.org/sources/"
 GNU_MIRROR = "https://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
-- 
2.32.0

