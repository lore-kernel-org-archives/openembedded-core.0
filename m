Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 2108F6FFED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 10:10:42 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u3LAAgYs008459; Thu, 21 Apr 2016 05:10:42 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016042105102252-162996 ;
	Thu, 21 Apr 2016 05:10:22 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 13:10:13 +0300
Message-Id: <3c04128428531bca5f8be24b442819185ad53c1a.1461233389.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <36d7622248270bd13e2701d7a8c8caf66c67a128.1461233389.git.adrian.ratiu@ni.com>
References: <36d7622248270bd13e2701d7a8c8caf66c67a128.1461233389.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 04/21/2016 05:10:22 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 04/21/2016 05:10:22 AM,
	Serialize complete at 04/21/2016 05:10:22 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-04-21_08:, , signatures=0
Subject: [PATCH v3 2/2] wic: isoimage-isohybrid: fix splash file paths
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
X-List-Received-Date: Thu, 21 Apr 2016 10:10:44 -0000

os.path.join discards the cr_workdir var contents if the path of the
second arguments is absolute.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index 8440581..ed59d85 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -60,7 +60,7 @@ class IsoImagePlugin(SourcePlugin):
         """
         Create loader-specific (syslinux) config
         """
-        splash = os.path.join(cr_workdir, "/ISO/boot/splash.jpg")
+        splash = os.path.join(cr_workdir, "ISO/boot/splash.jpg")
         if os.path.exists(splash):
             splashline = "menu background splash.jpg"
         else:
@@ -105,7 +105,7 @@ class IsoImagePlugin(SourcePlugin):
                 msger.error("configfile is specified but failed to "
                         "get it from %s." % configfile)
         else:
-            splash = os.path.join(cr_workdir, "/EFI/boot/splash.jpg")
+            splash = os.path.join(cr_workdir, "EFI/boot/splash.jpg")
             if os.path.exists(splash):
                 splashline = "menu background splash.jpg"
             else:
-- 
2.8.0


