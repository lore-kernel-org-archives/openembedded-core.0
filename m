Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 60F7D74C60
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 12:38:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 May 2018 05:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,362,1520924400"; d="scan'208";a="39254278"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 04 May 2018 05:38:43 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 15:32:36 +0300
Message-Id: <20180504123244.43049-6-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 06/14] epiphany: update to 3.28.1.1
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
X-List-Received-Date: Fri, 04 May 2018 12:38:43 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../epiphany/{epiphany_3.28.0.1.bb => epiphany_3.28.1.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_3.28.0.1.bb => epiphany_3.28.1.1.bb} (84%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
similarity index 84%
rename from meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
index c878ee3229a..490d0f6a9c8 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.28.0.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.28.1.1.bb
@@ -13,8 +13,8 @@ REQUIRED_DISTRO_FEATURES = "x11"
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
            "
-SRC_URI[archive.md5sum] = "3e127d843d3f255f426ab34804f29163"
-SRC_URI[archive.sha256sum] = "7154b06837655771f2240bf378fb8ba2315ae07dbc6f45d160ca29cd6d377808"
+SRC_URI[archive.md5sum] = "9f4c0bf831789638818c23cd555b29d9"
+SRC_URI[archive.sha256sum] = "99426aa0e386742e924d84b59ec16bf394195fb9fce85d07f72d2cde486ea495"
 
 EXTRA_OEMESON += " -Ddistributor_name=${DISTRO}"
 
-- 
2.16.1


