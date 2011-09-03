Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qztj6-0002Wc-BU
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 19:09:52 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Sep 2011 10:04:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="44776170"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.30])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2011 10:04:52 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Sep 2011 10:04:50 -0700
Message-Id: <93299d9dce4bdc3acf75026edf0356b287b0c6f9.1315069299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315069299.git.sgw@linux.intel.com>
References: <cover.1315069299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315069299.git.sgw@linux.intel.com>
References: <cover.1315069299.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] gettext: use included libxml and libcroco
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
X-List-Received-Date: Sat, 03 Sep 2011 17:09:52 -0000

[YOCTO #1400]

By using the included libxml and libcroco, we do not create additional
on this core library. There was an ordering issue that when one library
was not built, but gettext detected the other library a compliation would
fail, this will force it to always use the included libraries.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 9ec851e..0bcd90b 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -36,6 +36,8 @@ EXTRA_OECONF += "--without-lispdir \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
+                 --with-included-libxml \
+                 --with-included-libcroco \
                 "
 
 acpaths = '-I ${S}/gettext-runtime/m4 \
-- 
1.7.6



