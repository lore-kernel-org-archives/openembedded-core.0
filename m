Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 470B6758B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:51:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t59EpwSK012253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Jun 2015 07:51:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Jun 2015 07:51:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jun 2015 07:51:46 -0700
Message-ID: <e09c98c95c9d4f9f693d774210be607392f2b166.1433842738.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1433842738.git.liezhi.yang@windriver.com>
References: <cover.1433842738.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/12] libpfm4: 4.3.0 -> 4.6.0
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
X-List-Received-Date: Tue, 09 Jun 2015 14:52:06 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libpfm/{libpfm4_4.3.0.bb => libpfm4_4.6.0.bb}  |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/libpfm/{libpfm4_4.3.0.bb => libpfm4_4.6.0.bb} (78%)

diff --git a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
similarity index 78%
rename from meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
rename to meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
index 98852f6..b66fbd1 100644
--- a/meta/recipes-kernel/libpfm/libpfm4_4.3.0.bb
+++ b/meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb
@@ -10,13 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0de488f3bd4424e308e2e399cb99c788"
 
 SECTION = "devel"
 
-PR = "r1"
 COMPATIBLE_HOST = "powerpc64"
 
-SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/libpfm4/libpfm-4.3.0.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/project/perfmon2/${BPN}/libpfm-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ab272dbdbb759b852ba8bd06db030ef"
-SRC_URI[sha256sum] = "a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b"
+SRC_URI[md5sum] = "5077b9022440e4951d96f2d0e73bd487"
+SRC_URI[sha256sum] = "5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f"
 
 EXTRA_OEMAKE = "DESTDIR=\"${D}\" PREFIX=\"${prefix}\" LIBDIR=\"${libdir}\" LDCONFIG=\"true\""
 EXTRA_OEMAKE_append_powerpc = " ARCH=\"powerpc\""
-- 
1.7.9.5


