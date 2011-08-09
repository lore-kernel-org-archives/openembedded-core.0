Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+cY5xq/CivNZ7wgzT8ahqnj8X9uXUh55o=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqrEd-0004Aq-AT
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:41:03 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79IaYY2029922
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 13:36:34 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 13:36:31 -0500
Message-Id: <1312914992-18260-4-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1312914992-18260-3-git-send-email-galak@kernel.crashing.org>
References: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-2-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-3-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 3/4] telepathy-python: utilize python-dir to respect libdir/site-packages path
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
X-List-Received-Date: Tue, 09 Aug 2011 18:41:03 -0000

Fixes issue of libdir is set to something like '/usr/lib64'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 .../telepathy/telepathy-python_0.15.19.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index ead8dea..fde4006 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -9,9 +9,9 @@ RDEPENDS_${PN} += "python-dbus"
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://parallel_make.patch"
 
-PR = "r2"
+PR = "r3"
 
-inherit autotools
+inherit autotools python-dir
 
 SRC_URI[md5sum] = "f7ca25ab3c88874015b7e9728f7f3017"
 SRC_URI[sha256sum] = "244c0e1bf4bbd78ae298ea659fe10bf3a73738db550156767cc2477aedf72376"
-- 
1.7.3.4



