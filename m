Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D26F56E5DE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Feb 2015 01:12:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t131CMYq022776
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Feb 2015 17:12:22 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 2 Feb 2015 17:12:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Feb 2015 17:12:02 -0800
Message-ID: <2ffbf21985532fb1a2214e8d6206dbfa5022c6b9.1422925725.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422925725.git.liezhi.yang@windriver.com>
References: <cover.1422925725.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/21] m4 1.4.9: fix unknown-configure-option
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
X-List-Received-Date: Tue, 03 Feb 2015 01:12:20 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: m4: configure was passed unrecognised options: --without-libsigsegv-prefix [unknown-configure-option]

The m4 1.4.9 doesn't support --without-libsigsegv-prefix, so move it from m4.inc
to m4-1.4.17.inc.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/m4/m4-1.4.17.inc |    2 ++
 meta/recipes-devtools/m4/m4.inc        |    1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/m4/m4-1.4.17.inc b/meta/recipes-devtools/m4/m4-1.4.17.inc
index 790678e..3133e99 100644
--- a/meta/recipes-devtools/m4/m4-1.4.17.inc
+++ b/meta/recipes-devtools/m4/m4-1.4.17.inc
@@ -1,5 +1,7 @@
 require m4.inc
 
+EXTRA_OECONF += "--without-libsigsegv-prefix"
+
 LICENSE = "GPLv3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index e473e23..4a83929 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -5,7 +5,6 @@ GNU M4 also has built-in functions for including files, running shell commands,
 
 inherit autotools texinfo
 
-EXTRA_OECONF += "--without-libsigsegv-prefix"
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 LDFLAGS_prepend_libc-uclibc = " -lrt "
 SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
-- 
1.7.9.5


