Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 776A67319F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 06:25:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1F6PEv5027182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 22:25:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Feb 2017 22:25:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2017 22:25:07 -0800
Message-ID: <5c9fb24fb0118322b6ef212808eb7fe2c1fcd171.1487139819.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1487139819.git.liezhi.yang@windriver.com>
References: <cover.1487139819.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] btrfs-tools: remove udev from DEPENDS
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
X-List-Received-Date: Wed, 15 Feb 2017 06:25:48 -0000
Content-Type: text/plain

The log said that udev was added to DEPENDS because btrfs-tools installs
a udev rule, this was incorrect, and it caused a side effect:

$ bitbake btrfs-tools-native

ERROR: Nothing PROVIDES 'udev-native' (but virtual:native:btrfs-tools_4.8.5.bb DEPENDS on or otherwise requires it). Close matches:
[snip]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
index 7047c43..ab6aacb 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.8.5.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://btrfs.wiki.kernel.org"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
-DEPENDS = "util-linux attr e2fsprogs lzo acl udev"
+DEPENDS = "util-linux attr e2fsprogs lzo acl"
 RDEPENDS_${PN} = "libgcc"
 
 SRCREV = "144a19145e248513c7a676defad59836830535c6"
-- 
2.10.2


