Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CF12F7F971
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 02:31:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2019 18:31:37 -0800
X-IronPort-AV: E=Sophos;i="5.69,308,1571727600"; d="scan'208";a="204180879"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.141])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Dec 2019 18:31:35 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Dec 2019 10:31:27 +0800
Message-Id: <20191213023127.4965-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] git: upgrade 2.24.0 -> 2.24.1
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
X-List-Received-Date: Fri, 13 Dec 2019 02:31:35 -0000
Content-Transfer-Encoding: 8bit

Fixes a bunch of CVEs:
https://github.com/git/git/commit/53a06cf39b756eddfe4a2a34da93e3d04eb7b728

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-devtools/git/{git_2.24.0.bb => git_2.24.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/git/{git_2.24.0.bb => git_2.24.1.bb} (39%)

diff --git a/meta/recipes-devtools/git/git_2.24.0.bb b/meta/recipes-devtools/git/git_2.24.1.bb
similarity index 39%
rename from meta/recipes-devtools/git/git_2.24.0.bb
rename to meta/recipes-devtools/git/git_2.24.1.bb
index e9cb382f69..daea31eab2 100644
--- a/meta/recipes-devtools/git/git_2.24.0.bb
+++ b/meta/recipes-devtools/git/git_2.24.1.bb
@@ -5,7 +5,7 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.md5sum] = "ed39361a3ae362c8af852d1a06992bc2"
-SRC_URI[tarball.sha256sum] = "ad11030d2eac656ee9e8862f56d1610550f7867181beff814c7712a99192e99d"
-SRC_URI[manpages.md5sum] = "57465e83f13ba910a178b717d93958c0"
-SRC_URI[manpages.sha256sum] = "ce995f86f441b56ab1fd0788a94786904ae2e2989e7191fd68060003011366d7"
+SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
+SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
+SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
+SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
-- 
2.21.0


