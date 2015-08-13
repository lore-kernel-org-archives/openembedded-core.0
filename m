Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0B97649D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 07:37:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7D7bNu3022145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 00:37:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 13 Aug 2015 00:37:23 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Aug 2015 00:37:21 -0700
Message-ID: <ce00aff5a51471e663a9cc83c1521f4f24dfba14.1439449078.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1439449078.git.liezhi.yang@windriver.com>
References: <cover.1439449078.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] packagegroup-core-standalone-sdk-target: remove qemuwrapper-cross
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
X-List-Received-Date: Thu, 13 Aug 2015 07:37:23 -0000
Content-Type: text/plain

Remove qemuwrapper-cross from RDEPENDS, install a cross pkg in sysroots
isn't useful, if we really need run qemuwrapper in SDK, we should add it
as nativesdk, and it has multilib conflicts when populate_ sdk:

error: file /usr/bin/crossscripts/qemuwrapper from install of
qemuwrapper-cross-1.0-r0.lib32_x86 conflicts with file from package
qemuwrapper-cross-1.0-r0.core2_64

[YOCTO #8089]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../packagegroup-core-standalone-sdk-target.bb     |    1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
index 5d1ce97..37f5e43 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-standalone-sdk-target.bb
@@ -10,5 +10,4 @@ RDEPENDS_${PN} = "\
     libstdc++ \
     libstdc++-dev \
     ${LIBC_DEPENDENCIES} \
-    qemuwrapper-cross \
     "
-- 
1.7.9.5


