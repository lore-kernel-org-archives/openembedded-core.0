Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3EF373B28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 01:39:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t2C1d3eF018900
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:39:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 18:39:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Mar 2015 18:39:01 -0700
Message-ID: <d6f55a0bb1c436bd0ab48456fe6fc9f84e390778.1426124214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1426124214.git.liezhi.yang@windriver.com>
References: <cover.1426124214.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] resolvconf: fix SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2015 01:39:01 -0000
Content-Type: text/plain

Fixed:
WARNING: Failed to fetch URL ftp://ftp.debian.org/debian/pool/main/r/resolvconf/resolvconf_1.76.tar.xz, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../resolvconf/resolvconf_1.76.bb                  |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
index 20a2c19..797e9b0 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.76.bb
@@ -11,12 +11,11 @@ AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
 RDEPENDS_${PN} = "bash"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.xz \
+SRC_URI = "http://snapshot.debian.org/archive/debian/20141013T184415Z/pool/main/r/${BPN}/${BPN}_1.76.tar.xz \
            file://fix-path-for-busybox.patch \
            file://99_resolvconf \
           "
 
-
 SRC_URI[md5sum] = "d78ce30ea068999cd3e0523300b27255"
 SRC_URI[sha256sum] = "c9f40f7405b37399ddbf29ca4205b4911ee35cb9ffd9be7671faa2385b1fa573"
 
-- 
1.7.9.5


