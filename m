Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 842EA780FA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 07:57:00 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id m18so44517417lfj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 00:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=pUURWRO5rKncoQKnIzk/phiSoMKGUkM/CTsrcnVirb8=;
	b=Ug94PoUaV5RzfWWzEpWPVpKZyE7YA0KtEj1JFSKZVIkoqBgAIG/1jVgTcwHg9b3tB6
	iBmDFlwuEHPxMTMbEhRCa5IBkU4payEEf9+emCWU2gk+c8t/WymaAJxqHg7pW+tEr1Ah
	QMrgivzHiOCEx8uTlQiRk8kLuNFFOi/DY09R29KqphOyQNmTsSnmexIutWpIZLqTD2vg
	a+JjWeQSw+5M58jL8xAzjp/qugk0ERhoRwXDnGNR6Q3QT3WPBnpO4xdkxvqdvoYlZoYB
	CUaPkn2z2pqZaTVgCuVbJcju5vizTtvkqAysM3G4f3JDz9oWeGS02QZKDROpx+eAk4Sc
	ovXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pUURWRO5rKncoQKnIzk/phiSoMKGUkM/CTsrcnVirb8=;
	b=HU77k/KI6MhGBzedG5TmBI+zZxbv/shD+ykKFuuZ/nhw1nWry/XnSotlM9NndHzlYA
	3R8Pj6R11XZozv0DJsP8nmYXHErzbkMfQTPld85UzQdEnb30SfCgsaL/BSfvGWtDUBb2
	f4KDvyBtij72BepcFEK1PahdVLORjh/H80BY6Wj8oapQlABpgeVeMYcYB0y+u0pG0mBc
	WtAYsdb+kRZbhDrRk5yh/JdF/SydbjqMcZ9FYmzosxphJRWJBK3YHhlcu7XFMkGZyWBA
	qlIKQma2x8Z2DStwK39bMnwIcUPnHkN0eIMR2fwMzRH5iWny0dIl+YQI+3hOIwPFNRwT
	V2OA==
X-Gm-Message-State: AODbwcANahl8k26sYdTLa9aQ2Z3fe9DRBoQDlPdMmShRCJ6nvGZI8n9E
	TZA3GU9Kt9DnLSXDcsWVuA==
X-Received: by 10.25.28.78 with SMTP id c75mr5044800lfc.154.1496131021413;
	Tue, 30 May 2017 00:57:01 -0700 (PDT)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	m20sm2474769ljb.26.2017.05.30.00.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 May 2017 00:57:00 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@mender.io>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2017 09:56:59 +0200
Message-Id: <1496131019-19576-1-git-send-email-kristian.amlie@mender.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] wic: Remove obsolete reference to msger logger.
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
X-List-Received-Date: Tue, 30 May 2017 07:57:01 -0000

This was overlooked when msger was removed in 28014087b8091.

Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
---
 scripts/lib/wic/plugins/source/rootfs.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
index f2e2ca8..944ec5f 100644
--- a/scripts/lib/wic/plugins/source/rootfs.py
+++ b/scripts/lib/wic/plugins/source/rootfs.py
@@ -28,6 +28,7 @@
 import logging
 import os
 import shutil
+import sys
 
 from oe.path import copyhardlinktree
 
@@ -98,7 +99,8 @@ class RootfsPlugin(SourcePlugin):
             for orig_path in part.exclude_path:
                 path = orig_path
                 if os.path.isabs(path):
-                    msger.error("Must be relative: --exclude-path=%s" % orig_path)
+                    logger.error("Must be relative: --exclude-path=%s" % orig_path)
+                    sys.exit(1)
 
                 full_path = os.path.realpath(os.path.join(new_rootfs, path))
 
@@ -106,7 +108,8 @@ class RootfsPlugin(SourcePlugin):
                 # because doing so could be quite disastrous (we will delete the
                 # directory).
                 if not full_path.startswith(new_rootfs):
-                    msger.error("'%s' points to a path outside the rootfs" % orig_path)
+                    logger.error("'%s' points to a path outside the rootfs" % orig_path)
+                    sys.exit(1)
 
                 if path.endswith(os.sep):
                     # Delete content only.
-- 
2.7.4


