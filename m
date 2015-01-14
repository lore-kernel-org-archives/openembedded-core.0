Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D30A4729D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lePf022105
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:40 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:40 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:17 -0800
Message-ID: <8d0eade0380f918d1e6ffa9eb88c9128f67af362.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/27] cracklib: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:48 -0000
Content-Type: text/plain

It works well now, and bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/cracklib/cracklib_2.9.2.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
index b66ca54..177ab27 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.9.2.bb
@@ -16,7 +16,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/cracklib/cracklib-${PV}.tar.gz \
 SRC_URI[md5sum] = "559072fdfc095cdb763c4de3471a889e"
 SRC_URI[sha256sum] = "c1c899291d443e99d1aecfbc879e4ac9c0cbc265574f47b487842da11e9759f5"
 
-inherit autotools-brokensep gettext
+PR = "r1"
+
+inherit autotools gettext
 
 do_install_append_class-target() {
 	create-cracklib-dict -o ${D}${datadir}/cracklib/pw_dict ${D}${datadir}/cracklib/cracklib-small
-- 
1.7.9.5


