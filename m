Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1412E72AED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 08:47:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0E8lkoq022132
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 00:47:46 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 14 Jan 2015 00:47:46 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Jan 2015 00:47:35 -0800
Message-ID: <b0aa0bb4c5a438487bc0d382ec2d7350c09d029e.1421225218.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421225218.git.liezhi.yang@windriver.com>
References: <cover.1421225218.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 24/27] icon-naming-utils: separate B and S
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
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 18e7fc0..6b356b0 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -10,7 +10,7 @@ and names that can be used to make icon themes work in a desktop \
 environment or application that implements the naming specification. "
 LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
-PR = "r4"
+PR = "r5"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
@@ -18,7 +18,7 @@ SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
 SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
 SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
 
-inherit autotools-brokensep allarch perlnative
+inherit autotools allarch perlnative
 
 do_configure_append() {
 	# Make sure we use our nativeperl wrapper.
-- 
1.7.9.5


