Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web08.17084.1627890833514922652
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002139"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002139"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:35 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478655253"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:34 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 32/37] checklayer: rename _find_layer_depends
Date: Mon,  2 Aug 2021 15:52:19 +0800
Message-Id: <fa52d417ed578194274003c12e14cf93bdb8f7fb.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <nicolas.dechesne@linaro.org>

What this function does is really to find a layer, not a 'depends'. We
are using this function to find a dependent layer, but the name is
confusing.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9b7690ab30d0e7c07471034f6cb89ccc3168a11)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/checklayer/__init__.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/__init__.py b/scripts/lib/checklayer/__init__.py
index 72d9df0a62..e69a10f452 100644
--- a/scripts/lib/checklayer/__init__.py
+++ b/scripts/lib/checklayer/__init__.py
@@ -146,7 +146,7 @@ def detect_layers(layer_directories, no_auto):
 
     return layers
 
-def _find_layer_depends(depend, layers):
+def _find_layer(depend, layers):
     for layer in layers:
         if 'collections' not in layer:
             continue
@@ -166,7 +166,7 @@ def get_layer_dependencies(layer, layers, logger):
             if depend == 'core':
                 continue
 
-            layer_depend = _find_layer_depends(depend, layers)
+            layer_depend = _find_layer(depend, layers)
             if not layer_depend:
                 logger.error('Layer %s depends on %s and isn\'t found.' % \
                         (layer['name'], depend))
-- 
2.31.1

