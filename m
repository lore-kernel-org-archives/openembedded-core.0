Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1Tv1g1-0001G8-T0
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 09:15:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0F7GV00025340
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2013 23:16:31 -0800 (PST)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 14 Jan 2013 23:16:31 -0800
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jan 2013 15:16:48 +0800
Message-ID: <1358234208-6177-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
References: <1358234208-6177-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] coreutils: remove dependency on coreutils-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 08:15:24 -0000
Content-Type: text/plain

If coreutils-native is built, it will replace the host commands and will
in parallel builds cause such errors:

     make[6]: execvp: rm: Text file busy

     libtool: ...tmp/sysroots/x86_64-linux//bin/mv: Text file busy

Remove the dependency and always use the host version.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 37d8dc9..c0778ba 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -8,8 +8,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;beginline=4;endline=16;md5=15ed60f67b1db5fedd5dbc37cf8a9543"
-PR = "r4"
-DEPENDS = "coreutils-native-${PV}"
+PR = "r5"
 DEPENDS_class-native = "gettext-native"
 
 inherit autotools gettext
-- 
1.7.11.7



