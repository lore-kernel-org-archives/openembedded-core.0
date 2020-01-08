Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id D1B367FC36
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 03:45:07 +0000 (UTC)
IronPort-SDR: rYyaCdU67dnVY5RPKOpcWO/ud/B+ix2rnVdfYDQwntH+bDOHhQQ0f16vX9O+4YVoJhCuARTqU3
	CGRc7+BeyWTDGeMx18Fhh/mq3DtJQ9GxXEfy8+yL4D9wBOdNYKVYY592BKRjAaozUbucIzGO+P
	1PFl+i7y4JD6Jy50OwlA+Vd/LunueIbzS9lHqGVSqPAM/tKbtYg04r5+/zvWjsKopjn8ZGVkTa
	CvRvZlWqqLuUrzlZcnykDYKkwNAn/qRL36Owh7ixNcOO9v87WI8vG91z/1ToDRLivD8WeRO19Y
	kBY=
X-IronPort-AV: E=Sophos;i="5.69,408,1571695200"; 
   d="scan'208";a="4038282"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  8 Jan 2020 04:44:51 +0100
Message-Id: <20200108034455.10101-3-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200108034455.10101-1-pkj@axis.com>
References: <20200108034455.10101-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 3/7] oe-pkgdata-browser: Correct the prefix for kilo to "k"
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
X-List-Received-Date: Wed, 08 Jan 2020 03:45:08 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-pkgdata-browser | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index 21e319481e..36b5e798fa 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -35,7 +35,7 @@ def timeit(f):
 
 def human_size(nbytes):
     import math
-    suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB']
+    suffixes = ['B', 'kB', 'MB', 'GB', 'TB', 'PB']
     human = nbytes
     rank = 0
     if nbytes != 0:
-- 
2.21.1


