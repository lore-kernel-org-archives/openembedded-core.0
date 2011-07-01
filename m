Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfXC-0007rT-R1
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:35 +0200
Received: by rex (Postfix, from userid 1000)
	id D4D092FE9C; Fri,  1 Jul 2011 16:17:29 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:23 +0100
Message-Id: <469c48cf5611c9e984d8114a48e834d03c44d099.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 5/6] beecrypt: Fix up packaging QA warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:35 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index d4c7972..f660641 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -24,4 +24,8 @@ acpaths=""
 
 EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp"
 
+FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
+FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
+FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
+
 BBCLASSEXTEND = "native"
-- 
1.7.4.1



