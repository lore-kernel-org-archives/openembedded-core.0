Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C9C8E7145E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 08:00:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8480OVa012383
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Sep 2014 01:00:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Sep 2014 01:00:23 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Sep 2014 16:00:34 +0800
Message-ID: <900fdb3bbab2f4afa935b97d5e5ffe20ec4345ec.1409817599.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409817599.git.Qi.Chen@windriver.com>
References: <cover.1409817599.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bitbake.conf: use ??= for IMAGE_ROOTFS_SIZE
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
X-List-Received-Date: Thu, 04 Sep 2014 08:00:29 -0000
Content-Type: text/plain

Previously, when building core-image-minimal, the rootfs size would
default to 64M because we use '?=' in bitbake.conf and also '?=' in
core-image-minimal.bb.

The thing is, we'd like to have a default value for all images set
in bitbake.conf but still allow each image recipe to set its own default
value which could be overridden by users in local.conf.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2771233..468b175 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -689,7 +689,7 @@ MACHINE_TASK_PROVIDER ?= "${DEFAULT_TASK_PROVIDER}"
 # The size in Kbytes for the generated image if it is larger than
 # the required size (du -ks IMAGE_ROOTFS * IMAGE_OVERHEAD_FACTOR),
 # and no effect if less than it.
-IMAGE_ROOTFS_SIZE ?= "65536"
+IMAGE_ROOTFS_SIZE ??= "65536"
 
 # Forcefully set CACHE now so future changes to things like 
 # MACHINE don't change the path to the cache
-- 
1.9.1


