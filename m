Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAL-0001px-A4
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:53 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:16 -0700
Received: by mail-wg0-f44.google.com with SMTP id dr13so4758818wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=J46JdBPQGvSDQvRgQwbr8SpFnLNBuzkfr2LqKizRjxs=;
	b=XqvR9MiZfZFOXNmpy2DlehHBYaoGJUsyin75qvKIwqYo+MtA8C20KzbB1L9ys3zw0I
	mtKSpnWxlVTLG/EU90eN/r3J4CheOQ5gzdcfQdTFQXZnCcBiK+qvKetTuJ+qw4pRWhwG
	WzU4CF02WtvTsZWO84YvA2SdqaYLgmiaeej7lCXJ78Evzb++OqVoVeyscxeBROwqgDWJ
	l1RmYZTbRfoZtAxYlwRVQVWh9+k/lYrzqCLP0M0nq+1oxDc6/wqiUAChkDldUQ4nIe2i
	QRWUpaMRgtGmYm2t+shciGC+bjeyYkFqCZq2l+5z2V0KXC0fM2SPfA10WLGwuQIgE+Ro
	49Xw==
Received: by 10.180.81.193 with SMTP id c1mr12864489wiy.12.1343835436241;
	Wed, 01 Aug 2012 08:37:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:37 +0100
Message-Id: <85aff8ff88fafca9d79b810956b33b72b1b67fd6.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnK/+PIAcO68gd/4zLPgyXJWQ2euCNwlP7rAAI7s25ctttxdVS/tpcI7dJQtJDANky0TWXK
Subject: [PATCH 10/11] mesa: no need to depend on python-native, the class does that
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:48:53 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 661e76e..dfc9266 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,10 +12,10 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r3"
+INC_PR = "r4"
 PE = "2"
 
-DEPENDS = "libxml2-native makedepend-native python-native flex-native bison-native"
+DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
 
-- 
1.7.10



