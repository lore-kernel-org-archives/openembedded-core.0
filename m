Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0fgV-0004dr-5G
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 21:54:39 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2012 21:46:13 +0100
Message-Id: <1330029973-15207-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] lib/oe/utils.py: use bb.utils.vercmp_string
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
X-List-Received-Date: Thu, 23 Feb 2012 20:54:39 -0000

Fixes the following warning:

| WARNING: .../meta/lib/oe/utils.py:31: DeprecationWarning: Call to deprecated function bb.vercmp_string: Please use bb.utils.vercmp_string instead.
|  result = bb.vercmp(d.getVar(variable,True), checkvalue)

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/lib/oe/utils.py |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 95daace..02d5442 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -28,7 +28,7 @@ def less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
         return falsevalue
 
 def version_less_or_equal(variable, checkvalue, truevalue, falsevalue, d):
-    result = bb.vercmp(d.getVar(variable,True), checkvalue)
+    result = bb.utils.vercmp_string(d.getVar(variable,True), checkvalue)
     if result <= 0:
         return truevalue
     else:
-- 
1.7.5.4



