Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1SvpDi-0002Yx-7L
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jul 2012 14:37:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6UCPXVt029021
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2012 05:25:33 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 30 Jul 2012 05:25:32 -0700
From: <xin.ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Jul 2012 20:25:30 +0800
Message-ID: <3baaa2a825c7fc5445019704e16dbc135d09a930.1343650679.git.Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343650679.git.Xin.Ouyang@windriver.com>
References: <cover.1343650679.git.Xin.Ouyang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] findutils-4.4.2: add bison-native to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 12:37:10 -0000
Content-Type: text/plain

From: Xin Ouyang <Xin.Ouyang@windriver.com>

[YOCTO #2858]

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
---
 meta/recipes-extended/findutils/findutils_4.4.2.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/findutils/findutils_4.4.2.bb b/meta/recipes-extended/findutils/findutils_4.4.2.bb
index 218bf83..34e53d2 100644
--- a/meta/recipes-extended/findutils/findutils_4.4.2.bb
+++ b/meta/recipes-extended/findutils/findutils_4.4.2.bb
@@ -1,6 +1,6 @@
 require findutils.inc
 
-PR = "r5"
+PR = "r6"
 
 SRC_URI += "file://01-27017.patch \
             file://02-28824.patch \
@@ -12,6 +12,8 @@ SRC_URI += "file://01-27017.patch \
 SRC_URI[md5sum] = "351cc4adb07d54877fa15f75fb77d39f"
 SRC_URI[sha256sum] = "434f32d171cbc0a5e72cfc5372c6fc4cb0e681f8dce566a0de5b6fccd702b62a"
 
+DEPENDS = "bison-native"
+
 # http://savannah.gnu.org/bugs/?27299
 CACHED_CONFIGUREVARS += "${@base_contains('DISTRO_FEATURES', 'libc-posix-clang-wchar', 'gl_cv_func_wcwidth_works=yes', '', d)}"
 
-- 
1.7.9.5



