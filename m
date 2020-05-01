Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.3110.1588363526824318250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2020 13:05:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.93, mailfrom: timothy.t.orling@linux.intel.com)
IronPort-SDR: 91Ak8NfIyWEZWoNge0R/paODWF66DnWopkfzpTIrkyH77MVC+k/zC7b8qE3z3LGxkVShM9A6Zj
 tC0uk1Gqj6dg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 13:05:25 -0700
IronPort-SDR: jiu67mf5WnAGQrrkGgMKlaHRFyTNPXFRfYG+2vPiO6Il29fV/CsMQN2lhKbHLTgHGQZLRF7jbd
 PNfTM6+Y0WvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; 
   d="scan'208";a="248626965"
Received: from wrath.jf.intel.com ([10.54.31.24])
  by fmsmga007.fm.intel.com with ESMTP; 01 May 2020 13:05:25 -0700
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH 1/2] atk: upgrade 2.34.1 -> 2.36.0
Date: Fri,  1 May 2020 13:05:15 -0700
Message-Id: <20200501200516.4061-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream release notes:

Changes in version 2.36
=========================

* New API
   * Added ATK_ROLE_MARK and ATK_ROLE_SUGGESTION
   * Add ATK_TEX_ATTR_TEXT_POSITION to the list of possible AtkText
     attributes (MR!33)

* Documentation
   * Updated documentation for atk_text_set_caret_offset (MR!18)

* Building - meson
   * Fix building atk as subproject
   * Add Meson wrap file for GLib (MR!37)

* Building - visual studio
   * Use -utf-8 if available (MR!38)

Contributors
   Luca Bacci, Joanmarie Diggs, Samuel Thibault

Translations

   Fran Dieguez (gl), Ryuta Fujii (ja), Daniel Korostil (uk), Jwtiyar
   Nariman (ckb), Umarzuki Bin Mochlis Moktar (ms)

Changes in version 2.35.1
=========================

* AtkComponent, AtkImage, AtkText: Make sure returned values are
  initialized to some known default value (MR!22, MR!24)

* AtkPlug
   * Add atk_plug_set_child (MR!27)

* AtkSocket
   * Make AtkSocket get_extents return parent extents by default (MR!23)
   * atk_socket_embed: make plug_id parameter const (MR!26)
   * Make AtkSocketClass (embed) use const for plug_id (MR!31)

* AtkText
   * Make atk_text_rectangle_union ignore undefined rectangles (MR!25)

* Documentation
   * Refine *_scroll_to_point documentation (MR!21)
   * Refine AtkScrollType documentation (MR!12)

Contributors
  Samuel Thibault

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-support/atk/{atk_2.34.1.bb => atk_2.36.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/atk/{atk_2.34.1.bb => atk_2.36.0.bb} (80%)

diff --git a/meta/recipes-support/atk/atk_2.34.1.bb b/meta/recipes-support/atk/atk_2.36.0.bb
similarity index 80%
rename from meta/recipes-support/atk/atk_2.34.1.bb
rename to meta/recipes-support/atk/atk_2.36.0.bb
index 277397c6943..0786eeebe87 100644
--- a/meta/recipes-support/atk/atk_2.34.1.bb
+++ b/meta/recipes-support/atk/atk_2.36.0.bb
@@ -14,8 +14,8 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI[archive.md5sum] = "f60bbaf8bdd08b93d98736b54b2fc8e9"
-SRC_URI[archive.sha256sum] = "d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb"
+SRC_URI[archive.md5sum] = "01aa5ec5138f5f8c9b3a4e3196ed2900"
+SRC_URI[archive.sha256sum] = "fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.24.0

