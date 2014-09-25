Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 50B6960144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 12:25:36 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 766B6E00CB;
	Thu, 25 Sep 2014 14:19:41 +0200 (CEST)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 6811F700D59; Thu, 25 Sep 2014 14:19:41 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 14:17:57 +0200
Message-Id: <1411647477-12992-3-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
Subject: [daisy][PATCH 3/3] layer.conf: Mark opkg-utils as ABISAFE for update-alternatives usage
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
X-List-Received-Date: Thu, 25 Sep 2014 12:25:37 -0000

Currently linux-firmware rebuilds for each machine due to its usage of
update-alternatives which in turn means a dependency on opkg-utils.
Marking opkg-utils as ABISAFE is the only option we have right now
to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index a764ee0..13814dc 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -14,6 +14,7 @@ LAYERVERSION_core = "4"
 # Set a variable to get to the top of the metadata location
 COREBASE = '${@os.path.normpath("${LAYERDIR}/../")}'
 
+# opkg-utils is for update-altnernatives :(
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   sysvinit-inittab \
   shadow-securetty \
@@ -34,4 +35,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   shadow \
   shadow-sysroot \
   base-passwd \
+  opkg-utils \
 "
-- 
2.1.1


