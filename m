Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2C0D78937
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 19:02:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 11:02:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,446,1515484800"; d="scan'208";a="32651863"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Mar 2018 11:02:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 20:55:42 +0200
Message-Id: <20180309185614.31113-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
References: <20180309185614.31113-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/36] avahi: refresh patches
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
X-List-Received-Date: Fri, 09 Mar 2018 19:02:57 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../avahi/files/initscript.patch                   | 26 +++++++++++++---------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/files/initscript.patch b/meta/recipes-connectivity/avahi/files/initscript.patch
index 193889eb5c2..c856c3df046 100644
--- a/meta/recipes-connectivity/avahi/files/initscript.patch
+++ b/meta/recipes-connectivity/avahi/files/initscript.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Pending
 
-diff --git a/initscript/debian/avahi-daemon.in b/initscript/debian/avahi-daemon.in
-index 30a2c2f..b5848a8 100755
---- a/initscript/debian/avahi-daemon.in
-+++ b/initscript/debian/avahi-daemon.in
-@@ -1,2 +1,14 @@
+Index: avahi-0.7/initscript/debian/avahi-daemon.in
+===================================================================
+--- avahi-0.7.orig/initscript/debian/avahi-daemon.in
++++ avahi-0.7/initscript/debian/avahi-daemon.in
+@@ -1,5 +1,17 @@
  #!/bin/sh
 -
 +### BEGIN INIT INFO
@@ -20,11 +20,14 @@ index 30a2c2f..b5848a8 100755
 +#                    automatically
 +### END INIT INFO
 +#
-diff --git a/initscript/debian/avahi-dnsconfd.in b/initscript/debian/avahi-dnsconfd.in
-index ac34804..f95c340 100755
---- a/initscript/debian/avahi-dnsconfd.in
-+++ b/initscript/debian/avahi-dnsconfd.in
-@@ -1,1 +1,14 @@
+ # This file is part of avahi.
+ #
+ # avahi is free software; you can redistribute it and/or modify it
+Index: avahi-0.7/initscript/debian/avahi-dnsconfd.in
+===================================================================
+--- avahi-0.7.orig/initscript/debian/avahi-dnsconfd.in
++++ avahi-0.7/initscript/debian/avahi-dnsconfd.in
+@@ -1,4 +1,17 @@
  #!/bin/sh
 +### BEGIN INIT INFO
 +# Provides:          avahi-dnsconfd
@@ -39,3 +42,6 @@ index ac34804..f95c340 100755
 +#                    automatically
 +### END INIT INFO
 +#
+ 
+ # This file is part of avahi.
+ #
-- 
2.16.1


