Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1UAoer-0007z7-V2
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 22:35:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1RLJ6bx018408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 13:19:06 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Wed, 27 Feb 2013 13:19:04 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Feb 2013 15:19:01 -0600
Message-ID: <67f3a52f6d2b915786b1983a14b347866cb9a6d5.1361999203.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1361999203.git.peter.seebach@windriver.com>
References: <cover.1361999203.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] Update pseudo to 1.5.1
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
X-List-Received-Date: Wed, 27 Feb 2013 21:35:28 -0000
Content-Type: text/plain

pseudo 1.5's enable-force-async works great, unless you use a host
where, inexplicably, stat(2) reports inconsistent and changing values
for a file's size or times for some time unless a file has been fsynced,
in which case you might want a way to cause an fsync to work.

Also noticed that some recent changes never made it into the docs, so
I did a little cleanup there. And changed the way NDEBUG suppresses
pseudo's debug messages, so arguments to them with possible side
effects (like calls into functions in another translation unit) can be
omitted, which should drastically reduce computational time if anyone
ever uses NDEBUG.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 .../pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb}      |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb} (52%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
similarity index 52%
rename from meta/recipes-devtools/pseudo/pseudo_1.5.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
index 66ff646..5694c4d 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.5.1.bb
@@ -4,7 +4,7 @@ PR = "r3"
 
 SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e735bc099f2b9fd6d3f152a8c71e6315"
-SRC_URI[sha256sum] = "41a73c59296b9d48005e0f911dd1becf25ffc3ff4cf4268020f2332efcffbf49"
+SRC_URI[md5sum] = "5ec67c7bff5fe68c56de500859c19172"
+SRC_URI[sha256sum] = "3b896f592f4d568569bd02323fad2d6b8c398e16ca36ee5a8947d2ff6c1d3d52"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0c872e3..87684ef 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,7 +1,7 @@
 require pseudo.inc
 
-SRCREV = "e076225ccdd10dabe3d6097c0682d8c88bd58753"
-PV = "1.5+git${SRCPV}"
+SRCREV = "b9eb2b5633b5a23efe72c950494728d93c2b5823"
+PV = "1.5.1+git${SRCPV}"
 PR = "r0"
 
 DEFAULT_PREFERENCE = "-1"
-- 
1.7.0.4



