Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BC643727D2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Jan 2015 10:04:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t04A4lWd025403
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 4 Jan 2015 02:04:47 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 4 Jan 2015 02:04:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:04:57 +0800
Message-ID: <ff4bc63071f185b445eac1803ba73d49eee45e39.1420359776.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1420359776.git.Qi.Chen@windriver.com>
References: <cover.1420359776.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] coreutils: upgrade to 8.23
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
X-List-Received-Date: Sun, 04 Jan 2015 10:04:55 -0000
Content-Type: text/plain

fix-for-dummy-man-usage.patch is rebased.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{coreutils-8.22 => coreutils-8.23}/dummy_help2man.patch  |  0
 .../fix-for-dummy-man-usage.patch                            | 12 ++++++------
 .../fix-selinux-flask.patch                                  |  0
 .../remove-usr-local-lib-from-m4.patch                       |  0
 .../coreutils/{coreutils_8.22.bb => coreutils_8.23.bb}       |  4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/dummy_help2man.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/fix-for-dummy-man-usage.patch (77%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/fix-selinux-flask.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils-8.22 => coreutils-8.23}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.22.bb => coreutils_8.23.bb} (96%)

diff --git a/meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch b/meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.22/dummy_help2man.patch
rename to meta/recipes-core/coreutils/coreutils-8.23/dummy_help2man.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch b/meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
similarity index 77%
rename from meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
rename to meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
index b7e8260..58b6a76 100644
--- a/meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
+++ b/meta/recipes-core/coreutils/coreutils-8.23/fix-for-dummy-man-usage.patch
@@ -9,23 +9,23 @@ would appear when compiling.
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- man/local.mk |    2 +-
+ man/local.mk | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/man/local.mk b/man/local.mk
-index 7cef5e3..dc0865f 100644
+index ba8fbf7..3833458 100644
 --- a/man/local.mk
 +++ b/man/local.mk
-@@ -189,8 +189,8 @@ man/yes.1:       src/yes
+@@ -101,8 +101,8 @@ man/dynamic-deps.mk: Makefile
  	  && $(run_help2man)						\
  		     --source='$(PACKAGE_STRING)'			\
  		     --include=$(srcdir)/man/$$name.x			\
--		     --output=$$t/$$name.1 $$t/$$name			\
+-		     --output=$$t/$$name.1 $$t/$$argv			\
  		     --info-page='coreutils \(aq'$$name' invocation\(aq' \
-+		     --output=$$t/$$name.1 $$t/$$name			\
++		     --output=$$t/$$name.1 $$t/$$argv			\
  	  && sed \
  	       -e 's|$*\.td/||g' \
  	       -e '/For complete documentation/d' \
 -- 
-1.7.9.5
+1.9.1
 
diff --git a/meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils-8.23/fix-selinux-flask.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.22/fix-selinux-flask.patch
rename to meta/recipes-core/coreutils/coreutils-8.23/fix-selinux-flask.patch
diff --git a/meta/recipes-core/coreutils/coreutils-8.22/remove-usr-local-lib-from-m4.patch b/meta/recipes-core/coreutils/coreutils-8.23/remove-usr-local-lib-from-m4.patch
similarity index 100%
rename from meta/recipes-core/coreutils/coreutils-8.22/remove-usr-local-lib-from-m4.patch
rename to meta/recipes-core/coreutils/coreutils-8.23/remove-usr-local-lib-from-m4.patch
diff --git a/meta/recipes-core/coreutils/coreutils_8.22.bb b/meta/recipes-core/coreutils/coreutils_8.23.bb
similarity index 96%
rename from meta/recipes-core/coreutils/coreutils_8.22.bb
rename to meta/recipes-core/coreutils/coreutils_8.23.bb
index f85baca..e9d6494 100644
--- a/meta/recipes-core/coreutils/coreutils_8.22.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.23.bb
@@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://fix-selinux-flask.patch \
           "
 
-SRC_URI[md5sum] = "8fb0ae2267aa6e728958adc38f8163a2"
-SRC_URI[sha256sum] = "5b3e94998152c017e6c75d56b9b994188eb71bf46d4038a642cb9141f6ff1212"
+SRC_URI[md5sum] = "abed135279f87ad6762ce57ff6d89c41"
+SRC_URI[sha256sum] = "ec43ca5bcfc62242accb46b7f121f6b684ee21ecd7d075059bf650ff9e37b82d"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
1.9.1


