Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D63767878B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 14:04:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 06:04:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,401,1511856000"; d="scan'208";a="21925851"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Jan 2018 06:04:18 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 33AC15800D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 06:04:18 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 16:05:50 +0200
Message-Id: <1516716352-32735-11-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
References: <1516716352-32735-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 10/12] gtk+3: upgrade to version 3.22.26
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
X-List-Received-Date: Tue, 23 Jan 2018 14:04:18 -0000

Bug fixes and Translation updates

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-gnome/gtk+/{gtk+3_3.22.24.bb => gtk+3_3.22.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.24.bb => gtk+3_3.22.26.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb b/meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb
index ac0a9b7..6651ca6 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.24.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.22.26.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "b782a15b7b5b2005a1ce4647fb002a49"
-SRC_URI[sha256sum] = "cbb16e4cfc928ab8f5f22f7290616f95f6ebc8c97cc724a2007b07ced833592b"
+SRC_URI[md5sum] = "eeeb8038fe0d386c7516fa46cd4fff6b"
+SRC_URI[sha256sum] = "61eef0d320e541976e2dfe445729f12b5ade53050ee9de6184235cb60cd4b967"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.4.0


