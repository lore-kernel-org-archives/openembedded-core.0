Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0BE56FF9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:31:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0B0ViVi023960
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Jan 2016 16:31:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 16:31:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 08:30:39 +0800
Message-ID: <854f4360ebccd50379b91acd6228171fd7ffcce8.1452472146.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1452472146.git.hongxu.jia@windriver.com>
References: <cover.1452472146.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] gnupg: 2.1.7 -> 2.1.10
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
X-List-Received-Date: Mon, 11 Jan 2016 00:31:44 -0000
Content-Type: text/plain

Add PACKAGECONFIG for sqlite3 to avoid QA Warning
...
WARNING: QA Issue: gnupg rdepends on libsqlite3, but it isn't a build dependency? [build-deps]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.1.7.bb => gnupg_2.1.10.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-support/gnupg/{gnupg_2.1.7.bb => gnupg_2.1.10.bb} (84%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.1.7.bb b/meta/recipes-support/gnupg/gnupg_2.1.10.bb
similarity index 84%
rename from meta/recipes-support/gnupg/gnupg_2.1.7.bb
rename to meta/recipes-support/gnupg/gnupg_2.1.10.bb
index 979e6f9..5a4f2e8 100644
--- a/meta/recipes-support/gnupg/gnupg_2.1.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.1.10.bb
@@ -15,8 +15,8 @@ SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://autogen.sh-fix-find-version-for-beta-checking.patch \
           "
 
-SRC_URI[md5sum] = "ebdf92b15b8bcd8579b643c7f41a3238"
-SRC_URI[sha256sum] = "c18a3776d47fec98892d51d28b6574ef16bf0a25eabb0956231058aaf2e7846e"
+SRC_URI[md5sum] = "f0a7cb09fe119f8b82eba7efecd27dc0"
+SRC_URI[sha256sum] = "93bd58d81771a4fa488566e5d2e13b1fd7afc86789401eb41731882abfd26cf9"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
@@ -40,3 +40,6 @@ do_install_append() {
 }
 
 RDEPENDS_${PN} = "gnutls"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[sqlite3] = "--enable-sqlite, --disable-sqlite, sqlite3"
-- 
1.9.1


