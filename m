Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 477DE6FFEF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 06:45:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10226708"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Aug 2016 14:45:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 5C76A42EB20C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:45:08 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 24 Aug 2016 14:45:07 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Aug 2016 02:45:03 -0400
Message-ID: <1472021103-1395-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: 5C76A42EB20C.A6B6A
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] lsbinitscripts: 9.64 -> 9.68
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
X-List-Received-Date: Wed, 24 Aug 2016 06:45:16 -0000
Content-Type: text/plain

Upgrade lsbinitscripts from 9.64 to 9.68.

Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch | 5 +++--
 .../lsb/{lsbinitscripts_9.64.bb => lsbinitscripts_9.68.bb}          | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.64.bb => lsbinitscripts_9.68.bb} (82%)

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
index 0809c9b..17c9002 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
+++ b/meta/recipes-extended/lsb/lsbinitscripts/0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch
@@ -11,13 +11,14 @@ diff --git a/rc.d/init.d/functions b/rc.d/init.d/functions
 index 6850046..11223f7 100644
 --- a/rc.d/init.d/functions
 +++ b/rc.d/init.d/functions
-@@ -597,5 +597,5 @@ if [ "$_use_systemctl" = "1" ]; then
+@@ -597,6 +597,6 @@ if [ "$_use_systemctl" = "1" ]; then
  	fi
  fi
  
 -strstr "$(cat /proc/cmdline)" "rc.debug" && set -x
 +strstr "$(cat /proc/cmdline)" "rc.debug" && set -x || true
- 
+ return 0
+
 -- 
 2.1.0
 
diff --git a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
similarity index 82%
rename from meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
rename to meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
index 7273050..0c08fff 100644
--- a/meta/recipes-extended/lsb/lsbinitscripts_9.64.bb
+++ b/meta/recipes-extended/lsb/lsbinitscripts_9.68.bb
@@ -8,13 +8,13 @@ RDEPENDS_${PN} += "util-linux"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebf4e8b49780ab187d51bd26aaa022c6"
 
 S="${WORKDIR}/initscripts-${PV}"
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/9cce2ae1009750e84be37c09a028757e/initscripts-${PV}.tar.bz2 \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/initscripts/initscripts-${PV}.tar.bz2/6a51a5af38e01445f53989ed0727c3e1/initscripts-${PV}.tar.bz2 \
            file://functions.patch \
            file://0001-functions-avoid-exit-1-which-causes-init-scripts-to-.patch \
           " 
 
-SRC_URI[md5sum] = "9cce2ae1009750e84be37c09a028757e"
-SRC_URI[sha256sum] = "48b59ce8157cfc58bbd4b1dfa58ad1087245761ae11c2033b66ae3864ea7e1cf"
+SRC_URI[md5sum] = "6a51a5af38e01445f53989ed0727c3e1"
+SRC_URI[sha256sum] = "2a1c6e9dbaa37a676518f4803b501e107c058bb14ef7a8db24c52b77fbcba531"
 
 inherit update-alternatives
 
-- 
2.7.4




