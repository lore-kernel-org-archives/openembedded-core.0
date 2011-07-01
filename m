Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QcXgZ-0004GP-Vo
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:58:44 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Jun 2011 23:55:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,456,1304319600"; d="scan'208";a="25080523"
Received: from unknown (HELO swold-MOBL.localdomain) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2011 23:54:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 23:54:30 -0700
Message-Id: <2c1f14cd83e1b1f5bf0765f4dfce2e4f8e5dfcc2.1309503004.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
In-Reply-To: <cover.1309503004.git.sgw@linux.intel.com>
References: <cover.1309503004.git.sgw@linux.intel.com>
Subject: [PATCH 3/4] mpeg2dec: add SRC_URI Checksum
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
X-List-Received-Date: Fri, 01 Jul 2011 06:58:44 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
index 4aa6f8c..f21d2c3 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb
@@ -13,6 +13,9 @@ PR = "r1"
 SRC_URI = "http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz \
            file://altivec_h_needed.patch"
 
+SRC_URI[md5sum] = "7631b0a4bcfdd0d78c0bb0083080b0dc"
+SRC_URI[sha256sum] = "c74a76068f8ec36d4bb59a03bf1157be44118ca02252180e8b358b0b5e3edeee"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-shared --disable-sdl --with-x"
-- 
1.7.3.4



