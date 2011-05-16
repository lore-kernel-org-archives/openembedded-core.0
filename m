Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hs-0005hg-Rx
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124323"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:15 -0700
Message-Id: <ed8646e257ad84b017e5295b892eeb44bcef0483.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Subject: [RFC PATCH v2 15/15] *pull-request: add copyright, license, and descriptions
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
X-List-Received-Date: Mon, 16 May 2011 22:29:17 -0000

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
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
1.7.1



