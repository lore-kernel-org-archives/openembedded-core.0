Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23F1B6AF02
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:10:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r639AIiD003793
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jul 2013 02:10:18 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 3 Jul 2013 02:10:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 17:10:13 +0800
Message-ID: <318c63c68a97b481a0ac0400dc84b1ea1fa426f2.1372842406.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1372842406.git.jackie.huang@windriver.com>
References: <cover.1372842406.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] udev-extraconf: blacklist /dev/dm-*
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
X-List-Received-Date: Wed, 03 Jul 2013 09:10:18 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Do not mount /dev/dm-* by default via udev, this is the default
behavior for most distos and WRLinux4.x.

This resolved a problem with the sanity test failing due to seeing
the error while attempting to mount new logical volumes without fs.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../udev/udev-extraconf/mount.blacklist            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.blacklist b/meta/recipes-core/udev/udev-extraconf/mount.blacklist
index 7c7d938..e493494 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.blacklist
+++ b/meta/recipes-core/udev/udev-extraconf/mount.blacklist
@@ -2,3 +2,4 @@
 /dev/ram
 /dev/mtdblock
 /dev/md
+/dev/dm-*
-- 
1.7.4.1


