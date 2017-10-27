Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 676 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 27 Oct 2017 04:55:23 UTC
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4062F60762
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 04:55:23 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 6459_9d42_9ea4ecdc_da11_4086_a701_66d43e6a46a8;
	Fri, 27 Oct 2017 13:44:02 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id CD16BAC00AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 13:44:01 +0900 (JST)
Received: from G01JPEXCHYT17.g01.fujitsu.local
	(G01JPEXCHYT17.g01.fujitsu.local [10.128.194.56])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	C525E6D6486 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 13:44:00 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT17.g01.fujitsu.local (10.128.194.56) with Microsoft SMTP
	Server id 14.3.352.0; Fri, 27 Oct 2017 13:44:00 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Oct 2017 13:43:59 +0900
Message-ID: <1509079439-6183-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] coreutils: upgrade to 8.28
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
X-List-Received-Date: Fri, 27 Oct 2017 04:55:24 -0000
Content-Type: text/plain

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../coreutils/{coreutils_8.27.bb => coreutils_8.28.bb}            | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-core/coreutils/{coreutils_8.27.bb => coreutils_8.28.bb} (95%)

diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb b/meta/recipes-core/coreutils/coreutils_8.28.bb
similarity index 95%
rename from meta/recipes-core/coreutils/coreutils_8.27.bb
rename to meta/recipes-core/coreutils/coreutils_8.28.bb
index ea8740a..0543ceb 100644
--- a/meta/recipes-core/coreutils/coreutils_8.27.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.28.bb
@@ -23,10 +23,10 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz;name=tarball \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
           "
 
-SRC_URI[tarball.md5sum] = "502795792c212932365e077946d353ae"
-SRC_URI[tarball.sha256sum] = "8891d349ee87b9ff7870f52b6d9312a9db672d2439d289bc57084771ca21656b"
-SRC_URI[manpages.md5sum] = "1b31a688d06764e0e94aa20b7ea08222"
-SRC_URI[manpages.sha256sum] = "1f615819e9167646c731636b6c5ecbe79837e82a18666bacc82c3fb1dfcfaea3"
+SRC_URI[tarball.md5sum] = "e7cb20d0572cc40d9f47ede6454406d1"
+SRC_URI[tarball.sha256sum] = "1117b1a16039ddd84d51a9923948307cfa28c2cea03d1a2438742253df0a0c65"
+SRC_URI[manpages.md5sum] = "3a7c626aad1c9077f254e5c2553a2f60"
+SRC_URI[manpages.sha256sum] = "d72c3fa79ae328a4fd1107102e8946755aa2e908044e1efcf1e71ef206dca042"
 
 EXTRA_OECONF_class-native = "--without-gmp"
 EXTRA_OECONF_class-target = "--enable-install-program=arch --libexecdir=${libdir}"
-- 
2.7.4



