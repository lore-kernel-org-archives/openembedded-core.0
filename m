Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24A697468F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:46:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2U6l0HP023513
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 29 Mar 2018 23:47:00 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 23:46:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2018 02:46:33 -0400
Message-ID: <14c88e556b95eb311280077d78674032d4ec8ce2.1522392229.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1522392229.git.hongxu.jia@windriver.com>
References: <cover.1522392229.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] gnupg: upgrade 2.2.4 -> 2.2.5
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
X-List-Received-Date: Fri, 30 Mar 2018 06:46:59 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0001-configure.ac-use-a-custom-value-for-the-location-of-.patch | 7 ++++---
 meta/recipes-support/gnupg/{gnupg_2.2.4.bb => gnupg_2.2.5.bb}      | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.2.4.bb => gnupg_2.2.5.bb} (92%)

diff --git a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
index 3e3a64d..5d9bbac 100644
--- a/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
+++ b/meta/recipes-support/gnupg/gnupg/0001-configure.ac-use-a-custom-value-for-the-location-of-.patch
@@ -1,13 +1,14 @@
-From 0b97148c3aad0993a9aeb088596fa63a2fec5328 Mon Sep 17 00:00:00 2001
+From 338d073cab7b94fd7ec66322b969e8772b5e8cd7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 22 Jan 2018 18:00:21 +0200
-Subject: [PATCH] configure.ac: use a custom value for the location of
+Subject: [PATCH 5/5] configure.ac: use a custom value for the location of
  gpg-agent socket in the filesystem
 
 This should avoid clashes with the host gpg-agent observed on autobuilders.
 
 Upstream-Status: Inappropriate [oe-core specific, and only for -native]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -26,5 +27,5 @@ index 382ef1d..0570d7c 100644
  AC_DEFINE_UNQUOTED(GPG_AGENT_EXTRA_SOCK_NAME, "S.gpg-agent.extra",
                     [The name of the agent socket for remote access])
 -- 
-2.15.1
+2.7.4
 
diff --git a/meta/recipes-support/gnupg/gnupg_2.2.4.bb b/meta/recipes-support/gnupg/gnupg_2.2.5.bb
similarity index 92%
rename from meta/recipes-support/gnupg/gnupg_2.2.4.bb
rename to meta/recipes-support/gnupg/gnupg_2.2.5.bb
index d3f1a8f..f6d5dad 100644
--- a/meta/recipes-support/gnupg/gnupg_2.2.4.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.2.5.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
 SRC_URI_append_class-native = " file://0001-configure.ac-use-a-custom-value-for-the-location-of-.patch"
 
 
-SRC_URI[md5sum] = "709e5af5bba84d251c520222e720972f"
-SRC_URI[sha256sum] = "401a3e64780fdfa6d7670de0880aa5c9d589b3db7a7098979d7606cec546f2ec"
+SRC_URI[md5sum] = "567cd2d41fa632903066fde73d2005cb"
+SRC_URI[sha256sum] = "3fa189a32d4fb62147874eb1389047c267d9ba088f57ab521cb0df46f08aef57"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.8.1


