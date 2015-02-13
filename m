Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E723733B5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 03:02:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1D32vWk019192
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 19:02:58 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 19:02:57 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 19:02:55 -0800
Message-ID: <6e8fe07145606b32b819f3225c9abedc2a08a2bf.1423796513.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423796513.git.liezhi.yang@windriver.com>
References: <cover.1423796513.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] coreutils 6.9: fix unknown-configure-option
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
X-List-Received-Date: Fri, 13 Feb 2015 03:03:02 -0000
Content-Type: text/plain

Fixed:
WARNING: QA Issue: coreutils: configure was passed unrecognised options: --disable-acl [unknown-configure-option]

It doesn't support --enable-acl or --disable-acl, use
ac_cv_header_acl_libacl_h to fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/coreutils/coreutils_6.9.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 7f34e1b..9189426 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -37,7 +37,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'acl', 'acl', '', d)}
 
 # with, without, depends, rdepends
 #
-PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl,"
+PACKAGECONFIG[acl] = "ac_cv_header_sys_acl_h=yes,ac_cv_header_sys_acl_h=no,acl,"
 
 
 # [ gets a special treatment and is not included in this
-- 
1.7.9.5


