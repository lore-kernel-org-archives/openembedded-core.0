Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7CC272C6D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0S6qTY7008453
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jan 2015 22:52:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 27 Jan 2015 22:52:29 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Jan 2015 22:52:19 -0800
Message-ID: <3536f700c3c9f8350454aa05f7a4b0f23caa57a1.1422427700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422427700.git.liezhi.yang@windriver.com>
References: <cover.1422427700.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/12] cdrtools-native: fix HOMEPAGE and SRC_URI
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
X-List-Received-Date: Wed, 28 Jan 2015 06:52:29 -0000
Content-Type: text/plain

The old ones are invalid, fixed:
WARNING: Failed to fetch URL ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-3.01a20.tar.bz2, attempting MIRRORS if available

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cdrtools/cdrtools-native_3.01a20.bb            |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
index 01f9e6e..2827109 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a20.bb
@@ -2,12 +2,12 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "A set of tools for CD recording, including cdrecord"
-HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
+HOMEPAGE = "http://sourceforge.net/projects/cdrtools/"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
-SRC_URI = "ftp://ftp.berlios.de/pub/cdrecord/alpha/cdrtools-${PV}.tar.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/cdrtools/alpha/cdrtools-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "f8c6f0fdcba7df0606095498d10315a7"
 SRC_URI[sha256sum] = "e399ea964b8048793721b71461271e46d81f242bd2feefb8dbd259c30e75a5a9"
-- 
1.7.9.5


