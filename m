Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShJXz-0001pL-QF
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 13:58:08 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 20 Jun 2012 04:47:20 -0700
Received: by weyt11 with SMTP id t11so4835275wey.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 04:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=oemN7FB5eds8+gHZKHwWO5xvL2z9Mayapklc4NvbjCM=;
	b=jLC3D/1NkdSkPiutZuzGWS47Av2QqxwMLVseA3xi68ewweVlasmJVFr+FIXLmtX1A0
	66cRch3BxvAcWQSRUaIL43fnifINd7QGVZnB016V1MkXEFNnQ1zFWeYSZATk+cZilXbg
	L0lPk/iU9FoRRUIvPr6tPOD57NkGbPj5ZXcT1pZsMXn1j6Zcr8/Or5BXkeTA7Ayj5fhD
	BUk5NSloXUlBoZIcmljRnNSw9f5kRSRx1vrdZC1v/t6XhUVR1ql6PbyU/ZKUWSuc4RtT
	8qlTSgO8V3rID+qAo1hRu4neQ5ldI4zu/qrb/7yMAa16Uuc1onQut3LfYhYmfFUAihJC
	i1zg==
Received: by 10.180.102.136 with SMTP id fo8mr5412680wib.19.1340192839286;
	Wed, 20 Jun 2012 04:47:19 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPS id hv7sm73168786wib.0.2012.06.20.04.47.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 04:47:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 12:47:14 +0100
Message-Id: <f12684b1c61cf98e52d4f5172e8c54b70e249b0a.1340192772.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1340192772.git.ross.burton@intel.com>
References: <cover.1340192772.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlW9RiRlkJf8ZYVVcw6QBLkShUqbkeSs7GeIILqAJ7YugCV2grbAi4a4MDlInwi1eGDkIdV
Subject: [PATCH 1/1] gitignore: ignore build*/ entirely
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
X-List-Received-Date: Wed, 20 Jun 2012 11:58:08 -0000

Previously parts of build*/ were ignored, but unless you committed the top-level
build/ in a branch this didn't achieve anything.  Change that to ignore all
top-level build* directories.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .gitignore |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/.gitignore b/.gitignore
index 688acec..bd0acdc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -2,11 +2,7 @@ bitbake
 *.pyc
 *.pyo
 /*.patch
-build*/conf/local.conf
-build*/conf/bblayers.conf
-build*/downloads
-build*/tmp/
-build*/sstate-cache
+build*/
 pyshtables.py
 pstage/
 scripts/oe-git-proxy-socks
-- 
1.7.10



