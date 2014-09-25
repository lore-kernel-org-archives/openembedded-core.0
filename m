Return-Path: <net147@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 37A57714FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:55:54 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id z10so8297310pdj.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4PLAhRjZmLw9mJIC1FNfLRxGaBrJhGkme6bt4tjzYZI=;
	b=f4IWj+JH8IYgnuX3dt/hmWL09SzSj04s4W95BYKGqnW0czkjTSO5IuhsNBltsePUON
	8EYwMyQyNYIkrf0bR7p6wvmFhKAf+8+P0T9P1JVHKgqTGepz5S8yyqRIVJs9kRr37mBH
	G31JVb65WS+jnKIY3GD5gOxeKkXA5zb4AuX8rMkjQJPZFfHyWLRZCEAOjxEhsMNsmbIQ
	1o9rp4JjF26HRcVKImHuRPFv+n9RkkCSZTU6Vo7XEZWjkRRca2qgZ4vc7PEJvCKykE2M
	YPy+bnVqZdGTFh8MsgoH97yrCc80UnbK5Cr3dtqyKZKoUre9ahlG1fVZAjUENM6rZbYB
	izGw==
X-Received: by 10.68.95.227 with SMTP id dn3mr14169717pbb.108.1411610155790;
	Wed, 24 Sep 2014 18:55:55 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id nk11sm522048pdb.40.2014.09.24.18.55.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 18:55:55 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 12:07:30 +1000
Message-Id: <1411610850-12504-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] qt4: fix bug tracker URLs for patches
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
X-List-Received-Date: Thu, 25 Sep 2014 01:55:55 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch     | 2 +-
 meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch               | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
index 7d3b336..1d23c92 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0007-dbus-Remove-const-usage-that-causes-compile-failure-.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 07/21] dbus: Remove "const" usage that causes compile failure
 Patch has apparently been rejected upstream, not because it is invalid
 but because the submitter did not submit a merge request for it, so the
 validity of the patch upstream is uncertain. For further details see:
-http://bugreports.qt.nokia.com/browse/QTBUG-17962
+https://bugreports.qt-project.org/browse/QTBUG-17962
 
 Upstream-Status: Denied [possible retry]
 
diff --git a/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch b/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
index 8402eab..8e411f3 100644
--- a/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
+++ b/meta/recipes-qt/qt4/qt4-4.8.6/0012-Add-2bpp-support.patch
@@ -4,7 +4,7 @@ Date: Wed, 26 Sep 2012 20:39:21 +0200
 Subject: [PATCH 12/21] Add 2bpp support
 
 Submitted upstream but rejected as being "out of scope":
-http://bugreports.qt.nokia.com/browse/QTBUG-3468
+https://bugreports.qt-project.org/browse/QTBUG-3468
 
 Upstream-Status: Denied
 
-- 
2.1.0


