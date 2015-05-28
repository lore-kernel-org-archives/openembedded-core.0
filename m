Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3E5E737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 May 2015 08:28:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t4S8Sqci023082
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 28 May 2015 01:28:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Thu, 28 May 2015 01:28:52 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <otavio@ossystems.com.br>
Date: Thu, 28 May 2015 16:23:04 +0800
Message-ID: <1432801384-9123-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-tools: update makefile_no_gtk.patch
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
X-List-Received-Date: Thu, 28 May 2015 08:28:54 -0000
Content-Type: text/plain

makefile_no_gtk.patch will be applied when no 'x11' in distro features.
It fails to apply after update to version 1.0.29. Fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index 2665726..c957609 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -5,21 +5,25 @@ Upstream-Status: Inappropriate [configuration]
 Signed-off-by: Rogerio Nunes <ronunes@gmail.com>
 Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
 
+Update patch for alsa-tools 1.0.29
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 diff --git a/Makefile b/Makefile
 index 2457a1c..72346d9 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,9 +1,9 @@
- VERSION = 1.0.27
+ VERSION = 1.0.29
  TOP = .
 -SUBDIRS = as10k1 envy24control \
 -	  mixartloader pcxhrloader rmedigicontrol sb16_csp seq sscape_ctl \
 -	  us428control usx2yloader vxloader echomixer \
--	  hwmixvolume hdajackretask hda-verb
+-	  hwmixvolume hdajackretask hda-verb hdajacksensetest
 +SUBDIRS = as10k1 \
 +	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
 +	  us428control usx2yloader vxloader \
-+	  hwmixvolume hda-verb
++	  hwmixvolume hda-verb hdajacksensetest
  
  all:
  	@for i in $(SUBDIRS); do \
-- 
1.9.1


