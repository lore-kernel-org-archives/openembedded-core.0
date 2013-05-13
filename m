Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UboV6-0002nJ-Dj
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 10:53:20 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4D8YjJd006903
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 01:34:46 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 13 May 2013 01:34:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 May 2013 16:34:28 +0800
Message-ID: <cf5272fc40c7b7d0b780358756fd9323fd6fe0d1.1368414411.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1368414411.git.liezhi.yang@windriver.com>
References: <cover.1368414411.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cachedpath.py: global name 'error' is not defined
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 May 2013 08:53:36 -0000
Content-Type: text/plain

The error is not global since we don't use "from os import *", so it
should be os.error.

[YOCTO #4489]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/cachedpath.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/cachedpath.py b/meta/lib/oe/cachedpath.py
index c7860ef..0840cc4 100644
--- a/meta/lib/oe/cachedpath.py
+++ b/meta/lib/oe/cachedpath.py
@@ -122,10 +122,8 @@ class CachedPath(object):
         # minor reason when (say) a thousand readable directories are still
         # left to visit.  That logic is copied here.
         try:
-            # Note that listdir and error are globals in this module due
-            # to earlier import-*.
             names = os.listdir(top)
-        except error as err:
+        except os.error as err:
             if onerror is not None:
                 onerror(err)
             return
-- 
1.8.1.2



