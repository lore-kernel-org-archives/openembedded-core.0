Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QjEeW-00079R-Ge
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:04:16 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6JI0AMi031373
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 13:00:10 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 11:00:10 -0700
Message-Id: <d5c52eaf4fc783d03c2cbdb7d3a52c7cf0604f3d.1311097889.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
In-Reply-To: <cover.1311097889.git.tom_rini@mentor.com>
References: <cover.1311097889.git.tom_rini@mentor.com>
Subject: [PATCH v3 3/4] autotools.bbclass: Add help2man-native to the main DEPENDS tree
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
X-List-Received-Date: Tue, 19 Jul 2011 18:04:16 -0000

With help2man no longer being required by sanity.bbclass we need to
make sure that if we are going to build autotools stuff that help2man
will be there as it's a frequent implicit dependency.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/classes/autotools.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 98c871a..ed5637e 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -5,9 +5,9 @@ def autotools_dep_prepend(d):
 	pn = bb.data.getVar('PN', d, 1)
 	deps = ''
 
-	if pn in ['autoconf-native', 'automake-native']:
+	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
 		return deps
-	deps += 'autoconf-native automake-native '
+	deps += 'autoconf-native automake-native help2man-native '
 
 	if not pn in ['libtool', 'libtool-native', 'libtool-cross']:
 		deps += 'libtool-native '
-- 
1.7.0.4



