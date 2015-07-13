Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 12F636E648
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 10:04:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6DA4Z4r024101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 03:04:35 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jul 2015 03:04:34 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jul 2015 03:04:31 -0700
Message-ID: <70c844a549ecb13d903a5e9141be7ffc489061db.1436781811.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436781811.git.liezhi.yang@windriver.com>
References: <cover.1436781811.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] apt: remove invalid ac_cv_glibc_ver
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
X-List-Received-Date: Mon, 13 Jul 2015 10:04:35 -0000
Content-Type: text/plain

There is no ac_cv_glibc_ver in configure, can't find it
in config.log after remove, either.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/apt/apt.inc |   12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 04fcd65..94bd6e9 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -22,16 +22,4 @@ do_configure_prepend() {
     rm -rf ${S}/buildlib/config.guess
 }
 
-# Apt wants to know the glibc version by running a binary file, which will
-# fail, so we have to tell configure which version to use Since I don't know
-# the impliations of setting a wrong value I only provide one for angstrom,
-# which uses glibc 2.5 (which claims to be 2.4) 
-# Koen - 20070327
-EXTRA_OECONF_append_angstrom = " ac_cv_glibc_ver=libc6.4"
-
-# under Debian it is set to libc6.3 as they use glibc 2.3
-# They also provide glibc 2.5 in 'experimental' and it works with APT built
-# for 2.3 so we set it in same way
-EXTRA_OECONF_append = " ac_cv_glibc_ver=libc6.3"
-
 FILES_${PN}-dbg += "${libdir}/apt/methods/.debug/"
-- 
1.7.9.5


