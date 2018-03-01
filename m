Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 6F28B788D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:07:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134163"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:48 +0200
Message-Id: <20180301140052.1388-11-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/15] epiphany: upgrade 3.26.5.1 -> 3.26.6
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:58 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../epiphany/{epiphany_3.26.5.1.bb => epiphany_3.26.6.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.26.5.1.bb => epiphany_3.26.6.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.26.6.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.26.6.bb
index eee53c6015e..e250f76ed1e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.26.5.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.26.6.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "8c2062debde6377320596e2685bb1732"
-SRC_URI[archive.sha256sum] = "4b2f1c48e6f50793ff205d9215add5596ab5c7ebf4cef76907868fcd5a029221"
+SRC_URI[archive.md5sum] = "8449968366a6f9aaff3ac228ddfc7c66"
+SRC_URI[archive.sha256sum] = "01b16aa55d312ae0f17d3136f90d8c68ac748715f119412fb1917023c6f630a8"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-- 
2.15.1


