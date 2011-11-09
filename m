Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNyRJ-0003Ir-Iu
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 04:03:01 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 16FD72FD0F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 21:56:42 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 18:56:38 -0800
Message-Id: <615861a08eed8d23e3d8a8982e26ff2d0509b827.1320807056.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320807056.git.scott.a.garman@intel.com>
References: <cover.1320807056.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 16FD72FD0F.3790F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 3/4] useradd-example.bb: update example documentation comments
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
X-List-Received-Date: Wed, 09 Nov 2011 03:03:01 -0000

Clarify that only packages listed in USERADD_PACKAGES will
include the user/group creation code.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 02d56f6..b10c1d0 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -17,13 +17,12 @@ PACKAGES =+ "${PN}-user3"
 
 inherit useradd
 
-# Specify which package(s) should include the user/group code.
-# Make sure that any packages which install files owned by custom
-# users/groups are included here. The code which adds users and
-# groups is idempotent.
+# You must set USERADD_PACKAGES when you inherit useradd. This
+# lists which output packages will include the user/group
+# creation code.
 USERADD_PACKAGES = "${PN} ${PN}-user3"
 
-# You *must* set USERADD_PARAM and/or GROUPADD_PARAM when
+# You must also set USERADD_PARAM and/or GROUPADD_PARAM when
 # you inherit useradd.
 
 # USERADD_PARAM specifies command line options to pass to the
-- 
1.7.5.4



