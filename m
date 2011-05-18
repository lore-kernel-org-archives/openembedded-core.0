Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMpG7-0003uu-5g
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 00:30:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 May 2011 15:27:29 -0700
X-ExtLoop1: 1
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.160])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2011 15:27:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 15:26:58 -0700
Message-Id: <c7eae778f535e1ae40e3b2fad79575d2e6e5f47f.1305756950.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
References: <fc7402495a8a30b203d5535e73383bc4412e2a1f.1305756950.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305756950.git.sgw@linux.intel.com>
References: <cover.1305756950.git.sgw@linux.intel.com>
Subject: [PATCH 29/30] *pull-request: add copyright, license, and descriptions
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
X-List-Received-Date: Wed, 18 May 2011 22:30:30 -0000

From: Darren Hart <dvhart@linux.intel.com>

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/create-pull-request |   26 ++++++++++++++++++++++++++
 scripts/send-pull-request   |   25 +++++++++++++++++++++++++
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 634a289..b808146 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -1,4 +1,30 @@
 #!/bin/bash
+#
+# Copyright (c) 2010-2011,  Intel Corporation.
+# All Rights Reserved
+# 
+# This program is free software;  you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY;  without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+# the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program;  if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+
+#
+# This script is intended to be used to prepare a series of patches
+# and a cover letter in an appropriate and consistent format for
+# submission to Open Embedded and The Yocto Project, as well as to
+# related projects and layers.
+#
+
 ODIR=pull-$$
 RELATIVE_TO="master"
 COMMIT_ID="HEAD"
diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 8d0bd34..cee9253 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -1,4 +1,29 @@
 #!/bin/bash
+#
+# Copyright (c) 2010-2011,  Intel Corporation.
+# All Rights Reserved
+# 
+# This program is free software;  you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY;  without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
+# the GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program;  if not, write to the Free Software
+# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
+#
+
+#
+# This script is intended to be used to send a patch series prepared by the
+# create-pull-request script to Open Embedded and The Yocto Project, as well
+# as to related projects and layers.
+#
+
 AUTO=0
 AUTO_CL=0
 GITSOBCC=""
-- 
1.7.3.4



