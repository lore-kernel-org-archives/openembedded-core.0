Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5BE722E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lfZA003241
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:41 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:20 -0800
Message-ID: <8fa92635208a3d6428a77e94c607fa8774c13b00.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/27] gnutls: separate B and S
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
X-List-Received-Date: Wed, 14 Jan 2015 08:47:47 -0000
Content-Type: text/plain

It works well now, and bump the PR to avoid:
configure: error: source directory already configured; run "make distclean" there first

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-support/gnutls/gnutls.inc       |    2 +-
 meta/recipes-support/gnutls/gnutls_3.3.11.bb |    2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 12b26cc..45fb529 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -17,7 +17,7 @@ SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
-inherit autotools-brokensep texinfo binconfig pkgconfig gettext lib_package
+inherit autotools texinfo binconfig pkgconfig gettext lib_package
 
 EXTRA_OECONF="--disable-rpath \
               --with-included-libtasn1 \
diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
index 320c510..1cf3a74 100644
--- a/meta/recipes-support/gnutls/gnutls_3.3.11.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
@@ -1,5 +1,7 @@
 require gnutls.inc
 
+PR = "r1"
+
 SRC_URI += "file://correct_rpl_gettimeofday_signature.patch \
            "
 SRC_URI[md5sum] = "b657e3010c10cae2244e7ce79ee3d446"
-- 
1.7.9.5


