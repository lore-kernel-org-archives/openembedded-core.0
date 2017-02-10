Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2A296010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1A3NMLh026295
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:22 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:11 -0800
Message-ID: <8284c33504f1fd265fcda1367ac0727846e4d42d.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] wget: 1.18 -> 1.19
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:22 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/wget/wget.inc                       | 2 --
 meta/recipes-extended/wget/{wget_1.18.bb => wget_1.19.bb} | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.18.bb => wget_1.19.bb} (53%)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index c4abfe490e0..3b223a3df86 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -5,8 +5,6 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "gnutls zlib libpcre"
 
-INC_PR = "r16"
-
 inherit autotools gettext texinfo update-alternatives pkgconfig
 
 EXTRA_OECONF = "--with-ssl=gnutls --disable-rpath --disable-iri \
diff --git a/meta/recipes-extended/wget/wget_1.18.bb b/meta/recipes-extended/wget/wget_1.19.bb
similarity index 53%
rename from meta/recipes-extended/wget/wget_1.18.bb
rename to meta/recipes-extended/wget/wget_1.19.bb
index c969b98e7d3..3e022d57d65 100644
--- a/meta/recipes-extended/wget/wget_1.18.bb
+++ b/meta/recipes-extended/wget/wget_1.19.bb
@@ -2,7 +2,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
           "
 
-SRC_URI[md5sum] = "fc2debd8399e3b933a9b226794e2a886"
-SRC_URI[sha256sum] = "a00a65fab84cc46e24c53ce88c45604668a7a479276e037dc2f558e34717fb2d"
+SRC_URI[md5sum] = "f9e928e293e4d7de73ff6f19e0c4b423"
+SRC_URI[sha256sum] = "dd9523039845f69e8e945e9f2d5a38af6b1e29efa6ff53830507310235ddade8"
 
 require wget.inc
-- 
2.11.0.rc2.dirty


