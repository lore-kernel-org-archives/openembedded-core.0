Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4D4D26C6D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:05:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0D75GrB021694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2014 23:05:16 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 12 Jan 2014 23:05:16 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jan 2014 15:05:45 +0800
Message-ID: <cf61d8be04dcfa9b7b563293311048ddb2bd7fdb.1389596689.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389596689.git.Qi.Chen@windriver.com>
References: <cover.1389596689.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sudo: upgrade to 1.8.9p1
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
X-List-Received-Date: Mon, 13 Jan 2014 07:05:19 -0000
Content-Type: text/plain

Upgrade sudo from 1.8.8 to 1.8.9p1.

This patch adds include/queue.h to the LIC_FILES_CHECKSUM because it's
specified in the doc/LICENSE file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sudo/sudo.inc                |    5 +++--
 .../sudo/{sudo_1.8.8.bb => sudo_1.8.9p1.bb}        |    4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.8.8.bb => sudo_1.8.9p1.bb} (83%)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 80357eb..0aa5193 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,12 +4,13 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD & Zlib"
-LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=47ae0be3bf895c0bb885fae7e1e83a47 \
+LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=923752f88decdea9d69f92fe42c2af80 \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=41;md5=e2dbb155fc49beea947515300bab99e0 \
                     file://compat/fnmatch.c;beginline=3;endline=27;md5=67f83ee9bd456557397082f8f1be0efd \
                     file://compat/getcwd.c;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681 \
                     file://compat/glob.c;beginline=6;endline=31;md5=5872733146b9eb0deb79e1f664815b85 \
-                    file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea"
+                    file://compat/snprintf.c;beginline=6;endline=31;md5=c98b24f02967c095d7a70ae2e4d4d4ea \
+                    file://include/queue.h;beginline=5;endline=27;md5=449af4cc57fc7d46f42090608ba3e681"
 
 inherit autotools
 
diff --git a/meta/recipes-extended/sudo/sudo_1.8.8.bb b/meta/recipes-extended/sudo/sudo_1.8.9p1.bb
similarity index 83%
rename from meta/recipes-extended/sudo/sudo_1.8.8.bb
rename to meta/recipes-extended/sudo/sudo_1.8.9p1.bb
index 6ab072f..b3c2086 100644
--- a/meta/recipes-extended/sudo/sudo_1.8.8.bb
+++ b/meta/recipes-extended/sudo/sudo_1.8.9p1.bb
@@ -5,8 +5,8 @@ SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[md5sum] = "fc4f074090afd56d9ff4ff4e97321971"
-SRC_URI[sha256sum] = "9f911c1e9297fb8006deb52fa81197a8d06b9d54e70672f723c467ecae992fc9"
+SRC_URI[md5sum] = "03773c373082843211c96df2c9187146"
+SRC_URI[sha256sum] = "c22089aa1023233bf27808e8f7611b6b4c4fec2d151616179e1898876703cd51"
 
 DEPENDS += " ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} += " ${@base_contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
1.7.9.5


