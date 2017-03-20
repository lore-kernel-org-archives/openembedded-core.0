Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 68CE671975
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 22:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490049667; x=1521585667;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=pjYBt9nT9Wbiqy7NfvxjzYOAe03YUZ8MkAkmaeEhjQQ=;
	b=g9UOFJ/KYkhvKIg6HCcUVx40XRfj0a3RkGiZoy/Yu2ZdzHuDpbWcjYWU
	jti7o2DsieVdpUHfRp2PribM1SOofQ==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Mar 2017 15:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,196,1486454400"; d="scan'208";a="1110485015"
Received: from aklin-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.255.72.95])
	by orsmga001.jf.intel.com with ESMTP; 20 Mar 2017 15:41:05 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	patrick.ohly@intel.com
Date: Mon, 20 Mar 2017 16:44:45 -0600
Message-Id: <1490049887-10712-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/3] scripts/lib/compatlayer: Remove require of meta- in layer dir name
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
X-List-Received-Date: Mon, 20 Mar 2017 22:41:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The layers isn't required to have a dirctory name start with meta-
so remove the validation.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/lib/compatlayer/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatlayer/__init__.py
index 888d303..15dc95d 100644
--- a/scripts/lib/compatlayer/__init__.py
+++ b/scripts/lib/compatlayer/__init__.py
@@ -118,7 +118,7 @@ def detect_layers(layer_directories):
         for root, dirs, files in os.walk(directory):
             dir_name = os.path.basename(root)
             conf_dir = os.path.join(root, 'conf')
-            if dir_name.startswith('meta-') and os.path.isdir(conf_dir):
+            if os.path.isdir(conf_dir):
                 layer = _detect_layer(root)
                 if layer:
                     layers.append(layer)
-- 
2.1.4


