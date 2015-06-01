Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 76E5D757A0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jun 2015 07:30:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t517U2kB018213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jun 2015 00:30:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 1 Jun 2015 00:30:02 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Jun 2015 15:23:53 +0800
Message-ID: <1433143433-528-2-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433143433-528-1-git-send-email-kai.kang@windriver.com>
References: <1433143433-528-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-tools: remove hdajacksensetest for framebuffer build
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
X-List-Received-Date: Mon, 01 Jun 2015 07:30:04 -0000
Content-Type: text/plain

Sub-component hdajacksensetest in alsa-tools requires library glib, so
remove it when do framebuffer build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
index c957609..a580741 100644
--- a/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
+++ b/meta/recipes-multimedia/alsa/alsa-tools/makefile_no_gtk.patch
@@ -23,7 +23,7 @@ index 2457a1c..72346d9 100644
 +SUBDIRS = as10k1 \
 +	  mixartloader pcxhrloader sb16_csp seq sscape_ctl \
 +	  us428control usx2yloader vxloader \
-+	  hwmixvolume hda-verb hdajacksensetest
++	  hwmixvolume hda-verb
  
  all:
  	@for i in $(SUBDIRS); do \
-- 
1.9.1


