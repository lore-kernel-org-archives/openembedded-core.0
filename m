Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 911FA7D16A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 07:45:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x327ien4024030
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2019 00:44:57 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 2 Apr 2019 00:44:51 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Apr 2019 03:44:27 -0400
Message-ID: <20190402074427.26561-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190402074427.26561-1-kai.kang@windriver.com>
References: <20190402074427.26561-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] webkitgtk: 2.22.6 -> 2.22.7
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
X-List-Received-Date: Tue, 02 Apr 2019 07:45:06 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

webkitgtk 2.22.7 is a bug fix release in the stable 2.22 series.

* Fix rendering of glyphs in Hebrew (and possibly other languages) when
  Unicode NFC normalization is used.
* Fix several crashes and race conditions.

See https://www.webkitgtk.org/2019/03/01/webkitgtk2.22.7-released.html

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../webkit/{webkitgtk_2.22.6.bb => webkitgtk_2.22.7.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.22.6.bb => webkitgtk_2.22.7.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.22.6.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
index 35c70e0d02..301bf10cea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.7.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://bad_optional_access.patch \
            "
 
-SRC_URI[md5sum] = "7c21a30f7f078f0b712caf0c7ee966a4"
-SRC_URI[sha256sum] = "df90db9c0db0a2072b945fa3e1d45865922bd686c4659cce6cb5897ce357c85b"
+SRC_URI[md5sum] = "47386c10a9c3975f933c85404f35ff3b"
+SRC_URI[sha256sum] = "4be6f7d605cd0a690fd26e8aa83b089a33ad9d419148eafcfb60580dd2af30ff"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.20.0


