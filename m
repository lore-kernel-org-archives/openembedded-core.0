Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjidN-0000NO-6f
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 04:05:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Jul 2011 18:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,238,1309762800"; d="scan'208";a="29688872"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by azsmga001.ch.intel.com with ESMTP; 20 Jul 2011 18:58:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 18:58:53 -0700
Message-Id: <4c15caba38740bfc1f30b8f0c2e0d857cb24b38b.1311213306.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311213306.git.sgw@linux.intel.com>
References: <cover.1311213306.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311213306.git.sgw@linux.intel.com>
References: <cover.1311213306.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gettext: Use internal libxml to avoid host contamination
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
X-List-Received-Date: Thu, 21 Jul 2011 02:05:06 -0000

[YOCTO #1242]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 0b11a90..e95e674 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--without-lispdir \
                  --disable-native-java \
                  --disable-openmp \
                  --with-included-glib \
+                 --with-included-libxml \
                  --with-libncurses-prefix=${STAGING_LIBDIR}/.. \
                  --without-emacs \
                  --without-cvs \
-- 
1.7.3.4



