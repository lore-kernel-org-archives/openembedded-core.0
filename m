Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0CB71985
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 08:33:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v658XXJu014131
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Jul 2017 01:33:33 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 01:33:32 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Jul 2017 04:33:29 -0400
Message-ID: <4fc70efa7bc22e8748fd58a1bf30edb63bcc33bc.1499243564.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1499243564.git.dengke.du@windriver.com>
References: <cover.1499243564.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] avahi-ui: reduce local pending patches
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
X-List-Received-Date: Wed, 05 Jul 2017 08:33:32 -0000
Content-Type: text/plain

[Yocto #11548]

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...01-configure.ac-install-GtkBuilder-interface-files-for-.patch | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
index 8ccef08..942607a 100644
--- a/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
+++ b/meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
@@ -1,17 +1,18 @@
-From a59f13fab31a6e25bb03b2c2bc3aea576f857b6c Mon Sep 17 00:00:00 2001
+From 6ff255eff4fea6350b5e0462fee176fadc26fc1c Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Sun, 12 Jun 2016 18:32:49 +0300
 Subject: [PATCH] configure.ac: install GtkBuilder interface files for GTK+3
  too
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/lathiat/avahi/pull/130]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index aebb716..48bdf63 100644
+index 87a9a17..9860dcc 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -965,7 +965,7 @@ AC_SUBST(avahi_socket)
@@ -24,5 +25,5 @@ index aebb716..48bdf63 100644
  	AC_SUBST(interfacesdir)
  fi
 -- 
-2.1.4
+2.8.1
 
-- 
2.8.1


